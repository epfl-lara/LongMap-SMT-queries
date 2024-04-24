; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107314 () Bool)

(assert start!107314)

(declare-fun b_free!27595 () Bool)

(declare-fun b_next!27595 () Bool)

(assert (=> start!107314 (= b_free!27595 (not b_next!27595))))

(declare-fun tp!97012 () Bool)

(declare-fun b_and!45629 () Bool)

(assert (=> start!107314 (= tp!97012 b_and!45629)))

(declare-fun b!1270980 () Bool)

(declare-fun e!724525 () Bool)

(declare-fun tp_is_empty!32779 () Bool)

(assert (=> b!1270980 (= e!724525 tp_is_empty!32779)))

(declare-fun b!1270981 () Bool)

(declare-fun res!845475 () Bool)

(declare-fun e!724524 () Bool)

(assert (=> b!1270981 (=> (not res!845475) (not e!724524))))

(declare-datatypes ((array!82857 0))(
  ( (array!82858 (arr!39961 (Array (_ BitVec 32) (_ BitVec 64))) (size!40498 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82857)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82857 (_ BitVec 32)) Bool)

(assert (=> b!1270981 (= res!845475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270982 () Bool)

(assert (=> b!1270982 (= e!724524 (not true))))

(declare-datatypes ((V!48899 0))(
  ( (V!48900 (val!16464 Int)) )
))
(declare-datatypes ((ValueCell!15536 0))(
  ( (ValueCellFull!15536 (v!19096 V!48899)) (EmptyCell!15536) )
))
(declare-datatypes ((array!82859 0))(
  ( (array!82860 (arr!39962 (Array (_ BitVec 32) ValueCell!15536)) (size!40499 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82859)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48899)

(declare-fun minValueBefore!52 () V!48899)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48899)

(declare-fun zeroValueBefore!52 () V!48899)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((tuple2!21332 0))(
  ( (tuple2!21333 (_1!10677 (_ BitVec 64)) (_2!10677 V!48899)) )
))
(declare-datatypes ((List!28476 0))(
  ( (Nil!28473) (Cons!28472 (h!29690 tuple2!21332) (t!41997 List!28476)) )
))
(declare-datatypes ((ListLongMap!19069 0))(
  ( (ListLongMap!19070 (toList!9550 List!28476)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5922 (array!82857 array!82859 (_ BitVec 32) (_ BitVec 32) V!48899 V!48899 (_ BitVec 32) Int) ListLongMap!19069)

(assert (=> b!1270982 (= (getCurrentListMapNoExtraKeys!5922 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5922 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42241 0))(
  ( (Unit!42242) )
))
(declare-fun lt!575089 () Unit!42241)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1212 (array!82857 array!82859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48899 V!48899 V!48899 V!48899 (_ BitVec 32) Int) Unit!42241)

(assert (=> b!1270982 (= lt!575089 (lemmaNoChangeToArrayThenSameMapNoExtras!1212 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270983 () Bool)

(declare-fun res!845474 () Bool)

(assert (=> b!1270983 (=> (not res!845474) (not e!724524))))

(declare-datatypes ((List!28477 0))(
  ( (Nil!28474) (Cons!28473 (h!29691 (_ BitVec 64)) (t!41998 List!28477)) )
))
(declare-fun arrayNoDuplicates!0 (array!82857 (_ BitVec 32) List!28477) Bool)

(assert (=> b!1270983 (= res!845474 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28474))))

(declare-fun b!1270984 () Bool)

(declare-fun e!724522 () Bool)

(declare-fun mapRes!50749 () Bool)

(assert (=> b!1270984 (= e!724522 (and e!724525 mapRes!50749))))

(declare-fun condMapEmpty!50749 () Bool)

(declare-fun mapDefault!50749 () ValueCell!15536)

(assert (=> b!1270984 (= condMapEmpty!50749 (= (arr!39962 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15536)) mapDefault!50749)))))

(declare-fun b!1270985 () Bool)

(declare-fun e!724523 () Bool)

(assert (=> b!1270985 (= e!724523 tp_is_empty!32779)))

(declare-fun res!845473 () Bool)

(assert (=> start!107314 (=> (not res!845473) (not e!724524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107314 (= res!845473 (validMask!0 mask!1730))))

(assert (=> start!107314 e!724524))

(declare-fun array_inv!30573 (array!82859) Bool)

(assert (=> start!107314 (and (array_inv!30573 _values!1134) e!724522)))

(assert (=> start!107314 true))

(declare-fun array_inv!30574 (array!82857) Bool)

(assert (=> start!107314 (array_inv!30574 _keys!1364)))

(assert (=> start!107314 tp_is_empty!32779))

(assert (=> start!107314 tp!97012))

(declare-fun mapIsEmpty!50749 () Bool)

(assert (=> mapIsEmpty!50749 mapRes!50749))

(declare-fun mapNonEmpty!50749 () Bool)

(declare-fun tp!97011 () Bool)

(assert (=> mapNonEmpty!50749 (= mapRes!50749 (and tp!97011 e!724523))))

(declare-fun mapRest!50749 () (Array (_ BitVec 32) ValueCell!15536))

(declare-fun mapValue!50749 () ValueCell!15536)

(declare-fun mapKey!50749 () (_ BitVec 32))

(assert (=> mapNonEmpty!50749 (= (arr!39962 _values!1134) (store mapRest!50749 mapKey!50749 mapValue!50749))))

(declare-fun b!1270986 () Bool)

(declare-fun res!845471 () Bool)

(assert (=> b!1270986 (=> (not res!845471) (not e!724524))))

(assert (=> b!1270986 (= res!845471 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40498 _keys!1364)) (bvslt from!1698 (size!40498 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270987 () Bool)

(declare-fun res!845472 () Bool)

(assert (=> b!1270987 (=> (not res!845472) (not e!724524))))

(assert (=> b!1270987 (= res!845472 (and (= (size!40499 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40498 _keys!1364) (size!40499 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107314 res!845473) b!1270987))

(assert (= (and b!1270987 res!845472) b!1270981))

(assert (= (and b!1270981 res!845475) b!1270983))

(assert (= (and b!1270983 res!845474) b!1270986))

(assert (= (and b!1270986 res!845471) b!1270982))

(assert (= (and b!1270984 condMapEmpty!50749) mapIsEmpty!50749))

(assert (= (and b!1270984 (not condMapEmpty!50749)) mapNonEmpty!50749))

(get-info :version)

(assert (= (and mapNonEmpty!50749 ((_ is ValueCellFull!15536) mapValue!50749)) b!1270985))

(assert (= (and b!1270984 ((_ is ValueCellFull!15536) mapDefault!50749)) b!1270980))

(assert (= start!107314 b!1270984))

(declare-fun m!1169769 () Bool)

(assert (=> mapNonEmpty!50749 m!1169769))

(declare-fun m!1169771 () Bool)

(assert (=> b!1270981 m!1169771))

(declare-fun m!1169773 () Bool)

(assert (=> start!107314 m!1169773))

(declare-fun m!1169775 () Bool)

(assert (=> start!107314 m!1169775))

(declare-fun m!1169777 () Bool)

(assert (=> start!107314 m!1169777))

(declare-fun m!1169779 () Bool)

(assert (=> b!1270982 m!1169779))

(declare-fun m!1169781 () Bool)

(assert (=> b!1270982 m!1169781))

(declare-fun m!1169783 () Bool)

(assert (=> b!1270982 m!1169783))

(declare-fun m!1169785 () Bool)

(assert (=> b!1270983 m!1169785))

(check-sat (not b!1270982) b_and!45629 (not b_next!27595) tp_is_empty!32779 (not b!1270983) (not start!107314) (not b!1270981) (not mapNonEmpty!50749))
(check-sat b_and!45629 (not b_next!27595))
