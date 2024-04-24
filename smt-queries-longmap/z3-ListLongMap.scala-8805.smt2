; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107278 () Bool)

(assert start!107278)

(declare-fun b_free!27559 () Bool)

(declare-fun b_next!27559 () Bool)

(assert (=> start!107278 (= b_free!27559 (not b_next!27559))))

(declare-fun tp!96904 () Bool)

(declare-fun b_and!45593 () Bool)

(assert (=> start!107278 (= tp!96904 b_and!45593)))

(declare-fun b!1270548 () Bool)

(declare-fun res!845201 () Bool)

(declare-fun e!724251 () Bool)

(assert (=> b!1270548 (=> (not res!845201) (not e!724251))))

(declare-datatypes ((array!82789 0))(
  ( (array!82790 (arr!39927 (Array (_ BitVec 32) (_ BitVec 64))) (size!40464 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82789)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82789 (_ BitVec 32)) Bool)

(assert (=> b!1270548 (= res!845201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270549 () Bool)

(declare-fun res!845205 () Bool)

(assert (=> b!1270549 (=> (not res!845205) (not e!724251))))

(declare-datatypes ((V!48851 0))(
  ( (V!48852 (val!16446 Int)) )
))
(declare-datatypes ((ValueCell!15518 0))(
  ( (ValueCellFull!15518 (v!19078 V!48851)) (EmptyCell!15518) )
))
(declare-datatypes ((array!82791 0))(
  ( (array!82792 (arr!39928 (Array (_ BitVec 32) ValueCell!15518)) (size!40465 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82791)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270549 (= res!845205 (and (= (size!40465 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40464 _keys!1364) (size!40465 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845203 () Bool)

(assert (=> start!107278 (=> (not res!845203) (not e!724251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107278 (= res!845203 (validMask!0 mask!1730))))

(assert (=> start!107278 e!724251))

(declare-fun e!724253 () Bool)

(declare-fun array_inv!30545 (array!82791) Bool)

(assert (=> start!107278 (and (array_inv!30545 _values!1134) e!724253)))

(assert (=> start!107278 true))

(declare-fun array_inv!30546 (array!82789) Bool)

(assert (=> start!107278 (array_inv!30546 _keys!1364)))

(declare-fun tp_is_empty!32743 () Bool)

(assert (=> start!107278 tp_is_empty!32743))

(assert (=> start!107278 tp!96904))

(declare-fun b!1270550 () Bool)

(declare-fun e!724255 () Bool)

(declare-fun mapRes!50695 () Bool)

(assert (=> b!1270550 (= e!724253 (and e!724255 mapRes!50695))))

(declare-fun condMapEmpty!50695 () Bool)

(declare-fun mapDefault!50695 () ValueCell!15518)

(assert (=> b!1270550 (= condMapEmpty!50695 (= (arr!39928 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15518)) mapDefault!50695)))))

(declare-fun b!1270551 () Bool)

(declare-fun res!845204 () Bool)

(assert (=> b!1270551 (=> (not res!845204) (not e!724251))))

(declare-datatypes ((List!28450 0))(
  ( (Nil!28447) (Cons!28446 (h!29664 (_ BitVec 64)) (t!41971 List!28450)) )
))
(declare-fun arrayNoDuplicates!0 (array!82789 (_ BitVec 32) List!28450) Bool)

(assert (=> b!1270551 (= res!845204 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28447))))

(declare-fun b!1270552 () Bool)

(assert (=> b!1270552 (= e!724251 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48851)

(declare-fun minValueBefore!52 () V!48851)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48851)

(declare-fun zeroValueBefore!52 () V!48851)

(declare-datatypes ((tuple2!21308 0))(
  ( (tuple2!21309 (_1!10665 (_ BitVec 64)) (_2!10665 V!48851)) )
))
(declare-datatypes ((List!28451 0))(
  ( (Nil!28448) (Cons!28447 (h!29665 tuple2!21308) (t!41972 List!28451)) )
))
(declare-datatypes ((ListLongMap!19045 0))(
  ( (ListLongMap!19046 (toList!9538 List!28451)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5910 (array!82789 array!82791 (_ BitVec 32) (_ BitVec 32) V!48851 V!48851 (_ BitVec 32) Int) ListLongMap!19045)

(assert (=> b!1270552 (= (getCurrentListMapNoExtraKeys!5910 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5910 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42217 0))(
  ( (Unit!42218) )
))
(declare-fun lt!575035 () Unit!42217)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1200 (array!82789 array!82791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48851 V!48851 V!48851 V!48851 (_ BitVec 32) Int) Unit!42217)

(assert (=> b!1270552 (= lt!575035 (lemmaNoChangeToArrayThenSameMapNoExtras!1200 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50695 () Bool)

(declare-fun tp!96903 () Bool)

(declare-fun e!724254 () Bool)

(assert (=> mapNonEmpty!50695 (= mapRes!50695 (and tp!96903 e!724254))))

(declare-fun mapValue!50695 () ValueCell!15518)

(declare-fun mapRest!50695 () (Array (_ BitVec 32) ValueCell!15518))

(declare-fun mapKey!50695 () (_ BitVec 32))

(assert (=> mapNonEmpty!50695 (= (arr!39928 _values!1134) (store mapRest!50695 mapKey!50695 mapValue!50695))))

(declare-fun mapIsEmpty!50695 () Bool)

(assert (=> mapIsEmpty!50695 mapRes!50695))

(declare-fun b!1270553 () Bool)

(assert (=> b!1270553 (= e!724255 tp_is_empty!32743)))

(declare-fun b!1270554 () Bool)

(declare-fun res!845202 () Bool)

(assert (=> b!1270554 (=> (not res!845202) (not e!724251))))

(assert (=> b!1270554 (= res!845202 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40464 _keys!1364)) (bvslt from!1698 (size!40464 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270555 () Bool)

(assert (=> b!1270555 (= e!724254 tp_is_empty!32743)))

(assert (= (and start!107278 res!845203) b!1270549))

(assert (= (and b!1270549 res!845205) b!1270548))

(assert (= (and b!1270548 res!845201) b!1270551))

(assert (= (and b!1270551 res!845204) b!1270554))

(assert (= (and b!1270554 res!845202) b!1270552))

(assert (= (and b!1270550 condMapEmpty!50695) mapIsEmpty!50695))

(assert (= (and b!1270550 (not condMapEmpty!50695)) mapNonEmpty!50695))

(get-info :version)

(assert (= (and mapNonEmpty!50695 ((_ is ValueCellFull!15518) mapValue!50695)) b!1270555))

(assert (= (and b!1270550 ((_ is ValueCellFull!15518) mapDefault!50695)) b!1270553))

(assert (= start!107278 b!1270550))

(declare-fun m!1169445 () Bool)

(assert (=> mapNonEmpty!50695 m!1169445))

(declare-fun m!1169447 () Bool)

(assert (=> b!1270551 m!1169447))

(declare-fun m!1169449 () Bool)

(assert (=> start!107278 m!1169449))

(declare-fun m!1169451 () Bool)

(assert (=> start!107278 m!1169451))

(declare-fun m!1169453 () Bool)

(assert (=> start!107278 m!1169453))

(declare-fun m!1169455 () Bool)

(assert (=> b!1270548 m!1169455))

(declare-fun m!1169457 () Bool)

(assert (=> b!1270552 m!1169457))

(declare-fun m!1169459 () Bool)

(assert (=> b!1270552 m!1169459))

(declare-fun m!1169461 () Bool)

(assert (=> b!1270552 m!1169461))

(check-sat (not b!1270552) (not b_next!27559) (not b!1270548) (not mapNonEmpty!50695) b_and!45593 tp_is_empty!32743 (not b!1270551) (not start!107278))
(check-sat b_and!45593 (not b_next!27559))
