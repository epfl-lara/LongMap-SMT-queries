; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70860 () Bool)

(assert start!70860)

(declare-fun b_free!12967 () Bool)

(declare-fun b_next!12967 () Bool)

(assert (=> start!70860 (= b_free!12967 (not b_next!12967))))

(declare-fun tp!45642 () Bool)

(declare-fun b_and!21839 () Bool)

(assert (=> start!70860 (= tp!45642 b_and!21839)))

(declare-fun res!560504 () Bool)

(declare-fun e!456863 () Bool)

(assert (=> start!70860 (=> (not res!560504) (not e!456863))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70860 (= res!560504 (validMask!0 mask!1312))))

(assert (=> start!70860 e!456863))

(declare-fun tp_is_empty!14677 () Bool)

(assert (=> start!70860 tp_is_empty!14677))

(declare-datatypes ((array!45553 0))(
  ( (array!45554 (arr!21823 (Array (_ BitVec 32) (_ BitVec 64))) (size!22243 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45553)

(declare-fun array_inv!17467 (array!45553) Bool)

(assert (=> start!70860 (array_inv!17467 _keys!976)))

(assert (=> start!70860 true))

(declare-datatypes ((V!24571 0))(
  ( (V!24572 (val!7386 Int)) )
))
(declare-datatypes ((ValueCell!6923 0))(
  ( (ValueCellFull!6923 (v!9817 V!24571)) (EmptyCell!6923) )
))
(declare-datatypes ((array!45555 0))(
  ( (array!45556 (arr!21824 (Array (_ BitVec 32) ValueCell!6923)) (size!22244 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45555)

(declare-fun e!456865 () Bool)

(declare-fun array_inv!17468 (array!45555) Bool)

(assert (=> start!70860 (and (array_inv!17468 _values!788) e!456865)))

(assert (=> start!70860 tp!45642))

(declare-fun b!822015 () Bool)

(declare-fun res!560506 () Bool)

(assert (=> b!822015 (=> (not res!560506) (not e!456863))))

(declare-datatypes ((List!15447 0))(
  ( (Nil!15444) (Cons!15443 (h!16578 (_ BitVec 64)) (t!21774 List!15447)) )
))
(declare-fun arrayNoDuplicates!0 (array!45553 (_ BitVec 32) List!15447) Bool)

(assert (=> b!822015 (= res!560506 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15444))))

(declare-fun mapIsEmpty!23623 () Bool)

(declare-fun mapRes!23623 () Bool)

(assert (=> mapIsEmpty!23623 mapRes!23623))

(declare-fun b!822016 () Bool)

(declare-fun res!560508 () Bool)

(assert (=> b!822016 (=> (not res!560508) (not e!456863))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822016 (= res!560508 (and (= (size!22244 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22243 _keys!976) (size!22244 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822017 () Bool)

(declare-fun e!456867 () Bool)

(assert (=> b!822017 (= e!456863 (not e!456867))))

(declare-fun res!560505 () Bool)

(assert (=> b!822017 (=> res!560505 e!456867)))

(assert (=> b!822017 (= res!560505 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9654 0))(
  ( (tuple2!9655 (_1!4838 (_ BitVec 64)) (_2!4838 V!24571)) )
))
(declare-datatypes ((List!15448 0))(
  ( (Nil!15445) (Cons!15444 (h!16579 tuple2!9654) (t!21775 List!15448)) )
))
(declare-datatypes ((ListLongMap!8479 0))(
  ( (ListLongMap!8480 (toList!4255 List!15448)) )
))
(declare-fun lt!369419 () ListLongMap!8479)

(declare-fun lt!369418 () ListLongMap!8479)

(assert (=> b!822017 (= lt!369419 lt!369418)))

(declare-fun zeroValueBefore!34 () V!24571)

(declare-fun zeroValueAfter!34 () V!24571)

(declare-fun minValue!754 () V!24571)

(declare-datatypes ((Unit!28062 0))(
  ( (Unit!28063) )
))
(declare-fun lt!369416 () Unit!28062)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!434 (array!45553 array!45555 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24571 V!24571 V!24571 V!24571 (_ BitVec 32) Int) Unit!28062)

(assert (=> b!822017 (= lt!369416 (lemmaNoChangeToArrayThenSameMapNoExtras!434 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2346 (array!45553 array!45555 (_ BitVec 32) (_ BitVec 32) V!24571 V!24571 (_ BitVec 32) Int) ListLongMap!8479)

(assert (=> b!822017 (= lt!369418 (getCurrentListMapNoExtraKeys!2346 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822017 (= lt!369419 (getCurrentListMapNoExtraKeys!2346 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822018 () Bool)

(assert (=> b!822018 (= e!456867 true)))

(declare-fun lt!369417 () ListLongMap!8479)

(declare-fun getCurrentListMap!2416 (array!45553 array!45555 (_ BitVec 32) (_ BitVec 32) V!24571 V!24571 (_ BitVec 32) Int) ListLongMap!8479)

(assert (=> b!822018 (= lt!369417 (getCurrentListMap!2416 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822019 () Bool)

(declare-fun e!456866 () Bool)

(assert (=> b!822019 (= e!456866 tp_is_empty!14677)))

(declare-fun b!822020 () Bool)

(declare-fun res!560507 () Bool)

(assert (=> b!822020 (=> (not res!560507) (not e!456863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45553 (_ BitVec 32)) Bool)

(assert (=> b!822020 (= res!560507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822021 () Bool)

(assert (=> b!822021 (= e!456865 (and e!456866 mapRes!23623))))

(declare-fun condMapEmpty!23623 () Bool)

(declare-fun mapDefault!23623 () ValueCell!6923)

(assert (=> b!822021 (= condMapEmpty!23623 (= (arr!21824 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6923)) mapDefault!23623)))))

(declare-fun b!822022 () Bool)

(declare-fun e!456864 () Bool)

(assert (=> b!822022 (= e!456864 tp_is_empty!14677)))

(declare-fun mapNonEmpty!23623 () Bool)

(declare-fun tp!45643 () Bool)

(assert (=> mapNonEmpty!23623 (= mapRes!23623 (and tp!45643 e!456864))))

(declare-fun mapKey!23623 () (_ BitVec 32))

(declare-fun mapValue!23623 () ValueCell!6923)

(declare-fun mapRest!23623 () (Array (_ BitVec 32) ValueCell!6923))

(assert (=> mapNonEmpty!23623 (= (arr!21824 _values!788) (store mapRest!23623 mapKey!23623 mapValue!23623))))

(assert (= (and start!70860 res!560504) b!822016))

(assert (= (and b!822016 res!560508) b!822020))

(assert (= (and b!822020 res!560507) b!822015))

(assert (= (and b!822015 res!560506) b!822017))

(assert (= (and b!822017 (not res!560505)) b!822018))

(assert (= (and b!822021 condMapEmpty!23623) mapIsEmpty!23623))

(assert (= (and b!822021 (not condMapEmpty!23623)) mapNonEmpty!23623))

(get-info :version)

(assert (= (and mapNonEmpty!23623 ((_ is ValueCellFull!6923) mapValue!23623)) b!822022))

(assert (= (and b!822021 ((_ is ValueCellFull!6923) mapDefault!23623)) b!822019))

(assert (= start!70860 b!822021))

(declare-fun m!764251 () Bool)

(assert (=> b!822020 m!764251))

(declare-fun m!764253 () Bool)

(assert (=> b!822017 m!764253))

(declare-fun m!764255 () Bool)

(assert (=> b!822017 m!764255))

(declare-fun m!764257 () Bool)

(assert (=> b!822017 m!764257))

(declare-fun m!764259 () Bool)

(assert (=> b!822015 m!764259))

(declare-fun m!764261 () Bool)

(assert (=> mapNonEmpty!23623 m!764261))

(declare-fun m!764263 () Bool)

(assert (=> start!70860 m!764263))

(declare-fun m!764265 () Bool)

(assert (=> start!70860 m!764265))

(declare-fun m!764267 () Bool)

(assert (=> start!70860 m!764267))

(declare-fun m!764269 () Bool)

(assert (=> b!822018 m!764269))

(check-sat (not mapNonEmpty!23623) (not b!822017) (not b!822020) (not b_next!12967) b_and!21839 (not start!70860) (not b!822015) tp_is_empty!14677 (not b!822018))
(check-sat b_and!21839 (not b_next!12967))
