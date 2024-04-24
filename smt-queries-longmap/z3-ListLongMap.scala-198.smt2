; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3816 () Bool)

(assert start!3816)

(declare-fun b_free!775 () Bool)

(declare-fun b_next!775 () Bool)

(assert (=> start!3816 (= b_free!775 (not b_next!775))))

(declare-fun tp!3736 () Bool)

(declare-fun b_and!1569 () Bool)

(assert (=> start!3816 (= tp!3736 b_and!1569)))

(declare-fun b!26651 () Bool)

(declare-fun e!17385 () Bool)

(assert (=> b!26651 (= e!17385 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1331 0))(
  ( (V!1332 (val!591 Int)) )
))
(declare-datatypes ((ValueCell!365 0))(
  ( (ValueCellFull!365 (v!1677 V!1331)) (EmptyCell!365) )
))
(declare-datatypes ((array!1479 0))(
  ( (array!1480 (arr!696 (Array (_ BitVec 32) ValueCell!365)) (size!797 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1479)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1481 0))(
  ( (array!1482 (arr!697 (Array (_ BitVec 32) (_ BitVec 64))) (size!798 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1481)

(declare-fun lt!10359 () Bool)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1331)

(declare-fun minValue!1443 () V!1331)

(declare-datatypes ((tuple2!998 0))(
  ( (tuple2!999 (_1!510 (_ BitVec 64)) (_2!510 V!1331)) )
))
(declare-datatypes ((List!592 0))(
  ( (Nil!589) (Cons!588 (h!1155 tuple2!998) (t!3273 List!592)) )
))
(declare-datatypes ((ListLongMap!569 0))(
  ( (ListLongMap!570 (toList!300 List!592)) )
))
(declare-fun contains!239 (ListLongMap!569 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!130 (array!1481 array!1479 (_ BitVec 32) (_ BitVec 32) V!1331 V!1331 (_ BitVec 32) Int) ListLongMap!569)

(assert (=> b!26651 (= lt!10359 (contains!239 (getCurrentListMap!130 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304))))

(declare-fun b!26652 () Bool)

(declare-fun res!15806 () Bool)

(assert (=> b!26652 (=> (not res!15806) (not e!17385))))

(declare-datatypes ((List!593 0))(
  ( (Nil!590) (Cons!589 (h!1156 (_ BitVec 64)) (t!3274 List!593)) )
))
(declare-fun arrayNoDuplicates!0 (array!1481 (_ BitVec 32) List!593) Bool)

(assert (=> b!26652 (= res!15806 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!590))))

(declare-fun b!26653 () Bool)

(declare-fun res!15807 () Bool)

(assert (=> b!26653 (=> (not res!15807) (not e!17385))))

(assert (=> b!26653 (= res!15807 (and (= (size!797 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!798 _keys!1833) (size!797 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26654 () Bool)

(declare-fun res!15809 () Bool)

(assert (=> b!26654 (=> (not res!15809) (not e!17385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26654 (= res!15809 (validKeyInArray!0 k0!1304))))

(declare-fun b!26655 () Bool)

(declare-fun e!17386 () Bool)

(declare-fun e!17387 () Bool)

(declare-fun mapRes!1213 () Bool)

(assert (=> b!26655 (= e!17386 (and e!17387 mapRes!1213))))

(declare-fun condMapEmpty!1213 () Bool)

(declare-fun mapDefault!1213 () ValueCell!365)

(assert (=> b!26655 (= condMapEmpty!1213 (= (arr!696 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!365)) mapDefault!1213)))))

(declare-fun mapIsEmpty!1213 () Bool)

(assert (=> mapIsEmpty!1213 mapRes!1213))

(declare-fun b!26656 () Bool)

(declare-fun tp_is_empty!1129 () Bool)

(assert (=> b!26656 (= e!17387 tp_is_empty!1129)))

(declare-fun mapNonEmpty!1213 () Bool)

(declare-fun tp!3735 () Bool)

(declare-fun e!17388 () Bool)

(assert (=> mapNonEmpty!1213 (= mapRes!1213 (and tp!3735 e!17388))))

(declare-fun mapValue!1213 () ValueCell!365)

(declare-fun mapKey!1213 () (_ BitVec 32))

(declare-fun mapRest!1213 () (Array (_ BitVec 32) ValueCell!365))

(assert (=> mapNonEmpty!1213 (= (arr!696 _values!1501) (store mapRest!1213 mapKey!1213 mapValue!1213))))

(declare-fun b!26658 () Bool)

(assert (=> b!26658 (= e!17388 tp_is_empty!1129)))

(declare-fun res!15805 () Bool)

(assert (=> start!3816 (=> (not res!15805) (not e!17385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3816 (= res!15805 (validMask!0 mask!2294))))

(assert (=> start!3816 e!17385))

(assert (=> start!3816 true))

(assert (=> start!3816 tp!3736))

(declare-fun array_inv!485 (array!1479) Bool)

(assert (=> start!3816 (and (array_inv!485 _values!1501) e!17386)))

(declare-fun array_inv!486 (array!1481) Bool)

(assert (=> start!3816 (array_inv!486 _keys!1833)))

(assert (=> start!3816 tp_is_empty!1129))

(declare-fun b!26657 () Bool)

(declare-fun res!15808 () Bool)

(assert (=> b!26657 (=> (not res!15808) (not e!17385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1481 (_ BitVec 32)) Bool)

(assert (=> b!26657 (= res!15808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!3816 res!15805) b!26653))

(assert (= (and b!26653 res!15807) b!26657))

(assert (= (and b!26657 res!15808) b!26652))

(assert (= (and b!26652 res!15806) b!26654))

(assert (= (and b!26654 res!15809) b!26651))

(assert (= (and b!26655 condMapEmpty!1213) mapIsEmpty!1213))

(assert (= (and b!26655 (not condMapEmpty!1213)) mapNonEmpty!1213))

(get-info :version)

(assert (= (and mapNonEmpty!1213 ((_ is ValueCellFull!365) mapValue!1213)) b!26658))

(assert (= (and b!26655 ((_ is ValueCellFull!365) mapDefault!1213)) b!26656))

(assert (= start!3816 b!26655))

(declare-fun m!21237 () Bool)

(assert (=> mapNonEmpty!1213 m!21237))

(declare-fun m!21239 () Bool)

(assert (=> start!3816 m!21239))

(declare-fun m!21241 () Bool)

(assert (=> start!3816 m!21241))

(declare-fun m!21243 () Bool)

(assert (=> start!3816 m!21243))

(declare-fun m!21245 () Bool)

(assert (=> b!26652 m!21245))

(declare-fun m!21247 () Bool)

(assert (=> b!26657 m!21247))

(declare-fun m!21249 () Bool)

(assert (=> b!26654 m!21249))

(declare-fun m!21251 () Bool)

(assert (=> b!26651 m!21251))

(assert (=> b!26651 m!21251))

(declare-fun m!21253 () Bool)

(assert (=> b!26651 m!21253))

(check-sat (not b_next!775) (not b!26651) (not b!26657) (not start!3816) tp_is_empty!1129 (not b!26652) (not mapNonEmpty!1213) b_and!1569 (not b!26654))
(check-sat b_and!1569 (not b_next!775))
