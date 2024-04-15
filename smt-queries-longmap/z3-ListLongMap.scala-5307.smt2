; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71042 () Bool)

(assert start!71042)

(declare-fun b_free!13249 () Bool)

(declare-fun b_next!13249 () Bool)

(assert (=> start!71042 (= b_free!13249 (not b_next!13249))))

(declare-fun tp!46504 () Bool)

(declare-fun b_and!22137 () Bool)

(assert (=> start!71042 (= tp!46504 b_and!22137)))

(declare-fun b!824952 () Bool)

(declare-fun e!459095 () Bool)

(declare-fun e!459094 () Bool)

(assert (=> b!824952 (= e!459095 (not e!459094))))

(declare-fun res!562425 () Bool)

(assert (=> b!824952 (=> res!562425 e!459094)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824952 (= res!562425 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24947 0))(
  ( (V!24948 (val!7527 Int)) )
))
(declare-datatypes ((tuple2!9966 0))(
  ( (tuple2!9967 (_1!4994 (_ BitVec 64)) (_2!4994 V!24947)) )
))
(declare-datatypes ((List!15764 0))(
  ( (Nil!15761) (Cons!15760 (h!16889 tuple2!9966) (t!22100 List!15764)) )
))
(declare-datatypes ((ListLongMap!8779 0))(
  ( (ListLongMap!8780 (toList!4405 List!15764)) )
))
(declare-fun lt!372102 () ListLongMap!8779)

(declare-fun lt!372103 () ListLongMap!8779)

(assert (=> b!824952 (= lt!372102 lt!372103)))

(declare-fun zeroValueBefore!34 () V!24947)

(declare-datatypes ((array!46071 0))(
  ( (array!46072 (arr!22082 (Array (_ BitVec 32) (_ BitVec 64))) (size!22503 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46071)

(declare-fun minValue!754 () V!24947)

(declare-datatypes ((ValueCell!7064 0))(
  ( (ValueCellFull!7064 (v!9954 V!24947)) (EmptyCell!7064) )
))
(declare-datatypes ((array!46073 0))(
  ( (array!46074 (arr!22083 (Array (_ BitVec 32) ValueCell!7064)) (size!22504 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46073)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24947)

(declare-datatypes ((Unit!28229 0))(
  ( (Unit!28230) )
))
(declare-fun lt!372105 () Unit!28229)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!539 (array!46071 array!46073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24947 V!24947 V!24947 V!24947 (_ BitVec 32) Int) Unit!28229)

(assert (=> b!824952 (= lt!372105 (lemmaNoChangeToArrayThenSameMapNoExtras!539 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2446 (array!46071 array!46073 (_ BitVec 32) (_ BitVec 32) V!24947 V!24947 (_ BitVec 32) Int) ListLongMap!8779)

(assert (=> b!824952 (= lt!372103 (getCurrentListMapNoExtraKeys!2446 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824952 (= lt!372102 (getCurrentListMapNoExtraKeys!2446 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824953 () Bool)

(declare-fun res!562428 () Bool)

(assert (=> b!824953 (=> (not res!562428) (not e!459095))))

(assert (=> b!824953 (= res!562428 (and (= (size!22504 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22503 _keys!976) (size!22504 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!562423 () Bool)

(assert (=> start!71042 (=> (not res!562423) (not e!459095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71042 (= res!562423 (validMask!0 mask!1312))))

(assert (=> start!71042 e!459095))

(declare-fun tp_is_empty!14959 () Bool)

(assert (=> start!71042 tp_is_empty!14959))

(declare-fun array_inv!17681 (array!46071) Bool)

(assert (=> start!71042 (array_inv!17681 _keys!976)))

(assert (=> start!71042 true))

(declare-fun e!459096 () Bool)

(declare-fun array_inv!17682 (array!46073) Bool)

(assert (=> start!71042 (and (array_inv!17682 _values!788) e!459096)))

(assert (=> start!71042 tp!46504))

(declare-fun mapNonEmpty!24061 () Bool)

(declare-fun mapRes!24061 () Bool)

(declare-fun tp!46503 () Bool)

(declare-fun e!459097 () Bool)

(assert (=> mapNonEmpty!24061 (= mapRes!24061 (and tp!46503 e!459097))))

(declare-fun mapKey!24061 () (_ BitVec 32))

(declare-fun mapRest!24061 () (Array (_ BitVec 32) ValueCell!7064))

(declare-fun mapValue!24061 () ValueCell!7064)

(assert (=> mapNonEmpty!24061 (= (arr!22083 _values!788) (store mapRest!24061 mapKey!24061 mapValue!24061))))

(declare-fun b!824954 () Bool)

(declare-fun e!459093 () Bool)

(assert (=> b!824954 (= e!459093 tp_is_empty!14959)))

(declare-fun b!824955 () Bool)

(declare-fun res!562427 () Bool)

(assert (=> b!824955 (=> (not res!562427) (not e!459095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46071 (_ BitVec 32)) Bool)

(assert (=> b!824955 (= res!562427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824956 () Bool)

(assert (=> b!824956 (= e!459096 (and e!459093 mapRes!24061))))

(declare-fun condMapEmpty!24061 () Bool)

(declare-fun mapDefault!24061 () ValueCell!7064)

(assert (=> b!824956 (= condMapEmpty!24061 (= (arr!22083 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7064)) mapDefault!24061)))))

(declare-fun lt!372101 () ListLongMap!8779)

(declare-fun b!824957 () Bool)

(declare-fun lt!372093 () tuple2!9966)

(declare-fun e!459099 () Bool)

(declare-fun +!1942 (ListLongMap!8779 tuple2!9966) ListLongMap!8779)

(assert (=> b!824957 (= e!459099 (= lt!372101 (+!1942 (+!1942 lt!372103 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372093)))))

(declare-fun b!824958 () Bool)

(assert (=> b!824958 (= e!459097 tp_is_empty!14959)))

(declare-fun b!824959 () Bool)

(declare-fun res!562422 () Bool)

(assert (=> b!824959 (=> (not res!562422) (not e!459095))))

(declare-datatypes ((List!15765 0))(
  ( (Nil!15762) (Cons!15761 (h!16890 (_ BitVec 64)) (t!22101 List!15765)) )
))
(declare-fun arrayNoDuplicates!0 (array!46071 (_ BitVec 32) List!15765) Bool)

(assert (=> b!824959 (= res!562422 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15762))))

(declare-fun mapIsEmpty!24061 () Bool)

(assert (=> mapIsEmpty!24061 mapRes!24061))

(declare-fun b!824960 () Bool)

(assert (=> b!824960 (= e!459094 true)))

(declare-fun lt!372104 () tuple2!9966)

(declare-fun lt!372098 () ListLongMap!8779)

(assert (=> b!824960 (= lt!372098 (+!1942 (+!1942 lt!372102 lt!372104) lt!372093))))

(declare-fun lt!372096 () ListLongMap!8779)

(declare-fun lt!372100 () ListLongMap!8779)

(assert (=> b!824960 (and (= lt!372096 lt!372100) (= lt!372101 lt!372100) (= lt!372101 lt!372096))))

(declare-fun lt!372092 () ListLongMap!8779)

(assert (=> b!824960 (= lt!372100 (+!1942 lt!372092 lt!372104))))

(declare-fun lt!372097 () ListLongMap!8779)

(assert (=> b!824960 (= lt!372096 (+!1942 lt!372097 lt!372104))))

(declare-fun lt!372095 () Unit!28229)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!214 (ListLongMap!8779 (_ BitVec 64) V!24947 V!24947) Unit!28229)

(assert (=> b!824960 (= lt!372095 (addSameAsAddTwiceSameKeyDiffValues!214 lt!372097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459092 () Bool)

(assert (=> b!824960 e!459092))

(declare-fun res!562426 () Bool)

(assert (=> b!824960 (=> (not res!562426) (not e!459092))))

(declare-fun lt!372099 () ListLongMap!8779)

(assert (=> b!824960 (= res!562426 (= lt!372099 lt!372092))))

(declare-fun lt!372094 () tuple2!9966)

(assert (=> b!824960 (= lt!372092 (+!1942 lt!372097 lt!372094))))

(assert (=> b!824960 (= lt!372097 (+!1942 lt!372102 lt!372093))))

(assert (=> b!824960 (= lt!372104 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!824960 e!459099))

(declare-fun res!562424 () Bool)

(assert (=> b!824960 (=> (not res!562424) (not e!459099))))

(assert (=> b!824960 (= res!562424 (= lt!372099 (+!1942 (+!1942 lt!372102 lt!372094) lt!372093)))))

(assert (=> b!824960 (= lt!372093 (tuple2!9967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!824960 (= lt!372094 (tuple2!9967 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2497 (array!46071 array!46073 (_ BitVec 32) (_ BitVec 32) V!24947 V!24947 (_ BitVec 32) Int) ListLongMap!8779)

(assert (=> b!824960 (= lt!372101 (getCurrentListMap!2497 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824960 (= lt!372099 (getCurrentListMap!2497 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824961 () Bool)

(assert (=> b!824961 (= e!459092 (= lt!372101 (+!1942 (+!1942 lt!372103 lt!372093) lt!372104)))))

(assert (= (and start!71042 res!562423) b!824953))

(assert (= (and b!824953 res!562428) b!824955))

(assert (= (and b!824955 res!562427) b!824959))

(assert (= (and b!824959 res!562422) b!824952))

(assert (= (and b!824952 (not res!562425)) b!824960))

(assert (= (and b!824960 res!562424) b!824957))

(assert (= (and b!824960 res!562426) b!824961))

(assert (= (and b!824956 condMapEmpty!24061) mapIsEmpty!24061))

(assert (= (and b!824956 (not condMapEmpty!24061)) mapNonEmpty!24061))

(get-info :version)

(assert (= (and mapNonEmpty!24061 ((_ is ValueCellFull!7064) mapValue!24061)) b!824958))

(assert (= (and b!824956 ((_ is ValueCellFull!7064) mapDefault!24061)) b!824954))

(assert (= start!71042 b!824956))

(declare-fun m!766461 () Bool)

(assert (=> b!824961 m!766461))

(assert (=> b!824961 m!766461))

(declare-fun m!766463 () Bool)

(assert (=> b!824961 m!766463))

(declare-fun m!766465 () Bool)

(assert (=> b!824957 m!766465))

(assert (=> b!824957 m!766465))

(declare-fun m!766467 () Bool)

(assert (=> b!824957 m!766467))

(declare-fun m!766469 () Bool)

(assert (=> b!824955 m!766469))

(declare-fun m!766471 () Bool)

(assert (=> b!824960 m!766471))

(declare-fun m!766473 () Bool)

(assert (=> b!824960 m!766473))

(declare-fun m!766475 () Bool)

(assert (=> b!824960 m!766475))

(assert (=> b!824960 m!766473))

(declare-fun m!766477 () Bool)

(assert (=> b!824960 m!766477))

(declare-fun m!766479 () Bool)

(assert (=> b!824960 m!766479))

(declare-fun m!766481 () Bool)

(assert (=> b!824960 m!766481))

(declare-fun m!766483 () Bool)

(assert (=> b!824960 m!766483))

(declare-fun m!766485 () Bool)

(assert (=> b!824960 m!766485))

(assert (=> b!824960 m!766485))

(declare-fun m!766487 () Bool)

(assert (=> b!824960 m!766487))

(declare-fun m!766489 () Bool)

(assert (=> b!824960 m!766489))

(declare-fun m!766491 () Bool)

(assert (=> b!824960 m!766491))

(declare-fun m!766493 () Bool)

(assert (=> b!824959 m!766493))

(declare-fun m!766495 () Bool)

(assert (=> b!824952 m!766495))

(declare-fun m!766497 () Bool)

(assert (=> b!824952 m!766497))

(declare-fun m!766499 () Bool)

(assert (=> b!824952 m!766499))

(declare-fun m!766501 () Bool)

(assert (=> mapNonEmpty!24061 m!766501))

(declare-fun m!766503 () Bool)

(assert (=> start!71042 m!766503))

(declare-fun m!766505 () Bool)

(assert (=> start!71042 m!766505))

(declare-fun m!766507 () Bool)

(assert (=> start!71042 m!766507))

(check-sat tp_is_empty!14959 (not start!71042) (not b!824952) b_and!22137 (not b!824955) (not mapNonEmpty!24061) (not b!824957) (not b!824960) (not b!824961) (not b!824959) (not b_next!13249))
(check-sat b_and!22137 (not b_next!13249))
