; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71024 () Bool)

(assert start!71024)

(declare-fun b_free!13227 () Bool)

(declare-fun b_next!13227 () Bool)

(assert (=> start!71024 (= b_free!13227 (not b_next!13227))))

(declare-fun tp!46435 () Bool)

(declare-fun b_and!22131 () Bool)

(assert (=> start!71024 (= tp!46435 b_and!22131)))

(declare-fun b!824764 () Bool)

(declare-fun res!562285 () Bool)

(declare-fun e!458928 () Bool)

(assert (=> b!824764 (=> (not res!562285) (not e!458928))))

(declare-datatypes ((array!46062 0))(
  ( (array!46063 (arr!22078 (Array (_ BitVec 32) (_ BitVec 64))) (size!22499 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46062)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46062 (_ BitVec 32)) Bool)

(assert (=> b!824764 (= res!562285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824765 () Bool)

(declare-fun e!458929 () Bool)

(assert (=> b!824765 (= e!458928 (not e!458929))))

(declare-fun res!562287 () Bool)

(assert (=> b!824765 (=> res!562287 e!458929)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824765 (= res!562287 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24917 0))(
  ( (V!24918 (val!7516 Int)) )
))
(declare-datatypes ((tuple2!9950 0))(
  ( (tuple2!9951 (_1!4986 (_ BitVec 64)) (_2!4986 V!24917)) )
))
(declare-datatypes ((List!15757 0))(
  ( (Nil!15754) (Cons!15753 (h!16882 tuple2!9950) (t!22100 List!15757)) )
))
(declare-datatypes ((ListLongMap!8773 0))(
  ( (ListLongMap!8774 (toList!4402 List!15757)) )
))
(declare-fun lt!371990 () ListLongMap!8773)

(declare-fun lt!371989 () ListLongMap!8773)

(assert (=> b!824765 (= lt!371990 lt!371989)))

(declare-fun zeroValueBefore!34 () V!24917)

(declare-fun zeroValueAfter!34 () V!24917)

(declare-fun minValue!754 () V!24917)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!7053 0))(
  ( (ValueCellFull!7053 (v!9949 V!24917)) (EmptyCell!7053) )
))
(declare-datatypes ((array!46064 0))(
  ( (array!46065 (arr!22079 (Array (_ BitVec 32) ValueCell!7053)) (size!22500 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46064)

(declare-datatypes ((Unit!28268 0))(
  ( (Unit!28269) )
))
(declare-fun lt!371988 () Unit!28268)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!525 (array!46062 array!46064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24917 V!24917 V!24917 V!24917 (_ BitVec 32) Int) Unit!28268)

(assert (=> b!824765 (= lt!371988 (lemmaNoChangeToArrayThenSameMapNoExtras!525 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2415 (array!46062 array!46064 (_ BitVec 32) (_ BitVec 32) V!24917 V!24917 (_ BitVec 32) Int) ListLongMap!8773)

(assert (=> b!824765 (= lt!371989 (getCurrentListMapNoExtraKeys!2415 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824765 (= lt!371990 (getCurrentListMapNoExtraKeys!2415 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824766 () Bool)

(declare-fun res!562286 () Bool)

(assert (=> b!824766 (=> (not res!562286) (not e!458928))))

(assert (=> b!824766 (= res!562286 (and (= (size!22500 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22499 _keys!976) (size!22500 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824767 () Bool)

(declare-fun e!458932 () Bool)

(declare-fun e!458933 () Bool)

(declare-fun mapRes!24025 () Bool)

(assert (=> b!824767 (= e!458932 (and e!458933 mapRes!24025))))

(declare-fun condMapEmpty!24025 () Bool)

(declare-fun mapDefault!24025 () ValueCell!7053)

(assert (=> b!824767 (= condMapEmpty!24025 (= (arr!22079 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7053)) mapDefault!24025)))))

(declare-fun mapNonEmpty!24025 () Bool)

(declare-fun tp!46434 () Bool)

(declare-fun e!458930 () Bool)

(assert (=> mapNonEmpty!24025 (= mapRes!24025 (and tp!46434 e!458930))))

(declare-fun mapKey!24025 () (_ BitVec 32))

(declare-fun mapValue!24025 () ValueCell!7053)

(declare-fun mapRest!24025 () (Array (_ BitVec 32) ValueCell!7053))

(assert (=> mapNonEmpty!24025 (= (arr!22079 _values!788) (store mapRest!24025 mapKey!24025 mapValue!24025))))

(declare-fun b!824768 () Bool)

(declare-fun tp_is_empty!14937 () Bool)

(assert (=> b!824768 (= e!458930 tp_is_empty!14937)))

(declare-fun b!824769 () Bool)

(assert (=> b!824769 (= e!458929 true)))

(declare-fun lt!371987 () ListLongMap!8773)

(declare-fun getCurrentListMap!2540 (array!46062 array!46064 (_ BitVec 32) (_ BitVec 32) V!24917 V!24917 (_ BitVec 32) Int) ListLongMap!8773)

(assert (=> b!824769 (= lt!371987 (getCurrentListMap!2540 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824770 () Bool)

(declare-fun res!562283 () Bool)

(assert (=> b!824770 (=> (not res!562283) (not e!458928))))

(declare-datatypes ((List!15758 0))(
  ( (Nil!15755) (Cons!15754 (h!16883 (_ BitVec 64)) (t!22101 List!15758)) )
))
(declare-fun arrayNoDuplicates!0 (array!46062 (_ BitVec 32) List!15758) Bool)

(assert (=> b!824770 (= res!562283 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15755))))

(declare-fun mapIsEmpty!24025 () Bool)

(assert (=> mapIsEmpty!24025 mapRes!24025))

(declare-fun res!562284 () Bool)

(assert (=> start!71024 (=> (not res!562284) (not e!458928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71024 (= res!562284 (validMask!0 mask!1312))))

(assert (=> start!71024 e!458928))

(assert (=> start!71024 tp_is_empty!14937))

(declare-fun array_inv!17613 (array!46062) Bool)

(assert (=> start!71024 (array_inv!17613 _keys!976)))

(assert (=> start!71024 true))

(declare-fun array_inv!17614 (array!46064) Bool)

(assert (=> start!71024 (and (array_inv!17614 _values!788) e!458932)))

(assert (=> start!71024 tp!46435))

(declare-fun b!824771 () Bool)

(assert (=> b!824771 (= e!458933 tp_is_empty!14937)))

(assert (= (and start!71024 res!562284) b!824766))

(assert (= (and b!824766 res!562286) b!824764))

(assert (= (and b!824764 res!562285) b!824770))

(assert (= (and b!824770 res!562283) b!824765))

(assert (= (and b!824765 (not res!562287)) b!824769))

(assert (= (and b!824767 condMapEmpty!24025) mapIsEmpty!24025))

(assert (= (and b!824767 (not condMapEmpty!24025)) mapNonEmpty!24025))

(get-info :version)

(assert (= (and mapNonEmpty!24025 ((_ is ValueCellFull!7053) mapValue!24025)) b!824768))

(assert (= (and b!824767 ((_ is ValueCellFull!7053) mapDefault!24025)) b!824771))

(assert (= start!71024 b!824767))

(declare-fun m!766797 () Bool)

(assert (=> b!824764 m!766797))

(declare-fun m!766799 () Bool)

(assert (=> b!824765 m!766799))

(declare-fun m!766801 () Bool)

(assert (=> b!824765 m!766801))

(declare-fun m!766803 () Bool)

(assert (=> b!824765 m!766803))

(declare-fun m!766805 () Bool)

(assert (=> b!824770 m!766805))

(declare-fun m!766807 () Bool)

(assert (=> start!71024 m!766807))

(declare-fun m!766809 () Bool)

(assert (=> start!71024 m!766809))

(declare-fun m!766811 () Bool)

(assert (=> start!71024 m!766811))

(declare-fun m!766813 () Bool)

(assert (=> b!824769 m!766813))

(declare-fun m!766815 () Bool)

(assert (=> mapNonEmpty!24025 m!766815))

(check-sat (not mapNonEmpty!24025) (not start!71024) (not b_next!13227) b_and!22131 (not b!824764) (not b!824769) tp_is_empty!14937 (not b!824770) (not b!824765))
(check-sat b_and!22131 (not b_next!13227))
