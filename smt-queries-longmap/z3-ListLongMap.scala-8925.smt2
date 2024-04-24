; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108456 () Bool)

(assert start!108456)

(declare-fun b_free!27913 () Bool)

(declare-fun b_next!27913 () Bool)

(assert (=> start!108456 (= b_free!27913 (not b_next!27913))))

(declare-fun tp!98698 () Bool)

(declare-fun b_and!45975 () Bool)

(assert (=> start!108456 (= tp!98698 b_and!45975)))

(declare-fun b!1279317 () Bool)

(declare-fun res!849662 () Bool)

(declare-fun e!730786 () Bool)

(assert (=> b!1279317 (=> (not res!849662) (not e!730786))))

(declare-datatypes ((array!84049 0))(
  ( (array!84050 (arr!40529 (Array (_ BitVec 32) (_ BitVec 64))) (size!41080 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!84049)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84049 (_ BitVec 32)) Bool)

(assert (=> b!1279317 (= res!849662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1279318 () Bool)

(declare-fun res!849667 () Bool)

(assert (=> b!1279318 (=> (not res!849667) (not e!730786))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49721 0))(
  ( (V!49722 (val!16806 Int)) )
))
(declare-datatypes ((ValueCell!15833 0))(
  ( (ValueCellFull!15833 (v!19400 V!49721)) (EmptyCell!15833) )
))
(declare-datatypes ((array!84051 0))(
  ( (array!84052 (arr!40530 (Array (_ BitVec 32) ValueCell!15833)) (size!41081 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84051)

(assert (=> b!1279318 (= res!849667 (and (= (size!41081 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41080 _keys!1427) (size!41081 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1279319 () Bool)

(declare-fun e!730782 () Bool)

(declare-fun tp_is_empty!33463 () Bool)

(assert (=> b!1279319 (= e!730782 tp_is_empty!33463)))

(declare-fun b!1279320 () Bool)

(declare-fun e!730784 () Bool)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!84049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1279320 (= e!730784 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!51731 () Bool)

(declare-fun mapRes!51731 () Bool)

(assert (=> mapIsEmpty!51731 mapRes!51731))

(declare-fun b!1279321 () Bool)

(declare-fun res!849666 () Bool)

(assert (=> b!1279321 (=> (not res!849666) (not e!730786))))

(declare-datatypes ((List!28769 0))(
  ( (Nil!28766) (Cons!28765 (h!29983 (_ BitVec 64)) (t!42301 List!28769)) )
))
(declare-fun arrayNoDuplicates!0 (array!84049 (_ BitVec 32) List!28769) Bool)

(assert (=> b!1279321 (= res!849666 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28766))))

(declare-fun res!849664 () Bool)

(assert (=> start!108456 (=> (not res!849664) (not e!730786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108456 (= res!849664 (validMask!0 mask!1805))))

(assert (=> start!108456 e!730786))

(assert (=> start!108456 true))

(assert (=> start!108456 tp!98698))

(assert (=> start!108456 tp_is_empty!33463))

(declare-fun e!730783 () Bool)

(declare-fun array_inv!30975 (array!84051) Bool)

(assert (=> start!108456 (and (array_inv!30975 _values!1187) e!730783)))

(declare-fun array_inv!30976 (array!84049) Bool)

(assert (=> start!108456 (array_inv!30976 _keys!1427)))

(declare-fun b!1279322 () Bool)

(assert (=> b!1279322 (= e!730784 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!51731 () Bool)

(declare-fun tp!98699 () Bool)

(assert (=> mapNonEmpty!51731 (= mapRes!51731 (and tp!98699 e!730782))))

(declare-fun mapRest!51731 () (Array (_ BitVec 32) ValueCell!15833))

(declare-fun mapKey!51731 () (_ BitVec 32))

(declare-fun mapValue!51731 () ValueCell!15833)

(assert (=> mapNonEmpty!51731 (= (arr!40530 _values!1187) (store mapRest!51731 mapKey!51731 mapValue!51731))))

(declare-fun b!1279323 () Bool)

(declare-fun e!730781 () Bool)

(assert (=> b!1279323 (= e!730781 tp_is_empty!33463)))

(declare-fun b!1279324 () Bool)

(declare-fun res!849665 () Bool)

(assert (=> b!1279324 (=> (not res!849665) (not e!730786))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49721)

(declare-fun zeroValue!1129 () V!49721)

(declare-datatypes ((tuple2!21580 0))(
  ( (tuple2!21581 (_1!10801 (_ BitVec 64)) (_2!10801 V!49721)) )
))
(declare-datatypes ((List!28770 0))(
  ( (Nil!28767) (Cons!28766 (h!29984 tuple2!21580) (t!42302 List!28770)) )
))
(declare-datatypes ((ListLongMap!19245 0))(
  ( (ListLongMap!19246 (toList!9638 List!28770)) )
))
(declare-fun contains!7764 (ListLongMap!19245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4707 (array!84049 array!84051 (_ BitVec 32) (_ BitVec 32) V!49721 V!49721 (_ BitVec 32) Int) ListLongMap!19245)

(assert (=> b!1279324 (= res!849665 (contains!7764 (getCurrentListMap!4707 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1279325 () Bool)

(assert (=> b!1279325 (= e!730786 (not true))))

(assert (=> b!1279325 e!730784))

(declare-fun c!124420 () Bool)

(assert (=> b!1279325 (= c!124420 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!42350 0))(
  ( (Unit!42351) )
))
(declare-fun lt!576323 () Unit!42350)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!635 (array!84049 array!84051 (_ BitVec 32) (_ BitVec 32) V!49721 V!49721 (_ BitVec 64) (_ BitVec 32) Int) Unit!42350)

(assert (=> b!1279325 (= lt!576323 (lemmaListMapContainsThenArrayContainsFrom!635 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1279326 () Bool)

(assert (=> b!1279326 (= e!730783 (and e!730781 mapRes!51731))))

(declare-fun condMapEmpty!51731 () Bool)

(declare-fun mapDefault!51731 () ValueCell!15833)

(assert (=> b!1279326 (= condMapEmpty!51731 (= (arr!40530 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15833)) mapDefault!51731)))))

(declare-fun b!1279327 () Bool)

(declare-fun res!849663 () Bool)

(assert (=> b!1279327 (=> (not res!849663) (not e!730786))))

(assert (=> b!1279327 (= res!849663 (bvslt #b00000000000000000000000000000000 (size!41080 _keys!1427)))))

(assert (= (and start!108456 res!849664) b!1279318))

(assert (= (and b!1279318 res!849667) b!1279317))

(assert (= (and b!1279317 res!849662) b!1279321))

(assert (= (and b!1279321 res!849666) b!1279324))

(assert (= (and b!1279324 res!849665) b!1279327))

(assert (= (and b!1279327 res!849663) b!1279325))

(assert (= (and b!1279325 c!124420) b!1279320))

(assert (= (and b!1279325 (not c!124420)) b!1279322))

(assert (= (and b!1279326 condMapEmpty!51731) mapIsEmpty!51731))

(assert (= (and b!1279326 (not condMapEmpty!51731)) mapNonEmpty!51731))

(get-info :version)

(assert (= (and mapNonEmpty!51731 ((_ is ValueCellFull!15833) mapValue!51731)) b!1279319))

(assert (= (and b!1279326 ((_ is ValueCellFull!15833) mapDefault!51731)) b!1279323))

(assert (= start!108456 b!1279326))

(declare-fun m!1175093 () Bool)

(assert (=> b!1279324 m!1175093))

(assert (=> b!1279324 m!1175093))

(declare-fun m!1175095 () Bool)

(assert (=> b!1279324 m!1175095))

(declare-fun m!1175097 () Bool)

(assert (=> b!1279325 m!1175097))

(declare-fun m!1175099 () Bool)

(assert (=> b!1279321 m!1175099))

(declare-fun m!1175101 () Bool)

(assert (=> b!1279317 m!1175101))

(declare-fun m!1175103 () Bool)

(assert (=> start!108456 m!1175103))

(declare-fun m!1175105 () Bool)

(assert (=> start!108456 m!1175105))

(declare-fun m!1175107 () Bool)

(assert (=> start!108456 m!1175107))

(declare-fun m!1175109 () Bool)

(assert (=> mapNonEmpty!51731 m!1175109))

(declare-fun m!1175111 () Bool)

(assert (=> b!1279320 m!1175111))

(check-sat (not b!1279321) (not start!108456) tp_is_empty!33463 (not b!1279324) (not b!1279325) (not b!1279320) (not b!1279317) b_and!45975 (not mapNonEmpty!51731) (not b_next!27913))
(check-sat b_and!45975 (not b_next!27913))
