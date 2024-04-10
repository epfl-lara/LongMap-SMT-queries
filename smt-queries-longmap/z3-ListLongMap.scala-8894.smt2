; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108006 () Bool)

(assert start!108006)

(declare-fun b!1275748 () Bool)

(declare-fun e!728347 () Bool)

(declare-fun tp_is_empty!33279 () Bool)

(assert (=> b!1275748 (= e!728347 tp_is_empty!33279)))

(declare-fun b!1275749 () Bool)

(declare-fun e!728349 () Bool)

(declare-fun mapRes!51446 () Bool)

(assert (=> b!1275749 (= e!728349 (and e!728347 mapRes!51446))))

(declare-fun condMapEmpty!51446 () Bool)

(declare-datatypes ((V!49475 0))(
  ( (V!49476 (val!16714 Int)) )
))
(declare-datatypes ((ValueCell!15741 0))(
  ( (ValueCellFull!15741 (v!19311 V!49475)) (EmptyCell!15741) )
))
(declare-datatypes ((array!83662 0))(
  ( (array!83663 (arr!40343 (Array (_ BitVec 32) ValueCell!15741)) (size!40893 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83662)

(declare-fun mapDefault!51446 () ValueCell!15741)

(assert (=> b!1275749 (= condMapEmpty!51446 (= (arr!40343 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15741)) mapDefault!51446)))))

(declare-fun res!847920 () Bool)

(declare-fun e!728345 () Bool)

(assert (=> start!108006 (=> (not res!847920) (not e!728345))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108006 (= res!847920 (validMask!0 mask!1805))))

(assert (=> start!108006 e!728345))

(assert (=> start!108006 true))

(declare-fun array_inv!30667 (array!83662) Bool)

(assert (=> start!108006 (and (array_inv!30667 _values!1187) e!728349)))

(declare-datatypes ((array!83664 0))(
  ( (array!83665 (arr!40344 (Array (_ BitVec 32) (_ BitVec 64))) (size!40894 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83664)

(declare-fun array_inv!30668 (array!83664) Bool)

(assert (=> start!108006 (array_inv!30668 _keys!1427)))

(declare-fun b!1275750 () Bool)

(declare-fun res!847919 () Bool)

(assert (=> b!1275750 (=> (not res!847919) (not e!728345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83664 (_ BitVec 32)) Bool)

(assert (=> b!1275750 (= res!847919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275751 () Bool)

(assert (=> b!1275751 (= e!728345 false)))

(declare-fun lt!575386 () Bool)

(declare-datatypes ((List!28624 0))(
  ( (Nil!28621) (Cons!28620 (h!29829 (_ BitVec 64)) (t!42160 List!28624)) )
))
(declare-fun arrayNoDuplicates!0 (array!83664 (_ BitVec 32) List!28624) Bool)

(assert (=> b!1275751 (= lt!575386 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28621))))

(declare-fun b!1275752 () Bool)

(declare-fun e!728346 () Bool)

(assert (=> b!1275752 (= e!728346 tp_is_empty!33279)))

(declare-fun b!1275753 () Bool)

(declare-fun res!847918 () Bool)

(assert (=> b!1275753 (=> (not res!847918) (not e!728345))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275753 (= res!847918 (and (= (size!40893 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40894 _keys!1427) (size!40893 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51446 () Bool)

(declare-fun tp!98204 () Bool)

(assert (=> mapNonEmpty!51446 (= mapRes!51446 (and tp!98204 e!728346))))

(declare-fun mapValue!51446 () ValueCell!15741)

(declare-fun mapRest!51446 () (Array (_ BitVec 32) ValueCell!15741))

(declare-fun mapKey!51446 () (_ BitVec 32))

(assert (=> mapNonEmpty!51446 (= (arr!40343 _values!1187) (store mapRest!51446 mapKey!51446 mapValue!51446))))

(declare-fun mapIsEmpty!51446 () Bool)

(assert (=> mapIsEmpty!51446 mapRes!51446))

(assert (= (and start!108006 res!847920) b!1275753))

(assert (= (and b!1275753 res!847918) b!1275750))

(assert (= (and b!1275750 res!847919) b!1275751))

(assert (= (and b!1275749 condMapEmpty!51446) mapIsEmpty!51446))

(assert (= (and b!1275749 (not condMapEmpty!51446)) mapNonEmpty!51446))

(get-info :version)

(assert (= (and mapNonEmpty!51446 ((_ is ValueCellFull!15741) mapValue!51446)) b!1275752))

(assert (= (and b!1275749 ((_ is ValueCellFull!15741) mapDefault!51446)) b!1275748))

(assert (= start!108006 b!1275749))

(declare-fun m!1171883 () Bool)

(assert (=> start!108006 m!1171883))

(declare-fun m!1171885 () Bool)

(assert (=> start!108006 m!1171885))

(declare-fun m!1171887 () Bool)

(assert (=> start!108006 m!1171887))

(declare-fun m!1171889 () Bool)

(assert (=> b!1275750 m!1171889))

(declare-fun m!1171891 () Bool)

(assert (=> b!1275751 m!1171891))

(declare-fun m!1171893 () Bool)

(assert (=> mapNonEmpty!51446 m!1171893))

(check-sat (not b!1275751) tp_is_empty!33279 (not b!1275750) (not mapNonEmpty!51446) (not start!108006))
(check-sat)
