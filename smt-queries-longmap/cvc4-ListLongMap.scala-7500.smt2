; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95046 () Bool)

(assert start!95046)

(declare-fun b_free!22181 () Bool)

(declare-fun b_next!22181 () Bool)

(assert (=> start!95046 (= b_free!22181 (not b_next!22181))))

(declare-fun tp!78020 () Bool)

(declare-fun b_and!35077 () Bool)

(assert (=> start!95046 (= tp!78020 b_and!35077)))

(declare-fun b!1074501 () Bool)

(declare-fun res!716472 () Bool)

(declare-fun e!613990 () Bool)

(assert (=> b!1074501 (=> (not res!716472) (not e!613990))))

(declare-datatypes ((array!68949 0))(
  ( (array!68950 (arr!33164 (Array (_ BitVec 32) (_ BitVec 64))) (size!33700 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68949)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68949 (_ BitVec 32)) Bool)

(assert (=> b!1074501 (= res!716472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074502 () Bool)

(declare-fun res!716468 () Bool)

(assert (=> b!1074502 (=> (not res!716468) (not e!613990))))

(declare-datatypes ((List!23156 0))(
  ( (Nil!23153) (Cons!23152 (h!24361 (_ BitVec 64)) (t!32501 List!23156)) )
))
(declare-fun arrayNoDuplicates!0 (array!68949 (_ BitVec 32) List!23156) Bool)

(assert (=> b!1074502 (= res!716468 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23153))))

(declare-fun b!1074503 () Bool)

(declare-fun e!613987 () Bool)

(declare-fun e!613993 () Bool)

(assert (=> b!1074503 (= e!613987 e!613993)))

(declare-fun res!716470 () Bool)

(assert (=> b!1074503 (=> res!716470 e!613993)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074503 (= res!716470 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1074504 () Bool)

(declare-fun e!613992 () Bool)

(declare-fun tp_is_empty!25991 () Bool)

(assert (=> b!1074504 (= e!613992 tp_is_empty!25991)))

(declare-fun b!1074505 () Bool)

(declare-fun res!716471 () Bool)

(assert (=> b!1074505 (=> (not res!716471) (not e!613990))))

(declare-datatypes ((V!39789 0))(
  ( (V!39790 (val!13046 Int)) )
))
(declare-datatypes ((ValueCell!12292 0))(
  ( (ValueCellFull!12292 (v!15667 V!39789)) (EmptyCell!12292) )
))
(declare-datatypes ((array!68951 0))(
  ( (array!68952 (arr!33165 (Array (_ BitVec 32) ValueCell!12292)) (size!33701 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68951)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1074505 (= res!716471 (and (= (size!33701 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33700 _keys!1163) (size!33701 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16620 0))(
  ( (tuple2!16621 (_1!8321 (_ BitVec 64)) (_2!8321 V!39789)) )
))
(declare-datatypes ((List!23157 0))(
  ( (Nil!23154) (Cons!23153 (h!24362 tuple2!16620) (t!32502 List!23157)) )
))
(declare-datatypes ((ListLongMap!14589 0))(
  ( (ListLongMap!14590 (toList!7310 List!23157)) )
))
(declare-fun lt!476677 () ListLongMap!14589)

(declare-fun b!1074506 () Bool)

(declare-fun minValue!907 () V!39789)

(declare-fun e!613989 () Bool)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39789)

(declare-fun getCurrentListMap!4180 (array!68949 array!68951 (_ BitVec 32) (_ BitVec 32) V!39789 V!39789 (_ BitVec 32) Int) ListLongMap!14589)

(assert (=> b!1074506 (= e!613989 (= (getCurrentListMap!4180 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476677))))

(declare-fun zeroValueBefore!47 () V!39789)

(declare-fun b!1074507 () Bool)

(declare-fun lt!476676 () ListLongMap!14589)

(declare-fun +!3219 (ListLongMap!14589 tuple2!16620) ListLongMap!14589)

(assert (=> b!1074507 (= e!613993 (= (getCurrentListMap!4180 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3219 lt!476676 (tuple2!16621 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun mapNonEmpty!40711 () Bool)

(declare-fun mapRes!40711 () Bool)

(declare-fun tp!78019 () Bool)

(assert (=> mapNonEmpty!40711 (= mapRes!40711 (and tp!78019 e!613992))))

(declare-fun mapValue!40711 () ValueCell!12292)

(declare-fun mapRest!40711 () (Array (_ BitVec 32) ValueCell!12292))

(declare-fun mapKey!40711 () (_ BitVec 32))

(assert (=> mapNonEmpty!40711 (= (arr!33165 _values!955) (store mapRest!40711 mapKey!40711 mapValue!40711))))

(declare-fun res!716473 () Bool)

(assert (=> start!95046 (=> (not res!716473) (not e!613990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95046 (= res!716473 (validMask!0 mask!1515))))

(assert (=> start!95046 e!613990))

(assert (=> start!95046 true))

(assert (=> start!95046 tp_is_empty!25991))

(declare-fun e!613988 () Bool)

(declare-fun array_inv!25632 (array!68951) Bool)

(assert (=> start!95046 (and (array_inv!25632 _values!955) e!613988)))

(assert (=> start!95046 tp!78020))

(declare-fun array_inv!25633 (array!68949) Bool)

(assert (=> start!95046 (array_inv!25633 _keys!1163)))

(declare-fun mapIsEmpty!40711 () Bool)

(assert (=> mapIsEmpty!40711 mapRes!40711))

(declare-fun b!1074508 () Bool)

(assert (=> b!1074508 (= e!613990 (not e!613989))))

(declare-fun res!716474 () Bool)

(assert (=> b!1074508 (=> res!716474 e!613989)))

(assert (=> b!1074508 (= res!716474 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1074508 e!613987))

(declare-fun res!716469 () Bool)

(assert (=> b!1074508 (=> (not res!716469) (not e!613987))))

(assert (=> b!1074508 (= res!716469 (= lt!476676 lt!476677))))

(declare-datatypes ((Unit!35383 0))(
  ( (Unit!35384) )
))
(declare-fun lt!476675 () Unit!35383)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!889 (array!68949 array!68951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39789 V!39789 V!39789 V!39789 (_ BitVec 32) Int) Unit!35383)

(assert (=> b!1074508 (= lt!476675 (lemmaNoChangeToArrayThenSameMapNoExtras!889 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3873 (array!68949 array!68951 (_ BitVec 32) (_ BitVec 32) V!39789 V!39789 (_ BitVec 32) Int) ListLongMap!14589)

(assert (=> b!1074508 (= lt!476677 (getCurrentListMapNoExtraKeys!3873 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074508 (= lt!476676 (getCurrentListMapNoExtraKeys!3873 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074509 () Bool)

(declare-fun e!613991 () Bool)

(assert (=> b!1074509 (= e!613988 (and e!613991 mapRes!40711))))

(declare-fun condMapEmpty!40711 () Bool)

(declare-fun mapDefault!40711 () ValueCell!12292)

