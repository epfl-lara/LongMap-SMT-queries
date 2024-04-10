; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94452 () Bool)

(assert start!94452)

(declare-fun b_free!21779 () Bool)

(declare-fun b_next!21779 () Bool)

(assert (=> start!94452 (= b_free!21779 (not b_next!21779))))

(declare-fun tp!76783 () Bool)

(declare-fun b_and!34571 () Bool)

(assert (=> start!94452 (= tp!76783 b_and!34571)))

(declare-fun b!1068017 () Bool)

(declare-fun e!609262 () Bool)

(declare-fun tp_is_empty!25589 () Bool)

(assert (=> b!1068017 (= e!609262 tp_is_empty!25589)))

(declare-fun mapIsEmpty!40078 () Bool)

(declare-fun mapRes!40078 () Bool)

(assert (=> mapIsEmpty!40078 mapRes!40078))

(declare-fun b!1068019 () Bool)

(declare-fun e!609268 () Bool)

(assert (=> b!1068019 (= e!609268 tp_is_empty!25589)))

(declare-fun b!1068020 () Bool)

(declare-fun res!712695 () Bool)

(declare-fun e!609265 () Bool)

(assert (=> b!1068020 (=> (not res!712695) (not e!609265))))

(declare-datatypes ((array!68161 0))(
  ( (array!68162 (arr!32780 (Array (_ BitVec 32) (_ BitVec 64))) (size!33316 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68161)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68161 (_ BitVec 32)) Bool)

(assert (=> b!1068020 (= res!712695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068021 () Bool)

(declare-fun res!712693 () Bool)

(assert (=> b!1068021 (=> (not res!712693) (not e!609265))))

(declare-datatypes ((V!39253 0))(
  ( (V!39254 (val!12845 Int)) )
))
(declare-datatypes ((ValueCell!12091 0))(
  ( (ValueCellFull!12091 (v!15459 V!39253)) (EmptyCell!12091) )
))
(declare-datatypes ((array!68163 0))(
  ( (array!68164 (arr!32781 (Array (_ BitVec 32) ValueCell!12091)) (size!33317 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68163)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068021 (= res!712693 (and (= (size!33317 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33316 _keys!1163) (size!33317 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068022 () Bool)

(declare-fun res!712698 () Bool)

(assert (=> b!1068022 (=> (not res!712698) (not e!609265))))

(declare-datatypes ((List!22864 0))(
  ( (Nil!22861) (Cons!22860 (h!24069 (_ BitVec 64)) (t!32189 List!22864)) )
))
(declare-fun arrayNoDuplicates!0 (array!68161 (_ BitVec 32) List!22864) Bool)

(assert (=> b!1068022 (= res!712698 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22861))))

(declare-fun b!1068023 () Bool)

(declare-fun e!609266 () Bool)

(assert (=> b!1068023 (= e!609266 true)))

(declare-datatypes ((tuple2!16310 0))(
  ( (tuple2!16311 (_1!8166 (_ BitVec 64)) (_2!8166 V!39253)) )
))
(declare-datatypes ((List!22865 0))(
  ( (Nil!22862) (Cons!22861 (h!24070 tuple2!16310) (t!32190 List!22865)) )
))
(declare-datatypes ((ListLongMap!14279 0))(
  ( (ListLongMap!14280 (toList!7155 List!22865)) )
))
(declare-fun lt!471757 () ListLongMap!14279)

(declare-fun -!640 (ListLongMap!14279 (_ BitVec 64)) ListLongMap!14279)

(assert (=> b!1068023 (= (-!640 lt!471757 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471757)))

(declare-datatypes ((Unit!35107 0))(
  ( (Unit!35108) )
))
(declare-fun lt!471756 () Unit!35107)

(declare-fun removeNotPresentStillSame!50 (ListLongMap!14279 (_ BitVec 64)) Unit!35107)

(assert (=> b!1068023 (= lt!471756 (removeNotPresentStillSame!50 lt!471757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068018 () Bool)

(declare-fun e!609264 () Bool)

(assert (=> b!1068018 (= e!609264 (and e!609268 mapRes!40078))))

(declare-fun condMapEmpty!40078 () Bool)

(declare-fun mapDefault!40078 () ValueCell!12091)

