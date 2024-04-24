; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75112 () Bool)

(assert start!75112)

(declare-fun b_free!15463 () Bool)

(declare-fun b_next!15463 () Bool)

(assert (=> start!75112 (= b_free!15463 (not b_next!15463))))

(declare-fun tp!54093 () Bool)

(declare-fun b_and!25635 () Bool)

(assert (=> start!75112 (= tp!54093 b_and!25635)))

(declare-fun b!884986 () Bool)

(declare-fun e!492582 () Bool)

(assert (=> b!884986 (= e!492582 true)))

(declare-datatypes ((V!28657 0))(
  ( (V!28658 (val!8901 Int)) )
))
(declare-datatypes ((tuple2!11734 0))(
  ( (tuple2!11735 (_1!5878 (_ BitVec 64)) (_2!5878 V!28657)) )
))
(declare-fun lt!400718 () tuple2!11734)

(declare-fun lt!400710 () tuple2!11734)

(declare-datatypes ((List!17565 0))(
  ( (Nil!17562) (Cons!17561 (h!18698 tuple2!11734) (t!24822 List!17565)) )
))
(declare-datatypes ((ListLongMap!10505 0))(
  ( (ListLongMap!10506 (toList!5268 List!17565)) )
))
(declare-fun lt!400711 () ListLongMap!10505)

(declare-fun lt!400717 () ListLongMap!10505)

(declare-fun +!2580 (ListLongMap!10505 tuple2!11734) ListLongMap!10505)

(assert (=> b!884986 (= lt!400711 (+!2580 (+!2580 lt!400717 lt!400710) lt!400718))))

(declare-datatypes ((Unit!30163 0))(
  ( (Unit!30164) )
))
(declare-fun lt!400707 () Unit!30163)

(declare-fun v!557 () V!28657)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51579 0))(
  ( (array!51580 (arr!24804 (Array (_ BitVec 32) (_ BitVec 64))) (size!25245 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51579)

(declare-fun lt!400716 () V!28657)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!547 (ListLongMap!10505 (_ BitVec 64) V!28657 (_ BitVec 64) V!28657) Unit!30163)

(assert (=> b!884986 (= lt!400707 (addCommutativeForDiffKeys!547 lt!400717 k0!854 v!557 (select (arr!24804 _keys!868) from!1053) lt!400716))))

(declare-fun b!884987 () Bool)

(declare-fun res!600954 () Bool)

(declare-fun e!492586 () Bool)

(assert (=> b!884987 (=> (not res!600954) (not e!492586))))

(declare-datatypes ((List!17566 0))(
  ( (Nil!17563) (Cons!17562 (h!18699 (_ BitVec 64)) (t!24823 List!17566)) )
))
(declare-fun arrayNoDuplicates!0 (array!51579 (_ BitVec 32) List!17566) Bool)

(assert (=> b!884987 (= res!600954 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17563))))

(declare-fun b!884988 () Bool)

(declare-fun e!492584 () Bool)

(assert (=> b!884988 (= e!492584 e!492582)))

(declare-fun res!600952 () Bool)

(assert (=> b!884988 (=> res!600952 e!492582)))

(assert (=> b!884988 (= res!600952 (= k0!854 (select (arr!24804 _keys!868) from!1053)))))

(assert (=> b!884988 (not (= (select (arr!24804 _keys!868) from!1053) k0!854))))

(declare-fun lt!400719 () Unit!30163)

(declare-fun e!492581 () Unit!30163)

(assert (=> b!884988 (= lt!400719 e!492581)))

(declare-fun c!93382 () Bool)

(assert (=> b!884988 (= c!93382 (= (select (arr!24804 _keys!868) from!1053) k0!854))))

(declare-fun lt!400705 () ListLongMap!10505)

(assert (=> b!884988 (= lt!400705 lt!400711)))

(declare-fun lt!400712 () ListLongMap!10505)

(assert (=> b!884988 (= lt!400711 (+!2580 lt!400712 lt!400710))))

(assert (=> b!884988 (= lt!400710 (tuple2!11735 (select (arr!24804 _keys!868) from!1053) lt!400716))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8414 0))(
  ( (ValueCellFull!8414 (v!11370 V!28657)) (EmptyCell!8414) )
))
(declare-datatypes ((array!51581 0))(
  ( (array!51582 (arr!24805 (Array (_ BitVec 32) ValueCell!8414)) (size!25246 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51581)

(declare-fun get!13090 (ValueCell!8414 V!28657) V!28657)

(declare-fun dynLambda!1297 (Int (_ BitVec 64)) V!28657)

(assert (=> b!884988 (= lt!400716 (get!13090 (select (arr!24805 _values!688) from!1053) (dynLambda!1297 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!884989 () Bool)

(declare-fun res!600957 () Bool)

(assert (=> b!884989 (=> (not res!600957) (not e!492586))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51579 (_ BitVec 32)) Bool)

(assert (=> b!884989 (= res!600957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!28197 () Bool)

(declare-fun mapRes!28197 () Bool)

(assert (=> mapIsEmpty!28197 mapRes!28197))

(declare-fun mapNonEmpty!28197 () Bool)

(declare-fun tp!54092 () Bool)

(declare-fun e!492583 () Bool)

(assert (=> mapNonEmpty!28197 (= mapRes!28197 (and tp!54092 e!492583))))

(declare-fun mapRest!28197 () (Array (_ BitVec 32) ValueCell!8414))

(declare-fun mapValue!28197 () ValueCell!8414)

(declare-fun mapKey!28197 () (_ BitVec 32))

(assert (=> mapNonEmpty!28197 (= (arr!24805 _values!688) (store mapRest!28197 mapKey!28197 mapValue!28197))))

(declare-fun b!884990 () Bool)

(declare-fun e!492585 () Bool)

(assert (=> b!884990 (= e!492586 e!492585)))

(declare-fun res!600951 () Bool)

(assert (=> b!884990 (=> (not res!600951) (not e!492585))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!884990 (= res!600951 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400706 () array!51581)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28657)

(declare-fun zeroValue!654 () V!28657)

(declare-fun getCurrentListMapNoExtraKeys!3304 (array!51579 array!51581 (_ BitVec 32) (_ BitVec 32) V!28657 V!28657 (_ BitVec 32) Int) ListLongMap!10505)

(assert (=> b!884990 (= lt!400705 (getCurrentListMapNoExtraKeys!3304 _keys!868 lt!400706 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!884990 (= lt!400706 (array!51582 (store (arr!24805 _values!688) i!612 (ValueCellFull!8414 v!557)) (size!25246 _values!688)))))

(declare-fun lt!400704 () ListLongMap!10505)

(assert (=> b!884990 (= lt!400704 (getCurrentListMapNoExtraKeys!3304 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884991 () Bool)

(declare-fun res!600958 () Bool)

(assert (=> b!884991 (=> (not res!600958) (not e!492586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884991 (= res!600958 (validMask!0 mask!1196))))

(declare-fun b!884992 () Bool)

(declare-fun res!600950 () Bool)

(assert (=> b!884992 (=> (not res!600950) (not e!492586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884992 (= res!600950 (validKeyInArray!0 k0!854))))

(declare-fun b!884994 () Bool)

(declare-fun Unit!30165 () Unit!30163)

(assert (=> b!884994 (= e!492581 Unit!30165)))

(declare-fun lt!400715 () Unit!30163)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51579 (_ BitVec 32) (_ BitVec 32)) Unit!30163)

(assert (=> b!884994 (= lt!400715 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!884994 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17563)))

(declare-fun lt!400709 () Unit!30163)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51579 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30163)

(assert (=> b!884994 (= lt!400709 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884994 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400713 () Unit!30163)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51579 (_ BitVec 64) (_ BitVec 32) List!17566) Unit!30163)

(assert (=> b!884994 (= lt!400713 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17563))))

(assert (=> b!884994 false))

(declare-fun b!884995 () Bool)

(declare-fun Unit!30166 () Unit!30163)

(assert (=> b!884995 (= e!492581 Unit!30166)))

(declare-fun b!884996 () Bool)

(declare-fun tp_is_empty!17707 () Bool)

(assert (=> b!884996 (= e!492583 tp_is_empty!17707)))

(declare-fun b!884997 () Bool)

(declare-fun res!600949 () Bool)

(assert (=> b!884997 (=> (not res!600949) (not e!492586))))

(assert (=> b!884997 (= res!600949 (and (= (select (arr!24804 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!884998 () Bool)

(assert (=> b!884998 (= e!492585 (not e!492584))))

(declare-fun res!600953 () Bool)

(assert (=> b!884998 (=> res!600953 e!492584)))

(assert (=> b!884998 (= res!600953 (not (validKeyInArray!0 (select (arr!24804 _keys!868) from!1053))))))

(declare-fun lt!400708 () ListLongMap!10505)

(assert (=> b!884998 (= lt!400708 lt!400712)))

(assert (=> b!884998 (= lt!400712 (+!2580 lt!400717 lt!400718))))

(assert (=> b!884998 (= lt!400708 (getCurrentListMapNoExtraKeys!3304 _keys!868 lt!400706 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!884998 (= lt!400718 (tuple2!11735 k0!854 v!557))))

(assert (=> b!884998 (= lt!400717 (getCurrentListMapNoExtraKeys!3304 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400714 () Unit!30163)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!741 (array!51579 array!51581 (_ BitVec 32) (_ BitVec 32) V!28657 V!28657 (_ BitVec 32) (_ BitVec 64) V!28657 (_ BitVec 32) Int) Unit!30163)

(assert (=> b!884998 (= lt!400714 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!741 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884999 () Bool)

(declare-fun res!600956 () Bool)

(assert (=> b!884999 (=> (not res!600956) (not e!492586))))

(assert (=> b!884999 (= res!600956 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25245 _keys!868))))))

(declare-fun res!600959 () Bool)

(assert (=> start!75112 (=> (not res!600959) (not e!492586))))

(assert (=> start!75112 (= res!600959 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25245 _keys!868))))))

(assert (=> start!75112 e!492586))

(assert (=> start!75112 tp_is_empty!17707))

(assert (=> start!75112 true))

(assert (=> start!75112 tp!54093))

(declare-fun array_inv!19566 (array!51579) Bool)

(assert (=> start!75112 (array_inv!19566 _keys!868)))

(declare-fun e!492580 () Bool)

(declare-fun array_inv!19567 (array!51581) Bool)

(assert (=> start!75112 (and (array_inv!19567 _values!688) e!492580)))

(declare-fun b!884993 () Bool)

(declare-fun res!600955 () Bool)

(assert (=> b!884993 (=> (not res!600955) (not e!492586))))

(assert (=> b!884993 (= res!600955 (and (= (size!25246 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25245 _keys!868) (size!25246 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!885000 () Bool)

(declare-fun e!492587 () Bool)

(assert (=> b!885000 (= e!492580 (and e!492587 mapRes!28197))))

(declare-fun condMapEmpty!28197 () Bool)

(declare-fun mapDefault!28197 () ValueCell!8414)

(assert (=> b!885000 (= condMapEmpty!28197 (= (arr!24805 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8414)) mapDefault!28197)))))

(declare-fun b!885001 () Bool)

(assert (=> b!885001 (= e!492587 tp_is_empty!17707)))

(assert (= (and start!75112 res!600959) b!884991))

(assert (= (and b!884991 res!600958) b!884993))

(assert (= (and b!884993 res!600955) b!884989))

(assert (= (and b!884989 res!600957) b!884987))

(assert (= (and b!884987 res!600954) b!884999))

(assert (= (and b!884999 res!600956) b!884992))

(assert (= (and b!884992 res!600950) b!884997))

(assert (= (and b!884997 res!600949) b!884990))

(assert (= (and b!884990 res!600951) b!884998))

(assert (= (and b!884998 (not res!600953)) b!884988))

(assert (= (and b!884988 c!93382) b!884994))

(assert (= (and b!884988 (not c!93382)) b!884995))

(assert (= (and b!884988 (not res!600952)) b!884986))

(assert (= (and b!885000 condMapEmpty!28197) mapIsEmpty!28197))

(assert (= (and b!885000 (not condMapEmpty!28197)) mapNonEmpty!28197))

(get-info :version)

(assert (= (and mapNonEmpty!28197 ((_ is ValueCellFull!8414) mapValue!28197)) b!884996))

(assert (= (and b!885000 ((_ is ValueCellFull!8414) mapDefault!28197)) b!885001))

(assert (= start!75112 b!885000))

(declare-fun b_lambda!12755 () Bool)

(assert (=> (not b_lambda!12755) (not b!884988)))

(declare-fun t!24821 () Bool)

(declare-fun tb!5113 () Bool)

(assert (=> (and start!75112 (= defaultEntry!696 defaultEntry!696) t!24821) tb!5113))

(declare-fun result!9869 () Bool)

(assert (=> tb!5113 (= result!9869 tp_is_empty!17707)))

(assert (=> b!884988 t!24821))

(declare-fun b_and!25637 () Bool)

(assert (= b_and!25635 (and (=> t!24821 result!9869) b_and!25637)))

(declare-fun m!825513 () Bool)

(assert (=> b!884988 m!825513))

(declare-fun m!825515 () Bool)

(assert (=> b!884988 m!825515))

(declare-fun m!825517 () Bool)

(assert (=> b!884988 m!825517))

(declare-fun m!825519 () Bool)

(assert (=> b!884988 m!825519))

(assert (=> b!884988 m!825515))

(declare-fun m!825521 () Bool)

(assert (=> b!884988 m!825521))

(assert (=> b!884988 m!825517))

(declare-fun m!825523 () Bool)

(assert (=> mapNonEmpty!28197 m!825523))

(declare-fun m!825525 () Bool)

(assert (=> b!884994 m!825525))

(declare-fun m!825527 () Bool)

(assert (=> b!884994 m!825527))

(declare-fun m!825529 () Bool)

(assert (=> b!884994 m!825529))

(declare-fun m!825531 () Bool)

(assert (=> b!884994 m!825531))

(declare-fun m!825533 () Bool)

(assert (=> b!884994 m!825533))

(declare-fun m!825535 () Bool)

(assert (=> b!884998 m!825535))

(declare-fun m!825537 () Bool)

(assert (=> b!884998 m!825537))

(assert (=> b!884998 m!825521))

(declare-fun m!825539 () Bool)

(assert (=> b!884998 m!825539))

(assert (=> b!884998 m!825521))

(declare-fun m!825541 () Bool)

(assert (=> b!884998 m!825541))

(declare-fun m!825543 () Bool)

(assert (=> b!884998 m!825543))

(declare-fun m!825545 () Bool)

(assert (=> b!884986 m!825545))

(assert (=> b!884986 m!825545))

(declare-fun m!825547 () Bool)

(assert (=> b!884986 m!825547))

(assert (=> b!884986 m!825521))

(assert (=> b!884986 m!825521))

(declare-fun m!825549 () Bool)

(assert (=> b!884986 m!825549))

(declare-fun m!825551 () Bool)

(assert (=> b!884997 m!825551))

(declare-fun m!825553 () Bool)

(assert (=> b!884987 m!825553))

(declare-fun m!825555 () Bool)

(assert (=> start!75112 m!825555))

(declare-fun m!825557 () Bool)

(assert (=> start!75112 m!825557))

(declare-fun m!825559 () Bool)

(assert (=> b!884991 m!825559))

(declare-fun m!825561 () Bool)

(assert (=> b!884989 m!825561))

(declare-fun m!825563 () Bool)

(assert (=> b!884990 m!825563))

(declare-fun m!825565 () Bool)

(assert (=> b!884990 m!825565))

(declare-fun m!825567 () Bool)

(assert (=> b!884990 m!825567))

(declare-fun m!825569 () Bool)

(assert (=> b!884992 m!825569))

(check-sat (not b!884998) (not b!884990) (not start!75112) (not b!884987) (not b!884989) (not b!884986) (not b!884992) (not b_lambda!12755) (not b_next!15463) (not b!884988) (not b!884994) (not mapNonEmpty!28197) tp_is_empty!17707 (not b!884991) b_and!25637)
(check-sat b_and!25637 (not b_next!15463))
