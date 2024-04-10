; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94586 () Bool)

(assert start!94586)

(declare-fun b_free!21869 () Bool)

(declare-fun b_next!21869 () Bool)

(assert (=> start!94586 (= b_free!21869 (not b_next!21869))))

(declare-fun tp!77059 () Bool)

(declare-fun b_and!34681 () Bool)

(assert (=> start!94586 (= tp!77059 b_and!34681)))

(declare-fun b!1069512 () Bool)

(declare-fun e!610377 () Bool)

(assert (=> b!1069512 (= e!610377 (not true))))

(declare-datatypes ((V!39373 0))(
  ( (V!39374 (val!12890 Int)) )
))
(declare-datatypes ((tuple2!16384 0))(
  ( (tuple2!16385 (_1!8203 (_ BitVec 64)) (_2!8203 V!39373)) )
))
(declare-datatypes ((List!22928 0))(
  ( (Nil!22925) (Cons!22924 (h!24133 tuple2!16384) (t!32257 List!22928)) )
))
(declare-datatypes ((ListLongMap!14353 0))(
  ( (ListLongMap!14354 (toList!7192 List!22928)) )
))
(declare-fun lt!472642 () ListLongMap!14353)

(declare-fun lt!472643 () ListLongMap!14353)

(assert (=> b!1069512 (= lt!472642 lt!472643)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39373)

(declare-datatypes ((Unit!35183 0))(
  ( (Unit!35184) )
))
(declare-fun lt!472644 () Unit!35183)

(declare-datatypes ((ValueCell!12136 0))(
  ( (ValueCellFull!12136 (v!15506 V!39373)) (EmptyCell!12136) )
))
(declare-datatypes ((array!68337 0))(
  ( (array!68338 (arr!32866 (Array (_ BitVec 32) ValueCell!12136)) (size!33402 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68337)

(declare-fun minValue!907 () V!39373)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39373)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68339 0))(
  ( (array!68340 (arr!32867 (Array (_ BitVec 32) (_ BitVec 64))) (size!33403 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68339)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!805 (array!68339 array!68337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39373 V!39373 V!39373 V!39373 (_ BitVec 32) Int) Unit!35183)

(assert (=> b!1069512 (= lt!472644 (lemmaNoChangeToArrayThenSameMapNoExtras!805 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3768 (array!68339 array!68337 (_ BitVec 32) (_ BitVec 32) V!39373 V!39373 (_ BitVec 32) Int) ListLongMap!14353)

(assert (=> b!1069512 (= lt!472643 (getCurrentListMapNoExtraKeys!3768 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069512 (= lt!472642 (getCurrentListMapNoExtraKeys!3768 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069513 () Bool)

(declare-fun res!713592 () Bool)

(assert (=> b!1069513 (=> (not res!713592) (not e!610377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68339 (_ BitVec 32)) Bool)

(assert (=> b!1069513 (= res!713592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069514 () Bool)

(declare-fun res!713591 () Bool)

(assert (=> b!1069514 (=> (not res!713591) (not e!610377))))

(assert (=> b!1069514 (= res!713591 (and (= (size!33402 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33403 _keys!1163) (size!33402 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40219 () Bool)

(declare-fun mapRes!40219 () Bool)

(declare-fun tp!77060 () Bool)

(declare-fun e!610376 () Bool)

(assert (=> mapNonEmpty!40219 (= mapRes!40219 (and tp!77060 e!610376))))

(declare-fun mapKey!40219 () (_ BitVec 32))

(declare-fun mapRest!40219 () (Array (_ BitVec 32) ValueCell!12136))

(declare-fun mapValue!40219 () ValueCell!12136)

(assert (=> mapNonEmpty!40219 (= (arr!32866 _values!955) (store mapRest!40219 mapKey!40219 mapValue!40219))))

(declare-fun mapIsEmpty!40219 () Bool)

(assert (=> mapIsEmpty!40219 mapRes!40219))

(declare-fun res!713594 () Bool)

(assert (=> start!94586 (=> (not res!713594) (not e!610377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94586 (= res!713594 (validMask!0 mask!1515))))

(assert (=> start!94586 e!610377))

(assert (=> start!94586 true))

(declare-fun tp_is_empty!25679 () Bool)

(assert (=> start!94586 tp_is_empty!25679))

(declare-fun e!610373 () Bool)

(declare-fun array_inv!25436 (array!68337) Bool)

(assert (=> start!94586 (and (array_inv!25436 _values!955) e!610373)))

(assert (=> start!94586 tp!77059))

(declare-fun array_inv!25437 (array!68339) Bool)

(assert (=> start!94586 (array_inv!25437 _keys!1163)))

(declare-fun b!1069515 () Bool)

(declare-fun res!713593 () Bool)

(assert (=> b!1069515 (=> (not res!713593) (not e!610377))))

(declare-datatypes ((List!22929 0))(
  ( (Nil!22926) (Cons!22925 (h!24134 (_ BitVec 64)) (t!32258 List!22929)) )
))
(declare-fun arrayNoDuplicates!0 (array!68339 (_ BitVec 32) List!22929) Bool)

(assert (=> b!1069515 (= res!713593 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22926))))

(declare-fun b!1069516 () Bool)

(declare-fun e!610374 () Bool)

(assert (=> b!1069516 (= e!610373 (and e!610374 mapRes!40219))))

(declare-fun condMapEmpty!40219 () Bool)

(declare-fun mapDefault!40219 () ValueCell!12136)

