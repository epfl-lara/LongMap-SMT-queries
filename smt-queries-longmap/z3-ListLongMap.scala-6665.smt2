; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83944 () Bool)

(assert start!83944)

(declare-fun b!980930 () Bool)

(declare-fun e!552978 () Bool)

(declare-fun tp_is_empty!22765 () Bool)

(assert (=> b!980930 (= e!552978 tp_is_empty!22765)))

(declare-fun b!980931 () Bool)

(declare-fun res!656467 () Bool)

(declare-fun e!552980 () Bool)

(assert (=> b!980931 (=> (not res!656467) (not e!552980))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35337 0))(
  ( (V!35338 (val!11433 Int)) )
))
(declare-datatypes ((ValueCell!10901 0))(
  ( (ValueCellFull!10901 (v!13994 V!35337)) (EmptyCell!10901) )
))
(declare-datatypes ((array!61460 0))(
  ( (array!61461 (arr!29588 (Array (_ BitVec 32) ValueCell!10901)) (size!30069 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61460)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61462 0))(
  ( (array!61463 (arr!29589 (Array (_ BitVec 32) (_ BitVec 64))) (size!30070 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61462)

(assert (=> b!980931 (= res!656467 (and (= (size!30069 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30070 _keys!1544) (size!30069 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!656468 () Bool)

(assert (=> start!83944 (=> (not res!656468) (not e!552980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83944 (= res!656468 (validMask!0 mask!1948))))

(assert (=> start!83944 e!552980))

(assert (=> start!83944 true))

(declare-fun e!552976 () Bool)

(declare-fun array_inv!22897 (array!61460) Bool)

(assert (=> start!83944 (and (array_inv!22897 _values!1278) e!552976)))

(declare-fun array_inv!22898 (array!61462) Bool)

(assert (=> start!83944 (array_inv!22898 _keys!1544)))

(declare-fun b!980932 () Bool)

(declare-fun e!552977 () Bool)

(assert (=> b!980932 (= e!552977 tp_is_empty!22765)))

(declare-fun b!980933 () Bool)

(declare-fun mapRes!36176 () Bool)

(assert (=> b!980933 (= e!552976 (and e!552977 mapRes!36176))))

(declare-fun condMapEmpty!36176 () Bool)

(declare-fun mapDefault!36176 () ValueCell!10901)

(assert (=> b!980933 (= condMapEmpty!36176 (= (arr!29588 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10901)) mapDefault!36176)))))

(declare-fun mapNonEmpty!36176 () Bool)

(declare-fun tp!68690 () Bool)

(assert (=> mapNonEmpty!36176 (= mapRes!36176 (and tp!68690 e!552978))))

(declare-fun mapValue!36176 () ValueCell!10901)

(declare-fun mapKey!36176 () (_ BitVec 32))

(declare-fun mapRest!36176 () (Array (_ BitVec 32) ValueCell!10901))

(assert (=> mapNonEmpty!36176 (= (arr!29588 _values!1278) (store mapRest!36176 mapKey!36176 mapValue!36176))))

(declare-fun b!980934 () Bool)

(assert (=> b!980934 (= e!552980 false)))

(declare-fun lt!435429 () Bool)

(declare-datatypes ((List!20550 0))(
  ( (Nil!20547) (Cons!20546 (h!21708 (_ BitVec 64)) (t!29224 List!20550)) )
))
(declare-fun arrayNoDuplicates!0 (array!61462 (_ BitVec 32) List!20550) Bool)

(assert (=> b!980934 (= lt!435429 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20547))))

(declare-fun mapIsEmpty!36176 () Bool)

(assert (=> mapIsEmpty!36176 mapRes!36176))

(declare-fun b!980935 () Bool)

(declare-fun res!656469 () Bool)

(assert (=> b!980935 (=> (not res!656469) (not e!552980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61462 (_ BitVec 32)) Bool)

(assert (=> b!980935 (= res!656469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83944 res!656468) b!980931))

(assert (= (and b!980931 res!656467) b!980935))

(assert (= (and b!980935 res!656469) b!980934))

(assert (= (and b!980933 condMapEmpty!36176) mapIsEmpty!36176))

(assert (= (and b!980933 (not condMapEmpty!36176)) mapNonEmpty!36176))

(get-info :version)

(assert (= (and mapNonEmpty!36176 ((_ is ValueCellFull!10901) mapValue!36176)) b!980930))

(assert (= (and b!980933 ((_ is ValueCellFull!10901) mapDefault!36176)) b!980932))

(assert (= start!83944 b!980933))

(declare-fun m!907877 () Bool)

(assert (=> start!83944 m!907877))

(declare-fun m!907879 () Bool)

(assert (=> start!83944 m!907879))

(declare-fun m!907881 () Bool)

(assert (=> start!83944 m!907881))

(declare-fun m!907883 () Bool)

(assert (=> mapNonEmpty!36176 m!907883))

(declare-fun m!907885 () Bool)

(assert (=> b!980934 m!907885))

(declare-fun m!907887 () Bool)

(assert (=> b!980935 m!907887))

(check-sat (not b!980934) (not start!83944) (not mapNonEmpty!36176) tp_is_empty!22765 (not b!980935))
(check-sat)
