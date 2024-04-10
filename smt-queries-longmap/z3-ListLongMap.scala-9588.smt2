; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113392 () Bool)

(assert start!113392)

(declare-fun b_free!31443 () Bool)

(declare-fun b_next!31443 () Bool)

(assert (=> start!113392 (= b_free!31443 (not b_next!31443))))

(declare-fun tp!110133 () Bool)

(declare-fun b_and!50731 () Bool)

(assert (=> start!113392 (= tp!110133 b_and!50731)))

(declare-fun b!1346058 () Bool)

(declare-fun e!765882 () Bool)

(declare-fun e!765884 () Bool)

(declare-fun mapRes!57871 () Bool)

(assert (=> b!1346058 (= e!765882 (and e!765884 mapRes!57871))))

(declare-fun condMapEmpty!57871 () Bool)

(declare-datatypes ((V!55027 0))(
  ( (V!55028 (val!18796 Int)) )
))
(declare-datatypes ((ValueCell!17823 0))(
  ( (ValueCellFull!17823 (v!21444 V!55027)) (EmptyCell!17823) )
))
(declare-datatypes ((array!91724 0))(
  ( (array!91725 (arr!44318 (Array (_ BitVec 32) ValueCell!17823)) (size!44868 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91724)

(declare-fun mapDefault!57871 () ValueCell!17823)

(assert (=> b!1346058 (= condMapEmpty!57871 (= (arr!44318 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17823)) mapDefault!57871)))))

(declare-fun b!1346059 () Bool)

(declare-fun tp_is_empty!37443 () Bool)

(assert (=> b!1346059 (= e!765884 tp_is_empty!37443)))

(declare-fun b!1346060 () Bool)

(declare-fun res!893190 () Bool)

(declare-fun e!765880 () Bool)

(assert (=> b!1346060 (=> (not res!893190) (not e!765880))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91726 0))(
  ( (array!91727 (arr!44319 (Array (_ BitVec 32) (_ BitVec 64))) (size!44869 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91726)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346060 (= res!893190 (and (= (size!44868 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44869 _keys!1571) (size!44868 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346061 () Bool)

(declare-fun res!893187 () Bool)

(assert (=> b!1346061 (=> (not res!893187) (not e!765880))))

(declare-datatypes ((List!31387 0))(
  ( (Nil!31384) (Cons!31383 (h!32592 (_ BitVec 64)) (t!45977 List!31387)) )
))
(declare-fun arrayNoDuplicates!0 (array!91726 (_ BitVec 32) List!31387) Bool)

(assert (=> b!1346061 (= res!893187 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31384))))

(declare-fun b!1346062 () Bool)

(declare-fun res!893186 () Bool)

(assert (=> b!1346062 (=> (not res!893186) (not e!765880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91726 (_ BitVec 32)) Bool)

(assert (=> b!1346062 (= res!893186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346063 () Bool)

(assert (=> b!1346063 (= e!765880 false)))

(declare-fun lt!595467 () Bool)

(declare-fun minValue!1245 () V!55027)

(declare-fun zeroValue!1245 () V!55027)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24232 0))(
  ( (tuple2!24233 (_1!12127 (_ BitVec 64)) (_2!12127 V!55027)) )
))
(declare-datatypes ((List!31388 0))(
  ( (Nil!31385) (Cons!31384 (h!32593 tuple2!24232) (t!45978 List!31388)) )
))
(declare-datatypes ((ListLongMap!21889 0))(
  ( (ListLongMap!21890 (toList!10960 List!31388)) )
))
(declare-fun contains!9136 (ListLongMap!21889 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5912 (array!91726 array!91724 (_ BitVec 32) (_ BitVec 32) V!55027 V!55027 (_ BitVec 32) Int) ListLongMap!21889)

(assert (=> b!1346063 (= lt!595467 (contains!9136 (getCurrentListMap!5912 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346064 () Bool)

(declare-fun e!765883 () Bool)

(assert (=> b!1346064 (= e!765883 tp_is_empty!37443)))

(declare-fun mapIsEmpty!57871 () Bool)

(assert (=> mapIsEmpty!57871 mapRes!57871))

(declare-fun res!893188 () Bool)

(assert (=> start!113392 (=> (not res!893188) (not e!765880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113392 (= res!893188 (validMask!0 mask!1977))))

(assert (=> start!113392 e!765880))

(assert (=> start!113392 tp_is_empty!37443))

(assert (=> start!113392 true))

(declare-fun array_inv!33395 (array!91726) Bool)

(assert (=> start!113392 (array_inv!33395 _keys!1571)))

(declare-fun array_inv!33396 (array!91724) Bool)

(assert (=> start!113392 (and (array_inv!33396 _values!1303) e!765882)))

(assert (=> start!113392 tp!110133))

(declare-fun mapNonEmpty!57871 () Bool)

(declare-fun tp!110134 () Bool)

(assert (=> mapNonEmpty!57871 (= mapRes!57871 (and tp!110134 e!765883))))

(declare-fun mapKey!57871 () (_ BitVec 32))

(declare-fun mapRest!57871 () (Array (_ BitVec 32) ValueCell!17823))

(declare-fun mapValue!57871 () ValueCell!17823)

(assert (=> mapNonEmpty!57871 (= (arr!44318 _values!1303) (store mapRest!57871 mapKey!57871 mapValue!57871))))

(declare-fun b!1346065 () Bool)

(declare-fun res!893189 () Bool)

(assert (=> b!1346065 (=> (not res!893189) (not e!765880))))

(assert (=> b!1346065 (= res!893189 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44869 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113392 res!893188) b!1346060))

(assert (= (and b!1346060 res!893190) b!1346062))

(assert (= (and b!1346062 res!893186) b!1346061))

(assert (= (and b!1346061 res!893187) b!1346065))

(assert (= (and b!1346065 res!893189) b!1346063))

(assert (= (and b!1346058 condMapEmpty!57871) mapIsEmpty!57871))

(assert (= (and b!1346058 (not condMapEmpty!57871)) mapNonEmpty!57871))

(get-info :version)

(assert (= (and mapNonEmpty!57871 ((_ is ValueCellFull!17823) mapValue!57871)) b!1346064))

(assert (= (and b!1346058 ((_ is ValueCellFull!17823) mapDefault!57871)) b!1346059))

(assert (= start!113392 b!1346058))

(declare-fun m!1233335 () Bool)

(assert (=> mapNonEmpty!57871 m!1233335))

(declare-fun m!1233337 () Bool)

(assert (=> start!113392 m!1233337))

(declare-fun m!1233339 () Bool)

(assert (=> start!113392 m!1233339))

(declare-fun m!1233341 () Bool)

(assert (=> start!113392 m!1233341))

(declare-fun m!1233343 () Bool)

(assert (=> b!1346062 m!1233343))

(declare-fun m!1233345 () Bool)

(assert (=> b!1346063 m!1233345))

(assert (=> b!1346063 m!1233345))

(declare-fun m!1233347 () Bool)

(assert (=> b!1346063 m!1233347))

(declare-fun m!1233349 () Bool)

(assert (=> b!1346061 m!1233349))

(check-sat (not mapNonEmpty!57871) (not b!1346062) (not b_next!31443) tp_is_empty!37443 (not b!1346063) b_and!50731 (not start!113392) (not b!1346061))
(check-sat b_and!50731 (not b_next!31443))
