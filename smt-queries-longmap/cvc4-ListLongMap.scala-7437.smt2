; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94476 () Bool)

(assert start!94476)

(declare-fun b_free!21803 () Bool)

(declare-fun b_next!21803 () Bool)

(assert (=> start!94476 (= b_free!21803 (not b_next!21803))))

(declare-fun tp!76856 () Bool)

(declare-fun b_and!34595 () Bool)

(assert (=> start!94476 (= tp!76856 b_and!34595)))

(declare-fun b!1068341 () Bool)

(declare-fun e!609519 () Bool)

(declare-fun e!609520 () Bool)

(assert (=> b!1068341 (= e!609519 (not e!609520))))

(declare-fun res!712910 () Bool)

(assert (=> b!1068341 (=> res!712910 e!609520)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068341 (= res!712910 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39285 0))(
  ( (V!39286 (val!12857 Int)) )
))
(declare-datatypes ((tuple2!16330 0))(
  ( (tuple2!16331 (_1!8176 (_ BitVec 64)) (_2!8176 V!39285)) )
))
(declare-datatypes ((List!22881 0))(
  ( (Nil!22878) (Cons!22877 (h!24086 tuple2!16330) (t!32206 List!22881)) )
))
(declare-datatypes ((ListLongMap!14299 0))(
  ( (ListLongMap!14300 (toList!7165 List!22881)) )
))
(declare-fun lt!471933 () ListLongMap!14299)

(declare-fun lt!471934 () ListLongMap!14299)

(assert (=> b!1068341 (= lt!471933 lt!471934)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39285)

(declare-datatypes ((ValueCell!12103 0))(
  ( (ValueCellFull!12103 (v!15471 V!39285)) (EmptyCell!12103) )
))
(declare-datatypes ((array!68205 0))(
  ( (array!68206 (arr!32802 (Array (_ BitVec 32) ValueCell!12103)) (size!33338 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68205)

(declare-fun minValue!907 () V!39285)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!35127 0))(
  ( (Unit!35128) )
))
(declare-fun lt!471937 () Unit!35127)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39285)

(declare-datatypes ((array!68207 0))(
  ( (array!68208 (arr!32803 (Array (_ BitVec 32) (_ BitVec 64))) (size!33339 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68207)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!782 (array!68207 array!68205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39285 V!39285 V!39285 V!39285 (_ BitVec 32) Int) Unit!35127)

(assert (=> b!1068341 (= lt!471937 (lemmaNoChangeToArrayThenSameMapNoExtras!782 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3745 (array!68207 array!68205 (_ BitVec 32) (_ BitVec 32) V!39285 V!39285 (_ BitVec 32) Int) ListLongMap!14299)

(assert (=> b!1068341 (= lt!471934 (getCurrentListMapNoExtraKeys!3745 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068341 (= lt!471933 (getCurrentListMapNoExtraKeys!3745 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068342 () Bool)

(declare-fun res!712909 () Bool)

(assert (=> b!1068342 (=> (not res!712909) (not e!609519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68207 (_ BitVec 32)) Bool)

(assert (=> b!1068342 (= res!712909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!712913 () Bool)

(assert (=> start!94476 (=> (not res!712913) (not e!609519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94476 (= res!712913 (validMask!0 mask!1515))))

(assert (=> start!94476 e!609519))

(assert (=> start!94476 true))

(declare-fun tp_is_empty!25613 () Bool)

(assert (=> start!94476 tp_is_empty!25613))

(declare-fun e!609518 () Bool)

(declare-fun array_inv!25392 (array!68205) Bool)

(assert (=> start!94476 (and (array_inv!25392 _values!955) e!609518)))

(assert (=> start!94476 tp!76856))

(declare-fun array_inv!25393 (array!68207) Bool)

(assert (=> start!94476 (array_inv!25393 _keys!1163)))

(declare-fun b!1068343 () Bool)

(declare-fun e!609515 () Bool)

(assert (=> b!1068343 (= e!609515 tp_is_empty!25613)))

(declare-fun b!1068344 () Bool)

(declare-fun e!609517 () Bool)

(assert (=> b!1068344 (= e!609517 tp_is_empty!25613)))

(declare-fun b!1068345 () Bool)

(declare-fun e!609516 () Bool)

(assert (=> b!1068345 (= e!609516 (bvsle #b00000000000000000000000000000000 (size!33339 _keys!1163)))))

(declare-fun lt!471935 () ListLongMap!14299)

(declare-fun -!648 (ListLongMap!14299 (_ BitVec 64)) ListLongMap!14299)

(assert (=> b!1068345 (= (-!648 lt!471935 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471935)))

(declare-fun lt!471936 () Unit!35127)

(declare-fun removeNotPresentStillSame!58 (ListLongMap!14299 (_ BitVec 64)) Unit!35127)

(assert (=> b!1068345 (= lt!471936 (removeNotPresentStillSame!58 lt!471935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!40114 () Bool)

(declare-fun mapRes!40114 () Bool)

(assert (=> mapIsEmpty!40114 mapRes!40114))

(declare-fun b!1068346 () Bool)

(assert (=> b!1068346 (= e!609520 e!609516)))

(declare-fun res!712911 () Bool)

(assert (=> b!1068346 (=> res!712911 e!609516)))

(declare-fun contains!6296 (ListLongMap!14299 (_ BitVec 64)) Bool)

(assert (=> b!1068346 (= res!712911 (contains!6296 lt!471935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4093 (array!68207 array!68205 (_ BitVec 32) (_ BitVec 32) V!39285 V!39285 (_ BitVec 32) Int) ListLongMap!14299)

(assert (=> b!1068346 (= lt!471935 (getCurrentListMap!4093 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068347 () Bool)

(assert (=> b!1068347 (= e!609518 (and e!609517 mapRes!40114))))

(declare-fun condMapEmpty!40114 () Bool)

(declare-fun mapDefault!40114 () ValueCell!12103)

