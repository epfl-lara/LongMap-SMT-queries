; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39502 () Bool)

(assert start!39502)

(declare-fun b_free!9769 () Bool)

(declare-fun b_next!9769 () Bool)

(assert (=> start!39502 (= b_free!9769 (not b_next!9769))))

(declare-fun tp!34836 () Bool)

(declare-fun b_and!17413 () Bool)

(assert (=> start!39502 (= tp!34836 b_and!17413)))

(declare-fun mapIsEmpty!18003 () Bool)

(declare-fun mapRes!18003 () Bool)

(assert (=> mapIsEmpty!18003 mapRes!18003))

(declare-fun b!421973 () Bool)

(declare-fun e!251134 () Bool)

(declare-fun tp_is_empty!10921 () Bool)

(assert (=> b!421973 (= e!251134 tp_is_empty!10921)))

(declare-fun res!246335 () Bool)

(declare-fun e!251139 () Bool)

(assert (=> start!39502 (=> (not res!246335) (not e!251139))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25689 0))(
  ( (array!25690 (arr!12294 (Array (_ BitVec 32) (_ BitVec 64))) (size!12646 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25689)

(assert (=> start!39502 (= res!246335 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12646 _keys!709))))))

(assert (=> start!39502 e!251139))

(assert (=> start!39502 tp_is_empty!10921))

(assert (=> start!39502 tp!34836))

(assert (=> start!39502 true))

(declare-datatypes ((V!15667 0))(
  ( (V!15668 (val!5505 Int)) )
))
(declare-datatypes ((ValueCell!5117 0))(
  ( (ValueCellFull!5117 (v!7752 V!15667)) (EmptyCell!5117) )
))
(declare-datatypes ((array!25691 0))(
  ( (array!25692 (arr!12295 (Array (_ BitVec 32) ValueCell!5117)) (size!12647 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25691)

(declare-fun e!251136 () Bool)

(declare-fun array_inv!8956 (array!25691) Bool)

(assert (=> start!39502 (and (array_inv!8956 _values!549) e!251136)))

(declare-fun array_inv!8957 (array!25689) Bool)

(assert (=> start!39502 (array_inv!8957 _keys!709)))

(declare-fun b!421974 () Bool)

(declare-fun res!246341 () Bool)

(declare-fun e!251137 () Bool)

(assert (=> b!421974 (=> (not res!246341) (not e!251137))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421974 (= res!246341 (bvsle from!863 i!563))))

(declare-fun b!421975 () Bool)

(declare-fun res!246338 () Bool)

(assert (=> b!421975 (=> (not res!246338) (not e!251139))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421975 (= res!246338 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!421976 () Bool)

(declare-fun e!251135 () Bool)

(declare-fun e!251138 () Bool)

(assert (=> b!421976 (= e!251135 (not e!251138))))

(declare-fun res!246334 () Bool)

(assert (=> b!421976 (=> res!246334 e!251138)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421976 (= res!246334 (validKeyInArray!0 (select (arr!12294 _keys!709) from!863)))))

(declare-fun e!251133 () Bool)

(assert (=> b!421976 e!251133))

(declare-fun c!55367 () Bool)

(assert (=> b!421976 (= c!55367 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15667)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15667)

(declare-datatypes ((Unit!12460 0))(
  ( (Unit!12461) )
))
(declare-fun lt!193768 () Unit!12460)

(declare-fun v!412 () V!15667)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!475 (array!25689 array!25691 (_ BitVec 32) (_ BitVec 32) V!15667 V!15667 (_ BitVec 32) (_ BitVec 64) V!15667 (_ BitVec 32) Int) Unit!12460)

(assert (=> b!421976 (= lt!193768 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!475 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421977 () Bool)

(declare-fun res!246342 () Bool)

(assert (=> b!421977 (=> (not res!246342) (not e!251139))))

(assert (=> b!421977 (= res!246342 (and (= (size!12647 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12646 _keys!709) (size!12647 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421978 () Bool)

(declare-fun res!246336 () Bool)

(assert (=> b!421978 (=> (not res!246336) (not e!251137))))

(declare-fun lt!193770 () array!25689)

(declare-datatypes ((List!7229 0))(
  ( (Nil!7226) (Cons!7225 (h!8081 (_ BitVec 64)) (t!12663 List!7229)) )
))
(declare-fun arrayNoDuplicates!0 (array!25689 (_ BitVec 32) List!7229) Bool)

(assert (=> b!421978 (= res!246336 (arrayNoDuplicates!0 lt!193770 #b00000000000000000000000000000000 Nil!7226))))

(declare-datatypes ((tuple2!7224 0))(
  ( (tuple2!7225 (_1!3623 (_ BitVec 64)) (_2!3623 V!15667)) )
))
(declare-datatypes ((List!7230 0))(
  ( (Nil!7227) (Cons!7226 (h!8082 tuple2!7224) (t!12664 List!7230)) )
))
(declare-datatypes ((ListLongMap!6137 0))(
  ( (ListLongMap!6138 (toList!3084 List!7230)) )
))
(declare-fun call!29486 () ListLongMap!6137)

(declare-fun b!421979 () Bool)

(declare-fun call!29485 () ListLongMap!6137)

(declare-fun +!1279 (ListLongMap!6137 tuple2!7224) ListLongMap!6137)

(assert (=> b!421979 (= e!251133 (= call!29485 (+!1279 call!29486 (tuple2!7225 k!794 v!412))))))

(declare-fun b!421980 () Bool)

(assert (=> b!421980 (= e!251139 e!251137)))

(declare-fun res!246343 () Bool)

(assert (=> b!421980 (=> (not res!246343) (not e!251137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25689 (_ BitVec 32)) Bool)

(assert (=> b!421980 (= res!246343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193770 mask!1025))))

(assert (=> b!421980 (= lt!193770 (array!25690 (store (arr!12294 _keys!709) i!563 k!794) (size!12646 _keys!709)))))

(declare-fun lt!193765 () array!25691)

(declare-fun bm!29482 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1288 (array!25689 array!25691 (_ BitVec 32) (_ BitVec 32) V!15667 V!15667 (_ BitVec 32) Int) ListLongMap!6137)

(assert (=> bm!29482 (= call!29486 (getCurrentListMapNoExtraKeys!1288 (ite c!55367 _keys!709 lt!193770) (ite c!55367 _values!549 lt!193765) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421981 () Bool)

(assert (=> b!421981 (= e!251137 e!251135)))

(declare-fun res!246337 () Bool)

(assert (=> b!421981 (=> (not res!246337) (not e!251135))))

(assert (=> b!421981 (= res!246337 (= from!863 i!563))))

(declare-fun lt!193766 () ListLongMap!6137)

(assert (=> b!421981 (= lt!193766 (getCurrentListMapNoExtraKeys!1288 lt!193770 lt!193765 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421981 (= lt!193765 (array!25692 (store (arr!12295 _values!549) i!563 (ValueCellFull!5117 v!412)) (size!12647 _values!549)))))

(declare-fun lt!193771 () ListLongMap!6137)

(assert (=> b!421981 (= lt!193771 (getCurrentListMapNoExtraKeys!1288 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421982 () Bool)

(declare-fun res!246345 () Bool)

(assert (=> b!421982 (=> (not res!246345) (not e!251139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421982 (= res!246345 (validMask!0 mask!1025))))

(declare-fun b!421983 () Bool)

(declare-fun res!246339 () Bool)

(assert (=> b!421983 (=> (not res!246339) (not e!251139))))

(assert (=> b!421983 (= res!246339 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12646 _keys!709))))))

(declare-fun b!421984 () Bool)

(declare-fun e!251131 () Bool)

(assert (=> b!421984 (= e!251131 tp_is_empty!10921)))

(declare-fun mapNonEmpty!18003 () Bool)

(declare-fun tp!34835 () Bool)

(assert (=> mapNonEmpty!18003 (= mapRes!18003 (and tp!34835 e!251134))))

(declare-fun mapKey!18003 () (_ BitVec 32))

(declare-fun mapRest!18003 () (Array (_ BitVec 32) ValueCell!5117))

(declare-fun mapValue!18003 () ValueCell!5117)

(assert (=> mapNonEmpty!18003 (= (arr!12295 _values!549) (store mapRest!18003 mapKey!18003 mapValue!18003))))

(declare-fun b!421985 () Bool)

(assert (=> b!421985 (= e!251136 (and e!251131 mapRes!18003))))

(declare-fun condMapEmpty!18003 () Bool)

(declare-fun mapDefault!18003 () ValueCell!5117)

