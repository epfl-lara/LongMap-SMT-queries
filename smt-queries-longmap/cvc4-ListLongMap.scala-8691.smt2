; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105570 () Bool)

(assert start!105570)

(declare-fun b_free!27185 () Bool)

(declare-fun b_next!27185 () Bool)

(assert (=> start!105570 (= b_free!27185 (not b_next!27185))))

(declare-fun tp!95074 () Bool)

(declare-fun b_and!45051 () Bool)

(assert (=> start!105570 (= tp!95074 b_and!45051)))

(declare-fun b!1257659 () Bool)

(declare-fun e!715168 () Bool)

(assert (=> b!1257659 (= e!715168 (not true))))

(declare-datatypes ((V!48147 0))(
  ( (V!48148 (val!16106 Int)) )
))
(declare-datatypes ((tuple2!20810 0))(
  ( (tuple2!20811 (_1!10416 (_ BitVec 64)) (_2!10416 V!48147)) )
))
(declare-datatypes ((List!28025 0))(
  ( (Nil!28022) (Cons!28021 (h!29230 tuple2!20810) (t!41516 List!28025)) )
))
(declare-datatypes ((ListLongMap!18683 0))(
  ( (ListLongMap!18684 (toList!9357 List!28025)) )
))
(declare-fun lt!568839 () ListLongMap!18683)

(declare-fun lt!568838 () ListLongMap!18683)

(assert (=> b!1257659 (= lt!568839 lt!568838)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41898 0))(
  ( (Unit!41899) )
))
(declare-fun lt!568837 () Unit!41898)

(declare-fun minValueAfter!43 () V!48147)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48147)

(declare-datatypes ((array!81806 0))(
  ( (array!81807 (arr!39460 (Array (_ BitVec 32) (_ BitVec 64))) (size!39996 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81806)

(declare-datatypes ((ValueCell!15280 0))(
  ( (ValueCellFull!15280 (v!18808 V!48147)) (EmptyCell!15280) )
))
(declare-datatypes ((array!81808 0))(
  ( (array!81809 (arr!39461 (Array (_ BitVec 32) ValueCell!15280)) (size!39997 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81808)

(declare-fun minValueBefore!43 () V!48147)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1099 (array!81806 array!81808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48147 V!48147 V!48147 V!48147 (_ BitVec 32) Int) Unit!41898)

(assert (=> b!1257659 (= lt!568837 (lemmaNoChangeToArrayThenSameMapNoExtras!1099 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5735 (array!81806 array!81808 (_ BitVec 32) (_ BitVec 32) V!48147 V!48147 (_ BitVec 32) Int) ListLongMap!18683)

(assert (=> b!1257659 (= lt!568838 (getCurrentListMapNoExtraKeys!5735 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257659 (= lt!568839 (getCurrentListMapNoExtraKeys!5735 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257660 () Bool)

(declare-fun res!838321 () Bool)

(assert (=> b!1257660 (=> (not res!838321) (not e!715168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81806 (_ BitVec 32)) Bool)

(assert (=> b!1257660 (= res!838321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49921 () Bool)

(declare-fun mapRes!49921 () Bool)

(declare-fun tp!95075 () Bool)

(declare-fun e!715171 () Bool)

(assert (=> mapNonEmpty!49921 (= mapRes!49921 (and tp!95075 e!715171))))

(declare-fun mapValue!49921 () ValueCell!15280)

(declare-fun mapKey!49921 () (_ BitVec 32))

(declare-fun mapRest!49921 () (Array (_ BitVec 32) ValueCell!15280))

(assert (=> mapNonEmpty!49921 (= (arr!39461 _values!914) (store mapRest!49921 mapKey!49921 mapValue!49921))))

(declare-fun b!1257661 () Bool)

(declare-fun e!715170 () Bool)

(declare-fun e!715167 () Bool)

(assert (=> b!1257661 (= e!715170 (and e!715167 mapRes!49921))))

(declare-fun condMapEmpty!49921 () Bool)

(declare-fun mapDefault!49921 () ValueCell!15280)

