; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107078 () Bool)

(assert start!107078)

(declare-fun b_free!27583 () Bool)

(declare-fun b_next!27583 () Bool)

(assert (=> start!107078 (= b_free!27583 (not b_next!27583))))

(declare-fun tp!96975 () Bool)

(declare-fun b_and!45615 () Bool)

(assert (=> start!107078 (= tp!96975 b_and!45615)))

(declare-fun b!1269531 () Bool)

(declare-fun e!723585 () Bool)

(declare-fun tp_is_empty!32767 () Bool)

(assert (=> b!1269531 (= e!723585 tp_is_empty!32767)))

(declare-fun b!1269532 () Bool)

(declare-fun res!844865 () Bool)

(declare-fun e!723584 () Bool)

(assert (=> b!1269532 (=> (not res!844865) (not e!723584))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82796 0))(
  ( (array!82797 (arr!39935 (Array (_ BitVec 32) (_ BitVec 64))) (size!40471 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82796)

(assert (=> b!1269532 (= res!844865 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40471 _keys!1364)) (bvslt from!1698 (size!40471 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50731 () Bool)

(declare-fun mapRes!50731 () Bool)

(assert (=> mapIsEmpty!50731 mapRes!50731))

(declare-fun res!844861 () Bool)

(assert (=> start!107078 (=> (not res!844861) (not e!723584))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107078 (= res!844861 (validMask!0 mask!1730))))

(assert (=> start!107078 e!723584))

(declare-datatypes ((V!48883 0))(
  ( (V!48884 (val!16458 Int)) )
))
(declare-datatypes ((ValueCell!15530 0))(
  ( (ValueCellFull!15530 (v!19095 V!48883)) (EmptyCell!15530) )
))
(declare-datatypes ((array!82798 0))(
  ( (array!82799 (arr!39936 (Array (_ BitVec 32) ValueCell!15530)) (size!40472 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82798)

(declare-fun e!723587 () Bool)

(declare-fun array_inv!30379 (array!82798) Bool)

(assert (=> start!107078 (and (array_inv!30379 _values!1134) e!723587)))

(assert (=> start!107078 true))

(declare-fun array_inv!30380 (array!82796) Bool)

(assert (=> start!107078 (array_inv!30380 _keys!1364)))

(assert (=> start!107078 tp_is_empty!32767))

(assert (=> start!107078 tp!96975))

(declare-fun mapNonEmpty!50731 () Bool)

(declare-fun tp!96976 () Bool)

(assert (=> mapNonEmpty!50731 (= mapRes!50731 (and tp!96976 e!723585))))

(declare-fun mapKey!50731 () (_ BitVec 32))

(declare-fun mapRest!50731 () (Array (_ BitVec 32) ValueCell!15530))

(declare-fun mapValue!50731 () ValueCell!15530)

(assert (=> mapNonEmpty!50731 (= (arr!39936 _values!1134) (store mapRest!50731 mapKey!50731 mapValue!50731))))

(declare-fun b!1269533 () Bool)

(assert (=> b!1269533 (= e!723584 (not true))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48883)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48883)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48883)

(declare-fun zeroValueBefore!52 () V!48883)

(declare-datatypes ((tuple2!21318 0))(
  ( (tuple2!21319 (_1!10670 (_ BitVec 64)) (_2!10670 V!48883)) )
))
(declare-datatypes ((List!28431 0))(
  ( (Nil!28428) (Cons!28427 (h!29636 tuple2!21318) (t!41960 List!28431)) )
))
(declare-datatypes ((ListLongMap!19047 0))(
  ( (ListLongMap!19048 (toList!9539 List!28431)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5871 (array!82796 array!82798 (_ BitVec 32) (_ BitVec 32) V!48883 V!48883 (_ BitVec 32) Int) ListLongMap!19047)

(assert (=> b!1269533 (= (getCurrentListMapNoExtraKeys!5871 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5871 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42264 0))(
  ( (Unit!42265) )
))
(declare-fun lt!574587 () Unit!42264)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1213 (array!82796 array!82798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48883 V!48883 V!48883 V!48883 (_ BitVec 32) Int) Unit!42264)

(assert (=> b!1269533 (= lt!574587 (lemmaNoChangeToArrayThenSameMapNoExtras!1213 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269534 () Bool)

(declare-fun e!723586 () Bool)

(assert (=> b!1269534 (= e!723586 tp_is_empty!32767)))

(declare-fun b!1269535 () Bool)

(assert (=> b!1269535 (= e!723587 (and e!723586 mapRes!50731))))

(declare-fun condMapEmpty!50731 () Bool)

(declare-fun mapDefault!50731 () ValueCell!15530)

