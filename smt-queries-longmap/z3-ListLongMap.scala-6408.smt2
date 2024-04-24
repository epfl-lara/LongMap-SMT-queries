; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82412 () Bool)

(assert start!82412)

(declare-fun b_free!18517 () Bool)

(declare-fun b_next!18517 () Bool)

(assert (=> start!82412 (= b_free!18517 (not b_next!18517))))

(declare-fun tp!64513 () Bool)

(declare-fun b_and!30015 () Bool)

(assert (=> start!82412 (= tp!64513 b_and!30015)))

(declare-fun b!959561 () Bool)

(declare-fun res!642040 () Bool)

(declare-fun e!541030 () Bool)

(assert (=> b!959561 (=> (not res!642040) (not e!541030))))

(declare-datatypes ((array!58576 0))(
  ( (array!58577 (arr!28157 (Array (_ BitVec 32) (_ BitVec 64))) (size!28637 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58576)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959561 (= res!642040 (validKeyInArray!0 (select (arr!28157 _keys!1668) i!793)))))

(declare-fun b!959562 () Bool)

(declare-fun e!541032 () Bool)

(declare-fun tp_is_empty!21223 () Bool)

(assert (=> b!959562 (= e!541032 tp_is_empty!21223)))

(declare-fun mapIsEmpty!33814 () Bool)

(declare-fun mapRes!33814 () Bool)

(assert (=> mapIsEmpty!33814 mapRes!33814))

(declare-fun b!959563 () Bool)

(declare-fun res!642036 () Bool)

(assert (=> b!959563 (=> (not res!642036) (not e!541030))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!959563 (= res!642036 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28637 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28637 _keys!1668))))))

(declare-fun b!959564 () Bool)

(declare-fun e!541029 () Bool)

(declare-fun e!541028 () Bool)

(assert (=> b!959564 (= e!541029 (and e!541028 mapRes!33814))))

(declare-fun condMapEmpty!33814 () Bool)

(declare-datatypes ((V!33281 0))(
  ( (V!33282 (val!10662 Int)) )
))
(declare-datatypes ((ValueCell!10130 0))(
  ( (ValueCellFull!10130 (v!13216 V!33281)) (EmptyCell!10130) )
))
(declare-datatypes ((array!58578 0))(
  ( (array!58579 (arr!28158 (Array (_ BitVec 32) ValueCell!10130)) (size!28638 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58578)

(declare-fun mapDefault!33814 () ValueCell!10130)

(assert (=> b!959564 (= condMapEmpty!33814 (= (arr!28158 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10130)) mapDefault!33814)))))

(declare-fun res!642039 () Bool)

(assert (=> start!82412 (=> (not res!642039) (not e!541030))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82412 (= res!642039 (validMask!0 mask!2088))))

(assert (=> start!82412 e!541030))

(assert (=> start!82412 true))

(assert (=> start!82412 tp_is_empty!21223))

(declare-fun array_inv!21911 (array!58576) Bool)

(assert (=> start!82412 (array_inv!21911 _keys!1668)))

(declare-fun array_inv!21912 (array!58578) Bool)

(assert (=> start!82412 (and (array_inv!21912 _values!1386) e!541029)))

(assert (=> start!82412 tp!64513))

(declare-fun b!959565 () Bool)

(assert (=> b!959565 (= e!541028 tp_is_empty!21223)))

(declare-fun b!959566 () Bool)

(declare-fun res!642035 () Bool)

(assert (=> b!959566 (=> (not res!642035) (not e!541030))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!959566 (= res!642035 (and (= (size!28638 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28637 _keys!1668) (size!28638 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959567 () Bool)

(declare-fun res!642037 () Bool)

(assert (=> b!959567 (=> (not res!642037) (not e!541030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58576 (_ BitVec 32)) Bool)

(assert (=> b!959567 (= res!642037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!33814 () Bool)

(declare-fun tp!64512 () Bool)

(assert (=> mapNonEmpty!33814 (= mapRes!33814 (and tp!64512 e!541032))))

(declare-fun mapKey!33814 () (_ BitVec 32))

(declare-fun mapRest!33814 () (Array (_ BitVec 32) ValueCell!10130))

(declare-fun mapValue!33814 () ValueCell!10130)

(assert (=> mapNonEmpty!33814 (= (arr!28158 _values!1386) (store mapRest!33814 mapKey!33814 mapValue!33814))))

(declare-fun b!959568 () Bool)

(declare-fun res!642038 () Bool)

(assert (=> b!959568 (=> (not res!642038) (not e!541030))))

(declare-datatypes ((List!19562 0))(
  ( (Nil!19559) (Cons!19558 (h!20726 (_ BitVec 64)) (t!27917 List!19562)) )
))
(declare-fun arrayNoDuplicates!0 (array!58576 (_ BitVec 32) List!19562) Bool)

(assert (=> b!959568 (= res!642038 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19559))))

(declare-fun b!959569 () Bool)

(assert (=> b!959569 (= e!541030 false)))

(declare-fun minValue!1328 () V!33281)

(declare-fun zeroValue!1328 () V!33281)

(declare-fun defaultEntry!1389 () Int)

(declare-fun lt!430828 () Bool)

(declare-datatypes ((tuple2!13730 0))(
  ( (tuple2!13731 (_1!6876 (_ BitVec 64)) (_2!6876 V!33281)) )
))
(declare-datatypes ((List!19563 0))(
  ( (Nil!19560) (Cons!19559 (h!20727 tuple2!13730) (t!27918 List!19563)) )
))
(declare-datatypes ((ListLongMap!12429 0))(
  ( (ListLongMap!12430 (toList!6230 List!19563)) )
))
(declare-fun contains!5344 (ListLongMap!12429 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3463 (array!58576 array!58578 (_ BitVec 32) (_ BitVec 32) V!33281 V!33281 (_ BitVec 32) Int) ListLongMap!12429)

(assert (=> b!959569 (= lt!430828 (contains!5344 (getCurrentListMap!3463 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28157 _keys!1668) i!793)))))

(assert (= (and start!82412 res!642039) b!959566))

(assert (= (and b!959566 res!642035) b!959567))

(assert (= (and b!959567 res!642037) b!959568))

(assert (= (and b!959568 res!642038) b!959563))

(assert (= (and b!959563 res!642036) b!959561))

(assert (= (and b!959561 res!642040) b!959569))

(assert (= (and b!959564 condMapEmpty!33814) mapIsEmpty!33814))

(assert (= (and b!959564 (not condMapEmpty!33814)) mapNonEmpty!33814))

(get-info :version)

(assert (= (and mapNonEmpty!33814 ((_ is ValueCellFull!10130) mapValue!33814)) b!959562))

(assert (= (and b!959564 ((_ is ValueCellFull!10130) mapDefault!33814)) b!959565))

(assert (= start!82412 b!959564))

(declare-fun m!890571 () Bool)

(assert (=> mapNonEmpty!33814 m!890571))

(declare-fun m!890573 () Bool)

(assert (=> b!959567 m!890573))

(declare-fun m!890575 () Bool)

(assert (=> b!959561 m!890575))

(assert (=> b!959561 m!890575))

(declare-fun m!890577 () Bool)

(assert (=> b!959561 m!890577))

(declare-fun m!890579 () Bool)

(assert (=> start!82412 m!890579))

(declare-fun m!890581 () Bool)

(assert (=> start!82412 m!890581))

(declare-fun m!890583 () Bool)

(assert (=> start!82412 m!890583))

(declare-fun m!890585 () Bool)

(assert (=> b!959568 m!890585))

(declare-fun m!890587 () Bool)

(assert (=> b!959569 m!890587))

(assert (=> b!959569 m!890575))

(assert (=> b!959569 m!890587))

(assert (=> b!959569 m!890575))

(declare-fun m!890589 () Bool)

(assert (=> b!959569 m!890589))

(check-sat (not mapNonEmpty!33814) (not start!82412) (not b!959567) tp_is_empty!21223 b_and!30015 (not b!959569) (not b!959568) (not b_next!18517) (not b!959561))
(check-sat b_and!30015 (not b_next!18517))
