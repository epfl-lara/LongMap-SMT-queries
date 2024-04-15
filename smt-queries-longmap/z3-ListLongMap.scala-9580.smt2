; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113342 () Bool)

(assert start!113342)

(declare-fun b_free!31393 () Bool)

(declare-fun b_next!31393 () Bool)

(assert (=> start!113342 (= b_free!31393 (not b_next!31393))))

(declare-fun tp!109984 () Bool)

(declare-fun b_and!50621 () Bool)

(assert (=> start!113342 (= tp!109984 b_and!50621)))

(declare-fun b!1344980 () Bool)

(declare-fun e!765413 () Bool)

(declare-fun e!765411 () Bool)

(declare-fun mapRes!57796 () Bool)

(assert (=> b!1344980 (= e!765413 (and e!765411 mapRes!57796))))

(declare-fun condMapEmpty!57796 () Bool)

(declare-datatypes ((V!54961 0))(
  ( (V!54962 (val!18771 Int)) )
))
(declare-datatypes ((ValueCell!17798 0))(
  ( (ValueCellFull!17798 (v!21418 V!54961)) (EmptyCell!17798) )
))
(declare-datatypes ((array!91569 0))(
  ( (array!91570 (arr!44241 (Array (_ BitVec 32) ValueCell!17798)) (size!44793 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91569)

(declare-fun mapDefault!57796 () ValueCell!17798)

(assert (=> b!1344980 (= condMapEmpty!57796 (= (arr!44241 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17798)) mapDefault!57796)))))

(declare-fun b!1344981 () Bool)

(declare-fun res!892419 () Bool)

(declare-fun e!765414 () Bool)

(assert (=> b!1344981 (=> (not res!892419) (not e!765414))))

(declare-datatypes ((array!91571 0))(
  ( (array!91572 (arr!44242 (Array (_ BitVec 32) (_ BitVec 64))) (size!44794 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91571)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91571 (_ BitVec 32)) Bool)

(assert (=> b!1344981 (= res!892419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344982 () Bool)

(declare-fun res!892424 () Bool)

(assert (=> b!1344982 (=> (not res!892424) (not e!765414))))

(declare-fun minValue!1245 () V!54961)

(declare-fun zeroValue!1245 () V!54961)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24254 0))(
  ( (tuple2!24255 (_1!12138 (_ BitVec 64)) (_2!12138 V!54961)) )
))
(declare-datatypes ((List!31393 0))(
  ( (Nil!31390) (Cons!31389 (h!32598 tuple2!24254) (t!45935 List!31393)) )
))
(declare-datatypes ((ListLongMap!21911 0))(
  ( (ListLongMap!21912 (toList!10971 List!31393)) )
))
(declare-fun contains!9076 (ListLongMap!21911 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5815 (array!91571 array!91569 (_ BitVec 32) (_ BitVec 32) V!54961 V!54961 (_ BitVec 32) Int) ListLongMap!21911)

(assert (=> b!1344982 (= res!892424 (contains!9076 (getCurrentListMap!5815 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57796 () Bool)

(declare-fun tp!109985 () Bool)

(declare-fun e!765412 () Bool)

(assert (=> mapNonEmpty!57796 (= mapRes!57796 (and tp!109985 e!765412))))

(declare-fun mapValue!57796 () ValueCell!17798)

(declare-fun mapRest!57796 () (Array (_ BitVec 32) ValueCell!17798))

(declare-fun mapKey!57796 () (_ BitVec 32))

(assert (=> mapNonEmpty!57796 (= (arr!44241 _values!1303) (store mapRest!57796 mapKey!57796 mapValue!57796))))

(declare-fun b!1344983 () Bool)

(declare-fun e!765416 () Bool)

(assert (=> b!1344983 (= e!765414 e!765416)))

(declare-fun res!892426 () Bool)

(assert (=> b!1344983 (=> (not res!892426) (not e!765416))))

(declare-fun lt!595085 () ListLongMap!21911)

(declare-fun lt!595084 () V!54961)

(declare-fun +!4850 (ListLongMap!21911 tuple2!24254) ListLongMap!21911)

(assert (=> b!1344983 (= res!892426 (contains!9076 (+!4850 lt!595085 (tuple2!24255 (select (arr!44242 _keys!1571) from!1960) lt!595084)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6493 (array!91571 array!91569 (_ BitVec 32) (_ BitVec 32) V!54961 V!54961 (_ BitVec 32) Int) ListLongMap!21911)

(assert (=> b!1344983 (= lt!595085 (getCurrentListMapNoExtraKeys!6493 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22354 (ValueCell!17798 V!54961) V!54961)

(declare-fun dynLambda!3780 (Int (_ BitVec 64)) V!54961)

(assert (=> b!1344983 (= lt!595084 (get!22354 (select (arr!44241 _values!1303) from!1960) (dynLambda!3780 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1344984 () Bool)

(declare-fun res!892418 () Bool)

(assert (=> b!1344984 (=> (not res!892418) (not e!765414))))

(assert (=> b!1344984 (= res!892418 (and (= (size!44793 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44794 _keys!1571) (size!44793 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!892421 () Bool)

(assert (=> start!113342 (=> (not res!892421) (not e!765414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113342 (= res!892421 (validMask!0 mask!1977))))

(assert (=> start!113342 e!765414))

(declare-fun tp_is_empty!37393 () Bool)

(assert (=> start!113342 tp_is_empty!37393))

(assert (=> start!113342 true))

(declare-fun array_inv!33533 (array!91571) Bool)

(assert (=> start!113342 (array_inv!33533 _keys!1571)))

(declare-fun array_inv!33534 (array!91569) Bool)

(assert (=> start!113342 (and (array_inv!33534 _values!1303) e!765413)))

(assert (=> start!113342 tp!109984))

(declare-fun b!1344985 () Bool)

(assert (=> b!1344985 (= e!765411 tp_is_empty!37393)))

(declare-fun b!1344986 () Bool)

(declare-fun res!892422 () Bool)

(assert (=> b!1344986 (=> (not res!892422) (not e!765414))))

(assert (=> b!1344986 (= res!892422 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44794 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344987 () Bool)

(declare-fun res!892420 () Bool)

(assert (=> b!1344987 (=> (not res!892420) (not e!765414))))

(assert (=> b!1344987 (= res!892420 (not (= (select (arr!44242 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1344988 () Bool)

(declare-fun res!892417 () Bool)

(assert (=> b!1344988 (=> (not res!892417) (not e!765414))))

(declare-datatypes ((List!31394 0))(
  ( (Nil!31391) (Cons!31390 (h!32599 (_ BitVec 64)) (t!45936 List!31394)) )
))
(declare-fun arrayNoDuplicates!0 (array!91571 (_ BitVec 32) List!31394) Bool)

(assert (=> b!1344988 (= res!892417 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31391))))

(declare-fun mapIsEmpty!57796 () Bool)

(assert (=> mapIsEmpty!57796 mapRes!57796))

(declare-fun b!1344989 () Bool)

(declare-fun res!892425 () Bool)

(assert (=> b!1344989 (=> (not res!892425) (not e!765416))))

(assert (=> b!1344989 (= res!892425 (not (= k0!1142 (select (arr!44242 _keys!1571) from!1960))))))

(declare-fun b!1344990 () Bool)

(declare-fun res!892416 () Bool)

(assert (=> b!1344990 (=> (not res!892416) (not e!765414))))

(assert (=> b!1344990 (= res!892416 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1344991 () Bool)

(assert (=> b!1344991 (= e!765416 (not true))))

(assert (=> b!1344991 (contains!9076 lt!595085 k0!1142)))

(declare-datatypes ((Unit!43934 0))(
  ( (Unit!43935) )
))
(declare-fun lt!595086 () Unit!43934)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!385 ((_ BitVec 64) (_ BitVec 64) V!54961 ListLongMap!21911) Unit!43934)

(assert (=> b!1344991 (= lt!595086 (lemmaInListMapAfterAddingDiffThenInBefore!385 k0!1142 (select (arr!44242 _keys!1571) from!1960) lt!595084 lt!595085))))

(declare-fun b!1344992 () Bool)

(declare-fun res!892423 () Bool)

(assert (=> b!1344992 (=> (not res!892423) (not e!765414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344992 (= res!892423 (validKeyInArray!0 (select (arr!44242 _keys!1571) from!1960)))))

(declare-fun b!1344993 () Bool)

(assert (=> b!1344993 (= e!765412 tp_is_empty!37393)))

(assert (= (and start!113342 res!892421) b!1344984))

(assert (= (and b!1344984 res!892418) b!1344981))

(assert (= (and b!1344981 res!892419) b!1344988))

(assert (= (and b!1344988 res!892417) b!1344986))

(assert (= (and b!1344986 res!892422) b!1344982))

(assert (= (and b!1344982 res!892424) b!1344987))

(assert (= (and b!1344987 res!892420) b!1344992))

(assert (= (and b!1344992 res!892423) b!1344990))

(assert (= (and b!1344990 res!892416) b!1344983))

(assert (= (and b!1344983 res!892426) b!1344989))

(assert (= (and b!1344989 res!892425) b!1344991))

(assert (= (and b!1344980 condMapEmpty!57796) mapIsEmpty!57796))

(assert (= (and b!1344980 (not condMapEmpty!57796)) mapNonEmpty!57796))

(get-info :version)

(assert (= (and mapNonEmpty!57796 ((_ is ValueCellFull!17798) mapValue!57796)) b!1344993))

(assert (= (and b!1344980 ((_ is ValueCellFull!17798) mapDefault!57796)) b!1344985))

(assert (= start!113342 b!1344980))

(declare-fun b_lambda!24505 () Bool)

(assert (=> (not b_lambda!24505) (not b!1344983)))

(declare-fun t!45934 () Bool)

(declare-fun tb!12345 () Bool)

(assert (=> (and start!113342 (= defaultEntry!1306 defaultEntry!1306) t!45934) tb!12345))

(declare-fun result!25789 () Bool)

(assert (=> tb!12345 (= result!25789 tp_is_empty!37393)))

(assert (=> b!1344983 t!45934))

(declare-fun b_and!50623 () Bool)

(assert (= b_and!50621 (and (=> t!45934 result!25789) b_and!50623)))

(declare-fun m!1231999 () Bool)

(assert (=> b!1344992 m!1231999))

(assert (=> b!1344992 m!1231999))

(declare-fun m!1232001 () Bool)

(assert (=> b!1344992 m!1232001))

(declare-fun m!1232003 () Bool)

(assert (=> b!1344991 m!1232003))

(assert (=> b!1344991 m!1231999))

(assert (=> b!1344991 m!1231999))

(declare-fun m!1232005 () Bool)

(assert (=> b!1344991 m!1232005))

(assert (=> b!1344987 m!1231999))

(assert (=> b!1344989 m!1231999))

(declare-fun m!1232007 () Bool)

(assert (=> b!1344983 m!1232007))

(declare-fun m!1232009 () Bool)

(assert (=> b!1344983 m!1232009))

(declare-fun m!1232011 () Bool)

(assert (=> b!1344983 m!1232011))

(declare-fun m!1232013 () Bool)

(assert (=> b!1344983 m!1232013))

(assert (=> b!1344983 m!1232009))

(assert (=> b!1344983 m!1232011))

(declare-fun m!1232015 () Bool)

(assert (=> b!1344983 m!1232015))

(declare-fun m!1232017 () Bool)

(assert (=> b!1344983 m!1232017))

(assert (=> b!1344983 m!1231999))

(assert (=> b!1344983 m!1232015))

(declare-fun m!1232019 () Bool)

(assert (=> mapNonEmpty!57796 m!1232019))

(declare-fun m!1232021 () Bool)

(assert (=> b!1344982 m!1232021))

(assert (=> b!1344982 m!1232021))

(declare-fun m!1232023 () Bool)

(assert (=> b!1344982 m!1232023))

(declare-fun m!1232025 () Bool)

(assert (=> start!113342 m!1232025))

(declare-fun m!1232027 () Bool)

(assert (=> start!113342 m!1232027))

(declare-fun m!1232029 () Bool)

(assert (=> start!113342 m!1232029))

(declare-fun m!1232031 () Bool)

(assert (=> b!1344981 m!1232031))

(declare-fun m!1232033 () Bool)

(assert (=> b!1344988 m!1232033))

(check-sat (not b_lambda!24505) (not mapNonEmpty!57796) (not b!1344988) (not b!1344991) (not b!1344982) b_and!50623 (not b!1344981) (not start!113342) (not b!1344983) tp_is_empty!37393 (not b_next!31393) (not b!1344992))
(check-sat b_and!50623 (not b_next!31393))
