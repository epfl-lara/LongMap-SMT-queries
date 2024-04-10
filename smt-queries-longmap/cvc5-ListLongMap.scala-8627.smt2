; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105050 () Bool)

(assert start!105050)

(declare-fun b_free!26797 () Bool)

(declare-fun b_next!26797 () Bool)

(assert (=> start!105050 (= b_free!26797 (not b_next!26797))))

(declare-fun tp!93889 () Bool)

(declare-fun b_and!44593 () Bool)

(assert (=> start!105050 (= tp!93889 b_and!44593)))

(declare-fun b!1251990 () Bool)

(declare-fun e!711024 () Bool)

(declare-fun tp_is_empty!31699 () Bool)

(assert (=> b!1251990 (= e!711024 tp_is_empty!31699)))

(declare-fun b!1251991 () Bool)

(declare-fun res!834993 () Bool)

(declare-fun e!711025 () Bool)

(assert (=> b!1251991 (=> (not res!834993) (not e!711025))))

(declare-datatypes ((array!81062 0))(
  ( (array!81063 (arr!39095 (Array (_ BitVec 32) (_ BitVec 64))) (size!39631 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81062)

(declare-datatypes ((List!27754 0))(
  ( (Nil!27751) (Cons!27750 (h!28959 (_ BitVec 64)) (t!41231 List!27754)) )
))
(declare-fun arrayNoDuplicates!0 (array!81062 (_ BitVec 32) List!27754) Bool)

(assert (=> b!1251991 (= res!834993 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27751))))

(declare-fun res!834992 () Bool)

(assert (=> start!105050 (=> (not res!834992) (not e!711025))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105050 (= res!834992 (validMask!0 mask!1466))))

(assert (=> start!105050 e!711025))

(assert (=> start!105050 true))

(assert (=> start!105050 tp!93889))

(assert (=> start!105050 tp_is_empty!31699))

(declare-fun array_inv!29819 (array!81062) Bool)

(assert (=> start!105050 (array_inv!29819 _keys!1118)))

(declare-datatypes ((V!47631 0))(
  ( (V!47632 (val!15912 Int)) )
))
(declare-datatypes ((ValueCell!15086 0))(
  ( (ValueCellFull!15086 (v!18610 V!47631)) (EmptyCell!15086) )
))
(declare-datatypes ((array!81064 0))(
  ( (array!81065 (arr!39096 (Array (_ BitVec 32) ValueCell!15086)) (size!39632 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81064)

(declare-fun e!711022 () Bool)

(declare-fun array_inv!29820 (array!81064) Bool)

(assert (=> start!105050 (and (array_inv!29820 _values!914) e!711022)))

(declare-fun b!1251992 () Bool)

(declare-fun res!834991 () Bool)

(assert (=> b!1251992 (=> (not res!834991) (not e!711025))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1251992 (= res!834991 (and (= (size!39632 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39631 _keys!1118) (size!39632 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251993 () Bool)

(declare-fun e!711021 () Bool)

(assert (=> b!1251993 (= e!711021 tp_is_empty!31699)))

(declare-fun mapIsEmpty!49318 () Bool)

(declare-fun mapRes!49318 () Bool)

(assert (=> mapIsEmpty!49318 mapRes!49318))

(declare-fun b!1251994 () Bool)

(assert (=> b!1251994 (= e!711025 (not true))))

(declare-datatypes ((tuple2!20522 0))(
  ( (tuple2!20523 (_1!10272 (_ BitVec 64)) (_2!10272 V!47631)) )
))
(declare-datatypes ((List!27755 0))(
  ( (Nil!27752) (Cons!27751 (h!28960 tuple2!20522) (t!41232 List!27755)) )
))
(declare-datatypes ((ListLongMap!18395 0))(
  ( (ListLongMap!18396 (toList!9213 List!27755)) )
))
(declare-fun lt!565132 () ListLongMap!18395)

(declare-fun lt!565130 () ListLongMap!18395)

(assert (=> b!1251994 (= lt!565132 lt!565130)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47631)

(declare-fun zeroValue!871 () V!47631)

(declare-fun minValueBefore!43 () V!47631)

(declare-datatypes ((Unit!41615 0))(
  ( (Unit!41616) )
))
(declare-fun lt!565131 () Unit!41615)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!973 (array!81062 array!81064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47631 V!47631 V!47631 V!47631 (_ BitVec 32) Int) Unit!41615)

(assert (=> b!1251994 (= lt!565131 (lemmaNoChangeToArrayThenSameMapNoExtras!973 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5609 (array!81062 array!81064 (_ BitVec 32) (_ BitVec 32) V!47631 V!47631 (_ BitVec 32) Int) ListLongMap!18395)

(assert (=> b!1251994 (= lt!565130 (getCurrentListMapNoExtraKeys!5609 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251994 (= lt!565132 (getCurrentListMapNoExtraKeys!5609 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251995 () Bool)

(declare-fun res!834990 () Bool)

(assert (=> b!1251995 (=> (not res!834990) (not e!711025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81062 (_ BitVec 32)) Bool)

(assert (=> b!1251995 (= res!834990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49318 () Bool)

(declare-fun tp!93890 () Bool)

(assert (=> mapNonEmpty!49318 (= mapRes!49318 (and tp!93890 e!711021))))

(declare-fun mapKey!49318 () (_ BitVec 32))

(declare-fun mapRest!49318 () (Array (_ BitVec 32) ValueCell!15086))

(declare-fun mapValue!49318 () ValueCell!15086)

(assert (=> mapNonEmpty!49318 (= (arr!39096 _values!914) (store mapRest!49318 mapKey!49318 mapValue!49318))))

(declare-fun b!1251996 () Bool)

(assert (=> b!1251996 (= e!711022 (and e!711024 mapRes!49318))))

(declare-fun condMapEmpty!49318 () Bool)

(declare-fun mapDefault!49318 () ValueCell!15086)

