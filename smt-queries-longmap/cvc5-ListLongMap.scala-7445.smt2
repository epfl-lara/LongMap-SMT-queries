; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94542 () Bool)

(assert start!94542)

(declare-fun b_free!21847 () Bool)

(declare-fun b_next!21847 () Bool)

(assert (=> start!94542 (= b_free!21847 (not b_next!21847))))

(declare-fun tp!76990 () Bool)

(declare-fun b_and!34649 () Bool)

(assert (=> start!94542 (= tp!76990 b_and!34649)))

(declare-fun b!1069092 () Bool)

(declare-fun e!610077 () Bool)

(declare-fun tp_is_empty!25657 () Bool)

(assert (=> b!1069092 (= e!610077 tp_is_empty!25657)))

(declare-fun mapIsEmpty!40183 () Bool)

(declare-fun mapRes!40183 () Bool)

(assert (=> mapIsEmpty!40183 mapRes!40183))

(declare-fun b!1069094 () Bool)

(declare-fun res!713367 () Bool)

(declare-fun e!610076 () Bool)

(assert (=> b!1069094 (=> (not res!713367) (not e!610076))))

(declare-datatypes ((V!39345 0))(
  ( (V!39346 (val!12879 Int)) )
))
(declare-datatypes ((ValueCell!12125 0))(
  ( (ValueCellFull!12125 (v!15494 V!39345)) (EmptyCell!12125) )
))
(declare-datatypes ((array!68291 0))(
  ( (array!68292 (arr!32844 (Array (_ BitVec 32) ValueCell!12125)) (size!33380 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68291)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68293 0))(
  ( (array!68294 (arr!32845 (Array (_ BitVec 32) (_ BitVec 64))) (size!33381 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68293)

(assert (=> b!1069094 (= res!713367 (and (= (size!33380 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33381 _keys!1163) (size!33380 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069095 () Bool)

(declare-fun e!610080 () Bool)

(declare-fun e!610081 () Bool)

(assert (=> b!1069095 (= e!610080 e!610081)))

(declare-fun res!713370 () Bool)

(assert (=> b!1069095 (=> res!713370 e!610081)))

(declare-datatypes ((tuple2!16366 0))(
  ( (tuple2!16367 (_1!8194 (_ BitVec 64)) (_2!8194 V!39345)) )
))
(declare-datatypes ((List!22912 0))(
  ( (Nil!22909) (Cons!22908 (h!24117 tuple2!16366) (t!32239 List!22912)) )
))
(declare-datatypes ((ListLongMap!14335 0))(
  ( (ListLongMap!14336 (toList!7183 List!22912)) )
))
(declare-fun lt!472387 () ListLongMap!14335)

(declare-fun contains!6311 (ListLongMap!14335 (_ BitVec 64)) Bool)

(assert (=> b!1069095 (= res!713370 (contains!6311 lt!472387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39345)

(declare-fun zeroValueBefore!47 () V!39345)

(declare-fun getCurrentListMap!4107 (array!68293 array!68291 (_ BitVec 32) (_ BitVec 32) V!39345 V!39345 (_ BitVec 32) Int) ListLongMap!14335)

(assert (=> b!1069095 (= lt!472387 (getCurrentListMap!4107 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40183 () Bool)

(declare-fun tp!76991 () Bool)

(declare-fun e!610082 () Bool)

(assert (=> mapNonEmpty!40183 (= mapRes!40183 (and tp!76991 e!610082))))

(declare-fun mapKey!40183 () (_ BitVec 32))

(declare-fun mapValue!40183 () ValueCell!12125)

(declare-fun mapRest!40183 () (Array (_ BitVec 32) ValueCell!12125))

(assert (=> mapNonEmpty!40183 (= (arr!32844 _values!955) (store mapRest!40183 mapKey!40183 mapValue!40183))))

(declare-fun b!1069096 () Bool)

(assert (=> b!1069096 (= e!610076 (not e!610080))))

(declare-fun res!713368 () Bool)

(assert (=> b!1069096 (=> res!713368 e!610080)))

(assert (=> b!1069096 (= res!713368 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!472388 () ListLongMap!14335)

(declare-fun lt!472391 () ListLongMap!14335)

(assert (=> b!1069096 (= lt!472388 lt!472391)))

(declare-datatypes ((Unit!35163 0))(
  ( (Unit!35164) )
))
(declare-fun lt!472389 () Unit!35163)

(declare-fun zeroValueAfter!47 () V!39345)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!796 (array!68293 array!68291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39345 V!39345 V!39345 V!39345 (_ BitVec 32) Int) Unit!35163)

(assert (=> b!1069096 (= lt!472389 (lemmaNoChangeToArrayThenSameMapNoExtras!796 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3759 (array!68293 array!68291 (_ BitVec 32) (_ BitVec 32) V!39345 V!39345 (_ BitVec 32) Int) ListLongMap!14335)

(assert (=> b!1069096 (= lt!472391 (getCurrentListMapNoExtraKeys!3759 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069096 (= lt!472388 (getCurrentListMapNoExtraKeys!3759 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069097 () Bool)

(assert (=> b!1069097 (= e!610081 true)))

(declare-fun -!662 (ListLongMap!14335 (_ BitVec 64)) ListLongMap!14335)

(assert (=> b!1069097 (= (-!662 lt!472387 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472387)))

(declare-fun lt!472390 () Unit!35163)

(declare-fun removeNotPresentStillSame!72 (ListLongMap!14335 (_ BitVec 64)) Unit!35163)

(assert (=> b!1069097 (= lt!472390 (removeNotPresentStillSame!72 lt!472387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069098 () Bool)

(assert (=> b!1069098 (= e!610082 tp_is_empty!25657)))

(declare-fun b!1069099 () Bool)

(declare-fun res!713366 () Bool)

(assert (=> b!1069099 (=> (not res!713366) (not e!610076))))

(declare-datatypes ((List!22913 0))(
  ( (Nil!22910) (Cons!22909 (h!24118 (_ BitVec 64)) (t!32240 List!22913)) )
))
(declare-fun arrayNoDuplicates!0 (array!68293 (_ BitVec 32) List!22913) Bool)

(assert (=> b!1069099 (= res!713366 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22910))))

(declare-fun b!1069100 () Bool)

(declare-fun e!610078 () Bool)

(assert (=> b!1069100 (= e!610078 (and e!610077 mapRes!40183))))

(declare-fun condMapEmpty!40183 () Bool)

(declare-fun mapDefault!40183 () ValueCell!12125)

