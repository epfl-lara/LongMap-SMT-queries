; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93926 () Bool)

(assert start!93926)

(declare-fun b_free!21391 () Bool)

(declare-fun b_next!21391 () Bool)

(assert (=> start!93926 (= b_free!21391 (not b_next!21391))))

(declare-fun tp!75599 () Bool)

(declare-fun b_and!34087 () Bool)

(assert (=> start!93926 (= tp!75599 b_and!34087)))

(declare-fun b!1062203 () Bool)

(declare-fun res!709306 () Bool)

(declare-fun e!605030 () Bool)

(assert (=> b!1062203 (=> (not res!709306) (not e!605030))))

(declare-datatypes ((array!67352 0))(
  ( (array!67353 (arr!32383 (Array (_ BitVec 32) (_ BitVec 64))) (size!32921 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67352)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67352 (_ BitVec 32)) Bool)

(assert (=> b!1062203 (= res!709306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062204 () Bool)

(declare-fun res!709304 () Bool)

(assert (=> b!1062204 (=> (not res!709304) (not e!605030))))

(declare-datatypes ((List!22624 0))(
  ( (Nil!22621) (Cons!22620 (h!23829 (_ BitVec 64)) (t!31926 List!22624)) )
))
(declare-fun arrayNoDuplicates!0 (array!67352 (_ BitVec 32) List!22624) Bool)

(assert (=> b!1062204 (= res!709304 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22621))))

(declare-fun b!1062205 () Bool)

(declare-fun e!605032 () Bool)

(declare-fun tp_is_empty!25201 () Bool)

(assert (=> b!1062205 (= e!605032 tp_is_empty!25201)))

(declare-fun b!1062206 () Bool)

(declare-fun e!605035 () Bool)

(declare-fun mapRes!39475 () Bool)

(assert (=> b!1062206 (= e!605035 (and e!605032 mapRes!39475))))

(declare-fun condMapEmpty!39475 () Bool)

(declare-datatypes ((V!38737 0))(
  ( (V!38738 (val!12651 Int)) )
))
(declare-datatypes ((ValueCell!11897 0))(
  ( (ValueCellFull!11897 (v!15260 V!38737)) (EmptyCell!11897) )
))
(declare-datatypes ((array!67354 0))(
  ( (array!67355 (arr!32384 (Array (_ BitVec 32) ValueCell!11897)) (size!32922 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67354)

(declare-fun mapDefault!39475 () ValueCell!11897)

(assert (=> b!1062206 (= condMapEmpty!39475 (= (arr!32384 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11897)) mapDefault!39475)))))

(declare-fun b!1062207 () Bool)

(declare-fun e!605033 () Bool)

(assert (=> b!1062207 (= e!605030 (not e!605033))))

(declare-fun res!709305 () Bool)

(assert (=> b!1062207 (=> res!709305 e!605033)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062207 (= res!709305 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!16072 0))(
  ( (tuple2!16073 (_1!8047 (_ BitVec 64)) (_2!8047 V!38737)) )
))
(declare-datatypes ((List!22625 0))(
  ( (Nil!22622) (Cons!22621 (h!23830 tuple2!16072) (t!31927 List!22625)) )
))
(declare-datatypes ((ListLongMap!14041 0))(
  ( (ListLongMap!14042 (toList!7036 List!22625)) )
))
(declare-fun lt!467852 () ListLongMap!14041)

(declare-fun lt!467854 () ListLongMap!14041)

(assert (=> b!1062207 (= lt!467852 lt!467854)))

(declare-fun zeroValueBefore!47 () V!38737)

(declare-datatypes ((Unit!34663 0))(
  ( (Unit!34664) )
))
(declare-fun lt!467853 () Unit!34663)

(declare-fun minValue!907 () V!38737)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38737)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!642 (array!67352 array!67354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38737 V!38737 V!38737 V!38737 (_ BitVec 32) Int) Unit!34663)

(assert (=> b!1062207 (= lt!467853 (lemmaNoChangeToArrayThenSameMapNoExtras!642 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3648 (array!67352 array!67354 (_ BitVec 32) (_ BitVec 32) V!38737 V!38737 (_ BitVec 32) Int) ListLongMap!14041)

(assert (=> b!1062207 (= lt!467854 (getCurrentListMapNoExtraKeys!3648 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062207 (= lt!467852 (getCurrentListMapNoExtraKeys!3648 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062208 () Bool)

(declare-fun e!605031 () Bool)

(assert (=> b!1062208 (= e!605031 tp_is_empty!25201)))

(declare-fun b!1062202 () Bool)

(declare-fun e!605034 () Bool)

(assert (=> b!1062202 (= e!605034 true)))

(declare-fun lt!467856 () ListLongMap!14041)

(declare-fun -!557 (ListLongMap!14041 (_ BitVec 64)) ListLongMap!14041)

(assert (=> b!1062202 (= (-!557 lt!467856 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467856)))

(declare-fun lt!467855 () Unit!34663)

(declare-fun removeNotPresentStillSame!9 (ListLongMap!14041 (_ BitVec 64)) Unit!34663)

(assert (=> b!1062202 (= lt!467855 (removeNotPresentStillSame!9 lt!467856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!709303 () Bool)

(assert (=> start!93926 (=> (not res!709303) (not e!605030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93926 (= res!709303 (validMask!0 mask!1515))))

(assert (=> start!93926 e!605030))

(assert (=> start!93926 true))

(assert (=> start!93926 tp_is_empty!25201))

(declare-fun array_inv!25090 (array!67354) Bool)

(assert (=> start!93926 (and (array_inv!25090 _values!955) e!605035)))

(assert (=> start!93926 tp!75599))

(declare-fun array_inv!25091 (array!67352) Bool)

(assert (=> start!93926 (array_inv!25091 _keys!1163)))

(declare-fun b!1062209 () Bool)

(assert (=> b!1062209 (= e!605033 e!605034)))

(declare-fun res!709307 () Bool)

(assert (=> b!1062209 (=> res!709307 e!605034)))

(declare-fun contains!6205 (ListLongMap!14041 (_ BitVec 64)) Bool)

(assert (=> b!1062209 (= res!709307 (contains!6205 lt!467856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3937 (array!67352 array!67354 (_ BitVec 32) (_ BitVec 32) V!38737 V!38737 (_ BitVec 32) Int) ListLongMap!14041)

(assert (=> b!1062209 (= lt!467856 (getCurrentListMap!3937 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39475 () Bool)

(assert (=> mapIsEmpty!39475 mapRes!39475))

(declare-fun mapNonEmpty!39475 () Bool)

(declare-fun tp!75598 () Bool)

(assert (=> mapNonEmpty!39475 (= mapRes!39475 (and tp!75598 e!605031))))

(declare-fun mapKey!39475 () (_ BitVec 32))

(declare-fun mapValue!39475 () ValueCell!11897)

(declare-fun mapRest!39475 () (Array (_ BitVec 32) ValueCell!11897))

(assert (=> mapNonEmpty!39475 (= (arr!32384 _values!955) (store mapRest!39475 mapKey!39475 mapValue!39475))))

(declare-fun b!1062210 () Bool)

(declare-fun res!709302 () Bool)

(assert (=> b!1062210 (=> (not res!709302) (not e!605030))))

(assert (=> b!1062210 (= res!709302 (and (= (size!32922 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32921 _keys!1163) (size!32922 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93926 res!709303) b!1062210))

(assert (= (and b!1062210 res!709302) b!1062203))

(assert (= (and b!1062203 res!709306) b!1062204))

(assert (= (and b!1062204 res!709304) b!1062207))

(assert (= (and b!1062207 (not res!709305)) b!1062209))

(assert (= (and b!1062209 (not res!709307)) b!1062202))

(assert (= (and b!1062206 condMapEmpty!39475) mapIsEmpty!39475))

(assert (= (and b!1062206 (not condMapEmpty!39475)) mapNonEmpty!39475))

(get-info :version)

(assert (= (and mapNonEmpty!39475 ((_ is ValueCellFull!11897) mapValue!39475)) b!1062208))

(assert (= (and b!1062206 ((_ is ValueCellFull!11897) mapDefault!39475)) b!1062205))

(assert (= start!93926 b!1062206))

(declare-fun m!980485 () Bool)

(assert (=> b!1062209 m!980485))

(declare-fun m!980487 () Bool)

(assert (=> b!1062209 m!980487))

(declare-fun m!980489 () Bool)

(assert (=> mapNonEmpty!39475 m!980489))

(declare-fun m!980491 () Bool)

(assert (=> b!1062202 m!980491))

(declare-fun m!980493 () Bool)

(assert (=> b!1062202 m!980493))

(declare-fun m!980495 () Bool)

(assert (=> start!93926 m!980495))

(declare-fun m!980497 () Bool)

(assert (=> start!93926 m!980497))

(declare-fun m!980499 () Bool)

(assert (=> start!93926 m!980499))

(declare-fun m!980501 () Bool)

(assert (=> b!1062204 m!980501))

(declare-fun m!980503 () Bool)

(assert (=> b!1062207 m!980503))

(declare-fun m!980505 () Bool)

(assert (=> b!1062207 m!980505))

(declare-fun m!980507 () Bool)

(assert (=> b!1062207 m!980507))

(declare-fun m!980509 () Bool)

(assert (=> b!1062203 m!980509))

(check-sat (not b!1062202) (not b_next!21391) (not b!1062207) (not b!1062203) (not mapNonEmpty!39475) (not start!93926) (not b!1062204) tp_is_empty!25201 b_and!34087 (not b!1062209))
(check-sat b_and!34087 (not b_next!21391))
