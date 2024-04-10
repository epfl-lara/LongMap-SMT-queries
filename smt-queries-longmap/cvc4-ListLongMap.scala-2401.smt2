; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38006 () Bool)

(assert start!38006)

(declare-fun b_free!8975 () Bool)

(declare-fun b_next!8975 () Bool)

(assert (=> start!38006 (= b_free!8975 (not b_next!8975))))

(declare-fun tp!31694 () Bool)

(declare-fun b_and!16289 () Bool)

(assert (=> start!38006 (= tp!31694 b_and!16289)))

(declare-fun b!391141 () Bool)

(declare-fun res!223884 () Bool)

(declare-fun e!236908 () Bool)

(assert (=> b!391141 (=> (not res!223884) (not e!236908))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23195 0))(
  ( (array!23196 (arr!11060 (Array (_ BitVec 32) (_ BitVec 64))) (size!11412 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23195)

(assert (=> b!391141 (= res!223884 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11412 _keys!658))))))

(declare-fun b!391142 () Bool)

(declare-fun res!223891 () Bool)

(declare-fun e!236912 () Bool)

(assert (=> b!391142 (=> (not res!223891) (not e!236912))))

(declare-fun lt!184479 () array!23195)

(declare-datatypes ((List!6411 0))(
  ( (Nil!6408) (Cons!6407 (h!7263 (_ BitVec 64)) (t!11573 List!6411)) )
))
(declare-fun arrayNoDuplicates!0 (array!23195 (_ BitVec 32) List!6411) Bool)

(assert (=> b!391142 (= res!223891 (arrayNoDuplicates!0 lt!184479 #b00000000000000000000000000000000 Nil!6408))))

(declare-fun b!391143 () Bool)

(declare-fun res!223883 () Bool)

(assert (=> b!391143 (=> (not res!223883) (not e!236908))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391143 (= res!223883 (validKeyInArray!0 k!778))))

(declare-fun res!223888 () Bool)

(assert (=> start!38006 (=> (not res!223888) (not e!236908))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38006 (= res!223888 (validMask!0 mask!970))))

(assert (=> start!38006 e!236908))

(declare-datatypes ((V!13967 0))(
  ( (V!13968 (val!4868 Int)) )
))
(declare-datatypes ((ValueCell!4480 0))(
  ( (ValueCellFull!4480 (v!7089 V!13967)) (EmptyCell!4480) )
))
(declare-datatypes ((array!23197 0))(
  ( (array!23198 (arr!11061 (Array (_ BitVec 32) ValueCell!4480)) (size!11413 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23197)

(declare-fun e!236910 () Bool)

(declare-fun array_inv!8124 (array!23197) Bool)

(assert (=> start!38006 (and (array_inv!8124 _values!506) e!236910)))

(assert (=> start!38006 tp!31694))

(assert (=> start!38006 true))

(declare-fun tp_is_empty!9647 () Bool)

(assert (=> start!38006 tp_is_empty!9647))

(declare-fun array_inv!8125 (array!23195) Bool)

(assert (=> start!38006 (array_inv!8125 _keys!658)))

(declare-fun b!391144 () Bool)

(declare-fun res!223886 () Bool)

(assert (=> b!391144 (=> (not res!223886) (not e!236908))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391144 (= res!223886 (and (= (size!11413 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11412 _keys!658) (size!11413 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391145 () Bool)

(declare-fun e!236909 () Bool)

(assert (=> b!391145 (= e!236909 tp_is_empty!9647)))

(declare-fun b!391146 () Bool)

(declare-fun e!236911 () Bool)

(assert (=> b!391146 (= e!236911 (not (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236907 () Bool)

(assert (=> b!391146 e!236907))

(declare-fun res!223890 () Bool)

(assert (=> b!391146 (=> (not res!223890) (not e!236907))))

(declare-datatypes ((tuple2!6556 0))(
  ( (tuple2!6557 (_1!3289 (_ BitVec 64)) (_2!3289 V!13967)) )
))
(declare-fun lt!184482 () tuple2!6556)

(declare-datatypes ((List!6412 0))(
  ( (Nil!6409) (Cons!6408 (h!7264 tuple2!6556) (t!11574 List!6412)) )
))
(declare-datatypes ((ListLongMap!5469 0))(
  ( (ListLongMap!5470 (toList!2750 List!6412)) )
))
(declare-fun lt!184485 () ListLongMap!5469)

(declare-fun lt!184481 () ListLongMap!5469)

(declare-fun +!1045 (ListLongMap!5469 tuple2!6556) ListLongMap!5469)

(assert (=> b!391146 (= res!223890 (= lt!184485 (+!1045 lt!184481 lt!184482)))))

(declare-fun zeroValue!472 () V!13967)

(assert (=> b!391146 (= lt!184482 (tuple2!6557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!16053 () Bool)

(declare-fun mapRes!16053 () Bool)

(declare-fun tp!31695 () Bool)

(declare-fun e!236913 () Bool)

(assert (=> mapNonEmpty!16053 (= mapRes!16053 (and tp!31695 e!236913))))

(declare-fun mapValue!16053 () ValueCell!4480)

(declare-fun mapRest!16053 () (Array (_ BitVec 32) ValueCell!4480))

(declare-fun mapKey!16053 () (_ BitVec 32))

(assert (=> mapNonEmpty!16053 (= (arr!11061 _values!506) (store mapRest!16053 mapKey!16053 mapValue!16053))))

(declare-fun b!391147 () Bool)

(assert (=> b!391147 (= e!236910 (and e!236909 mapRes!16053))))

(declare-fun condMapEmpty!16053 () Bool)

(declare-fun mapDefault!16053 () ValueCell!4480)

