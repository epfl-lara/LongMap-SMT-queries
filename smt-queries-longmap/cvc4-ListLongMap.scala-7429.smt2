; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94428 () Bool)

(assert start!94428)

(declare-fun b_free!21755 () Bool)

(declare-fun b_next!21755 () Bool)

(assert (=> start!94428 (= b_free!21755 (not b_next!21755))))

(declare-fun tp!76711 () Bool)

(declare-fun b_and!34547 () Bool)

(assert (=> start!94428 (= tp!76711 b_and!34547)))

(declare-fun mapIsEmpty!40042 () Bool)

(declare-fun mapRes!40042 () Bool)

(assert (=> mapIsEmpty!40042 mapRes!40042))

(declare-fun b!1067693 () Bool)

(declare-fun e!609016 () Bool)

(declare-fun e!609012 () Bool)

(assert (=> b!1067693 (= e!609016 (not e!609012))))

(declare-fun res!712478 () Bool)

(assert (=> b!1067693 (=> res!712478 e!609012)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067693 (= res!712478 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39221 0))(
  ( (V!39222 (val!12833 Int)) )
))
(declare-datatypes ((tuple2!16288 0))(
  ( (tuple2!16289 (_1!8155 (_ BitVec 64)) (_2!8155 V!39221)) )
))
(declare-datatypes ((List!22845 0))(
  ( (Nil!22842) (Cons!22841 (h!24050 tuple2!16288) (t!32170 List!22845)) )
))
(declare-datatypes ((ListLongMap!14257 0))(
  ( (ListLongMap!14258 (toList!7144 List!22845)) )
))
(declare-fun lt!471573 () ListLongMap!14257)

(declare-fun lt!471575 () ListLongMap!14257)

(assert (=> b!1067693 (= lt!471573 lt!471575)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39221)

(declare-fun minValue!907 () V!39221)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12079 0))(
  ( (ValueCellFull!12079 (v!15447 V!39221)) (EmptyCell!12079) )
))
(declare-datatypes ((array!68113 0))(
  ( (array!68114 (arr!32756 (Array (_ BitVec 32) ValueCell!12079)) (size!33292 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68113)

(declare-datatypes ((Unit!35085 0))(
  ( (Unit!35086) )
))
(declare-fun lt!471574 () Unit!35085)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39221)

(declare-datatypes ((array!68115 0))(
  ( (array!68116 (arr!32757 (Array (_ BitVec 32) (_ BitVec 64))) (size!33293 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68115)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!764 (array!68115 array!68113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39221 V!39221 V!39221 V!39221 (_ BitVec 32) Int) Unit!35085)

(assert (=> b!1067693 (= lt!471574 (lemmaNoChangeToArrayThenSameMapNoExtras!764 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3727 (array!68115 array!68113 (_ BitVec 32) (_ BitVec 32) V!39221 V!39221 (_ BitVec 32) Int) ListLongMap!14257)

(assert (=> b!1067693 (= lt!471575 (getCurrentListMapNoExtraKeys!3727 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067693 (= lt!471573 (getCurrentListMapNoExtraKeys!3727 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40042 () Bool)

(declare-fun tp!76712 () Bool)

(declare-fun e!609014 () Bool)

(assert (=> mapNonEmpty!40042 (= mapRes!40042 (and tp!76712 e!609014))))

(declare-fun mapKey!40042 () (_ BitVec 32))

(declare-fun mapValue!40042 () ValueCell!12079)

(declare-fun mapRest!40042 () (Array (_ BitVec 32) ValueCell!12079))

(assert (=> mapNonEmpty!40042 (= (arr!32756 _values!955) (store mapRest!40042 mapKey!40042 mapValue!40042))))

(declare-fun b!1067694 () Bool)

(declare-fun e!609011 () Bool)

(assert (=> b!1067694 (= e!609011 true)))

(declare-fun lt!471577 () ListLongMap!14257)

(declare-fun -!631 (ListLongMap!14257 (_ BitVec 64)) ListLongMap!14257)

(assert (=> b!1067694 (= (-!631 lt!471577 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471577)))

(declare-fun lt!471576 () Unit!35085)

(declare-fun removeNotPresentStillSame!41 (ListLongMap!14257 (_ BitVec 64)) Unit!35085)

(assert (=> b!1067694 (= lt!471576 (removeNotPresentStillSame!41 lt!471577 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1067695 () Bool)

(declare-fun e!609010 () Bool)

(declare-fun e!609013 () Bool)

(assert (=> b!1067695 (= e!609010 (and e!609013 mapRes!40042))))

(declare-fun condMapEmpty!40042 () Bool)

(declare-fun mapDefault!40042 () ValueCell!12079)

