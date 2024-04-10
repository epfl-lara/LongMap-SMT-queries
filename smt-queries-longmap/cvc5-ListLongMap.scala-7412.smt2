; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94286 () Bool)

(assert start!94286)

(declare-fun b_free!21649 () Bool)

(declare-fun b_next!21649 () Bool)

(assert (=> start!94286 (= b_free!21649 (not b_next!21649))))

(declare-fun tp!76387 () Bool)

(declare-fun b_and!34421 () Bool)

(assert (=> start!94286 (= tp!76387 b_and!34421)))

(declare-fun b!1066225 () Bool)

(declare-fun e!607959 () Bool)

(declare-fun e!607955 () Bool)

(assert (=> b!1066225 (= e!607959 (not e!607955))))

(declare-fun res!711642 () Bool)

(assert (=> b!1066225 (=> res!711642 e!607955)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066225 (= res!711642 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39081 0))(
  ( (V!39082 (val!12780 Int)) )
))
(declare-datatypes ((tuple2!16204 0))(
  ( (tuple2!16205 (_1!8113 (_ BitVec 64)) (_2!8113 V!39081)) )
))
(declare-datatypes ((List!22768 0))(
  ( (Nil!22765) (Cons!22764 (h!23973 tuple2!16204) (t!32089 List!22768)) )
))
(declare-datatypes ((ListLongMap!14173 0))(
  ( (ListLongMap!14174 (toList!7102 List!22768)) )
))
(declare-fun lt!470591 () ListLongMap!14173)

(declare-fun lt!470594 () ListLongMap!14173)

(assert (=> b!1066225 (= lt!470591 lt!470594)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39081)

(declare-datatypes ((ValueCell!12026 0))(
  ( (ValueCellFull!12026 (v!15393 V!39081)) (EmptyCell!12026) )
))
(declare-datatypes ((array!67903 0))(
  ( (array!67904 (arr!32653 (Array (_ BitVec 32) ValueCell!12026)) (size!33189 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67903)

(declare-fun minValue!907 () V!39081)

(declare-datatypes ((Unit!34999 0))(
  ( (Unit!35000) )
))
(declare-fun lt!470595 () Unit!34999)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39081)

(declare-datatypes ((array!67905 0))(
  ( (array!67906 (arr!32654 (Array (_ BitVec 32) (_ BitVec 64))) (size!33190 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67905)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!725 (array!67905 array!67903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39081 V!39081 V!39081 V!39081 (_ BitVec 32) Int) Unit!34999)

(assert (=> b!1066225 (= lt!470595 (lemmaNoChangeToArrayThenSameMapNoExtras!725 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3688 (array!67905 array!67903 (_ BitVec 32) (_ BitVec 32) V!39081 V!39081 (_ BitVec 32) Int) ListLongMap!14173)

(assert (=> b!1066225 (= lt!470594 (getCurrentListMapNoExtraKeys!3688 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066225 (= lt!470591 (getCurrentListMapNoExtraKeys!3688 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066226 () Bool)

(declare-fun res!711645 () Bool)

(assert (=> b!1066226 (=> (not res!711645) (not e!607959))))

(declare-datatypes ((List!22769 0))(
  ( (Nil!22766) (Cons!22765 (h!23974 (_ BitVec 64)) (t!32090 List!22769)) )
))
(declare-fun arrayNoDuplicates!0 (array!67905 (_ BitVec 32) List!22769) Bool)

(assert (=> b!1066226 (= res!711645 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22766))))

(declare-fun mapNonEmpty!39877 () Bool)

(declare-fun mapRes!39877 () Bool)

(declare-fun tp!76388 () Bool)

(declare-fun e!607960 () Bool)

(assert (=> mapNonEmpty!39877 (= mapRes!39877 (and tp!76388 e!607960))))

(declare-fun mapValue!39877 () ValueCell!12026)

(declare-fun mapRest!39877 () (Array (_ BitVec 32) ValueCell!12026))

(declare-fun mapKey!39877 () (_ BitVec 32))

(assert (=> mapNonEmpty!39877 (= (arr!32653 _values!955) (store mapRest!39877 mapKey!39877 mapValue!39877))))

(declare-fun b!1066227 () Bool)

(declare-fun tp_is_empty!25459 () Bool)

(assert (=> b!1066227 (= e!607960 tp_is_empty!25459)))

(declare-fun b!1066228 () Bool)

(declare-fun e!607958 () Bool)

(assert (=> b!1066228 (= e!607958 tp_is_empty!25459)))

(declare-fun b!1066229 () Bool)

(declare-fun res!711646 () Bool)

(assert (=> b!1066229 (=> (not res!711646) (not e!607959))))

(assert (=> b!1066229 (= res!711646 (and (= (size!33189 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33190 _keys!1163) (size!33189 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066230 () Bool)

(declare-fun res!711643 () Bool)

(assert (=> b!1066230 (=> (not res!711643) (not e!607959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67905 (_ BitVec 32)) Bool)

(assert (=> b!1066230 (= res!711643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066231 () Bool)

(declare-fun e!607957 () Bool)

(assert (=> b!1066231 (= e!607957 (and e!607958 mapRes!39877))))

(declare-fun condMapEmpty!39877 () Bool)

(declare-fun mapDefault!39877 () ValueCell!12026)

