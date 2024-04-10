; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107044 () Bool)

(assert start!107044)

(declare-fun b_free!27549 () Bool)

(declare-fun b_next!27549 () Bool)

(assert (=> start!107044 (= b_free!27549 (not b_next!27549))))

(declare-fun tp!96873 () Bool)

(declare-fun b_and!45581 () Bool)

(assert (=> start!107044 (= tp!96873 b_and!45581)))

(declare-fun mapNonEmpty!50680 () Bool)

(declare-fun mapRes!50680 () Bool)

(declare-fun tp!96874 () Bool)

(declare-fun e!723333 () Bool)

(assert (=> mapNonEmpty!50680 (= mapRes!50680 (and tp!96874 e!723333))))

(declare-datatypes ((V!48837 0))(
  ( (V!48838 (val!16441 Int)) )
))
(declare-datatypes ((ValueCell!15513 0))(
  ( (ValueCellFull!15513 (v!19078 V!48837)) (EmptyCell!15513) )
))
(declare-datatypes ((array!82730 0))(
  ( (array!82731 (arr!39902 (Array (_ BitVec 32) ValueCell!15513)) (size!40438 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82730)

(declare-fun mapKey!50680 () (_ BitVec 32))

(declare-fun mapValue!50680 () ValueCell!15513)

(declare-fun mapRest!50680 () (Array (_ BitVec 32) ValueCell!15513))

(assert (=> mapNonEmpty!50680 (= (arr!39902 _values!1134) (store mapRest!50680 mapKey!50680 mapValue!50680))))

(declare-fun b!1269123 () Bool)

(declare-fun e!723331 () Bool)

(assert (=> b!1269123 (= e!723331 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82732 0))(
  ( (array!82733 (arr!39903 (Array (_ BitVec 32) (_ BitVec 64))) (size!40439 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82732)

(declare-fun minValueAfter!52 () V!48837)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48837)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48837)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun zeroValueBefore!52 () V!48837)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21296 0))(
  ( (tuple2!21297 (_1!10659 (_ BitVec 64)) (_2!10659 V!48837)) )
))
(declare-datatypes ((List!28409 0))(
  ( (Nil!28406) (Cons!28405 (h!29614 tuple2!21296) (t!41938 List!28409)) )
))
(declare-datatypes ((ListLongMap!19025 0))(
  ( (ListLongMap!19026 (toList!9528 List!28409)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5860 (array!82732 array!82730 (_ BitVec 32) (_ BitVec 32) V!48837 V!48837 (_ BitVec 32) Int) ListLongMap!19025)

(assert (=> b!1269123 (= (getCurrentListMapNoExtraKeys!5860 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5860 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42242 0))(
  ( (Unit!42243) )
))
(declare-fun lt!574536 () Unit!42242)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1202 (array!82732 array!82730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48837 V!48837 V!48837 V!48837 (_ BitVec 32) Int) Unit!42242)

(assert (=> b!1269123 (= lt!574536 (lemmaNoChangeToArrayThenSameMapNoExtras!1202 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269124 () Bool)

(declare-fun e!723330 () Bool)

(declare-fun e!723332 () Bool)

(assert (=> b!1269124 (= e!723330 (and e!723332 mapRes!50680))))

(declare-fun condMapEmpty!50680 () Bool)

(declare-fun mapDefault!50680 () ValueCell!15513)

(assert (=> b!1269124 (= condMapEmpty!50680 (= (arr!39902 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15513)) mapDefault!50680)))))

(declare-fun b!1269125 () Bool)

(declare-fun res!844610 () Bool)

(assert (=> b!1269125 (=> (not res!844610) (not e!723331))))

(assert (=> b!1269125 (= res!844610 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40439 _keys!1364)) (bvslt from!1698 (size!40439 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269126 () Bool)

(declare-fun tp_is_empty!32733 () Bool)

(assert (=> b!1269126 (= e!723333 tp_is_empty!32733)))

(declare-fun b!1269127 () Bool)

(declare-fun res!844609 () Bool)

(assert (=> b!1269127 (=> (not res!844609) (not e!723331))))

(declare-datatypes ((List!28410 0))(
  ( (Nil!28407) (Cons!28406 (h!29615 (_ BitVec 64)) (t!41939 List!28410)) )
))
(declare-fun arrayNoDuplicates!0 (array!82732 (_ BitVec 32) List!28410) Bool)

(assert (=> b!1269127 (= res!844609 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28407))))

(declare-fun b!1269128 () Bool)

(declare-fun res!844606 () Bool)

(assert (=> b!1269128 (=> (not res!844606) (not e!723331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82732 (_ BitVec 32)) Bool)

(assert (=> b!1269128 (= res!844606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269129 () Bool)

(assert (=> b!1269129 (= e!723332 tp_is_empty!32733)))

(declare-fun b!1269130 () Bool)

(declare-fun res!844607 () Bool)

(assert (=> b!1269130 (=> (not res!844607) (not e!723331))))

(assert (=> b!1269130 (= res!844607 (and (= (size!40438 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40439 _keys!1364) (size!40438 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50680 () Bool)

(assert (=> mapIsEmpty!50680 mapRes!50680))

(declare-fun res!844608 () Bool)

(assert (=> start!107044 (=> (not res!844608) (not e!723331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107044 (= res!844608 (validMask!0 mask!1730))))

(assert (=> start!107044 e!723331))

(declare-fun array_inv!30359 (array!82730) Bool)

(assert (=> start!107044 (and (array_inv!30359 _values!1134) e!723330)))

(assert (=> start!107044 true))

(declare-fun array_inv!30360 (array!82732) Bool)

(assert (=> start!107044 (array_inv!30360 _keys!1364)))

(assert (=> start!107044 tp_is_empty!32733))

(assert (=> start!107044 tp!96873))

(assert (= (and start!107044 res!844608) b!1269130))

(assert (= (and b!1269130 res!844607) b!1269128))

(assert (= (and b!1269128 res!844606) b!1269127))

(assert (= (and b!1269127 res!844609) b!1269125))

(assert (= (and b!1269125 res!844610) b!1269123))

(assert (= (and b!1269124 condMapEmpty!50680) mapIsEmpty!50680))

(assert (= (and b!1269124 (not condMapEmpty!50680)) mapNonEmpty!50680))

(get-info :version)

(assert (= (and mapNonEmpty!50680 ((_ is ValueCellFull!15513) mapValue!50680)) b!1269126))

(assert (= (and b!1269124 ((_ is ValueCellFull!15513) mapDefault!50680)) b!1269129))

(assert (= start!107044 b!1269124))

(declare-fun m!1167743 () Bool)

(assert (=> mapNonEmpty!50680 m!1167743))

(declare-fun m!1167745 () Bool)

(assert (=> b!1269123 m!1167745))

(declare-fun m!1167747 () Bool)

(assert (=> b!1269123 m!1167747))

(declare-fun m!1167749 () Bool)

(assert (=> b!1269123 m!1167749))

(declare-fun m!1167751 () Bool)

(assert (=> b!1269128 m!1167751))

(declare-fun m!1167753 () Bool)

(assert (=> b!1269127 m!1167753))

(declare-fun m!1167755 () Bool)

(assert (=> start!107044 m!1167755))

(declare-fun m!1167757 () Bool)

(assert (=> start!107044 m!1167757))

(declare-fun m!1167759 () Bool)

(assert (=> start!107044 m!1167759))

(check-sat tp_is_empty!32733 (not b!1269123) (not b!1269127) b_and!45581 (not b!1269128) (not mapNonEmpty!50680) (not b_next!27549) (not start!107044))
(check-sat b_and!45581 (not b_next!27549))
