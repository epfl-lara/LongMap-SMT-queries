; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105048 () Bool)

(assert start!105048)

(declare-fun b_free!26795 () Bool)

(declare-fun b_next!26795 () Bool)

(assert (=> start!105048 (= b_free!26795 (not b_next!26795))))

(declare-fun tp!93883 () Bool)

(declare-fun b_and!44591 () Bool)

(assert (=> start!105048 (= tp!93883 b_and!44591)))

(declare-fun b!1251969 () Bool)

(declare-fun e!711007 () Bool)

(declare-fun tp_is_empty!31697 () Bool)

(assert (=> b!1251969 (= e!711007 tp_is_empty!31697)))

(declare-fun mapNonEmpty!49315 () Bool)

(declare-fun mapRes!49315 () Bool)

(declare-fun tp!93884 () Bool)

(declare-fun e!711010 () Bool)

(assert (=> mapNonEmpty!49315 (= mapRes!49315 (and tp!93884 e!711010))))

(declare-datatypes ((V!47627 0))(
  ( (V!47628 (val!15911 Int)) )
))
(declare-datatypes ((ValueCell!15085 0))(
  ( (ValueCellFull!15085 (v!18609 V!47627)) (EmptyCell!15085) )
))
(declare-fun mapRest!49315 () (Array (_ BitVec 32) ValueCell!15085))

(declare-fun mapValue!49315 () ValueCell!15085)

(declare-fun mapKey!49315 () (_ BitVec 32))

(declare-datatypes ((array!81058 0))(
  ( (array!81059 (arr!39093 (Array (_ BitVec 32) ValueCell!15085)) (size!39629 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81058)

(assert (=> mapNonEmpty!49315 (= (arr!39093 _values!914) (store mapRest!49315 mapKey!49315 mapValue!49315))))

(declare-fun b!1251970 () Bool)

(declare-fun res!834980 () Bool)

(declare-fun e!711009 () Bool)

(assert (=> b!1251970 (=> (not res!834980) (not e!711009))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81060 0))(
  ( (array!81061 (arr!39094 (Array (_ BitVec 32) (_ BitVec 64))) (size!39630 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81060)

(assert (=> b!1251970 (= res!834980 (and (= (size!39629 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39630 _keys!1118) (size!39629 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251971 () Bool)

(declare-fun res!834981 () Bool)

(assert (=> b!1251971 (=> (not res!834981) (not e!711009))))

(declare-datatypes ((List!27752 0))(
  ( (Nil!27749) (Cons!27748 (h!28957 (_ BitVec 64)) (t!41229 List!27752)) )
))
(declare-fun arrayNoDuplicates!0 (array!81060 (_ BitVec 32) List!27752) Bool)

(assert (=> b!1251971 (= res!834981 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27749))))

(declare-fun b!1251972 () Bool)

(declare-fun res!834978 () Bool)

(assert (=> b!1251972 (=> (not res!834978) (not e!711009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81060 (_ BitVec 32)) Bool)

(assert (=> b!1251972 (= res!834978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251973 () Bool)

(assert (=> b!1251973 (= e!711009 (not true))))

(declare-datatypes ((tuple2!20520 0))(
  ( (tuple2!20521 (_1!10271 (_ BitVec 64)) (_2!10271 V!47627)) )
))
(declare-datatypes ((List!27753 0))(
  ( (Nil!27750) (Cons!27749 (h!28958 tuple2!20520) (t!41230 List!27753)) )
))
(declare-datatypes ((ListLongMap!18393 0))(
  ( (ListLongMap!18394 (toList!9212 List!27753)) )
))
(declare-fun lt!565121 () ListLongMap!18393)

(declare-fun lt!565123 () ListLongMap!18393)

(assert (=> b!1251973 (= lt!565121 lt!565123)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47627)

(declare-datatypes ((Unit!41613 0))(
  ( (Unit!41614) )
))
(declare-fun lt!565122 () Unit!41613)

(declare-fun zeroValue!871 () V!47627)

(declare-fun minValueBefore!43 () V!47627)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!972 (array!81060 array!81058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47627 V!47627 V!47627 V!47627 (_ BitVec 32) Int) Unit!41613)

(assert (=> b!1251973 (= lt!565122 (lemmaNoChangeToArrayThenSameMapNoExtras!972 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5608 (array!81060 array!81058 (_ BitVec 32) (_ BitVec 32) V!47627 V!47627 (_ BitVec 32) Int) ListLongMap!18393)

(assert (=> b!1251973 (= lt!565123 (getCurrentListMapNoExtraKeys!5608 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251973 (= lt!565121 (getCurrentListMapNoExtraKeys!5608 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251974 () Bool)

(assert (=> b!1251974 (= e!711010 tp_is_empty!31697)))

(declare-fun b!1251975 () Bool)

(declare-fun e!711008 () Bool)

(assert (=> b!1251975 (= e!711008 (and e!711007 mapRes!49315))))

(declare-fun condMapEmpty!49315 () Bool)

(declare-fun mapDefault!49315 () ValueCell!15085)

