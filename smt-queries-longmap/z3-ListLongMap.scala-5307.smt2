; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71228 () Bool)

(assert start!71228)

(declare-fun b_free!13249 () Bool)

(declare-fun b_next!13249 () Bool)

(assert (=> start!71228 (= b_free!13249 (not b_next!13249))))

(declare-fun tp!46503 () Bool)

(declare-fun b_and!22173 () Bool)

(assert (=> start!71228 (= tp!46503 b_and!22173)))

(declare-fun res!562880 () Bool)

(declare-fun e!459827 () Bool)

(assert (=> start!71228 (=> (not res!562880) (not e!459827))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71228 (= res!562880 (validMask!0 mask!1312))))

(assert (=> start!71228 e!459827))

(declare-fun tp_is_empty!14959 () Bool)

(assert (=> start!71228 tp_is_empty!14959))

(declare-datatypes ((array!46105 0))(
  ( (array!46106 (arr!22094 (Array (_ BitVec 32) (_ BitVec 64))) (size!22514 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46105)

(declare-fun array_inv!17659 (array!46105) Bool)

(assert (=> start!71228 (array_inv!17659 _keys!976)))

(assert (=> start!71228 true))

(declare-datatypes ((V!24947 0))(
  ( (V!24948 (val!7527 Int)) )
))
(declare-datatypes ((ValueCell!7064 0))(
  ( (ValueCellFull!7064 (v!9960 V!24947)) (EmptyCell!7064) )
))
(declare-datatypes ((array!46107 0))(
  ( (array!46108 (arr!22095 (Array (_ BitVec 32) ValueCell!7064)) (size!22515 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46107)

(declare-fun e!459821 () Bool)

(declare-fun array_inv!17660 (array!46107) Bool)

(assert (=> start!71228 (and (array_inv!17660 _values!788) e!459821)))

(assert (=> start!71228 tp!46503))

(declare-fun b!826092 () Bool)

(declare-fun e!459823 () Bool)

(declare-fun mapRes!24061 () Bool)

(assert (=> b!826092 (= e!459821 (and e!459823 mapRes!24061))))

(declare-fun condMapEmpty!24061 () Bool)

(declare-fun mapDefault!24061 () ValueCell!7064)

(assert (=> b!826092 (= condMapEmpty!24061 (= (arr!22095 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7064)) mapDefault!24061)))))

(declare-fun b!826093 () Bool)

(declare-fun res!562877 () Bool)

(assert (=> b!826093 (=> (not res!562877) (not e!459827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46105 (_ BitVec 32)) Bool)

(assert (=> b!826093 (= res!562877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826094 () Bool)

(assert (=> b!826094 (= e!459823 tp_is_empty!14959)))

(declare-fun e!459826 () Bool)

(declare-fun b!826095 () Bool)

(declare-datatypes ((tuple2!9884 0))(
  ( (tuple2!9885 (_1!4953 (_ BitVec 64)) (_2!4953 V!24947)) )
))
(declare-datatypes ((List!15669 0))(
  ( (Nil!15666) (Cons!15665 (h!16800 tuple2!9884) (t!22006 List!15669)) )
))
(declare-datatypes ((ListLongMap!8709 0))(
  ( (ListLongMap!8710 (toList!4370 List!15669)) )
))
(declare-fun lt!372694 () ListLongMap!8709)

(declare-fun lt!372702 () tuple2!9884)

(declare-fun lt!372699 () tuple2!9884)

(declare-fun lt!372691 () ListLongMap!8709)

(declare-fun +!1917 (ListLongMap!8709 tuple2!9884) ListLongMap!8709)

(assert (=> b!826095 (= e!459826 (= lt!372694 (+!1917 (+!1917 lt!372691 lt!372699) lt!372702)))))

(declare-fun b!826096 () Bool)

(declare-fun e!459824 () Bool)

(assert (=> b!826096 (= e!459824 true)))

(declare-fun lt!372698 () ListLongMap!8709)

(declare-fun lt!372700 () ListLongMap!8709)

(assert (=> b!826096 (= lt!372698 (+!1917 (+!1917 lt!372700 lt!372702) lt!372699))))

(declare-fun lt!372693 () ListLongMap!8709)

(declare-fun lt!372696 () ListLongMap!8709)

(assert (=> b!826096 (and (= lt!372693 lt!372696) (= lt!372694 lt!372696) (= lt!372694 lt!372693))))

(declare-fun lt!372695 () ListLongMap!8709)

(assert (=> b!826096 (= lt!372696 (+!1917 lt!372695 lt!372702))))

(declare-fun lt!372689 () ListLongMap!8709)

(assert (=> b!826096 (= lt!372693 (+!1917 lt!372689 lt!372702))))

(declare-datatypes ((Unit!28292 0))(
  ( (Unit!28293) )
))
(declare-fun lt!372692 () Unit!28292)

(declare-fun zeroValueBefore!34 () V!24947)

(declare-fun zeroValueAfter!34 () V!24947)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!205 (ListLongMap!8709 (_ BitVec 64) V!24947 V!24947) Unit!28292)

(assert (=> b!826096 (= lt!372692 (addSameAsAddTwiceSameKeyDiffValues!205 lt!372689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826096 e!459826))

(declare-fun res!562874 () Bool)

(assert (=> b!826096 (=> (not res!562874) (not e!459826))))

(declare-fun lt!372701 () ListLongMap!8709)

(assert (=> b!826096 (= res!562874 (= lt!372701 lt!372695))))

(declare-fun lt!372697 () tuple2!9884)

(assert (=> b!826096 (= lt!372695 (+!1917 lt!372689 lt!372697))))

(assert (=> b!826096 (= lt!372689 (+!1917 lt!372700 lt!372699))))

(assert (=> b!826096 (= lt!372702 (tuple2!9885 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459825 () Bool)

(assert (=> b!826096 e!459825))

(declare-fun res!562878 () Bool)

(assert (=> b!826096 (=> (not res!562878) (not e!459825))))

(assert (=> b!826096 (= res!562878 (= lt!372701 (+!1917 (+!1917 lt!372700 lt!372697) lt!372699)))))

(declare-fun minValue!754 () V!24947)

(assert (=> b!826096 (= lt!372699 (tuple2!9885 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826096 (= lt!372697 (tuple2!9885 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2496 (array!46105 array!46107 (_ BitVec 32) (_ BitVec 32) V!24947 V!24947 (_ BitVec 32) Int) ListLongMap!8709)

(assert (=> b!826096 (= lt!372694 (getCurrentListMap!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826096 (= lt!372701 (getCurrentListMap!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826097 () Bool)

(declare-fun e!459820 () Bool)

(assert (=> b!826097 (= e!459820 tp_is_empty!14959)))

(declare-fun b!826098 () Bool)

(declare-fun res!562879 () Bool)

(assert (=> b!826098 (=> (not res!562879) (not e!459827))))

(assert (=> b!826098 (= res!562879 (and (= (size!22515 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22514 _keys!976) (size!22515 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826099 () Bool)

(assert (=> b!826099 (= e!459825 (= lt!372694 (+!1917 (+!1917 lt!372691 (tuple2!9885 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372699)))))

(declare-fun b!826100 () Bool)

(assert (=> b!826100 (= e!459827 (not e!459824))))

(declare-fun res!562876 () Bool)

(assert (=> b!826100 (=> res!562876 e!459824)))

(assert (=> b!826100 (= res!562876 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826100 (= lt!372700 lt!372691)))

(declare-fun lt!372690 () Unit!28292)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!540 (array!46105 array!46107 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24947 V!24947 V!24947 V!24947 (_ BitVec 32) Int) Unit!28292)

(assert (=> b!826100 (= lt!372690 (lemmaNoChangeToArrayThenSameMapNoExtras!540 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2452 (array!46105 array!46107 (_ BitVec 32) (_ BitVec 32) V!24947 V!24947 (_ BitVec 32) Int) ListLongMap!8709)

(assert (=> b!826100 (= lt!372691 (getCurrentListMapNoExtraKeys!2452 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826100 (= lt!372700 (getCurrentListMapNoExtraKeys!2452 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24061 () Bool)

(declare-fun tp!46504 () Bool)

(assert (=> mapNonEmpty!24061 (= mapRes!24061 (and tp!46504 e!459820))))

(declare-fun mapRest!24061 () (Array (_ BitVec 32) ValueCell!7064))

(declare-fun mapKey!24061 () (_ BitVec 32))

(declare-fun mapValue!24061 () ValueCell!7064)

(assert (=> mapNonEmpty!24061 (= (arr!22095 _values!788) (store mapRest!24061 mapKey!24061 mapValue!24061))))

(declare-fun mapIsEmpty!24061 () Bool)

(assert (=> mapIsEmpty!24061 mapRes!24061))

(declare-fun b!826101 () Bool)

(declare-fun res!562875 () Bool)

(assert (=> b!826101 (=> (not res!562875) (not e!459827))))

(declare-datatypes ((List!15670 0))(
  ( (Nil!15667) (Cons!15666 (h!16801 (_ BitVec 64)) (t!22007 List!15670)) )
))
(declare-fun arrayNoDuplicates!0 (array!46105 (_ BitVec 32) List!15670) Bool)

(assert (=> b!826101 (= res!562875 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15667))))

(assert (= (and start!71228 res!562880) b!826098))

(assert (= (and b!826098 res!562879) b!826093))

(assert (= (and b!826093 res!562877) b!826101))

(assert (= (and b!826101 res!562875) b!826100))

(assert (= (and b!826100 (not res!562876)) b!826096))

(assert (= (and b!826096 res!562878) b!826099))

(assert (= (and b!826096 res!562874) b!826095))

(assert (= (and b!826092 condMapEmpty!24061) mapIsEmpty!24061))

(assert (= (and b!826092 (not condMapEmpty!24061)) mapNonEmpty!24061))

(get-info :version)

(assert (= (and mapNonEmpty!24061 ((_ is ValueCellFull!7064) mapValue!24061)) b!826097))

(assert (= (and b!826092 ((_ is ValueCellFull!7064) mapDefault!24061)) b!826094))

(assert (= start!71228 b!826092))

(declare-fun m!768495 () Bool)

(assert (=> b!826100 m!768495))

(declare-fun m!768497 () Bool)

(assert (=> b!826100 m!768497))

(declare-fun m!768499 () Bool)

(assert (=> b!826100 m!768499))

(declare-fun m!768501 () Bool)

(assert (=> b!826099 m!768501))

(assert (=> b!826099 m!768501))

(declare-fun m!768503 () Bool)

(assert (=> b!826099 m!768503))

(declare-fun m!768505 () Bool)

(assert (=> mapNonEmpty!24061 m!768505))

(declare-fun m!768507 () Bool)

(assert (=> b!826101 m!768507))

(declare-fun m!768509 () Bool)

(assert (=> b!826093 m!768509))

(declare-fun m!768511 () Bool)

(assert (=> b!826096 m!768511))

(declare-fun m!768513 () Bool)

(assert (=> b!826096 m!768513))

(declare-fun m!768515 () Bool)

(assert (=> b!826096 m!768515))

(declare-fun m!768517 () Bool)

(assert (=> b!826096 m!768517))

(declare-fun m!768519 () Bool)

(assert (=> b!826096 m!768519))

(assert (=> b!826096 m!768517))

(declare-fun m!768521 () Bool)

(assert (=> b!826096 m!768521))

(declare-fun m!768523 () Bool)

(assert (=> b!826096 m!768523))

(declare-fun m!768525 () Bool)

(assert (=> b!826096 m!768525))

(declare-fun m!768527 () Bool)

(assert (=> b!826096 m!768527))

(declare-fun m!768529 () Bool)

(assert (=> b!826096 m!768529))

(assert (=> b!826096 m!768515))

(declare-fun m!768531 () Bool)

(assert (=> b!826096 m!768531))

(declare-fun m!768533 () Bool)

(assert (=> start!71228 m!768533))

(declare-fun m!768535 () Bool)

(assert (=> start!71228 m!768535))

(declare-fun m!768537 () Bool)

(assert (=> start!71228 m!768537))

(declare-fun m!768539 () Bool)

(assert (=> b!826095 m!768539))

(assert (=> b!826095 m!768539))

(declare-fun m!768541 () Bool)

(assert (=> b!826095 m!768541))

(check-sat (not b!826096) (not b!826093) (not b!826095) (not b!826100) b_and!22173 (not b!826101) tp_is_empty!14959 (not mapNonEmpty!24061) (not b!826099) (not b_next!13249) (not start!71228))
(check-sat b_and!22173 (not b_next!13249))
