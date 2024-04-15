; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40674 () Bool)

(assert start!40674)

(declare-fun b_free!10699 () Bool)

(declare-fun b_next!10699 () Bool)

(assert (=> start!40674 (= b_free!10699 (not b_next!10699))))

(declare-fun tp!37917 () Bool)

(declare-fun b_and!18681 () Bool)

(assert (=> start!40674 (= tp!37917 b_and!18681)))

(declare-datatypes ((V!17155 0))(
  ( (V!17156 (val!6063 Int)) )
))
(declare-fun minValue!515 () V!17155)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5675 0))(
  ( (ValueCellFull!5675 (v!8312 V!17155)) (EmptyCell!5675) )
))
(declare-datatypes ((array!27879 0))(
  ( (array!27880 (arr!13385 (Array (_ BitVec 32) ValueCell!5675)) (size!13738 (_ BitVec 32))) )
))
(declare-fun lt!204230 () array!27879)

(declare-fun zeroValue!515 () V!17155)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27881 0))(
  ( (array!27882 (arr!13386 (Array (_ BitVec 32) (_ BitVec 64))) (size!13739 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27881)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7970 0))(
  ( (tuple2!7971 (_1!3996 (_ BitVec 64)) (_2!3996 V!17155)) )
))
(declare-datatypes ((List!8035 0))(
  ( (Nil!8032) (Cons!8031 (h!8887 tuple2!7970) (t!13788 List!8035)) )
))
(declare-datatypes ((ListLongMap!6873 0))(
  ( (ListLongMap!6874 (toList!3452 List!8035)) )
))
(declare-fun call!29664 () ListLongMap!6873)

(declare-fun defaultEntry!557 () Int)

(declare-fun _values!549 () array!27879)

(declare-fun c!55884 () Bool)

(declare-fun lt!204228 () array!27881)

(declare-fun bm!29661 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1650 (array!27881 array!27879 (_ BitVec 32) (_ BitVec 32) V!17155 V!17155 (_ BitVec 32) Int) ListLongMap!6873)

(assert (=> bm!29661 (= call!29664 (getCurrentListMapNoExtraKeys!1650 (ite c!55884 _keys!709 lt!204228) (ite c!55884 _values!549 lt!204230) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449632 () Bool)

(declare-fun res!267584 () Bool)

(declare-fun e!263541 () Bool)

(assert (=> b!449632 (=> (not res!267584) (not e!263541))))

(declare-datatypes ((List!8036 0))(
  ( (Nil!8033) (Cons!8032 (h!8888 (_ BitVec 64)) (t!13789 List!8036)) )
))
(declare-fun arrayNoDuplicates!0 (array!27881 (_ BitVec 32) List!8036) Bool)

(assert (=> b!449632 (= res!267584 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8033))))

(declare-fun b!449633 () Bool)

(declare-fun e!263540 () Bool)

(assert (=> b!449633 (= e!263541 e!263540)))

(declare-fun res!267578 () Bool)

(assert (=> b!449633 (=> (not res!267578) (not e!263540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27881 (_ BitVec 32)) Bool)

(assert (=> b!449633 (= res!267578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204228 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449633 (= lt!204228 (array!27882 (store (arr!13386 _keys!709) i!563 k0!794) (size!13739 _keys!709)))))

(declare-fun b!449634 () Bool)

(declare-fun res!267574 () Bool)

(assert (=> b!449634 (=> (not res!267574) (not e!263541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449634 (= res!267574 (validKeyInArray!0 k0!794))))

(declare-fun b!449635 () Bool)

(declare-fun res!267576 () Bool)

(assert (=> b!449635 (=> (not res!267576) (not e!263541))))

(assert (=> b!449635 (= res!267576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449636 () Bool)

(declare-fun e!263543 () Bool)

(assert (=> b!449636 (= e!263543 (not (bvslt from!863 (size!13739 _keys!709))))))

(declare-fun e!263539 () Bool)

(assert (=> b!449636 e!263539))

(assert (=> b!449636 (= c!55884 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13137 0))(
  ( (Unit!13138) )
))
(declare-fun lt!204227 () Unit!13137)

(declare-fun v!412 () V!17155)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!696 (array!27881 array!27879 (_ BitVec 32) (_ BitVec 32) V!17155 V!17155 (_ BitVec 32) (_ BitVec 64) V!17155 (_ BitVec 32) Int) Unit!13137)

(assert (=> b!449636 (= lt!204227 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!696 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449637 () Bool)

(declare-fun res!267581 () Bool)

(assert (=> b!449637 (=> (not res!267581) (not e!263541))))

(assert (=> b!449637 (= res!267581 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13739 _keys!709))))))

(declare-fun b!449638 () Bool)

(declare-fun res!267585 () Bool)

(assert (=> b!449638 (=> (not res!267585) (not e!263540))))

(assert (=> b!449638 (= res!267585 (arrayNoDuplicates!0 lt!204228 #b00000000000000000000000000000000 Nil!8033))))

(declare-fun b!449639 () Bool)

(declare-fun res!267575 () Bool)

(assert (=> b!449639 (=> (not res!267575) (not e!263540))))

(assert (=> b!449639 (= res!267575 (bvsle from!863 i!563))))

(declare-fun b!449640 () Bool)

(assert (=> b!449640 (= e!263540 e!263543)))

(declare-fun res!267583 () Bool)

(assert (=> b!449640 (=> (not res!267583) (not e!263543))))

(assert (=> b!449640 (= res!267583 (= from!863 i!563))))

(declare-fun lt!204231 () ListLongMap!6873)

(assert (=> b!449640 (= lt!204231 (getCurrentListMapNoExtraKeys!1650 lt!204228 lt!204230 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!449640 (= lt!204230 (array!27880 (store (arr!13385 _values!549) i!563 (ValueCellFull!5675 v!412)) (size!13738 _values!549)))))

(declare-fun lt!204229 () ListLongMap!6873)

(assert (=> b!449640 (= lt!204229 (getCurrentListMapNoExtraKeys!1650 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449641 () Bool)

(declare-fun call!29665 () ListLongMap!6873)

(assert (=> b!449641 (= e!263539 (= call!29664 call!29665))))

(declare-fun b!449642 () Bool)

(declare-fun e!263542 () Bool)

(declare-fun tp_is_empty!12037 () Bool)

(assert (=> b!449642 (= e!263542 tp_is_empty!12037)))

(declare-fun b!449643 () Bool)

(declare-fun e!263546 () Bool)

(declare-fun mapRes!19689 () Bool)

(assert (=> b!449643 (= e!263546 (and e!263542 mapRes!19689))))

(declare-fun condMapEmpty!19689 () Bool)

(declare-fun mapDefault!19689 () ValueCell!5675)

(assert (=> b!449643 (= condMapEmpty!19689 (= (arr!13385 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5675)) mapDefault!19689)))))

(declare-fun b!449644 () Bool)

(declare-fun res!267577 () Bool)

(assert (=> b!449644 (=> (not res!267577) (not e!263541))))

(assert (=> b!449644 (= res!267577 (and (= (size!13738 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13739 _keys!709) (size!13738 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449645 () Bool)

(declare-fun res!267580 () Bool)

(assert (=> b!449645 (=> (not res!267580) (not e!263541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449645 (= res!267580 (validMask!0 mask!1025))))

(declare-fun b!449646 () Bool)

(declare-fun res!267573 () Bool)

(assert (=> b!449646 (=> (not res!267573) (not e!263541))))

(assert (=> b!449646 (= res!267573 (or (= (select (arr!13386 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13386 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29662 () Bool)

(assert (=> bm!29662 (= call!29665 (getCurrentListMapNoExtraKeys!1650 (ite c!55884 lt!204228 _keys!709) (ite c!55884 lt!204230 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449647 () Bool)

(declare-fun e!263545 () Bool)

(assert (=> b!449647 (= e!263545 tp_is_empty!12037)))

(declare-fun res!267582 () Bool)

(assert (=> start!40674 (=> (not res!267582) (not e!263541))))

(assert (=> start!40674 (= res!267582 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13739 _keys!709))))))

(assert (=> start!40674 e!263541))

(assert (=> start!40674 tp_is_empty!12037))

(assert (=> start!40674 tp!37917))

(assert (=> start!40674 true))

(declare-fun array_inv!9756 (array!27879) Bool)

(assert (=> start!40674 (and (array_inv!9756 _values!549) e!263546)))

(declare-fun array_inv!9757 (array!27881) Bool)

(assert (=> start!40674 (array_inv!9757 _keys!709)))

(declare-fun mapNonEmpty!19689 () Bool)

(declare-fun tp!37916 () Bool)

(assert (=> mapNonEmpty!19689 (= mapRes!19689 (and tp!37916 e!263545))))

(declare-fun mapRest!19689 () (Array (_ BitVec 32) ValueCell!5675))

(declare-fun mapValue!19689 () ValueCell!5675)

(declare-fun mapKey!19689 () (_ BitVec 32))

(assert (=> mapNonEmpty!19689 (= (arr!13385 _values!549) (store mapRest!19689 mapKey!19689 mapValue!19689))))

(declare-fun b!449648 () Bool)

(declare-fun +!1559 (ListLongMap!6873 tuple2!7970) ListLongMap!6873)

(assert (=> b!449648 (= e!263539 (= call!29665 (+!1559 call!29664 (tuple2!7971 k0!794 v!412))))))

(declare-fun b!449649 () Bool)

(declare-fun res!267579 () Bool)

(assert (=> b!449649 (=> (not res!267579) (not e!263541))))

(declare-fun arrayContainsKey!0 (array!27881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449649 (= res!267579 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19689 () Bool)

(assert (=> mapIsEmpty!19689 mapRes!19689))

(assert (= (and start!40674 res!267582) b!449645))

(assert (= (and b!449645 res!267580) b!449644))

(assert (= (and b!449644 res!267577) b!449635))

(assert (= (and b!449635 res!267576) b!449632))

(assert (= (and b!449632 res!267584) b!449637))

(assert (= (and b!449637 res!267581) b!449634))

(assert (= (and b!449634 res!267574) b!449646))

(assert (= (and b!449646 res!267573) b!449649))

(assert (= (and b!449649 res!267579) b!449633))

(assert (= (and b!449633 res!267578) b!449638))

(assert (= (and b!449638 res!267585) b!449639))

(assert (= (and b!449639 res!267575) b!449640))

(assert (= (and b!449640 res!267583) b!449636))

(assert (= (and b!449636 c!55884) b!449648))

(assert (= (and b!449636 (not c!55884)) b!449641))

(assert (= (or b!449648 b!449641) bm!29662))

(assert (= (or b!449648 b!449641) bm!29661))

(assert (= (and b!449643 condMapEmpty!19689) mapIsEmpty!19689))

(assert (= (and b!449643 (not condMapEmpty!19689)) mapNonEmpty!19689))

(get-info :version)

(assert (= (and mapNonEmpty!19689 ((_ is ValueCellFull!5675) mapValue!19689)) b!449647))

(assert (= (and b!449643 ((_ is ValueCellFull!5675) mapDefault!19689)) b!449642))

(assert (= start!40674 b!449643))

(declare-fun m!433231 () Bool)

(assert (=> b!449634 m!433231))

(declare-fun m!433233 () Bool)

(assert (=> b!449632 m!433233))

(declare-fun m!433235 () Bool)

(assert (=> bm!29662 m!433235))

(declare-fun m!433237 () Bool)

(assert (=> b!449645 m!433237))

(declare-fun m!433239 () Bool)

(assert (=> mapNonEmpty!19689 m!433239))

(declare-fun m!433241 () Bool)

(assert (=> b!449635 m!433241))

(declare-fun m!433243 () Bool)

(assert (=> b!449646 m!433243))

(declare-fun m!433245 () Bool)

(assert (=> start!40674 m!433245))

(declare-fun m!433247 () Bool)

(assert (=> start!40674 m!433247))

(declare-fun m!433249 () Bool)

(assert (=> b!449633 m!433249))

(declare-fun m!433251 () Bool)

(assert (=> b!449633 m!433251))

(declare-fun m!433253 () Bool)

(assert (=> b!449640 m!433253))

(declare-fun m!433255 () Bool)

(assert (=> b!449640 m!433255))

(declare-fun m!433257 () Bool)

(assert (=> b!449640 m!433257))

(declare-fun m!433259 () Bool)

(assert (=> b!449649 m!433259))

(declare-fun m!433261 () Bool)

(assert (=> bm!29661 m!433261))

(declare-fun m!433263 () Bool)

(assert (=> b!449636 m!433263))

(declare-fun m!433265 () Bool)

(assert (=> b!449638 m!433265))

(declare-fun m!433267 () Bool)

(assert (=> b!449648 m!433267))

(check-sat (not b!449645) (not b!449648) (not b!449633) tp_is_empty!12037 (not b!449649) (not b!449640) (not b!449635) (not b!449634) b_and!18681 (not bm!29662) (not start!40674) (not b_next!10699) (not mapNonEmpty!19689) (not bm!29661) (not b!449638) (not b!449636) (not b!449632))
(check-sat b_and!18681 (not b_next!10699))
