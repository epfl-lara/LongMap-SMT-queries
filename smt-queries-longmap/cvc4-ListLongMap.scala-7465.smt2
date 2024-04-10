; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94718 () Bool)

(assert start!94718)

(declare-fun b_free!21971 () Bool)

(declare-fun b_next!21971 () Bool)

(assert (=> start!94718 (= b_free!21971 (not b_next!21971))))

(declare-fun tp!77371 () Bool)

(declare-fun b_and!34801 () Bool)

(assert (=> start!94718 (= tp!77371 b_and!34801)))

(declare-fun mapNonEmpty!40378 () Bool)

(declare-fun mapRes!40378 () Bool)

(declare-fun tp!77372 () Bool)

(declare-fun e!611384 () Bool)

(assert (=> mapNonEmpty!40378 (= mapRes!40378 (and tp!77372 e!611384))))

(declare-fun mapKey!40378 () (_ BitVec 32))

(declare-datatypes ((V!39509 0))(
  ( (V!39510 (val!12941 Int)) )
))
(declare-datatypes ((ValueCell!12187 0))(
  ( (ValueCellFull!12187 (v!15557 V!39509)) (EmptyCell!12187) )
))
(declare-fun mapValue!40378 () ValueCell!12187)

(declare-datatypes ((array!68539 0))(
  ( (array!68540 (arr!32965 (Array (_ BitVec 32) ValueCell!12187)) (size!33501 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68539)

(declare-fun mapRest!40378 () (Array (_ BitVec 32) ValueCell!12187))

(assert (=> mapNonEmpty!40378 (= (arr!32965 _values!955) (store mapRest!40378 mapKey!40378 mapValue!40378))))

(declare-fun b!1070913 () Bool)

(declare-fun e!611385 () Bool)

(declare-fun tp_is_empty!25781 () Bool)

(assert (=> b!1070913 (= e!611385 tp_is_empty!25781)))

(declare-datatypes ((tuple2!16462 0))(
  ( (tuple2!16463 (_1!8242 (_ BitVec 64)) (_2!8242 V!39509)) )
))
(declare-datatypes ((List!23004 0))(
  ( (Nil!23001) (Cons!23000 (h!24209 tuple2!16462) (t!32337 List!23004)) )
))
(declare-datatypes ((ListLongMap!14431 0))(
  ( (ListLongMap!14432 (toList!7231 List!23004)) )
))
(declare-fun lt!473361 () ListLongMap!14431)

(declare-fun lt!473360 () ListLongMap!14431)

(declare-fun e!611389 () Bool)

(declare-fun lt!473362 () tuple2!16462)

(declare-fun b!1070914 () Bool)

(declare-fun +!3166 (ListLongMap!14431 tuple2!16462) ListLongMap!14431)

(assert (=> b!1070914 (= e!611389 (= lt!473360 (+!3166 lt!473361 lt!473362)))))

(declare-fun b!1070915 () Bool)

(declare-fun res!714390 () Bool)

(declare-fun e!611388 () Bool)

(assert (=> b!1070915 (=> (not res!714390) (not e!611388))))

(declare-datatypes ((array!68541 0))(
  ( (array!68542 (arr!32966 (Array (_ BitVec 32) (_ BitVec 64))) (size!33502 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68541)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68541 (_ BitVec 32)) Bool)

(assert (=> b!1070915 (= res!714390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070916 () Bool)

(declare-fun res!714389 () Bool)

(assert (=> b!1070916 (=> (not res!714389) (not e!611388))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070916 (= res!714389 (and (= (size!33501 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33502 _keys!1163) (size!33501 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40378 () Bool)

(assert (=> mapIsEmpty!40378 mapRes!40378))

(declare-fun b!1070917 () Bool)

(declare-fun res!714394 () Bool)

(assert (=> b!1070917 (=> (not res!714394) (not e!611388))))

(declare-datatypes ((List!23005 0))(
  ( (Nil!23002) (Cons!23001 (h!24210 (_ BitVec 64)) (t!32338 List!23005)) )
))
(declare-fun arrayNoDuplicates!0 (array!68541 (_ BitVec 32) List!23005) Bool)

(assert (=> b!1070917 (= res!714394 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23002))))

(declare-fun b!1070918 () Bool)

(declare-fun e!611386 () Bool)

(assert (=> b!1070918 (= e!611388 (not e!611386))))

(declare-fun res!714393 () Bool)

(assert (=> b!1070918 (=> res!714393 e!611386)))

(assert (=> b!1070918 (= res!714393 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473365 () ListLongMap!14431)

(assert (=> b!1070918 (= lt!473365 lt!473361)))

(declare-fun zeroValueBefore!47 () V!39509)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39509)

(declare-fun minValue!907 () V!39509)

(declare-datatypes ((Unit!35258 0))(
  ( (Unit!35259) )
))
(declare-fun lt!473366 () Unit!35258)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!842 (array!68541 array!68539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39509 V!39509 V!39509 V!39509 (_ BitVec 32) Int) Unit!35258)

(assert (=> b!1070918 (= lt!473366 (lemmaNoChangeToArrayThenSameMapNoExtras!842 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3805 (array!68541 array!68539 (_ BitVec 32) (_ BitVec 32) V!39509 V!39509 (_ BitVec 32) Int) ListLongMap!14431)

(assert (=> b!1070918 (= lt!473361 (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070918 (= lt!473365 (getCurrentListMapNoExtraKeys!3805 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070919 () Bool)

(declare-fun e!611387 () Bool)

(assert (=> b!1070919 (= e!611387 (and e!611385 mapRes!40378))))

(declare-fun condMapEmpty!40378 () Bool)

(declare-fun mapDefault!40378 () ValueCell!12187)

