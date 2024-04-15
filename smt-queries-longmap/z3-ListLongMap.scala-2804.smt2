; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40698 () Bool)

(assert start!40698)

(declare-fun b_free!10723 () Bool)

(declare-fun b_next!10723 () Bool)

(assert (=> start!40698 (= b_free!10723 (not b_next!10723))))

(declare-fun tp!37989 () Bool)

(declare-fun b_and!18705 () Bool)

(assert (=> start!40698 (= tp!37989 b_and!18705)))

(declare-fun mapNonEmpty!19725 () Bool)

(declare-fun mapRes!19725 () Bool)

(declare-fun tp!37988 () Bool)

(declare-fun e!263844 () Bool)

(assert (=> mapNonEmpty!19725 (= mapRes!19725 (and tp!37988 e!263844))))

(declare-fun mapKey!19725 () (_ BitVec 32))

(declare-datatypes ((V!17187 0))(
  ( (V!17188 (val!6075 Int)) )
))
(declare-datatypes ((ValueCell!5687 0))(
  ( (ValueCellFull!5687 (v!8324 V!17187)) (EmptyCell!5687) )
))
(declare-fun mapRest!19725 () (Array (_ BitVec 32) ValueCell!5687))

(declare-datatypes ((array!27925 0))(
  ( (array!27926 (arr!13408 (Array (_ BitVec 32) ValueCell!5687)) (size!13761 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27925)

(declare-fun mapValue!19725 () ValueCell!5687)

(assert (=> mapNonEmpty!19725 (= (arr!13408 _values!549) (store mapRest!19725 mapKey!19725 mapValue!19725))))

(declare-fun b!450291 () Bool)

(declare-fun res!268059 () Bool)

(declare-fun e!263841 () Bool)

(assert (=> b!450291 (=> (not res!268059) (not e!263841))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450291 (= res!268059 (bvsle from!863 i!563))))

(declare-fun b!450292 () Bool)

(declare-fun e!263843 () Bool)

(assert (=> b!450292 (= e!263841 e!263843)))

(declare-fun res!268063 () Bool)

(assert (=> b!450292 (=> (not res!268063) (not e!263843))))

(assert (=> b!450292 (= res!268063 (= from!863 i!563))))

(declare-fun minValue!515 () V!17187)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17187)

(declare-datatypes ((tuple2!7992 0))(
  ( (tuple2!7993 (_1!4007 (_ BitVec 64)) (_2!4007 V!17187)) )
))
(declare-datatypes ((List!8057 0))(
  ( (Nil!8054) (Cons!8053 (h!8909 tuple2!7992) (t!13810 List!8057)) )
))
(declare-datatypes ((ListLongMap!6895 0))(
  ( (ListLongMap!6896 (toList!3463 List!8057)) )
))
(declare-fun lt!204407 () ListLongMap!6895)

(declare-datatypes ((array!27927 0))(
  ( (array!27928 (arr!13409 (Array (_ BitVec 32) (_ BitVec 64))) (size!13762 (_ BitVec 32))) )
))
(declare-fun lt!204410 () array!27927)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!204411 () array!27925)

(declare-fun getCurrentListMapNoExtraKeys!1661 (array!27927 array!27925 (_ BitVec 32) (_ BitVec 32) V!17187 V!17187 (_ BitVec 32) Int) ListLongMap!6895)

(assert (=> b!450292 (= lt!204407 (getCurrentListMapNoExtraKeys!1661 lt!204410 lt!204411 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17187)

(assert (=> b!450292 (= lt!204411 (array!27926 (store (arr!13408 _values!549) i!563 (ValueCellFull!5687 v!412)) (size!13761 _values!549)))))

(declare-fun lt!204408 () ListLongMap!6895)

(declare-fun _keys!709 () array!27927)

(assert (=> b!450292 (= lt!204408 (getCurrentListMapNoExtraKeys!1661 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun c!55920 () Bool)

(declare-fun bm!29733 () Bool)

(declare-fun call!29737 () ListLongMap!6895)

(assert (=> bm!29733 (= call!29737 (getCurrentListMapNoExtraKeys!1661 (ite c!55920 _keys!709 lt!204410) (ite c!55920 _values!549 lt!204411) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450293 () Bool)

(declare-fun res!268056 () Bool)

(declare-fun e!263846 () Bool)

(assert (=> b!450293 (=> (not res!268056) (not e!263846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27927 (_ BitVec 32)) Bool)

(assert (=> b!450293 (= res!268056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun call!29736 () ListLongMap!6895)

(declare-fun bm!29734 () Bool)

(assert (=> bm!29734 (= call!29736 (getCurrentListMapNoExtraKeys!1661 (ite c!55920 lt!204410 _keys!709) (ite c!55920 lt!204411 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!268062 () Bool)

(assert (=> start!40698 (=> (not res!268062) (not e!263846))))

(assert (=> start!40698 (= res!268062 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13762 _keys!709))))))

(assert (=> start!40698 e!263846))

(declare-fun tp_is_empty!12061 () Bool)

(assert (=> start!40698 tp_is_empty!12061))

(assert (=> start!40698 tp!37989))

(assert (=> start!40698 true))

(declare-fun e!263838 () Bool)

(declare-fun array_inv!9774 (array!27925) Bool)

(assert (=> start!40698 (and (array_inv!9774 _values!549) e!263838)))

(declare-fun array_inv!9775 (array!27927) Bool)

(assert (=> start!40698 (array_inv!9775 _keys!709)))

(declare-fun b!450294 () Bool)

(declare-fun res!268052 () Bool)

(assert (=> b!450294 (=> (not res!268052) (not e!263846))))

(assert (=> b!450294 (= res!268052 (or (= (select (arr!13409 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13409 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450295 () Bool)

(declare-fun res!268058 () Bool)

(assert (=> b!450295 (=> (not res!268058) (not e!263846))))

(assert (=> b!450295 (= res!268058 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13762 _keys!709))))))

(declare-fun b!450296 () Bool)

(assert (=> b!450296 (= e!263844 tp_is_empty!12061)))

(declare-fun b!450297 () Bool)

(declare-fun e!263839 () Bool)

(assert (=> b!450297 (= e!263843 (not e!263839))))

(declare-fun res!268054 () Bool)

(assert (=> b!450297 (=> res!268054 e!263839)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450297 (= res!268054 (validKeyInArray!0 (select (arr!13409 _keys!709) from!863)))))

(declare-fun e!263840 () Bool)

(assert (=> b!450297 e!263840))

(assert (=> b!450297 (= c!55920 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13155 0))(
  ( (Unit!13156) )
))
(declare-fun lt!204409 () Unit!13155)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!705 (array!27927 array!27925 (_ BitVec 32) (_ BitVec 32) V!17187 V!17187 (_ BitVec 32) (_ BitVec 64) V!17187 (_ BitVec 32) Int) Unit!13155)

(assert (=> b!450297 (= lt!204409 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!705 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450298 () Bool)

(declare-fun res!268060 () Bool)

(assert (=> b!450298 (=> (not res!268060) (not e!263846))))

(declare-fun arrayContainsKey!0 (array!27927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450298 (= res!268060 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450299 () Bool)

(declare-fun +!1569 (ListLongMap!6895 tuple2!7992) ListLongMap!6895)

(assert (=> b!450299 (= e!263840 (= call!29736 (+!1569 call!29737 (tuple2!7993 k0!794 v!412))))))

(declare-fun b!450300 () Bool)

(declare-fun e!263842 () Bool)

(assert (=> b!450300 (= e!263838 (and e!263842 mapRes!19725))))

(declare-fun condMapEmpty!19725 () Bool)

(declare-fun mapDefault!19725 () ValueCell!5687)

(assert (=> b!450300 (= condMapEmpty!19725 (= (arr!13408 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5687)) mapDefault!19725)))))

(declare-fun b!450301 () Bool)

(declare-fun res!268061 () Bool)

(assert (=> b!450301 (=> (not res!268061) (not e!263846))))

(assert (=> b!450301 (= res!268061 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19725 () Bool)

(assert (=> mapIsEmpty!19725 mapRes!19725))

(declare-fun b!450302 () Bool)

(declare-fun res!268064 () Bool)

(assert (=> b!450302 (=> (not res!268064) (not e!263846))))

(declare-datatypes ((List!8058 0))(
  ( (Nil!8055) (Cons!8054 (h!8910 (_ BitVec 64)) (t!13811 List!8058)) )
))
(declare-fun arrayNoDuplicates!0 (array!27927 (_ BitVec 32) List!8058) Bool)

(assert (=> b!450302 (= res!268064 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8055))))

(declare-fun b!450303 () Bool)

(declare-fun res!268055 () Bool)

(assert (=> b!450303 (=> (not res!268055) (not e!263846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450303 (= res!268055 (validMask!0 mask!1025))))

(declare-fun b!450304 () Bool)

(assert (=> b!450304 (= e!263839 (bvslt i!563 (size!13761 _values!549)))))

(declare-fun b!450305 () Bool)

(assert (=> b!450305 (= e!263846 e!263841)))

(declare-fun res!268057 () Bool)

(assert (=> b!450305 (=> (not res!268057) (not e!263841))))

(assert (=> b!450305 (= res!268057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204410 mask!1025))))

(assert (=> b!450305 (= lt!204410 (array!27928 (store (arr!13409 _keys!709) i!563 k0!794) (size!13762 _keys!709)))))

(declare-fun b!450306 () Bool)

(declare-fun res!268053 () Bool)

(assert (=> b!450306 (=> (not res!268053) (not e!263846))))

(assert (=> b!450306 (= res!268053 (and (= (size!13761 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13762 _keys!709) (size!13761 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450307 () Bool)

(declare-fun res!268065 () Bool)

(assert (=> b!450307 (=> (not res!268065) (not e!263841))))

(assert (=> b!450307 (= res!268065 (arrayNoDuplicates!0 lt!204410 #b00000000000000000000000000000000 Nil!8055))))

(declare-fun b!450308 () Bool)

(assert (=> b!450308 (= e!263840 (= call!29737 call!29736))))

(declare-fun b!450309 () Bool)

(assert (=> b!450309 (= e!263842 tp_is_empty!12061)))

(assert (= (and start!40698 res!268062) b!450303))

(assert (= (and b!450303 res!268055) b!450306))

(assert (= (and b!450306 res!268053) b!450293))

(assert (= (and b!450293 res!268056) b!450302))

(assert (= (and b!450302 res!268064) b!450295))

(assert (= (and b!450295 res!268058) b!450301))

(assert (= (and b!450301 res!268061) b!450294))

(assert (= (and b!450294 res!268052) b!450298))

(assert (= (and b!450298 res!268060) b!450305))

(assert (= (and b!450305 res!268057) b!450307))

(assert (= (and b!450307 res!268065) b!450291))

(assert (= (and b!450291 res!268059) b!450292))

(assert (= (and b!450292 res!268063) b!450297))

(assert (= (and b!450297 c!55920) b!450299))

(assert (= (and b!450297 (not c!55920)) b!450308))

(assert (= (or b!450299 b!450308) bm!29734))

(assert (= (or b!450299 b!450308) bm!29733))

(assert (= (and b!450297 (not res!268054)) b!450304))

(assert (= (and b!450300 condMapEmpty!19725) mapIsEmpty!19725))

(assert (= (and b!450300 (not condMapEmpty!19725)) mapNonEmpty!19725))

(get-info :version)

(assert (= (and mapNonEmpty!19725 ((_ is ValueCellFull!5687) mapValue!19725)) b!450296))

(assert (= (and b!450300 ((_ is ValueCellFull!5687) mapDefault!19725)) b!450309))

(assert (= start!40698 b!450300))

(declare-fun m!433699 () Bool)

(assert (=> b!450305 m!433699))

(declare-fun m!433701 () Bool)

(assert (=> b!450305 m!433701))

(declare-fun m!433703 () Bool)

(assert (=> b!450298 m!433703))

(declare-fun m!433705 () Bool)

(assert (=> b!450307 m!433705))

(declare-fun m!433707 () Bool)

(assert (=> b!450301 m!433707))

(declare-fun m!433709 () Bool)

(assert (=> bm!29734 m!433709))

(declare-fun m!433711 () Bool)

(assert (=> b!450297 m!433711))

(assert (=> b!450297 m!433711))

(declare-fun m!433713 () Bool)

(assert (=> b!450297 m!433713))

(declare-fun m!433715 () Bool)

(assert (=> b!450297 m!433715))

(declare-fun m!433717 () Bool)

(assert (=> b!450302 m!433717))

(declare-fun m!433719 () Bool)

(assert (=> b!450299 m!433719))

(declare-fun m!433721 () Bool)

(assert (=> b!450292 m!433721))

(declare-fun m!433723 () Bool)

(assert (=> b!450292 m!433723))

(declare-fun m!433725 () Bool)

(assert (=> b!450292 m!433725))

(declare-fun m!433727 () Bool)

(assert (=> bm!29733 m!433727))

(declare-fun m!433729 () Bool)

(assert (=> start!40698 m!433729))

(declare-fun m!433731 () Bool)

(assert (=> start!40698 m!433731))

(declare-fun m!433733 () Bool)

(assert (=> b!450303 m!433733))

(declare-fun m!433735 () Bool)

(assert (=> mapNonEmpty!19725 m!433735))

(declare-fun m!433737 () Bool)

(assert (=> b!450293 m!433737))

(declare-fun m!433739 () Bool)

(assert (=> b!450294 m!433739))

(check-sat b_and!18705 (not start!40698) (not b_next!10723) (not b!450292) (not b!450303) (not bm!29733) (not b!450293) (not b!450305) (not b!450297) (not mapNonEmpty!19725) (not b!450299) (not b!450298) tp_is_empty!12061 (not bm!29734) (not b!450301) (not b!450307) (not b!450302))
(check-sat b_and!18705 (not b_next!10723))
