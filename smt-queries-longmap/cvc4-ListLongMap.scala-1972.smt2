; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34698 () Bool)

(assert start!34698)

(declare-fun b_free!7505 () Bool)

(declare-fun b_next!7505 () Bool)

(assert (=> start!34698 (= b_free!7505 (not b_next!7505))))

(declare-fun tp!26078 () Bool)

(declare-fun b_and!14725 () Bool)

(assert (=> start!34698 (= tp!26078 b_and!14725)))

(declare-fun b!346748 () Bool)

(declare-fun res!191828 () Bool)

(declare-fun e!212508 () Bool)

(assert (=> b!346748 (=> (not res!191828) (not e!212508))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10919 0))(
  ( (V!10920 (val!3773 Int)) )
))
(declare-fun zeroValue!1467 () V!10919)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3385 0))(
  ( (ValueCellFull!3385 (v!5955 V!10919)) (EmptyCell!3385) )
))
(declare-datatypes ((array!18507 0))(
  ( (array!18508 (arr!8764 (Array (_ BitVec 32) ValueCell!3385)) (size!9116 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18507)

(declare-datatypes ((array!18509 0))(
  ( (array!18510 (arr!8765 (Array (_ BitVec 32) (_ BitVec 64))) (size!9117 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18509)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10919)

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((tuple2!5460 0))(
  ( (tuple2!5461 (_1!2741 (_ BitVec 64)) (_2!2741 V!10919)) )
))
(declare-datatypes ((List!5082 0))(
  ( (Nil!5079) (Cons!5078 (h!5934 tuple2!5460) (t!10210 List!5082)) )
))
(declare-datatypes ((ListLongMap!4373 0))(
  ( (ListLongMap!4374 (toList!2202 List!5082)) )
))
(declare-fun contains!2266 (ListLongMap!4373 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1723 (array!18509 array!18507 (_ BitVec 32) (_ BitVec 32) V!10919 V!10919 (_ BitVec 32) Int) ListLongMap!4373)

(assert (=> b!346748 (= res!191828 (not (contains!2266 (getCurrentListMap!1723 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!346749 () Bool)

(declare-fun res!191832 () Bool)

(assert (=> b!346749 (=> (not res!191832) (not e!212508))))

(assert (=> b!346749 (= res!191832 (and (= (size!9116 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9117 _keys!1895) (size!9116 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!346750 () Bool)

(declare-fun res!191830 () Bool)

(assert (=> b!346750 (=> (not res!191830) (not e!212508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346750 (= res!191830 (validKeyInArray!0 k!1348))))

(declare-fun b!346751 () Bool)

(declare-fun res!191833 () Bool)

(declare-fun e!212506 () Bool)

(assert (=> b!346751 (=> (not res!191833) (not e!212506))))

(declare-datatypes ((SeekEntryResult!3381 0))(
  ( (MissingZero!3381 (index!15703 (_ BitVec 32))) (Found!3381 (index!15704 (_ BitVec 32))) (Intermediate!3381 (undefined!4193 Bool) (index!15705 (_ BitVec 32)) (x!34539 (_ BitVec 32))) (Undefined!3381) (MissingVacant!3381 (index!15706 (_ BitVec 32))) )
))
(declare-fun lt!163426 () SeekEntryResult!3381)

(declare-fun arrayContainsKey!0 (array!18509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346751 (= res!191833 (arrayContainsKey!0 _keys!1895 k!1348 (index!15704 lt!163426)))))

(declare-fun res!191831 () Bool)

(assert (=> start!34698 (=> (not res!191831) (not e!212508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34698 (= res!191831 (validMask!0 mask!2385))))

(assert (=> start!34698 e!212508))

(assert (=> start!34698 true))

(declare-fun tp_is_empty!7457 () Bool)

(assert (=> start!34698 tp_is_empty!7457))

(assert (=> start!34698 tp!26078))

(declare-fun e!212504 () Bool)

(declare-fun array_inv!6492 (array!18507) Bool)

(assert (=> start!34698 (and (array_inv!6492 _values!1525) e!212504)))

(declare-fun array_inv!6493 (array!18509) Bool)

(assert (=> start!34698 (array_inv!6493 _keys!1895)))

(declare-fun b!346752 () Bool)

(declare-fun res!191829 () Bool)

(assert (=> b!346752 (=> (not res!191829) (not e!212508))))

(declare-datatypes ((List!5083 0))(
  ( (Nil!5080) (Cons!5079 (h!5935 (_ BitVec 64)) (t!10211 List!5083)) )
))
(declare-fun arrayNoDuplicates!0 (array!18509 (_ BitVec 32) List!5083) Bool)

(assert (=> b!346752 (= res!191829 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5080))))

(declare-fun mapIsEmpty!12642 () Bool)

(declare-fun mapRes!12642 () Bool)

(assert (=> mapIsEmpty!12642 mapRes!12642))

(declare-fun b!346753 () Bool)

(declare-fun res!191827 () Bool)

(assert (=> b!346753 (=> (not res!191827) (not e!212508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18509 (_ BitVec 32)) Bool)

(assert (=> b!346753 (= res!191827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12642 () Bool)

(declare-fun tp!26079 () Bool)

(declare-fun e!212503 () Bool)

(assert (=> mapNonEmpty!12642 (= mapRes!12642 (and tp!26079 e!212503))))

(declare-fun mapRest!12642 () (Array (_ BitVec 32) ValueCell!3385))

(declare-fun mapValue!12642 () ValueCell!3385)

(declare-fun mapKey!12642 () (_ BitVec 32))

(assert (=> mapNonEmpty!12642 (= (arr!8764 _values!1525) (store mapRest!12642 mapKey!12642 mapValue!12642))))

(declare-fun b!346754 () Bool)

(assert (=> b!346754 (= e!212503 tp_is_empty!7457)))

(declare-fun b!346755 () Bool)

(assert (=> b!346755 (= e!212508 e!212506)))

(declare-fun res!191834 () Bool)

(assert (=> b!346755 (=> (not res!191834) (not e!212506))))

(assert (=> b!346755 (= res!191834 (and (is-Found!3381 lt!163426) (= (select (arr!8765 _keys!1895) (index!15704 lt!163426)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18509 (_ BitVec 32)) SeekEntryResult!3381)

(assert (=> b!346755 (= lt!163426 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!346756 () Bool)

(declare-fun e!212505 () Bool)

(assert (=> b!346756 (= e!212505 tp_is_empty!7457)))

(declare-fun b!346757 () Bool)

(assert (=> b!346757 (= e!212506 (not true))))

(assert (=> b!346757 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10763 0))(
  ( (Unit!10764) )
))
(declare-fun lt!163425 () Unit!10763)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18509 (_ BitVec 64) (_ BitVec 32)) Unit!10763)

(assert (=> b!346757 (= lt!163425 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!15704 lt!163426)))))

(declare-fun b!346758 () Bool)

(assert (=> b!346758 (= e!212504 (and e!212505 mapRes!12642))))

(declare-fun condMapEmpty!12642 () Bool)

(declare-fun mapDefault!12642 () ValueCell!3385)

