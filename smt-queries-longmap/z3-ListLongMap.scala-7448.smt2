; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94576 () Bool)

(assert start!94576)

(declare-fun b_free!21865 () Bool)

(declare-fun b_next!21865 () Bool)

(assert (=> start!94576 (= b_free!21865 (not b_next!21865))))

(declare-fun tp!77048 () Bool)

(declare-fun b_and!34651 () Bool)

(assert (=> start!94576 (= tp!77048 b_and!34651)))

(declare-fun b!1069317 () Bool)

(declare-fun e!610252 () Bool)

(declare-fun e!610253 () Bool)

(declare-fun mapRes!40213 () Bool)

(assert (=> b!1069317 (= e!610252 (and e!610253 mapRes!40213))))

(declare-fun condMapEmpty!40213 () Bool)

(declare-datatypes ((V!39369 0))(
  ( (V!39370 (val!12888 Int)) )
))
(declare-datatypes ((ValueCell!12134 0))(
  ( (ValueCellFull!12134 (v!15503 V!39369)) (EmptyCell!12134) )
))
(declare-datatypes ((array!68272 0))(
  ( (array!68273 (arr!32834 (Array (_ BitVec 32) ValueCell!12134)) (size!33372 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68272)

(declare-fun mapDefault!40213 () ValueCell!12134)

(assert (=> b!1069317 (= condMapEmpty!40213 (= (arr!32834 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12134)) mapDefault!40213)))))

(declare-fun mapIsEmpty!40213 () Bool)

(assert (=> mapIsEmpty!40213 mapRes!40213))

(declare-fun b!1069318 () Bool)

(declare-fun e!610251 () Bool)

(assert (=> b!1069318 (= e!610251 (not true))))

(declare-datatypes ((tuple2!16436 0))(
  ( (tuple2!16437 (_1!8229 (_ BitVec 64)) (_2!8229 V!39369)) )
))
(declare-datatypes ((List!22969 0))(
  ( (Nil!22966) (Cons!22965 (h!24174 tuple2!16436) (t!32289 List!22969)) )
))
(declare-datatypes ((ListLongMap!14405 0))(
  ( (ListLongMap!14406 (toList!7218 List!22969)) )
))
(declare-fun lt!472424 () ListLongMap!14405)

(declare-fun lt!472425 () ListLongMap!14405)

(assert (=> b!1069318 (= lt!472424 lt!472425)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39369)

(declare-datatypes ((Unit!35024 0))(
  ( (Unit!35025) )
))
(declare-fun lt!472426 () Unit!35024)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39369)

(declare-fun minValue!907 () V!39369)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68274 0))(
  ( (array!68275 (arr!32835 (Array (_ BitVec 32) (_ BitVec 64))) (size!33373 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68274)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!801 (array!68274 array!68272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39369 V!39369 V!39369 V!39369 (_ BitVec 32) Int) Unit!35024)

(assert (=> b!1069318 (= lt!472426 (lemmaNoChangeToArrayThenSameMapNoExtras!801 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3807 (array!68274 array!68272 (_ BitVec 32) (_ BitVec 32) V!39369 V!39369 (_ BitVec 32) Int) ListLongMap!14405)

(assert (=> b!1069318 (= lt!472425 (getCurrentListMapNoExtraKeys!3807 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069318 (= lt!472424 (getCurrentListMapNoExtraKeys!3807 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069319 () Bool)

(declare-fun tp_is_empty!25675 () Bool)

(assert (=> b!1069319 (= e!610253 tp_is_empty!25675)))

(declare-fun b!1069320 () Bool)

(declare-fun e!610250 () Bool)

(assert (=> b!1069320 (= e!610250 tp_is_empty!25675)))

(declare-fun b!1069321 () Bool)

(declare-fun res!713501 () Bool)

(assert (=> b!1069321 (=> (not res!713501) (not e!610251))))

(declare-datatypes ((List!22970 0))(
  ( (Nil!22967) (Cons!22966 (h!24175 (_ BitVec 64)) (t!32290 List!22970)) )
))
(declare-fun arrayNoDuplicates!0 (array!68274 (_ BitVec 32) List!22970) Bool)

(assert (=> b!1069321 (= res!713501 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22967))))

(declare-fun b!1069322 () Bool)

(declare-fun res!713499 () Bool)

(assert (=> b!1069322 (=> (not res!713499) (not e!610251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68274 (_ BitVec 32)) Bool)

(assert (=> b!1069322 (= res!713499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069323 () Bool)

(declare-fun res!713498 () Bool)

(assert (=> b!1069323 (=> (not res!713498) (not e!610251))))

(assert (=> b!1069323 (= res!713498 (and (= (size!33372 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33373 _keys!1163) (size!33372 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!713500 () Bool)

(assert (=> start!94576 (=> (not res!713500) (not e!610251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94576 (= res!713500 (validMask!0 mask!1515))))

(assert (=> start!94576 e!610251))

(assert (=> start!94576 true))

(assert (=> start!94576 tp_is_empty!25675))

(declare-fun array_inv!25412 (array!68272) Bool)

(assert (=> start!94576 (and (array_inv!25412 _values!955) e!610252)))

(assert (=> start!94576 tp!77048))

(declare-fun array_inv!25413 (array!68274) Bool)

(assert (=> start!94576 (array_inv!25413 _keys!1163)))

(declare-fun mapNonEmpty!40213 () Bool)

(declare-fun tp!77047 () Bool)

(assert (=> mapNonEmpty!40213 (= mapRes!40213 (and tp!77047 e!610250))))

(declare-fun mapValue!40213 () ValueCell!12134)

(declare-fun mapKey!40213 () (_ BitVec 32))

(declare-fun mapRest!40213 () (Array (_ BitVec 32) ValueCell!12134))

(assert (=> mapNonEmpty!40213 (= (arr!32834 _values!955) (store mapRest!40213 mapKey!40213 mapValue!40213))))

(assert (= (and start!94576 res!713500) b!1069323))

(assert (= (and b!1069323 res!713498) b!1069322))

(assert (= (and b!1069322 res!713499) b!1069321))

(assert (= (and b!1069321 res!713501) b!1069318))

(assert (= (and b!1069317 condMapEmpty!40213) mapIsEmpty!40213))

(assert (= (and b!1069317 (not condMapEmpty!40213)) mapNonEmpty!40213))

(get-info :version)

(assert (= (and mapNonEmpty!40213 ((_ is ValueCellFull!12134) mapValue!40213)) b!1069320))

(assert (= (and b!1069317 ((_ is ValueCellFull!12134) mapDefault!40213)) b!1069319))

(assert (= start!94576 b!1069317))

(declare-fun m!987349 () Bool)

(assert (=> b!1069321 m!987349))

(declare-fun m!987351 () Bool)

(assert (=> mapNonEmpty!40213 m!987351))

(declare-fun m!987353 () Bool)

(assert (=> b!1069318 m!987353))

(declare-fun m!987355 () Bool)

(assert (=> b!1069318 m!987355))

(declare-fun m!987357 () Bool)

(assert (=> b!1069318 m!987357))

(declare-fun m!987359 () Bool)

(assert (=> b!1069322 m!987359))

(declare-fun m!987361 () Bool)

(assert (=> start!94576 m!987361))

(declare-fun m!987363 () Bool)

(assert (=> start!94576 m!987363))

(declare-fun m!987365 () Bool)

(assert (=> start!94576 m!987365))

(check-sat (not start!94576) (not b!1069322) (not b!1069318) (not mapNonEmpty!40213) (not b!1069321) (not b_next!21865) b_and!34651 tp_is_empty!25675)
(check-sat b_and!34651 (not b_next!21865))
