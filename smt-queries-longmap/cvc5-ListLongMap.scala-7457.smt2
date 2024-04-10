; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94650 () Bool)

(assert start!94650)

(declare-fun b_free!21919 () Bool)

(declare-fun b_next!21919 () Bool)

(assert (=> start!94650 (= b_free!21919 (not b_next!21919))))

(declare-fun tp!77212 () Bool)

(declare-fun b_and!34739 () Bool)

(assert (=> start!94650 (= tp!77212 b_and!34739)))

(declare-fun b!1070133 () Bool)

(declare-fun e!610815 () Bool)

(declare-fun e!610818 () Bool)

(assert (=> b!1070133 (= e!610815 (not e!610818))))

(declare-fun res!713936 () Bool)

(assert (=> b!1070133 (=> res!713936 e!610818)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070133 (= res!713936 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39441 0))(
  ( (V!39442 (val!12915 Int)) )
))
(declare-datatypes ((tuple2!16420 0))(
  ( (tuple2!16421 (_1!8221 (_ BitVec 64)) (_2!8221 V!39441)) )
))
(declare-datatypes ((List!22962 0))(
  ( (Nil!22959) (Cons!22958 (h!24167 tuple2!16420) (t!32293 List!22962)) )
))
(declare-datatypes ((ListLongMap!14389 0))(
  ( (ListLongMap!14390 (toList!7210 List!22962)) )
))
(declare-fun lt!472918 () ListLongMap!14389)

(declare-fun lt!472921 () ListLongMap!14389)

(assert (=> b!1070133 (= lt!472918 lt!472921)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39441)

(declare-datatypes ((Unit!35219 0))(
  ( (Unit!35220) )
))
(declare-fun lt!472919 () Unit!35219)

(declare-datatypes ((ValueCell!12161 0))(
  ( (ValueCellFull!12161 (v!15531 V!39441)) (EmptyCell!12161) )
))
(declare-datatypes ((array!68435 0))(
  ( (array!68436 (arr!32914 (Array (_ BitVec 32) ValueCell!12161)) (size!33450 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68435)

(declare-fun minValue!907 () V!39441)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39441)

(declare-datatypes ((array!68437 0))(
  ( (array!68438 (arr!32915 (Array (_ BitVec 32) (_ BitVec 64))) (size!33451 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68437)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!823 (array!68437 array!68435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39441 V!39441 V!39441 V!39441 (_ BitVec 32) Int) Unit!35219)

(assert (=> b!1070133 (= lt!472919 (lemmaNoChangeToArrayThenSameMapNoExtras!823 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3786 (array!68437 array!68435 (_ BitVec 32) (_ BitVec 32) V!39441 V!39441 (_ BitVec 32) Int) ListLongMap!14389)

(assert (=> b!1070133 (= lt!472921 (getCurrentListMapNoExtraKeys!3786 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070133 (= lt!472918 (getCurrentListMapNoExtraKeys!3786 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40297 () Bool)

(declare-fun mapRes!40297 () Bool)

(declare-fun tp!77213 () Bool)

(declare-fun e!610817 () Bool)

(assert (=> mapNonEmpty!40297 (= mapRes!40297 (and tp!77213 e!610817))))

(declare-fun mapValue!40297 () ValueCell!12161)

(declare-fun mapKey!40297 () (_ BitVec 32))

(declare-fun mapRest!40297 () (Array (_ BitVec 32) ValueCell!12161))

(assert (=> mapNonEmpty!40297 (= (arr!32914 _values!955) (store mapRest!40297 mapKey!40297 mapValue!40297))))

(declare-fun mapIsEmpty!40297 () Bool)

(assert (=> mapIsEmpty!40297 mapRes!40297))

(declare-fun b!1070134 () Bool)

(declare-fun res!713934 () Bool)

(assert (=> b!1070134 (=> (not res!713934) (not e!610815))))

(declare-datatypes ((List!22963 0))(
  ( (Nil!22960) (Cons!22959 (h!24168 (_ BitVec 64)) (t!32294 List!22963)) )
))
(declare-fun arrayNoDuplicates!0 (array!68437 (_ BitVec 32) List!22963) Bool)

(assert (=> b!1070134 (= res!713934 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22960))))

(declare-fun b!1070135 () Bool)

(declare-fun e!610816 () Bool)

(declare-fun tp_is_empty!25729 () Bool)

(assert (=> b!1070135 (= e!610816 tp_is_empty!25729)))

(declare-fun res!713935 () Bool)

(assert (=> start!94650 (=> (not res!713935) (not e!610815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94650 (= res!713935 (validMask!0 mask!1515))))

(assert (=> start!94650 e!610815))

(assert (=> start!94650 true))

(assert (=> start!94650 tp_is_empty!25729))

(declare-fun e!610819 () Bool)

(declare-fun array_inv!25462 (array!68435) Bool)

(assert (=> start!94650 (and (array_inv!25462 _values!955) e!610819)))

(assert (=> start!94650 tp!77212))

(declare-fun array_inv!25463 (array!68437) Bool)

(assert (=> start!94650 (array_inv!25463 _keys!1163)))

(declare-fun b!1070136 () Bool)

(assert (=> b!1070136 (= e!610819 (and e!610816 mapRes!40297))))

(declare-fun condMapEmpty!40297 () Bool)

(declare-fun mapDefault!40297 () ValueCell!12161)

