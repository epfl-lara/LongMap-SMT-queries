; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70996 () Bool)

(assert start!70996)

(declare-fun b_free!13219 () Bool)

(declare-fun b_next!13219 () Bool)

(assert (=> start!70996 (= b_free!13219 (not b_next!13219))))

(declare-fun tp!46410 () Bool)

(declare-fun b_and!22097 () Bool)

(assert (=> start!70996 (= tp!46410 b_and!22097)))

(declare-fun b!824422 () Bool)

(declare-fun res!562121 () Bool)

(declare-fun e!458709 () Bool)

(assert (=> b!824422 (=> (not res!562121) (not e!458709))))

(declare-datatypes ((array!46015 0))(
  ( (array!46016 (arr!22055 (Array (_ BitVec 32) (_ BitVec 64))) (size!22476 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46015)

(declare-datatypes ((List!15745 0))(
  ( (Nil!15742) (Cons!15741 (h!16870 (_ BitVec 64)) (t!22079 List!15745)) )
))
(declare-fun arrayNoDuplicates!0 (array!46015 (_ BitVec 32) List!15745) Bool)

(assert (=> b!824422 (= res!562121 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15742))))

(declare-fun b!824423 () Bool)

(declare-fun e!458706 () Bool)

(declare-fun e!458708 () Bool)

(declare-fun mapRes!24013 () Bool)

(assert (=> b!824423 (= e!458706 (and e!458708 mapRes!24013))))

(declare-fun condMapEmpty!24013 () Bool)

(declare-datatypes ((V!24907 0))(
  ( (V!24908 (val!7512 Int)) )
))
(declare-datatypes ((ValueCell!7049 0))(
  ( (ValueCellFull!7049 (v!9939 V!24907)) (EmptyCell!7049) )
))
(declare-datatypes ((array!46017 0))(
  ( (array!46018 (arr!22056 (Array (_ BitVec 32) ValueCell!7049)) (size!22477 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46017)

(declare-fun mapDefault!24013 () ValueCell!7049)

(assert (=> b!824423 (= condMapEmpty!24013 (= (arr!22056 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7049)) mapDefault!24013)))))

(declare-fun b!824424 () Bool)

(declare-fun e!458711 () Bool)

(assert (=> b!824424 (= e!458711 true)))

(declare-fun zeroValueBefore!34 () V!24907)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24907)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9946 0))(
  ( (tuple2!9947 (_1!4984 (_ BitVec 64)) (_2!4984 V!24907)) )
))
(declare-datatypes ((List!15746 0))(
  ( (Nil!15743) (Cons!15742 (h!16871 tuple2!9946) (t!22080 List!15746)) )
))
(declare-datatypes ((ListLongMap!8759 0))(
  ( (ListLongMap!8760 (toList!4395 List!15746)) )
))
(declare-fun lt!371696 () ListLongMap!8759)

(declare-fun getCurrentListMap!2490 (array!46015 array!46017 (_ BitVec 32) (_ BitVec 32) V!24907 V!24907 (_ BitVec 32) Int) ListLongMap!8759)

(assert (=> b!824424 (= lt!371696 (getCurrentListMap!2490 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824426 () Bool)

(declare-fun tp_is_empty!14929 () Bool)

(assert (=> b!824426 (= e!458708 tp_is_empty!14929)))

(declare-fun mapNonEmpty!24013 () Bool)

(declare-fun tp!46411 () Bool)

(declare-fun e!458710 () Bool)

(assert (=> mapNonEmpty!24013 (= mapRes!24013 (and tp!46411 e!458710))))

(declare-fun mapRest!24013 () (Array (_ BitVec 32) ValueCell!7049))

(declare-fun mapKey!24013 () (_ BitVec 32))

(declare-fun mapValue!24013 () ValueCell!7049)

(assert (=> mapNonEmpty!24013 (= (arr!22056 _values!788) (store mapRest!24013 mapKey!24013 mapValue!24013))))

(declare-fun b!824427 () Bool)

(declare-fun res!562117 () Bool)

(assert (=> b!824427 (=> (not res!562117) (not e!458709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46015 (_ BitVec 32)) Bool)

(assert (=> b!824427 (= res!562117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24013 () Bool)

(assert (=> mapIsEmpty!24013 mapRes!24013))

(declare-fun b!824425 () Bool)

(assert (=> b!824425 (= e!458710 tp_is_empty!14929)))

(declare-fun res!562119 () Bool)

(assert (=> start!70996 (=> (not res!562119) (not e!458709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70996 (= res!562119 (validMask!0 mask!1312))))

(assert (=> start!70996 e!458709))

(assert (=> start!70996 tp_is_empty!14929))

(declare-fun array_inv!17663 (array!46015) Bool)

(assert (=> start!70996 (array_inv!17663 _keys!976)))

(assert (=> start!70996 true))

(declare-fun array_inv!17664 (array!46017) Bool)

(assert (=> start!70996 (and (array_inv!17664 _values!788) e!458706)))

(assert (=> start!70996 tp!46410))

(declare-fun b!824428 () Bool)

(assert (=> b!824428 (= e!458709 (not e!458711))))

(declare-fun res!562118 () Bool)

(assert (=> b!824428 (=> res!562118 e!458711)))

(assert (=> b!824428 (= res!562118 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!371699 () ListLongMap!8759)

(declare-fun lt!371697 () ListLongMap!8759)

(assert (=> b!824428 (= lt!371699 lt!371697)))

(declare-fun zeroValueAfter!34 () V!24907)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28214 0))(
  ( (Unit!28215) )
))
(declare-fun lt!371698 () Unit!28214)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!532 (array!46015 array!46017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24907 V!24907 V!24907 V!24907 (_ BitVec 32) Int) Unit!28214)

(assert (=> b!824428 (= lt!371698 (lemmaNoChangeToArrayThenSameMapNoExtras!532 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2439 (array!46015 array!46017 (_ BitVec 32) (_ BitVec 32) V!24907 V!24907 (_ BitVec 32) Int) ListLongMap!8759)

(assert (=> b!824428 (= lt!371697 (getCurrentListMapNoExtraKeys!2439 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824428 (= lt!371699 (getCurrentListMapNoExtraKeys!2439 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824429 () Bool)

(declare-fun res!562120 () Bool)

(assert (=> b!824429 (=> (not res!562120) (not e!458709))))

(assert (=> b!824429 (= res!562120 (and (= (size!22477 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22476 _keys!976) (size!22477 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70996 res!562119) b!824429))

(assert (= (and b!824429 res!562120) b!824427))

(assert (= (and b!824427 res!562117) b!824422))

(assert (= (and b!824422 res!562121) b!824428))

(assert (= (and b!824428 (not res!562118)) b!824424))

(assert (= (and b!824423 condMapEmpty!24013) mapIsEmpty!24013))

(assert (= (and b!824423 (not condMapEmpty!24013)) mapNonEmpty!24013))

(get-info :version)

(assert (= (and mapNonEmpty!24013 ((_ is ValueCellFull!7049) mapValue!24013)) b!824425))

(assert (= (and b!824423 ((_ is ValueCellFull!7049) mapDefault!24013)) b!824426))

(assert (= start!70996 b!824423))

(declare-fun m!765965 () Bool)

(assert (=> start!70996 m!765965))

(declare-fun m!765967 () Bool)

(assert (=> start!70996 m!765967))

(declare-fun m!765969 () Bool)

(assert (=> start!70996 m!765969))

(declare-fun m!765971 () Bool)

(assert (=> b!824428 m!765971))

(declare-fun m!765973 () Bool)

(assert (=> b!824428 m!765973))

(declare-fun m!765975 () Bool)

(assert (=> b!824428 m!765975))

(declare-fun m!765977 () Bool)

(assert (=> b!824424 m!765977))

(declare-fun m!765979 () Bool)

(assert (=> b!824422 m!765979))

(declare-fun m!765981 () Bool)

(assert (=> b!824427 m!765981))

(declare-fun m!765983 () Bool)

(assert (=> mapNonEmpty!24013 m!765983))

(check-sat (not b!824424) b_and!22097 (not b!824427) tp_is_empty!14929 (not b_next!13219) (not b!824422) (not b!824428) (not mapNonEmpty!24013) (not start!70996))
(check-sat b_and!22097 (not b_next!13219))
