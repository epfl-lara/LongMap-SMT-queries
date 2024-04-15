; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113378 () Bool)

(assert start!113378)

(declare-fun b_free!31429 () Bool)

(declare-fun b_next!31429 () Bool)

(assert (=> start!113378 (= b_free!31429 (not b_next!31429))))

(declare-fun tp!110093 () Bool)

(declare-fun b_and!50693 () Bool)

(assert (=> start!113378 (= tp!110093 b_and!50693)))

(declare-fun b!1345772 () Bool)

(declare-fun res!893020 () Bool)

(declare-fun e!765735 () Bool)

(assert (=> b!1345772 (=> (not res!893020) (not e!765735))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345772 (= res!893020 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345773 () Bool)

(declare-fun res!893015 () Bool)

(assert (=> b!1345773 (=> (not res!893015) (not e!765735))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91639 0))(
  ( (array!91640 (arr!44276 (Array (_ BitVec 32) (_ BitVec 64))) (size!44828 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91639)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345773 (= res!893015 (not (= (select (arr!44276 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!893017 () Bool)

(assert (=> start!113378 (=> (not res!893017) (not e!765735))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113378 (= res!893017 (validMask!0 mask!1977))))

(assert (=> start!113378 e!765735))

(declare-fun tp_is_empty!37429 () Bool)

(assert (=> start!113378 tp_is_empty!37429))

(assert (=> start!113378 true))

(declare-fun array_inv!33557 (array!91639) Bool)

(assert (=> start!113378 (array_inv!33557 _keys!1571)))

(declare-datatypes ((V!55009 0))(
  ( (V!55010 (val!18789 Int)) )
))
(declare-datatypes ((ValueCell!17816 0))(
  ( (ValueCellFull!17816 (v!21436 V!55009)) (EmptyCell!17816) )
))
(declare-datatypes ((array!91641 0))(
  ( (array!91642 (arr!44277 (Array (_ BitVec 32) ValueCell!17816)) (size!44829 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91641)

(declare-fun e!765739 () Bool)

(declare-fun array_inv!33558 (array!91641) Bool)

(assert (=> start!113378 (and (array_inv!33558 _values!1303) e!765739)))

(assert (=> start!113378 tp!110093))

(declare-fun b!1345774 () Bool)

(declare-fun e!765738 () Bool)

(declare-fun mapRes!57850 () Bool)

(assert (=> b!1345774 (= e!765739 (and e!765738 mapRes!57850))))

(declare-fun condMapEmpty!57850 () Bool)

(declare-fun mapDefault!57850 () ValueCell!17816)

(assert (=> b!1345774 (= condMapEmpty!57850 (= (arr!44277 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17816)) mapDefault!57850)))))

(declare-fun b!1345775 () Bool)

(assert (=> b!1345775 (= e!765738 tp_is_empty!37429)))

(declare-fun mapNonEmpty!57850 () Bool)

(declare-fun tp!110092 () Bool)

(declare-fun e!765736 () Bool)

(assert (=> mapNonEmpty!57850 (= mapRes!57850 (and tp!110092 e!765736))))

(declare-fun mapValue!57850 () ValueCell!17816)

(declare-fun mapKey!57850 () (_ BitVec 32))

(declare-fun mapRest!57850 () (Array (_ BitVec 32) ValueCell!17816))

(assert (=> mapNonEmpty!57850 (= (arr!44277 _values!1303) (store mapRest!57850 mapKey!57850 mapValue!57850))))

(declare-fun b!1345776 () Bool)

(declare-fun e!765740 () Bool)

(assert (=> b!1345776 (= e!765735 e!765740)))

(declare-fun res!893012 () Bool)

(assert (=> b!1345776 (=> (not res!893012) (not e!765740))))

(declare-fun lt!595248 () V!55009)

(declare-datatypes ((tuple2!24288 0))(
  ( (tuple2!24289 (_1!12155 (_ BitVec 64)) (_2!12155 V!55009)) )
))
(declare-datatypes ((List!31423 0))(
  ( (Nil!31420) (Cons!31419 (h!32628 tuple2!24288) (t!46001 List!31423)) )
))
(declare-datatypes ((ListLongMap!21945 0))(
  ( (ListLongMap!21946 (toList!10988 List!31423)) )
))
(declare-fun lt!595246 () ListLongMap!21945)

(declare-fun contains!9093 (ListLongMap!21945 (_ BitVec 64)) Bool)

(declare-fun +!4862 (ListLongMap!21945 tuple2!24288) ListLongMap!21945)

(assert (=> b!1345776 (= res!893012 (contains!9093 (+!4862 lt!595246 (tuple2!24289 (select (arr!44276 _keys!1571) from!1960) lt!595248)) k0!1142))))

(declare-fun minValue!1245 () V!55009)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!55009)

(declare-fun getCurrentListMapNoExtraKeys!6505 (array!91639 array!91641 (_ BitVec 32) (_ BitVec 32) V!55009 V!55009 (_ BitVec 32) Int) ListLongMap!21945)

(assert (=> b!1345776 (= lt!595246 (getCurrentListMapNoExtraKeys!6505 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22378 (ValueCell!17816 V!55009) V!55009)

(declare-fun dynLambda!3792 (Int (_ BitVec 64)) V!55009)

(assert (=> b!1345776 (= lt!595248 (get!22378 (select (arr!44277 _values!1303) from!1960) (dynLambda!3792 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1345777 () Bool)

(assert (=> b!1345777 (= e!765740 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(assert (=> b!1345777 (contains!9093 lt!595246 k0!1142)))

(declare-datatypes ((Unit!43962 0))(
  ( (Unit!43963) )
))
(declare-fun lt!595247 () Unit!43962)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!399 ((_ BitVec 64) (_ BitVec 64) V!55009 ListLongMap!21945) Unit!43962)

(assert (=> b!1345777 (= lt!595247 (lemmaInListMapAfterAddingDiffThenInBefore!399 k0!1142 (select (arr!44276 _keys!1571) from!1960) lt!595248 lt!595246))))

(declare-fun b!1345778 () Bool)

(declare-fun res!893014 () Bool)

(assert (=> b!1345778 (=> (not res!893014) (not e!765735))))

(declare-fun getCurrentListMap!5827 (array!91639 array!91641 (_ BitVec 32) (_ BitVec 32) V!55009 V!55009 (_ BitVec 32) Int) ListLongMap!21945)

(assert (=> b!1345778 (= res!893014 (contains!9093 (getCurrentListMap!5827 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345779 () Bool)

(assert (=> b!1345779 (= e!765736 tp_is_empty!37429)))

(declare-fun mapIsEmpty!57850 () Bool)

(assert (=> mapIsEmpty!57850 mapRes!57850))

(declare-fun b!1345780 () Bool)

(declare-fun res!893013 () Bool)

(assert (=> b!1345780 (=> (not res!893013) (not e!765735))))

(declare-datatypes ((List!31424 0))(
  ( (Nil!31421) (Cons!31420 (h!32629 (_ BitVec 64)) (t!46002 List!31424)) )
))
(declare-fun arrayNoDuplicates!0 (array!91639 (_ BitVec 32) List!31424) Bool)

(assert (=> b!1345780 (= res!893013 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31421))))

(declare-fun b!1345781 () Bool)

(declare-fun res!893019 () Bool)

(assert (=> b!1345781 (=> (not res!893019) (not e!765740))))

(assert (=> b!1345781 (= res!893019 (not (= k0!1142 (select (arr!44276 _keys!1571) from!1960))))))

(declare-fun b!1345782 () Bool)

(declare-fun res!893016 () Bool)

(assert (=> b!1345782 (=> (not res!893016) (not e!765735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345782 (= res!893016 (validKeyInArray!0 (select (arr!44276 _keys!1571) from!1960)))))

(declare-fun b!1345783 () Bool)

(declare-fun res!893018 () Bool)

(assert (=> b!1345783 (=> (not res!893018) (not e!765735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91639 (_ BitVec 32)) Bool)

(assert (=> b!1345783 (= res!893018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345784 () Bool)

(declare-fun res!893011 () Bool)

(assert (=> b!1345784 (=> (not res!893011) (not e!765735))))

(assert (=> b!1345784 (= res!893011 (and (= (size!44829 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44828 _keys!1571) (size!44829 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345785 () Bool)

(declare-fun res!893010 () Bool)

(assert (=> b!1345785 (=> (not res!893010) (not e!765735))))

(assert (=> b!1345785 (= res!893010 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44828 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113378 res!893017) b!1345784))

(assert (= (and b!1345784 res!893011) b!1345783))

(assert (= (and b!1345783 res!893018) b!1345780))

(assert (= (and b!1345780 res!893013) b!1345785))

(assert (= (and b!1345785 res!893010) b!1345778))

(assert (= (and b!1345778 res!893014) b!1345773))

(assert (= (and b!1345773 res!893015) b!1345782))

(assert (= (and b!1345782 res!893016) b!1345772))

(assert (= (and b!1345772 res!893020) b!1345776))

(assert (= (and b!1345776 res!893012) b!1345781))

(assert (= (and b!1345781 res!893019) b!1345777))

(assert (= (and b!1345774 condMapEmpty!57850) mapIsEmpty!57850))

(assert (= (and b!1345774 (not condMapEmpty!57850)) mapNonEmpty!57850))

(get-info :version)

(assert (= (and mapNonEmpty!57850 ((_ is ValueCellFull!17816) mapValue!57850)) b!1345779))

(assert (= (and b!1345774 ((_ is ValueCellFull!17816) mapDefault!57850)) b!1345775))

(assert (= start!113378 b!1345774))

(declare-fun b_lambda!24541 () Bool)

(assert (=> (not b_lambda!24541) (not b!1345776)))

(declare-fun t!46000 () Bool)

(declare-fun tb!12381 () Bool)

(assert (=> (and start!113378 (= defaultEntry!1306 defaultEntry!1306) t!46000) tb!12381))

(declare-fun result!25861 () Bool)

(assert (=> tb!12381 (= result!25861 tp_is_empty!37429)))

(assert (=> b!1345776 t!46000))

(declare-fun b_and!50695 () Bool)

(assert (= b_and!50693 (and (=> t!46000 result!25861) b_and!50695)))

(declare-fun m!1232647 () Bool)

(assert (=> b!1345783 m!1232647))

(declare-fun m!1232649 () Bool)

(assert (=> b!1345782 m!1232649))

(assert (=> b!1345782 m!1232649))

(declare-fun m!1232651 () Bool)

(assert (=> b!1345782 m!1232651))

(declare-fun m!1232653 () Bool)

(assert (=> b!1345780 m!1232653))

(declare-fun m!1232655 () Bool)

(assert (=> mapNonEmpty!57850 m!1232655))

(assert (=> b!1345781 m!1232649))

(declare-fun m!1232657 () Bool)

(assert (=> b!1345776 m!1232657))

(declare-fun m!1232659 () Bool)

(assert (=> b!1345776 m!1232659))

(declare-fun m!1232661 () Bool)

(assert (=> b!1345776 m!1232661))

(declare-fun m!1232663 () Bool)

(assert (=> b!1345776 m!1232663))

(declare-fun m!1232665 () Bool)

(assert (=> b!1345776 m!1232665))

(declare-fun m!1232667 () Bool)

(assert (=> b!1345776 m!1232667))

(assert (=> b!1345776 m!1232663))

(assert (=> b!1345776 m!1232657))

(assert (=> b!1345776 m!1232665))

(assert (=> b!1345776 m!1232649))

(declare-fun m!1232669 () Bool)

(assert (=> b!1345777 m!1232669))

(assert (=> b!1345777 m!1232649))

(assert (=> b!1345777 m!1232649))

(declare-fun m!1232671 () Bool)

(assert (=> b!1345777 m!1232671))

(declare-fun m!1232673 () Bool)

(assert (=> b!1345778 m!1232673))

(assert (=> b!1345778 m!1232673))

(declare-fun m!1232675 () Bool)

(assert (=> b!1345778 m!1232675))

(assert (=> b!1345773 m!1232649))

(declare-fun m!1232677 () Bool)

(assert (=> start!113378 m!1232677))

(declare-fun m!1232679 () Bool)

(assert (=> start!113378 m!1232679))

(declare-fun m!1232681 () Bool)

(assert (=> start!113378 m!1232681))

(check-sat (not b!1345783) (not b_next!31429) (not b_lambda!24541) (not b!1345778) (not mapNonEmpty!57850) tp_is_empty!37429 (not start!113378) (not b!1345782) (not b!1345777) b_and!50695 (not b!1345776) (not b!1345780))
(check-sat b_and!50695 (not b_next!31429))
