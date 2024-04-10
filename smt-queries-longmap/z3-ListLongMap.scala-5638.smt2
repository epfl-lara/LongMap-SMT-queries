; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73614 () Bool)

(assert start!73614)

(declare-fun b_free!14529 () Bool)

(declare-fun b_next!14529 () Bool)

(assert (=> start!73614 (= b_free!14529 (not b_next!14529))))

(declare-fun tp!51091 () Bool)

(declare-fun b_and!24037 () Bool)

(assert (=> start!73614 (= tp!51091 b_and!24037)))

(declare-fun b!861515 () Bool)

(declare-fun res!585474 () Bool)

(declare-fun e!480010 () Bool)

(assert (=> b!861515 (=> (not res!585474) (not e!480010))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49496 0))(
  ( (array!49497 (arr!23779 (Array (_ BitVec 32) (_ BitVec 64))) (size!24219 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49496)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!861515 (= res!585474 (and (= (select (arr!23779 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861516 () Bool)

(declare-fun e!480007 () Bool)

(declare-fun e!480009 () Bool)

(declare-fun mapRes!26597 () Bool)

(assert (=> b!861516 (= e!480007 (and e!480009 mapRes!26597))))

(declare-fun condMapEmpty!26597 () Bool)

(declare-datatypes ((V!27267 0))(
  ( (V!27268 (val!8380 Int)) )
))
(declare-datatypes ((ValueCell!7893 0))(
  ( (ValueCellFull!7893 (v!10805 V!27267)) (EmptyCell!7893) )
))
(declare-datatypes ((array!49498 0))(
  ( (array!49499 (arr!23780 (Array (_ BitVec 32) ValueCell!7893)) (size!24220 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49498)

(declare-fun mapDefault!26597 () ValueCell!7893)

(assert (=> b!861516 (= condMapEmpty!26597 (= (arr!23780 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7893)) mapDefault!26597)))))

(declare-fun b!861517 () Bool)

(declare-fun res!585475 () Bool)

(assert (=> b!861517 (=> (not res!585475) (not e!480010))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!861517 (= res!585475 (and (= (size!24220 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24219 _keys!868) (size!24220 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861518 () Bool)

(declare-datatypes ((Unit!29386 0))(
  ( (Unit!29387) )
))
(declare-fun e!480011 () Unit!29386)

(declare-fun Unit!29388 () Unit!29386)

(assert (=> b!861518 (= e!480011 Unit!29388)))

(declare-fun b!861519 () Bool)

(declare-fun res!585472 () Bool)

(assert (=> b!861519 (=> (not res!585472) (not e!480010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861519 (= res!585472 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26597 () Bool)

(declare-fun tp!51090 () Bool)

(declare-fun e!480012 () Bool)

(assert (=> mapNonEmpty!26597 (= mapRes!26597 (and tp!51090 e!480012))))

(declare-fun mapRest!26597 () (Array (_ BitVec 32) ValueCell!7893))

(declare-fun mapKey!26597 () (_ BitVec 32))

(declare-fun mapValue!26597 () ValueCell!7893)

(assert (=> mapNonEmpty!26597 (= (arr!23780 _values!688) (store mapRest!26597 mapKey!26597 mapValue!26597))))

(declare-fun b!861520 () Bool)

(declare-fun Unit!29389 () Unit!29386)

(assert (=> b!861520 (= e!480011 Unit!29389)))

(declare-fun lt!388549 () Unit!29386)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49496 (_ BitVec 32) (_ BitVec 32)) Unit!29386)

(assert (=> b!861520 (= lt!388549 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16885 0))(
  ( (Nil!16882) (Cons!16881 (h!18012 (_ BitVec 64)) (t!23680 List!16885)) )
))
(declare-fun arrayNoDuplicates!0 (array!49496 (_ BitVec 32) List!16885) Bool)

(assert (=> b!861520 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16882)))

(declare-fun lt!388546 () Unit!29386)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49496 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29386)

(assert (=> b!861520 (= lt!388546 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861520 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388552 () Unit!29386)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49496 (_ BitVec 64) (_ BitVec 32) List!16885) Unit!29386)

(assert (=> b!861520 (= lt!388552 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16882))))

(assert (=> b!861520 false))

(declare-fun b!861521 () Bool)

(declare-fun tp_is_empty!16665 () Bool)

(assert (=> b!861521 (= e!480009 tp_is_empty!16665)))

(declare-fun b!861522 () Bool)

(declare-fun res!585471 () Bool)

(assert (=> b!861522 (=> (not res!585471) (not e!480010))))

(assert (=> b!861522 (= res!585471 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16882))))

(declare-fun b!861523 () Bool)

(declare-fun res!585467 () Bool)

(assert (=> b!861523 (=> (not res!585467) (not e!480010))))

(assert (=> b!861523 (= res!585467 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24219 _keys!868))))))

(declare-fun res!585476 () Bool)

(assert (=> start!73614 (=> (not res!585476) (not e!480010))))

(assert (=> start!73614 (= res!585476 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24219 _keys!868))))))

(assert (=> start!73614 e!480010))

(assert (=> start!73614 tp_is_empty!16665))

(assert (=> start!73614 true))

(assert (=> start!73614 tp!51091))

(declare-fun array_inv!18818 (array!49496) Bool)

(assert (=> start!73614 (array_inv!18818 _keys!868)))

(declare-fun array_inv!18819 (array!49498) Bool)

(assert (=> start!73614 (and (array_inv!18819 _values!688) e!480007)))

(declare-fun b!861524 () Bool)

(declare-fun e!480008 () Bool)

(declare-fun e!480006 () Bool)

(assert (=> b!861524 (= e!480008 (not e!480006))))

(declare-fun res!585470 () Bool)

(assert (=> b!861524 (=> res!585470 e!480006)))

(assert (=> b!861524 (= res!585470 (not (validKeyInArray!0 (select (arr!23779 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11076 0))(
  ( (tuple2!11077 (_1!5549 (_ BitVec 64)) (_2!5549 V!27267)) )
))
(declare-datatypes ((List!16886 0))(
  ( (Nil!16883) (Cons!16882 (h!18013 tuple2!11076) (t!23681 List!16886)) )
))
(declare-datatypes ((ListLongMap!9845 0))(
  ( (ListLongMap!9846 (toList!4938 List!16886)) )
))
(declare-fun lt!388547 () ListLongMap!9845)

(declare-fun lt!388551 () ListLongMap!9845)

(assert (=> b!861524 (= lt!388547 lt!388551)))

(declare-fun lt!388555 () ListLongMap!9845)

(declare-fun v!557 () V!27267)

(declare-fun +!2288 (ListLongMap!9845 tuple2!11076) ListLongMap!9845)

(assert (=> b!861524 (= lt!388551 (+!2288 lt!388555 (tuple2!11077 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!388548 () array!49498)

(declare-fun minValue!654 () V!27267)

(declare-fun zeroValue!654 () V!27267)

(declare-fun getCurrentListMapNoExtraKeys!2915 (array!49496 array!49498 (_ BitVec 32) (_ BitVec 32) V!27267 V!27267 (_ BitVec 32) Int) ListLongMap!9845)

(assert (=> b!861524 (= lt!388547 (getCurrentListMapNoExtraKeys!2915 _keys!868 lt!388548 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861524 (= lt!388555 (getCurrentListMapNoExtraKeys!2915 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388554 () Unit!29386)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!499 (array!49496 array!49498 (_ BitVec 32) (_ BitVec 32) V!27267 V!27267 (_ BitVec 32) (_ BitVec 64) V!27267 (_ BitVec 32) Int) Unit!29386)

(assert (=> b!861524 (= lt!388554 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!499 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861525 () Bool)

(declare-fun res!585468 () Bool)

(assert (=> b!861525 (=> (not res!585468) (not e!480010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861525 (= res!585468 (validMask!0 mask!1196))))

(declare-fun b!861526 () Bool)

(assert (=> b!861526 (= e!480012 tp_is_empty!16665)))

(declare-fun b!861527 () Bool)

(assert (=> b!861527 (= e!480006 true)))

(assert (=> b!861527 (not (= (select (arr!23779 _keys!868) from!1053) k0!854))))

(declare-fun lt!388545 () Unit!29386)

(assert (=> b!861527 (= lt!388545 e!480011)))

(declare-fun c!92014 () Bool)

(assert (=> b!861527 (= c!92014 (= (select (arr!23779 _keys!868) from!1053) k0!854))))

(declare-fun lt!388553 () ListLongMap!9845)

(declare-fun get!12544 (ValueCell!7893 V!27267) V!27267)

(declare-fun dynLambda!1124 (Int (_ BitVec 64)) V!27267)

(assert (=> b!861527 (= lt!388553 (+!2288 lt!388551 (tuple2!11077 (select (arr!23779 _keys!868) from!1053) (get!12544 (select (arr!23780 _values!688) from!1053) (dynLambda!1124 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!26597 () Bool)

(assert (=> mapIsEmpty!26597 mapRes!26597))

(declare-fun b!861528 () Bool)

(declare-fun res!585473 () Bool)

(assert (=> b!861528 (=> (not res!585473) (not e!480010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49496 (_ BitVec 32)) Bool)

(assert (=> b!861528 (= res!585473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861529 () Bool)

(assert (=> b!861529 (= e!480010 e!480008)))

(declare-fun res!585469 () Bool)

(assert (=> b!861529 (=> (not res!585469) (not e!480008))))

(assert (=> b!861529 (= res!585469 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!861529 (= lt!388553 (getCurrentListMapNoExtraKeys!2915 _keys!868 lt!388548 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!861529 (= lt!388548 (array!49499 (store (arr!23780 _values!688) i!612 (ValueCellFull!7893 v!557)) (size!24220 _values!688)))))

(declare-fun lt!388550 () ListLongMap!9845)

(assert (=> b!861529 (= lt!388550 (getCurrentListMapNoExtraKeys!2915 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73614 res!585476) b!861525))

(assert (= (and b!861525 res!585468) b!861517))

(assert (= (and b!861517 res!585475) b!861528))

(assert (= (and b!861528 res!585473) b!861522))

(assert (= (and b!861522 res!585471) b!861523))

(assert (= (and b!861523 res!585467) b!861519))

(assert (= (and b!861519 res!585472) b!861515))

(assert (= (and b!861515 res!585474) b!861529))

(assert (= (and b!861529 res!585469) b!861524))

(assert (= (and b!861524 (not res!585470)) b!861527))

(assert (= (and b!861527 c!92014) b!861520))

(assert (= (and b!861527 (not c!92014)) b!861518))

(assert (= (and b!861516 condMapEmpty!26597) mapIsEmpty!26597))

(assert (= (and b!861516 (not condMapEmpty!26597)) mapNonEmpty!26597))

(get-info :version)

(assert (= (and mapNonEmpty!26597 ((_ is ValueCellFull!7893) mapValue!26597)) b!861526))

(assert (= (and b!861516 ((_ is ValueCellFull!7893) mapDefault!26597)) b!861521))

(assert (= start!73614 b!861516))

(declare-fun b_lambda!11881 () Bool)

(assert (=> (not b_lambda!11881) (not b!861527)))

(declare-fun t!23679 () Bool)

(declare-fun tb!4651 () Bool)

(assert (=> (and start!73614 (= defaultEntry!696 defaultEntry!696) t!23679) tb!4651))

(declare-fun result!8913 () Bool)

(assert (=> tb!4651 (= result!8913 tp_is_empty!16665)))

(assert (=> b!861527 t!23679))

(declare-fun b_and!24039 () Bool)

(assert (= b_and!24037 (and (=> t!23679 result!8913) b_and!24039)))

(declare-fun m!802425 () Bool)

(assert (=> b!861527 m!802425))

(declare-fun m!802427 () Bool)

(assert (=> b!861527 m!802427))

(declare-fun m!802429 () Bool)

(assert (=> b!861527 m!802429))

(assert (=> b!861527 m!802425))

(assert (=> b!861527 m!802429))

(declare-fun m!802431 () Bool)

(assert (=> b!861527 m!802431))

(declare-fun m!802433 () Bool)

(assert (=> b!861527 m!802433))

(declare-fun m!802435 () Bool)

(assert (=> b!861519 m!802435))

(declare-fun m!802437 () Bool)

(assert (=> b!861524 m!802437))

(declare-fun m!802439 () Bool)

(assert (=> b!861524 m!802439))

(assert (=> b!861524 m!802427))

(declare-fun m!802441 () Bool)

(assert (=> b!861524 m!802441))

(assert (=> b!861524 m!802427))

(declare-fun m!802443 () Bool)

(assert (=> b!861524 m!802443))

(declare-fun m!802445 () Bool)

(assert (=> b!861524 m!802445))

(declare-fun m!802447 () Bool)

(assert (=> b!861528 m!802447))

(declare-fun m!802449 () Bool)

(assert (=> b!861525 m!802449))

(declare-fun m!802451 () Bool)

(assert (=> start!73614 m!802451))

(declare-fun m!802453 () Bool)

(assert (=> start!73614 m!802453))

(declare-fun m!802455 () Bool)

(assert (=> b!861515 m!802455))

(declare-fun m!802457 () Bool)

(assert (=> b!861522 m!802457))

(declare-fun m!802459 () Bool)

(assert (=> mapNonEmpty!26597 m!802459))

(declare-fun m!802461 () Bool)

(assert (=> b!861529 m!802461))

(declare-fun m!802463 () Bool)

(assert (=> b!861529 m!802463))

(declare-fun m!802465 () Bool)

(assert (=> b!861529 m!802465))

(declare-fun m!802467 () Bool)

(assert (=> b!861520 m!802467))

(declare-fun m!802469 () Bool)

(assert (=> b!861520 m!802469))

(declare-fun m!802471 () Bool)

(assert (=> b!861520 m!802471))

(declare-fun m!802473 () Bool)

(assert (=> b!861520 m!802473))

(declare-fun m!802475 () Bool)

(assert (=> b!861520 m!802475))

(check-sat (not start!73614) (not b!861525) (not b!861524) (not b!861527) (not b!861520) (not b!861522) (not b!861529) (not b_lambda!11881) tp_is_empty!16665 b_and!24039 (not b!861528) (not b!861519) (not mapNonEmpty!26597) (not b_next!14529))
(check-sat b_and!24039 (not b_next!14529))
