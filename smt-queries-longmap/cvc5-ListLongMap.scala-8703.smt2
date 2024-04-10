; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105652 () Bool)

(assert start!105652)

(declare-fun b_free!27253 () Bool)

(declare-fun b_next!27253 () Bool)

(assert (=> start!105652 (= b_free!27253 (not b_next!27253))))

(declare-fun tp!95282 () Bool)

(declare-fun b_and!45127 () Bool)

(assert (=> start!105652 (= tp!95282 b_and!45127)))

(declare-fun res!838813 () Bool)

(declare-fun e!715791 () Bool)

(assert (=> start!105652 (=> (not res!838813) (not e!715791))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105652 (= res!838813 (validMask!0 mask!1466))))

(assert (=> start!105652 e!715791))

(assert (=> start!105652 true))

(assert (=> start!105652 tp!95282))

(declare-fun tp_is_empty!32155 () Bool)

(assert (=> start!105652 tp_is_empty!32155))

(declare-datatypes ((array!81930 0))(
  ( (array!81931 (arr!39521 (Array (_ BitVec 32) (_ BitVec 64))) (size!40057 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81930)

(declare-fun array_inv!30097 (array!81930) Bool)

(assert (=> start!105652 (array_inv!30097 _keys!1118)))

(declare-datatypes ((V!48239 0))(
  ( (V!48240 (val!16140 Int)) )
))
(declare-datatypes ((ValueCell!15314 0))(
  ( (ValueCellFull!15314 (v!18842 V!48239)) (EmptyCell!15314) )
))
(declare-datatypes ((array!81932 0))(
  ( (array!81933 (arr!39522 (Array (_ BitVec 32) ValueCell!15314)) (size!40058 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81932)

(declare-fun e!715788 () Bool)

(declare-fun array_inv!30098 (array!81932) Bool)

(assert (=> start!105652 (and (array_inv!30098 _values!914) e!715788)))

(declare-fun b!1258513 () Bool)

(declare-fun e!715789 () Bool)

(assert (=> b!1258513 (= e!715791 (not e!715789))))

(declare-fun res!838814 () Bool)

(assert (=> b!1258513 (=> res!838814 e!715789)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258513 (= res!838814 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20848 0))(
  ( (tuple2!20849 (_1!10435 (_ BitVec 64)) (_2!10435 V!48239)) )
))
(declare-datatypes ((List!28063 0))(
  ( (Nil!28060) (Cons!28059 (h!29268 tuple2!20848) (t!41556 List!28063)) )
))
(declare-datatypes ((ListLongMap!18721 0))(
  ( (ListLongMap!18722 (toList!9376 List!28063)) )
))
(declare-fun lt!569241 () ListLongMap!18721)

(declare-fun lt!569239 () ListLongMap!18721)

(assert (=> b!1258513 (= lt!569241 lt!569239)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48239)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48239)

(declare-datatypes ((Unit!41934 0))(
  ( (Unit!41935) )
))
(declare-fun lt!569242 () Unit!41934)

(declare-fun minValueBefore!43 () V!48239)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1117 (array!81930 array!81932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48239 V!48239 V!48239 V!48239 (_ BitVec 32) Int) Unit!41934)

(assert (=> b!1258513 (= lt!569242 (lemmaNoChangeToArrayThenSameMapNoExtras!1117 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5753 (array!81930 array!81932 (_ BitVec 32) (_ BitVec 32) V!48239 V!48239 (_ BitVec 32) Int) ListLongMap!18721)

(assert (=> b!1258513 (= lt!569239 (getCurrentListMapNoExtraKeys!5753 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258513 (= lt!569241 (getCurrentListMapNoExtraKeys!5753 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258514 () Bool)

(declare-fun res!838817 () Bool)

(assert (=> b!1258514 (=> (not res!838817) (not e!715791))))

(assert (=> b!1258514 (= res!838817 (and (= (size!40058 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40057 _keys!1118) (size!40058 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258515 () Bool)

(declare-fun res!838816 () Bool)

(assert (=> b!1258515 (=> (not res!838816) (not e!715791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81930 (_ BitVec 32)) Bool)

(assert (=> b!1258515 (= res!838816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258516 () Bool)

(declare-fun e!715793 () Bool)

(declare-fun mapRes!50026 () Bool)

(assert (=> b!1258516 (= e!715788 (and e!715793 mapRes!50026))))

(declare-fun condMapEmpty!50026 () Bool)

(declare-fun mapDefault!50026 () ValueCell!15314)

