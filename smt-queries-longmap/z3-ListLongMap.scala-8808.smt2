; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107296 () Bool)

(assert start!107296)

(declare-fun b_free!27577 () Bool)

(declare-fun b_next!27577 () Bool)

(assert (=> start!107296 (= b_free!27577 (not b_next!27577))))

(declare-fun tp!96957 () Bool)

(declare-fun b_and!45611 () Bool)

(assert (=> start!107296 (= tp!96957 b_and!45611)))

(declare-fun b!1270765 () Bool)

(declare-fun e!724390 () Bool)

(declare-fun tp_is_empty!32761 () Bool)

(assert (=> b!1270765 (= e!724390 tp_is_empty!32761)))

(declare-fun b!1270766 () Bool)

(declare-fun res!845340 () Bool)

(declare-fun e!724389 () Bool)

(assert (=> b!1270766 (=> (not res!845340) (not e!724389))))

(declare-datatypes ((V!48875 0))(
  ( (V!48876 (val!16455 Int)) )
))
(declare-datatypes ((ValueCell!15527 0))(
  ( (ValueCellFull!15527 (v!19087 V!48875)) (EmptyCell!15527) )
))
(declare-datatypes ((array!82823 0))(
  ( (array!82824 (arr!39944 (Array (_ BitVec 32) ValueCell!15527)) (size!40481 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82823)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82825 0))(
  ( (array!82826 (arr!39945 (Array (_ BitVec 32) (_ BitVec 64))) (size!40482 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82825)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270766 (= res!845340 (and (= (size!40481 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40482 _keys!1364) (size!40481 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270767 () Bool)

(declare-fun res!845336 () Bool)

(assert (=> b!1270767 (=> (not res!845336) (not e!724389))))

(declare-datatypes ((List!28462 0))(
  ( (Nil!28459) (Cons!28458 (h!29676 (_ BitVec 64)) (t!41983 List!28462)) )
))
(declare-fun arrayNoDuplicates!0 (array!82825 (_ BitVec 32) List!28462) Bool)

(assert (=> b!1270767 (= res!845336 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28459))))

(declare-fun b!1270768 () Bool)

(declare-fun res!845337 () Bool)

(assert (=> b!1270768 (=> (not res!845337) (not e!724389))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1270768 (= res!845337 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40482 _keys!1364)) (bvslt from!1698 (size!40482 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270769 () Bool)

(declare-fun e!724387 () Bool)

(declare-fun e!724386 () Bool)

(declare-fun mapRes!50722 () Bool)

(assert (=> b!1270769 (= e!724387 (and e!724386 mapRes!50722))))

(declare-fun condMapEmpty!50722 () Bool)

(declare-fun mapDefault!50722 () ValueCell!15527)

(assert (=> b!1270769 (= condMapEmpty!50722 (= (arr!39944 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15527)) mapDefault!50722)))))

(declare-fun b!1270770 () Bool)

(declare-fun res!845338 () Bool)

(assert (=> b!1270770 (=> (not res!845338) (not e!724389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82825 (_ BitVec 32)) Bool)

(assert (=> b!1270770 (= res!845338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50722 () Bool)

(assert (=> mapIsEmpty!50722 mapRes!50722))

(declare-fun res!845339 () Bool)

(assert (=> start!107296 (=> (not res!845339) (not e!724389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107296 (= res!845339 (validMask!0 mask!1730))))

(assert (=> start!107296 e!724389))

(declare-fun array_inv!30559 (array!82823) Bool)

(assert (=> start!107296 (and (array_inv!30559 _values!1134) e!724387)))

(assert (=> start!107296 true))

(declare-fun array_inv!30560 (array!82825) Bool)

(assert (=> start!107296 (array_inv!30560 _keys!1364)))

(assert (=> start!107296 tp_is_empty!32761))

(assert (=> start!107296 tp!96957))

(declare-fun b!1270764 () Bool)

(assert (=> b!1270764 (= e!724386 tp_is_empty!32761)))

(declare-fun b!1270771 () Bool)

(assert (=> b!1270771 (= e!724389 (not true))))

(declare-fun minValueAfter!52 () V!48875)

(declare-fun minValueBefore!52 () V!48875)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48875)

(declare-fun zeroValueBefore!52 () V!48875)

(declare-datatypes ((tuple2!21318 0))(
  ( (tuple2!21319 (_1!10670 (_ BitVec 64)) (_2!10670 V!48875)) )
))
(declare-datatypes ((List!28463 0))(
  ( (Nil!28460) (Cons!28459 (h!29677 tuple2!21318) (t!41984 List!28463)) )
))
(declare-datatypes ((ListLongMap!19055 0))(
  ( (ListLongMap!19056 (toList!9543 List!28463)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5915 (array!82825 array!82823 (_ BitVec 32) (_ BitVec 32) V!48875 V!48875 (_ BitVec 32) Int) ListLongMap!19055)

(assert (=> b!1270771 (= (getCurrentListMapNoExtraKeys!5915 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5915 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42227 0))(
  ( (Unit!42228) )
))
(declare-fun lt!575062 () Unit!42227)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1205 (array!82825 array!82823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48875 V!48875 V!48875 V!48875 (_ BitVec 32) Int) Unit!42227)

(assert (=> b!1270771 (= lt!575062 (lemmaNoChangeToArrayThenSameMapNoExtras!1205 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50722 () Bool)

(declare-fun tp!96958 () Bool)

(assert (=> mapNonEmpty!50722 (= mapRes!50722 (and tp!96958 e!724390))))

(declare-fun mapRest!50722 () (Array (_ BitVec 32) ValueCell!15527))

(declare-fun mapKey!50722 () (_ BitVec 32))

(declare-fun mapValue!50722 () ValueCell!15527)

(assert (=> mapNonEmpty!50722 (= (arr!39944 _values!1134) (store mapRest!50722 mapKey!50722 mapValue!50722))))

(assert (= (and start!107296 res!845339) b!1270766))

(assert (= (and b!1270766 res!845340) b!1270770))

(assert (= (and b!1270770 res!845338) b!1270767))

(assert (= (and b!1270767 res!845336) b!1270768))

(assert (= (and b!1270768 res!845337) b!1270771))

(assert (= (and b!1270769 condMapEmpty!50722) mapIsEmpty!50722))

(assert (= (and b!1270769 (not condMapEmpty!50722)) mapNonEmpty!50722))

(get-info :version)

(assert (= (and mapNonEmpty!50722 ((_ is ValueCellFull!15527) mapValue!50722)) b!1270765))

(assert (= (and b!1270769 ((_ is ValueCellFull!15527) mapDefault!50722)) b!1270764))

(assert (= start!107296 b!1270769))

(declare-fun m!1169607 () Bool)

(assert (=> b!1270767 m!1169607))

(declare-fun m!1169609 () Bool)

(assert (=> start!107296 m!1169609))

(declare-fun m!1169611 () Bool)

(assert (=> start!107296 m!1169611))

(declare-fun m!1169613 () Bool)

(assert (=> start!107296 m!1169613))

(declare-fun m!1169615 () Bool)

(assert (=> b!1270771 m!1169615))

(declare-fun m!1169617 () Bool)

(assert (=> b!1270771 m!1169617))

(declare-fun m!1169619 () Bool)

(assert (=> b!1270771 m!1169619))

(declare-fun m!1169621 () Bool)

(assert (=> mapNonEmpty!50722 m!1169621))

(declare-fun m!1169623 () Bool)

(assert (=> b!1270770 m!1169623))

(check-sat (not b!1270767) (not mapNonEmpty!50722) (not b!1270770) b_and!45611 (not start!107296) (not b_next!27577) (not b!1270771) tp_is_empty!32761)
(check-sat b_and!45611 (not b_next!27577))
