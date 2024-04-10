; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40316 () Bool)

(assert start!40316)

(declare-fun b!442726 () Bool)

(declare-fun res!262236 () Bool)

(declare-fun e!260574 () Bool)

(assert (=> b!442726 (=> (not res!262236) (not e!260574))))

(declare-datatypes ((array!27241 0))(
  ( (array!27242 (arr!13069 (Array (_ BitVec 32) (_ BitVec 64))) (size!13421 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27241)

(declare-datatypes ((List!7843 0))(
  ( (Nil!7840) (Cons!7839 (h!8695 (_ BitVec 64)) (t!13601 List!7843)) )
))
(declare-fun arrayNoDuplicates!0 (array!27241 (_ BitVec 32) List!7843) Bool)

(assert (=> b!442726 (= res!262236 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7840))))

(declare-fun mapIsEmpty!19197 () Bool)

(declare-fun mapRes!19197 () Bool)

(assert (=> mapIsEmpty!19197 mapRes!19197))

(declare-fun mapNonEmpty!19197 () Bool)

(declare-fun tp!37179 () Bool)

(declare-fun e!260571 () Bool)

(assert (=> mapNonEmpty!19197 (= mapRes!19197 (and tp!37179 e!260571))))

(declare-fun mapKey!19197 () (_ BitVec 32))

(declare-datatypes ((V!16725 0))(
  ( (V!16726 (val!5902 Int)) )
))
(declare-datatypes ((ValueCell!5514 0))(
  ( (ValueCellFull!5514 (v!8153 V!16725)) (EmptyCell!5514) )
))
(declare-datatypes ((array!27243 0))(
  ( (array!27244 (arr!13070 (Array (_ BitVec 32) ValueCell!5514)) (size!13422 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27243)

(declare-fun mapRest!19197 () (Array (_ BitVec 32) ValueCell!5514))

(declare-fun mapValue!19197 () ValueCell!5514)

(assert (=> mapNonEmpty!19197 (= (arr!13070 _values!549) (store mapRest!19197 mapKey!19197 mapValue!19197))))

(declare-fun b!442727 () Bool)

(declare-fun res!262235 () Bool)

(assert (=> b!442727 (=> (not res!262235) (not e!260574))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442727 (= res!262235 (validKeyInArray!0 k0!794))))

(declare-fun res!262238 () Bool)

(assert (=> start!40316 (=> (not res!262238) (not e!260574))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40316 (= res!262238 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13421 _keys!709))))))

(assert (=> start!40316 e!260574))

(assert (=> start!40316 true))

(declare-fun e!260575 () Bool)

(declare-fun array_inv!9480 (array!27243) Bool)

(assert (=> start!40316 (and (array_inv!9480 _values!549) e!260575)))

(declare-fun array_inv!9481 (array!27241) Bool)

(assert (=> start!40316 (array_inv!9481 _keys!709)))

(declare-fun b!442728 () Bool)

(declare-fun tp_is_empty!11715 () Bool)

(assert (=> b!442728 (= e!260571 tp_is_empty!11715)))

(declare-fun b!442729 () Bool)

(assert (=> b!442729 (= e!260574 false)))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!203237 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27241 (_ BitVec 32)) Bool)

(assert (=> b!442729 (= lt!203237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!27242 (store (arr!13069 _keys!709) i!563 k0!794) (size!13421 _keys!709)) mask!1025))))

(declare-fun b!442730 () Bool)

(declare-fun res!262234 () Bool)

(assert (=> b!442730 (=> (not res!262234) (not e!260574))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442730 (= res!262234 (and (= (size!13422 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13421 _keys!709) (size!13422 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442731 () Bool)

(declare-fun res!262233 () Bool)

(assert (=> b!442731 (=> (not res!262233) (not e!260574))))

(declare-fun arrayContainsKey!0 (array!27241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442731 (= res!262233 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442732 () Bool)

(declare-fun res!262231 () Bool)

(assert (=> b!442732 (=> (not res!262231) (not e!260574))))

(assert (=> b!442732 (= res!262231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442733 () Bool)

(declare-fun res!262230 () Bool)

(assert (=> b!442733 (=> (not res!262230) (not e!260574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442733 (= res!262230 (validMask!0 mask!1025))))

(declare-fun b!442734 () Bool)

(declare-fun e!260572 () Bool)

(assert (=> b!442734 (= e!260575 (and e!260572 mapRes!19197))))

(declare-fun condMapEmpty!19197 () Bool)

(declare-fun mapDefault!19197 () ValueCell!5514)

(assert (=> b!442734 (= condMapEmpty!19197 (= (arr!13070 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5514)) mapDefault!19197)))))

(declare-fun b!442735 () Bool)

(declare-fun res!262232 () Bool)

(assert (=> b!442735 (=> (not res!262232) (not e!260574))))

(assert (=> b!442735 (= res!262232 (or (= (select (arr!13069 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13069 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442736 () Bool)

(declare-fun res!262237 () Bool)

(assert (=> b!442736 (=> (not res!262237) (not e!260574))))

(assert (=> b!442736 (= res!262237 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13421 _keys!709))))))

(declare-fun b!442737 () Bool)

(assert (=> b!442737 (= e!260572 tp_is_empty!11715)))

(assert (= (and start!40316 res!262238) b!442733))

(assert (= (and b!442733 res!262230) b!442730))

(assert (= (and b!442730 res!262234) b!442732))

(assert (= (and b!442732 res!262231) b!442726))

(assert (= (and b!442726 res!262236) b!442736))

(assert (= (and b!442736 res!262237) b!442727))

(assert (= (and b!442727 res!262235) b!442735))

(assert (= (and b!442735 res!262232) b!442731))

(assert (= (and b!442731 res!262233) b!442729))

(assert (= (and b!442734 condMapEmpty!19197) mapIsEmpty!19197))

(assert (= (and b!442734 (not condMapEmpty!19197)) mapNonEmpty!19197))

(get-info :version)

(assert (= (and mapNonEmpty!19197 ((_ is ValueCellFull!5514) mapValue!19197)) b!442728))

(assert (= (and b!442734 ((_ is ValueCellFull!5514) mapDefault!19197)) b!442737))

(assert (= start!40316 b!442734))

(declare-fun m!429269 () Bool)

(assert (=> b!442726 m!429269))

(declare-fun m!429271 () Bool)

(assert (=> start!40316 m!429271))

(declare-fun m!429273 () Bool)

(assert (=> start!40316 m!429273))

(declare-fun m!429275 () Bool)

(assert (=> b!442731 m!429275))

(declare-fun m!429277 () Bool)

(assert (=> b!442733 m!429277))

(declare-fun m!429279 () Bool)

(assert (=> mapNonEmpty!19197 m!429279))

(declare-fun m!429281 () Bool)

(assert (=> b!442727 m!429281))

(declare-fun m!429283 () Bool)

(assert (=> b!442732 m!429283))

(declare-fun m!429285 () Bool)

(assert (=> b!442729 m!429285))

(declare-fun m!429287 () Bool)

(assert (=> b!442729 m!429287))

(declare-fun m!429289 () Bool)

(assert (=> b!442735 m!429289))

(check-sat (not b!442726) (not b!442727) tp_is_empty!11715 (not b!442729) (not start!40316) (not b!442731) (not mapNonEmpty!19197) (not b!442732) (not b!442733))
(check-sat)
