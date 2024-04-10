; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112244 () Bool)

(assert start!112244)

(declare-fun b_free!30639 () Bool)

(declare-fun b_next!30639 () Bool)

(assert (=> start!112244 (= b_free!30639 (not b_next!30639))))

(declare-fun tp!107553 () Bool)

(declare-fun b_and!49333 () Bool)

(assert (=> start!112244 (= tp!107553 b_and!49333)))

(declare-fun res!882289 () Bool)

(declare-fun e!757992 () Bool)

(assert (=> start!112244 (=> (not res!882289) (not e!757992))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112244 (= res!882289 (validMask!0 mask!1998))))

(assert (=> start!112244 e!757992))

(declare-datatypes ((V!53835 0))(
  ( (V!53836 (val!18349 Int)) )
))
(declare-datatypes ((ValueCell!17376 0))(
  ( (ValueCellFull!17376 (v!20986 V!53835)) (EmptyCell!17376) )
))
(declare-datatypes ((array!89990 0))(
  ( (array!89991 (arr!43461 (Array (_ BitVec 32) ValueCell!17376)) (size!44011 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89990)

(declare-fun e!757993 () Bool)

(declare-fun array_inv!32793 (array!89990) Bool)

(assert (=> start!112244 (and (array_inv!32793 _values!1320) e!757993)))

(assert (=> start!112244 true))

(declare-datatypes ((array!89992 0))(
  ( (array!89993 (arr!43462 (Array (_ BitVec 32) (_ BitVec 64))) (size!44012 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89992)

(declare-fun array_inv!32794 (array!89992) Bool)

(assert (=> start!112244 (array_inv!32794 _keys!1590)))

(assert (=> start!112244 tp!107553))

(declare-fun tp_is_empty!36549 () Bool)

(assert (=> start!112244 tp_is_empty!36549))

(declare-fun b!1329703 () Bool)

(declare-fun e!757994 () Bool)

(declare-fun mapRes!56497 () Bool)

(assert (=> b!1329703 (= e!757993 (and e!757994 mapRes!56497))))

(declare-fun condMapEmpty!56497 () Bool)

(declare-fun mapDefault!56497 () ValueCell!17376)

(assert (=> b!1329703 (= condMapEmpty!56497 (= (arr!43461 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17376)) mapDefault!56497)))))

(declare-fun mapNonEmpty!56497 () Bool)

(declare-fun tp!107554 () Bool)

(declare-fun e!757995 () Bool)

(assert (=> mapNonEmpty!56497 (= mapRes!56497 (and tp!107554 e!757995))))

(declare-fun mapKey!56497 () (_ BitVec 32))

(declare-fun mapValue!56497 () ValueCell!17376)

(declare-fun mapRest!56497 () (Array (_ BitVec 32) ValueCell!17376))

(assert (=> mapNonEmpty!56497 (= (arr!43461 _values!1320) (store mapRest!56497 mapKey!56497 mapValue!56497))))

(declare-fun b!1329704 () Bool)

(assert (=> b!1329704 (= e!757994 tp_is_empty!36549)))

(declare-fun b!1329705 () Bool)

(assert (=> b!1329705 (= e!757992 (not true))))

(declare-datatypes ((tuple2!23626 0))(
  ( (tuple2!23627 (_1!11824 (_ BitVec 64)) (_2!11824 V!53835)) )
))
(declare-datatypes ((List!30777 0))(
  ( (Nil!30774) (Cons!30773 (h!31982 tuple2!23626) (t!44829 List!30777)) )
))
(declare-datatypes ((ListLongMap!21283 0))(
  ( (ListLongMap!21284 (toList!10657 List!30777)) )
))
(declare-fun lt!590998 () ListLongMap!21283)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8821 (ListLongMap!21283 (_ BitVec 64)) Bool)

(assert (=> b!1329705 (contains!8821 lt!590998 k0!1153)))

(declare-datatypes ((Unit!43761 0))(
  ( (Unit!43762) )
))
(declare-fun lt!590997 () Unit!43761)

(declare-fun minValue!1262 () V!53835)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!243 ((_ BitVec 64) (_ BitVec 64) V!53835 ListLongMap!21283) Unit!43761)

(assert (=> b!1329705 (= lt!590997 (lemmaInListMapAfterAddingDiffThenInBefore!243 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!590998))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53835)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4656 (ListLongMap!21283 tuple2!23626) ListLongMap!21283)

(declare-fun getCurrentListMapNoExtraKeys!6294 (array!89992 array!89990 (_ BitVec 32) (_ BitVec 32) V!53835 V!53835 (_ BitVec 32) Int) ListLongMap!21283)

(declare-fun get!21898 (ValueCell!17376 V!53835) V!53835)

(declare-fun dynLambda!3595 (Int (_ BitVec 64)) V!53835)

(assert (=> b!1329705 (= lt!590998 (+!4656 (getCurrentListMapNoExtraKeys!6294 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23627 (select (arr!43462 _keys!1590) from!1980) (get!21898 (select (arr!43461 _values!1320) from!1980) (dynLambda!3595 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329706 () Bool)

(declare-fun res!882291 () Bool)

(assert (=> b!1329706 (=> (not res!882291) (not e!757992))))

(assert (=> b!1329706 (= res!882291 (not (= (select (arr!43462 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1329707 () Bool)

(declare-fun res!882283 () Bool)

(assert (=> b!1329707 (=> (not res!882283) (not e!757992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89992 (_ BitVec 32)) Bool)

(assert (=> b!1329707 (= res!882283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329708 () Bool)

(declare-fun res!882290 () Bool)

(assert (=> b!1329708 (=> (not res!882290) (not e!757992))))

(assert (=> b!1329708 (= res!882290 (and (= (size!44011 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44012 _keys!1590) (size!44011 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329709 () Bool)

(assert (=> b!1329709 (= e!757995 tp_is_empty!36549)))

(declare-fun b!1329710 () Bool)

(declare-fun res!882286 () Bool)

(assert (=> b!1329710 (=> (not res!882286) (not e!757992))))

(declare-fun getCurrentListMap!5646 (array!89992 array!89990 (_ BitVec 32) (_ BitVec 32) V!53835 V!53835 (_ BitVec 32) Int) ListLongMap!21283)

(assert (=> b!1329710 (= res!882286 (contains!8821 (getCurrentListMap!5646 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1329711 () Bool)

(declare-fun res!882284 () Bool)

(assert (=> b!1329711 (=> (not res!882284) (not e!757992))))

(declare-datatypes ((List!30778 0))(
  ( (Nil!30775) (Cons!30774 (h!31983 (_ BitVec 64)) (t!44830 List!30778)) )
))
(declare-fun arrayNoDuplicates!0 (array!89992 (_ BitVec 32) List!30778) Bool)

(assert (=> b!1329711 (= res!882284 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30775))))

(declare-fun b!1329712 () Bool)

(declare-fun res!882285 () Bool)

(assert (=> b!1329712 (=> (not res!882285) (not e!757992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329712 (= res!882285 (validKeyInArray!0 (select (arr!43462 _keys!1590) from!1980)))))

(declare-fun b!1329713 () Bool)

(declare-fun res!882287 () Bool)

(assert (=> b!1329713 (=> (not res!882287) (not e!757992))))

(assert (=> b!1329713 (= res!882287 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329714 () Bool)

(declare-fun res!882288 () Bool)

(assert (=> b!1329714 (=> (not res!882288) (not e!757992))))

(assert (=> b!1329714 (= res!882288 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44012 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56497 () Bool)

(assert (=> mapIsEmpty!56497 mapRes!56497))

(assert (= (and start!112244 res!882289) b!1329708))

(assert (= (and b!1329708 res!882290) b!1329707))

(assert (= (and b!1329707 res!882283) b!1329711))

(assert (= (and b!1329711 res!882284) b!1329714))

(assert (= (and b!1329714 res!882288) b!1329710))

(assert (= (and b!1329710 res!882286) b!1329706))

(assert (= (and b!1329706 res!882291) b!1329712))

(assert (= (and b!1329712 res!882285) b!1329713))

(assert (= (and b!1329713 res!882287) b!1329705))

(assert (= (and b!1329703 condMapEmpty!56497) mapIsEmpty!56497))

(assert (= (and b!1329703 (not condMapEmpty!56497)) mapNonEmpty!56497))

(get-info :version)

(assert (= (and mapNonEmpty!56497 ((_ is ValueCellFull!17376) mapValue!56497)) b!1329709))

(assert (= (and b!1329703 ((_ is ValueCellFull!17376) mapDefault!56497)) b!1329704))

(assert (= start!112244 b!1329703))

(declare-fun b_lambda!23899 () Bool)

(assert (=> (not b_lambda!23899) (not b!1329705)))

(declare-fun t!44828 () Bool)

(declare-fun tb!11855 () Bool)

(assert (=> (and start!112244 (= defaultEntry!1323 defaultEntry!1323) t!44828) tb!11855))

(declare-fun result!24781 () Bool)

(assert (=> tb!11855 (= result!24781 tp_is_empty!36549)))

(assert (=> b!1329705 t!44828))

(declare-fun b_and!49335 () Bool)

(assert (= b_and!49333 (and (=> t!44828 result!24781) b_and!49335)))

(declare-fun m!1218433 () Bool)

(assert (=> b!1329707 m!1218433))

(declare-fun m!1218435 () Bool)

(assert (=> mapNonEmpty!56497 m!1218435))

(declare-fun m!1218437 () Bool)

(assert (=> b!1329711 m!1218437))

(declare-fun m!1218439 () Bool)

(assert (=> start!112244 m!1218439))

(declare-fun m!1218441 () Bool)

(assert (=> start!112244 m!1218441))

(declare-fun m!1218443 () Bool)

(assert (=> start!112244 m!1218443))

(declare-fun m!1218445 () Bool)

(assert (=> b!1329712 m!1218445))

(assert (=> b!1329712 m!1218445))

(declare-fun m!1218447 () Bool)

(assert (=> b!1329712 m!1218447))

(declare-fun m!1218449 () Bool)

(assert (=> b!1329710 m!1218449))

(assert (=> b!1329710 m!1218449))

(declare-fun m!1218451 () Bool)

(assert (=> b!1329710 m!1218451))

(declare-fun m!1218453 () Bool)

(assert (=> b!1329705 m!1218453))

(declare-fun m!1218455 () Bool)

(assert (=> b!1329705 m!1218455))

(declare-fun m!1218457 () Bool)

(assert (=> b!1329705 m!1218457))

(declare-fun m!1218459 () Bool)

(assert (=> b!1329705 m!1218459))

(assert (=> b!1329705 m!1218453))

(declare-fun m!1218461 () Bool)

(assert (=> b!1329705 m!1218461))

(declare-fun m!1218463 () Bool)

(assert (=> b!1329705 m!1218463))

(declare-fun m!1218465 () Bool)

(assert (=> b!1329705 m!1218465))

(assert (=> b!1329705 m!1218455))

(assert (=> b!1329705 m!1218459))

(assert (=> b!1329705 m!1218445))

(assert (=> b!1329706 m!1218445))

(check-sat (not b!1329707) (not b!1329711) (not mapNonEmpty!56497) (not b_lambda!23899) (not b_next!30639) b_and!49335 (not b!1329710) (not b!1329705) (not start!112244) tp_is_empty!36549 (not b!1329712))
(check-sat b_and!49335 (not b_next!30639))
