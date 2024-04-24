; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111646 () Bool)

(assert start!111646)

(declare-fun b_free!30079 () Bool)

(declare-fun b_next!30079 () Bool)

(assert (=> start!111646 (= b_free!30079 (not b_next!30079))))

(declare-fun tp!105712 () Bool)

(declare-fun b_and!48319 () Bool)

(assert (=> start!111646 (= tp!105712 b_and!48319)))

(declare-fun mapIsEmpty!55496 () Bool)

(declare-fun mapRes!55496 () Bool)

(assert (=> mapIsEmpty!55496 mapRes!55496))

(declare-fun b!1319899 () Bool)

(declare-fun res!875647 () Bool)

(declare-fun e!753273 () Bool)

(assert (=> b!1319899 (=> (not res!875647) (not e!753273))))

(declare-datatypes ((array!88815 0))(
  ( (array!88816 (arr!42877 (Array (_ BitVec 32) (_ BitVec 64))) (size!43428 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88815)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52969 0))(
  ( (V!52970 (val!18024 Int)) )
))
(declare-fun zeroValue!1279 () V!52969)

(declare-datatypes ((ValueCell!17051 0))(
  ( (ValueCellFull!17051 (v!20649 V!52969)) (EmptyCell!17051) )
))
(declare-datatypes ((array!88817 0))(
  ( (array!88818 (arr!42878 (Array (_ BitVec 32) ValueCell!17051)) (size!43429 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88817)

(declare-fun minValue!1279 () V!52969)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-datatypes ((tuple2!23224 0))(
  ( (tuple2!23225 (_1!11623 (_ BitVec 64)) (_2!11623 V!52969)) )
))
(declare-datatypes ((List!30389 0))(
  ( (Nil!30386) (Cons!30385 (h!31603 tuple2!23224) (t!44009 List!30389)) )
))
(declare-datatypes ((ListLongMap!20889 0))(
  ( (ListLongMap!20890 (toList!10460 List!30389)) )
))
(declare-fun contains!8627 (ListLongMap!20889 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5464 (array!88815 array!88817 (_ BitVec 32) (_ BitVec 32) V!52969 V!52969 (_ BitVec 32) Int) ListLongMap!20889)

(assert (=> b!1319899 (= res!875647 (contains!8627 (getCurrentListMap!5464 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun res!875650 () Bool)

(assert (=> start!111646 (=> (not res!875650) (not e!753273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111646 (= res!875650 (validMask!0 mask!2019))))

(assert (=> start!111646 e!753273))

(declare-fun array_inv!32645 (array!88815) Bool)

(assert (=> start!111646 (array_inv!32645 _keys!1609)))

(assert (=> start!111646 true))

(declare-fun tp_is_empty!35899 () Bool)

(assert (=> start!111646 tp_is_empty!35899))

(declare-fun e!753276 () Bool)

(declare-fun array_inv!32646 (array!88817) Bool)

(assert (=> start!111646 (and (array_inv!32646 _values!1337) e!753276)))

(assert (=> start!111646 tp!105712))

(declare-fun b!1319900 () Bool)

(declare-fun e!753277 () Bool)

(assert (=> b!1319900 (= e!753277 tp_is_empty!35899)))

(declare-fun b!1319901 () Bool)

(declare-fun res!875645 () Bool)

(assert (=> b!1319901 (=> (not res!875645) (not e!753273))))

(assert (=> b!1319901 (= res!875645 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43428 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319902 () Bool)

(declare-fun res!875644 () Bool)

(assert (=> b!1319902 (=> (not res!875644) (not e!753273))))

(declare-datatypes ((List!30390 0))(
  ( (Nil!30387) (Cons!30386 (h!31604 (_ BitVec 64)) (t!44010 List!30390)) )
))
(declare-fun arrayNoDuplicates!0 (array!88815 (_ BitVec 32) List!30390) Bool)

(assert (=> b!1319902 (= res!875644 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30387))))

(declare-fun b!1319903 () Bool)

(assert (=> b!1319903 (= e!753273 (not true))))

(declare-fun lt!586973 () ListLongMap!20889)

(assert (=> b!1319903 (contains!8627 lt!586973 k0!1164)))

(declare-datatypes ((Unit!43387 0))(
  ( (Unit!43388) )
))
(declare-fun lt!586972 () Unit!43387)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!105 ((_ BitVec 64) (_ BitVec 64) V!52969 ListLongMap!20889) Unit!43387)

(assert (=> b!1319903 (= lt!586972 (lemmaInListMapAfterAddingDiffThenInBefore!105 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586973))))

(declare-fun +!4550 (ListLongMap!20889 tuple2!23224) ListLongMap!20889)

(declare-fun getCurrentListMapNoExtraKeys!6189 (array!88815 array!88817 (_ BitVec 32) (_ BitVec 32) V!52969 V!52969 (_ BitVec 32) Int) ListLongMap!20889)

(declare-fun get!21571 (ValueCell!17051 V!52969) V!52969)

(declare-fun dynLambda!3504 (Int (_ BitVec 64)) V!52969)

(assert (=> b!1319903 (= lt!586973 (+!4550 (+!4550 (getCurrentListMapNoExtraKeys!6189 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23225 (select (arr!42877 _keys!1609) from!2000) (get!21571 (select (arr!42878 _values!1337) from!2000) (dynLambda!3504 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23225 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1319904 () Bool)

(declare-fun res!875643 () Bool)

(assert (=> b!1319904 (=> (not res!875643) (not e!753273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319904 (= res!875643 (validKeyInArray!0 (select (arr!42877 _keys!1609) from!2000)))))

(declare-fun b!1319905 () Bool)

(declare-fun res!875649 () Bool)

(assert (=> b!1319905 (=> (not res!875649) (not e!753273))))

(assert (=> b!1319905 (= res!875649 (not (= (select (arr!42877 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!55496 () Bool)

(declare-fun tp!105713 () Bool)

(declare-fun e!753275 () Bool)

(assert (=> mapNonEmpty!55496 (= mapRes!55496 (and tp!105713 e!753275))))

(declare-fun mapRest!55496 () (Array (_ BitVec 32) ValueCell!17051))

(declare-fun mapKey!55496 () (_ BitVec 32))

(declare-fun mapValue!55496 () ValueCell!17051)

(assert (=> mapNonEmpty!55496 (= (arr!42878 _values!1337) (store mapRest!55496 mapKey!55496 mapValue!55496))))

(declare-fun b!1319906 () Bool)

(declare-fun res!875648 () Bool)

(assert (=> b!1319906 (=> (not res!875648) (not e!753273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88815 (_ BitVec 32)) Bool)

(assert (=> b!1319906 (= res!875648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319907 () Bool)

(declare-fun res!875646 () Bool)

(assert (=> b!1319907 (=> (not res!875646) (not e!753273))))

(assert (=> b!1319907 (= res!875646 (and (= (size!43429 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43428 _keys!1609) (size!43429 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319908 () Bool)

(assert (=> b!1319908 (= e!753276 (and e!753277 mapRes!55496))))

(declare-fun condMapEmpty!55496 () Bool)

(declare-fun mapDefault!55496 () ValueCell!17051)

(assert (=> b!1319908 (= condMapEmpty!55496 (= (arr!42878 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17051)) mapDefault!55496)))))

(declare-fun b!1319909 () Bool)

(assert (=> b!1319909 (= e!753275 tp_is_empty!35899)))

(assert (= (and start!111646 res!875650) b!1319907))

(assert (= (and b!1319907 res!875646) b!1319906))

(assert (= (and b!1319906 res!875648) b!1319902))

(assert (= (and b!1319902 res!875644) b!1319901))

(assert (= (and b!1319901 res!875645) b!1319899))

(assert (= (and b!1319899 res!875647) b!1319905))

(assert (= (and b!1319905 res!875649) b!1319904))

(assert (= (and b!1319904 res!875643) b!1319903))

(assert (= (and b!1319908 condMapEmpty!55496) mapIsEmpty!55496))

(assert (= (and b!1319908 (not condMapEmpty!55496)) mapNonEmpty!55496))

(get-info :version)

(assert (= (and mapNonEmpty!55496 ((_ is ValueCellFull!17051) mapValue!55496)) b!1319909))

(assert (= (and b!1319908 ((_ is ValueCellFull!17051) mapDefault!55496)) b!1319900))

(assert (= start!111646 b!1319908))

(declare-fun b_lambda!23399 () Bool)

(assert (=> (not b_lambda!23399) (not b!1319903)))

(declare-fun t!44008 () Bool)

(declare-fun tb!11423 () Bool)

(assert (=> (and start!111646 (= defaultEntry!1340 defaultEntry!1340) t!44008) tb!11423))

(declare-fun result!23909 () Bool)

(assert (=> tb!11423 (= result!23909 tp_is_empty!35899)))

(assert (=> b!1319903 t!44008))

(declare-fun b_and!48321 () Bool)

(assert (= b_and!48319 (and (=> t!44008 result!23909) b_and!48321)))

(declare-fun m!1207769 () Bool)

(assert (=> start!111646 m!1207769))

(declare-fun m!1207771 () Bool)

(assert (=> start!111646 m!1207771))

(declare-fun m!1207773 () Bool)

(assert (=> start!111646 m!1207773))

(declare-fun m!1207775 () Bool)

(assert (=> mapNonEmpty!55496 m!1207775))

(declare-fun m!1207777 () Bool)

(assert (=> b!1319899 m!1207777))

(assert (=> b!1319899 m!1207777))

(declare-fun m!1207779 () Bool)

(assert (=> b!1319899 m!1207779))

(declare-fun m!1207781 () Bool)

(assert (=> b!1319902 m!1207781))

(declare-fun m!1207783 () Bool)

(assert (=> b!1319903 m!1207783))

(declare-fun m!1207785 () Bool)

(assert (=> b!1319903 m!1207785))

(declare-fun m!1207787 () Bool)

(assert (=> b!1319903 m!1207787))

(assert (=> b!1319903 m!1207783))

(declare-fun m!1207789 () Bool)

(assert (=> b!1319903 m!1207789))

(declare-fun m!1207791 () Bool)

(assert (=> b!1319903 m!1207791))

(assert (=> b!1319903 m!1207789))

(declare-fun m!1207793 () Bool)

(assert (=> b!1319903 m!1207793))

(declare-fun m!1207795 () Bool)

(assert (=> b!1319903 m!1207795))

(assert (=> b!1319903 m!1207791))

(assert (=> b!1319903 m!1207787))

(declare-fun m!1207797 () Bool)

(assert (=> b!1319903 m!1207797))

(declare-fun m!1207799 () Bool)

(assert (=> b!1319903 m!1207799))

(assert (=> b!1319905 m!1207799))

(declare-fun m!1207801 () Bool)

(assert (=> b!1319906 m!1207801))

(assert (=> b!1319904 m!1207799))

(assert (=> b!1319904 m!1207799))

(declare-fun m!1207803 () Bool)

(assert (=> b!1319904 m!1207803))

(check-sat (not b!1319904) (not b!1319902) (not b!1319903) tp_is_empty!35899 b_and!48321 (not b_next!30079) (not b!1319899) (not start!111646) (not b_lambda!23399) (not b!1319906) (not mapNonEmpty!55496))
(check-sat b_and!48321 (not b_next!30079))
