; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39442 () Bool)

(assert start!39442)

(declare-fun b_free!9709 () Bool)

(declare-fun b_next!9709 () Bool)

(assert (=> start!39442 (= b_free!9709 (not b_next!9709))))

(declare-fun tp!34656 () Bool)

(declare-fun b_and!17293 () Bool)

(assert (=> start!39442 (= tp!34656 b_and!17293)))

(declare-fun b!420203 () Bool)

(declare-fun res!245078 () Bool)

(declare-fun e!250324 () Bool)

(assert (=> b!420203 (=> (not res!245078) (not e!250324))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25571 0))(
  ( (array!25572 (arr!12235 (Array (_ BitVec 32) (_ BitVec 64))) (size!12587 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25571)

(assert (=> b!420203 (= res!245078 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12587 _keys!709))))))

(declare-fun mapNonEmpty!17913 () Bool)

(declare-fun mapRes!17913 () Bool)

(declare-fun tp!34655 () Bool)

(declare-fun e!250328 () Bool)

(assert (=> mapNonEmpty!17913 (= mapRes!17913 (and tp!34655 e!250328))))

(declare-datatypes ((V!15587 0))(
  ( (V!15588 (val!5475 Int)) )
))
(declare-datatypes ((ValueCell!5087 0))(
  ( (ValueCellFull!5087 (v!7722 V!15587)) (EmptyCell!5087) )
))
(declare-fun mapRest!17913 () (Array (_ BitVec 32) ValueCell!5087))

(declare-fun mapKey!17913 () (_ BitVec 32))

(declare-datatypes ((array!25573 0))(
  ( (array!25574 (arr!12236 (Array (_ BitVec 32) ValueCell!5087)) (size!12588 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25573)

(declare-fun mapValue!17913 () ValueCell!5087)

(assert (=> mapNonEmpty!17913 (= (arr!12236 _values!549) (store mapRest!17913 mapKey!17913 mapValue!17913))))

(declare-fun b!420204 () Bool)

(declare-fun res!245072 () Bool)

(assert (=> b!420204 (=> (not res!245072) (not e!250324))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420204 (= res!245072 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!420205 () Bool)

(declare-fun res!245075 () Bool)

(declare-fun e!250323 () Bool)

(assert (=> b!420205 (=> (not res!245075) (not e!250323))))

(declare-fun lt!192774 () array!25571)

(declare-datatypes ((List!7179 0))(
  ( (Nil!7176) (Cons!7175 (h!8031 (_ BitVec 64)) (t!12553 List!7179)) )
))
(declare-fun arrayNoDuplicates!0 (array!25571 (_ BitVec 32) List!7179) Bool)

(assert (=> b!420205 (= res!245075 (arrayNoDuplicates!0 lt!192774 #b00000000000000000000000000000000 Nil!7176))))

(declare-fun b!420206 () Bool)

(declare-fun res!245080 () Bool)

(assert (=> b!420206 (=> (not res!245080) (not e!250324))))

(assert (=> b!420206 (= res!245080 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7176))))

(declare-fun b!420207 () Bool)

(declare-fun res!245073 () Bool)

(assert (=> b!420207 (=> (not res!245073) (not e!250324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420207 (= res!245073 (validKeyInArray!0 k!794))))

(declare-fun b!420208 () Bool)

(declare-fun e!250322 () Bool)

(declare-fun e!250326 () Bool)

(assert (=> b!420208 (= e!250322 (not e!250326))))

(declare-fun res!245083 () Bool)

(assert (=> b!420208 (=> res!245083 e!250326)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!420208 (= res!245083 (validKeyInArray!0 (select (arr!12235 _keys!709) from!863)))))

(declare-fun e!250321 () Bool)

(assert (=> b!420208 e!250321))

(declare-fun c!55277 () Bool)

(assert (=> b!420208 (= c!55277 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15587)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12414 0))(
  ( (Unit!12415) )
))
(declare-fun lt!192778 () Unit!12414)

(declare-fun zeroValue!515 () V!15587)

(declare-fun v!412 () V!15587)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!455 (array!25571 array!25573 (_ BitVec 32) (_ BitVec 32) V!15587 V!15587 (_ BitVec 32) (_ BitVec 64) V!15587 (_ BitVec 32) Int) Unit!12414)

(assert (=> b!420208 (= lt!192778 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!455 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420209 () Bool)

(declare-fun res!245082 () Bool)

(assert (=> b!420209 (=> (not res!245082) (not e!250324))))

(assert (=> b!420209 (= res!245082 (or (= (select (arr!12235 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12235 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420210 () Bool)

(declare-fun res!245074 () Bool)

(assert (=> b!420210 (=> (not res!245074) (not e!250324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25571 (_ BitVec 32)) Bool)

(assert (=> b!420210 (= res!245074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!29302 () Bool)

(declare-fun lt!192782 () array!25573)

(declare-datatypes ((tuple2!7172 0))(
  ( (tuple2!7173 (_1!3597 (_ BitVec 64)) (_2!3597 V!15587)) )
))
(declare-datatypes ((List!7180 0))(
  ( (Nil!7177) (Cons!7176 (h!8032 tuple2!7172) (t!12554 List!7180)) )
))
(declare-datatypes ((ListLongMap!6085 0))(
  ( (ListLongMap!6086 (toList!3058 List!7180)) )
))
(declare-fun call!29305 () ListLongMap!6085)

(declare-fun getCurrentListMapNoExtraKeys!1263 (array!25571 array!25573 (_ BitVec 32) (_ BitVec 32) V!15587 V!15587 (_ BitVec 32) Int) ListLongMap!6085)

(assert (=> bm!29302 (= call!29305 (getCurrentListMapNoExtraKeys!1263 (ite c!55277 _keys!709 lt!192774) (ite c!55277 _values!549 lt!192782) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420212 () Bool)

(declare-fun res!245076 () Bool)

(assert (=> b!420212 (=> (not res!245076) (not e!250324))))

(assert (=> b!420212 (= res!245076 (and (= (size!12588 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12587 _keys!709) (size!12588 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420213 () Bool)

(declare-fun call!29306 () ListLongMap!6085)

(assert (=> b!420213 (= e!250321 (= call!29305 call!29306))))

(declare-fun b!420214 () Bool)

(assert (=> b!420214 (= e!250326 true)))

(declare-fun lt!192776 () tuple2!7172)

(declare-fun lt!192780 () V!15587)

(declare-fun lt!192773 () ListLongMap!6085)

(declare-fun +!1255 (ListLongMap!6085 tuple2!7172) ListLongMap!6085)

(assert (=> b!420214 (= (+!1255 lt!192773 lt!192776) (+!1255 (+!1255 lt!192773 (tuple2!7173 k!794 lt!192780)) lt!192776))))

(declare-fun lt!192779 () V!15587)

(assert (=> b!420214 (= lt!192776 (tuple2!7173 k!794 lt!192779))))

(declare-fun lt!192777 () Unit!12414)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!52 (ListLongMap!6085 (_ BitVec 64) V!15587 V!15587) Unit!12414)

(assert (=> b!420214 (= lt!192777 (addSameAsAddTwiceSameKeyDiffValues!52 lt!192773 k!794 lt!192780 lt!192779))))

(declare-fun lt!192775 () V!15587)

(declare-fun get!6074 (ValueCell!5087 V!15587) V!15587)

(assert (=> b!420214 (= lt!192780 (get!6074 (select (arr!12236 _values!549) from!863) lt!192775))))

(declare-fun lt!192781 () ListLongMap!6085)

(assert (=> b!420214 (= lt!192781 (+!1255 lt!192773 (tuple2!7173 (select (arr!12235 lt!192774) from!863) lt!192779)))))

(assert (=> b!420214 (= lt!192779 (get!6074 (select (store (arr!12236 _values!549) i!563 (ValueCellFull!5087 v!412)) from!863) lt!192775))))

(declare-fun dynLambda!723 (Int (_ BitVec 64)) V!15587)

(assert (=> b!420214 (= lt!192775 (dynLambda!723 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420214 (= lt!192773 (getCurrentListMapNoExtraKeys!1263 lt!192774 lt!192782 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17913 () Bool)

(assert (=> mapIsEmpty!17913 mapRes!17913))

(declare-fun b!420215 () Bool)

(declare-fun e!250329 () Bool)

(declare-fun e!250325 () Bool)

(assert (=> b!420215 (= e!250329 (and e!250325 mapRes!17913))))

(declare-fun condMapEmpty!17913 () Bool)

(declare-fun mapDefault!17913 () ValueCell!5087)

