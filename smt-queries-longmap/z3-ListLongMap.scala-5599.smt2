; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73380 () Bool)

(assert start!73380)

(declare-fun b_free!14295 () Bool)

(declare-fun b_next!14295 () Bool)

(assert (=> start!73380 (= b_free!14295 (not b_next!14295))))

(declare-fun tp!50388 () Bool)

(declare-fun b_and!23651 () Bool)

(assert (=> start!73380 (= tp!50388 b_and!23651)))

(declare-fun b!856434 () Bool)

(declare-fun e!477396 () Bool)

(assert (=> b!856434 (= e!477396 (not true))))

(declare-datatypes ((V!26955 0))(
  ( (V!26956 (val!8263 Int)) )
))
(declare-fun v!557 () V!26955)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7776 0))(
  ( (ValueCellFull!7776 (v!10688 V!26955)) (EmptyCell!7776) )
))
(declare-datatypes ((array!49054 0))(
  ( (array!49055 (arr!23558 (Array (_ BitVec 32) ValueCell!7776)) (size!23998 (_ BitVec 32))) )
))
(declare-fun lt!385954 () array!49054)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49056 0))(
  ( (array!49057 (arr!23559 (Array (_ BitVec 32) (_ BitVec 64))) (size!23999 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49056)

(declare-fun _values!688 () array!49054)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26955)

(declare-fun zeroValue!654 () V!26955)

(declare-datatypes ((tuple2!10894 0))(
  ( (tuple2!10895 (_1!5458 (_ BitVec 64)) (_2!5458 V!26955)) )
))
(declare-datatypes ((List!16705 0))(
  ( (Nil!16702) (Cons!16701 (h!17832 tuple2!10894) (t!23346 List!16705)) )
))
(declare-datatypes ((ListLongMap!9663 0))(
  ( (ListLongMap!9664 (toList!4847 List!16705)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2828 (array!49056 array!49054 (_ BitVec 32) (_ BitVec 32) V!26955 V!26955 (_ BitVec 32) Int) ListLongMap!9663)

(declare-fun +!2203 (ListLongMap!9663 tuple2!10894) ListLongMap!9663)

(assert (=> b!856434 (= (getCurrentListMapNoExtraKeys!2828 _keys!868 lt!385954 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2203 (getCurrentListMapNoExtraKeys!2828 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10895 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29193 0))(
  ( (Unit!29194) )
))
(declare-fun lt!385955 () Unit!29193)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!424 (array!49056 array!49054 (_ BitVec 32) (_ BitVec 32) V!26955 V!26955 (_ BitVec 32) (_ BitVec 64) V!26955 (_ BitVec 32) Int) Unit!29193)

(assert (=> b!856434 (= lt!385955 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!424 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856435 () Bool)

(declare-fun res!581697 () Bool)

(declare-fun e!477398 () Bool)

(assert (=> b!856435 (=> (not res!581697) (not e!477398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49056 (_ BitVec 32)) Bool)

(assert (=> b!856435 (= res!581697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856436 () Bool)

(declare-fun res!581698 () Bool)

(assert (=> b!856436 (=> (not res!581698) (not e!477398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856436 (= res!581698 (validMask!0 mask!1196))))

(declare-fun b!856437 () Bool)

(declare-fun e!477400 () Bool)

(declare-fun tp_is_empty!16431 () Bool)

(assert (=> b!856437 (= e!477400 tp_is_empty!16431)))

(declare-fun b!856438 () Bool)

(declare-fun e!477397 () Bool)

(assert (=> b!856438 (= e!477397 tp_is_empty!16431)))

(declare-fun b!856439 () Bool)

(assert (=> b!856439 (= e!477398 e!477396)))

(declare-fun res!581692 () Bool)

(assert (=> b!856439 (=> (not res!581692) (not e!477396))))

(assert (=> b!856439 (= res!581692 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385956 () ListLongMap!9663)

(assert (=> b!856439 (= lt!385956 (getCurrentListMapNoExtraKeys!2828 _keys!868 lt!385954 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856439 (= lt!385954 (array!49055 (store (arr!23558 _values!688) i!612 (ValueCellFull!7776 v!557)) (size!23998 _values!688)))))

(declare-fun lt!385957 () ListLongMap!9663)

(assert (=> b!856439 (= lt!385957 (getCurrentListMapNoExtraKeys!2828 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856440 () Bool)

(declare-fun res!581695 () Bool)

(assert (=> b!856440 (=> (not res!581695) (not e!477398))))

(assert (=> b!856440 (= res!581695 (and (= (size!23998 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23999 _keys!868) (size!23998 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!581691 () Bool)

(assert (=> start!73380 (=> (not res!581691) (not e!477398))))

(assert (=> start!73380 (= res!581691 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23999 _keys!868))))))

(assert (=> start!73380 e!477398))

(assert (=> start!73380 tp_is_empty!16431))

(assert (=> start!73380 true))

(assert (=> start!73380 tp!50388))

(declare-fun array_inv!18662 (array!49056) Bool)

(assert (=> start!73380 (array_inv!18662 _keys!868)))

(declare-fun e!477399 () Bool)

(declare-fun array_inv!18663 (array!49054) Bool)

(assert (=> start!73380 (and (array_inv!18663 _values!688) e!477399)))

(declare-fun b!856441 () Bool)

(declare-fun res!581693 () Bool)

(assert (=> b!856441 (=> (not res!581693) (not e!477398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856441 (= res!581693 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26246 () Bool)

(declare-fun mapRes!26246 () Bool)

(assert (=> mapIsEmpty!26246 mapRes!26246))

(declare-fun mapNonEmpty!26246 () Bool)

(declare-fun tp!50389 () Bool)

(assert (=> mapNonEmpty!26246 (= mapRes!26246 (and tp!50389 e!477397))))

(declare-fun mapRest!26246 () (Array (_ BitVec 32) ValueCell!7776))

(declare-fun mapKey!26246 () (_ BitVec 32))

(declare-fun mapValue!26246 () ValueCell!7776)

(assert (=> mapNonEmpty!26246 (= (arr!23558 _values!688) (store mapRest!26246 mapKey!26246 mapValue!26246))))

(declare-fun b!856442 () Bool)

(assert (=> b!856442 (= e!477399 (and e!477400 mapRes!26246))))

(declare-fun condMapEmpty!26246 () Bool)

(declare-fun mapDefault!26246 () ValueCell!7776)

(assert (=> b!856442 (= condMapEmpty!26246 (= (arr!23558 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7776)) mapDefault!26246)))))

(declare-fun b!856443 () Bool)

(declare-fun res!581696 () Bool)

(assert (=> b!856443 (=> (not res!581696) (not e!477398))))

(assert (=> b!856443 (= res!581696 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23999 _keys!868))))))

(declare-fun b!856444 () Bool)

(declare-fun res!581694 () Bool)

(assert (=> b!856444 (=> (not res!581694) (not e!477398))))

(declare-datatypes ((List!16706 0))(
  ( (Nil!16703) (Cons!16702 (h!17833 (_ BitVec 64)) (t!23347 List!16706)) )
))
(declare-fun arrayNoDuplicates!0 (array!49056 (_ BitVec 32) List!16706) Bool)

(assert (=> b!856444 (= res!581694 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16703))))

(declare-fun b!856445 () Bool)

(declare-fun res!581699 () Bool)

(assert (=> b!856445 (=> (not res!581699) (not e!477398))))

(assert (=> b!856445 (= res!581699 (and (= (select (arr!23559 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73380 res!581691) b!856436))

(assert (= (and b!856436 res!581698) b!856440))

(assert (= (and b!856440 res!581695) b!856435))

(assert (= (and b!856435 res!581697) b!856444))

(assert (= (and b!856444 res!581694) b!856443))

(assert (= (and b!856443 res!581696) b!856441))

(assert (= (and b!856441 res!581693) b!856445))

(assert (= (and b!856445 res!581699) b!856439))

(assert (= (and b!856439 res!581692) b!856434))

(assert (= (and b!856442 condMapEmpty!26246) mapIsEmpty!26246))

(assert (= (and b!856442 (not condMapEmpty!26246)) mapNonEmpty!26246))

(get-info :version)

(assert (= (and mapNonEmpty!26246 ((_ is ValueCellFull!7776) mapValue!26246)) b!856438))

(assert (= (and b!856442 ((_ is ValueCellFull!7776) mapDefault!26246)) b!856437))

(assert (= start!73380 b!856442))

(declare-fun m!797381 () Bool)

(assert (=> b!856445 m!797381))

(declare-fun m!797383 () Bool)

(assert (=> start!73380 m!797383))

(declare-fun m!797385 () Bool)

(assert (=> start!73380 m!797385))

(declare-fun m!797387 () Bool)

(assert (=> b!856444 m!797387))

(declare-fun m!797389 () Bool)

(assert (=> b!856436 m!797389))

(declare-fun m!797391 () Bool)

(assert (=> mapNonEmpty!26246 m!797391))

(declare-fun m!797393 () Bool)

(assert (=> b!856435 m!797393))

(declare-fun m!797395 () Bool)

(assert (=> b!856439 m!797395))

(declare-fun m!797397 () Bool)

(assert (=> b!856439 m!797397))

(declare-fun m!797399 () Bool)

(assert (=> b!856439 m!797399))

(declare-fun m!797401 () Bool)

(assert (=> b!856434 m!797401))

(declare-fun m!797403 () Bool)

(assert (=> b!856434 m!797403))

(assert (=> b!856434 m!797403))

(declare-fun m!797405 () Bool)

(assert (=> b!856434 m!797405))

(declare-fun m!797407 () Bool)

(assert (=> b!856434 m!797407))

(declare-fun m!797409 () Bool)

(assert (=> b!856441 m!797409))

(check-sat (not b!856434) b_and!23651 (not b!856444) (not mapNonEmpty!26246) tp_is_empty!16431 (not b!856439) (not start!73380) (not b_next!14295) (not b!856441) (not b!856436) (not b!856435))
(check-sat b_and!23651 (not b_next!14295))
