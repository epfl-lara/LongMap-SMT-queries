; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113534 () Bool)

(assert start!113534)

(declare-fun b_free!31527 () Bool)

(declare-fun b_next!31527 () Bool)

(assert (=> start!113534 (= b_free!31527 (not b_next!31527))))

(declare-fun tp!110389 () Bool)

(declare-fun b_and!50843 () Bool)

(assert (=> start!113534 (= tp!110389 b_and!50843)))

(declare-fun b!1347655 () Bool)

(declare-fun e!766756 () Bool)

(declare-fun e!766755 () Bool)

(declare-fun mapRes!58001 () Bool)

(assert (=> b!1347655 (= e!766756 (and e!766755 mapRes!58001))))

(declare-fun condMapEmpty!58001 () Bool)

(declare-datatypes ((V!55139 0))(
  ( (V!55140 (val!18838 Int)) )
))
(declare-datatypes ((ValueCell!17865 0))(
  ( (ValueCellFull!17865 (v!21489 V!55139)) (EmptyCell!17865) )
))
(declare-datatypes ((array!91888 0))(
  ( (array!91889 (arr!44399 (Array (_ BitVec 32) ValueCell!17865)) (size!44949 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91888)

(declare-fun mapDefault!58001 () ValueCell!17865)

(assert (=> b!1347655 (= condMapEmpty!58001 (= (arr!44399 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17865)) mapDefault!58001)))))

(declare-fun b!1347656 () Bool)

(declare-fun res!894168 () Bool)

(declare-fun e!766753 () Bool)

(assert (=> b!1347656 (=> (not res!894168) (not e!766753))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91890 0))(
  ( (array!91891 (arr!44400 (Array (_ BitVec 32) (_ BitVec 64))) (size!44950 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91890)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1347656 (= res!894168 (and (= (size!44949 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44950 _keys!1571) (size!44949 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58001 () Bool)

(declare-fun tp!110390 () Bool)

(declare-fun e!766757 () Bool)

(assert (=> mapNonEmpty!58001 (= mapRes!58001 (and tp!110390 e!766757))))

(declare-fun mapRest!58001 () (Array (_ BitVec 32) ValueCell!17865))

(declare-fun mapKey!58001 () (_ BitVec 32))

(declare-fun mapValue!58001 () ValueCell!17865)

(assert (=> mapNonEmpty!58001 (= (arr!44399 _values!1303) (store mapRest!58001 mapKey!58001 mapValue!58001))))

(declare-fun b!1347657 () Bool)

(declare-fun res!894171 () Bool)

(assert (=> b!1347657 (=> (not res!894171) (not e!766753))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347657 (= res!894171 (not (= (select (arr!44400 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1347658 () Bool)

(declare-fun tp_is_empty!37527 () Bool)

(assert (=> b!1347658 (= e!766757 tp_is_empty!37527)))

(declare-fun b!1347659 () Bool)

(declare-fun res!894170 () Bool)

(assert (=> b!1347659 (=> (not res!894170) (not e!766753))))

(declare-datatypes ((List!31441 0))(
  ( (Nil!31438) (Cons!31437 (h!32646 (_ BitVec 64)) (t!46047 List!31441)) )
))
(declare-fun arrayNoDuplicates!0 (array!91890 (_ BitVec 32) List!31441) Bool)

(assert (=> b!1347659 (= res!894170 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31438))))

(declare-fun mapIsEmpty!58001 () Bool)

(assert (=> mapIsEmpty!58001 mapRes!58001))

(declare-fun b!1347660 () Bool)

(assert (=> b!1347660 (= e!766753 (not true))))

(declare-datatypes ((tuple2!24286 0))(
  ( (tuple2!24287 (_1!12154 (_ BitVec 64)) (_2!12154 V!55139)) )
))
(declare-datatypes ((List!31442 0))(
  ( (Nil!31439) (Cons!31438 (h!32647 tuple2!24286) (t!46048 List!31442)) )
))
(declare-datatypes ((ListLongMap!21943 0))(
  ( (ListLongMap!21944 (toList!10987 List!31442)) )
))
(declare-fun lt!595839 () ListLongMap!21943)

(declare-fun contains!9165 (ListLongMap!21943 (_ BitVec 64)) Bool)

(assert (=> b!1347660 (contains!9165 lt!595839 k0!1142)))

(declare-datatypes ((Unit!44158 0))(
  ( (Unit!44159) )
))
(declare-fun lt!595840 () Unit!44158)

(declare-fun zeroValue!1245 () V!55139)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!402 ((_ BitVec 64) (_ BitVec 64) V!55139 ListLongMap!21943) Unit!44158)

(assert (=> b!1347660 (= lt!595840 (lemmaInListMapAfterAddingDiffThenInBefore!402 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595839))))

(declare-fun minValue!1245 () V!55139)

(declare-fun defaultEntry!1306 () Int)

(declare-fun +!4841 (ListLongMap!21943 tuple2!24286) ListLongMap!21943)

(declare-fun getCurrentListMapNoExtraKeys!6487 (array!91890 array!91888 (_ BitVec 32) (_ BitVec 32) V!55139 V!55139 (_ BitVec 32) Int) ListLongMap!21943)

(declare-fun get!22425 (ValueCell!17865 V!55139) V!55139)

(declare-fun dynLambda!3780 (Int (_ BitVec 64)) V!55139)

(assert (=> b!1347660 (= lt!595839 (+!4841 (getCurrentListMapNoExtraKeys!6487 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24287 (select (arr!44400 _keys!1571) from!1960) (get!22425 (select (arr!44399 _values!1303) from!1960) (dynLambda!3780 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1347661 () Bool)

(declare-fun res!894173 () Bool)

(assert (=> b!1347661 (=> (not res!894173) (not e!766753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347661 (= res!894173 (validKeyInArray!0 (select (arr!44400 _keys!1571) from!1960)))))

(declare-fun b!1347662 () Bool)

(declare-fun res!894169 () Bool)

(assert (=> b!1347662 (=> (not res!894169) (not e!766753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91890 (_ BitVec 32)) Bool)

(assert (=> b!1347662 (= res!894169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347663 () Bool)

(declare-fun res!894176 () Bool)

(assert (=> b!1347663 (=> (not res!894176) (not e!766753))))

(assert (=> b!1347663 (= res!894176 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44950 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347664 () Bool)

(assert (=> b!1347664 (= e!766755 tp_is_empty!37527)))

(declare-fun b!1347665 () Bool)

(declare-fun res!894174 () Bool)

(assert (=> b!1347665 (=> (not res!894174) (not e!766753))))

(assert (=> b!1347665 (= res!894174 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347666 () Bool)

(declare-fun res!894175 () Bool)

(assert (=> b!1347666 (=> (not res!894175) (not e!766753))))

(declare-fun getCurrentListMap!5938 (array!91890 array!91888 (_ BitVec 32) (_ BitVec 32) V!55139 V!55139 (_ BitVec 32) Int) ListLongMap!21943)

(assert (=> b!1347666 (= res!894175 (contains!9165 (getCurrentListMap!5938 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!894172 () Bool)

(assert (=> start!113534 (=> (not res!894172) (not e!766753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113534 (= res!894172 (validMask!0 mask!1977))))

(assert (=> start!113534 e!766753))

(assert (=> start!113534 tp_is_empty!37527))

(assert (=> start!113534 true))

(declare-fun array_inv!33451 (array!91890) Bool)

(assert (=> start!113534 (array_inv!33451 _keys!1571)))

(declare-fun array_inv!33452 (array!91888) Bool)

(assert (=> start!113534 (and (array_inv!33452 _values!1303) e!766756)))

(assert (=> start!113534 tp!110389))

(assert (= (and start!113534 res!894172) b!1347656))

(assert (= (and b!1347656 res!894168) b!1347662))

(assert (= (and b!1347662 res!894169) b!1347659))

(assert (= (and b!1347659 res!894170) b!1347663))

(assert (= (and b!1347663 res!894176) b!1347666))

(assert (= (and b!1347666 res!894175) b!1347657))

(assert (= (and b!1347657 res!894171) b!1347661))

(assert (= (and b!1347661 res!894173) b!1347665))

(assert (= (and b!1347665 res!894174) b!1347660))

(assert (= (and b!1347655 condMapEmpty!58001) mapIsEmpty!58001))

(assert (= (and b!1347655 (not condMapEmpty!58001)) mapNonEmpty!58001))

(get-info :version)

(assert (= (and mapNonEmpty!58001 ((_ is ValueCellFull!17865) mapValue!58001)) b!1347658))

(assert (= (and b!1347655 ((_ is ValueCellFull!17865) mapDefault!58001)) b!1347664))

(assert (= start!113534 b!1347655))

(declare-fun b_lambda!24601 () Bool)

(assert (=> (not b_lambda!24601) (not b!1347660)))

(declare-fun t!46046 () Bool)

(declare-fun tb!12409 () Bool)

(assert (=> (and start!113534 (= defaultEntry!1306 defaultEntry!1306) t!46046) tb!12409))

(declare-fun result!25911 () Bool)

(assert (=> tb!12409 (= result!25911 tp_is_empty!37527)))

(assert (=> b!1347660 t!46046))

(declare-fun b_and!50845 () Bool)

(assert (= b_and!50843 (and (=> t!46046 result!25911) b_and!50845)))

(declare-fun m!1234719 () Bool)

(assert (=> b!1347659 m!1234719))

(declare-fun m!1234721 () Bool)

(assert (=> b!1347666 m!1234721))

(assert (=> b!1347666 m!1234721))

(declare-fun m!1234723 () Bool)

(assert (=> b!1347666 m!1234723))

(declare-fun m!1234725 () Bool)

(assert (=> b!1347662 m!1234725))

(declare-fun m!1234727 () Bool)

(assert (=> start!113534 m!1234727))

(declare-fun m!1234729 () Bool)

(assert (=> start!113534 m!1234729))

(declare-fun m!1234731 () Bool)

(assert (=> start!113534 m!1234731))

(declare-fun m!1234733 () Bool)

(assert (=> b!1347660 m!1234733))

(declare-fun m!1234735 () Bool)

(assert (=> b!1347660 m!1234735))

(declare-fun m!1234737 () Bool)

(assert (=> b!1347660 m!1234737))

(declare-fun m!1234739 () Bool)

(assert (=> b!1347660 m!1234739))

(assert (=> b!1347660 m!1234733))

(declare-fun m!1234741 () Bool)

(assert (=> b!1347660 m!1234741))

(assert (=> b!1347660 m!1234735))

(assert (=> b!1347660 m!1234737))

(declare-fun m!1234743 () Bool)

(assert (=> b!1347660 m!1234743))

(declare-fun m!1234745 () Bool)

(assert (=> b!1347660 m!1234745))

(declare-fun m!1234747 () Bool)

(assert (=> b!1347660 m!1234747))

(assert (=> b!1347661 m!1234745))

(assert (=> b!1347661 m!1234745))

(declare-fun m!1234749 () Bool)

(assert (=> b!1347661 m!1234749))

(declare-fun m!1234751 () Bool)

(assert (=> mapNonEmpty!58001 m!1234751))

(assert (=> b!1347657 m!1234745))

(check-sat (not b!1347659) (not b!1347660) tp_is_empty!37527 (not start!113534) (not b!1347666) (not mapNonEmpty!58001) b_and!50845 (not b!1347662) (not b_next!31527) (not b!1347661) (not b_lambda!24601))
(check-sat b_and!50845 (not b_next!31527))
