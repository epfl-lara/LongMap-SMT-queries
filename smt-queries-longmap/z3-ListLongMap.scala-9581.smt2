; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113350 () Bool)

(assert start!113350)

(declare-fun b_free!31401 () Bool)

(declare-fun b_next!31401 () Bool)

(assert (=> start!113350 (= b_free!31401 (not b_next!31401))))

(declare-fun tp!110007 () Bool)

(declare-fun b_and!50655 () Bool)

(assert (=> start!113350 (= tp!110007 b_and!50655)))

(declare-fun b!1345226 () Bool)

(declare-fun res!892581 () Bool)

(declare-fun e!765518 () Bool)

(assert (=> b!1345226 (=> (not res!892581) (not e!765518))))

(declare-datatypes ((V!54971 0))(
  ( (V!54972 (val!18775 Int)) )
))
(declare-fun minValue!1245 () V!54971)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91642 0))(
  ( (array!91643 (arr!44277 (Array (_ BitVec 32) (_ BitVec 64))) (size!44827 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91642)

(declare-fun zeroValue!1245 () V!54971)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17802 0))(
  ( (ValueCellFull!17802 (v!21423 V!54971)) (EmptyCell!17802) )
))
(declare-datatypes ((array!91644 0))(
  ( (array!91645 (arr!44278 (Array (_ BitVec 32) ValueCell!17802)) (size!44828 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91644)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24202 0))(
  ( (tuple2!24203 (_1!12112 (_ BitVec 64)) (_2!12112 V!54971)) )
))
(declare-datatypes ((List!31358 0))(
  ( (Nil!31355) (Cons!31354 (h!32563 tuple2!24202) (t!45916 List!31358)) )
))
(declare-datatypes ((ListLongMap!21859 0))(
  ( (ListLongMap!21860 (toList!10945 List!31358)) )
))
(declare-fun contains!9121 (ListLongMap!21859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5899 (array!91642 array!91644 (_ BitVec 32) (_ BitVec 32) V!54971 V!54971 (_ BitVec 32) Int) ListLongMap!21859)

(assert (=> b!1345226 (= res!892581 (contains!9121 (getCurrentListMap!5899 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!892583 () Bool)

(assert (=> start!113350 (=> (not res!892583) (not e!765518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113350 (= res!892583 (validMask!0 mask!1977))))

(assert (=> start!113350 e!765518))

(declare-fun tp_is_empty!37401 () Bool)

(assert (=> start!113350 tp_is_empty!37401))

(assert (=> start!113350 true))

(declare-fun array_inv!33367 (array!91642) Bool)

(assert (=> start!113350 (array_inv!33367 _keys!1571)))

(declare-fun e!765521 () Bool)

(declare-fun array_inv!33368 (array!91644) Bool)

(assert (=> start!113350 (and (array_inv!33368 _values!1303) e!765521)))

(assert (=> start!113350 tp!110007))

(declare-fun b!1345227 () Bool)

(declare-fun e!765516 () Bool)

(assert (=> b!1345227 (= e!765516 (not true))))

(declare-fun lt!595307 () ListLongMap!21859)

(assert (=> b!1345227 (contains!9121 lt!595307 k0!1142)))

(declare-fun lt!595308 () V!54971)

(declare-datatypes ((Unit!44127 0))(
  ( (Unit!44128) )
))
(declare-fun lt!595306 () Unit!44127)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!394 ((_ BitVec 64) (_ BitVec 64) V!54971 ListLongMap!21859) Unit!44127)

(assert (=> b!1345227 (= lt!595306 (lemmaInListMapAfterAddingDiffThenInBefore!394 k0!1142 (select (arr!44277 _keys!1571) from!1960) lt!595308 lt!595307))))

(declare-fun b!1345228 () Bool)

(declare-fun res!892577 () Bool)

(assert (=> b!1345228 (=> (not res!892577) (not e!765518))))

(assert (=> b!1345228 (= res!892577 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44827 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345229 () Bool)

(declare-fun res!892579 () Bool)

(assert (=> b!1345229 (=> (not res!892579) (not e!765518))))

(declare-datatypes ((List!31359 0))(
  ( (Nil!31356) (Cons!31355 (h!32564 (_ BitVec 64)) (t!45917 List!31359)) )
))
(declare-fun arrayNoDuplicates!0 (array!91642 (_ BitVec 32) List!31359) Bool)

(assert (=> b!1345229 (= res!892579 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31356))))

(declare-fun b!1345230 () Bool)

(declare-fun res!892586 () Bool)

(assert (=> b!1345230 (=> (not res!892586) (not e!765518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91642 (_ BitVec 32)) Bool)

(assert (=> b!1345230 (= res!892586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345231 () Bool)

(declare-fun res!892582 () Bool)

(assert (=> b!1345231 (=> (not res!892582) (not e!765518))))

(assert (=> b!1345231 (= res!892582 (and (= (size!44828 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44827 _keys!1571) (size!44828 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345232 () Bool)

(declare-fun e!765517 () Bool)

(assert (=> b!1345232 (= e!765517 tp_is_empty!37401)))

(declare-fun b!1345233 () Bool)

(declare-fun e!765519 () Bool)

(assert (=> b!1345233 (= e!765519 tp_is_empty!37401)))

(declare-fun b!1345234 () Bool)

(declare-fun res!892587 () Bool)

(assert (=> b!1345234 (=> (not res!892587) (not e!765518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345234 (= res!892587 (validKeyInArray!0 (select (arr!44277 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57808 () Bool)

(declare-fun mapRes!57808 () Bool)

(assert (=> mapIsEmpty!57808 mapRes!57808))

(declare-fun b!1345235 () Bool)

(declare-fun res!892580 () Bool)

(assert (=> b!1345235 (=> (not res!892580) (not e!765518))))

(assert (=> b!1345235 (= res!892580 (not (= (select (arr!44277 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345236 () Bool)

(declare-fun res!892585 () Bool)

(assert (=> b!1345236 (=> (not res!892585) (not e!765518))))

(assert (=> b!1345236 (= res!892585 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345237 () Bool)

(declare-fun res!892578 () Bool)

(assert (=> b!1345237 (=> (not res!892578) (not e!765516))))

(assert (=> b!1345237 (= res!892578 (not (= k0!1142 (select (arr!44277 _keys!1571) from!1960))))))

(declare-fun mapNonEmpty!57808 () Bool)

(declare-fun tp!110008 () Bool)

(assert (=> mapNonEmpty!57808 (= mapRes!57808 (and tp!110008 e!765517))))

(declare-fun mapValue!57808 () ValueCell!17802)

(declare-fun mapKey!57808 () (_ BitVec 32))

(declare-fun mapRest!57808 () (Array (_ BitVec 32) ValueCell!17802))

(assert (=> mapNonEmpty!57808 (= (arr!44278 _values!1303) (store mapRest!57808 mapKey!57808 mapValue!57808))))

(declare-fun b!1345238 () Bool)

(assert (=> b!1345238 (= e!765518 e!765516)))

(declare-fun res!892584 () Bool)

(assert (=> b!1345238 (=> (not res!892584) (not e!765516))))

(declare-fun +!4827 (ListLongMap!21859 tuple2!24202) ListLongMap!21859)

(assert (=> b!1345238 (= res!892584 (contains!9121 (+!4827 lt!595307 (tuple2!24203 (select (arr!44277 _keys!1571) from!1960) lt!595308)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6469 (array!91642 array!91644 (_ BitVec 32) (_ BitVec 32) V!54971 V!54971 (_ BitVec 32) Int) ListLongMap!21859)

(assert (=> b!1345238 (= lt!595307 (getCurrentListMapNoExtraKeys!6469 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22366 (ValueCell!17802 V!54971) V!54971)

(declare-fun dynLambda!3766 (Int (_ BitVec 64)) V!54971)

(assert (=> b!1345238 (= lt!595308 (get!22366 (select (arr!44278 _values!1303) from!1960) (dynLambda!3766 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1345239 () Bool)

(assert (=> b!1345239 (= e!765521 (and e!765519 mapRes!57808))))

(declare-fun condMapEmpty!57808 () Bool)

(declare-fun mapDefault!57808 () ValueCell!17802)

(assert (=> b!1345239 (= condMapEmpty!57808 (= (arr!44278 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17802)) mapDefault!57808)))))

(assert (= (and start!113350 res!892583) b!1345231))

(assert (= (and b!1345231 res!892582) b!1345230))

(assert (= (and b!1345230 res!892586) b!1345229))

(assert (= (and b!1345229 res!892579) b!1345228))

(assert (= (and b!1345228 res!892577) b!1345226))

(assert (= (and b!1345226 res!892581) b!1345235))

(assert (= (and b!1345235 res!892580) b!1345234))

(assert (= (and b!1345234 res!892587) b!1345236))

(assert (= (and b!1345236 res!892585) b!1345238))

(assert (= (and b!1345238 res!892584) b!1345237))

(assert (= (and b!1345237 res!892578) b!1345227))

(assert (= (and b!1345239 condMapEmpty!57808) mapIsEmpty!57808))

(assert (= (and b!1345239 (not condMapEmpty!57808)) mapNonEmpty!57808))

(get-info :version)

(assert (= (and mapNonEmpty!57808 ((_ is ValueCellFull!17802) mapValue!57808)) b!1345232))

(assert (= (and b!1345239 ((_ is ValueCellFull!17802) mapDefault!57808)) b!1345233))

(assert (= start!113350 b!1345239))

(declare-fun b_lambda!24523 () Bool)

(assert (=> (not b_lambda!24523) (not b!1345238)))

(declare-fun t!45915 () Bool)

(declare-fun tb!12361 () Bool)

(assert (=> (and start!113350 (= defaultEntry!1306 defaultEntry!1306) t!45915) tb!12361))

(declare-fun result!25813 () Bool)

(assert (=> tb!12361 (= result!25813 tp_is_empty!37401)))

(assert (=> b!1345238 t!45915))

(declare-fun b_and!50657 () Bool)

(assert (= b_and!50655 (and (=> t!45915 result!25813) b_and!50657)))

(declare-fun m!1232659 () Bool)

(assert (=> b!1345229 m!1232659))

(declare-fun m!1232661 () Bool)

(assert (=> b!1345235 m!1232661))

(declare-fun m!1232663 () Bool)

(assert (=> mapNonEmpty!57808 m!1232663))

(declare-fun m!1232665 () Bool)

(assert (=> start!113350 m!1232665))

(declare-fun m!1232667 () Bool)

(assert (=> start!113350 m!1232667))

(declare-fun m!1232669 () Bool)

(assert (=> start!113350 m!1232669))

(declare-fun m!1232671 () Bool)

(assert (=> b!1345230 m!1232671))

(declare-fun m!1232673 () Bool)

(assert (=> b!1345238 m!1232673))

(declare-fun m!1232675 () Bool)

(assert (=> b!1345238 m!1232675))

(declare-fun m!1232677 () Bool)

(assert (=> b!1345238 m!1232677))

(declare-fun m!1232679 () Bool)

(assert (=> b!1345238 m!1232679))

(assert (=> b!1345238 m!1232675))

(assert (=> b!1345238 m!1232677))

(declare-fun m!1232681 () Bool)

(assert (=> b!1345238 m!1232681))

(assert (=> b!1345238 m!1232661))

(assert (=> b!1345238 m!1232681))

(declare-fun m!1232683 () Bool)

(assert (=> b!1345238 m!1232683))

(declare-fun m!1232685 () Bool)

(assert (=> b!1345227 m!1232685))

(assert (=> b!1345227 m!1232661))

(assert (=> b!1345227 m!1232661))

(declare-fun m!1232687 () Bool)

(assert (=> b!1345227 m!1232687))

(declare-fun m!1232689 () Bool)

(assert (=> b!1345226 m!1232689))

(assert (=> b!1345226 m!1232689))

(declare-fun m!1232691 () Bool)

(assert (=> b!1345226 m!1232691))

(assert (=> b!1345237 m!1232661))

(assert (=> b!1345234 m!1232661))

(assert (=> b!1345234 m!1232661))

(declare-fun m!1232693 () Bool)

(assert (=> b!1345234 m!1232693))

(check-sat (not b!1345238) (not mapNonEmpty!57808) (not start!113350) (not b!1345229) (not b!1345234) (not b!1345230) b_and!50657 (not b!1345227) (not b_lambda!24523) tp_is_empty!37401 (not b!1345226) (not b_next!31401))
(check-sat b_and!50657 (not b_next!31401))
