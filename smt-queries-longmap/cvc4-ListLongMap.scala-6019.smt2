; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78002 () Bool)

(assert start!78002)

(declare-fun b_free!16529 () Bool)

(declare-fun b_next!16529 () Bool)

(assert (=> start!78002 (= b_free!16529 (not b_next!16529))))

(declare-fun tp!57858 () Bool)

(declare-fun b_and!27101 () Bool)

(assert (=> start!78002 (= tp!57858 b_and!27101)))

(declare-fun b!910569 () Bool)

(declare-fun e!510552 () Bool)

(assert (=> b!910569 (= e!510552 false)))

(declare-datatypes ((V!30227 0))(
  ( (V!30228 (val!9524 Int)) )
))
(declare-datatypes ((ValueCell!8992 0))(
  ( (ValueCellFull!8992 (v!12033 V!30227)) (EmptyCell!8992) )
))
(declare-datatypes ((array!53910 0))(
  ( (array!53911 (arr!25911 (Array (_ BitVec 32) ValueCell!8992)) (size!26370 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53910)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53912 0))(
  ( (array!53913 (arr!25912 (Array (_ BitVec 32) (_ BitVec 64))) (size!26371 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53912)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!410276 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30227)

(declare-fun zeroValue!1094 () V!30227)

(declare-datatypes ((tuple2!12412 0))(
  ( (tuple2!12413 (_1!6217 (_ BitVec 64)) (_2!6217 V!30227)) )
))
(declare-datatypes ((List!18202 0))(
  ( (Nil!18199) (Cons!18198 (h!19344 tuple2!12412) (t!25787 List!18202)) )
))
(declare-datatypes ((ListLongMap!11109 0))(
  ( (ListLongMap!11110 (toList!5570 List!18202)) )
))
(declare-fun contains!4614 (ListLongMap!11109 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2832 (array!53912 array!53910 (_ BitVec 32) (_ BitVec 32) V!30227 V!30227 (_ BitVec 32) Int) ListLongMap!11109)

(assert (=> b!910569 (= lt!410276 (contains!4614 (getCurrentListMap!2832 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k!1033))))

(declare-fun b!910570 () Bool)

(declare-fun res!614438 () Bool)

(assert (=> b!910570 (=> (not res!614438) (not e!510552))))

(declare-datatypes ((List!18203 0))(
  ( (Nil!18200) (Cons!18199 (h!19345 (_ BitVec 64)) (t!25788 List!18203)) )
))
(declare-fun arrayNoDuplicates!0 (array!53912 (_ BitVec 32) List!18203) Bool)

(assert (=> b!910570 (= res!614438 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18200))))

(declare-fun b!910571 () Bool)

(declare-fun res!614439 () Bool)

(assert (=> b!910571 (=> (not res!614439) (not e!510552))))

(assert (=> b!910571 (= res!614439 (and (= (size!26370 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26371 _keys!1386) (size!26370 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910572 () Bool)

(declare-fun res!614436 () Bool)

(assert (=> b!910572 (=> (not res!614436) (not e!510552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53912 (_ BitVec 32)) Bool)

(assert (=> b!910572 (= res!614436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30142 () Bool)

(declare-fun mapRes!30142 () Bool)

(declare-fun tp!57857 () Bool)

(declare-fun e!510555 () Bool)

(assert (=> mapNonEmpty!30142 (= mapRes!30142 (and tp!57857 e!510555))))

(declare-fun mapValue!30142 () ValueCell!8992)

(declare-fun mapKey!30142 () (_ BitVec 32))

(declare-fun mapRest!30142 () (Array (_ BitVec 32) ValueCell!8992))

(assert (=> mapNonEmpty!30142 (= (arr!25911 _values!1152) (store mapRest!30142 mapKey!30142 mapValue!30142))))

(declare-fun mapIsEmpty!30142 () Bool)

(assert (=> mapIsEmpty!30142 mapRes!30142))

(declare-fun b!910574 () Bool)

(declare-fun tp_is_empty!18947 () Bool)

(assert (=> b!910574 (= e!510555 tp_is_empty!18947)))

(declare-fun b!910575 () Bool)

(declare-fun e!510551 () Bool)

(assert (=> b!910575 (= e!510551 tp_is_empty!18947)))

(declare-fun b!910573 () Bool)

(declare-fun e!510553 () Bool)

(assert (=> b!910573 (= e!510553 (and e!510551 mapRes!30142))))

(declare-fun condMapEmpty!30142 () Bool)

(declare-fun mapDefault!30142 () ValueCell!8992)

