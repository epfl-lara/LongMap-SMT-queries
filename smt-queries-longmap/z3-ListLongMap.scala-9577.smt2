; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113324 () Bool)

(assert start!113324)

(declare-fun b_free!31375 () Bool)

(declare-fun b_next!31375 () Bool)

(assert (=> start!113324 (= b_free!31375 (not b_next!31375))))

(declare-fun tp!109931 () Bool)

(declare-fun b_and!50585 () Bool)

(assert (=> start!113324 (= tp!109931 b_and!50585)))

(declare-fun b!1344598 () Bool)

(declare-fun e!765258 () Bool)

(assert (=> b!1344598 (= e!765258 false)))

(declare-datatypes ((V!54937 0))(
  ( (V!54938 (val!18762 Int)) )
))
(declare-fun minValue!1245 () V!54937)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91535 0))(
  ( (array!91536 (arr!44224 (Array (_ BitVec 32) (_ BitVec 64))) (size!44776 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91535)

(declare-fun zeroValue!1245 () V!54937)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17789 0))(
  ( (ValueCellFull!17789 (v!21409 V!54937)) (EmptyCell!17789) )
))
(declare-datatypes ((array!91537 0))(
  ( (array!91538 (arr!44225 (Array (_ BitVec 32) ValueCell!17789)) (size!44777 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91537)

(declare-fun lt!595017 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24240 0))(
  ( (tuple2!24241 (_1!12131 (_ BitVec 64)) (_2!12131 V!54937)) )
))
(declare-datatypes ((List!31381 0))(
  ( (Nil!31378) (Cons!31377 (h!32586 tuple2!24240) (t!45905 List!31381)) )
))
(declare-datatypes ((ListLongMap!21897 0))(
  ( (ListLongMap!21898 (toList!10964 List!31381)) )
))
(declare-fun contains!9069 (ListLongMap!21897 (_ BitVec 64)) Bool)

(declare-fun +!4845 (ListLongMap!21897 tuple2!24240) ListLongMap!21897)

(declare-fun getCurrentListMapNoExtraKeys!6488 (array!91535 array!91537 (_ BitVec 32) (_ BitVec 32) V!54937 V!54937 (_ BitVec 32) Int) ListLongMap!21897)

(declare-fun get!22343 (ValueCell!17789 V!54937) V!54937)

(declare-fun dynLambda!3775 (Int (_ BitVec 64)) V!54937)

(assert (=> b!1344598 (= lt!595017 (contains!9069 (+!4845 (getCurrentListMapNoExtraKeys!6488 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24241 (select (arr!44224 _keys!1571) from!1960) (get!22343 (select (arr!44225 _values!1303) from!1960) (dynLambda!3775 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142))))

(declare-fun b!1344599 () Bool)

(declare-fun res!892134 () Bool)

(assert (=> b!1344599 (=> (not res!892134) (not e!765258))))

(declare-datatypes ((List!31382 0))(
  ( (Nil!31379) (Cons!31378 (h!32587 (_ BitVec 64)) (t!45906 List!31382)) )
))
(declare-fun arrayNoDuplicates!0 (array!91535 (_ BitVec 32) List!31382) Bool)

(assert (=> b!1344599 (= res!892134 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31379))))

(declare-fun b!1344600 () Bool)

(declare-fun e!765257 () Bool)

(declare-fun tp_is_empty!37375 () Bool)

(assert (=> b!1344600 (= e!765257 tp_is_empty!37375)))

(declare-fun b!1344601 () Bool)

(declare-fun res!892139 () Bool)

(assert (=> b!1344601 (=> (not res!892139) (not e!765258))))

(assert (=> b!1344601 (= res!892139 (and (= (size!44777 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44776 _keys!1571) (size!44777 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344602 () Bool)

(declare-fun res!892138 () Bool)

(assert (=> b!1344602 (=> (not res!892138) (not e!765258))))

(assert (=> b!1344602 (= res!892138 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1344603 () Bool)

(declare-fun res!892141 () Bool)

(assert (=> b!1344603 (=> (not res!892141) (not e!765258))))

(assert (=> b!1344603 (= res!892141 (not (= (select (arr!44224 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapNonEmpty!57769 () Bool)

(declare-fun mapRes!57769 () Bool)

(declare-fun tp!109930 () Bool)

(declare-fun e!765260 () Bool)

(assert (=> mapNonEmpty!57769 (= mapRes!57769 (and tp!109930 e!765260))))

(declare-fun mapKey!57769 () (_ BitVec 32))

(declare-fun mapValue!57769 () ValueCell!17789)

(declare-fun mapRest!57769 () (Array (_ BitVec 32) ValueCell!17789))

(assert (=> mapNonEmpty!57769 (= (arr!44225 _values!1303) (store mapRest!57769 mapKey!57769 mapValue!57769))))

(declare-fun b!1344604 () Bool)

(declare-fun res!892133 () Bool)

(assert (=> b!1344604 (=> (not res!892133) (not e!765258))))

(assert (=> b!1344604 (= res!892133 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44776 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!892140 () Bool)

(assert (=> start!113324 (=> (not res!892140) (not e!765258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113324 (= res!892140 (validMask!0 mask!1977))))

(assert (=> start!113324 e!765258))

(assert (=> start!113324 tp_is_empty!37375))

(assert (=> start!113324 true))

(declare-fun array_inv!33519 (array!91535) Bool)

(assert (=> start!113324 (array_inv!33519 _keys!1571)))

(declare-fun e!765256 () Bool)

(declare-fun array_inv!33520 (array!91537) Bool)

(assert (=> start!113324 (and (array_inv!33520 _values!1303) e!765256)))

(assert (=> start!113324 tp!109931))

(declare-fun b!1344605 () Bool)

(assert (=> b!1344605 (= e!765256 (and e!765257 mapRes!57769))))

(declare-fun condMapEmpty!57769 () Bool)

(declare-fun mapDefault!57769 () ValueCell!17789)

(assert (=> b!1344605 (= condMapEmpty!57769 (= (arr!44225 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17789)) mapDefault!57769)))))

(declare-fun b!1344606 () Bool)

(declare-fun res!892135 () Bool)

(assert (=> b!1344606 (=> (not res!892135) (not e!765258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344606 (= res!892135 (validKeyInArray!0 (select (arr!44224 _keys!1571) from!1960)))))

(declare-fun b!1344607 () Bool)

(declare-fun res!892137 () Bool)

(assert (=> b!1344607 (=> (not res!892137) (not e!765258))))

(declare-fun getCurrentListMap!5809 (array!91535 array!91537 (_ BitVec 32) (_ BitVec 32) V!54937 V!54937 (_ BitVec 32) Int) ListLongMap!21897)

(assert (=> b!1344607 (= res!892137 (contains!9069 (getCurrentListMap!5809 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57769 () Bool)

(assert (=> mapIsEmpty!57769 mapRes!57769))

(declare-fun b!1344608 () Bool)

(assert (=> b!1344608 (= e!765260 tp_is_empty!37375)))

(declare-fun b!1344609 () Bool)

(declare-fun res!892136 () Bool)

(assert (=> b!1344609 (=> (not res!892136) (not e!765258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91535 (_ BitVec 32)) Bool)

(assert (=> b!1344609 (= res!892136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113324 res!892140) b!1344601))

(assert (= (and b!1344601 res!892139) b!1344609))

(assert (= (and b!1344609 res!892136) b!1344599))

(assert (= (and b!1344599 res!892134) b!1344604))

(assert (= (and b!1344604 res!892133) b!1344607))

(assert (= (and b!1344607 res!892137) b!1344603))

(assert (= (and b!1344603 res!892141) b!1344606))

(assert (= (and b!1344606 res!892135) b!1344602))

(assert (= (and b!1344602 res!892138) b!1344598))

(assert (= (and b!1344605 condMapEmpty!57769) mapIsEmpty!57769))

(assert (= (and b!1344605 (not condMapEmpty!57769)) mapNonEmpty!57769))

(get-info :version)

(assert (= (and mapNonEmpty!57769 ((_ is ValueCellFull!17789) mapValue!57769)) b!1344608))

(assert (= (and b!1344605 ((_ is ValueCellFull!17789) mapDefault!57769)) b!1344600))

(assert (= start!113324 b!1344605))

(declare-fun b_lambda!24487 () Bool)

(assert (=> (not b_lambda!24487) (not b!1344598)))

(declare-fun t!45904 () Bool)

(declare-fun tb!12327 () Bool)

(assert (=> (and start!113324 (= defaultEntry!1306 defaultEntry!1306) t!45904) tb!12327))

(declare-fun result!25753 () Bool)

(assert (=> tb!12327 (= result!25753 tp_is_empty!37375)))

(assert (=> b!1344598 t!45904))

(declare-fun b_and!50587 () Bool)

(assert (= b_and!50585 (and (=> t!45904 result!25753) b_and!50587)))

(declare-fun m!1231687 () Bool)

(assert (=> b!1344607 m!1231687))

(assert (=> b!1344607 m!1231687))

(declare-fun m!1231689 () Bool)

(assert (=> b!1344607 m!1231689))

(declare-fun m!1231691 () Bool)

(assert (=> b!1344609 m!1231691))

(declare-fun m!1231693 () Bool)

(assert (=> b!1344603 m!1231693))

(assert (=> b!1344606 m!1231693))

(assert (=> b!1344606 m!1231693))

(declare-fun m!1231695 () Bool)

(assert (=> b!1344606 m!1231695))

(declare-fun m!1231697 () Bool)

(assert (=> mapNonEmpty!57769 m!1231697))

(declare-fun m!1231699 () Bool)

(assert (=> b!1344598 m!1231699))

(declare-fun m!1231701 () Bool)

(assert (=> b!1344598 m!1231701))

(declare-fun m!1231703 () Bool)

(assert (=> b!1344598 m!1231703))

(declare-fun m!1231705 () Bool)

(assert (=> b!1344598 m!1231705))

(assert (=> b!1344598 m!1231699))

(declare-fun m!1231707 () Bool)

(assert (=> b!1344598 m!1231707))

(assert (=> b!1344598 m!1231701))

(assert (=> b!1344598 m!1231703))

(assert (=> b!1344598 m!1231707))

(declare-fun m!1231709 () Bool)

(assert (=> b!1344598 m!1231709))

(assert (=> b!1344598 m!1231693))

(declare-fun m!1231711 () Bool)

(assert (=> b!1344599 m!1231711))

(declare-fun m!1231713 () Bool)

(assert (=> start!113324 m!1231713))

(declare-fun m!1231715 () Bool)

(assert (=> start!113324 m!1231715))

(declare-fun m!1231717 () Bool)

(assert (=> start!113324 m!1231717))

(check-sat (not b!1344599) (not start!113324) (not b!1344607) tp_is_empty!37375 (not mapNonEmpty!57769) b_and!50587 (not b_next!31375) (not b!1344598) (not b_lambda!24487) (not b!1344606) (not b!1344609))
(check-sat b_and!50587 (not b_next!31375))
