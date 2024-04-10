; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105402 () Bool)

(assert start!105402)

(declare-fun b_free!27061 () Bool)

(declare-fun b_next!27061 () Bool)

(assert (=> start!105402 (= b_free!27061 (not b_next!27061))))

(declare-fun tp!94697 () Bool)

(declare-fun b_and!44907 () Bool)

(assert (=> start!105402 (= tp!94697 b_and!44907)))

(declare-fun b!1255740 () Bool)

(declare-fun e!713736 () Bool)

(declare-fun e!713737 () Bool)

(assert (=> b!1255740 (= e!713736 (not e!713737))))

(declare-fun res!837152 () Bool)

(assert (=> b!1255740 (=> res!837152 e!713737)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255740 (= res!837152 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47983 0))(
  ( (V!47984 (val!16044 Int)) )
))
(declare-datatypes ((tuple2!20716 0))(
  ( (tuple2!20717 (_1!10369 (_ BitVec 64)) (_2!10369 V!47983)) )
))
(declare-datatypes ((List!27937 0))(
  ( (Nil!27934) (Cons!27933 (h!29142 tuple2!20716) (t!41424 List!27937)) )
))
(declare-datatypes ((ListLongMap!18589 0))(
  ( (ListLongMap!18590 (toList!9310 List!27937)) )
))
(declare-fun lt!567733 () ListLongMap!18589)

(declare-fun lt!567730 () ListLongMap!18589)

(assert (=> b!1255740 (= lt!567733 lt!567730)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47983)

(declare-datatypes ((Unit!41806 0))(
  ( (Unit!41807) )
))
(declare-fun lt!567731 () Unit!41806)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47983)

(declare-datatypes ((array!81568 0))(
  ( (array!81569 (arr!39343 (Array (_ BitVec 32) (_ BitVec 64))) (size!39879 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81568)

(declare-datatypes ((ValueCell!15218 0))(
  ( (ValueCellFull!15218 (v!18744 V!47983)) (EmptyCell!15218) )
))
(declare-datatypes ((array!81570 0))(
  ( (array!81571 (arr!39344 (Array (_ BitVec 32) ValueCell!15218)) (size!39880 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81570)

(declare-fun minValueBefore!43 () V!47983)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1059 (array!81568 array!81570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47983 V!47983 V!47983 V!47983 (_ BitVec 32) Int) Unit!41806)

(assert (=> b!1255740 (= lt!567731 (lemmaNoChangeToArrayThenSameMapNoExtras!1059 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5695 (array!81568 array!81570 (_ BitVec 32) (_ BitVec 32) V!47983 V!47983 (_ BitVec 32) Int) ListLongMap!18589)

(assert (=> b!1255740 (= lt!567730 (getCurrentListMapNoExtraKeys!5695 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255740 (= lt!567733 (getCurrentListMapNoExtraKeys!5695 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255741 () Bool)

(declare-fun e!713739 () Bool)

(assert (=> b!1255741 (= e!713739 true)))

(declare-fun lt!567729 () ListLongMap!18589)

(declare-fun -!2064 (ListLongMap!18589 (_ BitVec 64)) ListLongMap!18589)

(assert (=> b!1255741 (= (-!2064 lt!567729 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567729)))

(declare-fun lt!567732 () Unit!41806)

(declare-fun removeNotPresentStillSame!117 (ListLongMap!18589 (_ BitVec 64)) Unit!41806)

(assert (=> b!1255741 (= lt!567732 (removeNotPresentStillSame!117 lt!567729 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!837154 () Bool)

(assert (=> start!105402 (=> (not res!837154) (not e!713736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105402 (= res!837154 (validMask!0 mask!1466))))

(assert (=> start!105402 e!713736))

(assert (=> start!105402 true))

(assert (=> start!105402 tp!94697))

(declare-fun tp_is_empty!31963 () Bool)

(assert (=> start!105402 tp_is_empty!31963))

(declare-fun array_inv!29977 (array!81568) Bool)

(assert (=> start!105402 (array_inv!29977 _keys!1118)))

(declare-fun e!713735 () Bool)

(declare-fun array_inv!29978 (array!81570) Bool)

(assert (=> start!105402 (and (array_inv!29978 _values!914) e!713735)))

(declare-fun b!1255742 () Bool)

(declare-fun e!713741 () Bool)

(assert (=> b!1255742 (= e!713741 tp_is_empty!31963)))

(declare-fun b!1255743 () Bool)

(declare-fun res!837153 () Bool)

(assert (=> b!1255743 (=> (not res!837153) (not e!713736))))

(declare-datatypes ((List!27938 0))(
  ( (Nil!27935) (Cons!27934 (h!29143 (_ BitVec 64)) (t!41425 List!27938)) )
))
(declare-fun arrayNoDuplicates!0 (array!81568 (_ BitVec 32) List!27938) Bool)

(assert (=> b!1255743 (= res!837153 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27935))))

(declare-fun b!1255744 () Bool)

(declare-fun e!713738 () Bool)

(declare-fun mapRes!49729 () Bool)

(assert (=> b!1255744 (= e!713735 (and e!713738 mapRes!49729))))

(declare-fun condMapEmpty!49729 () Bool)

(declare-fun mapDefault!49729 () ValueCell!15218)

