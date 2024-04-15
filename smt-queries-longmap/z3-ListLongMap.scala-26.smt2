; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!578 () Bool)

(assert start!578)

(declare-fun res!5233 () Bool)

(declare-fun e!1730 () Bool)

(assert (=> start!578 (=> (not res!5233) (not e!1730))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!578 (= res!5233 (validMask!0 mask!2250))))

(assert (=> start!578 e!1730))

(assert (=> start!578 true))

(declare-datatypes ((V!363 0))(
  ( (V!364 (val!75 Int)) )
))
(declare-datatypes ((ValueCell!53 0))(
  ( (ValueCellFull!53 (v!1162 V!363)) (EmptyCell!53) )
))
(declare-datatypes ((array!209 0))(
  ( (array!210 (arr!98 (Array (_ BitVec 32) ValueCell!53)) (size!160 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!209)

(declare-fun e!1733 () Bool)

(declare-fun array_inv!65 (array!209) Bool)

(assert (=> start!578 (and (array_inv!65 _values!1492) e!1733)))

(declare-datatypes ((array!211 0))(
  ( (array!212 (arr!99 (Array (_ BitVec 32) (_ BitVec 64))) (size!161 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!211)

(declare-fun array_inv!66 (array!211) Bool)

(assert (=> start!578 (array_inv!66 _keys!1806)))

(declare-fun b!3539 () Bool)

(declare-fun res!5231 () Bool)

(assert (=> b!3539 (=> (not res!5231) (not e!1730))))

(declare-datatypes ((List!60 0))(
  ( (Nil!57) (Cons!56 (h!622 (_ BitVec 64)) (t!2187 List!60)) )
))
(declare-fun arrayNoDuplicates!0 (array!211 (_ BitVec 32) List!60) Bool)

(assert (=> b!3539 (= res!5231 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!57))))

(declare-fun b!3540 () Bool)

(declare-fun res!5232 () Bool)

(assert (=> b!3540 (=> (not res!5232) (not e!1730))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3540 (= res!5232 (and (= (size!160 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!161 _keys!1806) (size!160 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3541 () Bool)

(declare-fun res!5230 () Bool)

(assert (=> b!3541 (=> (not res!5230) (not e!1730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!211 (_ BitVec 32)) Bool)

(assert (=> b!3541 (= res!5230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3542 () Bool)

(declare-fun e!1731 () Bool)

(declare-fun tp_is_empty!139 () Bool)

(assert (=> b!3542 (= e!1731 tp_is_empty!139)))

(declare-fun mapNonEmpty!164 () Bool)

(declare-fun mapRes!164 () Bool)

(declare-fun tp!404 () Bool)

(assert (=> mapNonEmpty!164 (= mapRes!164 (and tp!404 e!1731))))

(declare-fun mapKey!164 () (_ BitVec 32))

(declare-fun mapValue!164 () ValueCell!53)

(declare-fun mapRest!164 () (Array (_ BitVec 32) ValueCell!53))

(assert (=> mapNonEmpty!164 (= (arr!98 _values!1492) (store mapRest!164 mapKey!164 mapValue!164))))

(declare-fun b!3543 () Bool)

(declare-fun e!1732 () Bool)

(assert (=> b!3543 (= e!1732 tp_is_empty!139)))

(declare-fun b!3544 () Bool)

(assert (=> b!3544 (= e!1733 (and e!1732 mapRes!164))))

(declare-fun condMapEmpty!164 () Bool)

(declare-fun mapDefault!164 () ValueCell!53)

(assert (=> b!3544 (= condMapEmpty!164 (= (arr!98 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!53)) mapDefault!164)))))

(declare-fun mapIsEmpty!164 () Bool)

(assert (=> mapIsEmpty!164 mapRes!164))

(declare-fun b!3545 () Bool)

(assert (=> b!3545 (= e!1730 (bvsgt #b00000000000000000000000000000000 (size!161 _keys!1806)))))

(assert (= (and start!578 res!5233) b!3540))

(assert (= (and b!3540 res!5232) b!3541))

(assert (= (and b!3541 res!5230) b!3539))

(assert (= (and b!3539 res!5231) b!3545))

(assert (= (and b!3544 condMapEmpty!164) mapIsEmpty!164))

(assert (= (and b!3544 (not condMapEmpty!164)) mapNonEmpty!164))

(get-info :version)

(assert (= (and mapNonEmpty!164 ((_ is ValueCellFull!53) mapValue!164)) b!3542))

(assert (= (and b!3544 ((_ is ValueCellFull!53) mapDefault!164)) b!3543))

(assert (= start!578 b!3544))

(declare-fun m!1721 () Bool)

(assert (=> start!578 m!1721))

(declare-fun m!1723 () Bool)

(assert (=> start!578 m!1723))

(declare-fun m!1725 () Bool)

(assert (=> start!578 m!1725))

(declare-fun m!1727 () Bool)

(assert (=> b!3539 m!1727))

(declare-fun m!1729 () Bool)

(assert (=> b!3541 m!1729))

(declare-fun m!1731 () Bool)

(assert (=> mapNonEmpty!164 m!1731))

(check-sat (not start!578) (not b!3541) (not mapNonEmpty!164) tp_is_empty!139 (not b!3539))
(check-sat)
(get-model)

(declare-fun bm!41 () Bool)

(declare-fun call!44 () Bool)

(declare-fun c!188 () Bool)

(assert (=> bm!41 (= call!44 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!188 (Cons!56 (select (arr!99 _keys!1806) #b00000000000000000000000000000000) Nil!57) Nil!57)))))

(declare-fun b!3598 () Bool)

(declare-fun e!1772 () Bool)

(declare-fun e!1775 () Bool)

(assert (=> b!3598 (= e!1772 e!1775)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!3598 (= c!188 (validKeyInArray!0 (select (arr!99 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!3599 () Bool)

(declare-fun e!1773 () Bool)

(declare-fun contains!14 (List!60 (_ BitVec 64)) Bool)

(assert (=> b!3599 (= e!1773 (contains!14 Nil!57 (select (arr!99 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!3600 () Bool)

(declare-fun e!1774 () Bool)

(assert (=> b!3600 (= e!1774 e!1772)))

(declare-fun res!5264 () Bool)

(assert (=> b!3600 (=> (not res!5264) (not e!1772))))

(assert (=> b!3600 (= res!5264 (not e!1773))))

(declare-fun res!5265 () Bool)

(assert (=> b!3600 (=> (not res!5265) (not e!1773))))

(assert (=> b!3600 (= res!5265 (validKeyInArray!0 (select (arr!99 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!3601 () Bool)

(assert (=> b!3601 (= e!1775 call!44)))

(declare-fun b!3602 () Bool)

(assert (=> b!3602 (= e!1775 call!44)))

(declare-fun d!637 () Bool)

(declare-fun res!5266 () Bool)

(assert (=> d!637 (=> res!5266 e!1774)))

(assert (=> d!637 (= res!5266 (bvsge #b00000000000000000000000000000000 (size!161 _keys!1806)))))

(assert (=> d!637 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!57) e!1774)))

(assert (= (and d!637 (not res!5266)) b!3600))

(assert (= (and b!3600 res!5265) b!3599))

(assert (= (and b!3600 res!5264) b!3598))

(assert (= (and b!3598 c!188) b!3602))

(assert (= (and b!3598 (not c!188)) b!3601))

(assert (= (or b!3602 b!3601) bm!41))

(declare-fun m!1757 () Bool)

(assert (=> bm!41 m!1757))

(declare-fun m!1759 () Bool)

(assert (=> bm!41 m!1759))

(assert (=> b!3598 m!1757))

(assert (=> b!3598 m!1757))

(declare-fun m!1761 () Bool)

(assert (=> b!3598 m!1761))

(assert (=> b!3599 m!1757))

(assert (=> b!3599 m!1757))

(declare-fun m!1763 () Bool)

(assert (=> b!3599 m!1763))

(assert (=> b!3600 m!1757))

(assert (=> b!3600 m!1757))

(assert (=> b!3600 m!1761))

(assert (=> b!3539 d!637))

(declare-fun d!639 () Bool)

(assert (=> d!639 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!578 d!639))

(declare-fun d!641 () Bool)

(assert (=> d!641 (= (array_inv!65 _values!1492) (bvsge (size!160 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!578 d!641))

(declare-fun d!643 () Bool)

(assert (=> d!643 (= (array_inv!66 _keys!1806) (bvsge (size!161 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!578 d!643))

(declare-fun b!3611 () Bool)

(declare-fun e!1783 () Bool)

(declare-fun e!1784 () Bool)

(assert (=> b!3611 (= e!1783 e!1784)))

(declare-fun c!191 () Bool)

(assert (=> b!3611 (= c!191 (validKeyInArray!0 (select (arr!99 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!3612 () Bool)

(declare-fun e!1782 () Bool)

(assert (=> b!3612 (= e!1784 e!1782)))

(declare-fun lt!498 () (_ BitVec 64))

(assert (=> b!3612 (= lt!498 (select (arr!99 _keys!1806) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27 0))(
  ( (Unit!28) )
))
(declare-fun lt!496 () Unit!27)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!211 (_ BitVec 64) (_ BitVec 32)) Unit!27)

(assert (=> b!3612 (= lt!496 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!498 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!3612 (arrayContainsKey!0 _keys!1806 lt!498 #b00000000000000000000000000000000)))

(declare-fun lt!497 () Unit!27)

(assert (=> b!3612 (= lt!497 lt!496)))

(declare-fun res!5271 () Bool)

(declare-datatypes ((SeekEntryResult!9 0))(
  ( (MissingZero!9 (index!2155 (_ BitVec 32))) (Found!9 (index!2156 (_ BitVec 32))) (Intermediate!9 (undefined!821 Bool) (index!2157 (_ BitVec 32)) (x!2267 (_ BitVec 32))) (Undefined!9) (MissingVacant!9 (index!2158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!211 (_ BitVec 32)) SeekEntryResult!9)

(assert (=> b!3612 (= res!5271 (= (seekEntryOrOpen!0 (select (arr!99 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!9 #b00000000000000000000000000000000)))))

(assert (=> b!3612 (=> (not res!5271) (not e!1782))))

(declare-fun b!3613 () Bool)

(declare-fun call!47 () Bool)

(assert (=> b!3613 (= e!1784 call!47)))

(declare-fun d!645 () Bool)

(declare-fun res!5272 () Bool)

(assert (=> d!645 (=> res!5272 e!1783)))

(assert (=> d!645 (= res!5272 (bvsge #b00000000000000000000000000000000 (size!161 _keys!1806)))))

(assert (=> d!645 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!1783)))

(declare-fun bm!44 () Bool)

(assert (=> bm!44 (= call!47 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!3614 () Bool)

(assert (=> b!3614 (= e!1782 call!47)))

(assert (= (and d!645 (not res!5272)) b!3611))

(assert (= (and b!3611 c!191) b!3612))

(assert (= (and b!3611 (not c!191)) b!3613))

(assert (= (and b!3612 res!5271) b!3614))

(assert (= (or b!3614 b!3613) bm!44))

(assert (=> b!3611 m!1757))

(assert (=> b!3611 m!1757))

(assert (=> b!3611 m!1761))

(assert (=> b!3612 m!1757))

(declare-fun m!1765 () Bool)

(assert (=> b!3612 m!1765))

(declare-fun m!1767 () Bool)

(assert (=> b!3612 m!1767))

(assert (=> b!3612 m!1757))

(declare-fun m!1769 () Bool)

(assert (=> b!3612 m!1769))

(declare-fun m!1771 () Bool)

(assert (=> bm!44 m!1771))

(assert (=> b!3541 d!645))

(declare-fun b!3621 () Bool)

(declare-fun e!1789 () Bool)

(assert (=> b!3621 (= e!1789 tp_is_empty!139)))

(declare-fun mapNonEmpty!173 () Bool)

(declare-fun mapRes!173 () Bool)

(declare-fun tp!413 () Bool)

(assert (=> mapNonEmpty!173 (= mapRes!173 (and tp!413 e!1789))))

(declare-fun mapRest!173 () (Array (_ BitVec 32) ValueCell!53))

(declare-fun mapValue!173 () ValueCell!53)

(declare-fun mapKey!173 () (_ BitVec 32))

(assert (=> mapNonEmpty!173 (= mapRest!164 (store mapRest!173 mapKey!173 mapValue!173))))

(declare-fun b!3622 () Bool)

(declare-fun e!1790 () Bool)

(assert (=> b!3622 (= e!1790 tp_is_empty!139)))

(declare-fun mapIsEmpty!173 () Bool)

(assert (=> mapIsEmpty!173 mapRes!173))

(declare-fun condMapEmpty!173 () Bool)

(declare-fun mapDefault!173 () ValueCell!53)

(assert (=> mapNonEmpty!164 (= condMapEmpty!173 (= mapRest!164 ((as const (Array (_ BitVec 32) ValueCell!53)) mapDefault!173)))))

(assert (=> mapNonEmpty!164 (= tp!404 (and e!1790 mapRes!173))))

(assert (= (and mapNonEmpty!164 condMapEmpty!173) mapIsEmpty!173))

(assert (= (and mapNonEmpty!164 (not condMapEmpty!173)) mapNonEmpty!173))

(assert (= (and mapNonEmpty!173 ((_ is ValueCellFull!53) mapValue!173)) b!3621))

(assert (= (and mapNonEmpty!164 ((_ is ValueCellFull!53) mapDefault!173)) b!3622))

(declare-fun m!1773 () Bool)

(assert (=> mapNonEmpty!173 m!1773))

(check-sat (not b!3598) (not b!3600) (not mapNonEmpty!173) tp_is_empty!139 (not bm!41) (not b!3599) (not b!3611) (not bm!44) (not b!3612))
(check-sat)
