; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104996 () Bool)

(assert start!104996)

(declare-fun b_free!26765 () Bool)

(declare-fun b_next!26765 () Bool)

(assert (=> start!104996 (= b_free!26765 (not b_next!26765))))

(declare-fun tp!93791 () Bool)

(declare-fun b_and!44551 () Bool)

(assert (=> start!104996 (= tp!93791 b_and!44551)))

(declare-fun b!1251477 () Bool)

(declare-fun e!710665 () Bool)

(declare-fun tp_is_empty!31667 () Bool)

(assert (=> b!1251477 (= e!710665 tp_is_empty!31667)))

(declare-fun b!1251478 () Bool)

(declare-fun res!834721 () Bool)

(declare-fun e!710661 () Bool)

(assert (=> b!1251478 (=> (not res!834721) (not e!710661))))

(declare-datatypes ((array!80998 0))(
  ( (array!80999 (arr!39064 (Array (_ BitVec 32) (_ BitVec 64))) (size!39600 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80998)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80998 (_ BitVec 32)) Bool)

(assert (=> b!1251478 (= res!834721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251479 () Bool)

(declare-fun e!710663 () Bool)

(assert (=> b!1251479 (= e!710661 (not e!710663))))

(declare-fun res!834722 () Bool)

(assert (=> b!1251479 (=> res!834722 e!710663)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251479 (= res!834722 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!47587 0))(
  ( (V!47588 (val!15896 Int)) )
))
(declare-datatypes ((tuple2!20496 0))(
  ( (tuple2!20497 (_1!10259 (_ BitVec 64)) (_2!10259 V!47587)) )
))
(declare-datatypes ((List!27729 0))(
  ( (Nil!27726) (Cons!27725 (h!28934 tuple2!20496) (t!41204 List!27729)) )
))
(declare-datatypes ((ListLongMap!18369 0))(
  ( (ListLongMap!18370 (toList!9200 List!27729)) )
))
(declare-fun lt!564846 () ListLongMap!18369)

(declare-fun lt!564842 () ListLongMap!18369)

(assert (=> b!1251479 (= lt!564846 lt!564842)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47587)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47587)

(declare-datatypes ((ValueCell!15070 0))(
  ( (ValueCellFull!15070 (v!18593 V!47587)) (EmptyCell!15070) )
))
(declare-datatypes ((array!81000 0))(
  ( (array!81001 (arr!39065 (Array (_ BitVec 32) ValueCell!15070)) (size!39601 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81000)

(declare-fun minValueBefore!43 () V!47587)

(declare-datatypes ((Unit!41587 0))(
  ( (Unit!41588) )
))
(declare-fun lt!564845 () Unit!41587)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!961 (array!80998 array!81000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47587 V!47587 V!47587 V!47587 (_ BitVec 32) Int) Unit!41587)

(assert (=> b!1251479 (= lt!564845 (lemmaNoChangeToArrayThenSameMapNoExtras!961 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5597 (array!80998 array!81000 (_ BitVec 32) (_ BitVec 32) V!47587 V!47587 (_ BitVec 32) Int) ListLongMap!18369)

(assert (=> b!1251479 (= lt!564842 (getCurrentListMapNoExtraKeys!5597 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251479 (= lt!564846 (getCurrentListMapNoExtraKeys!5597 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251480 () Bool)

(declare-fun e!710664 () Bool)

(assert (=> b!1251480 (= e!710664 tp_is_empty!31667)))

(declare-fun mapNonEmpty!49267 () Bool)

(declare-fun mapRes!49267 () Bool)

(declare-fun tp!93790 () Bool)

(assert (=> mapNonEmpty!49267 (= mapRes!49267 (and tp!93790 e!710664))))

(declare-fun mapKey!49267 () (_ BitVec 32))

(declare-fun mapValue!49267 () ValueCell!15070)

(declare-fun mapRest!49267 () (Array (_ BitVec 32) ValueCell!15070))

(assert (=> mapNonEmpty!49267 (= (arr!39065 _values!914) (store mapRest!49267 mapKey!49267 mapValue!49267))))

(declare-fun mapIsEmpty!49267 () Bool)

(assert (=> mapIsEmpty!49267 mapRes!49267))

(declare-fun res!834719 () Bool)

(assert (=> start!104996 (=> (not res!834719) (not e!710661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104996 (= res!834719 (validMask!0 mask!1466))))

(assert (=> start!104996 e!710661))

(assert (=> start!104996 true))

(assert (=> start!104996 tp!93791))

(assert (=> start!104996 tp_is_empty!31667))

(declare-fun array_inv!29797 (array!80998) Bool)

(assert (=> start!104996 (array_inv!29797 _keys!1118)))

(declare-fun e!710666 () Bool)

(declare-fun array_inv!29798 (array!81000) Bool)

(assert (=> start!104996 (and (array_inv!29798 _values!914) e!710666)))

(declare-fun b!1251481 () Bool)

(assert (=> b!1251481 (= e!710666 (and e!710665 mapRes!49267))))

(declare-fun condMapEmpty!49267 () Bool)

(declare-fun mapDefault!49267 () ValueCell!15070)

