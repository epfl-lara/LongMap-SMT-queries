; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107038 () Bool)

(assert start!107038)

(declare-fun b_free!27543 () Bool)

(declare-fun b_next!27543 () Bool)

(assert (=> start!107038 (= b_free!27543 (not b_next!27543))))

(declare-fun tp!96856 () Bool)

(declare-fun b_and!45575 () Bool)

(assert (=> start!107038 (= tp!96856 b_and!45575)))

(declare-fun b!1269051 () Bool)

(declare-fun res!844564 () Bool)

(declare-fun e!723285 () Bool)

(assert (=> b!1269051 (=> (not res!844564) (not e!723285))))

(declare-datatypes ((array!82718 0))(
  ( (array!82719 (arr!39896 (Array (_ BitVec 32) (_ BitVec 64))) (size!40432 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82718)

(declare-datatypes ((List!28404 0))(
  ( (Nil!28401) (Cons!28400 (h!29609 (_ BitVec 64)) (t!41933 List!28404)) )
))
(declare-fun arrayNoDuplicates!0 (array!82718 (_ BitVec 32) List!28404) Bool)

(assert (=> b!1269051 (= res!844564 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28401))))

(declare-fun b!1269052 () Bool)

(declare-fun res!844563 () Bool)

(assert (=> b!1269052 (=> (not res!844563) (not e!723285))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1269052 (= res!844563 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40432 _keys!1364)) (bvslt from!1698 (size!40432 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269053 () Bool)

(assert (=> b!1269053 (= e!723285 (not true))))

(declare-datatypes ((V!48829 0))(
  ( (V!48830 (val!16438 Int)) )
))
(declare-datatypes ((ValueCell!15510 0))(
  ( (ValueCellFull!15510 (v!19075 V!48829)) (EmptyCell!15510) )
))
(declare-datatypes ((array!82720 0))(
  ( (array!82721 (arr!39897 (Array (_ BitVec 32) ValueCell!15510)) (size!40433 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82720)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48829)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48829)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48829)

(declare-fun zeroValueBefore!52 () V!48829)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21290 0))(
  ( (tuple2!21291 (_1!10656 (_ BitVec 64)) (_2!10656 V!48829)) )
))
(declare-datatypes ((List!28405 0))(
  ( (Nil!28402) (Cons!28401 (h!29610 tuple2!21290) (t!41934 List!28405)) )
))
(declare-datatypes ((ListLongMap!19019 0))(
  ( (ListLongMap!19020 (toList!9525 List!28405)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5857 (array!82718 array!82720 (_ BitVec 32) (_ BitVec 32) V!48829 V!48829 (_ BitVec 32) Int) ListLongMap!19019)

(assert (=> b!1269053 (= (getCurrentListMapNoExtraKeys!5857 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5857 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42236 0))(
  ( (Unit!42237) )
))
(declare-fun lt!574527 () Unit!42236)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1199 (array!82718 array!82720 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48829 V!48829 V!48829 V!48829 (_ BitVec 32) Int) Unit!42236)

(assert (=> b!1269053 (= lt!574527 (lemmaNoChangeToArrayThenSameMapNoExtras!1199 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun res!844565 () Bool)

(assert (=> start!107038 (=> (not res!844565) (not e!723285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107038 (= res!844565 (validMask!0 mask!1730))))

(assert (=> start!107038 e!723285))

(declare-fun e!723284 () Bool)

(declare-fun array_inv!30353 (array!82720) Bool)

(assert (=> start!107038 (and (array_inv!30353 _values!1134) e!723284)))

(assert (=> start!107038 true))

(declare-fun array_inv!30354 (array!82718) Bool)

(assert (=> start!107038 (array_inv!30354 _keys!1364)))

(declare-fun tp_is_empty!32727 () Bool)

(assert (=> start!107038 tp_is_empty!32727))

(assert (=> start!107038 tp!96856))

(declare-fun b!1269054 () Bool)

(declare-fun e!723286 () Bool)

(assert (=> b!1269054 (= e!723286 tp_is_empty!32727)))

(declare-fun b!1269055 () Bool)

(declare-fun mapRes!50671 () Bool)

(assert (=> b!1269055 (= e!723284 (and e!723286 mapRes!50671))))

(declare-fun condMapEmpty!50671 () Bool)

(declare-fun mapDefault!50671 () ValueCell!15510)

(assert (=> b!1269055 (= condMapEmpty!50671 (= (arr!39897 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15510)) mapDefault!50671)))))

(declare-fun b!1269056 () Bool)

(declare-fun res!844562 () Bool)

(assert (=> b!1269056 (=> (not res!844562) (not e!723285))))

(assert (=> b!1269056 (= res!844562 (and (= (size!40433 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40432 _keys!1364) (size!40433 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269057 () Bool)

(declare-fun e!723288 () Bool)

(assert (=> b!1269057 (= e!723288 tp_is_empty!32727)))

(declare-fun b!1269058 () Bool)

(declare-fun res!844561 () Bool)

(assert (=> b!1269058 (=> (not res!844561) (not e!723285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82718 (_ BitVec 32)) Bool)

(assert (=> b!1269058 (= res!844561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50671 () Bool)

(assert (=> mapIsEmpty!50671 mapRes!50671))

(declare-fun mapNonEmpty!50671 () Bool)

(declare-fun tp!96855 () Bool)

(assert (=> mapNonEmpty!50671 (= mapRes!50671 (and tp!96855 e!723288))))

(declare-fun mapKey!50671 () (_ BitVec 32))

(declare-fun mapRest!50671 () (Array (_ BitVec 32) ValueCell!15510))

(declare-fun mapValue!50671 () ValueCell!15510)

(assert (=> mapNonEmpty!50671 (= (arr!39897 _values!1134) (store mapRest!50671 mapKey!50671 mapValue!50671))))

(assert (= (and start!107038 res!844565) b!1269056))

(assert (= (and b!1269056 res!844562) b!1269058))

(assert (= (and b!1269058 res!844561) b!1269051))

(assert (= (and b!1269051 res!844564) b!1269052))

(assert (= (and b!1269052 res!844563) b!1269053))

(assert (= (and b!1269055 condMapEmpty!50671) mapIsEmpty!50671))

(assert (= (and b!1269055 (not condMapEmpty!50671)) mapNonEmpty!50671))

(get-info :version)

(assert (= (and mapNonEmpty!50671 ((_ is ValueCellFull!15510) mapValue!50671)) b!1269057))

(assert (= (and b!1269055 ((_ is ValueCellFull!15510) mapDefault!50671)) b!1269054))

(assert (= start!107038 b!1269055))

(declare-fun m!1167689 () Bool)

(assert (=> b!1269053 m!1167689))

(declare-fun m!1167691 () Bool)

(assert (=> b!1269053 m!1167691))

(declare-fun m!1167693 () Bool)

(assert (=> b!1269053 m!1167693))

(declare-fun m!1167695 () Bool)

(assert (=> start!107038 m!1167695))

(declare-fun m!1167697 () Bool)

(assert (=> start!107038 m!1167697))

(declare-fun m!1167699 () Bool)

(assert (=> start!107038 m!1167699))

(declare-fun m!1167701 () Bool)

(assert (=> b!1269058 m!1167701))

(declare-fun m!1167703 () Bool)

(assert (=> b!1269051 m!1167703))

(declare-fun m!1167705 () Bool)

(assert (=> mapNonEmpty!50671 m!1167705))

(check-sat (not b!1269053) (not b!1269058) (not start!107038) (not b!1269051) tp_is_empty!32727 (not mapNonEmpty!50671) (not b_next!27543) b_and!45575)
(check-sat b_and!45575 (not b_next!27543))
