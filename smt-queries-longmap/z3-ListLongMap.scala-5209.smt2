; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70266 () Bool)

(assert start!70266)

(declare-fun b_free!12661 () Bool)

(declare-fun b_next!12661 () Bool)

(assert (=> start!70266 (= b_free!12661 (not b_next!12661))))

(declare-fun tp!44706 () Bool)

(declare-fun b_and!21435 () Bool)

(assert (=> start!70266 (= tp!44706 b_and!21435)))

(declare-fun b!816313 () Bool)

(declare-fun e!452820 () Bool)

(declare-fun e!452824 () Bool)

(declare-fun mapRes!23146 () Bool)

(assert (=> b!816313 (= e!452820 (and e!452824 mapRes!23146))))

(declare-fun condMapEmpty!23146 () Bool)

(declare-datatypes ((V!24163 0))(
  ( (V!24164 (val!7233 Int)) )
))
(declare-datatypes ((ValueCell!6770 0))(
  ( (ValueCellFull!6770 (v!9655 V!24163)) (EmptyCell!6770) )
))
(declare-datatypes ((array!44923 0))(
  ( (array!44924 (arr!21519 (Array (_ BitVec 32) ValueCell!6770)) (size!21940 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44923)

(declare-fun mapDefault!23146 () ValueCell!6770)

(assert (=> b!816313 (= condMapEmpty!23146 (= (arr!21519 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6770)) mapDefault!23146)))))

(declare-fun b!816314 () Bool)

(declare-fun e!452819 () Bool)

(declare-fun e!452821 () Bool)

(assert (=> b!816314 (= e!452819 (not e!452821))))

(declare-fun res!557375 () Bool)

(assert (=> b!816314 (=> res!557375 e!452821)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816314 (= res!557375 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9520 0))(
  ( (tuple2!9521 (_1!4771 (_ BitVec 64)) (_2!4771 V!24163)) )
))
(declare-datatypes ((List!15343 0))(
  ( (Nil!15340) (Cons!15339 (h!16468 tuple2!9520) (t!21657 List!15343)) )
))
(declare-datatypes ((ListLongMap!8333 0))(
  ( (ListLongMap!8334 (toList!4182 List!15343)) )
))
(declare-fun lt!365509 () ListLongMap!8333)

(declare-fun lt!365507 () ListLongMap!8333)

(assert (=> b!816314 (= lt!365509 lt!365507)))

(declare-fun zeroValueBefore!34 () V!24163)

(declare-datatypes ((array!44925 0))(
  ( (array!44926 (arr!21520 (Array (_ BitVec 32) (_ BitVec 64))) (size!21941 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44925)

(declare-fun zeroValueAfter!34 () V!24163)

(declare-fun minValue!754 () V!24163)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27792 0))(
  ( (Unit!27793) )
))
(declare-fun lt!365505 () Unit!27792)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!336 (array!44925 array!44923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24163 V!24163 V!24163 V!24163 (_ BitVec 32) Int) Unit!27792)

(assert (=> b!816314 (= lt!365505 (lemmaNoChangeToArrayThenSameMapNoExtras!336 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2243 (array!44925 array!44923 (_ BitVec 32) (_ BitVec 32) V!24163 V!24163 (_ BitVec 32) Int) ListLongMap!8333)

(assert (=> b!816314 (= lt!365507 (getCurrentListMapNoExtraKeys!2243 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816314 (= lt!365509 (getCurrentListMapNoExtraKeys!2243 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816315 () Bool)

(assert (=> b!816315 (= e!452821 true)))

(declare-fun lt!365508 () ListLongMap!8333)

(declare-fun getCurrentListMap!2355 (array!44925 array!44923 (_ BitVec 32) (_ BitVec 32) V!24163 V!24163 (_ BitVec 32) Int) ListLongMap!8333)

(assert (=> b!816315 (= lt!365508 (getCurrentListMap!2355 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365506 () ListLongMap!8333)

(declare-fun +!1843 (ListLongMap!8333 tuple2!9520) ListLongMap!8333)

(assert (=> b!816315 (= lt!365506 (+!1843 (getCurrentListMap!2355 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816316 () Bool)

(declare-fun e!452822 () Bool)

(declare-fun tp_is_empty!14371 () Bool)

(assert (=> b!816316 (= e!452822 tp_is_empty!14371)))

(declare-fun b!816317 () Bool)

(assert (=> b!816317 (= e!452824 tp_is_empty!14371)))

(declare-fun res!557374 () Bool)

(assert (=> start!70266 (=> (not res!557374) (not e!452819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70266 (= res!557374 (validMask!0 mask!1312))))

(assert (=> start!70266 e!452819))

(assert (=> start!70266 tp_is_empty!14371))

(declare-fun array_inv!17295 (array!44925) Bool)

(assert (=> start!70266 (array_inv!17295 _keys!976)))

(assert (=> start!70266 true))

(declare-fun array_inv!17296 (array!44923) Bool)

(assert (=> start!70266 (and (array_inv!17296 _values!788) e!452820)))

(assert (=> start!70266 tp!44706))

(declare-fun mapNonEmpty!23146 () Bool)

(declare-fun tp!44707 () Bool)

(assert (=> mapNonEmpty!23146 (= mapRes!23146 (and tp!44707 e!452822))))

(declare-fun mapRest!23146 () (Array (_ BitVec 32) ValueCell!6770))

(declare-fun mapValue!23146 () ValueCell!6770)

(declare-fun mapKey!23146 () (_ BitVec 32))

(assert (=> mapNonEmpty!23146 (= (arr!21519 _values!788) (store mapRest!23146 mapKey!23146 mapValue!23146))))

(declare-fun b!816318 () Bool)

(declare-fun res!557373 () Bool)

(assert (=> b!816318 (=> (not res!557373) (not e!452819))))

(assert (=> b!816318 (= res!557373 (and (= (size!21940 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21941 _keys!976) (size!21940 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816319 () Bool)

(declare-fun res!557372 () Bool)

(assert (=> b!816319 (=> (not res!557372) (not e!452819))))

(declare-datatypes ((List!15344 0))(
  ( (Nil!15341) (Cons!15340 (h!16469 (_ BitVec 64)) (t!21658 List!15344)) )
))
(declare-fun arrayNoDuplicates!0 (array!44925 (_ BitVec 32) List!15344) Bool)

(assert (=> b!816319 (= res!557372 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15341))))

(declare-fun b!816320 () Bool)

(declare-fun res!557371 () Bool)

(assert (=> b!816320 (=> (not res!557371) (not e!452819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44925 (_ BitVec 32)) Bool)

(assert (=> b!816320 (= res!557371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23146 () Bool)

(assert (=> mapIsEmpty!23146 mapRes!23146))

(assert (= (and start!70266 res!557374) b!816318))

(assert (= (and b!816318 res!557373) b!816320))

(assert (= (and b!816320 res!557371) b!816319))

(assert (= (and b!816319 res!557372) b!816314))

(assert (= (and b!816314 (not res!557375)) b!816315))

(assert (= (and b!816313 condMapEmpty!23146) mapIsEmpty!23146))

(assert (= (and b!816313 (not condMapEmpty!23146)) mapNonEmpty!23146))

(get-info :version)

(assert (= (and mapNonEmpty!23146 ((_ is ValueCellFull!6770) mapValue!23146)) b!816316))

(assert (= (and b!816313 ((_ is ValueCellFull!6770) mapDefault!23146)) b!816317))

(assert (= start!70266 b!816313))

(declare-fun m!757439 () Bool)

(assert (=> b!816319 m!757439))

(declare-fun m!757441 () Bool)

(assert (=> b!816320 m!757441))

(declare-fun m!757443 () Bool)

(assert (=> start!70266 m!757443))

(declare-fun m!757445 () Bool)

(assert (=> start!70266 m!757445))

(declare-fun m!757447 () Bool)

(assert (=> start!70266 m!757447))

(declare-fun m!757449 () Bool)

(assert (=> mapNonEmpty!23146 m!757449))

(declare-fun m!757451 () Bool)

(assert (=> b!816314 m!757451))

(declare-fun m!757453 () Bool)

(assert (=> b!816314 m!757453))

(declare-fun m!757455 () Bool)

(assert (=> b!816314 m!757455))

(declare-fun m!757457 () Bool)

(assert (=> b!816315 m!757457))

(declare-fun m!757459 () Bool)

(assert (=> b!816315 m!757459))

(assert (=> b!816315 m!757459))

(declare-fun m!757461 () Bool)

(assert (=> b!816315 m!757461))

(check-sat (not b!816315) (not mapNonEmpty!23146) (not b!816320) (not b_next!12661) b_and!21435 (not b!816319) (not b!816314) (not start!70266) tp_is_empty!14371)
(check-sat b_and!21435 (not b_next!12661))
