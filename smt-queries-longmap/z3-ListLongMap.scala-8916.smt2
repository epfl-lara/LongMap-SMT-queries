; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108164 () Bool)

(assert start!108164)

(declare-fun b_free!27859 () Bool)

(declare-fun b_next!27859 () Bool)

(assert (=> start!108164 (= b_free!27859 (not b_next!27859))))

(declare-fun tp!98534 () Bool)

(declare-fun b_and!45899 () Bool)

(assert (=> start!108164 (= tp!98534 b_and!45899)))

(declare-fun b!1277255 () Bool)

(declare-fun e!729428 () Bool)

(declare-fun tp_is_empty!33409 () Bool)

(assert (=> b!1277255 (= e!729428 tp_is_empty!33409)))

(declare-fun res!848733 () Bool)

(declare-fun e!729429 () Bool)

(assert (=> start!108164 (=> (not res!848733) (not e!729429))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108164 (= res!848733 (validMask!0 mask!1805))))

(assert (=> start!108164 e!729429))

(assert (=> start!108164 true))

(assert (=> start!108164 tp!98534))

(assert (=> start!108164 tp_is_empty!33409))

(declare-datatypes ((V!49649 0))(
  ( (V!49650 (val!16779 Int)) )
))
(declare-datatypes ((ValueCell!15806 0))(
  ( (ValueCellFull!15806 (v!19376 V!49649)) (EmptyCell!15806) )
))
(declare-datatypes ((array!83809 0))(
  ( (array!83810 (arr!40415 (Array (_ BitVec 32) ValueCell!15806)) (size!40967 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83809)

(declare-fun e!729427 () Bool)

(declare-fun array_inv!30865 (array!83809) Bool)

(assert (=> start!108164 (and (array_inv!30865 _values!1187) e!729427)))

(declare-datatypes ((array!83811 0))(
  ( (array!83812 (arr!40416 (Array (_ BitVec 32) (_ BitVec 64))) (size!40968 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83811)

(declare-fun array_inv!30866 (array!83811) Bool)

(assert (=> start!108164 (array_inv!30866 _keys!1427)))

(declare-fun b!1277256 () Bool)

(assert (=> b!1277256 (= e!729429 false)))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49649)

(declare-fun zeroValue!1129 () V!49649)

(declare-fun lt!575502 () Bool)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-datatypes ((tuple2!21600 0))(
  ( (tuple2!21601 (_1!10811 (_ BitVec 64)) (_2!10811 V!49649)) )
))
(declare-datatypes ((List!28770 0))(
  ( (Nil!28767) (Cons!28766 (h!29975 tuple2!21600) (t!42300 List!28770)) )
))
(declare-datatypes ((ListLongMap!19257 0))(
  ( (ListLongMap!19258 (toList!9644 List!28770)) )
))
(declare-fun contains!7685 (ListLongMap!19257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4618 (array!83811 array!83809 (_ BitVec 32) (_ BitVec 32) V!49649 V!49649 (_ BitVec 32) Int) ListLongMap!19257)

(assert (=> b!1277256 (= lt!575502 (contains!7685 (getCurrentListMap!4618 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapIsEmpty!51647 () Bool)

(declare-fun mapRes!51647 () Bool)

(assert (=> mapIsEmpty!51647 mapRes!51647))

(declare-fun b!1277257 () Bool)

(declare-fun res!848736 () Bool)

(assert (=> b!1277257 (=> (not res!848736) (not e!729429))))

(assert (=> b!1277257 (= res!848736 (and (= (size!40967 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40968 _keys!1427) (size!40967 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277258 () Bool)

(declare-fun e!729426 () Bool)

(assert (=> b!1277258 (= e!729426 tp_is_empty!33409)))

(declare-fun b!1277259 () Bool)

(declare-fun res!848734 () Bool)

(assert (=> b!1277259 (=> (not res!848734) (not e!729429))))

(declare-datatypes ((List!28771 0))(
  ( (Nil!28768) (Cons!28767 (h!29976 (_ BitVec 64)) (t!42301 List!28771)) )
))
(declare-fun arrayNoDuplicates!0 (array!83811 (_ BitVec 32) List!28771) Bool)

(assert (=> b!1277259 (= res!848734 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28768))))

(declare-fun b!1277260 () Bool)

(declare-fun res!848735 () Bool)

(assert (=> b!1277260 (=> (not res!848735) (not e!729429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83811 (_ BitVec 32)) Bool)

(assert (=> b!1277260 (= res!848735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277261 () Bool)

(assert (=> b!1277261 (= e!729427 (and e!729426 mapRes!51647))))

(declare-fun condMapEmpty!51647 () Bool)

(declare-fun mapDefault!51647 () ValueCell!15806)

(assert (=> b!1277261 (= condMapEmpty!51647 (= (arr!40415 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15806)) mapDefault!51647)))))

(declare-fun mapNonEmpty!51647 () Bool)

(declare-fun tp!98535 () Bool)

(assert (=> mapNonEmpty!51647 (= mapRes!51647 (and tp!98535 e!729428))))

(declare-fun mapValue!51647 () ValueCell!15806)

(declare-fun mapRest!51647 () (Array (_ BitVec 32) ValueCell!15806))

(declare-fun mapKey!51647 () (_ BitVec 32))

(assert (=> mapNonEmpty!51647 (= (arr!40415 _values!1187) (store mapRest!51647 mapKey!51647 mapValue!51647))))

(assert (= (and start!108164 res!848733) b!1277257))

(assert (= (and b!1277257 res!848736) b!1277260))

(assert (= (and b!1277260 res!848735) b!1277259))

(assert (= (and b!1277259 res!848734) b!1277256))

(assert (= (and b!1277261 condMapEmpty!51647) mapIsEmpty!51647))

(assert (= (and b!1277261 (not condMapEmpty!51647)) mapNonEmpty!51647))

(get-info :version)

(assert (= (and mapNonEmpty!51647 ((_ is ValueCellFull!15806) mapValue!51647)) b!1277255))

(assert (= (and b!1277261 ((_ is ValueCellFull!15806) mapDefault!51647)) b!1277258))

(assert (= start!108164 b!1277261))

(declare-fun m!1172469 () Bool)

(assert (=> b!1277256 m!1172469))

(assert (=> b!1277256 m!1172469))

(declare-fun m!1172471 () Bool)

(assert (=> b!1277256 m!1172471))

(declare-fun m!1172473 () Bool)

(assert (=> b!1277260 m!1172473))

(declare-fun m!1172475 () Bool)

(assert (=> b!1277259 m!1172475))

(declare-fun m!1172477 () Bool)

(assert (=> mapNonEmpty!51647 m!1172477))

(declare-fun m!1172479 () Bool)

(assert (=> start!108164 m!1172479))

(declare-fun m!1172481 () Bool)

(assert (=> start!108164 m!1172481))

(declare-fun m!1172483 () Bool)

(assert (=> start!108164 m!1172483))

(check-sat b_and!45899 (not b!1277260) (not b_next!27859) (not mapNonEmpty!51647) (not start!108164) (not b!1277256) tp_is_empty!33409 (not b!1277259))
(check-sat b_and!45899 (not b_next!27859))
