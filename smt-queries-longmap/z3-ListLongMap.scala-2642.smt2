; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39656 () Bool)

(assert start!39656)

(declare-fun b_free!9937 () Bool)

(declare-fun b_next!9937 () Bool)

(assert (=> start!39656 (= b_free!9937 (not b_next!9937))))

(declare-fun tp!35339 () Bool)

(declare-fun b_and!17567 () Bool)

(assert (=> start!39656 (= tp!35339 b_and!17567)))

(declare-fun b!425632 () Bool)

(declare-fun res!249341 () Bool)

(declare-fun e!252593 () Bool)

(assert (=> b!425632 (=> (not res!249341) (not e!252593))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26007 0))(
  ( (array!26008 (arr!12453 (Array (_ BitVec 32) (_ BitVec 64))) (size!12806 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26007)

(assert (=> b!425632 (= res!249341 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12806 _keys!709))))))

(declare-fun b!425633 () Bool)

(declare-fun e!252594 () Bool)

(assert (=> b!425633 (= e!252594 (not true))))

(declare-datatypes ((V!15891 0))(
  ( (V!15892 (val!5589 Int)) )
))
(declare-fun minValue!515 () V!15891)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15891)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!194562 () array!26007)

(declare-fun v!412 () V!15891)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5201 0))(
  ( (ValueCellFull!5201 (v!7830 V!15891)) (EmptyCell!5201) )
))
(declare-datatypes ((array!26009 0))(
  ( (array!26010 (arr!12454 (Array (_ BitVec 32) ValueCell!5201)) (size!12807 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26009)

(declare-fun lt!194563 () array!26009)

(declare-datatypes ((tuple2!7338 0))(
  ( (tuple2!7339 (_1!3680 (_ BitVec 64)) (_2!3680 V!15891)) )
))
(declare-datatypes ((List!7338 0))(
  ( (Nil!7335) (Cons!7334 (h!8190 tuple2!7338) (t!12773 List!7338)) )
))
(declare-datatypes ((ListLongMap!6241 0))(
  ( (ListLongMap!6242 (toList!3136 List!7338)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1344 (array!26007 array!26009 (_ BitVec 32) (_ BitVec 32) V!15891 V!15891 (_ BitVec 32) Int) ListLongMap!6241)

(declare-fun +!1317 (ListLongMap!6241 tuple2!7338) ListLongMap!6241)

(assert (=> b!425633 (= (getCurrentListMapNoExtraKeys!1344 lt!194562 lt!194563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1317 (getCurrentListMapNoExtraKeys!1344 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7339 k0!794 v!412)))))

(declare-datatypes ((Unit!12480 0))(
  ( (Unit!12481) )
))
(declare-fun lt!194564 () Unit!12480)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!488 (array!26007 array!26009 (_ BitVec 32) (_ BitVec 32) V!15891 V!15891 (_ BitVec 32) (_ BitVec 64) V!15891 (_ BitVec 32) Int) Unit!12480)

(assert (=> b!425633 (= lt!194564 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!488 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425634 () Bool)

(declare-fun e!252591 () Bool)

(assert (=> b!425634 (= e!252591 e!252594)))

(declare-fun res!249338 () Bool)

(assert (=> b!425634 (=> (not res!249338) (not e!252594))))

(assert (=> b!425634 (= res!249338 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194561 () ListLongMap!6241)

(assert (=> b!425634 (= lt!194561 (getCurrentListMapNoExtraKeys!1344 lt!194562 lt!194563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!425634 (= lt!194563 (array!26010 (store (arr!12454 _values!549) i!563 (ValueCellFull!5201 v!412)) (size!12807 _values!549)))))

(declare-fun lt!194560 () ListLongMap!6241)

(assert (=> b!425634 (= lt!194560 (getCurrentListMapNoExtraKeys!1344 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425635 () Bool)

(declare-fun res!249334 () Bool)

(assert (=> b!425635 (=> (not res!249334) (not e!252591))))

(declare-datatypes ((List!7339 0))(
  ( (Nil!7336) (Cons!7335 (h!8191 (_ BitVec 64)) (t!12774 List!7339)) )
))
(declare-fun arrayNoDuplicates!0 (array!26007 (_ BitVec 32) List!7339) Bool)

(assert (=> b!425635 (= res!249334 (arrayNoDuplicates!0 lt!194562 #b00000000000000000000000000000000 Nil!7336))))

(declare-fun b!425636 () Bool)

(declare-fun res!249340 () Bool)

(assert (=> b!425636 (=> (not res!249340) (not e!252593))))

(assert (=> b!425636 (= res!249340 (or (= (select (arr!12453 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12453 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18255 () Bool)

(declare-fun mapRes!18255 () Bool)

(declare-fun tp!35340 () Bool)

(declare-fun e!252592 () Bool)

(assert (=> mapNonEmpty!18255 (= mapRes!18255 (and tp!35340 e!252592))))

(declare-fun mapRest!18255 () (Array (_ BitVec 32) ValueCell!5201))

(declare-fun mapValue!18255 () ValueCell!5201)

(declare-fun mapKey!18255 () (_ BitVec 32))

(assert (=> mapNonEmpty!18255 (= (arr!12454 _values!549) (store mapRest!18255 mapKey!18255 mapValue!18255))))

(declare-fun b!425637 () Bool)

(assert (=> b!425637 (= e!252593 e!252591)))

(declare-fun res!249343 () Bool)

(assert (=> b!425637 (=> (not res!249343) (not e!252591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26007 (_ BitVec 32)) Bool)

(assert (=> b!425637 (= res!249343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194562 mask!1025))))

(assert (=> b!425637 (= lt!194562 (array!26008 (store (arr!12453 _keys!709) i!563 k0!794) (size!12806 _keys!709)))))

(declare-fun b!425638 () Bool)

(declare-fun res!249342 () Bool)

(assert (=> b!425638 (=> (not res!249342) (not e!252593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425638 (= res!249342 (validMask!0 mask!1025))))

(declare-fun b!425639 () Bool)

(declare-fun tp_is_empty!11089 () Bool)

(assert (=> b!425639 (= e!252592 tp_is_empty!11089)))

(declare-fun b!425640 () Bool)

(declare-fun e!252595 () Bool)

(declare-fun e!252596 () Bool)

(assert (=> b!425640 (= e!252595 (and e!252596 mapRes!18255))))

(declare-fun condMapEmpty!18255 () Bool)

(declare-fun mapDefault!18255 () ValueCell!5201)

(assert (=> b!425640 (= condMapEmpty!18255 (= (arr!12454 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5201)) mapDefault!18255)))))

(declare-fun res!249337 () Bool)

(assert (=> start!39656 (=> (not res!249337) (not e!252593))))

(assert (=> start!39656 (= res!249337 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12806 _keys!709))))))

(assert (=> start!39656 e!252593))

(assert (=> start!39656 tp_is_empty!11089))

(assert (=> start!39656 tp!35339))

(assert (=> start!39656 true))

(declare-fun array_inv!9108 (array!26009) Bool)

(assert (=> start!39656 (and (array_inv!9108 _values!549) e!252595)))

(declare-fun array_inv!9109 (array!26007) Bool)

(assert (=> start!39656 (array_inv!9109 _keys!709)))

(declare-fun b!425641 () Bool)

(assert (=> b!425641 (= e!252596 tp_is_empty!11089)))

(declare-fun b!425642 () Bool)

(declare-fun res!249336 () Bool)

(assert (=> b!425642 (=> (not res!249336) (not e!252593))))

(assert (=> b!425642 (= res!249336 (and (= (size!12807 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12806 _keys!709) (size!12807 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18255 () Bool)

(assert (=> mapIsEmpty!18255 mapRes!18255))

(declare-fun b!425643 () Bool)

(declare-fun res!249339 () Bool)

(assert (=> b!425643 (=> (not res!249339) (not e!252593))))

(declare-fun arrayContainsKey!0 (array!26007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425643 (= res!249339 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425644 () Bool)

(declare-fun res!249333 () Bool)

(assert (=> b!425644 (=> (not res!249333) (not e!252593))))

(assert (=> b!425644 (= res!249333 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7336))))

(declare-fun b!425645 () Bool)

(declare-fun res!249335 () Bool)

(assert (=> b!425645 (=> (not res!249335) (not e!252593))))

(assert (=> b!425645 (= res!249335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425646 () Bool)

(declare-fun res!249344 () Bool)

(assert (=> b!425646 (=> (not res!249344) (not e!252593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425646 (= res!249344 (validKeyInArray!0 k0!794))))

(declare-fun b!425647 () Bool)

(declare-fun res!249345 () Bool)

(assert (=> b!425647 (=> (not res!249345) (not e!252591))))

(assert (=> b!425647 (= res!249345 (bvsle from!863 i!563))))

(assert (= (and start!39656 res!249337) b!425638))

(assert (= (and b!425638 res!249342) b!425642))

(assert (= (and b!425642 res!249336) b!425645))

(assert (= (and b!425645 res!249335) b!425644))

(assert (= (and b!425644 res!249333) b!425632))

(assert (= (and b!425632 res!249341) b!425646))

(assert (= (and b!425646 res!249344) b!425636))

(assert (= (and b!425636 res!249340) b!425643))

(assert (= (and b!425643 res!249339) b!425637))

(assert (= (and b!425637 res!249343) b!425635))

(assert (= (and b!425635 res!249334) b!425647))

(assert (= (and b!425647 res!249345) b!425634))

(assert (= (and b!425634 res!249338) b!425633))

(assert (= (and b!425640 condMapEmpty!18255) mapIsEmpty!18255))

(assert (= (and b!425640 (not condMapEmpty!18255)) mapNonEmpty!18255))

(get-info :version)

(assert (= (and mapNonEmpty!18255 ((_ is ValueCellFull!5201) mapValue!18255)) b!425639))

(assert (= (and b!425640 ((_ is ValueCellFull!5201) mapDefault!18255)) b!425641))

(assert (= start!39656 b!425640))

(declare-fun m!413973 () Bool)

(assert (=> b!425635 m!413973))

(declare-fun m!413975 () Bool)

(assert (=> b!425637 m!413975))

(declare-fun m!413977 () Bool)

(assert (=> b!425637 m!413977))

(declare-fun m!413979 () Bool)

(assert (=> b!425636 m!413979))

(declare-fun m!413981 () Bool)

(assert (=> mapNonEmpty!18255 m!413981))

(declare-fun m!413983 () Bool)

(assert (=> b!425634 m!413983))

(declare-fun m!413985 () Bool)

(assert (=> b!425634 m!413985))

(declare-fun m!413987 () Bool)

(assert (=> b!425634 m!413987))

(declare-fun m!413989 () Bool)

(assert (=> b!425646 m!413989))

(declare-fun m!413991 () Bool)

(assert (=> b!425644 m!413991))

(declare-fun m!413993 () Bool)

(assert (=> b!425638 m!413993))

(declare-fun m!413995 () Bool)

(assert (=> b!425643 m!413995))

(declare-fun m!413997 () Bool)

(assert (=> start!39656 m!413997))

(declare-fun m!413999 () Bool)

(assert (=> start!39656 m!413999))

(declare-fun m!414001 () Bool)

(assert (=> b!425633 m!414001))

(declare-fun m!414003 () Bool)

(assert (=> b!425633 m!414003))

(assert (=> b!425633 m!414003))

(declare-fun m!414005 () Bool)

(assert (=> b!425633 m!414005))

(declare-fun m!414007 () Bool)

(assert (=> b!425633 m!414007))

(declare-fun m!414009 () Bool)

(assert (=> b!425645 m!414009))

(check-sat tp_is_empty!11089 (not b!425637) (not b!425633) (not b!425644) b_and!17567 (not b!425646) (not b!425635) (not b!425634) (not b!425643) (not b!425645) (not b_next!9937) (not mapNonEmpty!18255) (not start!39656) (not b!425638))
(check-sat b_and!17567 (not b_next!9937))
