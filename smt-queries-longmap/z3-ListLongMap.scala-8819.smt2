; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107362 () Bool)

(assert start!107362)

(declare-fun b_free!27643 () Bool)

(declare-fun b_next!27643 () Bool)

(assert (=> start!107362 (= b_free!27643 (not b_next!27643))))

(declare-fun tp!97155 () Bool)

(declare-fun b_and!45677 () Bool)

(assert (=> start!107362 (= tp!97155 b_and!45677)))

(declare-fun b!1271556 () Bool)

(declare-fun e!724881 () Bool)

(assert (=> b!1271556 (= e!724881 (not true))))

(declare-datatypes ((V!48963 0))(
  ( (V!48964 (val!16488 Int)) )
))
(declare-datatypes ((ValueCell!15560 0))(
  ( (ValueCellFull!15560 (v!19120 V!48963)) (EmptyCell!15560) )
))
(declare-datatypes ((array!82947 0))(
  ( (array!82948 (arr!40006 (Array (_ BitVec 32) ValueCell!15560)) (size!40543 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82947)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82949 0))(
  ( (array!82950 (arr!40007 (Array (_ BitVec 32) (_ BitVec 64))) (size!40544 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82949)

(declare-fun minValueAfter!52 () V!48963)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48963)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48963)

(declare-fun zeroValueBefore!52 () V!48963)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21366 0))(
  ( (tuple2!21367 (_1!10694 (_ BitVec 64)) (_2!10694 V!48963)) )
))
(declare-datatypes ((List!28510 0))(
  ( (Nil!28507) (Cons!28506 (h!29724 tuple2!21366) (t!42031 List!28510)) )
))
(declare-datatypes ((ListLongMap!19103 0))(
  ( (ListLongMap!19104 (toList!9567 List!28510)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5939 (array!82949 array!82947 (_ BitVec 32) (_ BitVec 32) V!48963 V!48963 (_ BitVec 32) Int) ListLongMap!19103)

(assert (=> b!1271556 (= (getCurrentListMapNoExtraKeys!5939 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5939 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42275 0))(
  ( (Unit!42276) )
))
(declare-fun lt!575161 () Unit!42275)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1229 (array!82949 array!82947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48963 V!48963 V!48963 V!48963 (_ BitVec 32) Int) Unit!42275)

(assert (=> b!1271556 (= lt!575161 (lemmaNoChangeToArrayThenSameMapNoExtras!1229 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50821 () Bool)

(declare-fun mapRes!50821 () Bool)

(declare-fun tp!97156 () Bool)

(declare-fun e!724885 () Bool)

(assert (=> mapNonEmpty!50821 (= mapRes!50821 (and tp!97156 e!724885))))

(declare-fun mapKey!50821 () (_ BitVec 32))

(declare-fun mapValue!50821 () ValueCell!15560)

(declare-fun mapRest!50821 () (Array (_ BitVec 32) ValueCell!15560))

(assert (=> mapNonEmpty!50821 (= (arr!40006 _values!1134) (store mapRest!50821 mapKey!50821 mapValue!50821))))

(declare-fun b!1271557 () Bool)

(declare-fun e!724882 () Bool)

(declare-fun e!724884 () Bool)

(assert (=> b!1271557 (= e!724882 (and e!724884 mapRes!50821))))

(declare-fun condMapEmpty!50821 () Bool)

(declare-fun mapDefault!50821 () ValueCell!15560)

(assert (=> b!1271557 (= condMapEmpty!50821 (= (arr!40006 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15560)) mapDefault!50821)))))

(declare-fun b!1271558 () Bool)

(declare-fun res!845835 () Bool)

(assert (=> b!1271558 (=> (not res!845835) (not e!724881))))

(assert (=> b!1271558 (= res!845835 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40544 _keys!1364)) (bvslt from!1698 (size!40544 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1271559 () Bool)

(declare-fun tp_is_empty!32827 () Bool)

(assert (=> b!1271559 (= e!724884 tp_is_empty!32827)))

(declare-fun b!1271560 () Bool)

(declare-fun res!845834 () Bool)

(assert (=> b!1271560 (=> (not res!845834) (not e!724881))))

(declare-datatypes ((List!28511 0))(
  ( (Nil!28508) (Cons!28507 (h!29725 (_ BitVec 64)) (t!42032 List!28511)) )
))
(declare-fun arrayNoDuplicates!0 (array!82949 (_ BitVec 32) List!28511) Bool)

(assert (=> b!1271560 (= res!845834 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28508))))

(declare-fun res!845831 () Bool)

(assert (=> start!107362 (=> (not res!845831) (not e!724881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107362 (= res!845831 (validMask!0 mask!1730))))

(assert (=> start!107362 e!724881))

(declare-fun array_inv!30607 (array!82947) Bool)

(assert (=> start!107362 (and (array_inv!30607 _values!1134) e!724882)))

(assert (=> start!107362 true))

(declare-fun array_inv!30608 (array!82949) Bool)

(assert (=> start!107362 (array_inv!30608 _keys!1364)))

(assert (=> start!107362 tp_is_empty!32827))

(assert (=> start!107362 tp!97155))

(declare-fun mapIsEmpty!50821 () Bool)

(assert (=> mapIsEmpty!50821 mapRes!50821))

(declare-fun b!1271561 () Bool)

(assert (=> b!1271561 (= e!724885 tp_is_empty!32827)))

(declare-fun b!1271562 () Bool)

(declare-fun res!845832 () Bool)

(assert (=> b!1271562 (=> (not res!845832) (not e!724881))))

(assert (=> b!1271562 (= res!845832 (and (= (size!40543 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40544 _keys!1364) (size!40543 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271563 () Bool)

(declare-fun res!845833 () Bool)

(assert (=> b!1271563 (=> (not res!845833) (not e!724881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82949 (_ BitVec 32)) Bool)

(assert (=> b!1271563 (= res!845833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107362 res!845831) b!1271562))

(assert (= (and b!1271562 res!845832) b!1271563))

(assert (= (and b!1271563 res!845833) b!1271560))

(assert (= (and b!1271560 res!845834) b!1271558))

(assert (= (and b!1271558 res!845835) b!1271556))

(assert (= (and b!1271557 condMapEmpty!50821) mapIsEmpty!50821))

(assert (= (and b!1271557 (not condMapEmpty!50821)) mapNonEmpty!50821))

(get-info :version)

(assert (= (and mapNonEmpty!50821 ((_ is ValueCellFull!15560) mapValue!50821)) b!1271561))

(assert (= (and b!1271557 ((_ is ValueCellFull!15560) mapDefault!50821)) b!1271559))

(assert (= start!107362 b!1271557))

(declare-fun m!1170201 () Bool)

(assert (=> b!1271556 m!1170201))

(declare-fun m!1170203 () Bool)

(assert (=> b!1271556 m!1170203))

(declare-fun m!1170205 () Bool)

(assert (=> b!1271556 m!1170205))

(declare-fun m!1170207 () Bool)

(assert (=> b!1271563 m!1170207))

(declare-fun m!1170209 () Bool)

(assert (=> start!107362 m!1170209))

(declare-fun m!1170211 () Bool)

(assert (=> start!107362 m!1170211))

(declare-fun m!1170213 () Bool)

(assert (=> start!107362 m!1170213))

(declare-fun m!1170215 () Bool)

(assert (=> b!1271560 m!1170215))

(declare-fun m!1170217 () Bool)

(assert (=> mapNonEmpty!50821 m!1170217))

(check-sat b_and!45677 (not start!107362) (not mapNonEmpty!50821) (not b!1271556) (not b_next!27643) tp_is_empty!32827 (not b!1271563) (not b!1271560))
(check-sat b_and!45677 (not b_next!27643))
