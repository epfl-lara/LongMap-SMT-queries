; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40080 () Bool)

(assert start!40080)

(declare-fun b_free!10347 () Bool)

(declare-fun b_next!10347 () Bool)

(assert (=> start!40080 (= b_free!10347 (not b_next!10347))))

(declare-fun tp!36569 () Bool)

(declare-fun b_and!18315 () Bool)

(assert (=> start!40080 (= tp!36569 b_and!18315)))

(declare-fun b!437684 () Bool)

(declare-fun res!258259 () Bool)

(declare-fun e!258288 () Bool)

(assert (=> b!437684 (=> (not res!258259) (not e!258288))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437684 (= res!258259 (bvsle from!863 i!563))))

(declare-fun b!437685 () Bool)

(declare-fun e!258289 () Bool)

(assert (=> b!437685 (= e!258289 (not true))))

(declare-datatypes ((V!16437 0))(
  ( (V!16438 (val!5794 Int)) )
))
(declare-fun minValue!515 () V!16437)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5406 0))(
  ( (ValueCellFull!5406 (v!8041 V!16437)) (EmptyCell!5406) )
))
(declare-datatypes ((array!26817 0))(
  ( (array!26818 (arr!12858 (Array (_ BitVec 32) ValueCell!5406)) (size!13210 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26817)

(declare-fun zeroValue!515 () V!16437)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26819 0))(
  ( (array!26820 (arr!12859 (Array (_ BitVec 32) (_ BitVec 64))) (size!13211 (_ BitVec 32))) )
))
(declare-fun lt!201722 () array!26819)

(declare-fun lt!201724 () array!26817)

(declare-fun v!412 () V!16437)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26819)

(declare-datatypes ((tuple2!7676 0))(
  ( (tuple2!7677 (_1!3849 (_ BitVec 64)) (_2!3849 V!16437)) )
))
(declare-datatypes ((List!7676 0))(
  ( (Nil!7673) (Cons!7672 (h!8528 tuple2!7676) (t!13432 List!7676)) )
))
(declare-datatypes ((ListLongMap!6589 0))(
  ( (ListLongMap!6590 (toList!3310 List!7676)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1499 (array!26819 array!26817 (_ BitVec 32) (_ BitVec 32) V!16437 V!16437 (_ BitVec 32) Int) ListLongMap!6589)

(declare-fun +!1454 (ListLongMap!6589 tuple2!7676) ListLongMap!6589)

(assert (=> b!437685 (= (getCurrentListMapNoExtraKeys!1499 lt!201722 lt!201724 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1454 (getCurrentListMapNoExtraKeys!1499 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7677 k0!794 v!412)))))

(declare-datatypes ((Unit!13012 0))(
  ( (Unit!13013) )
))
(declare-fun lt!201721 () Unit!13012)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!623 (array!26819 array!26817 (_ BitVec 32) (_ BitVec 32) V!16437 V!16437 (_ BitVec 32) (_ BitVec 64) V!16437 (_ BitVec 32) Int) Unit!13012)

(assert (=> b!437685 (= lt!201721 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!623 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18870 () Bool)

(declare-fun mapRes!18870 () Bool)

(declare-fun tp!36570 () Bool)

(declare-fun e!258286 () Bool)

(assert (=> mapNonEmpty!18870 (= mapRes!18870 (and tp!36570 e!258286))))

(declare-fun mapValue!18870 () ValueCell!5406)

(declare-fun mapKey!18870 () (_ BitVec 32))

(declare-fun mapRest!18870 () (Array (_ BitVec 32) ValueCell!5406))

(assert (=> mapNonEmpty!18870 (= (arr!12858 _values!549) (store mapRest!18870 mapKey!18870 mapValue!18870))))

(declare-fun mapIsEmpty!18870 () Bool)

(assert (=> mapIsEmpty!18870 mapRes!18870))

(declare-fun b!437687 () Bool)

(declare-fun res!258262 () Bool)

(declare-fun e!258290 () Bool)

(assert (=> b!437687 (=> (not res!258262) (not e!258290))))

(declare-datatypes ((List!7677 0))(
  ( (Nil!7674) (Cons!7673 (h!8529 (_ BitVec 64)) (t!13433 List!7677)) )
))
(declare-fun arrayNoDuplicates!0 (array!26819 (_ BitVec 32) List!7677) Bool)

(assert (=> b!437687 (= res!258262 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7674))))

(declare-fun b!437688 () Bool)

(declare-fun res!258265 () Bool)

(assert (=> b!437688 (=> (not res!258265) (not e!258290))))

(declare-fun arrayContainsKey!0 (array!26819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437688 (= res!258265 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437689 () Bool)

(declare-fun tp_is_empty!11499 () Bool)

(assert (=> b!437689 (= e!258286 tp_is_empty!11499)))

(declare-fun b!437690 () Bool)

(declare-fun res!258269 () Bool)

(assert (=> b!437690 (=> (not res!258269) (not e!258290))))

(assert (=> b!437690 (= res!258269 (or (= (select (arr!12859 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12859 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437691 () Bool)

(declare-fun res!258263 () Bool)

(assert (=> b!437691 (=> (not res!258263) (not e!258290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437691 (= res!258263 (validMask!0 mask!1025))))

(declare-fun b!437692 () Bool)

(declare-fun e!258285 () Bool)

(declare-fun e!258291 () Bool)

(assert (=> b!437692 (= e!258285 (and e!258291 mapRes!18870))))

(declare-fun condMapEmpty!18870 () Bool)

(declare-fun mapDefault!18870 () ValueCell!5406)

(assert (=> b!437692 (= condMapEmpty!18870 (= (arr!12858 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5406)) mapDefault!18870)))))

(declare-fun b!437693 () Bool)

(declare-fun res!258268 () Bool)

(assert (=> b!437693 (=> (not res!258268) (not e!258290))))

(assert (=> b!437693 (= res!258268 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13211 _keys!709))))))

(declare-fun b!437694 () Bool)

(assert (=> b!437694 (= e!258291 tp_is_empty!11499)))

(declare-fun b!437695 () Bool)

(assert (=> b!437695 (= e!258288 e!258289)))

(declare-fun res!258270 () Bool)

(assert (=> b!437695 (=> (not res!258270) (not e!258289))))

(assert (=> b!437695 (= res!258270 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201725 () ListLongMap!6589)

(assert (=> b!437695 (= lt!201725 (getCurrentListMapNoExtraKeys!1499 lt!201722 lt!201724 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!437695 (= lt!201724 (array!26818 (store (arr!12858 _values!549) i!563 (ValueCellFull!5406 v!412)) (size!13210 _values!549)))))

(declare-fun lt!201723 () ListLongMap!6589)

(assert (=> b!437695 (= lt!201723 (getCurrentListMapNoExtraKeys!1499 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!258264 () Bool)

(assert (=> start!40080 (=> (not res!258264) (not e!258290))))

(assert (=> start!40080 (= res!258264 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13211 _keys!709))))))

(assert (=> start!40080 e!258290))

(assert (=> start!40080 tp_is_empty!11499))

(assert (=> start!40080 tp!36569))

(assert (=> start!40080 true))

(declare-fun array_inv!9338 (array!26817) Bool)

(assert (=> start!40080 (and (array_inv!9338 _values!549) e!258285)))

(declare-fun array_inv!9339 (array!26819) Bool)

(assert (=> start!40080 (array_inv!9339 _keys!709)))

(declare-fun b!437686 () Bool)

(declare-fun res!258266 () Bool)

(assert (=> b!437686 (=> (not res!258266) (not e!258290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26819 (_ BitVec 32)) Bool)

(assert (=> b!437686 (= res!258266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437696 () Bool)

(declare-fun res!258258 () Bool)

(assert (=> b!437696 (=> (not res!258258) (not e!258290))))

(assert (=> b!437696 (= res!258258 (and (= (size!13210 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13211 _keys!709) (size!13210 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437697 () Bool)

(assert (=> b!437697 (= e!258290 e!258288)))

(declare-fun res!258261 () Bool)

(assert (=> b!437697 (=> (not res!258261) (not e!258288))))

(assert (=> b!437697 (= res!258261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201722 mask!1025))))

(assert (=> b!437697 (= lt!201722 (array!26820 (store (arr!12859 _keys!709) i!563 k0!794) (size!13211 _keys!709)))))

(declare-fun b!437698 () Bool)

(declare-fun res!258260 () Bool)

(assert (=> b!437698 (=> (not res!258260) (not e!258288))))

(assert (=> b!437698 (= res!258260 (arrayNoDuplicates!0 lt!201722 #b00000000000000000000000000000000 Nil!7674))))

(declare-fun b!437699 () Bool)

(declare-fun res!258267 () Bool)

(assert (=> b!437699 (=> (not res!258267) (not e!258290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437699 (= res!258267 (validKeyInArray!0 k0!794))))

(assert (= (and start!40080 res!258264) b!437691))

(assert (= (and b!437691 res!258263) b!437696))

(assert (= (and b!437696 res!258258) b!437686))

(assert (= (and b!437686 res!258266) b!437687))

(assert (= (and b!437687 res!258262) b!437693))

(assert (= (and b!437693 res!258268) b!437699))

(assert (= (and b!437699 res!258267) b!437690))

(assert (= (and b!437690 res!258269) b!437688))

(assert (= (and b!437688 res!258265) b!437697))

(assert (= (and b!437697 res!258261) b!437698))

(assert (= (and b!437698 res!258260) b!437684))

(assert (= (and b!437684 res!258259) b!437695))

(assert (= (and b!437695 res!258270) b!437685))

(assert (= (and b!437692 condMapEmpty!18870) mapIsEmpty!18870))

(assert (= (and b!437692 (not condMapEmpty!18870)) mapNonEmpty!18870))

(get-info :version)

(assert (= (and mapNonEmpty!18870 ((_ is ValueCellFull!5406) mapValue!18870)) b!437689))

(assert (= (and b!437692 ((_ is ValueCellFull!5406) mapDefault!18870)) b!437694))

(assert (= start!40080 b!437692))

(declare-fun m!425303 () Bool)

(assert (=> b!437698 m!425303))

(declare-fun m!425305 () Bool)

(assert (=> b!437690 m!425305))

(declare-fun m!425307 () Bool)

(assert (=> b!437685 m!425307))

(declare-fun m!425309 () Bool)

(assert (=> b!437685 m!425309))

(assert (=> b!437685 m!425309))

(declare-fun m!425311 () Bool)

(assert (=> b!437685 m!425311))

(declare-fun m!425313 () Bool)

(assert (=> b!437685 m!425313))

(declare-fun m!425315 () Bool)

(assert (=> b!437686 m!425315))

(declare-fun m!425317 () Bool)

(assert (=> b!437697 m!425317))

(declare-fun m!425319 () Bool)

(assert (=> b!437697 m!425319))

(declare-fun m!425321 () Bool)

(assert (=> b!437687 m!425321))

(declare-fun m!425323 () Bool)

(assert (=> b!437695 m!425323))

(declare-fun m!425325 () Bool)

(assert (=> b!437695 m!425325))

(declare-fun m!425327 () Bool)

(assert (=> b!437695 m!425327))

(declare-fun m!425329 () Bool)

(assert (=> b!437699 m!425329))

(declare-fun m!425331 () Bool)

(assert (=> mapNonEmpty!18870 m!425331))

(declare-fun m!425333 () Bool)

(assert (=> b!437691 m!425333))

(declare-fun m!425335 () Bool)

(assert (=> start!40080 m!425335))

(declare-fun m!425337 () Bool)

(assert (=> start!40080 m!425337))

(declare-fun m!425339 () Bool)

(assert (=> b!437688 m!425339))

(check-sat (not mapNonEmpty!18870) (not b!437699) (not b!437688) (not b_next!10347) (not b!437687) tp_is_empty!11499 (not b!437686) (not b!437698) (not start!40080) (not b!437691) (not b!437685) b_and!18315 (not b!437695) (not b!437697))
(check-sat b_and!18315 (not b_next!10347))
