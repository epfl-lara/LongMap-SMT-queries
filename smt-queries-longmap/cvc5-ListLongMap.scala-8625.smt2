; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105038 () Bool)

(assert start!105038)

(declare-fun b_free!26785 () Bool)

(declare-fun b_next!26785 () Bool)

(assert (=> start!105038 (= b_free!26785 (not b_next!26785))))

(declare-fun tp!93854 () Bool)

(declare-fun b_and!44581 () Bool)

(assert (=> start!105038 (= tp!93854 b_and!44581)))

(declare-fun b!1251864 () Bool)

(declare-fun e!710934 () Bool)

(declare-fun tp_is_empty!31687 () Bool)

(assert (=> b!1251864 (= e!710934 tp_is_empty!31687)))

(declare-fun b!1251865 () Bool)

(declare-fun res!834918 () Bool)

(declare-fun e!710933 () Bool)

(assert (=> b!1251865 (=> (not res!834918) (not e!710933))))

(declare-datatypes ((array!81040 0))(
  ( (array!81041 (arr!39084 (Array (_ BitVec 32) (_ BitVec 64))) (size!39620 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81040)

(declare-datatypes ((List!27744 0))(
  ( (Nil!27741) (Cons!27740 (h!28949 (_ BitVec 64)) (t!41221 List!27744)) )
))
(declare-fun arrayNoDuplicates!0 (array!81040 (_ BitVec 32) List!27744) Bool)

(assert (=> b!1251865 (= res!834918 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27741))))

(declare-fun b!1251866 () Bool)

(declare-fun res!834920 () Bool)

(assert (=> b!1251866 (=> (not res!834920) (not e!710933))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47615 0))(
  ( (V!47616 (val!15906 Int)) )
))
(declare-datatypes ((ValueCell!15080 0))(
  ( (ValueCellFull!15080 (v!18604 V!47615)) (EmptyCell!15080) )
))
(declare-datatypes ((array!81042 0))(
  ( (array!81043 (arr!39085 (Array (_ BitVec 32) ValueCell!15080)) (size!39621 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81042)

(assert (=> b!1251866 (= res!834920 (and (= (size!39621 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39620 _keys!1118) (size!39621 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251867 () Bool)

(assert (=> b!1251867 (= e!710933 (not true))))

(declare-datatypes ((tuple2!20512 0))(
  ( (tuple2!20513 (_1!10267 (_ BitVec 64)) (_2!10267 V!47615)) )
))
(declare-datatypes ((List!27745 0))(
  ( (Nil!27742) (Cons!27741 (h!28950 tuple2!20512) (t!41222 List!27745)) )
))
(declare-datatypes ((ListLongMap!18385 0))(
  ( (ListLongMap!18386 (toList!9208 List!27745)) )
))
(declare-fun lt!565076 () ListLongMap!18385)

(declare-fun lt!565077 () ListLongMap!18385)

(assert (=> b!1251867 (= lt!565076 lt!565077)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41605 0))(
  ( (Unit!41606) )
))
(declare-fun lt!565078 () Unit!41605)

(declare-fun minValueAfter!43 () V!47615)

(declare-fun zeroValue!871 () V!47615)

(declare-fun minValueBefore!43 () V!47615)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!968 (array!81040 array!81042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47615 V!47615 V!47615 V!47615 (_ BitVec 32) Int) Unit!41605)

(assert (=> b!1251867 (= lt!565078 (lemmaNoChangeToArrayThenSameMapNoExtras!968 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5604 (array!81040 array!81042 (_ BitVec 32) (_ BitVec 32) V!47615 V!47615 (_ BitVec 32) Int) ListLongMap!18385)

(assert (=> b!1251867 (= lt!565077 (getCurrentListMapNoExtraKeys!5604 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251867 (= lt!565076 (getCurrentListMapNoExtraKeys!5604 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251869 () Bool)

(declare-fun res!834919 () Bool)

(assert (=> b!1251869 (=> (not res!834919) (not e!710933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81040 (_ BitVec 32)) Bool)

(assert (=> b!1251869 (= res!834919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251870 () Bool)

(declare-fun e!710935 () Bool)

(declare-fun e!710931 () Bool)

(declare-fun mapRes!49300 () Bool)

(assert (=> b!1251870 (= e!710935 (and e!710931 mapRes!49300))))

(declare-fun condMapEmpty!49300 () Bool)

(declare-fun mapDefault!49300 () ValueCell!15080)

