; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107110 () Bool)

(assert start!107110)

(declare-fun b_free!27615 () Bool)

(declare-fun b_next!27615 () Bool)

(assert (=> start!107110 (= b_free!27615 (not b_next!27615))))

(declare-fun tp!97072 () Bool)

(declare-fun b_and!45647 () Bool)

(assert (=> start!107110 (= tp!97072 b_and!45647)))

(declare-fun mapIsEmpty!50779 () Bool)

(declare-fun mapRes!50779 () Bool)

(assert (=> mapIsEmpty!50779 mapRes!50779))

(declare-fun b!1269915 () Bool)

(declare-fun e!723824 () Bool)

(declare-fun e!723825 () Bool)

(assert (=> b!1269915 (= e!723824 (and e!723825 mapRes!50779))))

(declare-fun condMapEmpty!50779 () Bool)

(declare-datatypes ((V!48925 0))(
  ( (V!48926 (val!16474 Int)) )
))
(declare-datatypes ((ValueCell!15546 0))(
  ( (ValueCellFull!15546 (v!19111 V!48925)) (EmptyCell!15546) )
))
(declare-datatypes ((array!82860 0))(
  ( (array!82861 (arr!39967 (Array (_ BitVec 32) ValueCell!15546)) (size!40503 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82860)

(declare-fun mapDefault!50779 () ValueCell!15546)

(assert (=> b!1269915 (= condMapEmpty!50779 (= (arr!39967 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15546)) mapDefault!50779)))))

(declare-fun b!1269916 () Bool)

(declare-fun res!845102 () Bool)

(declare-fun e!723826 () Bool)

(assert (=> b!1269916 (=> (not res!845102) (not e!723826))))

(declare-datatypes ((array!82862 0))(
  ( (array!82863 (arr!39968 (Array (_ BitVec 32) (_ BitVec 64))) (size!40504 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82862)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82862 (_ BitVec 32)) Bool)

(assert (=> b!1269916 (= res!845102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269917 () Bool)

(assert (=> b!1269917 (= e!723826 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48925)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48925)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48925)

(declare-fun zeroValueBefore!52 () V!48925)

(declare-datatypes ((tuple2!21342 0))(
  ( (tuple2!21343 (_1!10682 (_ BitVec 64)) (_2!10682 V!48925)) )
))
(declare-datatypes ((List!28456 0))(
  ( (Nil!28453) (Cons!28452 (h!29661 tuple2!21342) (t!41985 List!28456)) )
))
(declare-datatypes ((ListLongMap!19071 0))(
  ( (ListLongMap!19072 (toList!9551 List!28456)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5883 (array!82862 array!82860 (_ BitVec 32) (_ BitVec 32) V!48925 V!48925 (_ BitVec 32) Int) ListLongMap!19071)

(assert (=> b!1269917 (= (getCurrentListMapNoExtraKeys!5883 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5883 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42288 0))(
  ( (Unit!42289) )
))
(declare-fun lt!574635 () Unit!42288)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1225 (array!82862 array!82860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48925 V!48925 V!48925 V!48925 (_ BitVec 32) Int) Unit!42288)

(assert (=> b!1269917 (= lt!574635 (lemmaNoChangeToArrayThenSameMapNoExtras!1225 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269918 () Bool)

(declare-fun e!723828 () Bool)

(declare-fun tp_is_empty!32799 () Bool)

(assert (=> b!1269918 (= e!723828 tp_is_empty!32799)))

(declare-fun mapNonEmpty!50779 () Bool)

(declare-fun tp!97071 () Bool)

(assert (=> mapNonEmpty!50779 (= mapRes!50779 (and tp!97071 e!723828))))

(declare-fun mapValue!50779 () ValueCell!15546)

(declare-fun mapKey!50779 () (_ BitVec 32))

(declare-fun mapRest!50779 () (Array (_ BitVec 32) ValueCell!15546))

(assert (=> mapNonEmpty!50779 (= (arr!39967 _values!1134) (store mapRest!50779 mapKey!50779 mapValue!50779))))

(declare-fun res!845104 () Bool)

(assert (=> start!107110 (=> (not res!845104) (not e!723826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107110 (= res!845104 (validMask!0 mask!1730))))

(assert (=> start!107110 e!723826))

(declare-fun array_inv!30403 (array!82860) Bool)

(assert (=> start!107110 (and (array_inv!30403 _values!1134) e!723824)))

(assert (=> start!107110 true))

(declare-fun array_inv!30404 (array!82862) Bool)

(assert (=> start!107110 (array_inv!30404 _keys!1364)))

(assert (=> start!107110 tp_is_empty!32799))

(assert (=> start!107110 tp!97072))

(declare-fun b!1269919 () Bool)

(assert (=> b!1269919 (= e!723825 tp_is_empty!32799)))

(declare-fun b!1269920 () Bool)

(declare-fun res!845105 () Bool)

(assert (=> b!1269920 (=> (not res!845105) (not e!723826))))

(assert (=> b!1269920 (= res!845105 (and (= (size!40503 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40504 _keys!1364) (size!40503 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269921 () Bool)

(declare-fun res!845101 () Bool)

(assert (=> b!1269921 (=> (not res!845101) (not e!723826))))

(assert (=> b!1269921 (= res!845101 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40504 _keys!1364)) (bvslt from!1698 (size!40504 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269922 () Bool)

(declare-fun res!845103 () Bool)

(assert (=> b!1269922 (=> (not res!845103) (not e!723826))))

(declare-datatypes ((List!28457 0))(
  ( (Nil!28454) (Cons!28453 (h!29662 (_ BitVec 64)) (t!41986 List!28457)) )
))
(declare-fun arrayNoDuplicates!0 (array!82862 (_ BitVec 32) List!28457) Bool)

(assert (=> b!1269922 (= res!845103 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28454))))

(assert (= (and start!107110 res!845104) b!1269920))

(assert (= (and b!1269920 res!845105) b!1269916))

(assert (= (and b!1269916 res!845102) b!1269922))

(assert (= (and b!1269922 res!845103) b!1269921))

(assert (= (and b!1269921 res!845101) b!1269917))

(assert (= (and b!1269915 condMapEmpty!50779) mapIsEmpty!50779))

(assert (= (and b!1269915 (not condMapEmpty!50779)) mapNonEmpty!50779))

(get-info :version)

(assert (= (and mapNonEmpty!50779 ((_ is ValueCellFull!15546) mapValue!50779)) b!1269918))

(assert (= (and b!1269915 ((_ is ValueCellFull!15546) mapDefault!50779)) b!1269919))

(assert (= start!107110 b!1269915))

(declare-fun m!1168337 () Bool)

(assert (=> mapNonEmpty!50779 m!1168337))

(declare-fun m!1168339 () Bool)

(assert (=> b!1269916 m!1168339))

(declare-fun m!1168341 () Bool)

(assert (=> start!107110 m!1168341))

(declare-fun m!1168343 () Bool)

(assert (=> start!107110 m!1168343))

(declare-fun m!1168345 () Bool)

(assert (=> start!107110 m!1168345))

(declare-fun m!1168347 () Bool)

(assert (=> b!1269922 m!1168347))

(declare-fun m!1168349 () Bool)

(assert (=> b!1269917 m!1168349))

(declare-fun m!1168351 () Bool)

(assert (=> b!1269917 m!1168351))

(declare-fun m!1168353 () Bool)

(assert (=> b!1269917 m!1168353))

(check-sat (not b_next!27615) (not b!1269916) (not start!107110) tp_is_empty!32799 (not b!1269917) (not mapNonEmpty!50779) (not b!1269922) b_and!45647)
(check-sat b_and!45647 (not b_next!27615))
