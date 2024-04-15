; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113526 () Bool)

(assert start!113526)

(declare-fun b_free!31519 () Bool)

(declare-fun b_next!31519 () Bool)

(assert (=> start!113526 (= b_free!31519 (not b_next!31519))))

(declare-fun tp!110367 () Bool)

(declare-fun b_and!50809 () Bool)

(assert (=> start!113526 (= tp!110367 b_and!50809)))

(declare-fun b!1347433 () Bool)

(declare-fun res!894036 () Bool)

(declare-fun e!766664 () Bool)

(assert (=> b!1347433 (=> (not res!894036) (not e!766664))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91817 0))(
  ( (array!91818 (arr!44364 (Array (_ BitVec 32) (_ BitVec 64))) (size!44916 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91817)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347433 (= res!894036 (not (= (select (arr!44364 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1347434 () Bool)

(declare-fun res!894034 () Bool)

(assert (=> b!1347434 (=> (not res!894034) (not e!766664))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91817 (_ BitVec 32)) Bool)

(assert (=> b!1347434 (= res!894034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57989 () Bool)

(declare-fun mapRes!57989 () Bool)

(declare-fun tp!110366 () Bool)

(declare-fun e!766660 () Bool)

(assert (=> mapNonEmpty!57989 (= mapRes!57989 (and tp!110366 e!766660))))

(declare-fun mapKey!57989 () (_ BitVec 32))

(declare-datatypes ((V!55129 0))(
  ( (V!55130 (val!18834 Int)) )
))
(declare-datatypes ((ValueCell!17861 0))(
  ( (ValueCellFull!17861 (v!21484 V!55129)) (EmptyCell!17861) )
))
(declare-fun mapRest!57989 () (Array (_ BitVec 32) ValueCell!17861))

(declare-fun mapValue!57989 () ValueCell!17861)

(declare-datatypes ((array!91819 0))(
  ( (array!91820 (arr!44365 (Array (_ BitVec 32) ValueCell!17861)) (size!44917 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91819)

(assert (=> mapNonEmpty!57989 (= (arr!44365 _values!1303) (store mapRest!57989 mapKey!57989 mapValue!57989))))

(declare-fun mapIsEmpty!57989 () Bool)

(assert (=> mapIsEmpty!57989 mapRes!57989))

(declare-fun b!1347435 () Bool)

(declare-fun res!894032 () Bool)

(assert (=> b!1347435 (=> (not res!894032) (not e!766664))))

(declare-datatypes ((List!31486 0))(
  ( (Nil!31483) (Cons!31482 (h!32691 (_ BitVec 64)) (t!46076 List!31486)) )
))
(declare-fun arrayNoDuplicates!0 (array!91817 (_ BitVec 32) List!31486) Bool)

(assert (=> b!1347435 (= res!894032 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31483))))

(declare-fun b!1347436 () Bool)

(declare-fun res!894031 () Bool)

(assert (=> b!1347436 (=> (not res!894031) (not e!766664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347436 (= res!894031 (validKeyInArray!0 (select (arr!44364 _keys!1571) from!1960)))))

(declare-fun b!1347437 () Bool)

(declare-fun tp_is_empty!37519 () Bool)

(assert (=> b!1347437 (= e!766660 tp_is_empty!37519)))

(declare-fun res!894033 () Bool)

(assert (=> start!113526 (=> (not res!894033) (not e!766664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113526 (= res!894033 (validMask!0 mask!1977))))

(assert (=> start!113526 e!766664))

(assert (=> start!113526 tp_is_empty!37519))

(assert (=> start!113526 true))

(declare-fun array_inv!33619 (array!91817) Bool)

(assert (=> start!113526 (array_inv!33619 _keys!1571)))

(declare-fun e!766661 () Bool)

(declare-fun array_inv!33620 (array!91819) Bool)

(assert (=> start!113526 (and (array_inv!33620 _values!1303) e!766661)))

(assert (=> start!113526 tp!110367))

(declare-fun b!1347438 () Bool)

(assert (=> b!1347438 (= e!766664 false)))

(declare-fun minValue!1245 () V!55129)

(declare-fun zeroValue!1245 () V!55129)

(declare-fun lt!595636 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24352 0))(
  ( (tuple2!24353 (_1!12187 (_ BitVec 64)) (_2!12187 V!55129)) )
))
(declare-datatypes ((List!31487 0))(
  ( (Nil!31484) (Cons!31483 (h!32692 tuple2!24352) (t!46077 List!31487)) )
))
(declare-datatypes ((ListLongMap!22009 0))(
  ( (ListLongMap!22010 (toList!11020 List!31487)) )
))
(declare-fun contains!9125 (ListLongMap!22009 (_ BitVec 64)) Bool)

(declare-fun +!4867 (ListLongMap!22009 tuple2!24352) ListLongMap!22009)

(declare-fun getCurrentListMapNoExtraKeys!6515 (array!91817 array!91819 (_ BitVec 32) (_ BitVec 32) V!55129 V!55129 (_ BitVec 32) Int) ListLongMap!22009)

(declare-fun get!22416 (ValueCell!17861 V!55129) V!55129)

(declare-fun dynLambda!3797 (Int (_ BitVec 64)) V!55129)

(assert (=> b!1347438 (= lt!595636 (contains!9125 (+!4867 (+!4867 (getCurrentListMapNoExtraKeys!6515 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24353 (select (arr!44364 _keys!1571) from!1960) (get!22416 (select (arr!44365 _values!1303) from!1960) (dynLambda!3797 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24353 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142))))

(declare-fun b!1347439 () Bool)

(declare-fun res!894038 () Bool)

(assert (=> b!1347439 (=> (not res!894038) (not e!766664))))

(assert (=> b!1347439 (= res!894038 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44916 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347440 () Bool)

(declare-fun e!766662 () Bool)

(assert (=> b!1347440 (= e!766661 (and e!766662 mapRes!57989))))

(declare-fun condMapEmpty!57989 () Bool)

(declare-fun mapDefault!57989 () ValueCell!17861)

(assert (=> b!1347440 (= condMapEmpty!57989 (= (arr!44365 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17861)) mapDefault!57989)))))

(declare-fun b!1347441 () Bool)

(declare-fun res!894037 () Bool)

(assert (=> b!1347441 (=> (not res!894037) (not e!766664))))

(assert (=> b!1347441 (= res!894037 (and (= (size!44917 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44916 _keys!1571) (size!44917 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347442 () Bool)

(declare-fun res!894039 () Bool)

(assert (=> b!1347442 (=> (not res!894039) (not e!766664))))

(assert (=> b!1347442 (= res!894039 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347443 () Bool)

(declare-fun res!894035 () Bool)

(assert (=> b!1347443 (=> (not res!894035) (not e!766664))))

(declare-fun getCurrentListMap!5857 (array!91817 array!91819 (_ BitVec 32) (_ BitVec 32) V!55129 V!55129 (_ BitVec 32) Int) ListLongMap!22009)

(assert (=> b!1347443 (= res!894035 (contains!9125 (getCurrentListMap!5857 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347444 () Bool)

(assert (=> b!1347444 (= e!766662 tp_is_empty!37519)))

(assert (= (and start!113526 res!894033) b!1347441))

(assert (= (and b!1347441 res!894037) b!1347434))

(assert (= (and b!1347434 res!894034) b!1347435))

(assert (= (and b!1347435 res!894032) b!1347439))

(assert (= (and b!1347439 res!894038) b!1347443))

(assert (= (and b!1347443 res!894035) b!1347433))

(assert (= (and b!1347433 res!894036) b!1347436))

(assert (= (and b!1347436 res!894031) b!1347442))

(assert (= (and b!1347442 res!894039) b!1347438))

(assert (= (and b!1347440 condMapEmpty!57989) mapIsEmpty!57989))

(assert (= (and b!1347440 (not condMapEmpty!57989)) mapNonEmpty!57989))

(get-info :version)

(assert (= (and mapNonEmpty!57989 ((_ is ValueCellFull!17861) mapValue!57989)) b!1347437))

(assert (= (and b!1347440 ((_ is ValueCellFull!17861) mapDefault!57989)) b!1347444))

(assert (= start!113526 b!1347440))

(declare-fun b_lambda!24583 () Bool)

(assert (=> (not b_lambda!24583) (not b!1347438)))

(declare-fun t!46075 () Bool)

(declare-fun tb!12393 () Bool)

(assert (=> (and start!113526 (= defaultEntry!1306 defaultEntry!1306) t!46075) tb!12393))

(declare-fun result!25887 () Bool)

(assert (=> tb!12393 (= result!25887 tp_is_empty!37519)))

(assert (=> b!1347438 t!46075))

(declare-fun b_and!50811 () Bool)

(assert (= b_and!50809 (and (=> t!46075 result!25887) b_and!50811)))

(declare-fun m!1234067 () Bool)

(assert (=> b!1347433 m!1234067))

(assert (=> b!1347436 m!1234067))

(assert (=> b!1347436 m!1234067))

(declare-fun m!1234069 () Bool)

(assert (=> b!1347436 m!1234069))

(declare-fun m!1234071 () Bool)

(assert (=> mapNonEmpty!57989 m!1234071))

(declare-fun m!1234073 () Bool)

(assert (=> start!113526 m!1234073))

(declare-fun m!1234075 () Bool)

(assert (=> start!113526 m!1234075))

(declare-fun m!1234077 () Bool)

(assert (=> start!113526 m!1234077))

(declare-fun m!1234079 () Bool)

(assert (=> b!1347443 m!1234079))

(assert (=> b!1347443 m!1234079))

(declare-fun m!1234081 () Bool)

(assert (=> b!1347443 m!1234081))

(declare-fun m!1234083 () Bool)

(assert (=> b!1347435 m!1234083))

(declare-fun m!1234085 () Bool)

(assert (=> b!1347438 m!1234085))

(declare-fun m!1234087 () Bool)

(assert (=> b!1347438 m!1234087))

(declare-fun m!1234089 () Bool)

(assert (=> b!1347438 m!1234089))

(declare-fun m!1234091 () Bool)

(assert (=> b!1347438 m!1234091))

(declare-fun m!1234093 () Bool)

(assert (=> b!1347438 m!1234093))

(declare-fun m!1234095 () Bool)

(assert (=> b!1347438 m!1234095))

(assert (=> b!1347438 m!1234089))

(declare-fun m!1234097 () Bool)

(assert (=> b!1347438 m!1234097))

(assert (=> b!1347438 m!1234091))

(assert (=> b!1347438 m!1234093))

(assert (=> b!1347438 m!1234067))

(assert (=> b!1347438 m!1234097))

(assert (=> b!1347438 m!1234085))

(declare-fun m!1234099 () Bool)

(assert (=> b!1347434 m!1234099))

(check-sat (not b!1347438) b_and!50811 (not b!1347434) (not b!1347443) (not b!1347436) (not b_next!31519) (not b!1347435) (not b_lambda!24583) tp_is_empty!37519 (not start!113526) (not mapNonEmpty!57989))
(check-sat b_and!50811 (not b_next!31519))
