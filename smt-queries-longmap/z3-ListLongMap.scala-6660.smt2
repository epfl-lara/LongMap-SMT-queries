; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83914 () Bool)

(assert start!83914)

(declare-fun mapIsEmpty!36131 () Bool)

(declare-fun mapRes!36131 () Bool)

(assert (=> mapIsEmpty!36131 mapRes!36131))

(declare-fun b!980660 () Bool)

(declare-fun e!552755 () Bool)

(assert (=> b!980660 (= e!552755 false)))

(declare-fun lt!435384 () Bool)

(declare-datatypes ((array!61402 0))(
  ( (array!61403 (arr!29559 (Array (_ BitVec 32) (_ BitVec 64))) (size!30040 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61402)

(declare-datatypes ((List!20537 0))(
  ( (Nil!20534) (Cons!20533 (h!21695 (_ BitVec 64)) (t!29211 List!20537)) )
))
(declare-fun arrayNoDuplicates!0 (array!61402 (_ BitVec 32) List!20537) Bool)

(assert (=> b!980660 (= lt!435384 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20534))))

(declare-fun b!980661 () Bool)

(declare-fun res!656332 () Bool)

(assert (=> b!980661 (=> (not res!656332) (not e!552755))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35297 0))(
  ( (V!35298 (val!11418 Int)) )
))
(declare-datatypes ((ValueCell!10886 0))(
  ( (ValueCellFull!10886 (v!13979 V!35297)) (EmptyCell!10886) )
))
(declare-datatypes ((array!61404 0))(
  ( (array!61405 (arr!29560 (Array (_ BitVec 32) ValueCell!10886)) (size!30041 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61404)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980661 (= res!656332 (and (= (size!30041 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30040 _keys!1544) (size!30041 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36131 () Bool)

(declare-fun tp!68645 () Bool)

(declare-fun e!552753 () Bool)

(assert (=> mapNonEmpty!36131 (= mapRes!36131 (and tp!68645 e!552753))))

(declare-fun mapKey!36131 () (_ BitVec 32))

(declare-fun mapValue!36131 () ValueCell!10886)

(declare-fun mapRest!36131 () (Array (_ BitVec 32) ValueCell!10886))

(assert (=> mapNonEmpty!36131 (= (arr!29560 _values!1278) (store mapRest!36131 mapKey!36131 mapValue!36131))))

(declare-fun b!980662 () Bool)

(declare-fun res!656334 () Bool)

(assert (=> b!980662 (=> (not res!656334) (not e!552755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61402 (_ BitVec 32)) Bool)

(assert (=> b!980662 (= res!656334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!656333 () Bool)

(assert (=> start!83914 (=> (not res!656333) (not e!552755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83914 (= res!656333 (validMask!0 mask!1948))))

(assert (=> start!83914 e!552755))

(assert (=> start!83914 true))

(declare-fun e!552752 () Bool)

(declare-fun array_inv!22875 (array!61404) Bool)

(assert (=> start!83914 (and (array_inv!22875 _values!1278) e!552752)))

(declare-fun array_inv!22876 (array!61402) Bool)

(assert (=> start!83914 (array_inv!22876 _keys!1544)))

(declare-fun b!980663 () Bool)

(declare-fun e!552751 () Bool)

(declare-fun tp_is_empty!22735 () Bool)

(assert (=> b!980663 (= e!552751 tp_is_empty!22735)))

(declare-fun b!980664 () Bool)

(assert (=> b!980664 (= e!552752 (and e!552751 mapRes!36131))))

(declare-fun condMapEmpty!36131 () Bool)

(declare-fun mapDefault!36131 () ValueCell!10886)

(assert (=> b!980664 (= condMapEmpty!36131 (= (arr!29560 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10886)) mapDefault!36131)))))

(declare-fun b!980665 () Bool)

(assert (=> b!980665 (= e!552753 tp_is_empty!22735)))

(assert (= (and start!83914 res!656333) b!980661))

(assert (= (and b!980661 res!656332) b!980662))

(assert (= (and b!980662 res!656334) b!980660))

(assert (= (and b!980664 condMapEmpty!36131) mapIsEmpty!36131))

(assert (= (and b!980664 (not condMapEmpty!36131)) mapNonEmpty!36131))

(get-info :version)

(assert (= (and mapNonEmpty!36131 ((_ is ValueCellFull!10886) mapValue!36131)) b!980665))

(assert (= (and b!980664 ((_ is ValueCellFull!10886) mapDefault!36131)) b!980663))

(assert (= start!83914 b!980664))

(declare-fun m!907697 () Bool)

(assert (=> b!980660 m!907697))

(declare-fun m!907699 () Bool)

(assert (=> mapNonEmpty!36131 m!907699))

(declare-fun m!907701 () Bool)

(assert (=> b!980662 m!907701))

(declare-fun m!907703 () Bool)

(assert (=> start!83914 m!907703))

(declare-fun m!907705 () Bool)

(assert (=> start!83914 m!907705))

(declare-fun m!907707 () Bool)

(assert (=> start!83914 m!907707))

(check-sat tp_is_empty!22735 (not b!980662) (not mapNonEmpty!36131) (not start!83914) (not b!980660))
(check-sat)
