; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107078 () Bool)

(assert start!107078)

(declare-fun b_free!27583 () Bool)

(declare-fun b_next!27583 () Bool)

(assert (=> start!107078 (= b_free!27583 (not b_next!27583))))

(declare-fun tp!96977 () Bool)

(declare-fun b_and!45597 () Bool)

(assert (=> start!107078 (= tp!96977 b_and!45597)))

(declare-fun b!1269467 () Bool)

(declare-fun e!723559 () Bool)

(declare-fun tp_is_empty!32767 () Bool)

(assert (=> b!1269467 (= e!723559 tp_is_empty!32767)))

(declare-fun b!1269468 () Bool)

(declare-fun res!844834 () Bool)

(declare-fun e!723557 () Bool)

(assert (=> b!1269468 (=> (not res!844834) (not e!723557))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82715 0))(
  ( (array!82716 (arr!39895 (Array (_ BitVec 32) (_ BitVec 64))) (size!40433 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82715)

(assert (=> b!1269468 (= res!844834 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40433 _keys!1364)) (bvslt from!1698 (size!40433 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269469 () Bool)

(assert (=> b!1269469 (= e!723557 (not true))))

(declare-datatypes ((V!48883 0))(
  ( (V!48884 (val!16458 Int)) )
))
(declare-datatypes ((ValueCell!15530 0))(
  ( (ValueCellFull!15530 (v!19094 V!48883)) (EmptyCell!15530) )
))
(declare-datatypes ((array!82717 0))(
  ( (array!82718 (arr!39896 (Array (_ BitVec 32) ValueCell!15530)) (size!40434 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82717)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48883)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48883)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48883)

(declare-fun zeroValueBefore!52 () V!48883)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21402 0))(
  ( (tuple2!21403 (_1!10712 (_ BitVec 64)) (_2!10712 V!48883)) )
))
(declare-datatypes ((List!28517 0))(
  ( (Nil!28514) (Cons!28513 (h!29722 tuple2!21402) (t!42038 List!28517)) )
))
(declare-datatypes ((ListLongMap!19131 0))(
  ( (ListLongMap!19132 (toList!9581 List!28517)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5914 (array!82715 array!82717 (_ BitVec 32) (_ BitVec 32) V!48883 V!48883 (_ BitVec 32) Int) ListLongMap!19131)

(assert (=> b!1269469 (= (getCurrentListMapNoExtraKeys!5914 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5914 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42116 0))(
  ( (Unit!42117) )
))
(declare-fun lt!574409 () Unit!42116)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1214 (array!82715 array!82717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48883 V!48883 V!48883 V!48883 (_ BitVec 32) Int) Unit!42116)

(assert (=> b!1269469 (= lt!574409 (lemmaNoChangeToArrayThenSameMapNoExtras!1214 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269470 () Bool)

(declare-fun e!723558 () Bool)

(assert (=> b!1269470 (= e!723558 tp_is_empty!32767)))

(declare-fun b!1269471 () Bool)

(declare-fun res!844838 () Bool)

(assert (=> b!1269471 (=> (not res!844838) (not e!723557))))

(declare-datatypes ((List!28518 0))(
  ( (Nil!28515) (Cons!28514 (h!29723 (_ BitVec 64)) (t!42039 List!28518)) )
))
(declare-fun arrayNoDuplicates!0 (array!82715 (_ BitVec 32) List!28518) Bool)

(assert (=> b!1269471 (= res!844838 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28515))))

(declare-fun res!844835 () Bool)

(assert (=> start!107078 (=> (not res!844835) (not e!723557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107078 (= res!844835 (validMask!0 mask!1730))))

(assert (=> start!107078 e!723557))

(declare-fun e!723556 () Bool)

(declare-fun array_inv!30513 (array!82717) Bool)

(assert (=> start!107078 (and (array_inv!30513 _values!1134) e!723556)))

(assert (=> start!107078 true))

(declare-fun array_inv!30514 (array!82715) Bool)

(assert (=> start!107078 (array_inv!30514 _keys!1364)))

(assert (=> start!107078 tp_is_empty!32767))

(assert (=> start!107078 tp!96977))

(declare-fun b!1269472 () Bool)

(declare-fun res!844836 () Bool)

(assert (=> b!1269472 (=> (not res!844836) (not e!723557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82715 (_ BitVec 32)) Bool)

(assert (=> b!1269472 (= res!844836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50731 () Bool)

(declare-fun mapRes!50731 () Bool)

(declare-fun tp!96976 () Bool)

(assert (=> mapNonEmpty!50731 (= mapRes!50731 (and tp!96976 e!723558))))

(declare-fun mapRest!50731 () (Array (_ BitVec 32) ValueCell!15530))

(declare-fun mapKey!50731 () (_ BitVec 32))

(declare-fun mapValue!50731 () ValueCell!15530)

(assert (=> mapNonEmpty!50731 (= (arr!39896 _values!1134) (store mapRest!50731 mapKey!50731 mapValue!50731))))

(declare-fun b!1269473 () Bool)

(declare-fun res!844837 () Bool)

(assert (=> b!1269473 (=> (not res!844837) (not e!723557))))

(assert (=> b!1269473 (= res!844837 (and (= (size!40434 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40433 _keys!1364) (size!40434 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50731 () Bool)

(assert (=> mapIsEmpty!50731 mapRes!50731))

(declare-fun b!1269474 () Bool)

(assert (=> b!1269474 (= e!723556 (and e!723559 mapRes!50731))))

(declare-fun condMapEmpty!50731 () Bool)

(declare-fun mapDefault!50731 () ValueCell!15530)

(assert (=> b!1269474 (= condMapEmpty!50731 (= (arr!39896 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15530)) mapDefault!50731)))))

(assert (= (and start!107078 res!844835) b!1269473))

(assert (= (and b!1269473 res!844837) b!1269472))

(assert (= (and b!1269472 res!844836) b!1269471))

(assert (= (and b!1269471 res!844838) b!1269468))

(assert (= (and b!1269468 res!844834) b!1269469))

(assert (= (and b!1269474 condMapEmpty!50731) mapIsEmpty!50731))

(assert (= (and b!1269474 (not condMapEmpty!50731)) mapNonEmpty!50731))

(get-info :version)

(assert (= (and mapNonEmpty!50731 ((_ is ValueCellFull!15530) mapValue!50731)) b!1269470))

(assert (= (and b!1269474 ((_ is ValueCellFull!15530) mapDefault!50731)) b!1269467))

(assert (= start!107078 b!1269474))

(declare-fun m!1167549 () Bool)

(assert (=> b!1269469 m!1167549))

(declare-fun m!1167551 () Bool)

(assert (=> b!1269469 m!1167551))

(declare-fun m!1167553 () Bool)

(assert (=> b!1269469 m!1167553))

(declare-fun m!1167555 () Bool)

(assert (=> b!1269472 m!1167555))

(declare-fun m!1167557 () Bool)

(assert (=> start!107078 m!1167557))

(declare-fun m!1167559 () Bool)

(assert (=> start!107078 m!1167559))

(declare-fun m!1167561 () Bool)

(assert (=> start!107078 m!1167561))

(declare-fun m!1167563 () Bool)

(assert (=> mapNonEmpty!50731 m!1167563))

(declare-fun m!1167565 () Bool)

(assert (=> b!1269471 m!1167565))

(check-sat (not b!1269471) (not b_next!27583) (not start!107078) b_and!45597 (not b!1269472) tp_is_empty!32767 (not mapNonEmpty!50731) (not b!1269469))
(check-sat b_and!45597 (not b_next!27583))
