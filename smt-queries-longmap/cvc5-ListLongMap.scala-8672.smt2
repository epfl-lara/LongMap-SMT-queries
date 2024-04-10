; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105408 () Bool)

(assert start!105408)

(declare-fun b_free!27067 () Bool)

(declare-fun b_next!27067 () Bool)

(assert (=> start!105408 (= b_free!27067 (not b_next!27067))))

(declare-fun tp!94715 () Bool)

(declare-fun b_and!44913 () Bool)

(assert (=> start!105408 (= tp!94715 b_and!44913)))

(declare-fun b!1255821 () Bool)

(declare-fun e!713803 () Bool)

(declare-fun e!713804 () Bool)

(assert (=> b!1255821 (= e!713803 (not e!713804))))

(declare-fun res!837204 () Bool)

(assert (=> b!1255821 (=> res!837204 e!713804)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255821 (= res!837204 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47991 0))(
  ( (V!47992 (val!16047 Int)) )
))
(declare-datatypes ((tuple2!20722 0))(
  ( (tuple2!20723 (_1!10372 (_ BitVec 64)) (_2!10372 V!47991)) )
))
(declare-datatypes ((List!27943 0))(
  ( (Nil!27940) (Cons!27939 (h!29148 tuple2!20722) (t!41430 List!27943)) )
))
(declare-datatypes ((ListLongMap!18595 0))(
  ( (ListLongMap!18596 (toList!9313 List!27943)) )
))
(declare-fun lt!567775 () ListLongMap!18595)

(declare-fun lt!567777 () ListLongMap!18595)

(assert (=> b!1255821 (= lt!567775 lt!567777)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47991)

(declare-datatypes ((array!81580 0))(
  ( (array!81581 (arr!39349 (Array (_ BitVec 32) (_ BitVec 64))) (size!39885 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81580)

(declare-datatypes ((ValueCell!15221 0))(
  ( (ValueCellFull!15221 (v!18747 V!47991)) (EmptyCell!15221) )
))
(declare-datatypes ((array!81582 0))(
  ( (array!81583 (arr!39350 (Array (_ BitVec 32) ValueCell!15221)) (size!39886 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81582)

(declare-fun minValueBefore!43 () V!47991)

(declare-fun minValueAfter!43 () V!47991)

(declare-datatypes ((Unit!41812 0))(
  ( (Unit!41813) )
))
(declare-fun lt!567776 () Unit!41812)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1062 (array!81580 array!81582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47991 V!47991 V!47991 V!47991 (_ BitVec 32) Int) Unit!41812)

(assert (=> b!1255821 (= lt!567776 (lemmaNoChangeToArrayThenSameMapNoExtras!1062 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5698 (array!81580 array!81582 (_ BitVec 32) (_ BitVec 32) V!47991 V!47991 (_ BitVec 32) Int) ListLongMap!18595)

(assert (=> b!1255821 (= lt!567777 (getCurrentListMapNoExtraKeys!5698 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255821 (= lt!567775 (getCurrentListMapNoExtraKeys!5698 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255822 () Bool)

(declare-fun res!837205 () Bool)

(assert (=> b!1255822 (=> (not res!837205) (not e!713803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81580 (_ BitVec 32)) Bool)

(assert (=> b!1255822 (= res!837205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255823 () Bool)

(declare-fun res!837208 () Bool)

(assert (=> b!1255823 (=> (not res!837208) (not e!713803))))

(declare-datatypes ((List!27944 0))(
  ( (Nil!27941) (Cons!27940 (h!29149 (_ BitVec 64)) (t!41431 List!27944)) )
))
(declare-fun arrayNoDuplicates!0 (array!81580 (_ BitVec 32) List!27944) Bool)

(assert (=> b!1255823 (= res!837208 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27941))))

(declare-fun b!1255824 () Bool)

(declare-fun e!713798 () Bool)

(declare-fun tp_is_empty!31969 () Bool)

(assert (=> b!1255824 (= e!713798 tp_is_empty!31969)))

(declare-fun b!1255825 () Bool)

(declare-fun e!713801 () Bool)

(declare-fun mapRes!49738 () Bool)

(assert (=> b!1255825 (= e!713801 (and e!713798 mapRes!49738))))

(declare-fun condMapEmpty!49738 () Bool)

(declare-fun mapDefault!49738 () ValueCell!15221)

