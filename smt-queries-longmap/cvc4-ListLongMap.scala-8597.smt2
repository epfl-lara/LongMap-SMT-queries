; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104816 () Bool)

(assert start!104816)

(declare-fun b_free!26621 () Bool)

(declare-fun b_next!26621 () Bool)

(assert (=> start!104816 (= b_free!26621 (not b_next!26621))))

(declare-fun tp!93353 () Bool)

(declare-fun b_and!44389 () Bool)

(assert (=> start!104816 (= tp!93353 b_and!44389)))

(declare-fun b!1249410 () Bool)

(declare-fun res!833450 () Bool)

(declare-fun e!709116 () Bool)

(assert (=> b!1249410 (=> (not res!833450) (not e!709116))))

(declare-datatypes ((array!80728 0))(
  ( (array!80729 (arr!38931 (Array (_ BitVec 32) (_ BitVec 64))) (size!39467 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80728)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80728 (_ BitVec 32)) Bool)

(assert (=> b!1249410 (= res!833450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!833449 () Bool)

(assert (=> start!104816 (=> (not res!833449) (not e!709116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104816 (= res!833449 (validMask!0 mask!1466))))

(assert (=> start!104816 e!709116))

(assert (=> start!104816 true))

(assert (=> start!104816 tp!93353))

(declare-fun tp_is_empty!31523 () Bool)

(assert (=> start!104816 tp_is_empty!31523))

(declare-fun array_inv!29709 (array!80728) Bool)

(assert (=> start!104816 (array_inv!29709 _keys!1118)))

(declare-datatypes ((V!47395 0))(
  ( (V!47396 (val!15824 Int)) )
))
(declare-datatypes ((ValueCell!14998 0))(
  ( (ValueCellFull!14998 (v!18520 V!47395)) (EmptyCell!14998) )
))
(declare-datatypes ((array!80730 0))(
  ( (array!80731 (arr!38932 (Array (_ BitVec 32) ValueCell!14998)) (size!39468 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80730)

(declare-fun e!709113 () Bool)

(declare-fun array_inv!29710 (array!80730) Bool)

(assert (=> start!104816 (and (array_inv!29710 _values!914) e!709113)))

(declare-fun b!1249411 () Bool)

(declare-fun e!709115 () Bool)

(assert (=> b!1249411 (= e!709115 tp_is_empty!31523)))

(declare-fun b!1249412 () Bool)

(assert (=> b!1249412 (= e!709116 (not true))))

(declare-datatypes ((tuple2!20388 0))(
  ( (tuple2!20389 (_1!10205 (_ BitVec 64)) (_2!10205 V!47395)) )
))
(declare-datatypes ((List!27632 0))(
  ( (Nil!27629) (Cons!27628 (h!28837 tuple2!20388) (t!41103 List!27632)) )
))
(declare-datatypes ((ListLongMap!18261 0))(
  ( (ListLongMap!18262 (toList!9146 List!27632)) )
))
(declare-fun lt!563719 () ListLongMap!18261)

(declare-fun lt!563718 () ListLongMap!18261)

(assert (=> b!1249412 (= lt!563719 lt!563718)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47395)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47395)

(declare-datatypes ((Unit!41489 0))(
  ( (Unit!41490) )
))
(declare-fun lt!563717 () Unit!41489)

(declare-fun minValueBefore!43 () V!47395)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!917 (array!80728 array!80730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47395 V!47395 V!47395 V!47395 (_ BitVec 32) Int) Unit!41489)

(assert (=> b!1249412 (= lt!563717 (lemmaNoChangeToArrayThenSameMapNoExtras!917 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5553 (array!80728 array!80730 (_ BitVec 32) (_ BitVec 32) V!47395 V!47395 (_ BitVec 32) Int) ListLongMap!18261)

(assert (=> b!1249412 (= lt!563718 (getCurrentListMapNoExtraKeys!5553 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249412 (= lt!563719 (getCurrentListMapNoExtraKeys!5553 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49045 () Bool)

(declare-fun mapRes!49045 () Bool)

(declare-fun tp!93352 () Bool)

(declare-fun e!709117 () Bool)

(assert (=> mapNonEmpty!49045 (= mapRes!49045 (and tp!93352 e!709117))))

(declare-fun mapValue!49045 () ValueCell!14998)

(declare-fun mapRest!49045 () (Array (_ BitVec 32) ValueCell!14998))

(declare-fun mapKey!49045 () (_ BitVec 32))

(assert (=> mapNonEmpty!49045 (= (arr!38932 _values!914) (store mapRest!49045 mapKey!49045 mapValue!49045))))

(declare-fun mapIsEmpty!49045 () Bool)

(assert (=> mapIsEmpty!49045 mapRes!49045))

(declare-fun b!1249413 () Bool)

(declare-fun res!833451 () Bool)

(assert (=> b!1249413 (=> (not res!833451) (not e!709116))))

(assert (=> b!1249413 (= res!833451 (and (= (size!39468 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39467 _keys!1118) (size!39468 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249414 () Bool)

(assert (=> b!1249414 (= e!709113 (and e!709115 mapRes!49045))))

(declare-fun condMapEmpty!49045 () Bool)

(declare-fun mapDefault!49045 () ValueCell!14998)

