; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107108 () Bool)

(assert start!107108)

(declare-fun b_free!27613 () Bool)

(declare-fun b_next!27613 () Bool)

(assert (=> start!107108 (= b_free!27613 (not b_next!27613))))

(declare-fun tp!97067 () Bool)

(declare-fun b_and!45627 () Bool)

(assert (=> start!107108 (= tp!97067 b_and!45627)))

(declare-fun b!1269827 () Bool)

(declare-fun e!723780 () Bool)

(assert (=> b!1269827 (= e!723780 (not true))))

(declare-datatypes ((V!48923 0))(
  ( (V!48924 (val!16473 Int)) )
))
(declare-datatypes ((ValueCell!15545 0))(
  ( (ValueCellFull!15545 (v!19109 V!48923)) (EmptyCell!15545) )
))
(declare-datatypes ((array!82771 0))(
  ( (array!82772 (arr!39923 (Array (_ BitVec 32) ValueCell!15545)) (size!40461 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82771)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82773 0))(
  ( (array!82774 (arr!39924 (Array (_ BitVec 32) (_ BitVec 64))) (size!40462 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82773)

(declare-fun minValueAfter!52 () V!48923)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48923)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48923)

(declare-fun zeroValueBefore!52 () V!48923)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21420 0))(
  ( (tuple2!21421 (_1!10721 (_ BitVec 64)) (_2!10721 V!48923)) )
))
(declare-datatypes ((List!28534 0))(
  ( (Nil!28531) (Cons!28530 (h!29739 tuple2!21420) (t!42055 List!28534)) )
))
(declare-datatypes ((ListLongMap!19149 0))(
  ( (ListLongMap!19150 (toList!9590 List!28534)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5923 (array!82773 array!82771 (_ BitVec 32) (_ BitVec 32) V!48923 V!48923 (_ BitVec 32) Int) ListLongMap!19149)

(assert (=> b!1269827 (= (getCurrentListMapNoExtraKeys!5923 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5923 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42134 0))(
  ( (Unit!42135) )
))
(declare-fun lt!574454 () Unit!42134)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1223 (array!82773 array!82771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48923 V!48923 V!48923 V!48923 (_ BitVec 32) Int) Unit!42134)

(assert (=> b!1269827 (= lt!574454 (lemmaNoChangeToArrayThenSameMapNoExtras!1223 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269828 () Bool)

(declare-fun e!723782 () Bool)

(declare-fun tp_is_empty!32797 () Bool)

(assert (=> b!1269828 (= e!723782 tp_is_empty!32797)))

(declare-fun mapNonEmpty!50776 () Bool)

(declare-fun mapRes!50776 () Bool)

(declare-fun tp!97066 () Bool)

(declare-fun e!723784 () Bool)

(assert (=> mapNonEmpty!50776 (= mapRes!50776 (and tp!97066 e!723784))))

(declare-fun mapRest!50776 () (Array (_ BitVec 32) ValueCell!15545))

(declare-fun mapValue!50776 () ValueCell!15545)

(declare-fun mapKey!50776 () (_ BitVec 32))

(assert (=> mapNonEmpty!50776 (= (arr!39923 _values!1134) (store mapRest!50776 mapKey!50776 mapValue!50776))))

(declare-fun b!1269829 () Bool)

(assert (=> b!1269829 (= e!723784 tp_is_empty!32797)))

(declare-fun b!1269830 () Bool)

(declare-fun res!845061 () Bool)

(assert (=> b!1269830 (=> (not res!845061) (not e!723780))))

(assert (=> b!1269830 (= res!845061 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40462 _keys!1364)) (bvslt from!1698 (size!40462 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun res!845062 () Bool)

(assert (=> start!107108 (=> (not res!845062) (not e!723780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107108 (= res!845062 (validMask!0 mask!1730))))

(assert (=> start!107108 e!723780))

(declare-fun e!723781 () Bool)

(declare-fun array_inv!30533 (array!82771) Bool)

(assert (=> start!107108 (and (array_inv!30533 _values!1134) e!723781)))

(assert (=> start!107108 true))

(declare-fun array_inv!30534 (array!82773) Bool)

(assert (=> start!107108 (array_inv!30534 _keys!1364)))

(assert (=> start!107108 tp_is_empty!32797))

(assert (=> start!107108 tp!97067))

(declare-fun b!1269831 () Bool)

(declare-fun res!845060 () Bool)

(assert (=> b!1269831 (=> (not res!845060) (not e!723780))))

(assert (=> b!1269831 (= res!845060 (and (= (size!40461 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40462 _keys!1364) (size!40461 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50776 () Bool)

(assert (=> mapIsEmpty!50776 mapRes!50776))

(declare-fun b!1269832 () Bool)

(declare-fun res!845059 () Bool)

(assert (=> b!1269832 (=> (not res!845059) (not e!723780))))

(declare-datatypes ((List!28535 0))(
  ( (Nil!28532) (Cons!28531 (h!29740 (_ BitVec 64)) (t!42056 List!28535)) )
))
(declare-fun arrayNoDuplicates!0 (array!82773 (_ BitVec 32) List!28535) Bool)

(assert (=> b!1269832 (= res!845059 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28532))))

(declare-fun b!1269833 () Bool)

(assert (=> b!1269833 (= e!723781 (and e!723782 mapRes!50776))))

(declare-fun condMapEmpty!50776 () Bool)

(declare-fun mapDefault!50776 () ValueCell!15545)

(assert (=> b!1269833 (= condMapEmpty!50776 (= (arr!39923 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15545)) mapDefault!50776)))))

(declare-fun b!1269834 () Bool)

(declare-fun res!845063 () Bool)

(assert (=> b!1269834 (=> (not res!845063) (not e!723780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82773 (_ BitVec 32)) Bool)

(assert (=> b!1269834 (= res!845063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107108 res!845062) b!1269831))

(assert (= (and b!1269831 res!845060) b!1269834))

(assert (= (and b!1269834 res!845063) b!1269832))

(assert (= (and b!1269832 res!845059) b!1269830))

(assert (= (and b!1269830 res!845061) b!1269827))

(assert (= (and b!1269833 condMapEmpty!50776) mapIsEmpty!50776))

(assert (= (and b!1269833 (not condMapEmpty!50776)) mapNonEmpty!50776))

(get-info :version)

(assert (= (and mapNonEmpty!50776 ((_ is ValueCellFull!15545) mapValue!50776)) b!1269829))

(assert (= (and b!1269833 ((_ is ValueCellFull!15545) mapDefault!50776)) b!1269828))

(assert (= start!107108 b!1269833))

(declare-fun m!1167819 () Bool)

(assert (=> mapNonEmpty!50776 m!1167819))

(declare-fun m!1167821 () Bool)

(assert (=> start!107108 m!1167821))

(declare-fun m!1167823 () Bool)

(assert (=> start!107108 m!1167823))

(declare-fun m!1167825 () Bool)

(assert (=> start!107108 m!1167825))

(declare-fun m!1167827 () Bool)

(assert (=> b!1269834 m!1167827))

(declare-fun m!1167829 () Bool)

(assert (=> b!1269827 m!1167829))

(declare-fun m!1167831 () Bool)

(assert (=> b!1269827 m!1167831))

(declare-fun m!1167833 () Bool)

(assert (=> b!1269827 m!1167833))

(declare-fun m!1167835 () Bool)

(assert (=> b!1269832 m!1167835))

(check-sat (not b!1269827) tp_is_empty!32797 (not b!1269834) (not b!1269832) (not b_next!27613) b_and!45627 (not mapNonEmpty!50776) (not start!107108))
(check-sat b_and!45627 (not b_next!27613))
