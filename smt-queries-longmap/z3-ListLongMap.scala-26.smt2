; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!580 () Bool)

(assert start!580)

(declare-fun b!3560 () Bool)

(declare-fun e!1744 () Bool)

(declare-fun tp_is_empty!141 () Bool)

(assert (=> b!3560 (= e!1744 tp_is_empty!141)))

(declare-fun b!3561 () Bool)

(declare-fun e!1747 () Bool)

(assert (=> b!3561 (= e!1747 tp_is_empty!141)))

(declare-fun mapIsEmpty!167 () Bool)

(declare-fun mapRes!167 () Bool)

(assert (=> mapIsEmpty!167 mapRes!167))

(declare-fun b!3562 () Bool)

(declare-fun res!5242 () Bool)

(declare-fun e!1745 () Bool)

(assert (=> b!3562 (=> (not res!5242) (not e!1745))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!365 0))(
  ( (V!366 (val!76 Int)) )
))
(declare-datatypes ((ValueCell!54 0))(
  ( (ValueCellFull!54 (v!1163 V!365)) (EmptyCell!54) )
))
(declare-datatypes ((array!219 0))(
  ( (array!220 (arr!103 (Array (_ BitVec 32) ValueCell!54)) (size!165 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!219)

(declare-datatypes ((array!221 0))(
  ( (array!222 (arr!104 (Array (_ BitVec 32) (_ BitVec 64))) (size!166 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!221)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3562 (= res!5242 (and (= (size!165 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!166 _keys!1806) (size!165 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3563 () Bool)

(declare-fun res!5245 () Bool)

(assert (=> b!3563 (=> (not res!5245) (not e!1745))))

(declare-datatypes ((List!63 0))(
  ( (Nil!60) (Cons!59 (h!625 (_ BitVec 64)) (t!2190 List!63)) )
))
(declare-fun arrayNoDuplicates!0 (array!221 (_ BitVec 32) List!63) Bool)

(assert (=> b!3563 (= res!5245 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!60))))

(declare-fun b!3565 () Bool)

(declare-fun e!1748 () Bool)

(assert (=> b!3565 (= e!1748 (and e!1747 mapRes!167))))

(declare-fun condMapEmpty!167 () Bool)

(declare-fun mapDefault!167 () ValueCell!54)

(assert (=> b!3565 (= condMapEmpty!167 (= (arr!103 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!54)) mapDefault!167)))))

(declare-fun b!3566 () Bool)

(declare-fun res!5243 () Bool)

(assert (=> b!3566 (=> (not res!5243) (not e!1745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!221 (_ BitVec 32)) Bool)

(assert (=> b!3566 (= res!5243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!167 () Bool)

(declare-fun tp!407 () Bool)

(assert (=> mapNonEmpty!167 (= mapRes!167 (and tp!407 e!1744))))

(declare-fun mapValue!167 () ValueCell!54)

(declare-fun mapRest!167 () (Array (_ BitVec 32) ValueCell!54))

(declare-fun mapKey!167 () (_ BitVec 32))

(assert (=> mapNonEmpty!167 (= (arr!103 _values!1492) (store mapRest!167 mapKey!167 mapValue!167))))

(declare-fun res!5244 () Bool)

(assert (=> start!580 (=> (not res!5244) (not e!1745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!580 (= res!5244 (validMask!0 mask!2250))))

(assert (=> start!580 e!1745))

(assert (=> start!580 true))

(declare-fun array_inv!75 (array!219) Bool)

(assert (=> start!580 (and (array_inv!75 _values!1492) e!1748)))

(declare-fun array_inv!76 (array!221) Bool)

(assert (=> start!580 (array_inv!76 _keys!1806)))

(declare-fun b!3564 () Bool)

(assert (=> b!3564 (= e!1745 (bvsgt #b00000000000000000000000000000000 (size!166 _keys!1806)))))

(assert (= (and start!580 res!5244) b!3562))

(assert (= (and b!3562 res!5242) b!3566))

(assert (= (and b!3566 res!5243) b!3563))

(assert (= (and b!3563 res!5245) b!3564))

(assert (= (and b!3565 condMapEmpty!167) mapIsEmpty!167))

(assert (= (and b!3565 (not condMapEmpty!167)) mapNonEmpty!167))

(get-info :version)

(assert (= (and mapNonEmpty!167 ((_ is ValueCellFull!54) mapValue!167)) b!3560))

(assert (= (and b!3565 ((_ is ValueCellFull!54) mapDefault!167)) b!3561))

(assert (= start!580 b!3565))

(declare-fun m!1733 () Bool)

(assert (=> b!3563 m!1733))

(declare-fun m!1735 () Bool)

(assert (=> b!3566 m!1735))

(declare-fun m!1737 () Bool)

(assert (=> mapNonEmpty!167 m!1737))

(declare-fun m!1739 () Bool)

(assert (=> start!580 m!1739))

(declare-fun m!1741 () Bool)

(assert (=> start!580 m!1741))

(declare-fun m!1743 () Bool)

(assert (=> start!580 m!1743))

(check-sat (not b!3563) (not b!3566) (not mapNonEmpty!167) tp_is_empty!141 (not start!580))
(check-sat)
(get-model)

(declare-fun d!637 () Bool)

(assert (=> d!637 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!580 d!637))

(declare-fun d!639 () Bool)

(assert (=> d!639 (= (array_inv!75 _values!1492) (bvsge (size!165 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!580 d!639))

(declare-fun d!641 () Bool)

(assert (=> d!641 (= (array_inv!76 _keys!1806) (bvsge (size!166 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!580 d!641))

(declare-fun d!643 () Bool)

(declare-fun res!5262 () Bool)

(declare-fun e!1772 () Bool)

(assert (=> d!643 (=> res!5262 e!1772)))

(assert (=> d!643 (= res!5262 (bvsge #b00000000000000000000000000000000 (size!166 _keys!1806)))))

(assert (=> d!643 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!1772)))

(declare-fun b!3596 () Bool)

(declare-fun e!1771 () Bool)

(declare-fun call!44 () Bool)

(assert (=> b!3596 (= e!1771 call!44)))

(declare-fun b!3597 () Bool)

(declare-fun e!1770 () Bool)

(assert (=> b!3597 (= e!1770 call!44)))

(declare-fun b!3598 () Bool)

(assert (=> b!3598 (= e!1772 e!1770)))

(declare-fun c!188 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!3598 (= c!188 (validKeyInArray!0 (select (arr!104 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!41 () Bool)

(assert (=> bm!41 (= call!44 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!3599 () Bool)

(assert (=> b!3599 (= e!1770 e!1771)))

(declare-fun lt!498 () (_ BitVec 64))

(assert (=> b!3599 (= lt!498 (select (arr!104 _keys!1806) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27 0))(
  ( (Unit!28) )
))
(declare-fun lt!496 () Unit!27)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!221 (_ BitVec 64) (_ BitVec 32)) Unit!27)

(assert (=> b!3599 (= lt!496 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!498 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!3599 (arrayContainsKey!0 _keys!1806 lt!498 #b00000000000000000000000000000000)))

(declare-fun lt!497 () Unit!27)

(assert (=> b!3599 (= lt!497 lt!496)))

(declare-fun res!5263 () Bool)

(declare-datatypes ((SeekEntryResult!9 0))(
  ( (MissingZero!9 (index!2155 (_ BitVec 32))) (Found!9 (index!2156 (_ BitVec 32))) (Intermediate!9 (undefined!821 Bool) (index!2157 (_ BitVec 32)) (x!2267 (_ BitVec 32))) (Undefined!9) (MissingVacant!9 (index!2158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!221 (_ BitVec 32)) SeekEntryResult!9)

(assert (=> b!3599 (= res!5263 (= (seekEntryOrOpen!0 (select (arr!104 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!9 #b00000000000000000000000000000000)))))

(assert (=> b!3599 (=> (not res!5263) (not e!1771))))

(assert (= (and d!643 (not res!5262)) b!3598))

(assert (= (and b!3598 c!188) b!3599))

(assert (= (and b!3598 (not c!188)) b!3597))

(assert (= (and b!3599 res!5263) b!3596))

(assert (= (or b!3596 b!3597) bm!41))

(declare-fun m!1757 () Bool)

(assert (=> b!3598 m!1757))

(assert (=> b!3598 m!1757))

(declare-fun m!1759 () Bool)

(assert (=> b!3598 m!1759))

(declare-fun m!1761 () Bool)

(assert (=> bm!41 m!1761))

(assert (=> b!3599 m!1757))

(declare-fun m!1763 () Bool)

(assert (=> b!3599 m!1763))

(declare-fun m!1765 () Bool)

(assert (=> b!3599 m!1765))

(assert (=> b!3599 m!1757))

(declare-fun m!1767 () Bool)

(assert (=> b!3599 m!1767))

(assert (=> b!3566 d!643))

(declare-fun b!3610 () Bool)

(declare-fun e!1781 () Bool)

(declare-fun call!47 () Bool)

(assert (=> b!3610 (= e!1781 call!47)))

(declare-fun b!3611 () Bool)

(declare-fun e!1783 () Bool)

(declare-fun contains!14 (List!63 (_ BitVec 64)) Bool)

(assert (=> b!3611 (= e!1783 (contains!14 Nil!60 (select (arr!104 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!44 () Bool)

(declare-fun c!191 () Bool)

(assert (=> bm!44 (= call!47 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!191 (Cons!59 (select (arr!104 _keys!1806) #b00000000000000000000000000000000) Nil!60) Nil!60)))))

(declare-fun d!645 () Bool)

(declare-fun res!5270 () Bool)

(declare-fun e!1784 () Bool)

(assert (=> d!645 (=> res!5270 e!1784)))

(assert (=> d!645 (= res!5270 (bvsge #b00000000000000000000000000000000 (size!166 _keys!1806)))))

(assert (=> d!645 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!60) e!1784)))

(declare-fun b!3612 () Bool)

(assert (=> b!3612 (= e!1781 call!47)))

(declare-fun b!3613 () Bool)

(declare-fun e!1782 () Bool)

(assert (=> b!3613 (= e!1782 e!1781)))

(assert (=> b!3613 (= c!191 (validKeyInArray!0 (select (arr!104 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!3614 () Bool)

(assert (=> b!3614 (= e!1784 e!1782)))

(declare-fun res!5272 () Bool)

(assert (=> b!3614 (=> (not res!5272) (not e!1782))))

(assert (=> b!3614 (= res!5272 (not e!1783))))

(declare-fun res!5271 () Bool)

(assert (=> b!3614 (=> (not res!5271) (not e!1783))))

(assert (=> b!3614 (= res!5271 (validKeyInArray!0 (select (arr!104 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!645 (not res!5270)) b!3614))

(assert (= (and b!3614 res!5271) b!3611))

(assert (= (and b!3614 res!5272) b!3613))

(assert (= (and b!3613 c!191) b!3610))

(assert (= (and b!3613 (not c!191)) b!3612))

(assert (= (or b!3610 b!3612) bm!44))

(assert (=> b!3611 m!1757))

(assert (=> b!3611 m!1757))

(declare-fun m!1769 () Bool)

(assert (=> b!3611 m!1769))

(assert (=> bm!44 m!1757))

(declare-fun m!1771 () Bool)

(assert (=> bm!44 m!1771))

(assert (=> b!3613 m!1757))

(assert (=> b!3613 m!1757))

(assert (=> b!3613 m!1759))

(assert (=> b!3614 m!1757))

(assert (=> b!3614 m!1757))

(assert (=> b!3614 m!1759))

(assert (=> b!3563 d!645))

(declare-fun mapNonEmpty!173 () Bool)

(declare-fun mapRes!173 () Bool)

(declare-fun tp!413 () Bool)

(declare-fun e!1789 () Bool)

(assert (=> mapNonEmpty!173 (= mapRes!173 (and tp!413 e!1789))))

(declare-fun mapKey!173 () (_ BitVec 32))

(declare-fun mapValue!173 () ValueCell!54)

(declare-fun mapRest!173 () (Array (_ BitVec 32) ValueCell!54))

(assert (=> mapNonEmpty!173 (= mapRest!167 (store mapRest!173 mapKey!173 mapValue!173))))

(declare-fun mapIsEmpty!173 () Bool)

(assert (=> mapIsEmpty!173 mapRes!173))

(declare-fun b!3621 () Bool)

(assert (=> b!3621 (= e!1789 tp_is_empty!141)))

(declare-fun b!3622 () Bool)

(declare-fun e!1790 () Bool)

(assert (=> b!3622 (= e!1790 tp_is_empty!141)))

(declare-fun condMapEmpty!173 () Bool)

(declare-fun mapDefault!173 () ValueCell!54)

(assert (=> mapNonEmpty!167 (= condMapEmpty!173 (= mapRest!167 ((as const (Array (_ BitVec 32) ValueCell!54)) mapDefault!173)))))

(assert (=> mapNonEmpty!167 (= tp!407 (and e!1790 mapRes!173))))

(assert (= (and mapNonEmpty!167 condMapEmpty!173) mapIsEmpty!173))

(assert (= (and mapNonEmpty!167 (not condMapEmpty!173)) mapNonEmpty!173))

(assert (= (and mapNonEmpty!173 ((_ is ValueCellFull!54) mapValue!173)) b!3621))

(assert (= (and mapNonEmpty!167 ((_ is ValueCellFull!54) mapDefault!173)) b!3622))

(declare-fun m!1773 () Bool)

(assert (=> mapNonEmpty!173 m!1773))

(check-sat tp_is_empty!141 (not b!3613) (not b!3598) (not b!3614) (not bm!41) (not bm!44) (not b!3611) (not b!3599) (not mapNonEmpty!173))
(check-sat)
