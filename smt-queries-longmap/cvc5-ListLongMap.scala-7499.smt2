; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95018 () Bool)

(assert start!95018)

(declare-fun b_free!22171 () Bool)

(declare-fun b_next!22171 () Bool)

(assert (=> start!95018 (= b_free!22171 (not b_next!22171))))

(declare-fun tp!77987 () Bool)

(declare-fun b_and!35055 () Bool)

(assert (=> start!95018 (= tp!77987 b_and!35055)))

(declare-fun b!1074190 () Bool)

(declare-fun e!613771 () Bool)

(declare-fun tp_is_empty!25981 () Bool)

(assert (=> b!1074190 (= e!613771 tp_is_empty!25981)))

(declare-fun mapIsEmpty!40693 () Bool)

(declare-fun mapRes!40693 () Bool)

(assert (=> mapIsEmpty!40693 mapRes!40693))

(declare-fun b!1074191 () Bool)

(declare-fun res!716307 () Bool)

(declare-fun e!613772 () Bool)

(assert (=> b!1074191 (=> (not res!716307) (not e!613772))))

(declare-datatypes ((array!68927 0))(
  ( (array!68928 (arr!33154 (Array (_ BitVec 32) (_ BitVec 64))) (size!33690 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68927)

(declare-datatypes ((List!23146 0))(
  ( (Nil!23143) (Cons!23142 (h!24351 (_ BitVec 64)) (t!32489 List!23146)) )
))
(declare-fun arrayNoDuplicates!0 (array!68927 (_ BitVec 32) List!23146) Bool)

(assert (=> b!1074191 (= res!716307 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23143))))

(declare-fun b!1074192 () Bool)

(declare-fun e!613773 () Bool)

(assert (=> b!1074192 (= e!613772 (not e!613773))))

(declare-fun res!716305 () Bool)

(assert (=> b!1074192 (=> res!716305 e!613773)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074192 (= res!716305 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39777 0))(
  ( (V!39778 (val!13041 Int)) )
))
(declare-datatypes ((tuple2!16610 0))(
  ( (tuple2!16611 (_1!8316 (_ BitVec 64)) (_2!8316 V!39777)) )
))
(declare-datatypes ((List!23147 0))(
  ( (Nil!23144) (Cons!23143 (h!24352 tuple2!16610) (t!32490 List!23147)) )
))
(declare-datatypes ((ListLongMap!14579 0))(
  ( (ListLongMap!14580 (toList!7305 List!23147)) )
))
(declare-fun lt!476486 () ListLongMap!14579)

(declare-fun lt!476485 () ListLongMap!14579)

(assert (=> b!1074192 (= lt!476486 lt!476485)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((Unit!35371 0))(
  ( (Unit!35372) )
))
(declare-fun lt!476484 () Unit!35371)

(declare-datatypes ((ValueCell!12287 0))(
  ( (ValueCellFull!12287 (v!15661 V!39777)) (EmptyCell!12287) )
))
(declare-datatypes ((array!68929 0))(
  ( (array!68930 (arr!33155 (Array (_ BitVec 32) ValueCell!12287)) (size!33691 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68929)

(declare-fun minValue!907 () V!39777)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39777)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39777)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!884 (array!68927 array!68929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39777 V!39777 V!39777 V!39777 (_ BitVec 32) Int) Unit!35371)

(assert (=> b!1074192 (= lt!476484 (lemmaNoChangeToArrayThenSameMapNoExtras!884 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3868 (array!68927 array!68929 (_ BitVec 32) (_ BitVec 32) V!39777 V!39777 (_ BitVec 32) Int) ListLongMap!14579)

(assert (=> b!1074192 (= lt!476485 (getCurrentListMapNoExtraKeys!3868 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074192 (= lt!476486 (getCurrentListMapNoExtraKeys!3868 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074193 () Bool)

(declare-fun res!716306 () Bool)

(assert (=> b!1074193 (=> (not res!716306) (not e!613772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68927 (_ BitVec 32)) Bool)

(assert (=> b!1074193 (= res!716306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!716304 () Bool)

(assert (=> start!95018 (=> (not res!716304) (not e!613772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95018 (= res!716304 (validMask!0 mask!1515))))

(assert (=> start!95018 e!613772))

(assert (=> start!95018 true))

(assert (=> start!95018 tp_is_empty!25981))

(declare-fun e!613776 () Bool)

(declare-fun array_inv!25622 (array!68929) Bool)

(assert (=> start!95018 (and (array_inv!25622 _values!955) e!613776)))

(assert (=> start!95018 tp!77987))

(declare-fun array_inv!25623 (array!68927) Bool)

(assert (=> start!95018 (array_inv!25623 _keys!1163)))

(declare-fun mapNonEmpty!40693 () Bool)

(declare-fun tp!77986 () Bool)

(declare-fun e!613775 () Bool)

(assert (=> mapNonEmpty!40693 (= mapRes!40693 (and tp!77986 e!613775))))

(declare-fun mapKey!40693 () (_ BitVec 32))

(declare-fun mapValue!40693 () ValueCell!12287)

(declare-fun mapRest!40693 () (Array (_ BitVec 32) ValueCell!12287))

(assert (=> mapNonEmpty!40693 (= (arr!33155 _values!955) (store mapRest!40693 mapKey!40693 mapValue!40693))))

(declare-fun b!1074194 () Bool)

(assert (=> b!1074194 (= e!613776 (and e!613771 mapRes!40693))))

(declare-fun condMapEmpty!40693 () Bool)

(declare-fun mapDefault!40693 () ValueCell!12287)

