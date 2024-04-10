; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39500 () Bool)

(assert start!39500)

(declare-fun b_free!9767 () Bool)

(declare-fun b_next!9767 () Bool)

(assert (=> start!39500 (= b_free!9767 (not b_next!9767))))

(declare-fun tp!34830 () Bool)

(declare-fun b_and!17409 () Bool)

(assert (=> start!39500 (= tp!34830 b_and!17409)))

(declare-fun b!421914 () Bool)

(declare-fun res!246302 () Bool)

(declare-fun e!251106 () Bool)

(assert (=> b!421914 (=> (not res!246302) (not e!251106))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421914 (= res!246302 (validKeyInArray!0 k!794))))

(declare-fun b!421915 () Bool)

(declare-fun res!246299 () Bool)

(declare-fun e!251105 () Bool)

(assert (=> b!421915 (=> (not res!246299) (not e!251105))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421915 (= res!246299 (bvsle from!863 i!563))))

(declare-fun b!421916 () Bool)

(declare-fun res!246290 () Bool)

(assert (=> b!421916 (=> (not res!246290) (not e!251106))))

(declare-datatypes ((array!25685 0))(
  ( (array!25686 (arr!12292 (Array (_ BitVec 32) (_ BitVec 64))) (size!12644 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25685)

(assert (=> b!421916 (= res!246290 (or (= (select (arr!12292 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12292 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18000 () Bool)

(declare-fun mapRes!18000 () Bool)

(assert (=> mapIsEmpty!18000 mapRes!18000))

(declare-fun b!421917 () Bool)

(declare-fun res!246296 () Bool)

(assert (=> b!421917 (=> (not res!246296) (not e!251105))))

(declare-fun lt!193729 () array!25685)

(declare-datatypes ((List!7227 0))(
  ( (Nil!7224) (Cons!7223 (h!8079 (_ BitVec 64)) (t!12659 List!7227)) )
))
(declare-fun arrayNoDuplicates!0 (array!25685 (_ BitVec 32) List!7227) Bool)

(assert (=> b!421917 (= res!246296 (arrayNoDuplicates!0 lt!193729 #b00000000000000000000000000000000 Nil!7224))))

(declare-fun b!421918 () Bool)

(declare-fun e!251112 () Bool)

(assert (=> b!421918 (= e!251112 true)))

(declare-datatypes ((V!15663 0))(
  ( (V!15664 (val!5504 Int)) )
))
(declare-datatypes ((tuple2!7222 0))(
  ( (tuple2!7223 (_1!3622 (_ BitVec 64)) (_2!3622 V!15663)) )
))
(declare-fun lt!193736 () tuple2!7222)

(declare-datatypes ((List!7228 0))(
  ( (Nil!7225) (Cons!7224 (h!8080 tuple2!7222) (t!12660 List!7228)) )
))
(declare-datatypes ((ListLongMap!6135 0))(
  ( (ListLongMap!6136 (toList!3083 List!7228)) )
))
(declare-fun lt!193738 () ListLongMap!6135)

(declare-fun lt!193734 () V!15663)

(declare-fun +!1278 (ListLongMap!6135 tuple2!7222) ListLongMap!6135)

(assert (=> b!421918 (= (+!1278 lt!193738 lt!193736) (+!1278 (+!1278 lt!193738 (tuple2!7223 k!794 lt!193734)) lt!193736))))

(declare-fun lt!193737 () V!15663)

(assert (=> b!421918 (= lt!193736 (tuple2!7223 k!794 lt!193737))))

(declare-datatypes ((Unit!12458 0))(
  ( (Unit!12459) )
))
(declare-fun lt!193731 () Unit!12458)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!72 (ListLongMap!6135 (_ BitVec 64) V!15663 V!15663) Unit!12458)

(assert (=> b!421918 (= lt!193731 (addSameAsAddTwiceSameKeyDiffValues!72 lt!193738 k!794 lt!193734 lt!193737))))

(declare-datatypes ((ValueCell!5116 0))(
  ( (ValueCellFull!5116 (v!7751 V!15663)) (EmptyCell!5116) )
))
(declare-datatypes ((array!25687 0))(
  ( (array!25688 (arr!12293 (Array (_ BitVec 32) ValueCell!5116)) (size!12645 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25687)

(declare-fun lt!193732 () V!15663)

(declare-fun get!6112 (ValueCell!5116 V!15663) V!15663)

(assert (=> b!421918 (= lt!193734 (get!6112 (select (arr!12293 _values!549) from!863) lt!193732))))

(declare-fun lt!193730 () ListLongMap!6135)

(assert (=> b!421918 (= lt!193730 (+!1278 lt!193738 (tuple2!7223 (select (arr!12292 lt!193729) from!863) lt!193737)))))

(declare-fun v!412 () V!15663)

(assert (=> b!421918 (= lt!193737 (get!6112 (select (store (arr!12293 _values!549) i!563 (ValueCellFull!5116 v!412)) from!863) lt!193732))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!743 (Int (_ BitVec 64)) V!15663)

(assert (=> b!421918 (= lt!193732 (dynLambda!743 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!193733 () array!25687)

(declare-fun minValue!515 () V!15663)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15663)

(declare-fun getCurrentListMapNoExtraKeys!1287 (array!25685 array!25687 (_ BitVec 32) (_ BitVec 32) V!15663 V!15663 (_ BitVec 32) Int) ListLongMap!6135)

(assert (=> b!421918 (= lt!193738 (getCurrentListMapNoExtraKeys!1287 lt!193729 lt!193733 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29480 () ListLongMap!6135)

(declare-fun call!29479 () ListLongMap!6135)

(declare-fun b!421919 () Bool)

(declare-fun e!251109 () Bool)

(assert (=> b!421919 (= e!251109 (= call!29480 (+!1278 call!29479 (tuple2!7223 k!794 v!412))))))

(declare-fun b!421920 () Bool)

(declare-fun res!246298 () Bool)

(assert (=> b!421920 (=> (not res!246298) (not e!251106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421920 (= res!246298 (validMask!0 mask!1025))))

(declare-fun b!421921 () Bool)

(assert (=> b!421921 (= e!251106 e!251105)))

(declare-fun res!246291 () Bool)

(assert (=> b!421921 (=> (not res!246291) (not e!251105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25685 (_ BitVec 32)) Bool)

(assert (=> b!421921 (= res!246291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193729 mask!1025))))

(assert (=> b!421921 (= lt!193729 (array!25686 (store (arr!12292 _keys!709) i!563 k!794) (size!12644 _keys!709)))))

(declare-fun b!421922 () Bool)

(declare-fun e!251108 () Bool)

(assert (=> b!421922 (= e!251108 (not e!251112))))

(declare-fun res!246294 () Bool)

(assert (=> b!421922 (=> res!246294 e!251112)))

(assert (=> b!421922 (= res!246294 (validKeyInArray!0 (select (arr!12292 _keys!709) from!863)))))

(assert (=> b!421922 e!251109))

(declare-fun c!55364 () Bool)

(assert (=> b!421922 (= c!55364 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193739 () Unit!12458)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!474 (array!25685 array!25687 (_ BitVec 32) (_ BitVec 32) V!15663 V!15663 (_ BitVec 32) (_ BitVec 64) V!15663 (_ BitVec 32) Int) Unit!12458)

(assert (=> b!421922 (= lt!193739 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!474 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421923 () Bool)

(declare-fun e!251107 () Bool)

(declare-fun tp_is_empty!10919 () Bool)

(assert (=> b!421923 (= e!251107 tp_is_empty!10919)))

(declare-fun b!421925 () Bool)

(declare-fun res!246300 () Bool)

(assert (=> b!421925 (=> (not res!246300) (not e!251106))))

(declare-fun arrayContainsKey!0 (array!25685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421925 (= res!246300 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!421926 () Bool)

(declare-fun e!251110 () Bool)

(assert (=> b!421926 (= e!251110 tp_is_empty!10919)))

(declare-fun bm!29476 () Bool)

(assert (=> bm!29476 (= call!29480 (getCurrentListMapNoExtraKeys!1287 (ite c!55364 lt!193729 _keys!709) (ite c!55364 lt!193733 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421927 () Bool)

(assert (=> b!421927 (= e!251105 e!251108)))

(declare-fun res!246297 () Bool)

(assert (=> b!421927 (=> (not res!246297) (not e!251108))))

(assert (=> b!421927 (= res!246297 (= from!863 i!563))))

(assert (=> b!421927 (= lt!193730 (getCurrentListMapNoExtraKeys!1287 lt!193729 lt!193733 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421927 (= lt!193733 (array!25688 (store (arr!12293 _values!549) i!563 (ValueCellFull!5116 v!412)) (size!12645 _values!549)))))

(declare-fun lt!193735 () ListLongMap!6135)

(assert (=> b!421927 (= lt!193735 (getCurrentListMapNoExtraKeys!1287 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!29477 () Bool)

(assert (=> bm!29477 (= call!29479 (getCurrentListMapNoExtraKeys!1287 (ite c!55364 _keys!709 lt!193729) (ite c!55364 _values!549 lt!193733) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421928 () Bool)

(declare-fun e!251104 () Bool)

(assert (=> b!421928 (= e!251104 (and e!251107 mapRes!18000))))

(declare-fun condMapEmpty!18000 () Bool)

(declare-fun mapDefault!18000 () ValueCell!5116)

