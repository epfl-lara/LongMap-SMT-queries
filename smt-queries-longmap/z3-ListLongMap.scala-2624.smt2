; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39564 () Bool)

(assert start!39564)

(declare-fun b_free!9831 () Bool)

(declare-fun b_next!9831 () Bool)

(assert (=> start!39564 (= b_free!9831 (not b_next!9831))))

(declare-fun tp!35021 () Bool)

(declare-fun b_and!17487 () Bool)

(assert (=> start!39564 (= tp!35021 b_and!17487)))

(declare-fun b!423444 () Bool)

(declare-fun res!247487 () Bool)

(declare-fun e!251739 () Bool)

(assert (=> b!423444 (=> (not res!247487) (not e!251739))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25811 0))(
  ( (array!25812 (arr!12355 (Array (_ BitVec 32) (_ BitVec 64))) (size!12707 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25811)

(assert (=> b!423444 (= res!247487 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12707 _keys!709))))))

(declare-fun b!423445 () Bool)

(declare-fun e!251738 () Bool)

(declare-fun tp_is_empty!10983 () Bool)

(assert (=> b!423445 (= e!251738 tp_is_empty!10983)))

(declare-fun res!247483 () Bool)

(assert (=> start!39564 (=> (not res!247483) (not e!251739))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39564 (= res!247483 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12707 _keys!709))))))

(assert (=> start!39564 e!251739))

(assert (=> start!39564 tp_is_empty!10983))

(assert (=> start!39564 tp!35021))

(assert (=> start!39564 true))

(declare-datatypes ((V!15749 0))(
  ( (V!15750 (val!5536 Int)) )
))
(declare-datatypes ((ValueCell!5148 0))(
  ( (ValueCellFull!5148 (v!7783 V!15749)) (EmptyCell!5148) )
))
(declare-datatypes ((array!25813 0))(
  ( (array!25814 (arr!12356 (Array (_ BitVec 32) ValueCell!5148)) (size!12708 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25813)

(declare-fun e!251741 () Bool)

(declare-fun array_inv!9002 (array!25813) Bool)

(assert (=> start!39564 (and (array_inv!9002 _values!549) e!251741)))

(declare-fun array_inv!9003 (array!25811) Bool)

(assert (=> start!39564 (array_inv!9003 _keys!709)))

(declare-fun b!423446 () Bool)

(declare-fun res!247491 () Bool)

(assert (=> b!423446 (=> (not res!247491) (not e!251739))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25811 (_ BitVec 32)) Bool)

(assert (=> b!423446 (= res!247491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423447 () Bool)

(declare-fun res!247489 () Bool)

(assert (=> b!423447 (=> (not res!247489) (not e!251739))))

(assert (=> b!423447 (= res!247489 (or (= (select (arr!12355 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12355 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423448 () Bool)

(declare-fun mapRes!18096 () Bool)

(assert (=> b!423448 (= e!251741 (and e!251738 mapRes!18096))))

(declare-fun condMapEmpty!18096 () Bool)

(declare-fun mapDefault!18096 () ValueCell!5148)

(assert (=> b!423448 (= condMapEmpty!18096 (= (arr!12356 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5148)) mapDefault!18096)))))

(declare-fun b!423449 () Bool)

(declare-fun res!247486 () Bool)

(assert (=> b!423449 (=> (not res!247486) (not e!251739))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!423449 (= res!247486 (and (= (size!12708 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12707 _keys!709) (size!12708 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423450 () Bool)

(declare-fun res!247481 () Bool)

(declare-fun e!251737 () Bool)

(assert (=> b!423450 (=> (not res!247481) (not e!251737))))

(declare-fun lt!194170 () array!25811)

(declare-datatypes ((List!7279 0))(
  ( (Nil!7276) (Cons!7275 (h!8131 (_ BitVec 64)) (t!12723 List!7279)) )
))
(declare-fun arrayNoDuplicates!0 (array!25811 (_ BitVec 32) List!7279) Bool)

(assert (=> b!423450 (= res!247481 (arrayNoDuplicates!0 lt!194170 #b00000000000000000000000000000000 Nil!7276))))

(declare-fun b!423451 () Bool)

(declare-fun res!247482 () Bool)

(assert (=> b!423451 (=> (not res!247482) (not e!251737))))

(assert (=> b!423451 (= res!247482 (bvsle from!863 i!563))))

(declare-fun b!423452 () Bool)

(assert (=> b!423452 (= e!251737 false)))

(declare-fun minValue!515 () V!15749)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15749)

(declare-fun v!412 () V!15749)

(declare-datatypes ((tuple2!7272 0))(
  ( (tuple2!7273 (_1!3647 (_ BitVec 64)) (_2!3647 V!15749)) )
))
(declare-datatypes ((List!7280 0))(
  ( (Nil!7277) (Cons!7276 (h!8132 tuple2!7272) (t!12724 List!7280)) )
))
(declare-datatypes ((ListLongMap!6185 0))(
  ( (ListLongMap!6186 (toList!3108 List!7280)) )
))
(declare-fun lt!194171 () ListLongMap!6185)

(declare-fun getCurrentListMapNoExtraKeys!1312 (array!25811 array!25813 (_ BitVec 32) (_ BitVec 32) V!15749 V!15749 (_ BitVec 32) Int) ListLongMap!6185)

(assert (=> b!423452 (= lt!194171 (getCurrentListMapNoExtraKeys!1312 lt!194170 (array!25814 (store (arr!12356 _values!549) i!563 (ValueCellFull!5148 v!412)) (size!12708 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194169 () ListLongMap!6185)

(assert (=> b!423452 (= lt!194169 (getCurrentListMapNoExtraKeys!1312 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423453 () Bool)

(assert (=> b!423453 (= e!251739 e!251737)))

(declare-fun res!247480 () Bool)

(assert (=> b!423453 (=> (not res!247480) (not e!251737))))

(assert (=> b!423453 (= res!247480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194170 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!423453 (= lt!194170 (array!25812 (store (arr!12355 _keys!709) i!563 k0!794) (size!12707 _keys!709)))))

(declare-fun b!423454 () Bool)

(declare-fun res!247484 () Bool)

(assert (=> b!423454 (=> (not res!247484) (not e!251739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423454 (= res!247484 (validKeyInArray!0 k0!794))))

(declare-fun b!423455 () Bool)

(declare-fun res!247485 () Bool)

(assert (=> b!423455 (=> (not res!247485) (not e!251739))))

(assert (=> b!423455 (= res!247485 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7276))))

(declare-fun b!423456 () Bool)

(declare-fun res!247490 () Bool)

(assert (=> b!423456 (=> (not res!247490) (not e!251739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423456 (= res!247490 (validMask!0 mask!1025))))

(declare-fun b!423457 () Bool)

(declare-fun res!247488 () Bool)

(assert (=> b!423457 (=> (not res!247488) (not e!251739))))

(declare-fun arrayContainsKey!0 (array!25811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423457 (= res!247488 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18096 () Bool)

(declare-fun tp!35022 () Bool)

(declare-fun e!251742 () Bool)

(assert (=> mapNonEmpty!18096 (= mapRes!18096 (and tp!35022 e!251742))))

(declare-fun mapValue!18096 () ValueCell!5148)

(declare-fun mapKey!18096 () (_ BitVec 32))

(declare-fun mapRest!18096 () (Array (_ BitVec 32) ValueCell!5148))

(assert (=> mapNonEmpty!18096 (= (arr!12356 _values!549) (store mapRest!18096 mapKey!18096 mapValue!18096))))

(declare-fun b!423458 () Bool)

(assert (=> b!423458 (= e!251742 tp_is_empty!10983)))

(declare-fun mapIsEmpty!18096 () Bool)

(assert (=> mapIsEmpty!18096 mapRes!18096))

(assert (= (and start!39564 res!247483) b!423456))

(assert (= (and b!423456 res!247490) b!423449))

(assert (= (and b!423449 res!247486) b!423446))

(assert (= (and b!423446 res!247491) b!423455))

(assert (= (and b!423455 res!247485) b!423444))

(assert (= (and b!423444 res!247487) b!423454))

(assert (= (and b!423454 res!247484) b!423447))

(assert (= (and b!423447 res!247489) b!423457))

(assert (= (and b!423457 res!247488) b!423453))

(assert (= (and b!423453 res!247480) b!423450))

(assert (= (and b!423450 res!247481) b!423451))

(assert (= (and b!423451 res!247482) b!423452))

(assert (= (and b!423448 condMapEmpty!18096) mapIsEmpty!18096))

(assert (= (and b!423448 (not condMapEmpty!18096)) mapNonEmpty!18096))

(get-info :version)

(assert (= (and mapNonEmpty!18096 ((_ is ValueCellFull!5148) mapValue!18096)) b!423458))

(assert (= (and b!423448 ((_ is ValueCellFull!5148) mapDefault!18096)) b!423445))

(assert (= start!39564 b!423448))

(declare-fun m!412923 () Bool)

(assert (=> b!423446 m!412923))

(declare-fun m!412925 () Bool)

(assert (=> b!423447 m!412925))

(declare-fun m!412927 () Bool)

(assert (=> b!423457 m!412927))

(declare-fun m!412929 () Bool)

(assert (=> start!39564 m!412929))

(declare-fun m!412931 () Bool)

(assert (=> start!39564 m!412931))

(declare-fun m!412933 () Bool)

(assert (=> b!423454 m!412933))

(declare-fun m!412935 () Bool)

(assert (=> b!423453 m!412935))

(declare-fun m!412937 () Bool)

(assert (=> b!423453 m!412937))

(declare-fun m!412939 () Bool)

(assert (=> mapNonEmpty!18096 m!412939))

(declare-fun m!412941 () Bool)

(assert (=> b!423455 m!412941))

(declare-fun m!412943 () Bool)

(assert (=> b!423452 m!412943))

(declare-fun m!412945 () Bool)

(assert (=> b!423452 m!412945))

(declare-fun m!412947 () Bool)

(assert (=> b!423452 m!412947))

(declare-fun m!412949 () Bool)

(assert (=> b!423456 m!412949))

(declare-fun m!412951 () Bool)

(assert (=> b!423450 m!412951))

(check-sat (not b!423457) (not b!423456) (not start!39564) (not b!423450) (not b!423452) (not b!423454) (not b!423455) (not b_next!9831) b_and!17487 (not b!423446) (not mapNonEmpty!18096) (not b!423453) tp_is_empty!10983)
(check-sat b_and!17487 (not b_next!9831))
