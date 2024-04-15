; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77834 () Bool)

(assert start!77834)

(declare-fun b_free!16411 () Bool)

(declare-fun b_next!16411 () Bool)

(assert (=> start!77834 (= b_free!16411 (not b_next!16411))))

(declare-fun tp!57498 () Bool)

(declare-fun b_and!26953 () Bool)

(assert (=> start!77834 (= tp!57498 b_and!26953)))

(declare-fun b!908837 () Bool)

(declare-fun res!613494 () Bool)

(declare-fun e!509375 () Bool)

(assert (=> b!908837 (=> (not res!613494) (not e!509375))))

(declare-datatypes ((array!53671 0))(
  ( (array!53672 (arr!25794 (Array (_ BitVec 32) (_ BitVec 64))) (size!26255 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53671)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53671 (_ BitVec 32)) Bool)

(assert (=> b!908837 (= res!613494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908838 () Bool)

(declare-fun res!613493 () Bool)

(assert (=> b!908838 (=> (not res!613493) (not e!509375))))

(declare-datatypes ((List!18148 0))(
  ( (Nil!18145) (Cons!18144 (h!19290 (_ BitVec 64)) (t!25720 List!18148)) )
))
(declare-fun arrayNoDuplicates!0 (array!53671 (_ BitVec 32) List!18148) Bool)

(assert (=> b!908838 (= res!613493 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18145))))

(declare-fun b!908839 () Bool)

(declare-fun e!509377 () Bool)

(declare-fun e!509374 () Bool)

(declare-fun mapRes!29959 () Bool)

(assert (=> b!908839 (= e!509377 (and e!509374 mapRes!29959))))

(declare-fun condMapEmpty!29959 () Bool)

(declare-datatypes ((V!30071 0))(
  ( (V!30072 (val!9465 Int)) )
))
(declare-datatypes ((ValueCell!8933 0))(
  ( (ValueCellFull!8933 (v!11971 V!30071)) (EmptyCell!8933) )
))
(declare-datatypes ((array!53673 0))(
  ( (array!53674 (arr!25795 (Array (_ BitVec 32) ValueCell!8933)) (size!26256 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53673)

(declare-fun mapDefault!29959 () ValueCell!8933)

(assert (=> b!908839 (= condMapEmpty!29959 (= (arr!25795 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8933)) mapDefault!29959)))))

(declare-fun b!908840 () Bool)

(declare-fun tp_is_empty!18829 () Bool)

(assert (=> b!908840 (= e!509374 tp_is_empty!18829)))

(declare-fun res!613495 () Bool)

(assert (=> start!77834 (=> (not res!613495) (not e!509375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77834 (= res!613495 (validMask!0 mask!1756))))

(assert (=> start!77834 e!509375))

(declare-fun array_inv!20230 (array!53673) Bool)

(assert (=> start!77834 (and (array_inv!20230 _values!1152) e!509377)))

(assert (=> start!77834 tp!57498))

(assert (=> start!77834 true))

(assert (=> start!77834 tp_is_empty!18829))

(declare-fun array_inv!20231 (array!53671) Bool)

(assert (=> start!77834 (array_inv!20231 _keys!1386)))

(declare-fun mapIsEmpty!29959 () Bool)

(assert (=> mapIsEmpty!29959 mapRes!29959))

(declare-fun b!908841 () Bool)

(assert (=> b!908841 (= e!509375 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30071)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30071)

(declare-fun lt!409707 () Bool)

(declare-datatypes ((tuple2!12368 0))(
  ( (tuple2!12369 (_1!6195 (_ BitVec 64)) (_2!6195 V!30071)) )
))
(declare-datatypes ((List!18149 0))(
  ( (Nil!18146) (Cons!18145 (h!19291 tuple2!12368) (t!25721 List!18149)) )
))
(declare-datatypes ((ListLongMap!11055 0))(
  ( (ListLongMap!11056 (toList!5543 List!18149)) )
))
(declare-fun contains!4542 (ListLongMap!11055 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2745 (array!53671 array!53673 (_ BitVec 32) (_ BitVec 32) V!30071 V!30071 (_ BitVec 32) Int) ListLongMap!11055)

(assert (=> b!908841 (= lt!409707 (contains!4542 (getCurrentListMap!2745 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!29959 () Bool)

(declare-fun tp!57499 () Bool)

(declare-fun e!509376 () Bool)

(assert (=> mapNonEmpty!29959 (= mapRes!29959 (and tp!57499 e!509376))))

(declare-fun mapRest!29959 () (Array (_ BitVec 32) ValueCell!8933))

(declare-fun mapKey!29959 () (_ BitVec 32))

(declare-fun mapValue!29959 () ValueCell!8933)

(assert (=> mapNonEmpty!29959 (= (arr!25795 _values!1152) (store mapRest!29959 mapKey!29959 mapValue!29959))))

(declare-fun b!908842 () Bool)

(declare-fun res!613492 () Bool)

(assert (=> b!908842 (=> (not res!613492) (not e!509375))))

(assert (=> b!908842 (= res!613492 (and (= (size!26256 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26255 _keys!1386) (size!26256 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908843 () Bool)

(assert (=> b!908843 (= e!509376 tp_is_empty!18829)))

(assert (= (and start!77834 res!613495) b!908842))

(assert (= (and b!908842 res!613492) b!908837))

(assert (= (and b!908837 res!613494) b!908838))

(assert (= (and b!908838 res!613493) b!908841))

(assert (= (and b!908839 condMapEmpty!29959) mapIsEmpty!29959))

(assert (= (and b!908839 (not condMapEmpty!29959)) mapNonEmpty!29959))

(get-info :version)

(assert (= (and mapNonEmpty!29959 ((_ is ValueCellFull!8933) mapValue!29959)) b!908843))

(assert (= (and b!908839 ((_ is ValueCellFull!8933) mapDefault!29959)) b!908840))

(assert (= start!77834 b!908839))

(declare-fun m!843651 () Bool)

(assert (=> b!908837 m!843651))

(declare-fun m!843653 () Bool)

(assert (=> mapNonEmpty!29959 m!843653))

(declare-fun m!843655 () Bool)

(assert (=> start!77834 m!843655))

(declare-fun m!843657 () Bool)

(assert (=> start!77834 m!843657))

(declare-fun m!843659 () Bool)

(assert (=> start!77834 m!843659))

(declare-fun m!843661 () Bool)

(assert (=> b!908838 m!843661))

(declare-fun m!843663 () Bool)

(assert (=> b!908841 m!843663))

(assert (=> b!908841 m!843663))

(declare-fun m!843665 () Bool)

(assert (=> b!908841 m!843665))

(check-sat b_and!26953 (not b!908838) tp_is_empty!18829 (not b_next!16411) (not mapNonEmpty!29959) (not b!908841) (not start!77834) (not b!908837))
(check-sat b_and!26953 (not b_next!16411))
