; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38040 () Bool)

(assert start!38040)

(declare-fun b_free!8987 () Bool)

(declare-fun b_next!8987 () Bool)

(assert (=> start!38040 (= b_free!8987 (not b_next!8987))))

(declare-fun tp!31734 () Bool)

(declare-fun b_and!16313 () Bool)

(assert (=> start!38040 (= tp!31734 b_and!16313)))

(declare-fun mapNonEmpty!16074 () Bool)

(declare-fun mapRes!16074 () Bool)

(declare-fun tp!31733 () Bool)

(declare-fun e!237183 () Bool)

(assert (=> mapNonEmpty!16074 (= mapRes!16074 (and tp!31733 e!237183))))

(declare-datatypes ((V!13983 0))(
  ( (V!13984 (val!4874 Int)) )
))
(declare-datatypes ((ValueCell!4486 0))(
  ( (ValueCellFull!4486 (v!7099 V!13983)) (EmptyCell!4486) )
))
(declare-datatypes ((array!23221 0))(
  ( (array!23222 (arr!11072 (Array (_ BitVec 32) ValueCell!4486)) (size!11424 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23221)

(declare-fun mapKey!16074 () (_ BitVec 32))

(declare-fun mapRest!16074 () (Array (_ BitVec 32) ValueCell!4486))

(declare-fun mapValue!16074 () ValueCell!4486)

(assert (=> mapNonEmpty!16074 (= (arr!11072 _values!506) (store mapRest!16074 mapKey!16074 mapValue!16074))))

(declare-fun b!391617 () Bool)

(declare-fun res!224189 () Bool)

(declare-fun e!237188 () Bool)

(assert (=> b!391617 (=> (not res!224189) (not e!237188))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!23223 0))(
  ( (array!23224 (arr!11073 (Array (_ BitVec 32) (_ BitVec 64))) (size!11425 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23223)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!391617 (= res!224189 (and (= (size!11424 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11425 _keys!658) (size!11424 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!224193 () Bool)

(assert (=> start!38040 (=> (not res!224193) (not e!237188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38040 (= res!224193 (validMask!0 mask!970))))

(assert (=> start!38040 e!237188))

(declare-fun e!237189 () Bool)

(declare-fun array_inv!8132 (array!23221) Bool)

(assert (=> start!38040 (and (array_inv!8132 _values!506) e!237189)))

(assert (=> start!38040 tp!31734))

(assert (=> start!38040 true))

(declare-fun tp_is_empty!9659 () Bool)

(assert (=> start!38040 tp_is_empty!9659))

(declare-fun array_inv!8133 (array!23223) Bool)

(assert (=> start!38040 (array_inv!8133 _keys!658)))

(declare-fun b!391618 () Bool)

(declare-fun res!224192 () Bool)

(assert (=> b!391618 (=> (not res!224192) (not e!237188))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391618 (= res!224192 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11425 _keys!658))))))

(declare-fun b!391619 () Bool)

(declare-fun e!237184 () Bool)

(assert (=> b!391619 (= e!237189 (and e!237184 mapRes!16074))))

(declare-fun condMapEmpty!16074 () Bool)

(declare-fun mapDefault!16074 () ValueCell!4486)

