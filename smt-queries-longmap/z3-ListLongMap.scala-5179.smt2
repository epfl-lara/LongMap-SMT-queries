; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70226 () Bool)

(assert start!70226)

(declare-fun b_free!12481 () Bool)

(declare-fun b_next!12481 () Bool)

(assert (=> start!70226 (= b_free!12481 (not b_next!12481))))

(declare-fun tp!44158 () Bool)

(declare-fun b_and!21263 () Bool)

(assert (=> start!70226 (= tp!44158 b_and!21263)))

(declare-fun b!815099 () Bool)

(declare-fun e!451870 () Bool)

(declare-fun tp_is_empty!14191 () Bool)

(assert (=> b!815099 (= e!451870 tp_is_empty!14191)))

(declare-fun b!815100 () Bool)

(declare-fun res!556489 () Bool)

(declare-fun e!451869 () Bool)

(assert (=> b!815100 (=> (not res!556489) (not e!451869))))

(declare-datatypes ((array!44587 0))(
  ( (array!44588 (arr!21349 (Array (_ BitVec 32) (_ BitVec 64))) (size!21769 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44587)

(declare-datatypes ((List!15094 0))(
  ( (Nil!15091) (Cons!15090 (h!16225 (_ BitVec 64)) (t!21403 List!15094)) )
))
(declare-fun arrayNoDuplicates!0 (array!44587 (_ BitVec 32) List!15094) Bool)

(assert (=> b!815100 (= res!556489 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15091))))

(declare-fun mapIsEmpty!22867 () Bool)

(declare-fun mapRes!22867 () Bool)

(assert (=> mapIsEmpty!22867 mapRes!22867))

(declare-fun res!556492 () Bool)

(assert (=> start!70226 (=> (not res!556492) (not e!451869))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70226 (= res!556492 (validMask!0 mask!1312))))

(assert (=> start!70226 e!451869))

(assert (=> start!70226 tp_is_empty!14191))

(declare-fun array_inv!17139 (array!44587) Bool)

(assert (=> start!70226 (array_inv!17139 _keys!976)))

(assert (=> start!70226 true))

(declare-datatypes ((V!23923 0))(
  ( (V!23924 (val!7143 Int)) )
))
(declare-datatypes ((ValueCell!6680 0))(
  ( (ValueCellFull!6680 (v!9570 V!23923)) (EmptyCell!6680) )
))
(declare-datatypes ((array!44589 0))(
  ( (array!44590 (arr!21350 (Array (_ BitVec 32) ValueCell!6680)) (size!21770 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44589)

(declare-fun e!451871 () Bool)

(declare-fun array_inv!17140 (array!44589) Bool)

(assert (=> start!70226 (and (array_inv!17140 _values!788) e!451871)))

(assert (=> start!70226 tp!44158))

(declare-fun b!815101 () Bool)

(declare-fun res!556490 () Bool)

(assert (=> b!815101 (=> (not res!556490) (not e!451869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44587 (_ BitVec 32)) Bool)

(assert (=> b!815101 (= res!556490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815102 () Bool)

(assert (=> b!815102 (= e!451869 (not true))))

(declare-datatypes ((tuple2!9276 0))(
  ( (tuple2!9277 (_1!4649 (_ BitVec 64)) (_2!4649 V!23923)) )
))
(declare-datatypes ((List!15095 0))(
  ( (Nil!15092) (Cons!15091 (h!16226 tuple2!9276) (t!21404 List!15095)) )
))
(declare-datatypes ((ListLongMap!8101 0))(
  ( (ListLongMap!8102 (toList!4066 List!15095)) )
))
(declare-fun lt!364871 () ListLongMap!8101)

(declare-fun lt!364870 () ListLongMap!8101)

(assert (=> b!815102 (= lt!364871 lt!364870)))

(declare-fun zeroValueBefore!34 () V!23923)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23923)

(declare-fun minValue!754 () V!23923)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27699 0))(
  ( (Unit!27700) )
))
(declare-fun lt!364872 () Unit!27699)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!261 (array!44587 array!44589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23923 V!23923 V!23923 V!23923 (_ BitVec 32) Int) Unit!27699)

(assert (=> b!815102 (= lt!364872 (lemmaNoChangeToArrayThenSameMapNoExtras!261 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2173 (array!44587 array!44589 (_ BitVec 32) (_ BitVec 32) V!23923 V!23923 (_ BitVec 32) Int) ListLongMap!8101)

(assert (=> b!815102 (= lt!364870 (getCurrentListMapNoExtraKeys!2173 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815102 (= lt!364871 (getCurrentListMapNoExtraKeys!2173 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815103 () Bool)

(declare-fun res!556491 () Bool)

(assert (=> b!815103 (=> (not res!556491) (not e!451869))))

(assert (=> b!815103 (= res!556491 (and (= (size!21770 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21769 _keys!976) (size!21770 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815104 () Bool)

(assert (=> b!815104 (= e!451871 (and e!451870 mapRes!22867))))

(declare-fun condMapEmpty!22867 () Bool)

(declare-fun mapDefault!22867 () ValueCell!6680)

(assert (=> b!815104 (= condMapEmpty!22867 (= (arr!21350 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6680)) mapDefault!22867)))))

(declare-fun b!815105 () Bool)

(declare-fun e!451868 () Bool)

(assert (=> b!815105 (= e!451868 tp_is_empty!14191)))

(declare-fun mapNonEmpty!22867 () Bool)

(declare-fun tp!44157 () Bool)

(assert (=> mapNonEmpty!22867 (= mapRes!22867 (and tp!44157 e!451868))))

(declare-fun mapValue!22867 () ValueCell!6680)

(declare-fun mapRest!22867 () (Array (_ BitVec 32) ValueCell!6680))

(declare-fun mapKey!22867 () (_ BitVec 32))

(assert (=> mapNonEmpty!22867 (= (arr!21350 _values!788) (store mapRest!22867 mapKey!22867 mapValue!22867))))

(assert (= (and start!70226 res!556492) b!815103))

(assert (= (and b!815103 res!556491) b!815101))

(assert (= (and b!815101 res!556490) b!815100))

(assert (= (and b!815100 res!556489) b!815102))

(assert (= (and b!815104 condMapEmpty!22867) mapIsEmpty!22867))

(assert (= (and b!815104 (not condMapEmpty!22867)) mapNonEmpty!22867))

(get-info :version)

(assert (= (and mapNonEmpty!22867 ((_ is ValueCellFull!6680) mapValue!22867)) b!815105))

(assert (= (and b!815104 ((_ is ValueCellFull!6680) mapDefault!22867)) b!815099))

(assert (= start!70226 b!815104))

(declare-fun m!757335 () Bool)

(assert (=> mapNonEmpty!22867 m!757335))

(declare-fun m!757337 () Bool)

(assert (=> start!70226 m!757337))

(declare-fun m!757339 () Bool)

(assert (=> start!70226 m!757339))

(declare-fun m!757341 () Bool)

(assert (=> start!70226 m!757341))

(declare-fun m!757343 () Bool)

(assert (=> b!815101 m!757343))

(declare-fun m!757345 () Bool)

(assert (=> b!815100 m!757345))

(declare-fun m!757347 () Bool)

(assert (=> b!815102 m!757347))

(declare-fun m!757349 () Bool)

(assert (=> b!815102 m!757349))

(declare-fun m!757351 () Bool)

(assert (=> b!815102 m!757351))

(check-sat (not start!70226) (not b!815102) tp_is_empty!14191 (not b!815100) (not b_next!12481) (not mapNonEmpty!22867) (not b!815101) b_and!21263)
(check-sat b_and!21263 (not b_next!12481))
