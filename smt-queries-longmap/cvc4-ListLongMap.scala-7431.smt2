; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94440 () Bool)

(assert start!94440)

(declare-fun b_free!21767 () Bool)

(declare-fun b_next!21767 () Bool)

(assert (=> start!94440 (= b_free!21767 (not b_next!21767))))

(declare-fun tp!76748 () Bool)

(declare-fun b_and!34559 () Bool)

(assert (=> start!94440 (= tp!76748 b_and!34559)))

(declare-fun b!1067855 () Bool)

(declare-fun e!609140 () Bool)

(declare-fun e!609141 () Bool)

(assert (=> b!1067855 (= e!609140 (not e!609141))))

(declare-fun res!712589 () Bool)

(assert (=> b!1067855 (=> res!712589 e!609141)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067855 (= res!712589 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39237 0))(
  ( (V!39238 (val!12839 Int)) )
))
(declare-datatypes ((tuple2!16298 0))(
  ( (tuple2!16299 (_1!8160 (_ BitVec 64)) (_2!8160 V!39237)) )
))
(declare-datatypes ((List!22854 0))(
  ( (Nil!22851) (Cons!22850 (h!24059 tuple2!16298) (t!32179 List!22854)) )
))
(declare-datatypes ((ListLongMap!14267 0))(
  ( (ListLongMap!14268 (toList!7149 List!22854)) )
))
(declare-fun lt!471665 () ListLongMap!14267)

(declare-fun lt!471664 () ListLongMap!14267)

(assert (=> b!1067855 (= lt!471665 lt!471664)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39237)

(declare-datatypes ((Unit!35095 0))(
  ( (Unit!35096) )
))
(declare-fun lt!471666 () Unit!35095)

(declare-datatypes ((ValueCell!12085 0))(
  ( (ValueCellFull!12085 (v!15453 V!39237)) (EmptyCell!12085) )
))
(declare-datatypes ((array!68137 0))(
  ( (array!68138 (arr!32768 (Array (_ BitVec 32) ValueCell!12085)) (size!33304 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68137)

(declare-fun minValue!907 () V!39237)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39237)

(declare-datatypes ((array!68139 0))(
  ( (array!68140 (arr!32769 (Array (_ BitVec 32) (_ BitVec 64))) (size!33305 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68139)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!769 (array!68139 array!68137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39237 V!39237 V!39237 V!39237 (_ BitVec 32) Int) Unit!35095)

(assert (=> b!1067855 (= lt!471666 (lemmaNoChangeToArrayThenSameMapNoExtras!769 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3732 (array!68139 array!68137 (_ BitVec 32) (_ BitVec 32) V!39237 V!39237 (_ BitVec 32) Int) ListLongMap!14267)

(assert (=> b!1067855 (= lt!471664 (getCurrentListMapNoExtraKeys!3732 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067855 (= lt!471665 (getCurrentListMapNoExtraKeys!3732 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40060 () Bool)

(declare-fun mapRes!40060 () Bool)

(assert (=> mapIsEmpty!40060 mapRes!40060))

(declare-fun b!1067856 () Bool)

(declare-fun e!609137 () Bool)

(assert (=> b!1067856 (= e!609141 e!609137)))

(declare-fun res!712586 () Bool)

(assert (=> b!1067856 (=> res!712586 e!609137)))

(declare-fun lt!471667 () ListLongMap!14267)

(declare-fun contains!6285 (ListLongMap!14267 (_ BitVec 64)) Bool)

(assert (=> b!1067856 (= res!712586 (contains!6285 lt!471667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4082 (array!68139 array!68137 (_ BitVec 32) (_ BitVec 32) V!39237 V!39237 (_ BitVec 32) Int) ListLongMap!14267)

(assert (=> b!1067856 (= lt!471667 (getCurrentListMap!4082 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067857 () Bool)

(declare-fun e!609139 () Bool)

(declare-fun e!609142 () Bool)

(assert (=> b!1067857 (= e!609139 (and e!609142 mapRes!40060))))

(declare-fun condMapEmpty!40060 () Bool)

(declare-fun mapDefault!40060 () ValueCell!12085)

