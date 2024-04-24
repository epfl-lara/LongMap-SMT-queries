; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71858 () Bool)

(assert start!71858)

(declare-fun b_free!13525 () Bool)

(declare-fun b_next!13525 () Bool)

(assert (=> start!71858 (= b_free!13525 (not b_next!13525))))

(declare-fun tp!47371 () Bool)

(declare-fun b_and!22621 () Bool)

(assert (=> start!71858 (= tp!47371 b_and!22621)))

(declare-fun b!834661 () Bool)

(declare-fun e!465731 () Bool)

(declare-fun e!465726 () Bool)

(assert (=> b!834661 (= e!465731 (not e!465726))))

(declare-fun res!567294 () Bool)

(assert (=> b!834661 (=> res!567294 e!465726)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!834661 (= res!567294 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!25315 0))(
  ( (V!25316 (val!7665 Int)) )
))
(declare-datatypes ((tuple2!10102 0))(
  ( (tuple2!10103 (_1!5062 (_ BitVec 64)) (_2!5062 V!25315)) )
))
(declare-datatypes ((List!15871 0))(
  ( (Nil!15868) (Cons!15867 (h!17004 tuple2!10102) (t!22234 List!15871)) )
))
(declare-datatypes ((ListLongMap!8927 0))(
  ( (ListLongMap!8928 (toList!4479 List!15871)) )
))
(declare-fun lt!378902 () ListLongMap!8927)

(declare-fun lt!378900 () ListLongMap!8927)

(assert (=> b!834661 (= lt!378902 lt!378900)))

(declare-fun zeroValueBefore!34 () V!25315)

(declare-datatypes ((array!46647 0))(
  ( (array!46648 (arr!22353 (Array (_ BitVec 32) (_ BitVec 64))) (size!22773 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46647)

(declare-fun zeroValueAfter!34 () V!25315)

(declare-fun minValue!754 () V!25315)

(declare-datatypes ((ValueCell!7202 0))(
  ( (ValueCellFull!7202 (v!10113 V!25315)) (EmptyCell!7202) )
))
(declare-datatypes ((array!46649 0))(
  ( (array!46650 (arr!22354 (Array (_ BitVec 32) ValueCell!7202)) (size!22774 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46649)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28588 0))(
  ( (Unit!28589) )
))
(declare-fun lt!378907 () Unit!28588)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!615 (array!46647 array!46649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25315 V!25315 V!25315 V!25315 (_ BitVec 32) Int) Unit!28588)

(assert (=> b!834661 (= lt!378907 (lemmaNoChangeToArrayThenSameMapNoExtras!615 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2548 (array!46647 array!46649 (_ BitVec 32) (_ BitVec 32) V!25315 V!25315 (_ BitVec 32) Int) ListLongMap!8927)

(assert (=> b!834661 (= lt!378900 (getCurrentListMapNoExtraKeys!2548 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!834661 (= lt!378902 (getCurrentListMapNoExtraKeys!2548 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!834662 () Bool)

(declare-fun res!567292 () Bool)

(assert (=> b!834662 (=> (not res!567292) (not e!465731))))

(assert (=> b!834662 (= res!567292 (and (= (size!22774 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22773 _keys!976) (size!22774 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!378905 () ListLongMap!8927)

(declare-fun lt!378895 () tuple2!10102)

(declare-fun e!465732 () Bool)

(declare-fun b!834663 () Bool)

(declare-fun +!2000 (ListLongMap!8927 tuple2!10102) ListLongMap!8927)

(assert (=> b!834663 (= e!465732 (= lt!378905 (+!2000 (+!2000 lt!378900 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378895)))))

(declare-fun b!834664 () Bool)

(declare-fun e!465733 () Bool)

(declare-fun e!465734 () Bool)

(declare-fun mapRes!24515 () Bool)

(assert (=> b!834664 (= e!465733 (and e!465734 mapRes!24515))))

(declare-fun condMapEmpty!24515 () Bool)

(declare-fun mapDefault!24515 () ValueCell!7202)

(assert (=> b!834664 (= condMapEmpty!24515 (= (arr!22354 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7202)) mapDefault!24515)))))

(declare-fun e!465727 () Bool)

(declare-fun lt!378906 () tuple2!10102)

(declare-fun lt!378901 () ListLongMap!8927)

(declare-fun b!834665 () Bool)

(assert (=> b!834665 (= e!465727 (= (+!2000 lt!378901 lt!378906) lt!378905))))

(declare-fun b!834666 () Bool)

(declare-fun e!465729 () Bool)

(assert (=> b!834666 (= e!465729 (= lt!378905 (+!2000 (+!2000 lt!378900 lt!378895) lt!378906)))))

(declare-fun mapNonEmpty!24515 () Bool)

(declare-fun tp!47372 () Bool)

(declare-fun e!465728 () Bool)

(assert (=> mapNonEmpty!24515 (= mapRes!24515 (and tp!47372 e!465728))))

(declare-fun mapRest!24515 () (Array (_ BitVec 32) ValueCell!7202))

(declare-fun mapValue!24515 () ValueCell!7202)

(declare-fun mapKey!24515 () (_ BitVec 32))

(assert (=> mapNonEmpty!24515 (= (arr!22354 _values!788) (store mapRest!24515 mapKey!24515 mapValue!24515))))

(declare-fun b!834667 () Bool)

(assert (=> b!834667 (= e!465726 e!465727)))

(declare-fun res!567291 () Bool)

(assert (=> b!834667 (=> res!567291 e!465727)))

(assert (=> b!834667 (= res!567291 (not (= lt!378905 (+!2000 (+!2000 lt!378902 lt!378906) lt!378895))))))

(declare-fun lt!378896 () ListLongMap!8927)

(declare-fun lt!378903 () ListLongMap!8927)

(assert (=> b!834667 (and (= lt!378896 lt!378903) (= lt!378905 lt!378903) (= lt!378905 lt!378896))))

(declare-fun lt!378904 () ListLongMap!8927)

(assert (=> b!834667 (= lt!378903 (+!2000 lt!378904 lt!378906))))

(declare-fun lt!378899 () ListLongMap!8927)

(assert (=> b!834667 (= lt!378896 (+!2000 lt!378899 lt!378906))))

(declare-fun lt!378897 () Unit!28588)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!253 (ListLongMap!8927 (_ BitVec 64) V!25315 V!25315) Unit!28588)

(assert (=> b!834667 (= lt!378897 (addSameAsAddTwiceSameKeyDiffValues!253 lt!378899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!834667 e!465729))

(declare-fun res!567293 () Bool)

(assert (=> b!834667 (=> (not res!567293) (not e!465729))))

(assert (=> b!834667 (= res!567293 (= lt!378901 lt!378904))))

(declare-fun lt!378898 () tuple2!10102)

(assert (=> b!834667 (= lt!378904 (+!2000 lt!378899 lt!378898))))

(assert (=> b!834667 (= lt!378899 (+!2000 lt!378902 lt!378895))))

(assert (=> b!834667 (= lt!378906 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!834667 e!465732))

(declare-fun res!567290 () Bool)

(assert (=> b!834667 (=> (not res!567290) (not e!465732))))

(assert (=> b!834667 (= res!567290 (= lt!378901 (+!2000 (+!2000 lt!378902 lt!378898) lt!378895)))))

(assert (=> b!834667 (= lt!378895 (tuple2!10103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!834667 (= lt!378898 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2568 (array!46647 array!46649 (_ BitVec 32) (_ BitVec 32) V!25315 V!25315 (_ BitVec 32) Int) ListLongMap!8927)

(assert (=> b!834667 (= lt!378905 (getCurrentListMap!2568 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!834667 (= lt!378901 (getCurrentListMap!2568 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24515 () Bool)

(assert (=> mapIsEmpty!24515 mapRes!24515))

(declare-fun b!834668 () Bool)

(declare-fun res!567287 () Bool)

(assert (=> b!834668 (=> (not res!567287) (not e!465731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46647 (_ BitVec 32)) Bool)

(assert (=> b!834668 (= res!567287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!567289 () Bool)

(assert (=> start!71858 (=> (not res!567289) (not e!465731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71858 (= res!567289 (validMask!0 mask!1312))))

(assert (=> start!71858 e!465731))

(declare-fun tp_is_empty!15235 () Bool)

(assert (=> start!71858 tp_is_empty!15235))

(declare-fun array_inv!17841 (array!46647) Bool)

(assert (=> start!71858 (array_inv!17841 _keys!976)))

(assert (=> start!71858 true))

(declare-fun array_inv!17842 (array!46649) Bool)

(assert (=> start!71858 (and (array_inv!17842 _values!788) e!465733)))

(assert (=> start!71858 tp!47371))

(declare-fun b!834669 () Bool)

(assert (=> b!834669 (= e!465734 tp_is_empty!15235)))

(declare-fun b!834670 () Bool)

(declare-fun res!567288 () Bool)

(assert (=> b!834670 (=> (not res!567288) (not e!465731))))

(declare-datatypes ((List!15872 0))(
  ( (Nil!15869) (Cons!15868 (h!17005 (_ BitVec 64)) (t!22235 List!15872)) )
))
(declare-fun arrayNoDuplicates!0 (array!46647 (_ BitVec 32) List!15872) Bool)

(assert (=> b!834670 (= res!567288 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15869))))

(declare-fun b!834671 () Bool)

(assert (=> b!834671 (= e!465728 tp_is_empty!15235)))

(assert (= (and start!71858 res!567289) b!834662))

(assert (= (and b!834662 res!567292) b!834668))

(assert (= (and b!834668 res!567287) b!834670))

(assert (= (and b!834670 res!567288) b!834661))

(assert (= (and b!834661 (not res!567294)) b!834667))

(assert (= (and b!834667 res!567290) b!834663))

(assert (= (and b!834667 res!567293) b!834666))

(assert (= (and b!834667 (not res!567291)) b!834665))

(assert (= (and b!834664 condMapEmpty!24515) mapIsEmpty!24515))

(assert (= (and b!834664 (not condMapEmpty!24515)) mapNonEmpty!24515))

(get-info :version)

(assert (= (and mapNonEmpty!24515 ((_ is ValueCellFull!7202) mapValue!24515)) b!834671))

(assert (= (and b!834664 ((_ is ValueCellFull!7202) mapDefault!24515)) b!834669))

(assert (= start!71858 b!834664))

(declare-fun m!779969 () Bool)

(assert (=> b!834663 m!779969))

(assert (=> b!834663 m!779969))

(declare-fun m!779971 () Bool)

(assert (=> b!834663 m!779971))

(declare-fun m!779973 () Bool)

(assert (=> mapNonEmpty!24515 m!779973))

(declare-fun m!779975 () Bool)

(assert (=> start!71858 m!779975))

(declare-fun m!779977 () Bool)

(assert (=> start!71858 m!779977))

(declare-fun m!779979 () Bool)

(assert (=> start!71858 m!779979))

(declare-fun m!779981 () Bool)

(assert (=> b!834666 m!779981))

(assert (=> b!834666 m!779981))

(declare-fun m!779983 () Bool)

(assert (=> b!834666 m!779983))

(declare-fun m!779985 () Bool)

(assert (=> b!834668 m!779985))

(declare-fun m!779987 () Bool)

(assert (=> b!834665 m!779987))

(declare-fun m!779989 () Bool)

(assert (=> b!834670 m!779989))

(declare-fun m!779991 () Bool)

(assert (=> b!834661 m!779991))

(declare-fun m!779993 () Bool)

(assert (=> b!834661 m!779993))

(declare-fun m!779995 () Bool)

(assert (=> b!834661 m!779995))

(declare-fun m!779997 () Bool)

(assert (=> b!834667 m!779997))

(declare-fun m!779999 () Bool)

(assert (=> b!834667 m!779999))

(declare-fun m!780001 () Bool)

(assert (=> b!834667 m!780001))

(assert (=> b!834667 m!779999))

(declare-fun m!780003 () Bool)

(assert (=> b!834667 m!780003))

(declare-fun m!780005 () Bool)

(assert (=> b!834667 m!780005))

(declare-fun m!780007 () Bool)

(assert (=> b!834667 m!780007))

(assert (=> b!834667 m!780005))

(declare-fun m!780009 () Bool)

(assert (=> b!834667 m!780009))

(declare-fun m!780011 () Bool)

(assert (=> b!834667 m!780011))

(declare-fun m!780013 () Bool)

(assert (=> b!834667 m!780013))

(declare-fun m!780015 () Bool)

(assert (=> b!834667 m!780015))

(declare-fun m!780017 () Bool)

(assert (=> b!834667 m!780017))

(check-sat tp_is_empty!15235 (not b!834665) (not b!834667) (not b!834666) (not b_next!13525) (not b!834668) (not b!834661) (not b!834663) (not start!71858) b_and!22621 (not b!834670) (not mapNonEmpty!24515))
(check-sat b_and!22621 (not b_next!13525))
