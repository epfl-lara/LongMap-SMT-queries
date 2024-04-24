; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113410 () Bool)

(assert start!113410)

(declare-fun b_free!31237 () Bool)

(declare-fun b_next!31237 () Bool)

(assert (=> start!113410 (= b_free!31237 (not b_next!31237))))

(declare-fun tp!109515 () Bool)

(declare-fun b_and!50383 () Bool)

(assert (=> start!113410 (= tp!109515 b_and!50383)))

(declare-fun b!1343696 () Bool)

(declare-fun res!891117 () Bool)

(declare-fun e!765100 () Bool)

(assert (=> b!1343696 (=> (not res!891117) (not e!765100))))

(declare-datatypes ((array!91441 0))(
  ( (array!91442 (arr!44172 (Array (_ BitVec 32) (_ BitVec 64))) (size!44723 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91441)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91441 (_ BitVec 32)) Bool)

(assert (=> b!1343696 (= res!891117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343697 () Bool)

(declare-fun res!891116 () Bool)

(assert (=> b!1343697 (=> (not res!891116) (not e!765100))))

(declare-datatypes ((V!54753 0))(
  ( (V!54754 (val!18693 Int)) )
))
(declare-fun minValue!1245 () V!54753)

(declare-fun zeroValue!1245 () V!54753)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17720 0))(
  ( (ValueCellFull!17720 (v!21336 V!54753)) (EmptyCell!17720) )
))
(declare-datatypes ((array!91443 0))(
  ( (array!91444 (arr!44173 (Array (_ BitVec 32) ValueCell!17720)) (size!44724 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91443)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24130 0))(
  ( (tuple2!24131 (_1!12076 (_ BitVec 64)) (_2!12076 V!54753)) )
))
(declare-datatypes ((List!31279 0))(
  ( (Nil!31276) (Cons!31275 (h!32493 tuple2!24130) (t!45719 List!31279)) )
))
(declare-datatypes ((ListLongMap!21795 0))(
  ( (ListLongMap!21796 (toList!10913 List!31279)) )
))
(declare-fun contains!9101 (ListLongMap!21795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5860 (array!91441 array!91443 (_ BitVec 32) (_ BitVec 32) V!54753 V!54753 (_ BitVec 32) Int) ListLongMap!21795)

(assert (=> b!1343697 (= res!891116 (contains!9101 (getCurrentListMap!5860 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343698 () Bool)

(declare-fun res!891114 () Bool)

(assert (=> b!1343698 (=> (not res!891114) (not e!765100))))

(declare-datatypes ((List!31280 0))(
  ( (Nil!31277) (Cons!31276 (h!32494 (_ BitVec 64)) (t!45720 List!31280)) )
))
(declare-fun arrayNoDuplicates!0 (array!91441 (_ BitVec 32) List!31280) Bool)

(assert (=> b!1343698 (= res!891114 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31277))))

(declare-fun b!1343699 () Bool)

(declare-fun res!891115 () Bool)

(assert (=> b!1343699 (=> (not res!891115) (not e!765100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343699 (= res!891115 (validKeyInArray!0 (select (arr!44172 _keys!1571) from!1960)))))

(declare-fun b!1343700 () Bool)

(declare-fun res!891121 () Bool)

(assert (=> b!1343700 (=> (not res!891121) (not e!765100))))

(assert (=> b!1343700 (= res!891121 (and (= (size!44724 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44723 _keys!1571) (size!44724 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343701 () Bool)

(assert (=> b!1343701 (= e!765100 (not true))))

(declare-fun lt!594942 () ListLongMap!21795)

(assert (=> b!1343701 (contains!9101 lt!594942 k0!1142)))

(declare-fun lt!594944 () V!54753)

(declare-datatypes ((Unit!43998 0))(
  ( (Unit!43999) )
))
(declare-fun lt!594943 () Unit!43998)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!355 ((_ BitVec 64) (_ BitVec 64) V!54753 ListLongMap!21795) Unit!43998)

(assert (=> b!1343701 (= lt!594943 (lemmaInListMapAfterAddingDiffThenInBefore!355 k0!1142 (select (arr!44172 _keys!1571) from!1960) lt!594944 lt!594942))))

(declare-fun lt!594940 () ListLongMap!21795)

(assert (=> b!1343701 (contains!9101 lt!594940 k0!1142)))

(declare-fun lt!594941 () Unit!43998)

(assert (=> b!1343701 (= lt!594941 (lemmaInListMapAfterAddingDiffThenInBefore!355 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594940))))

(declare-fun +!4829 (ListLongMap!21795 tuple2!24130) ListLongMap!21795)

(assert (=> b!1343701 (= lt!594940 (+!4829 lt!594942 (tuple2!24131 (select (arr!44172 _keys!1571) from!1960) lt!594944)))))

(declare-fun get!22317 (ValueCell!17720 V!54753) V!54753)

(declare-fun dynLambda!3783 (Int (_ BitVec 64)) V!54753)

(assert (=> b!1343701 (= lt!594944 (get!22317 (select (arr!44173 _values!1303) from!1960) (dynLambda!3783 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6478 (array!91441 array!91443 (_ BitVec 32) (_ BitVec 32) V!54753 V!54753 (_ BitVec 32) Int) ListLongMap!21795)

(assert (=> b!1343701 (= lt!594942 (getCurrentListMapNoExtraKeys!6478 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343702 () Bool)

(declare-fun e!765097 () Bool)

(declare-fun tp_is_empty!37237 () Bool)

(assert (=> b!1343702 (= e!765097 tp_is_empty!37237)))

(declare-fun b!1343703 () Bool)

(declare-fun e!765098 () Bool)

(declare-fun mapRes!57562 () Bool)

(assert (=> b!1343703 (= e!765098 (and e!765097 mapRes!57562))))

(declare-fun condMapEmpty!57562 () Bool)

(declare-fun mapDefault!57562 () ValueCell!17720)

(assert (=> b!1343703 (= condMapEmpty!57562 (= (arr!44173 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17720)) mapDefault!57562)))))

(declare-fun b!1343704 () Bool)

(declare-fun res!891119 () Bool)

(assert (=> b!1343704 (=> (not res!891119) (not e!765100))))

(assert (=> b!1343704 (= res!891119 (not (= (select (arr!44172 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343705 () Bool)

(declare-fun e!765101 () Bool)

(assert (=> b!1343705 (= e!765101 tp_is_empty!37237)))

(declare-fun b!1343706 () Bool)

(declare-fun res!891120 () Bool)

(assert (=> b!1343706 (=> (not res!891120) (not e!765100))))

(assert (=> b!1343706 (= res!891120 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343707 () Bool)

(declare-fun res!891118 () Bool)

(assert (=> b!1343707 (=> (not res!891118) (not e!765100))))

(assert (=> b!1343707 (= res!891118 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44723 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57562 () Bool)

(declare-fun tp!109516 () Bool)

(assert (=> mapNonEmpty!57562 (= mapRes!57562 (and tp!109516 e!765101))))

(declare-fun mapRest!57562 () (Array (_ BitVec 32) ValueCell!17720))

(declare-fun mapKey!57562 () (_ BitVec 32))

(declare-fun mapValue!57562 () ValueCell!17720)

(assert (=> mapNonEmpty!57562 (= (arr!44173 _values!1303) (store mapRest!57562 mapKey!57562 mapValue!57562))))

(declare-fun res!891122 () Bool)

(assert (=> start!113410 (=> (not res!891122) (not e!765100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113410 (= res!891122 (validMask!0 mask!1977))))

(assert (=> start!113410 e!765100))

(assert (=> start!113410 tp_is_empty!37237))

(assert (=> start!113410 true))

(declare-fun array_inv!33571 (array!91441) Bool)

(assert (=> start!113410 (array_inv!33571 _keys!1571)))

(declare-fun array_inv!33572 (array!91443) Bool)

(assert (=> start!113410 (and (array_inv!33572 _values!1303) e!765098)))

(assert (=> start!113410 tp!109515))

(declare-fun mapIsEmpty!57562 () Bool)

(assert (=> mapIsEmpty!57562 mapRes!57562))

(assert (= (and start!113410 res!891122) b!1343700))

(assert (= (and b!1343700 res!891121) b!1343696))

(assert (= (and b!1343696 res!891117) b!1343698))

(assert (= (and b!1343698 res!891114) b!1343707))

(assert (= (and b!1343707 res!891118) b!1343697))

(assert (= (and b!1343697 res!891116) b!1343704))

(assert (= (and b!1343704 res!891119) b!1343699))

(assert (= (and b!1343699 res!891115) b!1343706))

(assert (= (and b!1343706 res!891120) b!1343701))

(assert (= (and b!1343703 condMapEmpty!57562) mapIsEmpty!57562))

(assert (= (and b!1343703 (not condMapEmpty!57562)) mapNonEmpty!57562))

(get-info :version)

(assert (= (and mapNonEmpty!57562 ((_ is ValueCellFull!17720) mapValue!57562)) b!1343705))

(assert (= (and b!1343703 ((_ is ValueCellFull!17720) mapDefault!57562)) b!1343702))

(assert (= start!113410 b!1343703))

(declare-fun b_lambda!24407 () Bool)

(assert (=> (not b_lambda!24407) (not b!1343701)))

(declare-fun t!45718 () Bool)

(declare-fun tb!12243 () Bool)

(assert (=> (and start!113410 (= defaultEntry!1306 defaultEntry!1306) t!45718) tb!12243))

(declare-fun result!25585 () Bool)

(assert (=> tb!12243 (= result!25585 tp_is_empty!37237)))

(assert (=> b!1343701 t!45718))

(declare-fun b_and!50385 () Bool)

(assert (= b_and!50383 (and (=> t!45718 result!25585) b_and!50385)))

(declare-fun m!1231617 () Bool)

(assert (=> b!1343698 m!1231617))

(declare-fun m!1231619 () Bool)

(assert (=> mapNonEmpty!57562 m!1231619))

(declare-fun m!1231621 () Bool)

(assert (=> start!113410 m!1231621))

(declare-fun m!1231623 () Bool)

(assert (=> start!113410 m!1231623))

(declare-fun m!1231625 () Bool)

(assert (=> start!113410 m!1231625))

(declare-fun m!1231627 () Bool)

(assert (=> b!1343701 m!1231627))

(declare-fun m!1231629 () Bool)

(assert (=> b!1343701 m!1231629))

(declare-fun m!1231631 () Bool)

(assert (=> b!1343701 m!1231631))

(declare-fun m!1231633 () Bool)

(assert (=> b!1343701 m!1231633))

(assert (=> b!1343701 m!1231629))

(assert (=> b!1343701 m!1231631))

(declare-fun m!1231635 () Bool)

(assert (=> b!1343701 m!1231635))

(declare-fun m!1231637 () Bool)

(assert (=> b!1343701 m!1231637))

(declare-fun m!1231639 () Bool)

(assert (=> b!1343701 m!1231639))

(declare-fun m!1231641 () Bool)

(assert (=> b!1343701 m!1231641))

(declare-fun m!1231643 () Bool)

(assert (=> b!1343701 m!1231643))

(assert (=> b!1343701 m!1231643))

(declare-fun m!1231645 () Bool)

(assert (=> b!1343701 m!1231645))

(assert (=> b!1343704 m!1231643))

(declare-fun m!1231647 () Bool)

(assert (=> b!1343696 m!1231647))

(assert (=> b!1343699 m!1231643))

(assert (=> b!1343699 m!1231643))

(declare-fun m!1231649 () Bool)

(assert (=> b!1343699 m!1231649))

(declare-fun m!1231651 () Bool)

(assert (=> b!1343697 m!1231651))

(assert (=> b!1343697 m!1231651))

(declare-fun m!1231653 () Bool)

(assert (=> b!1343697 m!1231653))

(check-sat tp_is_empty!37237 (not b!1343699) b_and!50385 (not b!1343701) (not b!1343697) (not start!113410) (not mapNonEmpty!57562) (not b_next!31237) (not b!1343696) (not b!1343698) (not b_lambda!24407))
(check-sat b_and!50385 (not b_next!31237))
