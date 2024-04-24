; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107284 () Bool)

(assert start!107284)

(declare-fun b_free!27565 () Bool)

(declare-fun b_next!27565 () Bool)

(assert (=> start!107284 (= b_free!27565 (not b_next!27565))))

(declare-fun tp!96921 () Bool)

(declare-fun b_and!45599 () Bool)

(assert (=> start!107284 (= tp!96921 b_and!45599)))

(declare-fun b!1270620 () Bool)

(declare-fun e!724296 () Bool)

(assert (=> b!1270620 (= e!724296 (not true))))

(declare-datatypes ((V!48859 0))(
  ( (V!48860 (val!16449 Int)) )
))
(declare-datatypes ((ValueCell!15521 0))(
  ( (ValueCellFull!15521 (v!19081 V!48859)) (EmptyCell!15521) )
))
(declare-datatypes ((array!82799 0))(
  ( (array!82800 (arr!39932 (Array (_ BitVec 32) ValueCell!15521)) (size!40469 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82799)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82801 0))(
  ( (array!82802 (arr!39933 (Array (_ BitVec 32) (_ BitVec 64))) (size!40470 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82801)

(declare-fun minValueAfter!52 () V!48859)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48859)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48859)

(declare-fun zeroValueBefore!52 () V!48859)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21312 0))(
  ( (tuple2!21313 (_1!10667 (_ BitVec 64)) (_2!10667 V!48859)) )
))
(declare-datatypes ((List!28454 0))(
  ( (Nil!28451) (Cons!28450 (h!29668 tuple2!21312) (t!41975 List!28454)) )
))
(declare-datatypes ((ListLongMap!19049 0))(
  ( (ListLongMap!19050 (toList!9540 List!28454)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5912 (array!82801 array!82799 (_ BitVec 32) (_ BitVec 32) V!48859 V!48859 (_ BitVec 32) Int) ListLongMap!19049)

(assert (=> b!1270620 (= (getCurrentListMapNoExtraKeys!5912 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5912 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42221 0))(
  ( (Unit!42222) )
))
(declare-fun lt!575044 () Unit!42221)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1202 (array!82801 array!82799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48859 V!48859 V!48859 V!48859 (_ BitVec 32) Int) Unit!42221)

(assert (=> b!1270620 (= lt!575044 (lemmaNoChangeToArrayThenSameMapNoExtras!1202 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270621 () Bool)

(declare-fun res!845246 () Bool)

(assert (=> b!1270621 (=> (not res!845246) (not e!724296))))

(declare-datatypes ((List!28455 0))(
  ( (Nil!28452) (Cons!28451 (h!29669 (_ BitVec 64)) (t!41976 List!28455)) )
))
(declare-fun arrayNoDuplicates!0 (array!82801 (_ BitVec 32) List!28455) Bool)

(assert (=> b!1270621 (= res!845246 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28452))))

(declare-fun b!1270622 () Bool)

(declare-fun e!724298 () Bool)

(declare-fun tp_is_empty!32749 () Bool)

(assert (=> b!1270622 (= e!724298 tp_is_empty!32749)))

(declare-fun mapNonEmpty!50704 () Bool)

(declare-fun mapRes!50704 () Bool)

(declare-fun tp!96922 () Bool)

(assert (=> mapNonEmpty!50704 (= mapRes!50704 (and tp!96922 e!724298))))

(declare-fun mapValue!50704 () ValueCell!15521)

(declare-fun mapRest!50704 () (Array (_ BitVec 32) ValueCell!15521))

(declare-fun mapKey!50704 () (_ BitVec 32))

(assert (=> mapNonEmpty!50704 (= (arr!39932 _values!1134) (store mapRest!50704 mapKey!50704 mapValue!50704))))

(declare-fun b!1270623 () Bool)

(declare-fun res!845249 () Bool)

(assert (=> b!1270623 (=> (not res!845249) (not e!724296))))

(assert (=> b!1270623 (= res!845249 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40470 _keys!1364)) (bvslt from!1698 (size!40470 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270624 () Bool)

(declare-fun res!845250 () Bool)

(assert (=> b!1270624 (=> (not res!845250) (not e!724296))))

(assert (=> b!1270624 (= res!845250 (and (= (size!40469 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40470 _keys!1364) (size!40469 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270625 () Bool)

(declare-fun e!724300 () Bool)

(declare-fun e!724297 () Bool)

(assert (=> b!1270625 (= e!724300 (and e!724297 mapRes!50704))))

(declare-fun condMapEmpty!50704 () Bool)

(declare-fun mapDefault!50704 () ValueCell!15521)

(assert (=> b!1270625 (= condMapEmpty!50704 (= (arr!39932 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15521)) mapDefault!50704)))))

(declare-fun mapIsEmpty!50704 () Bool)

(assert (=> mapIsEmpty!50704 mapRes!50704))

(declare-fun res!845248 () Bool)

(assert (=> start!107284 (=> (not res!845248) (not e!724296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107284 (= res!845248 (validMask!0 mask!1730))))

(assert (=> start!107284 e!724296))

(declare-fun array_inv!30549 (array!82799) Bool)

(assert (=> start!107284 (and (array_inv!30549 _values!1134) e!724300)))

(assert (=> start!107284 true))

(declare-fun array_inv!30550 (array!82801) Bool)

(assert (=> start!107284 (array_inv!30550 _keys!1364)))

(assert (=> start!107284 tp_is_empty!32749))

(assert (=> start!107284 tp!96921))

(declare-fun b!1270626 () Bool)

(assert (=> b!1270626 (= e!724297 tp_is_empty!32749)))

(declare-fun b!1270627 () Bool)

(declare-fun res!845247 () Bool)

(assert (=> b!1270627 (=> (not res!845247) (not e!724296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82801 (_ BitVec 32)) Bool)

(assert (=> b!1270627 (= res!845247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107284 res!845248) b!1270624))

(assert (= (and b!1270624 res!845250) b!1270627))

(assert (= (and b!1270627 res!845247) b!1270621))

(assert (= (and b!1270621 res!845246) b!1270623))

(assert (= (and b!1270623 res!845249) b!1270620))

(assert (= (and b!1270625 condMapEmpty!50704) mapIsEmpty!50704))

(assert (= (and b!1270625 (not condMapEmpty!50704)) mapNonEmpty!50704))

(get-info :version)

(assert (= (and mapNonEmpty!50704 ((_ is ValueCellFull!15521) mapValue!50704)) b!1270622))

(assert (= (and b!1270625 ((_ is ValueCellFull!15521) mapDefault!50704)) b!1270626))

(assert (= start!107284 b!1270625))

(declare-fun m!1169499 () Bool)

(assert (=> b!1270621 m!1169499))

(declare-fun m!1169501 () Bool)

(assert (=> start!107284 m!1169501))

(declare-fun m!1169503 () Bool)

(assert (=> start!107284 m!1169503))

(declare-fun m!1169505 () Bool)

(assert (=> start!107284 m!1169505))

(declare-fun m!1169507 () Bool)

(assert (=> b!1270620 m!1169507))

(declare-fun m!1169509 () Bool)

(assert (=> b!1270620 m!1169509))

(declare-fun m!1169511 () Bool)

(assert (=> b!1270620 m!1169511))

(declare-fun m!1169513 () Bool)

(assert (=> b!1270627 m!1169513))

(declare-fun m!1169515 () Bool)

(assert (=> mapNonEmpty!50704 m!1169515))

(check-sat (not mapNonEmpty!50704) b_and!45599 tp_is_empty!32749 (not b_next!27565) (not start!107284) (not b!1270621) (not b!1270627) (not b!1270620))
(check-sat b_and!45599 (not b_next!27565))
