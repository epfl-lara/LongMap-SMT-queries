; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107140 () Bool)

(assert start!107140)

(declare-fun b_free!27645 () Bool)

(declare-fun b_next!27645 () Bool)

(assert (=> start!107140 (= b_free!27645 (not b_next!27645))))

(declare-fun tp!97162 () Bool)

(declare-fun b_and!45677 () Bool)

(assert (=> start!107140 (= tp!97162 b_and!45677)))

(declare-fun res!845330 () Bool)

(declare-fun e!724051 () Bool)

(assert (=> start!107140 (=> (not res!845330) (not e!724051))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107140 (= res!845330 (validMask!0 mask!1730))))

(assert (=> start!107140 e!724051))

(declare-datatypes ((V!48965 0))(
  ( (V!48966 (val!16489 Int)) )
))
(declare-datatypes ((ValueCell!15561 0))(
  ( (ValueCellFull!15561 (v!19126 V!48965)) (EmptyCell!15561) )
))
(declare-datatypes ((array!82920 0))(
  ( (array!82921 (arr!39997 (Array (_ BitVec 32) ValueCell!15561)) (size!40533 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82920)

(declare-fun e!724052 () Bool)

(declare-fun array_inv!30421 (array!82920) Bool)

(assert (=> start!107140 (and (array_inv!30421 _values!1134) e!724052)))

(assert (=> start!107140 true))

(declare-datatypes ((array!82922 0))(
  ( (array!82923 (arr!39998 (Array (_ BitVec 32) (_ BitVec 64))) (size!40534 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82922)

(declare-fun array_inv!30422 (array!82922) Bool)

(assert (=> start!107140 (array_inv!30422 _keys!1364)))

(declare-fun tp_is_empty!32829 () Bool)

(assert (=> start!107140 tp_is_empty!32829))

(assert (=> start!107140 tp!97162))

(declare-fun mapIsEmpty!50824 () Bool)

(declare-fun mapRes!50824 () Bool)

(assert (=> mapIsEmpty!50824 mapRes!50824))

(declare-fun b!1270275 () Bool)

(declare-fun res!845329 () Bool)

(assert (=> b!1270275 (=> (not res!845329) (not e!724051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82922 (_ BitVec 32)) Bool)

(assert (=> b!1270275 (= res!845329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50824 () Bool)

(declare-fun tp!97161 () Bool)

(declare-fun e!724053 () Bool)

(assert (=> mapNonEmpty!50824 (= mapRes!50824 (and tp!97161 e!724053))))

(declare-fun mapRest!50824 () (Array (_ BitVec 32) ValueCell!15561))

(declare-fun mapValue!50824 () ValueCell!15561)

(declare-fun mapKey!50824 () (_ BitVec 32))

(assert (=> mapNonEmpty!50824 (= (arr!39997 _values!1134) (store mapRest!50824 mapKey!50824 mapValue!50824))))

(declare-fun b!1270276 () Bool)

(declare-fun res!845328 () Bool)

(assert (=> b!1270276 (=> (not res!845328) (not e!724051))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1270276 (= res!845328 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40534 _keys!1364)) (bvslt from!1698 (size!40534 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270277 () Bool)

(assert (=> b!1270277 (= e!724051 (not true))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48965)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48965)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48965)

(declare-fun zeroValueBefore!52 () V!48965)

(declare-datatypes ((tuple2!21362 0))(
  ( (tuple2!21363 (_1!10692 (_ BitVec 64)) (_2!10692 V!48965)) )
))
(declare-datatypes ((List!28478 0))(
  ( (Nil!28475) (Cons!28474 (h!29683 tuple2!21362) (t!42007 List!28478)) )
))
(declare-datatypes ((ListLongMap!19091 0))(
  ( (ListLongMap!19092 (toList!9561 List!28478)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5893 (array!82922 array!82920 (_ BitVec 32) (_ BitVec 32) V!48965 V!48965 (_ BitVec 32) Int) ListLongMap!19091)

(assert (=> b!1270277 (= (getCurrentListMapNoExtraKeys!5893 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5893 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42308 0))(
  ( (Unit!42309) )
))
(declare-fun lt!574680 () Unit!42308)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1235 (array!82922 array!82920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48965 V!48965 V!48965 V!48965 (_ BitVec 32) Int) Unit!42308)

(assert (=> b!1270277 (= lt!574680 (lemmaNoChangeToArrayThenSameMapNoExtras!1235 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270278 () Bool)

(declare-fun e!724050 () Bool)

(assert (=> b!1270278 (= e!724050 tp_is_empty!32829)))

(declare-fun b!1270279 () Bool)

(assert (=> b!1270279 (= e!724052 (and e!724050 mapRes!50824))))

(declare-fun condMapEmpty!50824 () Bool)

(declare-fun mapDefault!50824 () ValueCell!15561)

(assert (=> b!1270279 (= condMapEmpty!50824 (= (arr!39997 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15561)) mapDefault!50824)))))

(declare-fun b!1270280 () Bool)

(assert (=> b!1270280 (= e!724053 tp_is_empty!32829)))

(declare-fun b!1270281 () Bool)

(declare-fun res!845326 () Bool)

(assert (=> b!1270281 (=> (not res!845326) (not e!724051))))

(declare-datatypes ((List!28479 0))(
  ( (Nil!28476) (Cons!28475 (h!29684 (_ BitVec 64)) (t!42008 List!28479)) )
))
(declare-fun arrayNoDuplicates!0 (array!82922 (_ BitVec 32) List!28479) Bool)

(assert (=> b!1270281 (= res!845326 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28476))))

(declare-fun b!1270282 () Bool)

(declare-fun res!845327 () Bool)

(assert (=> b!1270282 (=> (not res!845327) (not e!724051))))

(assert (=> b!1270282 (= res!845327 (and (= (size!40533 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40534 _keys!1364) (size!40533 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107140 res!845330) b!1270282))

(assert (= (and b!1270282 res!845327) b!1270275))

(assert (= (and b!1270275 res!845329) b!1270281))

(assert (= (and b!1270281 res!845326) b!1270276))

(assert (= (and b!1270276 res!845328) b!1270277))

(assert (= (and b!1270279 condMapEmpty!50824) mapIsEmpty!50824))

(assert (= (and b!1270279 (not condMapEmpty!50824)) mapNonEmpty!50824))

(get-info :version)

(assert (= (and mapNonEmpty!50824 ((_ is ValueCellFull!15561) mapValue!50824)) b!1270280))

(assert (= (and b!1270279 ((_ is ValueCellFull!15561) mapDefault!50824)) b!1270278))

(assert (= start!107140 b!1270279))

(declare-fun m!1168607 () Bool)

(assert (=> start!107140 m!1168607))

(declare-fun m!1168609 () Bool)

(assert (=> start!107140 m!1168609))

(declare-fun m!1168611 () Bool)

(assert (=> start!107140 m!1168611))

(declare-fun m!1168613 () Bool)

(assert (=> b!1270275 m!1168613))

(declare-fun m!1168615 () Bool)

(assert (=> b!1270277 m!1168615))

(declare-fun m!1168617 () Bool)

(assert (=> b!1270277 m!1168617))

(declare-fun m!1168619 () Bool)

(assert (=> b!1270277 m!1168619))

(declare-fun m!1168621 () Bool)

(assert (=> b!1270281 m!1168621))

(declare-fun m!1168623 () Bool)

(assert (=> mapNonEmpty!50824 m!1168623))

(check-sat (not mapNonEmpty!50824) (not b!1270275) (not start!107140) tp_is_empty!32829 (not b!1270281) (not b_next!27645) b_and!45677 (not b!1270277))
(check-sat b_and!45677 (not b_next!27645))
