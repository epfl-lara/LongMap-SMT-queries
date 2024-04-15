; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70972 () Bool)

(assert start!70972)

(declare-fun b_free!13195 () Bool)

(declare-fun b_next!13195 () Bool)

(assert (=> start!70972 (= b_free!13195 (not b_next!13195))))

(declare-fun tp!46338 () Bool)

(declare-fun b_and!22073 () Bool)

(assert (=> start!70972 (= tp!46338 b_and!22073)))

(declare-fun mapNonEmpty!23977 () Bool)

(declare-fun mapRes!23977 () Bool)

(declare-fun tp!46339 () Bool)

(declare-fun e!458490 () Bool)

(assert (=> mapNonEmpty!23977 (= mapRes!23977 (and tp!46339 e!458490))))

(declare-datatypes ((V!24875 0))(
  ( (V!24876 (val!7500 Int)) )
))
(declare-datatypes ((ValueCell!7037 0))(
  ( (ValueCellFull!7037 (v!9927 V!24875)) (EmptyCell!7037) )
))
(declare-fun mapValue!23977 () ValueCell!7037)

(declare-datatypes ((array!45969 0))(
  ( (array!45970 (arr!22032 (Array (_ BitVec 32) ValueCell!7037)) (size!22453 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45969)

(declare-fun mapKey!23977 () (_ BitVec 32))

(declare-fun mapRest!23977 () (Array (_ BitVec 32) ValueCell!7037))

(assert (=> mapNonEmpty!23977 (= (arr!22032 _values!788) (store mapRest!23977 mapKey!23977 mapValue!23977))))

(declare-fun mapIsEmpty!23977 () Bool)

(assert (=> mapIsEmpty!23977 mapRes!23977))

(declare-fun b!824134 () Bool)

(declare-fun res!561939 () Bool)

(declare-fun e!458495 () Bool)

(assert (=> b!824134 (=> (not res!561939) (not e!458495))))

(declare-datatypes ((array!45971 0))(
  ( (array!45972 (arr!22033 (Array (_ BitVec 32) (_ BitVec 64))) (size!22454 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45971)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45971 (_ BitVec 32)) Bool)

(assert (=> b!824134 (= res!561939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!561940 () Bool)

(assert (=> start!70972 (=> (not res!561940) (not e!458495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70972 (= res!561940 (validMask!0 mask!1312))))

(assert (=> start!70972 e!458495))

(declare-fun tp_is_empty!14905 () Bool)

(assert (=> start!70972 tp_is_empty!14905))

(declare-fun array_inv!17645 (array!45971) Bool)

(assert (=> start!70972 (array_inv!17645 _keys!976)))

(assert (=> start!70972 true))

(declare-fun e!458491 () Bool)

(declare-fun array_inv!17646 (array!45969) Bool)

(assert (=> start!70972 (and (array_inv!17646 _values!788) e!458491)))

(assert (=> start!70972 tp!46338))

(declare-fun b!824135 () Bool)

(declare-fun e!458493 () Bool)

(assert (=> b!824135 (= e!458495 (not e!458493))))

(declare-fun res!561937 () Bool)

(assert (=> b!824135 (=> res!561937 e!458493)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824135 (= res!561937 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9928 0))(
  ( (tuple2!9929 (_1!4975 (_ BitVec 64)) (_2!4975 V!24875)) )
))
(declare-datatypes ((List!15728 0))(
  ( (Nil!15725) (Cons!15724 (h!16853 tuple2!9928) (t!22062 List!15728)) )
))
(declare-datatypes ((ListLongMap!8741 0))(
  ( (ListLongMap!8742 (toList!4386 List!15728)) )
))
(declare-fun lt!371553 () ListLongMap!8741)

(declare-fun lt!371554 () ListLongMap!8741)

(assert (=> b!824135 (= lt!371553 lt!371554)))

(declare-fun zeroValueBefore!34 () V!24875)

(declare-fun zeroValueAfter!34 () V!24875)

(declare-fun minValue!754 () V!24875)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28196 0))(
  ( (Unit!28197) )
))
(declare-fun lt!371552 () Unit!28196)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!523 (array!45971 array!45969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24875 V!24875 V!24875 V!24875 (_ BitVec 32) Int) Unit!28196)

(assert (=> b!824135 (= lt!371552 (lemmaNoChangeToArrayThenSameMapNoExtras!523 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2430 (array!45971 array!45969 (_ BitVec 32) (_ BitVec 32) V!24875 V!24875 (_ BitVec 32) Int) ListLongMap!8741)

(assert (=> b!824135 (= lt!371554 (getCurrentListMapNoExtraKeys!2430 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824135 (= lt!371553 (getCurrentListMapNoExtraKeys!2430 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824136 () Bool)

(declare-fun e!458492 () Bool)

(assert (=> b!824136 (= e!458492 tp_is_empty!14905)))

(declare-fun b!824137 () Bool)

(declare-fun res!561938 () Bool)

(assert (=> b!824137 (=> (not res!561938) (not e!458495))))

(assert (=> b!824137 (= res!561938 (and (= (size!22453 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22454 _keys!976) (size!22453 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824138 () Bool)

(assert (=> b!824138 (= e!458491 (and e!458492 mapRes!23977))))

(declare-fun condMapEmpty!23977 () Bool)

(declare-fun mapDefault!23977 () ValueCell!7037)

(assert (=> b!824138 (= condMapEmpty!23977 (= (arr!22032 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7037)) mapDefault!23977)))))

(declare-fun b!824139 () Bool)

(assert (=> b!824139 (= e!458490 tp_is_empty!14905)))

(declare-fun b!824140 () Bool)

(assert (=> b!824140 (= e!458493 true)))

(declare-fun lt!371555 () ListLongMap!8741)

(declare-fun getCurrentListMap!2482 (array!45971 array!45969 (_ BitVec 32) (_ BitVec 32) V!24875 V!24875 (_ BitVec 32) Int) ListLongMap!8741)

(assert (=> b!824140 (= lt!371555 (getCurrentListMap!2482 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824141 () Bool)

(declare-fun res!561941 () Bool)

(assert (=> b!824141 (=> (not res!561941) (not e!458495))))

(declare-datatypes ((List!15729 0))(
  ( (Nil!15726) (Cons!15725 (h!16854 (_ BitVec 64)) (t!22063 List!15729)) )
))
(declare-fun arrayNoDuplicates!0 (array!45971 (_ BitVec 32) List!15729) Bool)

(assert (=> b!824141 (= res!561941 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15726))))

(assert (= (and start!70972 res!561940) b!824137))

(assert (= (and b!824137 res!561938) b!824134))

(assert (= (and b!824134 res!561939) b!824141))

(assert (= (and b!824141 res!561941) b!824135))

(assert (= (and b!824135 (not res!561937)) b!824140))

(assert (= (and b!824138 condMapEmpty!23977) mapIsEmpty!23977))

(assert (= (and b!824138 (not condMapEmpty!23977)) mapNonEmpty!23977))

(get-info :version)

(assert (= (and mapNonEmpty!23977 ((_ is ValueCellFull!7037) mapValue!23977)) b!824139))

(assert (= (and b!824138 ((_ is ValueCellFull!7037) mapDefault!23977)) b!824136))

(assert (= start!70972 b!824138))

(declare-fun m!765725 () Bool)

(assert (=> b!824141 m!765725))

(declare-fun m!765727 () Bool)

(assert (=> b!824134 m!765727))

(declare-fun m!765729 () Bool)

(assert (=> b!824140 m!765729))

(declare-fun m!765731 () Bool)

(assert (=> mapNonEmpty!23977 m!765731))

(declare-fun m!765733 () Bool)

(assert (=> start!70972 m!765733))

(declare-fun m!765735 () Bool)

(assert (=> start!70972 m!765735))

(declare-fun m!765737 () Bool)

(assert (=> start!70972 m!765737))

(declare-fun m!765739 () Bool)

(assert (=> b!824135 m!765739))

(declare-fun m!765741 () Bool)

(assert (=> b!824135 m!765741))

(declare-fun m!765743 () Bool)

(assert (=> b!824135 m!765743))

(check-sat (not start!70972) (not b_next!13195) (not b!824140) (not b!824141) (not b!824135) (not mapNonEmpty!23977) b_and!22073 (not b!824134) tp_is_empty!14905)
(check-sat b_and!22073 (not b_next!13195))
