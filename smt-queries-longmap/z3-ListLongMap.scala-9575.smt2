; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113314 () Bool)

(assert start!113314)

(declare-fun b_free!31365 () Bool)

(declare-fun b_next!31365 () Bool)

(assert (=> start!113314 (= b_free!31365 (not b_next!31365))))

(declare-fun tp!109900 () Bool)

(declare-fun b_and!50587 () Bool)

(assert (=> start!113314 (= tp!109900 b_and!50587)))

(declare-fun b!1344486 () Bool)

(declare-fun e!765214 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344486 (= e!765214 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-fun b!1344487 () Bool)

(declare-fun res!892033 () Bool)

(assert (=> b!1344487 (=> (not res!892033) (not e!765214))))

(declare-datatypes ((array!91570 0))(
  ( (array!91571 (arr!44241 (Array (_ BitVec 32) (_ BitVec 64))) (size!44791 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91570)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91570 (_ BitVec 32)) Bool)

(assert (=> b!1344487 (= res!892033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344488 () Bool)

(declare-fun res!892031 () Bool)

(assert (=> b!1344488 (=> (not res!892031) (not e!765214))))

(declare-datatypes ((List!31327 0))(
  ( (Nil!31324) (Cons!31323 (h!32532 (_ BitVec 64)) (t!45851 List!31327)) )
))
(declare-fun arrayNoDuplicates!0 (array!91570 (_ BitVec 32) List!31327) Bool)

(assert (=> b!1344488 (= res!892031 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31324))))

(declare-fun b!1344489 () Bool)

(declare-fun e!765218 () Bool)

(declare-fun tp_is_empty!37365 () Bool)

(assert (=> b!1344489 (= e!765218 tp_is_empty!37365)))

(declare-fun b!1344490 () Bool)

(declare-fun res!892035 () Bool)

(assert (=> b!1344490 (=> (not res!892035) (not e!765214))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1344490 (= res!892035 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44791 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!892036 () Bool)

(assert (=> start!113314 (=> (not res!892036) (not e!765214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113314 (= res!892036 (validMask!0 mask!1977))))

(assert (=> start!113314 e!765214))

(assert (=> start!113314 tp_is_empty!37365))

(assert (=> start!113314 true))

(declare-fun array_inv!33341 (array!91570) Bool)

(assert (=> start!113314 (array_inv!33341 _keys!1571)))

(declare-datatypes ((V!54923 0))(
  ( (V!54924 (val!18757 Int)) )
))
(declare-datatypes ((ValueCell!17784 0))(
  ( (ValueCellFull!17784 (v!21405 V!54923)) (EmptyCell!17784) )
))
(declare-datatypes ((array!91572 0))(
  ( (array!91573 (arr!44242 (Array (_ BitVec 32) ValueCell!17784)) (size!44792 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91572)

(declare-fun e!765215 () Bool)

(declare-fun array_inv!33342 (array!91572) Bool)

(assert (=> start!113314 (and (array_inv!33342 _values!1303) e!765215)))

(assert (=> start!113314 tp!109900))

(declare-fun b!1344491 () Bool)

(declare-fun res!892034 () Bool)

(assert (=> b!1344491 (=> (not res!892034) (not e!765214))))

(assert (=> b!1344491 (= res!892034 (not (= (select (arr!44241 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1344492 () Bool)

(declare-fun res!892037 () Bool)

(assert (=> b!1344492 (=> (not res!892037) (not e!765214))))

(assert (=> b!1344492 (= res!892037 (and (= (size!44792 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44791 _keys!1571) (size!44792 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344493 () Bool)

(declare-fun mapRes!57754 () Bool)

(assert (=> b!1344493 (= e!765215 (and e!765218 mapRes!57754))))

(declare-fun condMapEmpty!57754 () Bool)

(declare-fun mapDefault!57754 () ValueCell!17784)

(assert (=> b!1344493 (= condMapEmpty!57754 (= (arr!44242 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17784)) mapDefault!57754)))))

(declare-fun mapIsEmpty!57754 () Bool)

(assert (=> mapIsEmpty!57754 mapRes!57754))

(declare-fun b!1344494 () Bool)

(declare-fun res!892032 () Bool)

(assert (=> b!1344494 (=> (not res!892032) (not e!765214))))

(declare-fun minValue!1245 () V!54923)

(declare-fun zeroValue!1245 () V!54923)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24172 0))(
  ( (tuple2!24173 (_1!12097 (_ BitVec 64)) (_2!12097 V!54923)) )
))
(declare-datatypes ((List!31328 0))(
  ( (Nil!31325) (Cons!31324 (h!32533 tuple2!24172) (t!45852 List!31328)) )
))
(declare-datatypes ((ListLongMap!21829 0))(
  ( (ListLongMap!21830 (toList!10930 List!31328)) )
))
(declare-fun contains!9106 (ListLongMap!21829 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5886 (array!91570 array!91572 (_ BitVec 32) (_ BitVec 32) V!54923 V!54923 (_ BitVec 32) Int) ListLongMap!21829)

(assert (=> b!1344494 (= res!892032 (contains!9106 (getCurrentListMap!5886 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344495 () Bool)

(declare-fun res!892038 () Bool)

(assert (=> b!1344495 (=> (not res!892038) (not e!765214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344495 (= res!892038 (validKeyInArray!0 (select (arr!44241 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!57754 () Bool)

(declare-fun tp!109899 () Bool)

(declare-fun e!765216 () Bool)

(assert (=> mapNonEmpty!57754 (= mapRes!57754 (and tp!109899 e!765216))))

(declare-fun mapRest!57754 () (Array (_ BitVec 32) ValueCell!17784))

(declare-fun mapKey!57754 () (_ BitVec 32))

(declare-fun mapValue!57754 () ValueCell!17784)

(assert (=> mapNonEmpty!57754 (= (arr!44242 _values!1303) (store mapRest!57754 mapKey!57754 mapValue!57754))))

(declare-fun b!1344496 () Bool)

(assert (=> b!1344496 (= e!765216 tp_is_empty!37365)))

(assert (= (and start!113314 res!892036) b!1344492))

(assert (= (and b!1344492 res!892037) b!1344487))

(assert (= (and b!1344487 res!892033) b!1344488))

(assert (= (and b!1344488 res!892031) b!1344490))

(assert (= (and b!1344490 res!892035) b!1344494))

(assert (= (and b!1344494 res!892032) b!1344491))

(assert (= (and b!1344491 res!892034) b!1344495))

(assert (= (and b!1344495 res!892038) b!1344486))

(assert (= (and b!1344493 condMapEmpty!57754) mapIsEmpty!57754))

(assert (= (and b!1344493 (not condMapEmpty!57754)) mapNonEmpty!57754))

(get-info :version)

(assert (= (and mapNonEmpty!57754 ((_ is ValueCellFull!17784) mapValue!57754)) b!1344496))

(assert (= (and b!1344493 ((_ is ValueCellFull!17784) mapDefault!57754)) b!1344489))

(assert (= start!113314 b!1344493))

(declare-fun m!1232067 () Bool)

(assert (=> b!1344491 m!1232067))

(declare-fun m!1232069 () Bool)

(assert (=> b!1344488 m!1232069))

(declare-fun m!1232071 () Bool)

(assert (=> b!1344487 m!1232071))

(declare-fun m!1232073 () Bool)

(assert (=> mapNonEmpty!57754 m!1232073))

(declare-fun m!1232075 () Bool)

(assert (=> b!1344494 m!1232075))

(assert (=> b!1344494 m!1232075))

(declare-fun m!1232077 () Bool)

(assert (=> b!1344494 m!1232077))

(declare-fun m!1232079 () Bool)

(assert (=> start!113314 m!1232079))

(declare-fun m!1232081 () Bool)

(assert (=> start!113314 m!1232081))

(declare-fun m!1232083 () Bool)

(assert (=> start!113314 m!1232083))

(assert (=> b!1344495 m!1232067))

(assert (=> b!1344495 m!1232067))

(declare-fun m!1232085 () Bool)

(assert (=> b!1344495 m!1232085))

(check-sat (not b_next!31365) (not start!113314) b_and!50587 (not mapNonEmpty!57754) (not b!1344487) tp_is_empty!37365 (not b!1344494) (not b!1344488) (not b!1344495))
(check-sat b_and!50587 (not b_next!31365))
