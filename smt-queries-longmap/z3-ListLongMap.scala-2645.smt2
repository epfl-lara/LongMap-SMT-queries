; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39674 () Bool)

(assert start!39674)

(declare-fun b_free!9955 () Bool)

(declare-fun b_next!9955 () Bool)

(assert (=> start!39674 (= b_free!9955 (not b_next!9955))))

(declare-fun tp!35394 () Bool)

(declare-fun b_and!17585 () Bool)

(assert (=> start!39674 (= tp!35394 b_and!17585)))

(declare-fun b!426064 () Bool)

(declare-fun res!249688 () Bool)

(declare-fun e!252782 () Bool)

(assert (=> b!426064 (=> (not res!249688) (not e!252782))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426064 (= res!249688 (validKeyInArray!0 k0!794))))

(declare-fun b!426065 () Bool)

(declare-fun res!249687 () Bool)

(assert (=> b!426065 (=> (not res!249687) (not e!252782))))

(declare-datatypes ((array!26043 0))(
  ( (array!26044 (arr!12471 (Array (_ BitVec 32) (_ BitVec 64))) (size!12824 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26043)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26043 (_ BitVec 32)) Bool)

(assert (=> b!426065 (= res!249687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!249691 () Bool)

(assert (=> start!39674 (=> (not res!249691) (not e!252782))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39674 (= res!249691 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12824 _keys!709))))))

(assert (=> start!39674 e!252782))

(declare-fun tp_is_empty!11107 () Bool)

(assert (=> start!39674 tp_is_empty!11107))

(assert (=> start!39674 tp!35394))

(assert (=> start!39674 true))

(declare-datatypes ((V!15915 0))(
  ( (V!15916 (val!5598 Int)) )
))
(declare-datatypes ((ValueCell!5210 0))(
  ( (ValueCellFull!5210 (v!7839 V!15915)) (EmptyCell!5210) )
))
(declare-datatypes ((array!26045 0))(
  ( (array!26046 (arr!12472 (Array (_ BitVec 32) ValueCell!5210)) (size!12825 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26045)

(declare-fun e!252780 () Bool)

(declare-fun array_inv!9118 (array!26045) Bool)

(assert (=> start!39674 (and (array_inv!9118 _values!549) e!252780)))

(declare-fun array_inv!9119 (array!26043) Bool)

(assert (=> start!39674 (array_inv!9119 _keys!709)))

(declare-fun b!426066 () Bool)

(declare-fun e!252784 () Bool)

(declare-fun e!252783 () Bool)

(assert (=> b!426066 (= e!252784 e!252783)))

(declare-fun res!249693 () Bool)

(assert (=> b!426066 (=> (not res!249693) (not e!252783))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426066 (= res!249693 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194699 () array!26045)

(declare-fun minValue!515 () V!15915)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7352 0))(
  ( (tuple2!7353 (_1!3687 (_ BitVec 64)) (_2!3687 V!15915)) )
))
(declare-datatypes ((List!7353 0))(
  ( (Nil!7350) (Cons!7349 (h!8205 tuple2!7352) (t!12788 List!7353)) )
))
(declare-datatypes ((ListLongMap!6255 0))(
  ( (ListLongMap!6256 (toList!3143 List!7353)) )
))
(declare-fun lt!194696 () ListLongMap!6255)

(declare-fun zeroValue!515 () V!15915)

(declare-fun lt!194698 () array!26043)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1351 (array!26043 array!26045 (_ BitVec 32) (_ BitVec 32) V!15915 V!15915 (_ BitVec 32) Int) ListLongMap!6255)

(assert (=> b!426066 (= lt!194696 (getCurrentListMapNoExtraKeys!1351 lt!194698 lt!194699 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15915)

(assert (=> b!426066 (= lt!194699 (array!26046 (store (arr!12472 _values!549) i!563 (ValueCellFull!5210 v!412)) (size!12825 _values!549)))))

(declare-fun lt!194697 () ListLongMap!6255)

(assert (=> b!426066 (= lt!194697 (getCurrentListMapNoExtraKeys!1351 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426067 () Bool)

(declare-fun res!249695 () Bool)

(assert (=> b!426067 (=> (not res!249695) (not e!252782))))

(assert (=> b!426067 (= res!249695 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12824 _keys!709))))))

(declare-fun b!426068 () Bool)

(declare-fun res!249684 () Bool)

(assert (=> b!426068 (=> (not res!249684) (not e!252784))))

(declare-datatypes ((List!7354 0))(
  ( (Nil!7351) (Cons!7350 (h!8206 (_ BitVec 64)) (t!12789 List!7354)) )
))
(declare-fun arrayNoDuplicates!0 (array!26043 (_ BitVec 32) List!7354) Bool)

(assert (=> b!426068 (= res!249684 (arrayNoDuplicates!0 lt!194698 #b00000000000000000000000000000000 Nil!7351))))

(declare-fun b!426069 () Bool)

(declare-fun res!249692 () Bool)

(assert (=> b!426069 (=> (not res!249692) (not e!252782))))

(assert (=> b!426069 (= res!249692 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7351))))

(declare-fun b!426070 () Bool)

(declare-fun e!252785 () Bool)

(assert (=> b!426070 (= e!252785 tp_is_empty!11107)))

(declare-fun mapNonEmpty!18282 () Bool)

(declare-fun mapRes!18282 () Bool)

(declare-fun tp!35393 () Bool)

(assert (=> mapNonEmpty!18282 (= mapRes!18282 (and tp!35393 e!252785))))

(declare-fun mapKey!18282 () (_ BitVec 32))

(declare-fun mapValue!18282 () ValueCell!5210)

(declare-fun mapRest!18282 () (Array (_ BitVec 32) ValueCell!5210))

(assert (=> mapNonEmpty!18282 (= (arr!12472 _values!549) (store mapRest!18282 mapKey!18282 mapValue!18282))))

(declare-fun b!426071 () Bool)

(declare-fun res!249690 () Bool)

(assert (=> b!426071 (=> (not res!249690) (not e!252782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426071 (= res!249690 (validMask!0 mask!1025))))

(declare-fun b!426072 () Bool)

(declare-fun res!249689 () Bool)

(assert (=> b!426072 (=> (not res!249689) (not e!252782))))

(assert (=> b!426072 (= res!249689 (or (= (select (arr!12471 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12471 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426073 () Bool)

(assert (=> b!426073 (= e!252783 (not true))))

(declare-fun +!1323 (ListLongMap!6255 tuple2!7352) ListLongMap!6255)

(assert (=> b!426073 (= (getCurrentListMapNoExtraKeys!1351 lt!194698 lt!194699 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1323 (getCurrentListMapNoExtraKeys!1351 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7353 k0!794 v!412)))))

(declare-datatypes ((Unit!12492 0))(
  ( (Unit!12493) )
))
(declare-fun lt!194695 () Unit!12492)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!494 (array!26043 array!26045 (_ BitVec 32) (_ BitVec 32) V!15915 V!15915 (_ BitVec 32) (_ BitVec 64) V!15915 (_ BitVec 32) Int) Unit!12492)

(assert (=> b!426073 (= lt!194695 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!494 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426074 () Bool)

(assert (=> b!426074 (= e!252782 e!252784)))

(declare-fun res!249694 () Bool)

(assert (=> b!426074 (=> (not res!249694) (not e!252784))))

(assert (=> b!426074 (= res!249694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194698 mask!1025))))

(assert (=> b!426074 (= lt!194698 (array!26044 (store (arr!12471 _keys!709) i!563 k0!794) (size!12824 _keys!709)))))

(declare-fun b!426075 () Bool)

(declare-fun res!249696 () Bool)

(assert (=> b!426075 (=> (not res!249696) (not e!252782))))

(assert (=> b!426075 (= res!249696 (and (= (size!12825 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12824 _keys!709) (size!12825 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426076 () Bool)

(declare-fun res!249685 () Bool)

(assert (=> b!426076 (=> (not res!249685) (not e!252782))))

(declare-fun arrayContainsKey!0 (array!26043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426076 (= res!249685 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426077 () Bool)

(declare-fun e!252786 () Bool)

(assert (=> b!426077 (= e!252780 (and e!252786 mapRes!18282))))

(declare-fun condMapEmpty!18282 () Bool)

(declare-fun mapDefault!18282 () ValueCell!5210)

(assert (=> b!426077 (= condMapEmpty!18282 (= (arr!12472 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5210)) mapDefault!18282)))))

(declare-fun b!426078 () Bool)

(assert (=> b!426078 (= e!252786 tp_is_empty!11107)))

(declare-fun b!426079 () Bool)

(declare-fun res!249686 () Bool)

(assert (=> b!426079 (=> (not res!249686) (not e!252784))))

(assert (=> b!426079 (= res!249686 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18282 () Bool)

(assert (=> mapIsEmpty!18282 mapRes!18282))

(assert (= (and start!39674 res!249691) b!426071))

(assert (= (and b!426071 res!249690) b!426075))

(assert (= (and b!426075 res!249696) b!426065))

(assert (= (and b!426065 res!249687) b!426069))

(assert (= (and b!426069 res!249692) b!426067))

(assert (= (and b!426067 res!249695) b!426064))

(assert (= (and b!426064 res!249688) b!426072))

(assert (= (and b!426072 res!249689) b!426076))

(assert (= (and b!426076 res!249685) b!426074))

(assert (= (and b!426074 res!249694) b!426068))

(assert (= (and b!426068 res!249684) b!426079))

(assert (= (and b!426079 res!249686) b!426066))

(assert (= (and b!426066 res!249693) b!426073))

(assert (= (and b!426077 condMapEmpty!18282) mapIsEmpty!18282))

(assert (= (and b!426077 (not condMapEmpty!18282)) mapNonEmpty!18282))

(get-info :version)

(assert (= (and mapNonEmpty!18282 ((_ is ValueCellFull!5210) mapValue!18282)) b!426070))

(assert (= (and b!426077 ((_ is ValueCellFull!5210) mapDefault!18282)) b!426078))

(assert (= start!39674 b!426077))

(declare-fun m!414315 () Bool)

(assert (=> b!426072 m!414315))

(declare-fun m!414317 () Bool)

(assert (=> b!426073 m!414317))

(declare-fun m!414319 () Bool)

(assert (=> b!426073 m!414319))

(assert (=> b!426073 m!414319))

(declare-fun m!414321 () Bool)

(assert (=> b!426073 m!414321))

(declare-fun m!414323 () Bool)

(assert (=> b!426073 m!414323))

(declare-fun m!414325 () Bool)

(assert (=> mapNonEmpty!18282 m!414325))

(declare-fun m!414327 () Bool)

(assert (=> b!426071 m!414327))

(declare-fun m!414329 () Bool)

(assert (=> b!426069 m!414329))

(declare-fun m!414331 () Bool)

(assert (=> b!426066 m!414331))

(declare-fun m!414333 () Bool)

(assert (=> b!426066 m!414333))

(declare-fun m!414335 () Bool)

(assert (=> b!426066 m!414335))

(declare-fun m!414337 () Bool)

(assert (=> b!426068 m!414337))

(declare-fun m!414339 () Bool)

(assert (=> start!39674 m!414339))

(declare-fun m!414341 () Bool)

(assert (=> start!39674 m!414341))

(declare-fun m!414343 () Bool)

(assert (=> b!426064 m!414343))

(declare-fun m!414345 () Bool)

(assert (=> b!426074 m!414345))

(declare-fun m!414347 () Bool)

(assert (=> b!426074 m!414347))

(declare-fun m!414349 () Bool)

(assert (=> b!426065 m!414349))

(declare-fun m!414351 () Bool)

(assert (=> b!426076 m!414351))

(check-sat (not b!426071) (not b!426068) (not start!39674) (not b!426074) (not b!426065) (not b!426069) (not b!426076) tp_is_empty!11107 (not b!426073) (not b_next!9955) (not b!426066) (not b!426064) b_and!17585 (not mapNonEmpty!18282))
(check-sat b_and!17585 (not b_next!9955))
