; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40786 () Bool)

(assert start!40786)

(declare-fun b_free!10789 () Bool)

(declare-fun b_next!10789 () Bool)

(assert (=> start!40786 (= b_free!10789 (not b_next!10789))))

(declare-fun tp!38189 () Bool)

(declare-fun b_and!18839 () Bool)

(assert (=> start!40786 (= tp!38189 b_and!18839)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!29952 () Bool)

(declare-datatypes ((V!17275 0))(
  ( (V!17276 (val!6108 Int)) )
))
(declare-fun minValue!515 () V!17275)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17275)

(declare-datatypes ((tuple2!8050 0))(
  ( (tuple2!8051 (_1!4036 (_ BitVec 64)) (_2!4036 V!17275)) )
))
(declare-datatypes ((List!8108 0))(
  ( (Nil!8105) (Cons!8104 (h!8960 tuple2!8050) (t!13911 List!8108)) )
))
(declare-datatypes ((ListLongMap!6953 0))(
  ( (ListLongMap!6954 (toList!3492 List!8108)) )
))
(declare-fun call!29956 () ListLongMap!6953)

(declare-datatypes ((ValueCell!5720 0))(
  ( (ValueCellFull!5720 (v!8361 V!17275)) (EmptyCell!5720) )
))
(declare-datatypes ((array!28051 0))(
  ( (array!28052 (arr!13470 (Array (_ BitVec 32) ValueCell!5720)) (size!13823 (_ BitVec 32))) )
))
(declare-fun lt!205124 () array!28051)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!28053 0))(
  ( (array!28054 (arr!13471 (Array (_ BitVec 32) (_ BitVec 64))) (size!13824 (_ BitVec 32))) )
))
(declare-fun lt!205126 () array!28053)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1688 (array!28053 array!28051 (_ BitVec 32) (_ BitVec 32) V!17275 V!17275 (_ BitVec 32) Int) ListLongMap!6953)

(assert (=> bm!29952 (= call!29956 (getCurrentListMapNoExtraKeys!1688 lt!205126 lt!205124 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452377 () Bool)

(declare-fun res!269507 () Bool)

(declare-fun e!264837 () Bool)

(assert (=> b!452377 (=> (not res!269507) (not e!264837))))

(declare-fun _keys!709 () array!28053)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28053 (_ BitVec 32)) Bool)

(assert (=> b!452377 (= res!269507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452378 () Bool)

(declare-fun e!264834 () Bool)

(declare-fun tp_is_empty!12127 () Bool)

(assert (=> b!452378 (= e!264834 tp_is_empty!12127)))

(declare-fun b!452379 () Bool)

(declare-fun res!269516 () Bool)

(assert (=> b!452379 (=> (not res!269516) (not e!264837))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452379 (= res!269516 (or (= (select (arr!13471 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13471 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19827 () Bool)

(declare-fun mapRes!19827 () Bool)

(declare-fun tp!38190 () Bool)

(declare-fun e!264838 () Bool)

(assert (=> mapNonEmpty!19827 (= mapRes!19827 (and tp!38190 e!264838))))

(declare-fun mapValue!19827 () ValueCell!5720)

(declare-fun mapKey!19827 () (_ BitVec 32))

(declare-fun _values!549 () array!28051)

(declare-fun mapRest!19827 () (Array (_ BitVec 32) ValueCell!5720))

(assert (=> mapNonEmpty!19827 (= (arr!13470 _values!549) (store mapRest!19827 mapKey!19827 mapValue!19827))))

(declare-fun b!452380 () Bool)

(declare-fun e!264832 () Bool)

(declare-fun e!264839 () Bool)

(assert (=> b!452380 (= e!264832 e!264839)))

(declare-fun res!269514 () Bool)

(assert (=> b!452380 (=> (not res!269514) (not e!264839))))

(assert (=> b!452380 (= res!269514 (= from!863 i!563))))

(declare-fun lt!205122 () ListLongMap!6953)

(assert (=> b!452380 (= lt!205122 (getCurrentListMapNoExtraKeys!1688 lt!205126 lt!205124 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17275)

(assert (=> b!452380 (= lt!205124 (array!28052 (store (arr!13470 _values!549) i!563 (ValueCellFull!5720 v!412)) (size!13823 _values!549)))))

(declare-fun lt!205120 () ListLongMap!6953)

(assert (=> b!452380 (= lt!205120 (getCurrentListMapNoExtraKeys!1688 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452381 () Bool)

(declare-fun res!269513 () Bool)

(assert (=> b!452381 (=> (not res!269513) (not e!264837))))

(assert (=> b!452381 (= res!269513 (and (= (size!13823 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13824 _keys!709) (size!13823 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452382 () Bool)

(declare-fun res!269510 () Bool)

(assert (=> b!452382 (=> (not res!269510) (not e!264832))))

(declare-datatypes ((List!8109 0))(
  ( (Nil!8106) (Cons!8105 (h!8961 (_ BitVec 64)) (t!13912 List!8109)) )
))
(declare-fun arrayNoDuplicates!0 (array!28053 (_ BitVec 32) List!8109) Bool)

(assert (=> b!452382 (= res!269510 (arrayNoDuplicates!0 lt!205126 #b00000000000000000000000000000000 Nil!8106))))

(declare-fun b!452383 () Bool)

(declare-fun e!264833 () Bool)

(assert (=> b!452383 (= e!264833 (and e!264834 mapRes!19827))))

(declare-fun condMapEmpty!19827 () Bool)

(declare-fun mapDefault!19827 () ValueCell!5720)

(assert (=> b!452383 (= condMapEmpty!19827 (= (arr!13470 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5720)) mapDefault!19827)))))

(declare-fun bm!29953 () Bool)

(declare-fun call!29955 () ListLongMap!6953)

(assert (=> bm!29953 (= call!29955 (getCurrentListMapNoExtraKeys!1688 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452384 () Bool)

(declare-fun res!269509 () Bool)

(assert (=> b!452384 (=> (not res!269509) (not e!264837))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452384 (= res!269509 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452385 () Bool)

(declare-fun res!269508 () Bool)

(assert (=> b!452385 (=> (not res!269508) (not e!264837))))

(assert (=> b!452385 (= res!269508 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13824 _keys!709))))))

(declare-fun res!269511 () Bool)

(assert (=> start!40786 (=> (not res!269511) (not e!264837))))

(assert (=> start!40786 (= res!269511 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13824 _keys!709))))))

(assert (=> start!40786 e!264837))

(assert (=> start!40786 tp_is_empty!12127))

(assert (=> start!40786 tp!38189))

(assert (=> start!40786 true))

(declare-fun array_inv!9818 (array!28051) Bool)

(assert (=> start!40786 (and (array_inv!9818 _values!549) e!264833)))

(declare-fun array_inv!9819 (array!28053) Bool)

(assert (=> start!40786 (array_inv!9819 _keys!709)))

(declare-fun b!452386 () Bool)

(declare-fun res!269504 () Bool)

(assert (=> b!452386 (=> (not res!269504) (not e!264837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452386 (= res!269504 (validKeyInArray!0 k0!794))))

(declare-fun b!452387 () Bool)

(declare-fun res!269503 () Bool)

(assert (=> b!452387 (=> (not res!269503) (not e!264832))))

(assert (=> b!452387 (= res!269503 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19827 () Bool)

(assert (=> mapIsEmpty!19827 mapRes!19827))

(declare-fun b!452388 () Bool)

(declare-fun res!269505 () Bool)

(assert (=> b!452388 (=> (not res!269505) (not e!264837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452388 (= res!269505 (validMask!0 mask!1025))))

(declare-fun b!452389 () Bool)

(declare-fun e!264831 () Bool)

(assert (=> b!452389 (= e!264839 (not e!264831))))

(declare-fun res!269515 () Bool)

(assert (=> b!452389 (=> res!269515 e!264831)))

(assert (=> b!452389 (= res!269515 (validKeyInArray!0 (select (arr!13471 _keys!709) from!863)))))

(declare-fun e!264835 () Bool)

(assert (=> b!452389 e!264835))

(declare-fun c!56061 () Bool)

(assert (=> b!452389 (= c!56061 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13201 0))(
  ( (Unit!13202) )
))
(declare-fun lt!205129 () Unit!13201)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!727 (array!28053 array!28051 (_ BitVec 32) (_ BitVec 32) V!17275 V!17275 (_ BitVec 32) (_ BitVec 64) V!17275 (_ BitVec 32) Int) Unit!13201)

(assert (=> b!452389 (= lt!205129 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!727 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452390 () Bool)

(assert (=> b!452390 (= e!264838 tp_is_empty!12127)))

(declare-fun b!452391 () Bool)

(assert (=> b!452391 (= e!264835 (= call!29956 call!29955))))

(declare-fun b!452392 () Bool)

(declare-fun +!1589 (ListLongMap!6953 tuple2!8050) ListLongMap!6953)

(assert (=> b!452392 (= e!264835 (= call!29956 (+!1589 call!29955 (tuple2!8051 k0!794 v!412))))))

(declare-fun b!452393 () Bool)

(assert (=> b!452393 (= e!264831 true)))

(declare-fun lt!205127 () ListLongMap!6953)

(declare-fun lt!205125 () tuple2!8050)

(declare-fun lt!205130 () V!17275)

(assert (=> b!452393 (= (+!1589 lt!205127 lt!205125) (+!1589 (+!1589 lt!205127 (tuple2!8051 k0!794 lt!205130)) lt!205125))))

(declare-fun lt!205121 () V!17275)

(assert (=> b!452393 (= lt!205125 (tuple2!8051 k0!794 lt!205121))))

(declare-fun lt!205128 () Unit!13201)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!85 (ListLongMap!6953 (_ BitVec 64) V!17275 V!17275) Unit!13201)

(assert (=> b!452393 (= lt!205128 (addSameAsAddTwiceSameKeyDiffValues!85 lt!205127 k0!794 lt!205130 lt!205121))))

(declare-fun lt!205123 () V!17275)

(declare-fun get!6642 (ValueCell!5720 V!17275) V!17275)

(assert (=> b!452393 (= lt!205130 (get!6642 (select (arr!13470 _values!549) from!863) lt!205123))))

(assert (=> b!452393 (= lt!205122 (+!1589 lt!205127 (tuple2!8051 (select (arr!13471 lt!205126) from!863) lt!205121)))))

(assert (=> b!452393 (= lt!205121 (get!6642 (select (store (arr!13470 _values!549) i!563 (ValueCellFull!5720 v!412)) from!863) lt!205123))))

(declare-fun dynLambda!864 (Int (_ BitVec 64)) V!17275)

(assert (=> b!452393 (= lt!205123 (dynLambda!864 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452393 (= lt!205127 (getCurrentListMapNoExtraKeys!1688 lt!205126 lt!205124 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452394 () Bool)

(declare-fun res!269512 () Bool)

(assert (=> b!452394 (=> (not res!269512) (not e!264837))))

(assert (=> b!452394 (= res!269512 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8106))))

(declare-fun b!452395 () Bool)

(assert (=> b!452395 (= e!264837 e!264832)))

(declare-fun res!269506 () Bool)

(assert (=> b!452395 (=> (not res!269506) (not e!264832))))

(assert (=> b!452395 (= res!269506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205126 mask!1025))))

(assert (=> b!452395 (= lt!205126 (array!28054 (store (arr!13471 _keys!709) i!563 k0!794) (size!13824 _keys!709)))))

(assert (= (and start!40786 res!269511) b!452388))

(assert (= (and b!452388 res!269505) b!452381))

(assert (= (and b!452381 res!269513) b!452377))

(assert (= (and b!452377 res!269507) b!452394))

(assert (= (and b!452394 res!269512) b!452385))

(assert (= (and b!452385 res!269508) b!452386))

(assert (= (and b!452386 res!269504) b!452379))

(assert (= (and b!452379 res!269516) b!452384))

(assert (= (and b!452384 res!269509) b!452395))

(assert (= (and b!452395 res!269506) b!452382))

(assert (= (and b!452382 res!269510) b!452387))

(assert (= (and b!452387 res!269503) b!452380))

(assert (= (and b!452380 res!269514) b!452389))

(assert (= (and b!452389 c!56061) b!452392))

(assert (= (and b!452389 (not c!56061)) b!452391))

(assert (= (or b!452392 b!452391) bm!29952))

(assert (= (or b!452392 b!452391) bm!29953))

(assert (= (and b!452389 (not res!269515)) b!452393))

(assert (= (and b!452383 condMapEmpty!19827) mapIsEmpty!19827))

(assert (= (and b!452383 (not condMapEmpty!19827)) mapNonEmpty!19827))

(get-info :version)

(assert (= (and mapNonEmpty!19827 ((_ is ValueCellFull!5720) mapValue!19827)) b!452390))

(assert (= (and b!452383 ((_ is ValueCellFull!5720) mapDefault!19827)) b!452378))

(assert (= start!40786 b!452383))

(declare-fun b_lambda!9549 () Bool)

(assert (=> (not b_lambda!9549) (not b!452393)))

(declare-fun t!13910 () Bool)

(declare-fun tb!3761 () Bool)

(assert (=> (and start!40786 (= defaultEntry!557 defaultEntry!557) t!13910) tb!3761))

(declare-fun result!7067 () Bool)

(assert (=> tb!3761 (= result!7067 tp_is_empty!12127)))

(assert (=> b!452393 t!13910))

(declare-fun b_and!18841 () Bool)

(assert (= b_and!18839 (and (=> t!13910 result!7067) b_and!18841)))

(declare-fun m!435659 () Bool)

(assert (=> b!452380 m!435659))

(declare-fun m!435661 () Bool)

(assert (=> b!452380 m!435661))

(declare-fun m!435663 () Bool)

(assert (=> b!452380 m!435663))

(declare-fun m!435665 () Bool)

(assert (=> mapNonEmpty!19827 m!435665))

(declare-fun m!435667 () Bool)

(assert (=> b!452386 m!435667))

(declare-fun m!435669 () Bool)

(assert (=> bm!29952 m!435669))

(declare-fun m!435671 () Bool)

(assert (=> b!452379 m!435671))

(declare-fun m!435673 () Bool)

(assert (=> b!452392 m!435673))

(declare-fun m!435675 () Bool)

(assert (=> b!452388 m!435675))

(declare-fun m!435677 () Bool)

(assert (=> b!452393 m!435677))

(declare-fun m!435679 () Bool)

(assert (=> b!452393 m!435679))

(declare-fun m!435681 () Bool)

(assert (=> b!452393 m!435681))

(assert (=> b!452393 m!435661))

(declare-fun m!435683 () Bool)

(assert (=> b!452393 m!435683))

(declare-fun m!435685 () Bool)

(assert (=> b!452393 m!435685))

(assert (=> b!452393 m!435683))

(declare-fun m!435687 () Bool)

(assert (=> b!452393 m!435687))

(assert (=> b!452393 m!435669))

(assert (=> b!452393 m!435677))

(declare-fun m!435689 () Bool)

(assert (=> b!452393 m!435689))

(declare-fun m!435691 () Bool)

(assert (=> b!452393 m!435691))

(declare-fun m!435693 () Bool)

(assert (=> b!452393 m!435693))

(declare-fun m!435695 () Bool)

(assert (=> b!452393 m!435695))

(declare-fun m!435697 () Bool)

(assert (=> b!452393 m!435697))

(assert (=> b!452393 m!435693))

(declare-fun m!435699 () Bool)

(assert (=> start!40786 m!435699))

(declare-fun m!435701 () Bool)

(assert (=> start!40786 m!435701))

(declare-fun m!435703 () Bool)

(assert (=> bm!29953 m!435703))

(declare-fun m!435705 () Bool)

(assert (=> b!452394 m!435705))

(declare-fun m!435707 () Bool)

(assert (=> b!452395 m!435707))

(declare-fun m!435709 () Bool)

(assert (=> b!452395 m!435709))

(declare-fun m!435711 () Bool)

(assert (=> b!452377 m!435711))

(declare-fun m!435713 () Bool)

(assert (=> b!452384 m!435713))

(declare-fun m!435715 () Bool)

(assert (=> b!452389 m!435715))

(assert (=> b!452389 m!435715))

(declare-fun m!435717 () Bool)

(assert (=> b!452389 m!435717))

(declare-fun m!435719 () Bool)

(assert (=> b!452389 m!435719))

(declare-fun m!435721 () Bool)

(assert (=> b!452382 m!435721))

(check-sat (not b_next!10789) (not b!452377) (not bm!29952) (not b_lambda!9549) (not b!452395) (not mapNonEmpty!19827) (not b!452382) (not b!452386) (not b!452380) (not b!452393) (not b!452388) b_and!18841 tp_is_empty!12127 (not b!452389) (not b!452394) (not b!452392) (not bm!29953) (not start!40786) (not b!452384))
(check-sat b_and!18841 (not b_next!10789))
