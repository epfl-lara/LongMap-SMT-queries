; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41042 () Bool)

(assert start!41042)

(declare-fun b_free!10969 () Bool)

(declare-fun b_next!10969 () Bool)

(assert (=> start!41042 (= b_free!10969 (not b_next!10969))))

(declare-fun tp!38737 () Bool)

(declare-fun b_and!19155 () Bool)

(assert (=> start!41042 (= tp!38737 b_and!19155)))

(declare-fun b!457659 () Bool)

(declare-fun e!267261 () Bool)

(declare-fun tp_is_empty!12307 () Bool)

(assert (=> b!457659 (= e!267261 tp_is_empty!12307)))

(declare-fun b!457660 () Bool)

(declare-fun e!267263 () Bool)

(declare-fun mapRes!20104 () Bool)

(assert (=> b!457660 (= e!267263 (and e!267261 mapRes!20104))))

(declare-fun condMapEmpty!20104 () Bool)

(declare-datatypes ((V!17515 0))(
  ( (V!17516 (val!6198 Int)) )
))
(declare-datatypes ((ValueCell!5810 0))(
  ( (ValueCellFull!5810 (v!8469 V!17515)) (EmptyCell!5810) )
))
(declare-datatypes ((array!28406 0))(
  ( (array!28407 (arr!13645 (Array (_ BitVec 32) ValueCell!5810)) (size!13997 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28406)

(declare-fun mapDefault!20104 () ValueCell!5810)

(assert (=> b!457660 (= condMapEmpty!20104 (= (arr!13645 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5810)) mapDefault!20104)))))

(declare-fun res!273350 () Bool)

(declare-fun e!267264 () Bool)

(assert (=> start!41042 (=> (not res!273350) (not e!267264))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28408 0))(
  ( (array!28409 (arr!13646 (Array (_ BitVec 32) (_ BitVec 64))) (size!13998 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28408)

(assert (=> start!41042 (= res!273350 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13998 _keys!709))))))

(assert (=> start!41042 e!267264))

(assert (=> start!41042 tp_is_empty!12307))

(assert (=> start!41042 tp!38737))

(assert (=> start!41042 true))

(declare-fun array_inv!9954 (array!28406) Bool)

(assert (=> start!41042 (and (array_inv!9954 _values!549) e!267263)))

(declare-fun array_inv!9955 (array!28408) Bool)

(assert (=> start!41042 (array_inv!9955 _keys!709)))

(declare-fun mapNonEmpty!20104 () Bool)

(declare-fun tp!38736 () Bool)

(declare-fun e!267265 () Bool)

(assert (=> mapNonEmpty!20104 (= mapRes!20104 (and tp!38736 e!267265))))

(declare-fun mapValue!20104 () ValueCell!5810)

(declare-fun mapKey!20104 () (_ BitVec 32))

(declare-fun mapRest!20104 () (Array (_ BitVec 32) ValueCell!5810))

(assert (=> mapNonEmpty!20104 (= (arr!13645 _values!549) (store mapRest!20104 mapKey!20104 mapValue!20104))))

(declare-fun b!457661 () Bool)

(declare-fun res!273353 () Bool)

(assert (=> b!457661 (=> (not res!273353) (not e!267264))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457661 (= res!273353 (validKeyInArray!0 k0!794))))

(declare-fun b!457662 () Bool)

(declare-fun res!273349 () Bool)

(declare-fun e!267267 () Bool)

(assert (=> b!457662 (=> (not res!273349) (not e!267267))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457662 (= res!273349 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!20104 () Bool)

(assert (=> mapIsEmpty!20104 mapRes!20104))

(declare-fun b!457663 () Bool)

(declare-fun e!267260 () Bool)

(assert (=> b!457663 (= e!267260 (or (not (= (select (arr!13646 _keys!709) from!863) k0!794)) (bvslt from!863 (size!13998 _keys!709))))))

(declare-datatypes ((tuple2!8082 0))(
  ( (tuple2!8083 (_1!4052 (_ BitVec 64)) (_2!4052 V!17515)) )
))
(declare-datatypes ((List!8154 0))(
  ( (Nil!8151) (Cons!8150 (h!9006 tuple2!8082) (t!13994 List!8154)) )
))
(declare-datatypes ((ListLongMap!6997 0))(
  ( (ListLongMap!6998 (toList!3514 List!8154)) )
))
(declare-fun lt!207054 () ListLongMap!6997)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!207060 () ListLongMap!6997)

(declare-fun +!1596 (ListLongMap!6997 tuple2!8082) ListLongMap!6997)

(declare-fun get!6725 (ValueCell!5810 V!17515) V!17515)

(declare-fun dynLambda!879 (Int (_ BitVec 64)) V!17515)

(assert (=> b!457663 (= lt!207054 (+!1596 lt!207060 (tuple2!8083 (select (arr!13646 _keys!709) from!863) (get!6725 (select (arr!13645 _values!549) from!863) (dynLambda!879 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457664 () Bool)

(assert (=> b!457664 (= e!267265 tp_is_empty!12307)))

(declare-fun b!457665 () Bool)

(declare-fun res!273343 () Bool)

(assert (=> b!457665 (=> (not res!273343) (not e!267264))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28408 (_ BitVec 32)) Bool)

(assert (=> b!457665 (= res!273343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457666 () Bool)

(declare-fun res!273340 () Bool)

(assert (=> b!457666 (=> (not res!273340) (not e!267264))))

(assert (=> b!457666 (= res!273340 (or (= (select (arr!13646 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13646 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457667 () Bool)

(declare-fun res!273341 () Bool)

(assert (=> b!457667 (=> (not res!273341) (not e!267264))))

(declare-fun arrayContainsKey!0 (array!28408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457667 (= res!273341 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457668 () Bool)

(declare-fun e!267266 () Bool)

(assert (=> b!457668 (= e!267266 (not e!267260))))

(declare-fun res!273352 () Bool)

(assert (=> b!457668 (=> res!273352 e!267260)))

(assert (=> b!457668 (= res!273352 (not (validKeyInArray!0 (select (arr!13646 _keys!709) from!863))))))

(declare-fun lt!207058 () ListLongMap!6997)

(assert (=> b!457668 (= lt!207058 lt!207060)))

(declare-fun lt!207053 () ListLongMap!6997)

(declare-fun v!412 () V!17515)

(assert (=> b!457668 (= lt!207060 (+!1596 lt!207053 (tuple2!8083 k0!794 v!412)))))

(declare-fun minValue!515 () V!17515)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17515)

(declare-fun lt!207055 () array!28406)

(declare-fun lt!207057 () array!28408)

(declare-fun getCurrentListMapNoExtraKeys!1743 (array!28408 array!28406 (_ BitVec 32) (_ BitVec 32) V!17515 V!17515 (_ BitVec 32) Int) ListLongMap!6997)

(assert (=> b!457668 (= lt!207058 (getCurrentListMapNoExtraKeys!1743 lt!207057 lt!207055 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457668 (= lt!207053 (getCurrentListMapNoExtraKeys!1743 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13295 0))(
  ( (Unit!13296) )
))
(declare-fun lt!207056 () Unit!13295)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!755 (array!28408 array!28406 (_ BitVec 32) (_ BitVec 32) V!17515 V!17515 (_ BitVec 32) (_ BitVec 64) V!17515 (_ BitVec 32) Int) Unit!13295)

(assert (=> b!457668 (= lt!207056 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!755 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457669 () Bool)

(declare-fun res!273342 () Bool)

(assert (=> b!457669 (=> (not res!273342) (not e!267264))))

(declare-datatypes ((List!8155 0))(
  ( (Nil!8152) (Cons!8151 (h!9007 (_ BitVec 64)) (t!13995 List!8155)) )
))
(declare-fun arrayNoDuplicates!0 (array!28408 (_ BitVec 32) List!8155) Bool)

(assert (=> b!457669 (= res!273342 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8152))))

(declare-fun b!457670 () Bool)

(assert (=> b!457670 (= e!267264 e!267267)))

(declare-fun res!273351 () Bool)

(assert (=> b!457670 (=> (not res!273351) (not e!267267))))

(assert (=> b!457670 (= res!273351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207057 mask!1025))))

(assert (=> b!457670 (= lt!207057 (array!28409 (store (arr!13646 _keys!709) i!563 k0!794) (size!13998 _keys!709)))))

(declare-fun b!457671 () Bool)

(declare-fun res!273348 () Bool)

(assert (=> b!457671 (=> (not res!273348) (not e!267264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457671 (= res!273348 (validMask!0 mask!1025))))

(declare-fun b!457672 () Bool)

(declare-fun res!273347 () Bool)

(assert (=> b!457672 (=> (not res!273347) (not e!267264))))

(assert (=> b!457672 (= res!273347 (and (= (size!13997 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13998 _keys!709) (size!13997 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457673 () Bool)

(declare-fun res!273346 () Bool)

(assert (=> b!457673 (=> (not res!273346) (not e!267267))))

(assert (=> b!457673 (= res!273346 (arrayNoDuplicates!0 lt!207057 #b00000000000000000000000000000000 Nil!8152))))

(declare-fun b!457674 () Bool)

(declare-fun res!273344 () Bool)

(assert (=> b!457674 (=> (not res!273344) (not e!267264))))

(assert (=> b!457674 (= res!273344 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13998 _keys!709))))))

(declare-fun b!457675 () Bool)

(assert (=> b!457675 (= e!267267 e!267266)))

(declare-fun res!273345 () Bool)

(assert (=> b!457675 (=> (not res!273345) (not e!267266))))

(assert (=> b!457675 (= res!273345 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!457675 (= lt!207054 (getCurrentListMapNoExtraKeys!1743 lt!207057 lt!207055 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457675 (= lt!207055 (array!28407 (store (arr!13645 _values!549) i!563 (ValueCellFull!5810 v!412)) (size!13997 _values!549)))))

(declare-fun lt!207059 () ListLongMap!6997)

(assert (=> b!457675 (= lt!207059 (getCurrentListMapNoExtraKeys!1743 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!41042 res!273350) b!457671))

(assert (= (and b!457671 res!273348) b!457672))

(assert (= (and b!457672 res!273347) b!457665))

(assert (= (and b!457665 res!273343) b!457669))

(assert (= (and b!457669 res!273342) b!457674))

(assert (= (and b!457674 res!273344) b!457661))

(assert (= (and b!457661 res!273353) b!457666))

(assert (= (and b!457666 res!273340) b!457667))

(assert (= (and b!457667 res!273341) b!457670))

(assert (= (and b!457670 res!273351) b!457673))

(assert (= (and b!457673 res!273346) b!457662))

(assert (= (and b!457662 res!273349) b!457675))

(assert (= (and b!457675 res!273345) b!457668))

(assert (= (and b!457668 (not res!273352)) b!457663))

(assert (= (and b!457660 condMapEmpty!20104) mapIsEmpty!20104))

(assert (= (and b!457660 (not condMapEmpty!20104)) mapNonEmpty!20104))

(get-info :version)

(assert (= (and mapNonEmpty!20104 ((_ is ValueCellFull!5810) mapValue!20104)) b!457664))

(assert (= (and b!457660 ((_ is ValueCellFull!5810) mapDefault!20104)) b!457659))

(assert (= start!41042 b!457660))

(declare-fun b_lambda!9749 () Bool)

(assert (=> (not b_lambda!9749) (not b!457663)))

(declare-fun t!13993 () Bool)

(declare-fun tb!3797 () Bool)

(assert (=> (and start!41042 (= defaultEntry!557 defaultEntry!557) t!13993) tb!3797))

(declare-fun result!7143 () Bool)

(assert (=> tb!3797 (= result!7143 tp_is_empty!12307)))

(assert (=> b!457663 t!13993))

(declare-fun b_and!19157 () Bool)

(assert (= b_and!19155 (and (=> t!13993 result!7143) b_and!19157)))

(declare-fun m!441243 () Bool)

(assert (=> b!457671 m!441243))

(declare-fun m!441245 () Bool)

(assert (=> start!41042 m!441245))

(declare-fun m!441247 () Bool)

(assert (=> start!41042 m!441247))

(declare-fun m!441249 () Bool)

(assert (=> b!457666 m!441249))

(declare-fun m!441251 () Bool)

(assert (=> b!457673 m!441251))

(declare-fun m!441253 () Bool)

(assert (=> b!457670 m!441253))

(declare-fun m!441255 () Bool)

(assert (=> b!457670 m!441255))

(declare-fun m!441257 () Bool)

(assert (=> mapNonEmpty!20104 m!441257))

(declare-fun m!441259 () Bool)

(assert (=> b!457665 m!441259))

(declare-fun m!441261 () Bool)

(assert (=> b!457668 m!441261))

(declare-fun m!441263 () Bool)

(assert (=> b!457668 m!441263))

(declare-fun m!441265 () Bool)

(assert (=> b!457668 m!441265))

(assert (=> b!457668 m!441261))

(declare-fun m!441267 () Bool)

(assert (=> b!457668 m!441267))

(declare-fun m!441269 () Bool)

(assert (=> b!457668 m!441269))

(declare-fun m!441271 () Bool)

(assert (=> b!457668 m!441271))

(assert (=> b!457663 m!441261))

(declare-fun m!441273 () Bool)

(assert (=> b!457663 m!441273))

(declare-fun m!441275 () Bool)

(assert (=> b!457663 m!441275))

(declare-fun m!441277 () Bool)

(assert (=> b!457663 m!441277))

(assert (=> b!457663 m!441277))

(assert (=> b!457663 m!441273))

(declare-fun m!441279 () Bool)

(assert (=> b!457663 m!441279))

(declare-fun m!441281 () Bool)

(assert (=> b!457661 m!441281))

(declare-fun m!441283 () Bool)

(assert (=> b!457675 m!441283))

(declare-fun m!441285 () Bool)

(assert (=> b!457675 m!441285))

(declare-fun m!441287 () Bool)

(assert (=> b!457675 m!441287))

(declare-fun m!441289 () Bool)

(assert (=> b!457667 m!441289))

(declare-fun m!441291 () Bool)

(assert (=> b!457669 m!441291))

(check-sat (not b!457667) (not b_lambda!9749) (not b_next!10969) (not b!457669) (not b!457670) (not mapNonEmpty!20104) b_and!19157 (not b!457663) tp_is_empty!12307 (not b!457665) (not b!457675) (not b!457673) (not b!457668) (not b!457661) (not start!41042) (not b!457671))
(check-sat b_and!19157 (not b_next!10969))
