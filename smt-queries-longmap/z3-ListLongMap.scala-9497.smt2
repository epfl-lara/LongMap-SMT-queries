; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112592 () Bool)

(assert start!112592)

(declare-fun b_free!30987 () Bool)

(declare-fun b_next!30987 () Bool)

(assert (=> start!112592 (= b_free!30987 (not b_next!30987))))

(declare-fun tp!108597 () Bool)

(declare-fun b_and!49897 () Bool)

(assert (=> start!112592 (= tp!108597 b_and!49897)))

(declare-fun b!1335679 () Bool)

(declare-fun res!886483 () Bool)

(declare-fun e!760686 () Bool)

(assert (=> b!1335679 (=> (not res!886483) (not e!760686))))

(declare-datatypes ((array!90652 0))(
  ( (array!90653 (arr!43792 (Array (_ BitVec 32) (_ BitVec 64))) (size!44342 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90652)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335679 (= res!886483 (validKeyInArray!0 (select (arr!43792 _keys!1590) from!1980)))))

(declare-fun b!1335680 () Bool)

(declare-fun res!886481 () Bool)

(assert (=> b!1335680 (=> (not res!886481) (not e!760686))))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335680 (= res!886481 (not (= (select (arr!43792 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335681 () Bool)

(declare-fun e!760685 () Bool)

(declare-fun tp_is_empty!36897 () Bool)

(assert (=> b!1335681 (= e!760685 tp_is_empty!36897)))

(declare-fun b!1335682 () Bool)

(declare-fun res!886477 () Bool)

(assert (=> b!1335682 (=> (not res!886477) (not e!760686))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1335682 (= res!886477 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1335683 () Bool)

(declare-fun e!760684 () Bool)

(declare-fun mapRes!57019 () Bool)

(assert (=> b!1335683 (= e!760684 (and e!760685 mapRes!57019))))

(declare-fun condMapEmpty!57019 () Bool)

(declare-datatypes ((V!54299 0))(
  ( (V!54300 (val!18523 Int)) )
))
(declare-datatypes ((ValueCell!17550 0))(
  ( (ValueCellFull!17550 (v!21160 V!54299)) (EmptyCell!17550) )
))
(declare-datatypes ((array!90654 0))(
  ( (array!90655 (arr!43793 (Array (_ BitVec 32) ValueCell!17550)) (size!44343 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90654)

(declare-fun mapDefault!57019 () ValueCell!17550)

(assert (=> b!1335683 (= condMapEmpty!57019 (= (arr!43793 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17550)) mapDefault!57019)))))

(declare-fun b!1335684 () Bool)

(declare-fun res!886484 () Bool)

(assert (=> b!1335684 (=> (not res!886484) (not e!760686))))

(assert (=> b!1335684 (= res!886484 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44342 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335685 () Bool)

(declare-fun res!886479 () Bool)

(assert (=> b!1335685 (=> (not res!886479) (not e!760686))))

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1335685 (= res!886479 (and (= (size!44343 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44342 _keys!1590) (size!44343 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335686 () Bool)

(declare-fun e!760687 () Bool)

(assert (=> b!1335686 (= e!760687 tp_is_empty!36897)))

(declare-fun b!1335687 () Bool)

(declare-fun res!886482 () Bool)

(assert (=> b!1335687 (=> (not res!886482) (not e!760686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90652 (_ BitVec 32)) Bool)

(assert (=> b!1335687 (= res!886482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun b!1335688 () Bool)

(declare-fun minValue!1262 () V!54299)

(declare-fun zeroValue!1262 () V!54299)

(declare-datatypes ((tuple2!23886 0))(
  ( (tuple2!23887 (_1!11954 (_ BitVec 64)) (_2!11954 V!54299)) )
))
(declare-datatypes ((List!31028 0))(
  ( (Nil!31025) (Cons!31024 (h!32233 tuple2!23886) (t!45296 List!31028)) )
))
(declare-datatypes ((ListLongMap!21543 0))(
  ( (ListLongMap!21544 (toList!10787 List!31028)) )
))
(declare-fun contains!8950 (ListLongMap!21543 (_ BitVec 64)) Bool)

(declare-fun +!4730 (ListLongMap!21543 tuple2!23886) ListLongMap!21543)

(declare-fun getCurrentListMapNoExtraKeys!6372 (array!90652 array!90654 (_ BitVec 32) (_ BitVec 32) V!54299 V!54299 (_ BitVec 32) Int) ListLongMap!21543)

(declare-fun get!22088 (ValueCell!17550 V!54299) V!54299)

(declare-fun dynLambda!3669 (Int (_ BitVec 64)) V!54299)

(assert (=> b!1335688 (= e!760686 (not (contains!8950 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))))

(declare-fun b!1335689 () Bool)

(declare-fun res!886478 () Bool)

(assert (=> b!1335689 (=> (not res!886478) (not e!760686))))

(declare-datatypes ((List!31029 0))(
  ( (Nil!31026) (Cons!31025 (h!32234 (_ BitVec 64)) (t!45297 List!31029)) )
))
(declare-fun arrayNoDuplicates!0 (array!90652 (_ BitVec 32) List!31029) Bool)

(assert (=> b!1335689 (= res!886478 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31026))))

(declare-fun mapIsEmpty!57019 () Bool)

(assert (=> mapIsEmpty!57019 mapRes!57019))

(declare-fun b!1335690 () Bool)

(declare-fun res!886485 () Bool)

(assert (=> b!1335690 (=> (not res!886485) (not e!760686))))

(declare-fun getCurrentListMap!5760 (array!90652 array!90654 (_ BitVec 32) (_ BitVec 32) V!54299 V!54299 (_ BitVec 32) Int) ListLongMap!21543)

(assert (=> b!1335690 (= res!886485 (contains!8950 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!57019 () Bool)

(declare-fun tp!108598 () Bool)

(assert (=> mapNonEmpty!57019 (= mapRes!57019 (and tp!108598 e!760687))))

(declare-fun mapValue!57019 () ValueCell!17550)

(declare-fun mapKey!57019 () (_ BitVec 32))

(declare-fun mapRest!57019 () (Array (_ BitVec 32) ValueCell!17550))

(assert (=> mapNonEmpty!57019 (= (arr!43793 _values!1320) (store mapRest!57019 mapKey!57019 mapValue!57019))))

(declare-fun res!886480 () Bool)

(assert (=> start!112592 (=> (not res!886480) (not e!760686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112592 (= res!886480 (validMask!0 mask!1998))))

(assert (=> start!112592 e!760686))

(declare-fun array_inv!33023 (array!90654) Bool)

(assert (=> start!112592 (and (array_inv!33023 _values!1320) e!760684)))

(assert (=> start!112592 true))

(declare-fun array_inv!33024 (array!90652) Bool)

(assert (=> start!112592 (array_inv!33024 _keys!1590)))

(assert (=> start!112592 tp!108597))

(assert (=> start!112592 tp_is_empty!36897))

(assert (= (and start!112592 res!886480) b!1335685))

(assert (= (and b!1335685 res!886479) b!1335687))

(assert (= (and b!1335687 res!886482) b!1335689))

(assert (= (and b!1335689 res!886478) b!1335684))

(assert (= (and b!1335684 res!886484) b!1335690))

(assert (= (and b!1335690 res!886485) b!1335680))

(assert (= (and b!1335680 res!886481) b!1335679))

(assert (= (and b!1335679 res!886483) b!1335682))

(assert (= (and b!1335682 res!886477) b!1335688))

(assert (= (and b!1335683 condMapEmpty!57019) mapIsEmpty!57019))

(assert (= (and b!1335683 (not condMapEmpty!57019)) mapNonEmpty!57019))

(get-info :version)

(assert (= (and mapNonEmpty!57019 ((_ is ValueCellFull!17550) mapValue!57019)) b!1335686))

(assert (= (and b!1335683 ((_ is ValueCellFull!17550) mapDefault!57019)) b!1335681))

(assert (= start!112592 b!1335683))

(declare-fun b_lambda!24115 () Bool)

(assert (=> (not b_lambda!24115) (not b!1335688)))

(declare-fun t!45295 () Bool)

(declare-fun tb!12071 () Bool)

(assert (=> (and start!112592 (= defaultEntry!1323 defaultEntry!1323) t!45295) tb!12071))

(declare-fun result!25213 () Bool)

(assert (=> tb!12071 (= result!25213 tp_is_empty!36897)))

(assert (=> b!1335688 t!45295))

(declare-fun b_and!49899 () Bool)

(assert (= b_and!49897 (and (=> t!45295 result!25213) b_and!49899)))

(declare-fun m!1223653 () Bool)

(assert (=> b!1335679 m!1223653))

(assert (=> b!1335679 m!1223653))

(declare-fun m!1223655 () Bool)

(assert (=> b!1335679 m!1223655))

(assert (=> b!1335680 m!1223653))

(declare-fun m!1223657 () Bool)

(assert (=> b!1335687 m!1223657))

(declare-fun m!1223659 () Bool)

(assert (=> start!112592 m!1223659))

(declare-fun m!1223661 () Bool)

(assert (=> start!112592 m!1223661))

(declare-fun m!1223663 () Bool)

(assert (=> start!112592 m!1223663))

(declare-fun m!1223665 () Bool)

(assert (=> b!1335688 m!1223665))

(declare-fun m!1223667 () Bool)

(assert (=> b!1335688 m!1223667))

(declare-fun m!1223669 () Bool)

(assert (=> b!1335688 m!1223669))

(declare-fun m!1223671 () Bool)

(assert (=> b!1335688 m!1223671))

(declare-fun m!1223673 () Bool)

(assert (=> b!1335688 m!1223673))

(assert (=> b!1335688 m!1223667))

(declare-fun m!1223675 () Bool)

(assert (=> b!1335688 m!1223675))

(assert (=> b!1335688 m!1223665))

(assert (=> b!1335688 m!1223669))

(assert (=> b!1335688 m!1223653))

(assert (=> b!1335688 m!1223671))

(assert (=> b!1335688 m!1223675))

(declare-fun m!1223677 () Bool)

(assert (=> b!1335688 m!1223677))

(declare-fun m!1223679 () Bool)

(assert (=> b!1335690 m!1223679))

(assert (=> b!1335690 m!1223679))

(declare-fun m!1223681 () Bool)

(assert (=> b!1335690 m!1223681))

(declare-fun m!1223683 () Bool)

(assert (=> b!1335689 m!1223683))

(declare-fun m!1223685 () Bool)

(assert (=> mapNonEmpty!57019 m!1223685))

(check-sat (not b_lambda!24115) (not mapNonEmpty!57019) tp_is_empty!36897 (not b!1335679) (not b!1335690) (not b!1335688) (not b!1335687) b_and!49899 (not b!1335689) (not start!112592) (not b_next!30987))
(check-sat b_and!49899 (not b_next!30987))
(get-model)

(declare-fun b_lambda!24119 () Bool)

(assert (= b_lambda!24115 (or (and start!112592 b_free!30987) b_lambda!24119)))

(check-sat (not mapNonEmpty!57019) tp_is_empty!36897 (not b!1335679) (not b!1335690) (not b!1335687) b_and!49899 (not b!1335689) (not start!112592) (not b_next!30987) (not b_lambda!24119) (not b!1335688))
(check-sat b_and!49899 (not b_next!30987))
(get-model)

(declare-fun d!143521 () Bool)

(declare-fun e!760705 () Bool)

(assert (=> d!143521 e!760705))

(declare-fun res!886517 () Bool)

(assert (=> d!143521 (=> (not res!886517) (not e!760705))))

(declare-fun lt!592482 () ListLongMap!21543)

(assert (=> d!143521 (= res!886517 (contains!8950 lt!592482 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!592480 () List!31028)

(assert (=> d!143521 (= lt!592482 (ListLongMap!21544 lt!592480))))

(declare-datatypes ((Unit!43903 0))(
  ( (Unit!43904) )
))
(declare-fun lt!592483 () Unit!43903)

(declare-fun lt!592481 () Unit!43903)

(assert (=> d!143521 (= lt!592483 lt!592481)))

(declare-datatypes ((Option!767 0))(
  ( (Some!766 (v!21162 V!54299)) (None!765) )
))
(declare-fun getValueByKey!715 (List!31028 (_ BitVec 64)) Option!767)

(assert (=> d!143521 (= (getValueByKey!715 lt!592480 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!766 (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!360 (List!31028 (_ BitVec 64) V!54299) Unit!43903)

(assert (=> d!143521 (= lt!592481 (lemmaContainsTupThenGetReturnValue!360 lt!592480 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!489 (List!31028 (_ BitVec 64) V!54299) List!31028)

(assert (=> d!143521 (= lt!592480 (insertStrictlySorted!489 (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143521 (= (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!592482)))

(declare-fun b!1335735 () Bool)

(declare-fun res!886518 () Bool)

(assert (=> b!1335735 (=> (not res!886518) (not e!760705))))

(assert (=> b!1335735 (= res!886518 (= (getValueByKey!715 (toList!10787 lt!592482) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!766 (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1335736 () Bool)

(declare-fun contains!8952 (List!31028 tuple2!23886) Bool)

(assert (=> b!1335736 (= e!760705 (contains!8952 (toList!10787 lt!592482) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143521 res!886517) b!1335735))

(assert (= (and b!1335735 res!886518) b!1335736))

(declare-fun m!1223721 () Bool)

(assert (=> d!143521 m!1223721))

(declare-fun m!1223723 () Bool)

(assert (=> d!143521 m!1223723))

(declare-fun m!1223725 () Bool)

(assert (=> d!143521 m!1223725))

(declare-fun m!1223727 () Bool)

(assert (=> d!143521 m!1223727))

(declare-fun m!1223729 () Bool)

(assert (=> b!1335735 m!1223729))

(declare-fun m!1223731 () Bool)

(assert (=> b!1335736 m!1223731))

(assert (=> b!1335688 d!143521))

(declare-fun d!143523 () Bool)

(declare-fun e!760706 () Bool)

(assert (=> d!143523 e!760706))

(declare-fun res!886519 () Bool)

(assert (=> d!143523 (=> (not res!886519) (not e!760706))))

(declare-fun lt!592486 () ListLongMap!21543)

(assert (=> d!143523 (= res!886519 (contains!8950 lt!592486 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!592484 () List!31028)

(assert (=> d!143523 (= lt!592486 (ListLongMap!21544 lt!592484))))

(declare-fun lt!592487 () Unit!43903)

(declare-fun lt!592485 () Unit!43903)

(assert (=> d!143523 (= lt!592487 lt!592485)))

(assert (=> d!143523 (= (getValueByKey!715 lt!592484 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!766 (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143523 (= lt!592485 (lemmaContainsTupThenGetReturnValue!360 lt!592484 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143523 (= lt!592484 (insertStrictlySorted!489 (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143523 (= (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!592486)))

(declare-fun b!1335737 () Bool)

(declare-fun res!886520 () Bool)

(assert (=> b!1335737 (=> (not res!886520) (not e!760706))))

(assert (=> b!1335737 (= res!886520 (= (getValueByKey!715 (toList!10787 lt!592486) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!766 (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1335738 () Bool)

(assert (=> b!1335738 (= e!760706 (contains!8952 (toList!10787 lt!592486) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143523 res!886519) b!1335737))

(assert (= (and b!1335737 res!886520) b!1335738))

(declare-fun m!1223733 () Bool)

(assert (=> d!143523 m!1223733))

(declare-fun m!1223735 () Bool)

(assert (=> d!143523 m!1223735))

(declare-fun m!1223737 () Bool)

(assert (=> d!143523 m!1223737))

(declare-fun m!1223739 () Bool)

(assert (=> d!143523 m!1223739))

(declare-fun m!1223741 () Bool)

(assert (=> b!1335737 m!1223741))

(declare-fun m!1223743 () Bool)

(assert (=> b!1335738 m!1223743))

(assert (=> b!1335688 d!143523))

(declare-fun b!1335763 () Bool)

(declare-fun e!760725 () Bool)

(declare-fun e!760723 () Bool)

(assert (=> b!1335763 (= e!760725 e!760723)))

(assert (=> b!1335763 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44342 _keys!1590)))))

(declare-fun res!886530 () Bool)

(declare-fun lt!592507 () ListLongMap!21543)

(assert (=> b!1335763 (= res!886530 (contains!8950 lt!592507 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1335763 (=> (not res!886530) (not e!760723))))

(declare-fun b!1335764 () Bool)

(declare-fun res!886531 () Bool)

(declare-fun e!760727 () Bool)

(assert (=> b!1335764 (=> (not res!886531) (not e!760727))))

(assert (=> b!1335764 (= res!886531 (not (contains!8950 lt!592507 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335765 () Bool)

(assert (=> b!1335765 (= e!760727 e!760725)))

(declare-fun c!125910 () Bool)

(declare-fun e!760721 () Bool)

(assert (=> b!1335765 (= c!125910 e!760721)))

(declare-fun res!886532 () Bool)

(assert (=> b!1335765 (=> (not res!886532) (not e!760721))))

(assert (=> b!1335765 (= res!886532 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44342 _keys!1590)))))

(declare-fun b!1335766 () Bool)

(declare-fun e!760726 () Bool)

(assert (=> b!1335766 (= e!760726 (= lt!592507 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1335767 () Bool)

(declare-fun e!760722 () ListLongMap!21543)

(declare-fun e!760724 () ListLongMap!21543)

(assert (=> b!1335767 (= e!760722 e!760724)))

(declare-fun c!125913 () Bool)

(assert (=> b!1335767 (= c!125913 (validKeyInArray!0 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1335768 () Bool)

(declare-fun lt!592502 () Unit!43903)

(declare-fun lt!592503 () Unit!43903)

(assert (=> b!1335768 (= lt!592502 lt!592503)))

(declare-fun lt!592505 () (_ BitVec 64))

(declare-fun lt!592508 () ListLongMap!21543)

(declare-fun lt!592504 () V!54299)

(declare-fun lt!592506 () (_ BitVec 64))

(assert (=> b!1335768 (not (contains!8950 (+!4730 lt!592508 (tuple2!23887 lt!592505 lt!592504)) lt!592506))))

(declare-fun addStillNotContains!496 (ListLongMap!21543 (_ BitVec 64) V!54299 (_ BitVec 64)) Unit!43903)

(assert (=> b!1335768 (= lt!592503 (addStillNotContains!496 lt!592508 lt!592505 lt!592504 lt!592506))))

(assert (=> b!1335768 (= lt!592506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1335768 (= lt!592504 (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1335768 (= lt!592505 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun call!64825 () ListLongMap!21543)

(assert (=> b!1335768 (= lt!592508 call!64825)))

(assert (=> b!1335768 (= e!760724 (+!4730 call!64825 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1335769 () Bool)

(declare-fun isEmpty!1081 (ListLongMap!21543) Bool)

(assert (=> b!1335769 (= e!760726 (isEmpty!1081 lt!592507))))

(declare-fun b!1335770 () Bool)

(assert (=> b!1335770 (= e!760725 e!760726)))

(declare-fun c!125911 () Bool)

(assert (=> b!1335770 (= c!125911 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44342 _keys!1590)))))

(declare-fun bm!64822 () Bool)

(assert (=> bm!64822 (= call!64825 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1335771 () Bool)

(assert (=> b!1335771 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44342 _keys!1590)))))

(assert (=> b!1335771 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44343 _values!1320)))))

(declare-fun apply!1032 (ListLongMap!21543 (_ BitVec 64)) V!54299)

(assert (=> b!1335771 (= e!760723 (= (apply!1032 lt!592507 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335772 () Bool)

(assert (=> b!1335772 (= e!760724 call!64825)))

(declare-fun d!143525 () Bool)

(assert (=> d!143525 e!760727))

(declare-fun res!886529 () Bool)

(assert (=> d!143525 (=> (not res!886529) (not e!760727))))

(assert (=> d!143525 (= res!886529 (not (contains!8950 lt!592507 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143525 (= lt!592507 e!760722)))

(declare-fun c!125912 () Bool)

(assert (=> d!143525 (= c!125912 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44342 _keys!1590)))))

(assert (=> d!143525 (validMask!0 mask!1998)))

(assert (=> d!143525 (= (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!592507)))

(declare-fun b!1335773 () Bool)

(assert (=> b!1335773 (= e!760721 (validKeyInArray!0 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1335773 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1335774 () Bool)

(assert (=> b!1335774 (= e!760722 (ListLongMap!21544 Nil!31025))))

(assert (= (and d!143525 c!125912) b!1335774))

(assert (= (and d!143525 (not c!125912)) b!1335767))

(assert (= (and b!1335767 c!125913) b!1335768))

(assert (= (and b!1335767 (not c!125913)) b!1335772))

(assert (= (or b!1335768 b!1335772) bm!64822))

(assert (= (and d!143525 res!886529) b!1335764))

(assert (= (and b!1335764 res!886531) b!1335765))

(assert (= (and b!1335765 res!886532) b!1335773))

(assert (= (and b!1335765 c!125910) b!1335763))

(assert (= (and b!1335765 (not c!125910)) b!1335770))

(assert (= (and b!1335763 res!886530) b!1335771))

(assert (= (and b!1335770 c!125911) b!1335766))

(assert (= (and b!1335770 (not c!125911)) b!1335769))

(declare-fun b_lambda!24121 () Bool)

(assert (=> (not b_lambda!24121) (not b!1335768)))

(assert (=> b!1335768 t!45295))

(declare-fun b_and!49905 () Bool)

(assert (= b_and!49899 (and (=> t!45295 result!25213) b_and!49905)))

(declare-fun b_lambda!24123 () Bool)

(assert (=> (not b_lambda!24123) (not b!1335771)))

(assert (=> b!1335771 t!45295))

(declare-fun b_and!49907 () Bool)

(assert (= b_and!49905 (and (=> t!45295 result!25213) b_and!49907)))

(declare-fun m!1223745 () Bool)

(assert (=> bm!64822 m!1223745))

(declare-fun m!1223747 () Bool)

(assert (=> b!1335771 m!1223747))

(assert (=> b!1335771 m!1223747))

(declare-fun m!1223749 () Bool)

(assert (=> b!1335771 m!1223749))

(declare-fun m!1223751 () Bool)

(assert (=> b!1335771 m!1223751))

(assert (=> b!1335771 m!1223751))

(assert (=> b!1335771 m!1223671))

(declare-fun m!1223753 () Bool)

(assert (=> b!1335771 m!1223753))

(assert (=> b!1335771 m!1223671))

(declare-fun m!1223755 () Bool)

(assert (=> d!143525 m!1223755))

(assert (=> d!143525 m!1223659))

(declare-fun m!1223757 () Bool)

(assert (=> b!1335764 m!1223757))

(declare-fun m!1223759 () Bool)

(assert (=> b!1335769 m!1223759))

(assert (=> b!1335763 m!1223747))

(assert (=> b!1335763 m!1223747))

(declare-fun m!1223761 () Bool)

(assert (=> b!1335763 m!1223761))

(assert (=> b!1335773 m!1223747))

(assert (=> b!1335773 m!1223747))

(declare-fun m!1223763 () Bool)

(assert (=> b!1335773 m!1223763))

(assert (=> b!1335768 m!1223747))

(declare-fun m!1223765 () Bool)

(assert (=> b!1335768 m!1223765))

(assert (=> b!1335768 m!1223751))

(declare-fun m!1223767 () Bool)

(assert (=> b!1335768 m!1223767))

(assert (=> b!1335768 m!1223751))

(assert (=> b!1335768 m!1223671))

(assert (=> b!1335768 m!1223753))

(assert (=> b!1335768 m!1223671))

(declare-fun m!1223769 () Bool)

(assert (=> b!1335768 m!1223769))

(declare-fun m!1223771 () Bool)

(assert (=> b!1335768 m!1223771))

(assert (=> b!1335768 m!1223769))

(assert (=> b!1335766 m!1223745))

(assert (=> b!1335767 m!1223747))

(assert (=> b!1335767 m!1223747))

(assert (=> b!1335767 m!1223763))

(assert (=> b!1335688 d!143525))

(declare-fun d!143527 () Bool)

(declare-fun c!125916 () Bool)

(assert (=> d!143527 (= c!125916 ((_ is ValueCellFull!17550) (select (arr!43793 _values!1320) from!1980)))))

(declare-fun e!760730 () V!54299)

(assert (=> d!143527 (= (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!760730)))

(declare-fun b!1335779 () Bool)

(declare-fun get!22090 (ValueCell!17550 V!54299) V!54299)

(assert (=> b!1335779 (= e!760730 (get!22090 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335780 () Bool)

(declare-fun get!22091 (ValueCell!17550 V!54299) V!54299)

(assert (=> b!1335780 (= e!760730 (get!22091 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143527 c!125916) b!1335779))

(assert (= (and d!143527 (not c!125916)) b!1335780))

(assert (=> b!1335779 m!1223669))

(assert (=> b!1335779 m!1223671))

(declare-fun m!1223773 () Bool)

(assert (=> b!1335779 m!1223773))

(assert (=> b!1335780 m!1223669))

(assert (=> b!1335780 m!1223671))

(declare-fun m!1223775 () Bool)

(assert (=> b!1335780 m!1223775))

(assert (=> b!1335688 d!143527))

(declare-fun d!143529 () Bool)

(declare-fun e!760736 () Bool)

(assert (=> d!143529 e!760736))

(declare-fun res!886535 () Bool)

(assert (=> d!143529 (=> res!886535 e!760736)))

(declare-fun lt!592517 () Bool)

(assert (=> d!143529 (= res!886535 (not lt!592517))))

(declare-fun lt!592518 () Bool)

(assert (=> d!143529 (= lt!592517 lt!592518)))

(declare-fun lt!592519 () Unit!43903)

(declare-fun e!760735 () Unit!43903)

(assert (=> d!143529 (= lt!592519 e!760735)))

(declare-fun c!125919 () Bool)

(assert (=> d!143529 (= c!125919 lt!592518)))

(declare-fun containsKey!737 (List!31028 (_ BitVec 64)) Bool)

(assert (=> d!143529 (= lt!592518 (containsKey!737 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (=> d!143529 (= (contains!8950 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153) lt!592517)))

(declare-fun b!1335787 () Bool)

(declare-fun lt!592520 () Unit!43903)

(assert (=> b!1335787 (= e!760735 lt!592520)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!483 (List!31028 (_ BitVec 64)) Unit!43903)

(assert (=> b!1335787 (= lt!592520 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun isDefined!522 (Option!767) Bool)

(assert (=> b!1335787 (isDefined!522 (getValueByKey!715 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun b!1335788 () Bool)

(declare-fun Unit!43905 () Unit!43903)

(assert (=> b!1335788 (= e!760735 Unit!43905)))

(declare-fun b!1335789 () Bool)

(assert (=> b!1335789 (= e!760736 (isDefined!522 (getValueByKey!715 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153)))))

(assert (= (and d!143529 c!125919) b!1335787))

(assert (= (and d!143529 (not c!125919)) b!1335788))

(assert (= (and d!143529 (not res!886535)) b!1335789))

(declare-fun m!1223777 () Bool)

(assert (=> d!143529 m!1223777))

(declare-fun m!1223779 () Bool)

(assert (=> b!1335787 m!1223779))

(declare-fun m!1223781 () Bool)

(assert (=> b!1335787 m!1223781))

(assert (=> b!1335787 m!1223781))

(declare-fun m!1223783 () Bool)

(assert (=> b!1335787 m!1223783))

(assert (=> b!1335789 m!1223781))

(assert (=> b!1335789 m!1223781))

(assert (=> b!1335789 m!1223783))

(assert (=> b!1335688 d!143529))

(declare-fun d!143531 () Bool)

(assert (=> d!143531 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112592 d!143531))

(declare-fun d!143533 () Bool)

(assert (=> d!143533 (= (array_inv!33023 _values!1320) (bvsge (size!44343 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112592 d!143533))

(declare-fun d!143535 () Bool)

(assert (=> d!143535 (= (array_inv!33024 _keys!1590) (bvsge (size!44342 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112592 d!143535))

(declare-fun d!143537 () Bool)

(assert (=> d!143537 (= (validKeyInArray!0 (select (arr!43792 _keys!1590) from!1980)) (and (not (= (select (arr!43792 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43792 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1335679 d!143537))

(declare-fun bm!64825 () Bool)

(declare-fun call!64828 () Bool)

(assert (=> bm!64825 (= call!64828 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun d!143539 () Bool)

(declare-fun res!886540 () Bool)

(declare-fun e!760743 () Bool)

(assert (=> d!143539 (=> res!886540 e!760743)))

(assert (=> d!143539 (= res!886540 (bvsge #b00000000000000000000000000000000 (size!44342 _keys!1590)))))

(assert (=> d!143539 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!760743)))

(declare-fun b!1335798 () Bool)

(declare-fun e!760745 () Bool)

(assert (=> b!1335798 (= e!760745 call!64828)))

(declare-fun b!1335799 () Bool)

(declare-fun e!760744 () Bool)

(assert (=> b!1335799 (= e!760744 e!760745)))

(declare-fun lt!592528 () (_ BitVec 64))

(assert (=> b!1335799 (= lt!592528 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!592529 () Unit!43903)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90652 (_ BitVec 64) (_ BitVec 32)) Unit!43903)

(assert (=> b!1335799 (= lt!592529 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!592528 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1335799 (arrayContainsKey!0 _keys!1590 lt!592528 #b00000000000000000000000000000000)))

(declare-fun lt!592527 () Unit!43903)

(assert (=> b!1335799 (= lt!592527 lt!592529)))

(declare-fun res!886541 () Bool)

(declare-datatypes ((SeekEntryResult!10047 0))(
  ( (MissingZero!10047 (index!42559 (_ BitVec 32))) (Found!10047 (index!42560 (_ BitVec 32))) (Intermediate!10047 (undefined!10859 Bool) (index!42561 (_ BitVec 32)) (x!119326 (_ BitVec 32))) (Undefined!10047) (MissingVacant!10047 (index!42562 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90652 (_ BitVec 32)) SeekEntryResult!10047)

(assert (=> b!1335799 (= res!886541 (= (seekEntryOrOpen!0 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10047 #b00000000000000000000000000000000)))))

(assert (=> b!1335799 (=> (not res!886541) (not e!760745))))

(declare-fun b!1335800 () Bool)

(assert (=> b!1335800 (= e!760744 call!64828)))

(declare-fun b!1335801 () Bool)

(assert (=> b!1335801 (= e!760743 e!760744)))

(declare-fun c!125922 () Bool)

(assert (=> b!1335801 (= c!125922 (validKeyInArray!0 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143539 (not res!886540)) b!1335801))

(assert (= (and b!1335801 c!125922) b!1335799))

(assert (= (and b!1335801 (not c!125922)) b!1335800))

(assert (= (and b!1335799 res!886541) b!1335798))

(assert (= (or b!1335798 b!1335800) bm!64825))

(declare-fun m!1223785 () Bool)

(assert (=> bm!64825 m!1223785))

(declare-fun m!1223787 () Bool)

(assert (=> b!1335799 m!1223787))

(declare-fun m!1223789 () Bool)

(assert (=> b!1335799 m!1223789))

(declare-fun m!1223791 () Bool)

(assert (=> b!1335799 m!1223791))

(assert (=> b!1335799 m!1223787))

(declare-fun m!1223793 () Bool)

(assert (=> b!1335799 m!1223793))

(assert (=> b!1335801 m!1223787))

(assert (=> b!1335801 m!1223787))

(declare-fun m!1223795 () Bool)

(assert (=> b!1335801 m!1223795))

(assert (=> b!1335687 d!143539))

(declare-fun d!143541 () Bool)

(declare-fun e!760747 () Bool)

(assert (=> d!143541 e!760747))

(declare-fun res!886542 () Bool)

(assert (=> d!143541 (=> res!886542 e!760747)))

(declare-fun lt!592530 () Bool)

(assert (=> d!143541 (= res!886542 (not lt!592530))))

(declare-fun lt!592531 () Bool)

(assert (=> d!143541 (= lt!592530 lt!592531)))

(declare-fun lt!592532 () Unit!43903)

(declare-fun e!760746 () Unit!43903)

(assert (=> d!143541 (= lt!592532 e!760746)))

(declare-fun c!125923 () Bool)

(assert (=> d!143541 (= c!125923 lt!592531)))

(assert (=> d!143541 (= lt!592531 (containsKey!737 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!143541 (= (contains!8950 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!592530)))

(declare-fun b!1335802 () Bool)

(declare-fun lt!592533 () Unit!43903)

(assert (=> b!1335802 (= e!760746 lt!592533)))

(assert (=> b!1335802 (= lt!592533 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> b!1335802 (isDefined!522 (getValueByKey!715 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1335803 () Bool)

(declare-fun Unit!43906 () Unit!43903)

(assert (=> b!1335803 (= e!760746 Unit!43906)))

(declare-fun b!1335804 () Bool)

(assert (=> b!1335804 (= e!760747 (isDefined!522 (getValueByKey!715 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143541 c!125923) b!1335802))

(assert (= (and d!143541 (not c!125923)) b!1335803))

(assert (= (and d!143541 (not res!886542)) b!1335804))

(declare-fun m!1223797 () Bool)

(assert (=> d!143541 m!1223797))

(declare-fun m!1223799 () Bool)

(assert (=> b!1335802 m!1223799))

(declare-fun m!1223801 () Bool)

(assert (=> b!1335802 m!1223801))

(assert (=> b!1335802 m!1223801))

(declare-fun m!1223803 () Bool)

(assert (=> b!1335802 m!1223803))

(assert (=> b!1335804 m!1223801))

(assert (=> b!1335804 m!1223801))

(assert (=> b!1335804 m!1223803))

(assert (=> b!1335690 d!143541))

(declare-fun b!1335847 () Bool)

(declare-fun e!760778 () Unit!43903)

(declare-fun lt!592581 () Unit!43903)

(assert (=> b!1335847 (= e!760778 lt!592581)))

(declare-fun lt!592595 () ListLongMap!21543)

(assert (=> b!1335847 (= lt!592595 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592592 () (_ BitVec 64))

(assert (=> b!1335847 (= lt!592592 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592582 () (_ BitVec 64))

(assert (=> b!1335847 (= lt!592582 (select (arr!43792 _keys!1590) from!1980))))

(declare-fun lt!592599 () Unit!43903)

(declare-fun addStillContains!1187 (ListLongMap!21543 (_ BitVec 64) V!54299 (_ BitVec 64)) Unit!43903)

(assert (=> b!1335847 (= lt!592599 (addStillContains!1187 lt!592595 lt!592592 zeroValue!1262 lt!592582))))

(assert (=> b!1335847 (contains!8950 (+!4730 lt!592595 (tuple2!23887 lt!592592 zeroValue!1262)) lt!592582)))

(declare-fun lt!592589 () Unit!43903)

(assert (=> b!1335847 (= lt!592589 lt!592599)))

(declare-fun lt!592587 () ListLongMap!21543)

(assert (=> b!1335847 (= lt!592587 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592593 () (_ BitVec 64))

(assert (=> b!1335847 (= lt!592593 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592584 () (_ BitVec 64))

(assert (=> b!1335847 (= lt!592584 (select (arr!43792 _keys!1590) from!1980))))

(declare-fun lt!592586 () Unit!43903)

(declare-fun addApplyDifferent!574 (ListLongMap!21543 (_ BitVec 64) V!54299 (_ BitVec 64)) Unit!43903)

(assert (=> b!1335847 (= lt!592586 (addApplyDifferent!574 lt!592587 lt!592593 minValue!1262 lt!592584))))

(assert (=> b!1335847 (= (apply!1032 (+!4730 lt!592587 (tuple2!23887 lt!592593 minValue!1262)) lt!592584) (apply!1032 lt!592587 lt!592584))))

(declare-fun lt!592591 () Unit!43903)

(assert (=> b!1335847 (= lt!592591 lt!592586)))

(declare-fun lt!592598 () ListLongMap!21543)

(assert (=> b!1335847 (= lt!592598 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592596 () (_ BitVec 64))

(assert (=> b!1335847 (= lt!592596 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592583 () (_ BitVec 64))

(assert (=> b!1335847 (= lt!592583 (select (arr!43792 _keys!1590) from!1980))))

(declare-fun lt!592594 () Unit!43903)

(assert (=> b!1335847 (= lt!592594 (addApplyDifferent!574 lt!592598 lt!592596 zeroValue!1262 lt!592583))))

(assert (=> b!1335847 (= (apply!1032 (+!4730 lt!592598 (tuple2!23887 lt!592596 zeroValue!1262)) lt!592583) (apply!1032 lt!592598 lt!592583))))

(declare-fun lt!592585 () Unit!43903)

(assert (=> b!1335847 (= lt!592585 lt!592594)))

(declare-fun lt!592588 () ListLongMap!21543)

(assert (=> b!1335847 (= lt!592588 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!592597 () (_ BitVec 64))

(assert (=> b!1335847 (= lt!592597 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!592590 () (_ BitVec 64))

(assert (=> b!1335847 (= lt!592590 (select (arr!43792 _keys!1590) from!1980))))

(assert (=> b!1335847 (= lt!592581 (addApplyDifferent!574 lt!592588 lt!592597 minValue!1262 lt!592590))))

(assert (=> b!1335847 (= (apply!1032 (+!4730 lt!592588 (tuple2!23887 lt!592597 minValue!1262)) lt!592590) (apply!1032 lt!592588 lt!592590))))

(declare-fun b!1335848 () Bool)

(declare-fun e!760777 () ListLongMap!21543)

(declare-fun call!64848 () ListLongMap!21543)

(assert (=> b!1335848 (= e!760777 call!64848)))

(declare-fun bm!64840 () Bool)

(declare-fun call!64849 () ListLongMap!21543)

(declare-fun call!64846 () ListLongMap!21543)

(assert (=> bm!64840 (= call!64849 call!64846)))

(declare-fun b!1335849 () Bool)

(declare-fun e!760785 () Bool)

(declare-fun lt!592580 () ListLongMap!21543)

(assert (=> b!1335849 (= e!760785 (= (apply!1032 lt!592580 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun call!64845 () ListLongMap!21543)

(declare-fun bm!64841 () Bool)

(assert (=> bm!64841 (= call!64845 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun b!1335850 () Bool)

(declare-fun e!760775 () Bool)

(assert (=> b!1335850 (= e!760775 (= (apply!1032 lt!592580 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1335851 () Bool)

(declare-fun e!760786 () Bool)

(declare-fun e!760774 () Bool)

(assert (=> b!1335851 (= e!760786 e!760774)))

(declare-fun res!886561 () Bool)

(assert (=> b!1335851 (=> (not res!886561) (not e!760774))))

(assert (=> b!1335851 (= res!886561 (contains!8950 lt!592580 (select (arr!43792 _keys!1590) from!1980)))))

(assert (=> b!1335851 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44342 _keys!1590)))))

(declare-fun b!1335852 () Bool)

(declare-fun e!760783 () Bool)

(assert (=> b!1335852 (= e!760783 e!760785)))

(declare-fun res!886567 () Bool)

(declare-fun call!64844 () Bool)

(assert (=> b!1335852 (= res!886567 call!64844)))

(assert (=> b!1335852 (=> (not res!886567) (not e!760785))))

(declare-fun b!1335853 () Bool)

(declare-fun e!760781 () ListLongMap!21543)

(assert (=> b!1335853 (= e!760781 call!64848)))

(declare-fun b!1335854 () Bool)

(declare-fun c!125937 () Bool)

(assert (=> b!1335854 (= c!125937 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1335854 (= e!760781 e!760777)))

(declare-fun bm!64842 () Bool)

(assert (=> bm!64842 (= call!64846 call!64845)))

(declare-fun b!1335855 () Bool)

(declare-fun e!760779 () ListLongMap!21543)

(declare-fun call!64843 () ListLongMap!21543)

(assert (=> b!1335855 (= e!760779 (+!4730 call!64843 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1335856 () Bool)

(declare-fun e!760776 () Bool)

(assert (=> b!1335856 (= e!760776 e!760775)))

(declare-fun res!886569 () Bool)

(declare-fun call!64847 () Bool)

(assert (=> b!1335856 (= res!886569 call!64847)))

(assert (=> b!1335856 (=> (not res!886569) (not e!760775))))

(declare-fun bm!64844 () Bool)

(assert (=> bm!64844 (= call!64847 (contains!8950 lt!592580 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!125938 () Bool)

(declare-fun bm!64845 () Bool)

(declare-fun c!125936 () Bool)

(assert (=> bm!64845 (= call!64843 (+!4730 (ite c!125936 call!64845 (ite c!125938 call!64846 call!64849)) (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1335857 () Bool)

(assert (=> b!1335857 (= e!760776 (not call!64847))))

(declare-fun b!1335858 () Bool)

(declare-fun e!760780 () Bool)

(assert (=> b!1335858 (= e!760780 (validKeyInArray!0 (select (arr!43792 _keys!1590) from!1980)))))

(declare-fun b!1335859 () Bool)

(assert (=> b!1335859 (= e!760779 e!760781)))

(assert (=> b!1335859 (= c!125938 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1335860 () Bool)

(declare-fun Unit!43907 () Unit!43903)

(assert (=> b!1335860 (= e!760778 Unit!43907)))

(declare-fun b!1335861 () Bool)

(declare-fun res!886568 () Bool)

(declare-fun e!760784 () Bool)

(assert (=> b!1335861 (=> (not res!886568) (not e!760784))))

(assert (=> b!1335861 (= res!886568 e!760786)))

(declare-fun res!886563 () Bool)

(assert (=> b!1335861 (=> res!886563 e!760786)))

(assert (=> b!1335861 (= res!886563 (not e!760780))))

(declare-fun res!886566 () Bool)

(assert (=> b!1335861 (=> (not res!886566) (not e!760780))))

(assert (=> b!1335861 (= res!886566 (bvslt from!1980 (size!44342 _keys!1590)))))

(declare-fun b!1335862 () Bool)

(declare-fun res!886564 () Bool)

(assert (=> b!1335862 (=> (not res!886564) (not e!760784))))

(assert (=> b!1335862 (= res!886564 e!760783)))

(declare-fun c!125940 () Bool)

(assert (=> b!1335862 (= c!125940 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!64846 () Bool)

(assert (=> bm!64846 (= call!64844 (contains!8950 lt!592580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1335863 () Bool)

(assert (=> b!1335863 (= e!760777 call!64849)))

(declare-fun b!1335864 () Bool)

(declare-fun e!760782 () Bool)

(assert (=> b!1335864 (= e!760782 (validKeyInArray!0 (select (arr!43792 _keys!1590) from!1980)))))

(declare-fun b!1335865 () Bool)

(assert (=> b!1335865 (= e!760784 e!760776)))

(declare-fun c!125941 () Bool)

(assert (=> b!1335865 (= c!125941 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64843 () Bool)

(assert (=> bm!64843 (= call!64848 call!64843)))

(declare-fun d!143543 () Bool)

(assert (=> d!143543 e!760784))

(declare-fun res!886565 () Bool)

(assert (=> d!143543 (=> (not res!886565) (not e!760784))))

(assert (=> d!143543 (= res!886565 (or (bvsge from!1980 (size!44342 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44342 _keys!1590)))))))

(declare-fun lt!592579 () ListLongMap!21543)

(assert (=> d!143543 (= lt!592580 lt!592579)))

(declare-fun lt!592578 () Unit!43903)

(assert (=> d!143543 (= lt!592578 e!760778)))

(declare-fun c!125939 () Bool)

(assert (=> d!143543 (= c!125939 e!760782)))

(declare-fun res!886562 () Bool)

(assert (=> d!143543 (=> (not res!886562) (not e!760782))))

(assert (=> d!143543 (= res!886562 (bvslt from!1980 (size!44342 _keys!1590)))))

(assert (=> d!143543 (= lt!592579 e!760779)))

(assert (=> d!143543 (= c!125936 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143543 (validMask!0 mask!1998)))

(assert (=> d!143543 (= (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!592580)))

(declare-fun b!1335866 () Bool)

(assert (=> b!1335866 (= e!760783 (not call!64844))))

(declare-fun b!1335867 () Bool)

(assert (=> b!1335867 (= e!760774 (= (apply!1032 lt!592580 (select (arr!43792 _keys!1590) from!1980)) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1335867 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44343 _values!1320)))))

(assert (=> b!1335867 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44342 _keys!1590)))))

(assert (= (and d!143543 c!125936) b!1335855))

(assert (= (and d!143543 (not c!125936)) b!1335859))

(assert (= (and b!1335859 c!125938) b!1335853))

(assert (= (and b!1335859 (not c!125938)) b!1335854))

(assert (= (and b!1335854 c!125937) b!1335848))

(assert (= (and b!1335854 (not c!125937)) b!1335863))

(assert (= (or b!1335848 b!1335863) bm!64840))

(assert (= (or b!1335853 bm!64840) bm!64842))

(assert (= (or b!1335853 b!1335848) bm!64843))

(assert (= (or b!1335855 bm!64842) bm!64841))

(assert (= (or b!1335855 bm!64843) bm!64845))

(assert (= (and d!143543 res!886562) b!1335864))

(assert (= (and d!143543 c!125939) b!1335847))

(assert (= (and d!143543 (not c!125939)) b!1335860))

(assert (= (and d!143543 res!886565) b!1335861))

(assert (= (and b!1335861 res!886566) b!1335858))

(assert (= (and b!1335861 (not res!886563)) b!1335851))

(assert (= (and b!1335851 res!886561) b!1335867))

(assert (= (and b!1335861 res!886568) b!1335862))

(assert (= (and b!1335862 c!125940) b!1335852))

(assert (= (and b!1335862 (not c!125940)) b!1335866))

(assert (= (and b!1335852 res!886567) b!1335849))

(assert (= (or b!1335852 b!1335866) bm!64846))

(assert (= (and b!1335862 res!886564) b!1335865))

(assert (= (and b!1335865 c!125941) b!1335856))

(assert (= (and b!1335865 (not c!125941)) b!1335857))

(assert (= (and b!1335856 res!886569) b!1335850))

(assert (= (or b!1335856 b!1335857) bm!64844))

(declare-fun b_lambda!24125 () Bool)

(assert (=> (not b_lambda!24125) (not b!1335867)))

(assert (=> b!1335867 t!45295))

(declare-fun b_and!49909 () Bool)

(assert (= b_and!49907 (and (=> t!45295 result!25213) b_and!49909)))

(declare-fun m!1223805 () Bool)

(assert (=> b!1335855 m!1223805))

(assert (=> d!143543 m!1223659))

(declare-fun m!1223807 () Bool)

(assert (=> bm!64845 m!1223807))

(assert (=> b!1335864 m!1223653))

(assert (=> b!1335864 m!1223653))

(assert (=> b!1335864 m!1223655))

(declare-fun m!1223809 () Bool)

(assert (=> bm!64841 m!1223809))

(assert (=> b!1335851 m!1223653))

(assert (=> b!1335851 m!1223653))

(declare-fun m!1223811 () Bool)

(assert (=> b!1335851 m!1223811))

(declare-fun m!1223813 () Bool)

(assert (=> b!1335849 m!1223813))

(assert (=> b!1335867 m!1223671))

(assert (=> b!1335867 m!1223669))

(assert (=> b!1335867 m!1223671))

(assert (=> b!1335867 m!1223673))

(assert (=> b!1335867 m!1223669))

(assert (=> b!1335867 m!1223653))

(assert (=> b!1335867 m!1223653))

(declare-fun m!1223815 () Bool)

(assert (=> b!1335867 m!1223815))

(assert (=> b!1335858 m!1223653))

(assert (=> b!1335858 m!1223653))

(assert (=> b!1335858 m!1223655))

(declare-fun m!1223817 () Bool)

(assert (=> b!1335847 m!1223817))

(declare-fun m!1223819 () Bool)

(assert (=> b!1335847 m!1223819))

(declare-fun m!1223821 () Bool)

(assert (=> b!1335847 m!1223821))

(declare-fun m!1223823 () Bool)

(assert (=> b!1335847 m!1223823))

(declare-fun m!1223825 () Bool)

(assert (=> b!1335847 m!1223825))

(assert (=> b!1335847 m!1223819))

(declare-fun m!1223827 () Bool)

(assert (=> b!1335847 m!1223827))

(declare-fun m!1223829 () Bool)

(assert (=> b!1335847 m!1223829))

(declare-fun m!1223831 () Bool)

(assert (=> b!1335847 m!1223831))

(declare-fun m!1223833 () Bool)

(assert (=> b!1335847 m!1223833))

(assert (=> b!1335847 m!1223817))

(declare-fun m!1223835 () Bool)

(assert (=> b!1335847 m!1223835))

(assert (=> b!1335847 m!1223829))

(assert (=> b!1335847 m!1223653))

(declare-fun m!1223837 () Bool)

(assert (=> b!1335847 m!1223837))

(declare-fun m!1223839 () Bool)

(assert (=> b!1335847 m!1223839))

(declare-fun m!1223841 () Bool)

(assert (=> b!1335847 m!1223841))

(declare-fun m!1223843 () Bool)

(assert (=> b!1335847 m!1223843))

(assert (=> b!1335847 m!1223837))

(assert (=> b!1335847 m!1223809))

(declare-fun m!1223845 () Bool)

(assert (=> b!1335847 m!1223845))

(declare-fun m!1223847 () Bool)

(assert (=> bm!64846 m!1223847))

(declare-fun m!1223849 () Bool)

(assert (=> b!1335850 m!1223849))

(declare-fun m!1223851 () Bool)

(assert (=> bm!64844 m!1223851))

(assert (=> b!1335690 d!143543))

(declare-fun bm!64849 () Bool)

(declare-fun call!64852 () Bool)

(declare-fun c!125944 () Bool)

(assert (=> bm!64849 (= call!64852 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125944 (Cons!31025 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) Nil!31026) Nil!31026)))))

(declare-fun b!1335878 () Bool)

(declare-fun e!760797 () Bool)

(declare-fun e!760798 () Bool)

(assert (=> b!1335878 (= e!760797 e!760798)))

(assert (=> b!1335878 (= c!125944 (validKeyInArray!0 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!143545 () Bool)

(declare-fun res!886578 () Bool)

(declare-fun e!760796 () Bool)

(assert (=> d!143545 (=> res!886578 e!760796)))

(assert (=> d!143545 (= res!886578 (bvsge #b00000000000000000000000000000000 (size!44342 _keys!1590)))))

(assert (=> d!143545 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31026) e!760796)))

(declare-fun b!1335879 () Bool)

(assert (=> b!1335879 (= e!760796 e!760797)))

(declare-fun res!886577 () Bool)

(assert (=> b!1335879 (=> (not res!886577) (not e!760797))))

(declare-fun e!760795 () Bool)

(assert (=> b!1335879 (= res!886577 (not e!760795))))

(declare-fun res!886576 () Bool)

(assert (=> b!1335879 (=> (not res!886576) (not e!760795))))

(assert (=> b!1335879 (= res!886576 (validKeyInArray!0 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1335880 () Bool)

(assert (=> b!1335880 (= e!760798 call!64852)))

(declare-fun b!1335881 () Bool)

(assert (=> b!1335881 (= e!760798 call!64852)))

(declare-fun b!1335882 () Bool)

(declare-fun contains!8953 (List!31029 (_ BitVec 64)) Bool)

(assert (=> b!1335882 (= e!760795 (contains!8953 Nil!31026 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143545 (not res!886578)) b!1335879))

(assert (= (and b!1335879 res!886576) b!1335882))

(assert (= (and b!1335879 res!886577) b!1335878))

(assert (= (and b!1335878 c!125944) b!1335881))

(assert (= (and b!1335878 (not c!125944)) b!1335880))

(assert (= (or b!1335881 b!1335880) bm!64849))

(assert (=> bm!64849 m!1223787))

(declare-fun m!1223853 () Bool)

(assert (=> bm!64849 m!1223853))

(assert (=> b!1335878 m!1223787))

(assert (=> b!1335878 m!1223787))

(assert (=> b!1335878 m!1223795))

(assert (=> b!1335879 m!1223787))

(assert (=> b!1335879 m!1223787))

(assert (=> b!1335879 m!1223795))

(assert (=> b!1335882 m!1223787))

(assert (=> b!1335882 m!1223787))

(declare-fun m!1223855 () Bool)

(assert (=> b!1335882 m!1223855))

(assert (=> b!1335689 d!143545))

(declare-fun condMapEmpty!57025 () Bool)

(declare-fun mapDefault!57025 () ValueCell!17550)

(assert (=> mapNonEmpty!57019 (= condMapEmpty!57025 (= mapRest!57019 ((as const (Array (_ BitVec 32) ValueCell!17550)) mapDefault!57025)))))

(declare-fun e!760804 () Bool)

(declare-fun mapRes!57025 () Bool)

(assert (=> mapNonEmpty!57019 (= tp!108598 (and e!760804 mapRes!57025))))

(declare-fun b!1335889 () Bool)

(declare-fun e!760803 () Bool)

(assert (=> b!1335889 (= e!760803 tp_is_empty!36897)))

(declare-fun b!1335890 () Bool)

(assert (=> b!1335890 (= e!760804 tp_is_empty!36897)))

(declare-fun mapNonEmpty!57025 () Bool)

(declare-fun tp!108607 () Bool)

(assert (=> mapNonEmpty!57025 (= mapRes!57025 (and tp!108607 e!760803))))

(declare-fun mapRest!57025 () (Array (_ BitVec 32) ValueCell!17550))

(declare-fun mapKey!57025 () (_ BitVec 32))

(declare-fun mapValue!57025 () ValueCell!17550)

(assert (=> mapNonEmpty!57025 (= mapRest!57019 (store mapRest!57025 mapKey!57025 mapValue!57025))))

(declare-fun mapIsEmpty!57025 () Bool)

(assert (=> mapIsEmpty!57025 mapRes!57025))

(assert (= (and mapNonEmpty!57019 condMapEmpty!57025) mapIsEmpty!57025))

(assert (= (and mapNonEmpty!57019 (not condMapEmpty!57025)) mapNonEmpty!57025))

(assert (= (and mapNonEmpty!57025 ((_ is ValueCellFull!17550) mapValue!57025)) b!1335889))

(assert (= (and mapNonEmpty!57019 ((_ is ValueCellFull!17550) mapDefault!57025)) b!1335890))

(declare-fun m!1223857 () Bool)

(assert (=> mapNonEmpty!57025 m!1223857))

(declare-fun b_lambda!24127 () Bool)

(assert (= b_lambda!24121 (or (and start!112592 b_free!30987) b_lambda!24127)))

(declare-fun b_lambda!24129 () Bool)

(assert (= b_lambda!24125 (or (and start!112592 b_free!30987) b_lambda!24129)))

(declare-fun b_lambda!24131 () Bool)

(assert (= b_lambda!24123 (or (and start!112592 b_free!30987) b_lambda!24131)))

(check-sat (not b!1335771) (not mapNonEmpty!57025) (not bm!64845) tp_is_empty!36897 (not b!1335769) (not d!143521) (not b!1335878) (not b!1335799) (not b!1335780) (not b!1335763) (not b_next!30987) (not b_lambda!24129) (not b!1335789) (not d!143523) (not b!1335764) (not b!1335779) (not b_lambda!24131) (not d!143541) (not b!1335867) (not b!1335737) (not b!1335851) (not b!1335802) (not b!1335766) (not bm!64844) (not bm!64825) b_and!49909 (not d!143543) (not b!1335850) (not b!1335804) (not bm!64822) (not b!1335787) (not bm!64841) (not b!1335879) (not b!1335849) (not b!1335801) (not b!1335882) (not b!1335847) (not b!1335736) (not bm!64846) (not b_lambda!24119) (not b!1335738) (not b!1335767) (not b!1335768) (not b!1335858) (not bm!64849) (not b!1335864) (not d!143525) (not b_lambda!24127) (not b!1335773) (not b!1335735) (not d!143529) (not b!1335855))
(check-sat b_and!49909 (not b_next!30987))
(get-model)

(declare-fun d!143547 () Bool)

(assert (=> d!143547 (= (validKeyInArray!0 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000)) (and (not (= (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1335801 d!143547))

(declare-fun d!143549 () Bool)

(declare-fun e!760806 () Bool)

(assert (=> d!143549 e!760806))

(declare-fun res!886579 () Bool)

(assert (=> d!143549 (=> res!886579 e!760806)))

(declare-fun lt!592600 () Bool)

(assert (=> d!143549 (= res!886579 (not lt!592600))))

(declare-fun lt!592601 () Bool)

(assert (=> d!143549 (= lt!592600 lt!592601)))

(declare-fun lt!592602 () Unit!43903)

(declare-fun e!760805 () Unit!43903)

(assert (=> d!143549 (= lt!592602 e!760805)))

(declare-fun c!125945 () Bool)

(assert (=> d!143549 (= c!125945 lt!592601)))

(assert (=> d!143549 (= lt!592601 (containsKey!737 (toList!10787 lt!592486) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143549 (= (contains!8950 lt!592486 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!592600)))

(declare-fun b!1335891 () Bool)

(declare-fun lt!592603 () Unit!43903)

(assert (=> b!1335891 (= e!760805 lt!592603)))

(assert (=> b!1335891 (= lt!592603 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 lt!592486) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> b!1335891 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592486) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1335892 () Bool)

(declare-fun Unit!43908 () Unit!43903)

(assert (=> b!1335892 (= e!760805 Unit!43908)))

(declare-fun b!1335893 () Bool)

(assert (=> b!1335893 (= e!760806 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592486) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (= (and d!143549 c!125945) b!1335891))

(assert (= (and d!143549 (not c!125945)) b!1335892))

(assert (= (and d!143549 (not res!886579)) b!1335893))

(declare-fun m!1223859 () Bool)

(assert (=> d!143549 m!1223859))

(declare-fun m!1223861 () Bool)

(assert (=> b!1335891 m!1223861))

(assert (=> b!1335891 m!1223741))

(assert (=> b!1335891 m!1223741))

(declare-fun m!1223863 () Bool)

(assert (=> b!1335891 m!1223863))

(assert (=> b!1335893 m!1223741))

(assert (=> b!1335893 m!1223741))

(assert (=> b!1335893 m!1223863))

(assert (=> d!143523 d!143549))

(declare-fun b!1335904 () Bool)

(declare-fun e!760812 () Option!767)

(assert (=> b!1335904 (= e!760812 (getValueByKey!715 (t!45296 lt!592484) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1335902 () Bool)

(declare-fun e!760811 () Option!767)

(assert (=> b!1335902 (= e!760811 (Some!766 (_2!11954 (h!32233 lt!592484))))))

(declare-fun d!143551 () Bool)

(declare-fun c!125950 () Bool)

(assert (=> d!143551 (= c!125950 (and ((_ is Cons!31024) lt!592484) (= (_1!11954 (h!32233 lt!592484)) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143551 (= (getValueByKey!715 lt!592484 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) e!760811)))

(declare-fun b!1335903 () Bool)

(assert (=> b!1335903 (= e!760811 e!760812)))

(declare-fun c!125951 () Bool)

(assert (=> b!1335903 (= c!125951 (and ((_ is Cons!31024) lt!592484) (not (= (_1!11954 (h!32233 lt!592484)) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1335905 () Bool)

(assert (=> b!1335905 (= e!760812 None!765)))

(assert (= (and d!143551 c!125950) b!1335902))

(assert (= (and d!143551 (not c!125950)) b!1335903))

(assert (= (and b!1335903 c!125951) b!1335904))

(assert (= (and b!1335903 (not c!125951)) b!1335905))

(declare-fun m!1223865 () Bool)

(assert (=> b!1335904 m!1223865))

(assert (=> d!143523 d!143551))

(declare-fun d!143553 () Bool)

(assert (=> d!143553 (= (getValueByKey!715 lt!592484 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!766 (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!592606 () Unit!43903)

(declare-fun choose!1955 (List!31028 (_ BitVec 64) V!54299) Unit!43903)

(assert (=> d!143553 (= lt!592606 (choose!1955 lt!592484 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun e!760815 () Bool)

(assert (=> d!143553 e!760815))

(declare-fun res!886584 () Bool)

(assert (=> d!143553 (=> (not res!886584) (not e!760815))))

(declare-fun isStrictlySorted!878 (List!31028) Bool)

(assert (=> d!143553 (= res!886584 (isStrictlySorted!878 lt!592484))))

(assert (=> d!143553 (= (lemmaContainsTupThenGetReturnValue!360 lt!592484 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!592606)))

(declare-fun b!1335910 () Bool)

(declare-fun res!886585 () Bool)

(assert (=> b!1335910 (=> (not res!886585) (not e!760815))))

(assert (=> b!1335910 (= res!886585 (containsKey!737 lt!592484 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1335911 () Bool)

(assert (=> b!1335911 (= e!760815 (contains!8952 lt!592484 (tuple2!23887 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (= (and d!143553 res!886584) b!1335910))

(assert (= (and b!1335910 res!886585) b!1335911))

(assert (=> d!143553 m!1223735))

(declare-fun m!1223867 () Bool)

(assert (=> d!143553 m!1223867))

(declare-fun m!1223869 () Bool)

(assert (=> d!143553 m!1223869))

(declare-fun m!1223871 () Bool)

(assert (=> b!1335910 m!1223871))

(declare-fun m!1223873 () Bool)

(assert (=> b!1335911 m!1223873))

(assert (=> d!143523 d!143553))

(declare-fun b!1335932 () Bool)

(declare-fun e!760827 () List!31028)

(declare-fun e!760829 () List!31028)

(assert (=> b!1335932 (= e!760827 e!760829)))

(declare-fun c!125963 () Bool)

(assert (=> b!1335932 (= c!125963 (and ((_ is Cons!31024) (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!11954 (h!32233 (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1335933 () Bool)

(declare-fun e!760828 () List!31028)

(declare-fun call!64861 () List!31028)

(assert (=> b!1335933 (= e!760828 call!64861)))

(declare-fun bm!64856 () Bool)

(declare-fun e!760830 () List!31028)

(declare-fun c!125960 () Bool)

(declare-fun call!64859 () List!31028)

(declare-fun $colon$colon!670 (List!31028 tuple2!23886) List!31028)

(assert (=> bm!64856 (= call!64859 ($colon$colon!670 e!760830 (ite c!125960 (h!32233 (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (tuple2!23887 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun c!125961 () Bool)

(assert (=> bm!64856 (= c!125961 c!125960)))

(declare-fun b!1335934 () Bool)

(declare-fun c!125962 () Bool)

(assert (=> b!1335934 (= c!125962 (and ((_ is Cons!31024) (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvsgt (_1!11954 (h!32233 (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> b!1335934 (= e!760829 e!760828)))

(declare-fun bm!64857 () Bool)

(declare-fun call!64860 () List!31028)

(assert (=> bm!64857 (= call!64861 call!64860)))

(declare-fun b!1335935 () Bool)

(assert (=> b!1335935 (= e!760830 (ite c!125963 (t!45296 (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (ite c!125962 (Cons!31024 (h!32233 (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (t!45296 (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) Nil!31025)))))

(declare-fun b!1335936 () Bool)

(assert (=> b!1335936 (= e!760829 call!64860)))

(declare-fun bm!64858 () Bool)

(assert (=> bm!64858 (= call!64860 call!64859)))

(declare-fun b!1335937 () Bool)

(declare-fun e!760826 () Bool)

(declare-fun lt!592609 () List!31028)

(assert (=> b!1335937 (= e!760826 (contains!8952 lt!592609 (tuple2!23887 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1335938 () Bool)

(assert (=> b!1335938 (= e!760830 (insertStrictlySorted!489 (t!45296 (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1335939 () Bool)

(assert (=> b!1335939 (= e!760828 call!64861)))

(declare-fun b!1335940 () Bool)

(declare-fun res!886590 () Bool)

(assert (=> b!1335940 (=> (not res!886590) (not e!760826))))

(assert (=> b!1335940 (= res!886590 (containsKey!737 lt!592609 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1335941 () Bool)

(assert (=> b!1335941 (= e!760827 call!64859)))

(declare-fun d!143555 () Bool)

(assert (=> d!143555 e!760826))

(declare-fun res!886591 () Bool)

(assert (=> d!143555 (=> (not res!886591) (not e!760826))))

(assert (=> d!143555 (= res!886591 (isStrictlySorted!878 lt!592609))))

(assert (=> d!143555 (= lt!592609 e!760827)))

(assert (=> d!143555 (= c!125960 (and ((_ is Cons!31024) (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!11954 (h!32233 (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143555 (isStrictlySorted!878 (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143555 (= (insertStrictlySorted!489 (toList!10787 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!592609)))

(assert (= (and d!143555 c!125960) b!1335941))

(assert (= (and d!143555 (not c!125960)) b!1335932))

(assert (= (and b!1335932 c!125963) b!1335936))

(assert (= (and b!1335932 (not c!125963)) b!1335934))

(assert (= (and b!1335934 c!125962) b!1335933))

(assert (= (and b!1335934 (not c!125962)) b!1335939))

(assert (= (or b!1335933 b!1335939) bm!64857))

(assert (= (or b!1335936 bm!64857) bm!64858))

(assert (= (or b!1335941 bm!64858) bm!64856))

(assert (= (and bm!64856 c!125961) b!1335938))

(assert (= (and bm!64856 (not c!125961)) b!1335935))

(assert (= (and d!143555 res!886591) b!1335940))

(assert (= (and b!1335940 res!886590) b!1335937))

(declare-fun m!1223875 () Bool)

(assert (=> b!1335940 m!1223875))

(declare-fun m!1223877 () Bool)

(assert (=> d!143555 m!1223877))

(declare-fun m!1223879 () Bool)

(assert (=> d!143555 m!1223879))

(declare-fun m!1223881 () Bool)

(assert (=> b!1335937 m!1223881))

(declare-fun m!1223883 () Bool)

(assert (=> bm!64856 m!1223883))

(declare-fun m!1223885 () Bool)

(assert (=> b!1335938 m!1223885))

(assert (=> d!143523 d!143555))

(declare-fun d!143557 () Bool)

(declare-fun get!22092 (Option!767) V!54299)

(assert (=> d!143557 (= (apply!1032 lt!592580 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22092 (getValueByKey!715 (toList!10787 lt!592580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38247 () Bool)

(assert (= bs!38247 d!143557))

(declare-fun m!1223887 () Bool)

(assert (=> bs!38247 m!1223887))

(assert (=> bs!38247 m!1223887))

(declare-fun m!1223889 () Bool)

(assert (=> bs!38247 m!1223889))

(assert (=> b!1335850 d!143557))

(declare-fun d!143559 () Bool)

(assert (=> d!143559 (= (apply!1032 lt!592580 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22092 (getValueByKey!715 (toList!10787 lt!592580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38248 () Bool)

(assert (= bs!38248 d!143559))

(declare-fun m!1223891 () Bool)

(assert (=> bs!38248 m!1223891))

(assert (=> bs!38248 m!1223891))

(declare-fun m!1223893 () Bool)

(assert (=> bs!38248 m!1223893))

(assert (=> b!1335849 d!143559))

(declare-fun d!143561 () Bool)

(declare-fun lt!592612 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!657 (List!31029) (InoxSet (_ BitVec 64)))

(assert (=> d!143561 (= lt!592612 (select (content!657 Nil!31026) (select (arr!43792 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun e!760836 () Bool)

(assert (=> d!143561 (= lt!592612 e!760836)))

(declare-fun res!886596 () Bool)

(assert (=> d!143561 (=> (not res!886596) (not e!760836))))

(assert (=> d!143561 (= res!886596 ((_ is Cons!31025) Nil!31026))))

(assert (=> d!143561 (= (contains!8953 Nil!31026 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000)) lt!592612)))

(declare-fun b!1335946 () Bool)

(declare-fun e!760835 () Bool)

(assert (=> b!1335946 (= e!760836 e!760835)))

(declare-fun res!886597 () Bool)

(assert (=> b!1335946 (=> res!886597 e!760835)))

(assert (=> b!1335946 (= res!886597 (= (h!32234 Nil!31026) (select (arr!43792 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1335947 () Bool)

(assert (=> b!1335947 (= e!760835 (contains!8953 (t!45297 Nil!31026) (select (arr!43792 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143561 res!886596) b!1335946))

(assert (= (and b!1335946 (not res!886597)) b!1335947))

(declare-fun m!1223895 () Bool)

(assert (=> d!143561 m!1223895))

(assert (=> d!143561 m!1223787))

(declare-fun m!1223897 () Bool)

(assert (=> d!143561 m!1223897))

(assert (=> b!1335947 m!1223787))

(declare-fun m!1223899 () Bool)

(assert (=> b!1335947 m!1223899))

(assert (=> b!1335882 d!143561))

(declare-fun d!143563 () Bool)

(declare-fun e!760838 () Bool)

(assert (=> d!143563 e!760838))

(declare-fun res!886598 () Bool)

(assert (=> d!143563 (=> res!886598 e!760838)))

(declare-fun lt!592613 () Bool)

(assert (=> d!143563 (= res!886598 (not lt!592613))))

(declare-fun lt!592614 () Bool)

(assert (=> d!143563 (= lt!592613 lt!592614)))

(declare-fun lt!592615 () Unit!43903)

(declare-fun e!760837 () Unit!43903)

(assert (=> d!143563 (= lt!592615 e!760837)))

(declare-fun c!125964 () Bool)

(assert (=> d!143563 (= c!125964 lt!592614)))

(assert (=> d!143563 (= lt!592614 (containsKey!737 (toList!10787 lt!592482) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143563 (= (contains!8950 lt!592482 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!592613)))

(declare-fun b!1335948 () Bool)

(declare-fun lt!592616 () Unit!43903)

(assert (=> b!1335948 (= e!760837 lt!592616)))

(assert (=> b!1335948 (= lt!592616 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 lt!592482) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1335948 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592482) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1335949 () Bool)

(declare-fun Unit!43909 () Unit!43903)

(assert (=> b!1335949 (= e!760837 Unit!43909)))

(declare-fun b!1335950 () Bool)

(assert (=> b!1335950 (= e!760838 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592482) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143563 c!125964) b!1335948))

(assert (= (and d!143563 (not c!125964)) b!1335949))

(assert (= (and d!143563 (not res!886598)) b!1335950))

(declare-fun m!1223901 () Bool)

(assert (=> d!143563 m!1223901))

(declare-fun m!1223903 () Bool)

(assert (=> b!1335948 m!1223903))

(assert (=> b!1335948 m!1223729))

(assert (=> b!1335948 m!1223729))

(declare-fun m!1223905 () Bool)

(assert (=> b!1335948 m!1223905))

(assert (=> b!1335950 m!1223729))

(assert (=> b!1335950 m!1223729))

(assert (=> b!1335950 m!1223905))

(assert (=> d!143521 d!143563))

(declare-fun b!1335953 () Bool)

(declare-fun e!760840 () Option!767)

(assert (=> b!1335953 (= e!760840 (getValueByKey!715 (t!45296 lt!592480) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1335951 () Bool)

(declare-fun e!760839 () Option!767)

(assert (=> b!1335951 (= e!760839 (Some!766 (_2!11954 (h!32233 lt!592480))))))

(declare-fun c!125965 () Bool)

(declare-fun d!143565 () Bool)

(assert (=> d!143565 (= c!125965 (and ((_ is Cons!31024) lt!592480) (= (_1!11954 (h!32233 lt!592480)) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143565 (= (getValueByKey!715 lt!592480 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!760839)))

(declare-fun b!1335952 () Bool)

(assert (=> b!1335952 (= e!760839 e!760840)))

(declare-fun c!125966 () Bool)

(assert (=> b!1335952 (= c!125966 (and ((_ is Cons!31024) lt!592480) (not (= (_1!11954 (h!32233 lt!592480)) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1335954 () Bool)

(assert (=> b!1335954 (= e!760840 None!765)))

(assert (= (and d!143565 c!125965) b!1335951))

(assert (= (and d!143565 (not c!125965)) b!1335952))

(assert (= (and b!1335952 c!125966) b!1335953))

(assert (= (and b!1335952 (not c!125966)) b!1335954))

(declare-fun m!1223907 () Bool)

(assert (=> b!1335953 m!1223907))

(assert (=> d!143521 d!143565))

(declare-fun d!143567 () Bool)

(assert (=> d!143567 (= (getValueByKey!715 lt!592480 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!766 (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!592617 () Unit!43903)

(assert (=> d!143567 (= lt!592617 (choose!1955 lt!592480 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!760841 () Bool)

(assert (=> d!143567 e!760841))

(declare-fun res!886599 () Bool)

(assert (=> d!143567 (=> (not res!886599) (not e!760841))))

(assert (=> d!143567 (= res!886599 (isStrictlySorted!878 lt!592480))))

(assert (=> d!143567 (= (lemmaContainsTupThenGetReturnValue!360 lt!592480 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!592617)))

(declare-fun b!1335955 () Bool)

(declare-fun res!886600 () Bool)

(assert (=> b!1335955 (=> (not res!886600) (not e!760841))))

(assert (=> b!1335955 (= res!886600 (containsKey!737 lt!592480 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1335956 () Bool)

(assert (=> b!1335956 (= e!760841 (contains!8952 lt!592480 (tuple2!23887 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143567 res!886599) b!1335955))

(assert (= (and b!1335955 res!886600) b!1335956))

(assert (=> d!143567 m!1223723))

(declare-fun m!1223909 () Bool)

(assert (=> d!143567 m!1223909))

(declare-fun m!1223911 () Bool)

(assert (=> d!143567 m!1223911))

(declare-fun m!1223913 () Bool)

(assert (=> b!1335955 m!1223913))

(declare-fun m!1223915 () Bool)

(assert (=> b!1335956 m!1223915))

(assert (=> d!143521 d!143567))

(declare-fun b!1335957 () Bool)

(declare-fun e!760843 () List!31028)

(declare-fun e!760845 () List!31028)

(assert (=> b!1335957 (= e!760843 e!760845)))

(declare-fun c!125970 () Bool)

(assert (=> b!1335957 (= c!125970 (and ((_ is Cons!31024) (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (= (_1!11954 (h!32233 (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1335958 () Bool)

(declare-fun e!760844 () List!31028)

(declare-fun call!64864 () List!31028)

(assert (=> b!1335958 (= e!760844 call!64864)))

(declare-fun c!125967 () Bool)

(declare-fun bm!64859 () Bool)

(declare-fun e!760846 () List!31028)

(declare-fun call!64862 () List!31028)

(assert (=> bm!64859 (= call!64862 ($colon$colon!670 e!760846 (ite c!125967 (h!32233 (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (tuple2!23887 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!125968 () Bool)

(assert (=> bm!64859 (= c!125968 c!125967)))

(declare-fun c!125969 () Bool)

(declare-fun b!1335959 () Bool)

(assert (=> b!1335959 (= c!125969 (and ((_ is Cons!31024) (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvsgt (_1!11954 (h!32233 (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1335959 (= e!760845 e!760844)))

(declare-fun bm!64860 () Bool)

(declare-fun call!64863 () List!31028)

(assert (=> bm!64860 (= call!64864 call!64863)))

(declare-fun b!1335960 () Bool)

(assert (=> b!1335960 (= e!760846 (ite c!125970 (t!45296 (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (ite c!125969 (Cons!31024 (h!32233 (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (t!45296 (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) Nil!31025)))))

(declare-fun b!1335961 () Bool)

(assert (=> b!1335961 (= e!760845 call!64863)))

(declare-fun bm!64861 () Bool)

(assert (=> bm!64861 (= call!64863 call!64862)))

(declare-fun b!1335962 () Bool)

(declare-fun e!760842 () Bool)

(declare-fun lt!592618 () List!31028)

(assert (=> b!1335962 (= e!760842 (contains!8952 lt!592618 (tuple2!23887 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1335963 () Bool)

(assert (=> b!1335963 (= e!760846 (insertStrictlySorted!489 (t!45296 (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1335964 () Bool)

(assert (=> b!1335964 (= e!760844 call!64864)))

(declare-fun b!1335965 () Bool)

(declare-fun res!886601 () Bool)

(assert (=> b!1335965 (=> (not res!886601) (not e!760842))))

(assert (=> b!1335965 (= res!886601 (containsKey!737 lt!592618 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1335966 () Bool)

(assert (=> b!1335966 (= e!760843 call!64862)))

(declare-fun d!143569 () Bool)

(assert (=> d!143569 e!760842))

(declare-fun res!886602 () Bool)

(assert (=> d!143569 (=> (not res!886602) (not e!760842))))

(assert (=> d!143569 (= res!886602 (isStrictlySorted!878 lt!592618))))

(assert (=> d!143569 (= lt!592618 e!760843)))

(assert (=> d!143569 (= c!125967 (and ((_ is Cons!31024) (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))) (bvslt (_1!11954 (h!32233 (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143569 (isStrictlySorted!878 (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)))))

(assert (=> d!143569 (= (insertStrictlySorted!489 (toList!10787 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!592618)))

(assert (= (and d!143569 c!125967) b!1335966))

(assert (= (and d!143569 (not c!125967)) b!1335957))

(assert (= (and b!1335957 c!125970) b!1335961))

(assert (= (and b!1335957 (not c!125970)) b!1335959))

(assert (= (and b!1335959 c!125969) b!1335958))

(assert (= (and b!1335959 (not c!125969)) b!1335964))

(assert (= (or b!1335958 b!1335964) bm!64860))

(assert (= (or b!1335961 bm!64860) bm!64861))

(assert (= (or b!1335966 bm!64861) bm!64859))

(assert (= (and bm!64859 c!125968) b!1335963))

(assert (= (and bm!64859 (not c!125968)) b!1335960))

(assert (= (and d!143569 res!886602) b!1335965))

(assert (= (and b!1335965 res!886601) b!1335962))

(declare-fun m!1223917 () Bool)

(assert (=> b!1335965 m!1223917))

(declare-fun m!1223919 () Bool)

(assert (=> d!143569 m!1223919))

(declare-fun m!1223921 () Bool)

(assert (=> d!143569 m!1223921))

(declare-fun m!1223923 () Bool)

(assert (=> b!1335962 m!1223923))

(declare-fun m!1223925 () Bool)

(assert (=> bm!64859 m!1223925))

(declare-fun m!1223927 () Bool)

(assert (=> b!1335963 m!1223927))

(assert (=> d!143521 d!143569))

(declare-fun b!1335967 () Bool)

(declare-fun e!760851 () Bool)

(declare-fun e!760849 () Bool)

(assert (=> b!1335967 (= e!760851 e!760849)))

(assert (=> b!1335967 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44342 _keys!1590)))))

(declare-fun lt!592624 () ListLongMap!21543)

(declare-fun res!886604 () Bool)

(assert (=> b!1335967 (= res!886604 (contains!8950 lt!592624 (select (arr!43792 _keys!1590) from!1980)))))

(assert (=> b!1335967 (=> (not res!886604) (not e!760849))))

(declare-fun b!1335968 () Bool)

(declare-fun res!886605 () Bool)

(declare-fun e!760853 () Bool)

(assert (=> b!1335968 (=> (not res!886605) (not e!760853))))

(assert (=> b!1335968 (= res!886605 (not (contains!8950 lt!592624 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335969 () Bool)

(assert (=> b!1335969 (= e!760853 e!760851)))

(declare-fun c!125971 () Bool)

(declare-fun e!760847 () Bool)

(assert (=> b!1335969 (= c!125971 e!760847)))

(declare-fun res!886606 () Bool)

(assert (=> b!1335969 (=> (not res!886606) (not e!760847))))

(assert (=> b!1335969 (= res!886606 (bvslt from!1980 (size!44342 _keys!1590)))))

(declare-fun b!1335970 () Bool)

(declare-fun e!760852 () Bool)

(assert (=> b!1335970 (= e!760852 (= lt!592624 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1335971 () Bool)

(declare-fun e!760848 () ListLongMap!21543)

(declare-fun e!760850 () ListLongMap!21543)

(assert (=> b!1335971 (= e!760848 e!760850)))

(declare-fun c!125974 () Bool)

(assert (=> b!1335971 (= c!125974 (validKeyInArray!0 (select (arr!43792 _keys!1590) from!1980)))))

(declare-fun b!1335972 () Bool)

(declare-fun lt!592619 () Unit!43903)

(declare-fun lt!592620 () Unit!43903)

(assert (=> b!1335972 (= lt!592619 lt!592620)))

(declare-fun lt!592625 () ListLongMap!21543)

(declare-fun lt!592622 () (_ BitVec 64))

(declare-fun lt!592621 () V!54299)

(declare-fun lt!592623 () (_ BitVec 64))

(assert (=> b!1335972 (not (contains!8950 (+!4730 lt!592625 (tuple2!23887 lt!592622 lt!592621)) lt!592623))))

(assert (=> b!1335972 (= lt!592620 (addStillNotContains!496 lt!592625 lt!592622 lt!592621 lt!592623))))

(assert (=> b!1335972 (= lt!592623 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1335972 (= lt!592621 (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1335972 (= lt!592622 (select (arr!43792 _keys!1590) from!1980))))

(declare-fun call!64865 () ListLongMap!21543)

(assert (=> b!1335972 (= lt!592625 call!64865)))

(assert (=> b!1335972 (= e!760850 (+!4730 call!64865 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1335973 () Bool)

(assert (=> b!1335973 (= e!760852 (isEmpty!1081 lt!592624))))

(declare-fun b!1335974 () Bool)

(assert (=> b!1335974 (= e!760851 e!760852)))

(declare-fun c!125972 () Bool)

(assert (=> b!1335974 (= c!125972 (bvslt from!1980 (size!44342 _keys!1590)))))

(declare-fun bm!64862 () Bool)

(assert (=> bm!64862 (= call!64865 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1335975 () Bool)

(assert (=> b!1335975 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44342 _keys!1590)))))

(assert (=> b!1335975 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44343 _values!1320)))))

(assert (=> b!1335975 (= e!760849 (= (apply!1032 lt!592624 (select (arr!43792 _keys!1590) from!1980)) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335976 () Bool)

(assert (=> b!1335976 (= e!760850 call!64865)))

(declare-fun d!143571 () Bool)

(assert (=> d!143571 e!760853))

(declare-fun res!886603 () Bool)

(assert (=> d!143571 (=> (not res!886603) (not e!760853))))

(assert (=> d!143571 (= res!886603 (not (contains!8950 lt!592624 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143571 (= lt!592624 e!760848)))

(declare-fun c!125973 () Bool)

(assert (=> d!143571 (= c!125973 (bvsge from!1980 (size!44342 _keys!1590)))))

(assert (=> d!143571 (validMask!0 mask!1998)))

(assert (=> d!143571 (= (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!592624)))

(declare-fun b!1335977 () Bool)

(assert (=> b!1335977 (= e!760847 (validKeyInArray!0 (select (arr!43792 _keys!1590) from!1980)))))

(assert (=> b!1335977 (bvsge from!1980 #b00000000000000000000000000000000)))

(declare-fun b!1335978 () Bool)

(assert (=> b!1335978 (= e!760848 (ListLongMap!21544 Nil!31025))))

(assert (= (and d!143571 c!125973) b!1335978))

(assert (= (and d!143571 (not c!125973)) b!1335971))

(assert (= (and b!1335971 c!125974) b!1335972))

(assert (= (and b!1335971 (not c!125974)) b!1335976))

(assert (= (or b!1335972 b!1335976) bm!64862))

(assert (= (and d!143571 res!886603) b!1335968))

(assert (= (and b!1335968 res!886605) b!1335969))

(assert (= (and b!1335969 res!886606) b!1335977))

(assert (= (and b!1335969 c!125971) b!1335967))

(assert (= (and b!1335969 (not c!125971)) b!1335974))

(assert (= (and b!1335967 res!886604) b!1335975))

(assert (= (and b!1335974 c!125972) b!1335970))

(assert (= (and b!1335974 (not c!125972)) b!1335973))

(declare-fun b_lambda!24133 () Bool)

(assert (=> (not b_lambda!24133) (not b!1335972)))

(assert (=> b!1335972 t!45295))

(declare-fun b_and!49911 () Bool)

(assert (= b_and!49909 (and (=> t!45295 result!25213) b_and!49911)))

(declare-fun b_lambda!24135 () Bool)

(assert (=> (not b_lambda!24135) (not b!1335975)))

(assert (=> b!1335975 t!45295))

(declare-fun b_and!49913 () Bool)

(assert (= b_and!49911 (and (=> t!45295 result!25213) b_and!49913)))

(declare-fun m!1223929 () Bool)

(assert (=> bm!64862 m!1223929))

(assert (=> b!1335975 m!1223653))

(assert (=> b!1335975 m!1223653))

(declare-fun m!1223931 () Bool)

(assert (=> b!1335975 m!1223931))

(assert (=> b!1335975 m!1223669))

(assert (=> b!1335975 m!1223669))

(assert (=> b!1335975 m!1223671))

(assert (=> b!1335975 m!1223673))

(assert (=> b!1335975 m!1223671))

(declare-fun m!1223933 () Bool)

(assert (=> d!143571 m!1223933))

(assert (=> d!143571 m!1223659))

(declare-fun m!1223935 () Bool)

(assert (=> b!1335968 m!1223935))

(declare-fun m!1223937 () Bool)

(assert (=> b!1335973 m!1223937))

(assert (=> b!1335967 m!1223653))

(assert (=> b!1335967 m!1223653))

(declare-fun m!1223939 () Bool)

(assert (=> b!1335967 m!1223939))

(assert (=> b!1335977 m!1223653))

(assert (=> b!1335977 m!1223653))

(assert (=> b!1335977 m!1223655))

(assert (=> b!1335972 m!1223653))

(declare-fun m!1223941 () Bool)

(assert (=> b!1335972 m!1223941))

(assert (=> b!1335972 m!1223669))

(declare-fun m!1223943 () Bool)

(assert (=> b!1335972 m!1223943))

(assert (=> b!1335972 m!1223669))

(assert (=> b!1335972 m!1223671))

(assert (=> b!1335972 m!1223673))

(assert (=> b!1335972 m!1223671))

(declare-fun m!1223945 () Bool)

(assert (=> b!1335972 m!1223945))

(declare-fun m!1223947 () Bool)

(assert (=> b!1335972 m!1223947))

(assert (=> b!1335972 m!1223945))

(assert (=> b!1335970 m!1223929))

(assert (=> b!1335971 m!1223653))

(assert (=> b!1335971 m!1223653))

(assert (=> b!1335971 m!1223655))

(assert (=> bm!64841 d!143571))

(declare-fun d!143573 () Bool)

(declare-fun e!760855 () Bool)

(assert (=> d!143573 e!760855))

(declare-fun res!886607 () Bool)

(assert (=> d!143573 (=> res!886607 e!760855)))

(declare-fun lt!592626 () Bool)

(assert (=> d!143573 (= res!886607 (not lt!592626))))

(declare-fun lt!592627 () Bool)

(assert (=> d!143573 (= lt!592626 lt!592627)))

(declare-fun lt!592628 () Unit!43903)

(declare-fun e!760854 () Unit!43903)

(assert (=> d!143573 (= lt!592628 e!760854)))

(declare-fun c!125975 () Bool)

(assert (=> d!143573 (= c!125975 lt!592627)))

(assert (=> d!143573 (= lt!592627 (containsKey!737 (toList!10787 lt!592507) (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> d!143573 (= (contains!8950 lt!592507 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) lt!592626)))

(declare-fun b!1335979 () Bool)

(declare-fun lt!592629 () Unit!43903)

(assert (=> b!1335979 (= e!760854 lt!592629)))

(assert (=> b!1335979 (= lt!592629 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 lt!592507) (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1335979 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592507) (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1335980 () Bool)

(declare-fun Unit!43910 () Unit!43903)

(assert (=> b!1335980 (= e!760854 Unit!43910)))

(declare-fun b!1335981 () Bool)

(assert (=> b!1335981 (= e!760855 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592507) (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(assert (= (and d!143573 c!125975) b!1335979))

(assert (= (and d!143573 (not c!125975)) b!1335980))

(assert (= (and d!143573 (not res!886607)) b!1335981))

(assert (=> d!143573 m!1223747))

(declare-fun m!1223949 () Bool)

(assert (=> d!143573 m!1223949))

(assert (=> b!1335979 m!1223747))

(declare-fun m!1223951 () Bool)

(assert (=> b!1335979 m!1223951))

(assert (=> b!1335979 m!1223747))

(declare-fun m!1223953 () Bool)

(assert (=> b!1335979 m!1223953))

(assert (=> b!1335979 m!1223953))

(declare-fun m!1223955 () Bool)

(assert (=> b!1335979 m!1223955))

(assert (=> b!1335981 m!1223747))

(assert (=> b!1335981 m!1223953))

(assert (=> b!1335981 m!1223953))

(assert (=> b!1335981 m!1223955))

(assert (=> b!1335763 d!143573))

(declare-fun d!143575 () Bool)

(declare-fun e!760857 () Bool)

(assert (=> d!143575 e!760857))

(declare-fun res!886608 () Bool)

(assert (=> d!143575 (=> res!886608 e!760857)))

(declare-fun lt!592630 () Bool)

(assert (=> d!143575 (= res!886608 (not lt!592630))))

(declare-fun lt!592631 () Bool)

(assert (=> d!143575 (= lt!592630 lt!592631)))

(declare-fun lt!592632 () Unit!43903)

(declare-fun e!760856 () Unit!43903)

(assert (=> d!143575 (= lt!592632 e!760856)))

(declare-fun c!125976 () Bool)

(assert (=> d!143575 (= c!125976 lt!592631)))

(assert (=> d!143575 (= lt!592631 (containsKey!737 (toList!10787 lt!592507) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143575 (= (contains!8950 lt!592507 #b0000000000000000000000000000000000000000000000000000000000000000) lt!592630)))

(declare-fun b!1335982 () Bool)

(declare-fun lt!592633 () Unit!43903)

(assert (=> b!1335982 (= e!760856 lt!592633)))

(assert (=> b!1335982 (= lt!592633 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 lt!592507) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1335982 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592507) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1335983 () Bool)

(declare-fun Unit!43911 () Unit!43903)

(assert (=> b!1335983 (= e!760856 Unit!43911)))

(declare-fun b!1335984 () Bool)

(assert (=> b!1335984 (= e!760857 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592507) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143575 c!125976) b!1335982))

(assert (= (and d!143575 (not c!125976)) b!1335983))

(assert (= (and d!143575 (not res!886608)) b!1335984))

(declare-fun m!1223957 () Bool)

(assert (=> d!143575 m!1223957))

(declare-fun m!1223959 () Bool)

(assert (=> b!1335982 m!1223959))

(declare-fun m!1223961 () Bool)

(assert (=> b!1335982 m!1223961))

(assert (=> b!1335982 m!1223961))

(declare-fun m!1223963 () Bool)

(assert (=> b!1335982 m!1223963))

(assert (=> b!1335984 m!1223961))

(assert (=> b!1335984 m!1223961))

(assert (=> b!1335984 m!1223963))

(assert (=> d!143525 d!143575))

(assert (=> d!143525 d!143531))

(declare-fun d!143577 () Bool)

(declare-fun isEmpty!1082 (Option!767) Bool)

(assert (=> d!143577 (= (isDefined!522 (getValueByKey!715 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)) (not (isEmpty!1082 (getValueByKey!715 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))))

(declare-fun bs!38249 () Bool)

(assert (= bs!38249 d!143577))

(assert (=> bs!38249 m!1223801))

(declare-fun m!1223965 () Bool)

(assert (=> bs!38249 m!1223965))

(assert (=> b!1335804 d!143577))

(declare-fun e!760859 () Option!767)

(declare-fun b!1335987 () Bool)

(assert (=> b!1335987 (= e!760859 (getValueByKey!715 (t!45296 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(declare-fun b!1335985 () Bool)

(declare-fun e!760858 () Option!767)

(assert (=> b!1335985 (= e!760858 (Some!766 (_2!11954 (h!32233 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))))

(declare-fun c!125977 () Bool)

(declare-fun d!143579 () Bool)

(assert (=> d!143579 (= c!125977 (and ((_ is Cons!31024) (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!11954 (h!32233 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143579 (= (getValueByKey!715 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!760858)))

(declare-fun b!1335986 () Bool)

(assert (=> b!1335986 (= e!760858 e!760859)))

(declare-fun c!125978 () Bool)

(assert (=> b!1335986 (= c!125978 (and ((_ is Cons!31024) (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (not (= (_1!11954 (h!32233 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153))))))

(declare-fun b!1335988 () Bool)

(assert (=> b!1335988 (= e!760859 None!765)))

(assert (= (and d!143579 c!125977) b!1335985))

(assert (= (and d!143579 (not c!125977)) b!1335986))

(assert (= (and b!1335986 c!125978) b!1335987))

(assert (= (and b!1335986 (not c!125978)) b!1335988))

(declare-fun m!1223967 () Bool)

(assert (=> b!1335987 m!1223967))

(assert (=> b!1335804 d!143579))

(declare-fun d!143581 () Bool)

(assert (=> d!143581 (isDefined!522 (getValueByKey!715 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun lt!592636 () Unit!43903)

(declare-fun choose!1956 (List!31028 (_ BitVec 64)) Unit!43903)

(assert (=> d!143581 (= lt!592636 (choose!1956 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun e!760862 () Bool)

(assert (=> d!143581 e!760862))

(declare-fun res!886611 () Bool)

(assert (=> d!143581 (=> (not res!886611) (not e!760862))))

(assert (=> d!143581 (= res!886611 (isStrictlySorted!878 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143581 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153) lt!592636)))

(declare-fun b!1335991 () Bool)

(assert (=> b!1335991 (= e!760862 (containsKey!737 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (= (and d!143581 res!886611) b!1335991))

(assert (=> d!143581 m!1223781))

(assert (=> d!143581 m!1223781))

(assert (=> d!143581 m!1223783))

(declare-fun m!1223969 () Bool)

(assert (=> d!143581 m!1223969))

(declare-fun m!1223971 () Bool)

(assert (=> d!143581 m!1223971))

(assert (=> b!1335991 m!1223777))

(assert (=> b!1335787 d!143581))

(declare-fun d!143583 () Bool)

(assert (=> d!143583 (= (isDefined!522 (getValueByKey!715 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153)) (not (isEmpty!1082 (getValueByKey!715 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))))

(declare-fun bs!38250 () Bool)

(assert (= bs!38250 d!143583))

(assert (=> bs!38250 m!1223781))

(declare-fun m!1223973 () Bool)

(assert (=> bs!38250 m!1223973))

(assert (=> b!1335787 d!143583))

(declare-fun b!1335994 () Bool)

(declare-fun e!760864 () Option!767)

(assert (=> b!1335994 (= e!760864 (getValueByKey!715 (t!45296 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) k0!1153))))

(declare-fun e!760863 () Option!767)

(declare-fun b!1335992 () Bool)

(assert (=> b!1335992 (= e!760863 (Some!766 (_2!11954 (h!32233 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))))

(declare-fun d!143585 () Bool)

(declare-fun c!125979 () Bool)

(assert (=> d!143585 (= c!125979 (and ((_ is Cons!31024) (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (= (_1!11954 (h!32233 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)))))

(assert (=> d!143585 (= (getValueByKey!715 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153) e!760863)))

(declare-fun b!1335993 () Bool)

(assert (=> b!1335993 (= e!760863 e!760864)))

(declare-fun c!125980 () Bool)

(assert (=> b!1335993 (= c!125980 (and ((_ is Cons!31024) (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (not (= (_1!11954 (h!32233 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153))))))

(declare-fun b!1335995 () Bool)

(assert (=> b!1335995 (= e!760864 None!765)))

(assert (= (and d!143585 c!125979) b!1335992))

(assert (= (and d!143585 (not c!125979)) b!1335993))

(assert (= (and b!1335993 c!125980) b!1335994))

(assert (= (and b!1335993 (not c!125980)) b!1335995))

(declare-fun m!1223975 () Bool)

(assert (=> b!1335994 m!1223975))

(assert (=> b!1335787 d!143585))

(declare-fun d!143587 () Bool)

(assert (=> d!143587 (isDefined!522 (getValueByKey!715 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun lt!592637 () Unit!43903)

(assert (=> d!143587 (= lt!592637 (choose!1956 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun e!760865 () Bool)

(assert (=> d!143587 e!760865))

(declare-fun res!886612 () Bool)

(assert (=> d!143587 (=> (not res!886612) (not e!760865))))

(assert (=> d!143587 (= res!886612 (isStrictlySorted!878 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))))

(assert (=> d!143587 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) lt!592637)))

(declare-fun b!1335996 () Bool)

(assert (=> b!1335996 (= e!760865 (containsKey!737 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (= (and d!143587 res!886612) b!1335996))

(assert (=> d!143587 m!1223801))

(assert (=> d!143587 m!1223801))

(assert (=> d!143587 m!1223803))

(declare-fun m!1223977 () Bool)

(assert (=> d!143587 m!1223977))

(declare-fun m!1223979 () Bool)

(assert (=> d!143587 m!1223979))

(assert (=> b!1335996 m!1223797))

(assert (=> b!1335802 d!143587))

(assert (=> b!1335802 d!143577))

(assert (=> b!1335802 d!143579))

(declare-fun d!143589 () Bool)

(assert (=> d!143589 (= (apply!1032 lt!592580 (select (arr!43792 _keys!1590) from!1980)) (get!22092 (getValueByKey!715 (toList!10787 lt!592580) (select (arr!43792 _keys!1590) from!1980))))))

(declare-fun bs!38251 () Bool)

(assert (= bs!38251 d!143589))

(assert (=> bs!38251 m!1223653))

(declare-fun m!1223981 () Bool)

(assert (=> bs!38251 m!1223981))

(assert (=> bs!38251 m!1223981))

(declare-fun m!1223983 () Bool)

(assert (=> bs!38251 m!1223983))

(assert (=> b!1335867 d!143589))

(assert (=> b!1335867 d!143527))

(declare-fun d!143591 () Bool)

(declare-fun e!760867 () Bool)

(assert (=> d!143591 e!760867))

(declare-fun res!886613 () Bool)

(assert (=> d!143591 (=> res!886613 e!760867)))

(declare-fun lt!592638 () Bool)

(assert (=> d!143591 (= res!886613 (not lt!592638))))

(declare-fun lt!592639 () Bool)

(assert (=> d!143591 (= lt!592638 lt!592639)))

(declare-fun lt!592640 () Unit!43903)

(declare-fun e!760866 () Unit!43903)

(assert (=> d!143591 (= lt!592640 e!760866)))

(declare-fun c!125981 () Bool)

(assert (=> d!143591 (= c!125981 lt!592639)))

(assert (=> d!143591 (= lt!592639 (containsKey!737 (toList!10787 lt!592580) (select (arr!43792 _keys!1590) from!1980)))))

(assert (=> d!143591 (= (contains!8950 lt!592580 (select (arr!43792 _keys!1590) from!1980)) lt!592638)))

(declare-fun b!1335997 () Bool)

(declare-fun lt!592641 () Unit!43903)

(assert (=> b!1335997 (= e!760866 lt!592641)))

(assert (=> b!1335997 (= lt!592641 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 lt!592580) (select (arr!43792 _keys!1590) from!1980)))))

(assert (=> b!1335997 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592580) (select (arr!43792 _keys!1590) from!1980)))))

(declare-fun b!1335998 () Bool)

(declare-fun Unit!43912 () Unit!43903)

(assert (=> b!1335998 (= e!760866 Unit!43912)))

(declare-fun b!1335999 () Bool)

(assert (=> b!1335999 (= e!760867 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592580) (select (arr!43792 _keys!1590) from!1980))))))

(assert (= (and d!143591 c!125981) b!1335997))

(assert (= (and d!143591 (not c!125981)) b!1335998))

(assert (= (and d!143591 (not res!886613)) b!1335999))

(assert (=> d!143591 m!1223653))

(declare-fun m!1223985 () Bool)

(assert (=> d!143591 m!1223985))

(assert (=> b!1335997 m!1223653))

(declare-fun m!1223987 () Bool)

(assert (=> b!1335997 m!1223987))

(assert (=> b!1335997 m!1223653))

(assert (=> b!1335997 m!1223981))

(assert (=> b!1335997 m!1223981))

(declare-fun m!1223989 () Bool)

(assert (=> b!1335997 m!1223989))

(assert (=> b!1335999 m!1223653))

(assert (=> b!1335999 m!1223981))

(assert (=> b!1335999 m!1223981))

(assert (=> b!1335999 m!1223989))

(assert (=> b!1335851 d!143591))

(assert (=> b!1335789 d!143583))

(assert (=> b!1335789 d!143585))

(declare-fun b!1336000 () Bool)

(declare-fun e!760872 () Bool)

(declare-fun e!760870 () Bool)

(assert (=> b!1336000 (= e!760872 e!760870)))

(assert (=> b!1336000 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44342 _keys!1590)))))

(declare-fun lt!592647 () ListLongMap!21543)

(declare-fun res!886615 () Bool)

(assert (=> b!1336000 (= res!886615 (contains!8950 lt!592647 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1336000 (=> (not res!886615) (not e!760870))))

(declare-fun b!1336001 () Bool)

(declare-fun res!886616 () Bool)

(declare-fun e!760874 () Bool)

(assert (=> b!1336001 (=> (not res!886616) (not e!760874))))

(assert (=> b!1336001 (= res!886616 (not (contains!8950 lt!592647 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1336002 () Bool)

(assert (=> b!1336002 (= e!760874 e!760872)))

(declare-fun c!125982 () Bool)

(declare-fun e!760868 () Bool)

(assert (=> b!1336002 (= c!125982 e!760868)))

(declare-fun res!886617 () Bool)

(assert (=> b!1336002 (=> (not res!886617) (not e!760868))))

(assert (=> b!1336002 (= res!886617 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44342 _keys!1590)))))

(declare-fun b!1336003 () Bool)

(declare-fun e!760873 () Bool)

(assert (=> b!1336003 (= e!760873 (= lt!592647 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun b!1336004 () Bool)

(declare-fun e!760869 () ListLongMap!21543)

(declare-fun e!760871 () ListLongMap!21543)

(assert (=> b!1336004 (= e!760869 e!760871)))

(declare-fun c!125985 () Bool)

(assert (=> b!1336004 (= c!125985 (validKeyInArray!0 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(declare-fun b!1336005 () Bool)

(declare-fun lt!592642 () Unit!43903)

(declare-fun lt!592643 () Unit!43903)

(assert (=> b!1336005 (= lt!592642 lt!592643)))

(declare-fun lt!592646 () (_ BitVec 64))

(declare-fun lt!592648 () ListLongMap!21543)

(declare-fun lt!592644 () V!54299)

(declare-fun lt!592645 () (_ BitVec 64))

(assert (=> b!1336005 (not (contains!8950 (+!4730 lt!592648 (tuple2!23887 lt!592645 lt!592644)) lt!592646))))

(assert (=> b!1336005 (= lt!592643 (addStillNotContains!496 lt!592648 lt!592645 lt!592644 lt!592646))))

(assert (=> b!1336005 (= lt!592646 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1336005 (= lt!592644 (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1336005 (= lt!592645 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)))))

(declare-fun call!64866 () ListLongMap!21543)

(assert (=> b!1336005 (= lt!592648 call!64866)))

(assert (=> b!1336005 (= e!760871 (+!4730 call!64866 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336006 () Bool)

(assert (=> b!1336006 (= e!760873 (isEmpty!1081 lt!592647))))

(declare-fun b!1336007 () Bool)

(assert (=> b!1336007 (= e!760872 e!760873)))

(declare-fun c!125983 () Bool)

(assert (=> b!1336007 (= c!125983 (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44342 _keys!1590)))))

(declare-fun bm!64863 () Bool)

(assert (=> bm!64863 (= call!64866 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1336008 () Bool)

(assert (=> b!1336008 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44342 _keys!1590)))))

(assert (=> b!1336008 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44343 _values!1320)))))

(assert (=> b!1336008 (= e!760870 (= (apply!1032 lt!592647 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336009 () Bool)

(assert (=> b!1336009 (= e!760871 call!64866)))

(declare-fun d!143593 () Bool)

(assert (=> d!143593 e!760874))

(declare-fun res!886614 () Bool)

(assert (=> d!143593 (=> (not res!886614) (not e!760874))))

(assert (=> d!143593 (= res!886614 (not (contains!8950 lt!592647 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143593 (= lt!592647 e!760869)))

(declare-fun c!125984 () Bool)

(assert (=> d!143593 (= c!125984 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) (size!44342 _keys!1590)))))

(assert (=> d!143593 (validMask!0 mask!1998)))

(assert (=> d!143593 (= (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323) lt!592647)))

(declare-fun b!1336010 () Bool)

(assert (=> b!1336010 (= e!760868 (validKeyInArray!0 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001))))))

(assert (=> b!1336010 (bvsge (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1336011 () Bool)

(assert (=> b!1336011 (= e!760869 (ListLongMap!21544 Nil!31025))))

(assert (= (and d!143593 c!125984) b!1336011))

(assert (= (and d!143593 (not c!125984)) b!1336004))

(assert (= (and b!1336004 c!125985) b!1336005))

(assert (= (and b!1336004 (not c!125985)) b!1336009))

(assert (= (or b!1336005 b!1336009) bm!64863))

(assert (= (and d!143593 res!886614) b!1336001))

(assert (= (and b!1336001 res!886616) b!1336002))

(assert (= (and b!1336002 res!886617) b!1336010))

(assert (= (and b!1336002 c!125982) b!1336000))

(assert (= (and b!1336002 (not c!125982)) b!1336007))

(assert (= (and b!1336000 res!886615) b!1336008))

(assert (= (and b!1336007 c!125983) b!1336003))

(assert (= (and b!1336007 (not c!125983)) b!1336006))

(declare-fun b_lambda!24137 () Bool)

(assert (=> (not b_lambda!24137) (not b!1336005)))

(assert (=> b!1336005 t!45295))

(declare-fun b_and!49915 () Bool)

(assert (= b_and!49913 (and (=> t!45295 result!25213) b_and!49915)))

(declare-fun b_lambda!24139 () Bool)

(assert (=> (not b_lambda!24139) (not b!1336008)))

(assert (=> b!1336008 t!45295))

(declare-fun b_and!49917 () Bool)

(assert (= b_and!49915 (and (=> t!45295 result!25213) b_and!49917)))

(declare-fun m!1223991 () Bool)

(assert (=> bm!64863 m!1223991))

(declare-fun m!1223993 () Bool)

(assert (=> b!1336008 m!1223993))

(assert (=> b!1336008 m!1223993))

(declare-fun m!1223995 () Bool)

(assert (=> b!1336008 m!1223995))

(declare-fun m!1223997 () Bool)

(assert (=> b!1336008 m!1223997))

(assert (=> b!1336008 m!1223997))

(assert (=> b!1336008 m!1223671))

(declare-fun m!1223999 () Bool)

(assert (=> b!1336008 m!1223999))

(assert (=> b!1336008 m!1223671))

(declare-fun m!1224001 () Bool)

(assert (=> d!143593 m!1224001))

(assert (=> d!143593 m!1223659))

(declare-fun m!1224003 () Bool)

(assert (=> b!1336001 m!1224003))

(declare-fun m!1224005 () Bool)

(assert (=> b!1336006 m!1224005))

(assert (=> b!1336000 m!1223993))

(assert (=> b!1336000 m!1223993))

(declare-fun m!1224007 () Bool)

(assert (=> b!1336000 m!1224007))

(assert (=> b!1336010 m!1223993))

(assert (=> b!1336010 m!1223993))

(declare-fun m!1224009 () Bool)

(assert (=> b!1336010 m!1224009))

(assert (=> b!1336005 m!1223993))

(declare-fun m!1224011 () Bool)

(assert (=> b!1336005 m!1224011))

(assert (=> b!1336005 m!1223997))

(declare-fun m!1224013 () Bool)

(assert (=> b!1336005 m!1224013))

(assert (=> b!1336005 m!1223997))

(assert (=> b!1336005 m!1223671))

(assert (=> b!1336005 m!1223999))

(assert (=> b!1336005 m!1223671))

(declare-fun m!1224015 () Bool)

(assert (=> b!1336005 m!1224015))

(declare-fun m!1224017 () Bool)

(assert (=> b!1336005 m!1224017))

(assert (=> b!1336005 m!1224015))

(assert (=> b!1336003 m!1223991))

(assert (=> b!1336004 m!1223993))

(assert (=> b!1336004 m!1223993))

(assert (=> b!1336004 m!1224009))

(assert (=> b!1335766 d!143593))

(declare-fun d!143595 () Bool)

(declare-fun e!760876 () Bool)

(assert (=> d!143595 e!760876))

(declare-fun res!886618 () Bool)

(assert (=> d!143595 (=> res!886618 e!760876)))

(declare-fun lt!592649 () Bool)

(assert (=> d!143595 (= res!886618 (not lt!592649))))

(declare-fun lt!592650 () Bool)

(assert (=> d!143595 (= lt!592649 lt!592650)))

(declare-fun lt!592651 () Unit!43903)

(declare-fun e!760875 () Unit!43903)

(assert (=> d!143595 (= lt!592651 e!760875)))

(declare-fun c!125986 () Bool)

(assert (=> d!143595 (= c!125986 lt!592650)))

(assert (=> d!143595 (= lt!592650 (containsKey!737 (toList!10787 lt!592507) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143595 (= (contains!8950 lt!592507 #b1000000000000000000000000000000000000000000000000000000000000000) lt!592649)))

(declare-fun b!1336012 () Bool)

(declare-fun lt!592652 () Unit!43903)

(assert (=> b!1336012 (= e!760875 lt!592652)))

(assert (=> b!1336012 (= lt!592652 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 lt!592507) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1336012 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592507) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1336013 () Bool)

(declare-fun Unit!43913 () Unit!43903)

(assert (=> b!1336013 (= e!760875 Unit!43913)))

(declare-fun b!1336014 () Bool)

(assert (=> b!1336014 (= e!760876 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592507) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143595 c!125986) b!1336012))

(assert (= (and d!143595 (not c!125986)) b!1336013))

(assert (= (and d!143595 (not res!886618)) b!1336014))

(declare-fun m!1224019 () Bool)

(assert (=> d!143595 m!1224019))

(declare-fun m!1224021 () Bool)

(assert (=> b!1336012 m!1224021))

(declare-fun m!1224023 () Bool)

(assert (=> b!1336012 m!1224023))

(assert (=> b!1336012 m!1224023))

(declare-fun m!1224025 () Bool)

(assert (=> b!1336012 m!1224025))

(assert (=> b!1336014 m!1224023))

(assert (=> b!1336014 m!1224023))

(assert (=> b!1336014 m!1224025))

(assert (=> b!1335764 d!143595))

(declare-fun d!143597 () Bool)

(assert (=> d!143597 (= (get!22090 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21160 (select (arr!43793 _values!1320) from!1980)))))

(assert (=> b!1335779 d!143597))

(declare-fun d!143599 () Bool)

(assert (=> d!143599 (= (get!22091 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1335780 d!143599))

(declare-fun lt!592655 () Bool)

(declare-fun d!143601 () Bool)

(declare-fun content!658 (List!31028) (InoxSet tuple2!23886))

(assert (=> d!143601 (= lt!592655 (select (content!658 (toList!10787 lt!592482)) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!760882 () Bool)

(assert (=> d!143601 (= lt!592655 e!760882)))

(declare-fun res!886624 () Bool)

(assert (=> d!143601 (=> (not res!886624) (not e!760882))))

(assert (=> d!143601 (= res!886624 ((_ is Cons!31024) (toList!10787 lt!592482)))))

(assert (=> d!143601 (= (contains!8952 (toList!10787 lt!592482) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!592655)))

(declare-fun b!1336019 () Bool)

(declare-fun e!760881 () Bool)

(assert (=> b!1336019 (= e!760882 e!760881)))

(declare-fun res!886623 () Bool)

(assert (=> b!1336019 (=> res!886623 e!760881)))

(assert (=> b!1336019 (= res!886623 (= (h!32233 (toList!10787 lt!592482)) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336020 () Bool)

(assert (=> b!1336020 (= e!760881 (contains!8952 (t!45296 (toList!10787 lt!592482)) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143601 res!886624) b!1336019))

(assert (= (and b!1336019 (not res!886623)) b!1336020))

(declare-fun m!1224027 () Bool)

(assert (=> d!143601 m!1224027))

(declare-fun m!1224029 () Bool)

(assert (=> d!143601 m!1224029))

(declare-fun m!1224031 () Bool)

(assert (=> b!1336020 m!1224031))

(assert (=> b!1335736 d!143601))

(declare-fun d!143603 () Bool)

(assert (=> d!143603 (not (contains!8950 (+!4730 lt!592508 (tuple2!23887 lt!592505 lt!592504)) lt!592506))))

(declare-fun lt!592658 () Unit!43903)

(declare-fun choose!1957 (ListLongMap!21543 (_ BitVec 64) V!54299 (_ BitVec 64)) Unit!43903)

(assert (=> d!143603 (= lt!592658 (choose!1957 lt!592508 lt!592505 lt!592504 lt!592506))))

(declare-fun e!760885 () Bool)

(assert (=> d!143603 e!760885))

(declare-fun res!886627 () Bool)

(assert (=> d!143603 (=> (not res!886627) (not e!760885))))

(assert (=> d!143603 (= res!886627 (not (contains!8950 lt!592508 lt!592506)))))

(assert (=> d!143603 (= (addStillNotContains!496 lt!592508 lt!592505 lt!592504 lt!592506) lt!592658)))

(declare-fun b!1336024 () Bool)

(assert (=> b!1336024 (= e!760885 (not (= lt!592505 lt!592506)))))

(assert (= (and d!143603 res!886627) b!1336024))

(assert (=> d!143603 m!1223769))

(assert (=> d!143603 m!1223769))

(assert (=> d!143603 m!1223771))

(declare-fun m!1224033 () Bool)

(assert (=> d!143603 m!1224033))

(declare-fun m!1224035 () Bool)

(assert (=> d!143603 m!1224035))

(assert (=> b!1335768 d!143603))

(declare-fun d!143605 () Bool)

(declare-fun e!760886 () Bool)

(assert (=> d!143605 e!760886))

(declare-fun res!886628 () Bool)

(assert (=> d!143605 (=> (not res!886628) (not e!760886))))

(declare-fun lt!592661 () ListLongMap!21543)

(assert (=> d!143605 (= res!886628 (contains!8950 lt!592661 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!592659 () List!31028)

(assert (=> d!143605 (= lt!592661 (ListLongMap!21544 lt!592659))))

(declare-fun lt!592662 () Unit!43903)

(declare-fun lt!592660 () Unit!43903)

(assert (=> d!143605 (= lt!592662 lt!592660)))

(assert (=> d!143605 (= (getValueByKey!715 lt!592659 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!766 (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143605 (= lt!592660 (lemmaContainsTupThenGetReturnValue!360 lt!592659 (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143605 (= lt!592659 (insertStrictlySorted!489 (toList!10787 call!64825) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143605 (= (+!4730 call!64825 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!592661)))

(declare-fun b!1336025 () Bool)

(declare-fun res!886629 () Bool)

(assert (=> b!1336025 (=> (not res!886629) (not e!760886))))

(assert (=> b!1336025 (= res!886629 (= (getValueByKey!715 (toList!10787 lt!592661) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!766 (_2!11954 (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1336026 () Bool)

(assert (=> b!1336026 (= e!760886 (contains!8952 (toList!10787 lt!592661) (tuple2!23887 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143605 res!886628) b!1336025))

(assert (= (and b!1336025 res!886629) b!1336026))

(declare-fun m!1224037 () Bool)

(assert (=> d!143605 m!1224037))

(declare-fun m!1224039 () Bool)

(assert (=> d!143605 m!1224039))

(declare-fun m!1224041 () Bool)

(assert (=> d!143605 m!1224041))

(declare-fun m!1224043 () Bool)

(assert (=> d!143605 m!1224043))

(declare-fun m!1224045 () Bool)

(assert (=> b!1336025 m!1224045))

(declare-fun m!1224047 () Bool)

(assert (=> b!1336026 m!1224047))

(assert (=> b!1335768 d!143605))

(declare-fun d!143607 () Bool)

(declare-fun c!125987 () Bool)

(assert (=> d!143607 (= c!125987 ((_ is ValueCellFull!17550) (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun e!760887 () V!54299)

(assert (=> d!143607 (= (get!22088 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!760887)))

(declare-fun b!1336027 () Bool)

(assert (=> b!1336027 (= e!760887 (get!22090 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1336028 () Bool)

(assert (=> b!1336028 (= e!760887 (get!22091 (select (arr!43793 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143607 c!125987) b!1336027))

(assert (= (and d!143607 (not c!125987)) b!1336028))

(assert (=> b!1336027 m!1223751))

(assert (=> b!1336027 m!1223671))

(declare-fun m!1224049 () Bool)

(assert (=> b!1336027 m!1224049))

(assert (=> b!1336028 m!1223751))

(assert (=> b!1336028 m!1223671))

(declare-fun m!1224051 () Bool)

(assert (=> b!1336028 m!1224051))

(assert (=> b!1335768 d!143607))

(declare-fun d!143609 () Bool)

(declare-fun e!760889 () Bool)

(assert (=> d!143609 e!760889))

(declare-fun res!886630 () Bool)

(assert (=> d!143609 (=> res!886630 e!760889)))

(declare-fun lt!592663 () Bool)

(assert (=> d!143609 (= res!886630 (not lt!592663))))

(declare-fun lt!592664 () Bool)

(assert (=> d!143609 (= lt!592663 lt!592664)))

(declare-fun lt!592665 () Unit!43903)

(declare-fun e!760888 () Unit!43903)

(assert (=> d!143609 (= lt!592665 e!760888)))

(declare-fun c!125988 () Bool)

(assert (=> d!143609 (= c!125988 lt!592664)))

(assert (=> d!143609 (= lt!592664 (containsKey!737 (toList!10787 (+!4730 lt!592508 (tuple2!23887 lt!592505 lt!592504))) lt!592506))))

(assert (=> d!143609 (= (contains!8950 (+!4730 lt!592508 (tuple2!23887 lt!592505 lt!592504)) lt!592506) lt!592663)))

(declare-fun b!1336029 () Bool)

(declare-fun lt!592666 () Unit!43903)

(assert (=> b!1336029 (= e!760888 lt!592666)))

(assert (=> b!1336029 (= lt!592666 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 (+!4730 lt!592508 (tuple2!23887 lt!592505 lt!592504))) lt!592506))))

(assert (=> b!1336029 (isDefined!522 (getValueByKey!715 (toList!10787 (+!4730 lt!592508 (tuple2!23887 lt!592505 lt!592504))) lt!592506))))

(declare-fun b!1336030 () Bool)

(declare-fun Unit!43914 () Unit!43903)

(assert (=> b!1336030 (= e!760888 Unit!43914)))

(declare-fun b!1336031 () Bool)

(assert (=> b!1336031 (= e!760889 (isDefined!522 (getValueByKey!715 (toList!10787 (+!4730 lt!592508 (tuple2!23887 lt!592505 lt!592504))) lt!592506)))))

(assert (= (and d!143609 c!125988) b!1336029))

(assert (= (and d!143609 (not c!125988)) b!1336030))

(assert (= (and d!143609 (not res!886630)) b!1336031))

(declare-fun m!1224053 () Bool)

(assert (=> d!143609 m!1224053))

(declare-fun m!1224055 () Bool)

(assert (=> b!1336029 m!1224055))

(declare-fun m!1224057 () Bool)

(assert (=> b!1336029 m!1224057))

(assert (=> b!1336029 m!1224057))

(declare-fun m!1224059 () Bool)

(assert (=> b!1336029 m!1224059))

(assert (=> b!1336031 m!1224057))

(assert (=> b!1336031 m!1224057))

(assert (=> b!1336031 m!1224059))

(assert (=> b!1335768 d!143609))

(declare-fun d!143611 () Bool)

(declare-fun e!760890 () Bool)

(assert (=> d!143611 e!760890))

(declare-fun res!886631 () Bool)

(assert (=> d!143611 (=> (not res!886631) (not e!760890))))

(declare-fun lt!592669 () ListLongMap!21543)

(assert (=> d!143611 (= res!886631 (contains!8950 lt!592669 (_1!11954 (tuple2!23887 lt!592505 lt!592504))))))

(declare-fun lt!592667 () List!31028)

(assert (=> d!143611 (= lt!592669 (ListLongMap!21544 lt!592667))))

(declare-fun lt!592670 () Unit!43903)

(declare-fun lt!592668 () Unit!43903)

(assert (=> d!143611 (= lt!592670 lt!592668)))

(assert (=> d!143611 (= (getValueByKey!715 lt!592667 (_1!11954 (tuple2!23887 lt!592505 lt!592504))) (Some!766 (_2!11954 (tuple2!23887 lt!592505 lt!592504))))))

(assert (=> d!143611 (= lt!592668 (lemmaContainsTupThenGetReturnValue!360 lt!592667 (_1!11954 (tuple2!23887 lt!592505 lt!592504)) (_2!11954 (tuple2!23887 lt!592505 lt!592504))))))

(assert (=> d!143611 (= lt!592667 (insertStrictlySorted!489 (toList!10787 lt!592508) (_1!11954 (tuple2!23887 lt!592505 lt!592504)) (_2!11954 (tuple2!23887 lt!592505 lt!592504))))))

(assert (=> d!143611 (= (+!4730 lt!592508 (tuple2!23887 lt!592505 lt!592504)) lt!592669)))

(declare-fun b!1336032 () Bool)

(declare-fun res!886632 () Bool)

(assert (=> b!1336032 (=> (not res!886632) (not e!760890))))

(assert (=> b!1336032 (= res!886632 (= (getValueByKey!715 (toList!10787 lt!592669) (_1!11954 (tuple2!23887 lt!592505 lt!592504))) (Some!766 (_2!11954 (tuple2!23887 lt!592505 lt!592504)))))))

(declare-fun b!1336033 () Bool)

(assert (=> b!1336033 (= e!760890 (contains!8952 (toList!10787 lt!592669) (tuple2!23887 lt!592505 lt!592504)))))

(assert (= (and d!143611 res!886631) b!1336032))

(assert (= (and b!1336032 res!886632) b!1336033))

(declare-fun m!1224061 () Bool)

(assert (=> d!143611 m!1224061))

(declare-fun m!1224063 () Bool)

(assert (=> d!143611 m!1224063))

(declare-fun m!1224065 () Bool)

(assert (=> d!143611 m!1224065))

(declare-fun m!1224067 () Bool)

(assert (=> d!143611 m!1224067))

(declare-fun m!1224069 () Bool)

(assert (=> b!1336032 m!1224069))

(declare-fun m!1224071 () Bool)

(assert (=> b!1336033 m!1224071))

(assert (=> b!1335768 d!143611))

(declare-fun b!1336036 () Bool)

(declare-fun e!760892 () Option!767)

(assert (=> b!1336036 (= e!760892 (getValueByKey!715 (t!45296 (toList!10787 lt!592486)) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1336034 () Bool)

(declare-fun e!760891 () Option!767)

(assert (=> b!1336034 (= e!760891 (Some!766 (_2!11954 (h!32233 (toList!10787 lt!592486)))))))

(declare-fun d!143613 () Bool)

(declare-fun c!125989 () Bool)

(assert (=> d!143613 (= c!125989 (and ((_ is Cons!31024) (toList!10787 lt!592486)) (= (_1!11954 (h!32233 (toList!10787 lt!592486))) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143613 (= (getValueByKey!715 (toList!10787 lt!592486) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) e!760891)))

(declare-fun b!1336035 () Bool)

(assert (=> b!1336035 (= e!760891 e!760892)))

(declare-fun c!125990 () Bool)

(assert (=> b!1336035 (= c!125990 (and ((_ is Cons!31024) (toList!10787 lt!592486)) (not (= (_1!11954 (h!32233 (toList!10787 lt!592486))) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1336037 () Bool)

(assert (=> b!1336037 (= e!760892 None!765)))

(assert (= (and d!143613 c!125989) b!1336034))

(assert (= (and d!143613 (not c!125989)) b!1336035))

(assert (= (and b!1336035 c!125990) b!1336036))

(assert (= (and b!1336035 (not c!125990)) b!1336037))

(declare-fun m!1224073 () Bool)

(assert (=> b!1336036 m!1224073))

(assert (=> b!1335737 d!143613))

(declare-fun d!143615 () Bool)

(declare-fun isEmpty!1083 (List!31028) Bool)

(assert (=> d!143615 (= (isEmpty!1081 lt!592507) (isEmpty!1083 (toList!10787 lt!592507)))))

(declare-fun bs!38252 () Bool)

(assert (= bs!38252 d!143615))

(declare-fun m!1224075 () Bool)

(assert (=> bs!38252 m!1224075))

(assert (=> b!1335769 d!143615))

(declare-fun d!143617 () Bool)

(assert (=> d!143617 (= (validKeyInArray!0 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (and (not (= (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1335767 d!143617))

(declare-fun b!1336040 () Bool)

(declare-fun e!760894 () Option!767)

(assert (=> b!1336040 (= e!760894 (getValueByKey!715 (t!45296 (toList!10787 lt!592482)) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1336038 () Bool)

(declare-fun e!760893 () Option!767)

(assert (=> b!1336038 (= e!760893 (Some!766 (_2!11954 (h!32233 (toList!10787 lt!592482)))))))

(declare-fun d!143619 () Bool)

(declare-fun c!125991 () Bool)

(assert (=> d!143619 (= c!125991 (and ((_ is Cons!31024) (toList!10787 lt!592482)) (= (_1!11954 (h!32233 (toList!10787 lt!592482))) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143619 (= (getValueByKey!715 (toList!10787 lt!592482) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!760893)))

(declare-fun b!1336039 () Bool)

(assert (=> b!1336039 (= e!760893 e!760894)))

(declare-fun c!125992 () Bool)

(assert (=> b!1336039 (= c!125992 (and ((_ is Cons!31024) (toList!10787 lt!592482)) (not (= (_1!11954 (h!32233 (toList!10787 lt!592482))) (_1!11954 (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1336041 () Bool)

(assert (=> b!1336041 (= e!760894 None!765)))

(assert (= (and d!143619 c!125991) b!1336038))

(assert (= (and d!143619 (not c!125991)) b!1336039))

(assert (= (and b!1336039 c!125992) b!1336040))

(assert (= (and b!1336039 (not c!125992)) b!1336041))

(declare-fun m!1224077 () Bool)

(assert (=> b!1336040 m!1224077))

(assert (=> b!1335735 d!143619))

(declare-fun d!143621 () Bool)

(declare-fun e!760895 () Bool)

(assert (=> d!143621 e!760895))

(declare-fun res!886633 () Bool)

(assert (=> d!143621 (=> (not res!886633) (not e!760895))))

(declare-fun lt!592673 () ListLongMap!21543)

(assert (=> d!143621 (= res!886633 (contains!8950 lt!592673 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!592671 () List!31028)

(assert (=> d!143621 (= lt!592673 (ListLongMap!21544 lt!592671))))

(declare-fun lt!592674 () Unit!43903)

(declare-fun lt!592672 () Unit!43903)

(assert (=> d!143621 (= lt!592674 lt!592672)))

(assert (=> d!143621 (= (getValueByKey!715 lt!592671 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!766 (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143621 (= lt!592672 (lemmaContainsTupThenGetReturnValue!360 lt!592671 (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143621 (= lt!592671 (insertStrictlySorted!489 (toList!10787 call!64843) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143621 (= (+!4730 call!64843 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!592673)))

(declare-fun b!1336042 () Bool)

(declare-fun res!886634 () Bool)

(assert (=> b!1336042 (=> (not res!886634) (not e!760895))))

(assert (=> b!1336042 (= res!886634 (= (getValueByKey!715 (toList!10787 lt!592673) (_1!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!766 (_2!11954 (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1336043 () Bool)

(assert (=> b!1336043 (= e!760895 (contains!8952 (toList!10787 lt!592673) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143621 res!886633) b!1336042))

(assert (= (and b!1336042 res!886634) b!1336043))

(declare-fun m!1224079 () Bool)

(assert (=> d!143621 m!1224079))

(declare-fun m!1224081 () Bool)

(assert (=> d!143621 m!1224081))

(declare-fun m!1224083 () Bool)

(assert (=> d!143621 m!1224083))

(declare-fun m!1224085 () Bool)

(assert (=> d!143621 m!1224085))

(declare-fun m!1224087 () Bool)

(assert (=> b!1336042 m!1224087))

(declare-fun m!1224089 () Bool)

(assert (=> b!1336043 m!1224089))

(assert (=> b!1335855 d!143621))

(assert (=> bm!64822 d!143593))

(declare-fun d!143623 () Bool)

(declare-fun res!886639 () Bool)

(declare-fun e!760900 () Bool)

(assert (=> d!143623 (=> res!886639 e!760900)))

(assert (=> d!143623 (= res!886639 (and ((_ is Cons!31024) (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (= (_1!11954 (h!32233 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)))))

(assert (=> d!143623 (= (containsKey!737 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153) e!760900)))

(declare-fun b!1336048 () Bool)

(declare-fun e!760901 () Bool)

(assert (=> b!1336048 (= e!760900 e!760901)))

(declare-fun res!886640 () Bool)

(assert (=> b!1336048 (=> (not res!886640) (not e!760901))))

(assert (=> b!1336048 (= res!886640 (and (or (not ((_ is Cons!31024) (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) (bvsle (_1!11954 (h!32233 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)) ((_ is Cons!31024) (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (bvslt (_1!11954 (h!32233 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))) k0!1153)))))

(declare-fun b!1336049 () Bool)

(assert (=> b!1336049 (= e!760901 (containsKey!737 (t!45296 (toList!10787 (+!4730 (+!4730 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23887 (select (arr!43792 _keys!1590) from!1980) (get!22088 (select (arr!43793 _values!1320) from!1980) (dynLambda!3669 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) k0!1153))))

(assert (= (and d!143623 (not res!886639)) b!1336048))

(assert (= (and b!1336048 res!886640) b!1336049))

(declare-fun m!1224091 () Bool)

(assert (=> b!1336049 m!1224091))

(assert (=> d!143529 d!143623))

(declare-fun d!143625 () Bool)

(declare-fun e!760902 () Bool)

(assert (=> d!143625 e!760902))

(declare-fun res!886641 () Bool)

(assert (=> d!143625 (=> (not res!886641) (not e!760902))))

(declare-fun lt!592677 () ListLongMap!21543)

(assert (=> d!143625 (= res!886641 (contains!8950 lt!592677 (_1!11954 (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun lt!592675 () List!31028)

(assert (=> d!143625 (= lt!592677 (ListLongMap!21544 lt!592675))))

(declare-fun lt!592678 () Unit!43903)

(declare-fun lt!592676 () Unit!43903)

(assert (=> d!143625 (= lt!592678 lt!592676)))

(assert (=> d!143625 (= (getValueByKey!715 lt!592675 (_1!11954 (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!766 (_2!11954 (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143625 (= lt!592676 (lemmaContainsTupThenGetReturnValue!360 lt!592675 (_1!11954 (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11954 (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143625 (= lt!592675 (insertStrictlySorted!489 (toList!10787 (ite c!125936 call!64845 (ite c!125938 call!64846 call!64849))) (_1!11954 (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (_2!11954 (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(assert (=> d!143625 (= (+!4730 (ite c!125936 call!64845 (ite c!125938 call!64846 call!64849)) (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) lt!592677)))

(declare-fun b!1336050 () Bool)

(declare-fun res!886642 () Bool)

(assert (=> b!1336050 (=> (not res!886642) (not e!760902))))

(assert (=> b!1336050 (= res!886642 (= (getValueByKey!715 (toList!10787 lt!592677) (_1!11954 (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))) (Some!766 (_2!11954 (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))))

(declare-fun b!1336051 () Bool)

(assert (=> b!1336051 (= e!760902 (contains!8952 (toList!10787 lt!592677) (ite (or c!125936 c!125938) (tuple2!23887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (= (and d!143625 res!886641) b!1336050))

(assert (= (and b!1336050 res!886642) b!1336051))

(declare-fun m!1224093 () Bool)

(assert (=> d!143625 m!1224093))

(declare-fun m!1224095 () Bool)

(assert (=> d!143625 m!1224095))

(declare-fun m!1224097 () Bool)

(assert (=> d!143625 m!1224097))

(declare-fun m!1224099 () Bool)

(assert (=> d!143625 m!1224099))

(declare-fun m!1224101 () Bool)

(assert (=> b!1336050 m!1224101))

(declare-fun m!1224103 () Bool)

(assert (=> b!1336051 m!1224103))

(assert (=> bm!64845 d!143625))

(declare-fun d!143627 () Bool)

(declare-fun e!760904 () Bool)

(assert (=> d!143627 e!760904))

(declare-fun res!886643 () Bool)

(assert (=> d!143627 (=> res!886643 e!760904)))

(declare-fun lt!592679 () Bool)

(assert (=> d!143627 (= res!886643 (not lt!592679))))

(declare-fun lt!592680 () Bool)

(assert (=> d!143627 (= lt!592679 lt!592680)))

(declare-fun lt!592681 () Unit!43903)

(declare-fun e!760903 () Unit!43903)

(assert (=> d!143627 (= lt!592681 e!760903)))

(declare-fun c!125993 () Bool)

(assert (=> d!143627 (= c!125993 lt!592680)))

(assert (=> d!143627 (= lt!592680 (containsKey!737 (toList!10787 lt!592580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143627 (= (contains!8950 lt!592580 #b1000000000000000000000000000000000000000000000000000000000000000) lt!592679)))

(declare-fun b!1336052 () Bool)

(declare-fun lt!592682 () Unit!43903)

(assert (=> b!1336052 (= e!760903 lt!592682)))

(assert (=> b!1336052 (= lt!592682 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 lt!592580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1336052 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592580) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1336053 () Bool)

(declare-fun Unit!43915 () Unit!43903)

(assert (=> b!1336053 (= e!760903 Unit!43915)))

(declare-fun b!1336054 () Bool)

(assert (=> b!1336054 (= e!760904 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143627 c!125993) b!1336052))

(assert (= (and d!143627 (not c!125993)) b!1336053))

(assert (= (and d!143627 (not res!886643)) b!1336054))

(declare-fun m!1224105 () Bool)

(assert (=> d!143627 m!1224105))

(declare-fun m!1224107 () Bool)

(assert (=> b!1336052 m!1224107))

(assert (=> b!1336052 m!1223887))

(assert (=> b!1336052 m!1223887))

(declare-fun m!1224109 () Bool)

(assert (=> b!1336052 m!1224109))

(assert (=> b!1336054 m!1223887))

(assert (=> b!1336054 m!1223887))

(assert (=> b!1336054 m!1224109))

(assert (=> bm!64844 d!143627))

(declare-fun d!143629 () Bool)

(declare-fun lt!592683 () Bool)

(assert (=> d!143629 (= lt!592683 (select (content!658 (toList!10787 lt!592486)) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun e!760906 () Bool)

(assert (=> d!143629 (= lt!592683 e!760906)))

(declare-fun res!886645 () Bool)

(assert (=> d!143629 (=> (not res!886645) (not e!760906))))

(assert (=> d!143629 (= res!886645 ((_ is Cons!31024) (toList!10787 lt!592486)))))

(assert (=> d!143629 (= (contains!8952 (toList!10787 lt!592486) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!592683)))

(declare-fun b!1336055 () Bool)

(declare-fun e!760905 () Bool)

(assert (=> b!1336055 (= e!760906 e!760905)))

(declare-fun res!886644 () Bool)

(assert (=> b!1336055 (=> res!886644 e!760905)))

(assert (=> b!1336055 (= res!886644 (= (h!32233 (toList!10787 lt!592486)) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1336056 () Bool)

(assert (=> b!1336056 (= e!760905 (contains!8952 (t!45296 (toList!10787 lt!592486)) (tuple2!23887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143629 res!886645) b!1336055))

(assert (= (and b!1336055 (not res!886644)) b!1336056))

(declare-fun m!1224111 () Bool)

(assert (=> d!143629 m!1224111))

(declare-fun m!1224113 () Bool)

(assert (=> d!143629 m!1224113))

(declare-fun m!1224115 () Bool)

(assert (=> b!1336056 m!1224115))

(assert (=> b!1335738 d!143629))

(assert (=> d!143543 d!143531))

(assert (=> b!1335773 d!143617))

(declare-fun d!143631 () Bool)

(declare-fun res!886646 () Bool)

(declare-fun e!760907 () Bool)

(assert (=> d!143631 (=> res!886646 e!760907)))

(assert (=> d!143631 (= res!886646 (and ((_ is Cons!31024) (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (= (_1!11954 (h!32233 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(assert (=> d!143631 (= (containsKey!737 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153) e!760907)))

(declare-fun b!1336057 () Bool)

(declare-fun e!760908 () Bool)

(assert (=> b!1336057 (= e!760907 e!760908)))

(declare-fun res!886647 () Bool)

(assert (=> b!1336057 (=> (not res!886647) (not e!760908))))

(assert (=> b!1336057 (= res!886647 (and (or (not ((_ is Cons!31024) (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) (bvsle (_1!11954 (h!32233 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)) ((_ is Cons!31024) (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) (bvslt (_1!11954 (h!32233 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)))) k0!1153)))))

(declare-fun b!1336058 () Bool)

(assert (=> b!1336058 (= e!760908 (containsKey!737 (t!45296 (toList!10787 (getCurrentListMap!5760 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))) k0!1153))))

(assert (= (and d!143631 (not res!886646)) b!1336057))

(assert (= (and b!1336057 res!886647) b!1336058))

(declare-fun m!1224117 () Bool)

(assert (=> b!1336058 m!1224117))

(assert (=> d!143541 d!143631))

(declare-fun d!143633 () Bool)

(assert (=> d!143633 (= (apply!1032 lt!592507 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22092 (getValueByKey!715 (toList!10787 lt!592507) (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))))

(declare-fun bs!38253 () Bool)

(assert (= bs!38253 d!143633))

(assert (=> bs!38253 m!1223747))

(assert (=> bs!38253 m!1223953))

(assert (=> bs!38253 m!1223953))

(declare-fun m!1224119 () Bool)

(assert (=> bs!38253 m!1224119))

(assert (=> b!1335771 d!143633))

(assert (=> b!1335771 d!143607))

(assert (=> b!1335858 d!143537))

(assert (=> b!1335878 d!143547))

(declare-fun d!143635 () Bool)

(assert (=> d!143635 (= (apply!1032 (+!4730 lt!592587 (tuple2!23887 lt!592593 minValue!1262)) lt!592584) (get!22092 (getValueByKey!715 (toList!10787 (+!4730 lt!592587 (tuple2!23887 lt!592593 minValue!1262))) lt!592584)))))

(declare-fun bs!38254 () Bool)

(assert (= bs!38254 d!143635))

(declare-fun m!1224121 () Bool)

(assert (=> bs!38254 m!1224121))

(assert (=> bs!38254 m!1224121))

(declare-fun m!1224123 () Bool)

(assert (=> bs!38254 m!1224123))

(assert (=> b!1335847 d!143635))

(declare-fun d!143637 () Bool)

(assert (=> d!143637 (= (apply!1032 lt!592587 lt!592584) (get!22092 (getValueByKey!715 (toList!10787 lt!592587) lt!592584)))))

(declare-fun bs!38255 () Bool)

(assert (= bs!38255 d!143637))

(declare-fun m!1224125 () Bool)

(assert (=> bs!38255 m!1224125))

(assert (=> bs!38255 m!1224125))

(declare-fun m!1224127 () Bool)

(assert (=> bs!38255 m!1224127))

(assert (=> b!1335847 d!143637))

(declare-fun d!143639 () Bool)

(assert (=> d!143639 (= (apply!1032 (+!4730 lt!592598 (tuple2!23887 lt!592596 zeroValue!1262)) lt!592583) (get!22092 (getValueByKey!715 (toList!10787 (+!4730 lt!592598 (tuple2!23887 lt!592596 zeroValue!1262))) lt!592583)))))

(declare-fun bs!38256 () Bool)

(assert (= bs!38256 d!143639))

(declare-fun m!1224129 () Bool)

(assert (=> bs!38256 m!1224129))

(assert (=> bs!38256 m!1224129))

(declare-fun m!1224131 () Bool)

(assert (=> bs!38256 m!1224131))

(assert (=> b!1335847 d!143639))

(declare-fun d!143641 () Bool)

(assert (=> d!143641 (= (apply!1032 lt!592588 lt!592590) (get!22092 (getValueByKey!715 (toList!10787 lt!592588) lt!592590)))))

(declare-fun bs!38257 () Bool)

(assert (= bs!38257 d!143641))

(declare-fun m!1224133 () Bool)

(assert (=> bs!38257 m!1224133))

(assert (=> bs!38257 m!1224133))

(declare-fun m!1224135 () Bool)

(assert (=> bs!38257 m!1224135))

(assert (=> b!1335847 d!143641))

(declare-fun d!143643 () Bool)

(declare-fun e!760909 () Bool)

(assert (=> d!143643 e!760909))

(declare-fun res!886648 () Bool)

(assert (=> d!143643 (=> (not res!886648) (not e!760909))))

(declare-fun lt!592686 () ListLongMap!21543)

(assert (=> d!143643 (= res!886648 (contains!8950 lt!592686 (_1!11954 (tuple2!23887 lt!592597 minValue!1262))))))

(declare-fun lt!592684 () List!31028)

(assert (=> d!143643 (= lt!592686 (ListLongMap!21544 lt!592684))))

(declare-fun lt!592687 () Unit!43903)

(declare-fun lt!592685 () Unit!43903)

(assert (=> d!143643 (= lt!592687 lt!592685)))

(assert (=> d!143643 (= (getValueByKey!715 lt!592684 (_1!11954 (tuple2!23887 lt!592597 minValue!1262))) (Some!766 (_2!11954 (tuple2!23887 lt!592597 minValue!1262))))))

(assert (=> d!143643 (= lt!592685 (lemmaContainsTupThenGetReturnValue!360 lt!592684 (_1!11954 (tuple2!23887 lt!592597 minValue!1262)) (_2!11954 (tuple2!23887 lt!592597 minValue!1262))))))

(assert (=> d!143643 (= lt!592684 (insertStrictlySorted!489 (toList!10787 lt!592588) (_1!11954 (tuple2!23887 lt!592597 minValue!1262)) (_2!11954 (tuple2!23887 lt!592597 minValue!1262))))))

(assert (=> d!143643 (= (+!4730 lt!592588 (tuple2!23887 lt!592597 minValue!1262)) lt!592686)))

(declare-fun b!1336059 () Bool)

(declare-fun res!886649 () Bool)

(assert (=> b!1336059 (=> (not res!886649) (not e!760909))))

(assert (=> b!1336059 (= res!886649 (= (getValueByKey!715 (toList!10787 lt!592686) (_1!11954 (tuple2!23887 lt!592597 minValue!1262))) (Some!766 (_2!11954 (tuple2!23887 lt!592597 minValue!1262)))))))

(declare-fun b!1336060 () Bool)

(assert (=> b!1336060 (= e!760909 (contains!8952 (toList!10787 lt!592686) (tuple2!23887 lt!592597 minValue!1262)))))

(assert (= (and d!143643 res!886648) b!1336059))

(assert (= (and b!1336059 res!886649) b!1336060))

(declare-fun m!1224137 () Bool)

(assert (=> d!143643 m!1224137))

(declare-fun m!1224139 () Bool)

(assert (=> d!143643 m!1224139))

(declare-fun m!1224141 () Bool)

(assert (=> d!143643 m!1224141))

(declare-fun m!1224143 () Bool)

(assert (=> d!143643 m!1224143))

(declare-fun m!1224145 () Bool)

(assert (=> b!1336059 m!1224145))

(declare-fun m!1224147 () Bool)

(assert (=> b!1336060 m!1224147))

(assert (=> b!1335847 d!143643))

(declare-fun d!143645 () Bool)

(declare-fun e!760910 () Bool)

(assert (=> d!143645 e!760910))

(declare-fun res!886650 () Bool)

(assert (=> d!143645 (=> (not res!886650) (not e!760910))))

(declare-fun lt!592690 () ListLongMap!21543)

(assert (=> d!143645 (= res!886650 (contains!8950 lt!592690 (_1!11954 (tuple2!23887 lt!592596 zeroValue!1262))))))

(declare-fun lt!592688 () List!31028)

(assert (=> d!143645 (= lt!592690 (ListLongMap!21544 lt!592688))))

(declare-fun lt!592691 () Unit!43903)

(declare-fun lt!592689 () Unit!43903)

(assert (=> d!143645 (= lt!592691 lt!592689)))

(assert (=> d!143645 (= (getValueByKey!715 lt!592688 (_1!11954 (tuple2!23887 lt!592596 zeroValue!1262))) (Some!766 (_2!11954 (tuple2!23887 lt!592596 zeroValue!1262))))))

(assert (=> d!143645 (= lt!592689 (lemmaContainsTupThenGetReturnValue!360 lt!592688 (_1!11954 (tuple2!23887 lt!592596 zeroValue!1262)) (_2!11954 (tuple2!23887 lt!592596 zeroValue!1262))))))

(assert (=> d!143645 (= lt!592688 (insertStrictlySorted!489 (toList!10787 lt!592598) (_1!11954 (tuple2!23887 lt!592596 zeroValue!1262)) (_2!11954 (tuple2!23887 lt!592596 zeroValue!1262))))))

(assert (=> d!143645 (= (+!4730 lt!592598 (tuple2!23887 lt!592596 zeroValue!1262)) lt!592690)))

(declare-fun b!1336061 () Bool)

(declare-fun res!886651 () Bool)

(assert (=> b!1336061 (=> (not res!886651) (not e!760910))))

(assert (=> b!1336061 (= res!886651 (= (getValueByKey!715 (toList!10787 lt!592690) (_1!11954 (tuple2!23887 lt!592596 zeroValue!1262))) (Some!766 (_2!11954 (tuple2!23887 lt!592596 zeroValue!1262)))))))

(declare-fun b!1336062 () Bool)

(assert (=> b!1336062 (= e!760910 (contains!8952 (toList!10787 lt!592690) (tuple2!23887 lt!592596 zeroValue!1262)))))

(assert (= (and d!143645 res!886650) b!1336061))

(assert (= (and b!1336061 res!886651) b!1336062))

(declare-fun m!1224149 () Bool)

(assert (=> d!143645 m!1224149))

(declare-fun m!1224151 () Bool)

(assert (=> d!143645 m!1224151))

(declare-fun m!1224153 () Bool)

(assert (=> d!143645 m!1224153))

(declare-fun m!1224155 () Bool)

(assert (=> d!143645 m!1224155))

(declare-fun m!1224157 () Bool)

(assert (=> b!1336061 m!1224157))

(declare-fun m!1224159 () Bool)

(assert (=> b!1336062 m!1224159))

(assert (=> b!1335847 d!143645))

(declare-fun d!143647 () Bool)

(assert (=> d!143647 (= (apply!1032 (+!4730 lt!592587 (tuple2!23887 lt!592593 minValue!1262)) lt!592584) (apply!1032 lt!592587 lt!592584))))

(declare-fun lt!592694 () Unit!43903)

(declare-fun choose!1958 (ListLongMap!21543 (_ BitVec 64) V!54299 (_ BitVec 64)) Unit!43903)

(assert (=> d!143647 (= lt!592694 (choose!1958 lt!592587 lt!592593 minValue!1262 lt!592584))))

(declare-fun e!760913 () Bool)

(assert (=> d!143647 e!760913))

(declare-fun res!886654 () Bool)

(assert (=> d!143647 (=> (not res!886654) (not e!760913))))

(assert (=> d!143647 (= res!886654 (contains!8950 lt!592587 lt!592584))))

(assert (=> d!143647 (= (addApplyDifferent!574 lt!592587 lt!592593 minValue!1262 lt!592584) lt!592694)))

(declare-fun b!1336066 () Bool)

(assert (=> b!1336066 (= e!760913 (not (= lt!592584 lt!592593)))))

(assert (= (and d!143647 res!886654) b!1336066))

(assert (=> d!143647 m!1223843))

(declare-fun m!1224161 () Bool)

(assert (=> d!143647 m!1224161))

(assert (=> d!143647 m!1223819))

(assert (=> d!143647 m!1223827))

(declare-fun m!1224163 () Bool)

(assert (=> d!143647 m!1224163))

(assert (=> d!143647 m!1223819))

(assert (=> b!1335847 d!143647))

(declare-fun d!143649 () Bool)

(assert (=> d!143649 (contains!8950 (+!4730 lt!592595 (tuple2!23887 lt!592592 zeroValue!1262)) lt!592582)))

(declare-fun lt!592697 () Unit!43903)

(declare-fun choose!1959 (ListLongMap!21543 (_ BitVec 64) V!54299 (_ BitVec 64)) Unit!43903)

(assert (=> d!143649 (= lt!592697 (choose!1959 lt!592595 lt!592592 zeroValue!1262 lt!592582))))

(assert (=> d!143649 (contains!8950 lt!592595 lt!592582)))

(assert (=> d!143649 (= (addStillContains!1187 lt!592595 lt!592592 zeroValue!1262 lt!592582) lt!592697)))

(declare-fun bs!38258 () Bool)

(assert (= bs!38258 d!143649))

(assert (=> bs!38258 m!1223837))

(assert (=> bs!38258 m!1223837))

(assert (=> bs!38258 m!1223839))

(declare-fun m!1224165 () Bool)

(assert (=> bs!38258 m!1224165))

(declare-fun m!1224167 () Bool)

(assert (=> bs!38258 m!1224167))

(assert (=> b!1335847 d!143649))

(declare-fun d!143651 () Bool)

(declare-fun e!760915 () Bool)

(assert (=> d!143651 e!760915))

(declare-fun res!886655 () Bool)

(assert (=> d!143651 (=> res!886655 e!760915)))

(declare-fun lt!592698 () Bool)

(assert (=> d!143651 (= res!886655 (not lt!592698))))

(declare-fun lt!592699 () Bool)

(assert (=> d!143651 (= lt!592698 lt!592699)))

(declare-fun lt!592700 () Unit!43903)

(declare-fun e!760914 () Unit!43903)

(assert (=> d!143651 (= lt!592700 e!760914)))

(declare-fun c!125994 () Bool)

(assert (=> d!143651 (= c!125994 lt!592699)))

(assert (=> d!143651 (= lt!592699 (containsKey!737 (toList!10787 (+!4730 lt!592595 (tuple2!23887 lt!592592 zeroValue!1262))) lt!592582))))

(assert (=> d!143651 (= (contains!8950 (+!4730 lt!592595 (tuple2!23887 lt!592592 zeroValue!1262)) lt!592582) lt!592698)))

(declare-fun b!1336068 () Bool)

(declare-fun lt!592701 () Unit!43903)

(assert (=> b!1336068 (= e!760914 lt!592701)))

(assert (=> b!1336068 (= lt!592701 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 (+!4730 lt!592595 (tuple2!23887 lt!592592 zeroValue!1262))) lt!592582))))

(assert (=> b!1336068 (isDefined!522 (getValueByKey!715 (toList!10787 (+!4730 lt!592595 (tuple2!23887 lt!592592 zeroValue!1262))) lt!592582))))

(declare-fun b!1336069 () Bool)

(declare-fun Unit!43916 () Unit!43903)

(assert (=> b!1336069 (= e!760914 Unit!43916)))

(declare-fun b!1336070 () Bool)

(assert (=> b!1336070 (= e!760915 (isDefined!522 (getValueByKey!715 (toList!10787 (+!4730 lt!592595 (tuple2!23887 lt!592592 zeroValue!1262))) lt!592582)))))

(assert (= (and d!143651 c!125994) b!1336068))

(assert (= (and d!143651 (not c!125994)) b!1336069))

(assert (= (and d!143651 (not res!886655)) b!1336070))

(declare-fun m!1224169 () Bool)

(assert (=> d!143651 m!1224169))

(declare-fun m!1224171 () Bool)

(assert (=> b!1336068 m!1224171))

(declare-fun m!1224173 () Bool)

(assert (=> b!1336068 m!1224173))

(assert (=> b!1336068 m!1224173))

(declare-fun m!1224175 () Bool)

(assert (=> b!1336068 m!1224175))

(assert (=> b!1336070 m!1224173))

(assert (=> b!1336070 m!1224173))

(assert (=> b!1336070 m!1224175))

(assert (=> b!1335847 d!143651))

(declare-fun d!143653 () Bool)

(assert (=> d!143653 (= (apply!1032 (+!4730 lt!592598 (tuple2!23887 lt!592596 zeroValue!1262)) lt!592583) (apply!1032 lt!592598 lt!592583))))

(declare-fun lt!592702 () Unit!43903)

(assert (=> d!143653 (= lt!592702 (choose!1958 lt!592598 lt!592596 zeroValue!1262 lt!592583))))

(declare-fun e!760916 () Bool)

(assert (=> d!143653 e!760916))

(declare-fun res!886656 () Bool)

(assert (=> d!143653 (=> (not res!886656) (not e!760916))))

(assert (=> d!143653 (= res!886656 (contains!8950 lt!592598 lt!592583))))

(assert (=> d!143653 (= (addApplyDifferent!574 lt!592598 lt!592596 zeroValue!1262 lt!592583) lt!592702)))

(declare-fun b!1336071 () Bool)

(assert (=> b!1336071 (= e!760916 (not (= lt!592583 lt!592596)))))

(assert (= (and d!143653 res!886656) b!1336071))

(assert (=> d!143653 m!1223833))

(declare-fun m!1224177 () Bool)

(assert (=> d!143653 m!1224177))

(assert (=> d!143653 m!1223829))

(assert (=> d!143653 m!1223831))

(declare-fun m!1224179 () Bool)

(assert (=> d!143653 m!1224179))

(assert (=> d!143653 m!1223829))

(assert (=> b!1335847 d!143653))

(declare-fun d!143655 () Bool)

(declare-fun e!760917 () Bool)

(assert (=> d!143655 e!760917))

(declare-fun res!886657 () Bool)

(assert (=> d!143655 (=> (not res!886657) (not e!760917))))

(declare-fun lt!592705 () ListLongMap!21543)

(assert (=> d!143655 (= res!886657 (contains!8950 lt!592705 (_1!11954 (tuple2!23887 lt!592593 minValue!1262))))))

(declare-fun lt!592703 () List!31028)

(assert (=> d!143655 (= lt!592705 (ListLongMap!21544 lt!592703))))

(declare-fun lt!592706 () Unit!43903)

(declare-fun lt!592704 () Unit!43903)

(assert (=> d!143655 (= lt!592706 lt!592704)))

(assert (=> d!143655 (= (getValueByKey!715 lt!592703 (_1!11954 (tuple2!23887 lt!592593 minValue!1262))) (Some!766 (_2!11954 (tuple2!23887 lt!592593 minValue!1262))))))

(assert (=> d!143655 (= lt!592704 (lemmaContainsTupThenGetReturnValue!360 lt!592703 (_1!11954 (tuple2!23887 lt!592593 minValue!1262)) (_2!11954 (tuple2!23887 lt!592593 minValue!1262))))))

(assert (=> d!143655 (= lt!592703 (insertStrictlySorted!489 (toList!10787 lt!592587) (_1!11954 (tuple2!23887 lt!592593 minValue!1262)) (_2!11954 (tuple2!23887 lt!592593 minValue!1262))))))

(assert (=> d!143655 (= (+!4730 lt!592587 (tuple2!23887 lt!592593 minValue!1262)) lt!592705)))

(declare-fun b!1336072 () Bool)

(declare-fun res!886658 () Bool)

(assert (=> b!1336072 (=> (not res!886658) (not e!760917))))

(assert (=> b!1336072 (= res!886658 (= (getValueByKey!715 (toList!10787 lt!592705) (_1!11954 (tuple2!23887 lt!592593 minValue!1262))) (Some!766 (_2!11954 (tuple2!23887 lt!592593 minValue!1262)))))))

(declare-fun b!1336073 () Bool)

(assert (=> b!1336073 (= e!760917 (contains!8952 (toList!10787 lt!592705) (tuple2!23887 lt!592593 minValue!1262)))))

(assert (= (and d!143655 res!886657) b!1336072))

(assert (= (and b!1336072 res!886658) b!1336073))

(declare-fun m!1224181 () Bool)

(assert (=> d!143655 m!1224181))

(declare-fun m!1224183 () Bool)

(assert (=> d!143655 m!1224183))

(declare-fun m!1224185 () Bool)

(assert (=> d!143655 m!1224185))

(declare-fun m!1224187 () Bool)

(assert (=> d!143655 m!1224187))

(declare-fun m!1224189 () Bool)

(assert (=> b!1336072 m!1224189))

(declare-fun m!1224191 () Bool)

(assert (=> b!1336073 m!1224191))

(assert (=> b!1335847 d!143655))

(assert (=> b!1335847 d!143571))

(declare-fun d!143657 () Bool)

(declare-fun e!760918 () Bool)

(assert (=> d!143657 e!760918))

(declare-fun res!886659 () Bool)

(assert (=> d!143657 (=> (not res!886659) (not e!760918))))

(declare-fun lt!592709 () ListLongMap!21543)

(assert (=> d!143657 (= res!886659 (contains!8950 lt!592709 (_1!11954 (tuple2!23887 lt!592592 zeroValue!1262))))))

(declare-fun lt!592707 () List!31028)

(assert (=> d!143657 (= lt!592709 (ListLongMap!21544 lt!592707))))

(declare-fun lt!592710 () Unit!43903)

(declare-fun lt!592708 () Unit!43903)

(assert (=> d!143657 (= lt!592710 lt!592708)))

(assert (=> d!143657 (= (getValueByKey!715 lt!592707 (_1!11954 (tuple2!23887 lt!592592 zeroValue!1262))) (Some!766 (_2!11954 (tuple2!23887 lt!592592 zeroValue!1262))))))

(assert (=> d!143657 (= lt!592708 (lemmaContainsTupThenGetReturnValue!360 lt!592707 (_1!11954 (tuple2!23887 lt!592592 zeroValue!1262)) (_2!11954 (tuple2!23887 lt!592592 zeroValue!1262))))))

(assert (=> d!143657 (= lt!592707 (insertStrictlySorted!489 (toList!10787 lt!592595) (_1!11954 (tuple2!23887 lt!592592 zeroValue!1262)) (_2!11954 (tuple2!23887 lt!592592 zeroValue!1262))))))

(assert (=> d!143657 (= (+!4730 lt!592595 (tuple2!23887 lt!592592 zeroValue!1262)) lt!592709)))

(declare-fun b!1336074 () Bool)

(declare-fun res!886660 () Bool)

(assert (=> b!1336074 (=> (not res!886660) (not e!760918))))

(assert (=> b!1336074 (= res!886660 (= (getValueByKey!715 (toList!10787 lt!592709) (_1!11954 (tuple2!23887 lt!592592 zeroValue!1262))) (Some!766 (_2!11954 (tuple2!23887 lt!592592 zeroValue!1262)))))))

(declare-fun b!1336075 () Bool)

(assert (=> b!1336075 (= e!760918 (contains!8952 (toList!10787 lt!592709) (tuple2!23887 lt!592592 zeroValue!1262)))))

(assert (= (and d!143657 res!886659) b!1336074))

(assert (= (and b!1336074 res!886660) b!1336075))

(declare-fun m!1224193 () Bool)

(assert (=> d!143657 m!1224193))

(declare-fun m!1224195 () Bool)

(assert (=> d!143657 m!1224195))

(declare-fun m!1224197 () Bool)

(assert (=> d!143657 m!1224197))

(declare-fun m!1224199 () Bool)

(assert (=> d!143657 m!1224199))

(declare-fun m!1224201 () Bool)

(assert (=> b!1336074 m!1224201))

(declare-fun m!1224203 () Bool)

(assert (=> b!1336075 m!1224203))

(assert (=> b!1335847 d!143657))

(declare-fun d!143659 () Bool)

(assert (=> d!143659 (= (apply!1032 (+!4730 lt!592588 (tuple2!23887 lt!592597 minValue!1262)) lt!592590) (apply!1032 lt!592588 lt!592590))))

(declare-fun lt!592711 () Unit!43903)

(assert (=> d!143659 (= lt!592711 (choose!1958 lt!592588 lt!592597 minValue!1262 lt!592590))))

(declare-fun e!760919 () Bool)

(assert (=> d!143659 e!760919))

(declare-fun res!886661 () Bool)

(assert (=> d!143659 (=> (not res!886661) (not e!760919))))

(assert (=> d!143659 (= res!886661 (contains!8950 lt!592588 lt!592590))))

(assert (=> d!143659 (= (addApplyDifferent!574 lt!592588 lt!592597 minValue!1262 lt!592590) lt!592711)))

(declare-fun b!1336076 () Bool)

(assert (=> b!1336076 (= e!760919 (not (= lt!592590 lt!592597)))))

(assert (= (and d!143659 res!886661) b!1336076))

(assert (=> d!143659 m!1223841))

(declare-fun m!1224205 () Bool)

(assert (=> d!143659 m!1224205))

(assert (=> d!143659 m!1223817))

(assert (=> d!143659 m!1223835))

(declare-fun m!1224207 () Bool)

(assert (=> d!143659 m!1224207))

(assert (=> d!143659 m!1223817))

(assert (=> b!1335847 d!143659))

(declare-fun d!143661 () Bool)

(assert (=> d!143661 (= (apply!1032 (+!4730 lt!592588 (tuple2!23887 lt!592597 minValue!1262)) lt!592590) (get!22092 (getValueByKey!715 (toList!10787 (+!4730 lt!592588 (tuple2!23887 lt!592597 minValue!1262))) lt!592590)))))

(declare-fun bs!38259 () Bool)

(assert (= bs!38259 d!143661))

(declare-fun m!1224209 () Bool)

(assert (=> bs!38259 m!1224209))

(assert (=> bs!38259 m!1224209))

(declare-fun m!1224211 () Bool)

(assert (=> bs!38259 m!1224211))

(assert (=> b!1335847 d!143661))

(declare-fun d!143663 () Bool)

(assert (=> d!143663 (= (apply!1032 lt!592598 lt!592583) (get!22092 (getValueByKey!715 (toList!10787 lt!592598) lt!592583)))))

(declare-fun bs!38260 () Bool)

(assert (= bs!38260 d!143663))

(declare-fun m!1224213 () Bool)

(assert (=> bs!38260 m!1224213))

(assert (=> bs!38260 m!1224213))

(declare-fun m!1224215 () Bool)

(assert (=> bs!38260 m!1224215))

(assert (=> b!1335847 d!143663))

(assert (=> b!1335879 d!143547))

(declare-fun bm!64864 () Bool)

(declare-fun c!125995 () Bool)

(declare-fun call!64867 () Bool)

(assert (=> bm!64864 (= call!64867 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125995 (Cons!31025 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125944 (Cons!31025 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) Nil!31026) Nil!31026)) (ite c!125944 (Cons!31025 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) Nil!31026) Nil!31026))))))

(declare-fun b!1336077 () Bool)

(declare-fun e!760922 () Bool)

(declare-fun e!760923 () Bool)

(assert (=> b!1336077 (= e!760922 e!760923)))

(assert (=> b!1336077 (= c!125995 (validKeyInArray!0 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!143665 () Bool)

(declare-fun res!886664 () Bool)

(declare-fun e!760921 () Bool)

(assert (=> d!143665 (=> res!886664 e!760921)))

(assert (=> d!143665 (= res!886664 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44342 _keys!1590)))))

(assert (=> d!143665 (= (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125944 (Cons!31025 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) Nil!31026) Nil!31026)) e!760921)))

(declare-fun b!1336078 () Bool)

(assert (=> b!1336078 (= e!760921 e!760922)))

(declare-fun res!886663 () Bool)

(assert (=> b!1336078 (=> (not res!886663) (not e!760922))))

(declare-fun e!760920 () Bool)

(assert (=> b!1336078 (= res!886663 (not e!760920))))

(declare-fun res!886662 () Bool)

(assert (=> b!1336078 (=> (not res!886662) (not e!760920))))

(assert (=> b!1336078 (= res!886662 (validKeyInArray!0 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1336079 () Bool)

(assert (=> b!1336079 (= e!760923 call!64867)))

(declare-fun b!1336080 () Bool)

(assert (=> b!1336080 (= e!760923 call!64867)))

(declare-fun b!1336081 () Bool)

(assert (=> b!1336081 (= e!760920 (contains!8953 (ite c!125944 (Cons!31025 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) Nil!31026) Nil!31026) (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!143665 (not res!886664)) b!1336078))

(assert (= (and b!1336078 res!886662) b!1336081))

(assert (= (and b!1336078 res!886663) b!1336077))

(assert (= (and b!1336077 c!125995) b!1336080))

(assert (= (and b!1336077 (not c!125995)) b!1336079))

(assert (= (or b!1336080 b!1336079) bm!64864))

(declare-fun m!1224217 () Bool)

(assert (=> bm!64864 m!1224217))

(declare-fun m!1224219 () Bool)

(assert (=> bm!64864 m!1224219))

(assert (=> b!1336077 m!1224217))

(assert (=> b!1336077 m!1224217))

(declare-fun m!1224221 () Bool)

(assert (=> b!1336077 m!1224221))

(assert (=> b!1336078 m!1224217))

(assert (=> b!1336078 m!1224217))

(assert (=> b!1336078 m!1224221))

(assert (=> b!1336081 m!1224217))

(assert (=> b!1336081 m!1224217))

(declare-fun m!1224223 () Bool)

(assert (=> b!1336081 m!1224223))

(assert (=> bm!64849 d!143665))

(declare-fun d!143667 () Bool)

(assert (=> d!143667 (arrayContainsKey!0 _keys!1590 lt!592528 #b00000000000000000000000000000000)))

(declare-fun lt!592714 () Unit!43903)

(declare-fun choose!13 (array!90652 (_ BitVec 64) (_ BitVec 32)) Unit!43903)

(assert (=> d!143667 (= lt!592714 (choose!13 _keys!1590 lt!592528 #b00000000000000000000000000000000))))

(assert (=> d!143667 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!143667 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!592528 #b00000000000000000000000000000000) lt!592714)))

(declare-fun bs!38261 () Bool)

(assert (= bs!38261 d!143667))

(assert (=> bs!38261 m!1223791))

(declare-fun m!1224225 () Bool)

(assert (=> bs!38261 m!1224225))

(assert (=> b!1335799 d!143667))

(declare-fun d!143669 () Bool)

(declare-fun res!886669 () Bool)

(declare-fun e!760928 () Bool)

(assert (=> d!143669 (=> res!886669 e!760928)))

(assert (=> d!143669 (= res!886669 (= (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) lt!592528))))

(assert (=> d!143669 (= (arrayContainsKey!0 _keys!1590 lt!592528 #b00000000000000000000000000000000) e!760928)))

(declare-fun b!1336086 () Bool)

(declare-fun e!760929 () Bool)

(assert (=> b!1336086 (= e!760928 e!760929)))

(declare-fun res!886670 () Bool)

(assert (=> b!1336086 (=> (not res!886670) (not e!760929))))

(assert (=> b!1336086 (= res!886670 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44342 _keys!1590)))))

(declare-fun b!1336087 () Bool)

(assert (=> b!1336087 (= e!760929 (arrayContainsKey!0 _keys!1590 lt!592528 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!143669 (not res!886669)) b!1336086))

(assert (= (and b!1336086 res!886670) b!1336087))

(assert (=> d!143669 m!1223787))

(declare-fun m!1224227 () Bool)

(assert (=> b!1336087 m!1224227))

(assert (=> b!1335799 d!143669))

(declare-fun lt!592723 () SeekEntryResult!10047)

(declare-fun e!760936 () SeekEntryResult!10047)

(declare-fun b!1336100 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90652 (_ BitVec 32)) SeekEntryResult!10047)

(assert (=> b!1336100 (= e!760936 (seekKeyOrZeroReturnVacant!0 (x!119326 lt!592723) (index!42561 lt!592723) (index!42561 lt!592723) (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(declare-fun b!1336101 () Bool)

(declare-fun e!760937 () SeekEntryResult!10047)

(assert (=> b!1336101 (= e!760937 Undefined!10047)))

(declare-fun b!1336102 () Bool)

(declare-fun e!760938 () SeekEntryResult!10047)

(assert (=> b!1336102 (= e!760937 e!760938)))

(declare-fun lt!592722 () (_ BitVec 64))

(assert (=> b!1336102 (= lt!592722 (select (arr!43792 _keys!1590) (index!42561 lt!592723)))))

(declare-fun c!126003 () Bool)

(assert (=> b!1336102 (= c!126003 (= lt!592722 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1336103 () Bool)

(assert (=> b!1336103 (= e!760936 (MissingZero!10047 (index!42561 lt!592723)))))

(declare-fun b!1336104 () Bool)

(assert (=> b!1336104 (= e!760938 (Found!10047 (index!42561 lt!592723)))))

(declare-fun b!1336105 () Bool)

(declare-fun c!126002 () Bool)

(assert (=> b!1336105 (= c!126002 (= lt!592722 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1336105 (= e!760938 e!760936)))

(declare-fun d!143671 () Bool)

(declare-fun lt!592721 () SeekEntryResult!10047)

(assert (=> d!143671 (and (or ((_ is Undefined!10047) lt!592721) (not ((_ is Found!10047) lt!592721)) (and (bvsge (index!42560 lt!592721) #b00000000000000000000000000000000) (bvslt (index!42560 lt!592721) (size!44342 _keys!1590)))) (or ((_ is Undefined!10047) lt!592721) ((_ is Found!10047) lt!592721) (not ((_ is MissingZero!10047) lt!592721)) (and (bvsge (index!42559 lt!592721) #b00000000000000000000000000000000) (bvslt (index!42559 lt!592721) (size!44342 _keys!1590)))) (or ((_ is Undefined!10047) lt!592721) ((_ is Found!10047) lt!592721) ((_ is MissingZero!10047) lt!592721) (not ((_ is MissingVacant!10047) lt!592721)) (and (bvsge (index!42562 lt!592721) #b00000000000000000000000000000000) (bvslt (index!42562 lt!592721) (size!44342 _keys!1590)))) (or ((_ is Undefined!10047) lt!592721) (ite ((_ is Found!10047) lt!592721) (= (select (arr!43792 _keys!1590) (index!42560 lt!592721)) (select (arr!43792 _keys!1590) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10047) lt!592721) (= (select (arr!43792 _keys!1590) (index!42559 lt!592721)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10047) lt!592721) (= (select (arr!43792 _keys!1590) (index!42562 lt!592721)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143671 (= lt!592721 e!760937)))

(declare-fun c!126004 () Bool)

(assert (=> d!143671 (= c!126004 (and ((_ is Intermediate!10047) lt!592723) (undefined!10859 lt!592723)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!90652 (_ BitVec 32)) SeekEntryResult!10047)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!143671 (= lt!592723 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) mask!1998) (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998))))

(assert (=> d!143671 (validMask!0 mask!1998)))

(assert (=> d!143671 (= (seekEntryOrOpen!0 (select (arr!43792 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) lt!592721)))

(assert (= (and d!143671 c!126004) b!1336101))

(assert (= (and d!143671 (not c!126004)) b!1336102))

(assert (= (and b!1336102 c!126003) b!1336104))

(assert (= (and b!1336102 (not c!126003)) b!1336105))

(assert (= (and b!1336105 c!126002) b!1336103))

(assert (= (and b!1336105 (not c!126002)) b!1336100))

(assert (=> b!1336100 m!1223787))

(declare-fun m!1224229 () Bool)

(assert (=> b!1336100 m!1224229))

(declare-fun m!1224231 () Bool)

(assert (=> b!1336102 m!1224231))

(declare-fun m!1224233 () Bool)

(assert (=> d!143671 m!1224233))

(declare-fun m!1224235 () Bool)

(assert (=> d!143671 m!1224235))

(assert (=> d!143671 m!1223787))

(declare-fun m!1224237 () Bool)

(assert (=> d!143671 m!1224237))

(declare-fun m!1224239 () Bool)

(assert (=> d!143671 m!1224239))

(assert (=> d!143671 m!1223659))

(assert (=> d!143671 m!1224237))

(assert (=> d!143671 m!1223787))

(declare-fun m!1224241 () Bool)

(assert (=> d!143671 m!1224241))

(assert (=> b!1335799 d!143671))

(assert (=> b!1335864 d!143537))

(declare-fun bm!64865 () Bool)

(declare-fun call!64868 () Bool)

(assert (=> bm!64865 (= call!64868 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun d!143673 () Bool)

(declare-fun res!886671 () Bool)

(declare-fun e!760939 () Bool)

(assert (=> d!143673 (=> res!886671 e!760939)))

(assert (=> d!143673 (= res!886671 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44342 _keys!1590)))))

(assert (=> d!143673 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998) e!760939)))

(declare-fun b!1336106 () Bool)

(declare-fun e!760941 () Bool)

(assert (=> b!1336106 (= e!760941 call!64868)))

(declare-fun b!1336107 () Bool)

(declare-fun e!760940 () Bool)

(assert (=> b!1336107 (= e!760940 e!760941)))

(declare-fun lt!592725 () (_ BitVec 64))

(assert (=> b!1336107 (= lt!592725 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!592726 () Unit!43903)

(assert (=> b!1336107 (= lt!592726 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!592725 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1336107 (arrayContainsKey!0 _keys!1590 lt!592725 #b00000000000000000000000000000000)))

(declare-fun lt!592724 () Unit!43903)

(assert (=> b!1336107 (= lt!592724 lt!592726)))

(declare-fun res!886672 () Bool)

(assert (=> b!1336107 (= res!886672 (= (seekEntryOrOpen!0 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1590 mask!1998) (Found!10047 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1336107 (=> (not res!886672) (not e!760941))))

(declare-fun b!1336108 () Bool)

(assert (=> b!1336108 (= e!760940 call!64868)))

(declare-fun b!1336109 () Bool)

(assert (=> b!1336109 (= e!760939 e!760940)))

(declare-fun c!126005 () Bool)

(assert (=> b!1336109 (= c!126005 (validKeyInArray!0 (select (arr!43792 _keys!1590) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!143673 (not res!886671)) b!1336109))

(assert (= (and b!1336109 c!126005) b!1336107))

(assert (= (and b!1336109 (not c!126005)) b!1336108))

(assert (= (and b!1336107 res!886672) b!1336106))

(assert (= (or b!1336106 b!1336108) bm!64865))

(declare-fun m!1224243 () Bool)

(assert (=> bm!64865 m!1224243))

(assert (=> b!1336107 m!1224217))

(declare-fun m!1224245 () Bool)

(assert (=> b!1336107 m!1224245))

(declare-fun m!1224247 () Bool)

(assert (=> b!1336107 m!1224247))

(assert (=> b!1336107 m!1224217))

(declare-fun m!1224249 () Bool)

(assert (=> b!1336107 m!1224249))

(assert (=> b!1336109 m!1224217))

(assert (=> b!1336109 m!1224217))

(assert (=> b!1336109 m!1224221))

(assert (=> bm!64825 d!143673))

(declare-fun d!143675 () Bool)

(declare-fun e!760943 () Bool)

(assert (=> d!143675 e!760943))

(declare-fun res!886673 () Bool)

(assert (=> d!143675 (=> res!886673 e!760943)))

(declare-fun lt!592727 () Bool)

(assert (=> d!143675 (= res!886673 (not lt!592727))))

(declare-fun lt!592728 () Bool)

(assert (=> d!143675 (= lt!592727 lt!592728)))

(declare-fun lt!592729 () Unit!43903)

(declare-fun e!760942 () Unit!43903)

(assert (=> d!143675 (= lt!592729 e!760942)))

(declare-fun c!126006 () Bool)

(assert (=> d!143675 (= c!126006 lt!592728)))

(assert (=> d!143675 (= lt!592728 (containsKey!737 (toList!10787 lt!592580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143675 (= (contains!8950 lt!592580 #b0000000000000000000000000000000000000000000000000000000000000000) lt!592727)))

(declare-fun b!1336110 () Bool)

(declare-fun lt!592730 () Unit!43903)

(assert (=> b!1336110 (= e!760942 lt!592730)))

(assert (=> b!1336110 (= lt!592730 (lemmaContainsKeyImpliesGetValueByKeyDefined!483 (toList!10787 lt!592580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1336110 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592580) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1336111 () Bool)

(declare-fun Unit!43917 () Unit!43903)

(assert (=> b!1336111 (= e!760942 Unit!43917)))

(declare-fun b!1336112 () Bool)

(assert (=> b!1336112 (= e!760943 (isDefined!522 (getValueByKey!715 (toList!10787 lt!592580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143675 c!126006) b!1336110))

(assert (= (and d!143675 (not c!126006)) b!1336111))

(assert (= (and d!143675 (not res!886673)) b!1336112))

(declare-fun m!1224251 () Bool)

(assert (=> d!143675 m!1224251))

(declare-fun m!1224253 () Bool)

(assert (=> b!1336110 m!1224253))

(assert (=> b!1336110 m!1223891))

(assert (=> b!1336110 m!1223891))

(declare-fun m!1224255 () Bool)

(assert (=> b!1336110 m!1224255))

(assert (=> b!1336112 m!1223891))

(assert (=> b!1336112 m!1223891))

(assert (=> b!1336112 m!1224255))

(assert (=> bm!64846 d!143675))

(declare-fun condMapEmpty!57026 () Bool)

(declare-fun mapDefault!57026 () ValueCell!17550)

(assert (=> mapNonEmpty!57025 (= condMapEmpty!57026 (= mapRest!57025 ((as const (Array (_ BitVec 32) ValueCell!17550)) mapDefault!57026)))))

(declare-fun e!760945 () Bool)

(declare-fun mapRes!57026 () Bool)

(assert (=> mapNonEmpty!57025 (= tp!108607 (and e!760945 mapRes!57026))))

(declare-fun b!1336113 () Bool)

(declare-fun e!760944 () Bool)

(assert (=> b!1336113 (= e!760944 tp_is_empty!36897)))

(declare-fun b!1336114 () Bool)

(assert (=> b!1336114 (= e!760945 tp_is_empty!36897)))

(declare-fun mapNonEmpty!57026 () Bool)

(declare-fun tp!108608 () Bool)

(assert (=> mapNonEmpty!57026 (= mapRes!57026 (and tp!108608 e!760944))))

(declare-fun mapValue!57026 () ValueCell!17550)

(declare-fun mapRest!57026 () (Array (_ BitVec 32) ValueCell!17550))

(declare-fun mapKey!57026 () (_ BitVec 32))

(assert (=> mapNonEmpty!57026 (= mapRest!57025 (store mapRest!57026 mapKey!57026 mapValue!57026))))

(declare-fun mapIsEmpty!57026 () Bool)

(assert (=> mapIsEmpty!57026 mapRes!57026))

(assert (= (and mapNonEmpty!57025 condMapEmpty!57026) mapIsEmpty!57026))

(assert (= (and mapNonEmpty!57025 (not condMapEmpty!57026)) mapNonEmpty!57026))

(assert (= (and mapNonEmpty!57026 ((_ is ValueCellFull!17550) mapValue!57026)) b!1336113))

(assert (= (and mapNonEmpty!57025 ((_ is ValueCellFull!17550) mapDefault!57026)) b!1336114))

(declare-fun m!1224257 () Bool)

(assert (=> mapNonEmpty!57026 m!1224257))

(declare-fun b_lambda!24141 () Bool)

(assert (= b_lambda!24135 (or (and start!112592 b_free!30987) b_lambda!24141)))

(declare-fun b_lambda!24143 () Bool)

(assert (= b_lambda!24133 (or (and start!112592 b_free!30987) b_lambda!24143)))

(declare-fun b_lambda!24145 () Bool)

(assert (= b_lambda!24139 (or (and start!112592 b_free!30987) b_lambda!24145)))

(declare-fun b_lambda!24147 () Bool)

(assert (= b_lambda!24137 (or (and start!112592 b_free!30987) b_lambda!24147)))

(check-sat (not d!143567) (not bm!64865) (not d!143633) (not b!1335938) (not b_lambda!24131) (not b!1335965) (not b!1335967) (not b!1336062) (not b!1335910) (not bm!64863) (not b!1335996) (not b!1335999) (not b!1336074) (not b!1336052) (not b!1335963) (not d!143583) (not b!1336026) b_and!49917 (not b!1336028) (not b!1335971) (not b!1336061) (not d!143549) (not b!1336073) (not b!1336107) (not b!1335972) (not d!143659) (not d!143611) (not b!1335891) (not d!143573) (not d!143593) (not d!143603) (not b!1336050) (not d!143609) (not b!1335950) (not b!1336060) (not b!1335953) (not b!1336033) (not d!143667) (not b!1336068) (not d!143563) (not d!143571) (not d!143671) (not b_lambda!24141) (not b_lambda!24143) (not d!143577) (not b!1335973) tp_is_empty!36897 (not b!1336051) (not b!1336040) (not d!143641) (not b!1336054) (not d!143601) (not b!1336078) (not d!143675) (not b!1336109) (not b!1336110) (not b!1335994) (not b!1335947) (not d!143595) (not b!1336075) (not d!143561) (not d!143575) (not b!1336059) (not b!1335981) (not d!143629) (not b!1336006) (not bm!64862) (not b!1336020) (not b!1336031) (not b!1336036) (not b!1336027) (not b!1336001) (not d!143625) (not b_lambda!24147) (not d!143645) (not b!1335968) (not d!143637) (not d!143555) (not b!1335893) (not d!143587) (not d!143639) (not d!143655) (not bm!64859) (not d!143553) (not b!1336010) (not b!1336081) (not b!1335982) (not d!143591) (not d!143569) (not b!1336049) (not b!1335911) (not b!1336100) (not d!143635) (not b!1336003) (not d!143605) (not b!1336072) (not b!1335937) (not b!1335955) (not b!1336077) (not b!1335962) (not d!143643) (not d!143663) (not d!143661) (not b_lambda!24119) (not b!1336070) (not b!1335987) (not b!1336032) (not d!143653) (not d!143657) (not bm!64864) (not b!1335970) (not d!143581) (not d!143649) (not b!1336005) (not b!1336042) (not d!143557) (not d!143647) (not b!1336014) (not b!1335979) (not b_lambda!24145) (not d!143559) (not b!1336056) (not b!1336112) (not b!1335991) (not b!1335956) (not b!1336043) (not b!1335975) (not d!143589) (not d!143627) (not mapNonEmpty!57026) (not b!1336012) (not b_next!30987) (not b!1336025) (not b!1335940) (not d!143621) (not b!1336058) (not bm!64856) (not b_lambda!24129) (not b!1336004) (not b!1335948) (not b!1336008) (not b!1335984) (not b!1336000) (not d!143651) (not b!1336087) (not b!1335904) (not b_lambda!24127) (not b!1335997) (not b!1335977) (not b!1336029) (not d!143615))
(check-sat b_and!49917 (not b_next!30987))
