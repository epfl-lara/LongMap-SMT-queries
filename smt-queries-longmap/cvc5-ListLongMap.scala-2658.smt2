; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39766 () Bool)

(assert start!39766)

(declare-fun b_free!10033 () Bool)

(declare-fun b_next!10033 () Bool)

(assert (=> start!39766 (= b_free!10033 (not b_next!10033))))

(declare-fun tp!35627 () Bool)

(declare-fun b_and!17725 () Bool)

(assert (=> start!39766 (= tp!35627 b_and!17725)))

(declare-fun b!428312 () Bool)

(declare-fun e!253843 () Bool)

(declare-fun e!253847 () Bool)

(assert (=> b!428312 (= e!253843 e!253847)))

(declare-fun res!251404 () Bool)

(assert (=> b!428312 (=> (not res!251404) (not e!253847))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428312 (= res!251404 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16019 0))(
  ( (V!16020 (val!5637 Int)) )
))
(declare-fun minValue!515 () V!16019)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5249 0))(
  ( (ValueCellFull!5249 (v!7884 V!16019)) (EmptyCell!5249) )
))
(declare-datatypes ((array!26207 0))(
  ( (array!26208 (arr!12553 (Array (_ BitVec 32) ValueCell!5249)) (size!12905 (_ BitVec 32))) )
))
(declare-fun lt!195689 () array!26207)

(declare-fun zeroValue!515 () V!16019)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7418 0))(
  ( (tuple2!7419 (_1!3720 (_ BitVec 64)) (_2!3720 V!16019)) )
))
(declare-datatypes ((List!7431 0))(
  ( (Nil!7428) (Cons!7427 (h!8283 tuple2!7418) (t!12913 List!7431)) )
))
(declare-datatypes ((ListLongMap!6331 0))(
  ( (ListLongMap!6332 (toList!3181 List!7431)) )
))
(declare-fun lt!195688 () ListLongMap!6331)

(declare-datatypes ((array!26209 0))(
  ( (array!26210 (arr!12554 (Array (_ BitVec 32) (_ BitVec 64))) (size!12906 (_ BitVec 32))) )
))
(declare-fun lt!195686 () array!26209)

(declare-fun getCurrentListMapNoExtraKeys!1383 (array!26209 array!26207 (_ BitVec 32) (_ BitVec 32) V!16019 V!16019 (_ BitVec 32) Int) ListLongMap!6331)

(assert (=> b!428312 (= lt!195688 (getCurrentListMapNoExtraKeys!1383 lt!195686 lt!195689 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26207)

(declare-fun v!412 () V!16019)

(assert (=> b!428312 (= lt!195689 (array!26208 (store (arr!12553 _values!549) i!563 (ValueCellFull!5249 v!412)) (size!12905 _values!549)))))

(declare-fun lt!195687 () ListLongMap!6331)

(declare-fun _keys!709 () array!26209)

(assert (=> b!428312 (= lt!195687 (getCurrentListMapNoExtraKeys!1383 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428313 () Bool)

(declare-fun res!251412 () Bool)

(declare-fun e!253845 () Bool)

(assert (=> b!428313 (=> (not res!251412) (not e!253845))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428313 (= res!251412 (validKeyInArray!0 k!794))))

(declare-fun b!428314 () Bool)

(declare-fun res!251399 () Bool)

(assert (=> b!428314 (=> (not res!251399) (not e!253845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26209 (_ BitVec 32)) Bool)

(assert (=> b!428314 (= res!251399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428315 () Bool)

(assert (=> b!428315 (= e!253845 e!253843)))

(declare-fun res!251410 () Bool)

(assert (=> b!428315 (=> (not res!251410) (not e!253843))))

(assert (=> b!428315 (= res!251410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195686 mask!1025))))

(assert (=> b!428315 (= lt!195686 (array!26210 (store (arr!12554 _keys!709) i!563 k!794) (size!12906 _keys!709)))))

(declare-fun b!428316 () Bool)

(declare-fun res!251403 () Bool)

(assert (=> b!428316 (=> (not res!251403) (not e!253845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428316 (= res!251403 (validMask!0 mask!1025))))

(declare-fun b!428317 () Bool)

(declare-fun res!251411 () Bool)

(assert (=> b!428317 (=> (not res!251411) (not e!253845))))

(assert (=> b!428317 (= res!251411 (and (= (size!12905 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12906 _keys!709) (size!12905 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428318 () Bool)

(declare-fun e!253841 () Bool)

(assert (=> b!428318 (= e!253841 true)))

(assert (=> b!428318 (not (= (select (arr!12554 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12564 0))(
  ( (Unit!12565) )
))
(declare-fun lt!195692 () Unit!12564)

(declare-fun e!253842 () Unit!12564)

(assert (=> b!428318 (= lt!195692 e!253842)))

(declare-fun c!55385 () Bool)

(assert (=> b!428318 (= c!55385 (= (select (arr!12554 _keys!709) from!863) k!794))))

(declare-fun lt!195694 () ListLongMap!6331)

(declare-fun +!1334 (ListLongMap!6331 tuple2!7418) ListLongMap!6331)

(declare-fun get!6220 (ValueCell!5249 V!16019) V!16019)

(declare-fun dynLambda!761 (Int (_ BitVec 64)) V!16019)

(assert (=> b!428318 (= lt!195688 (+!1334 lt!195694 (tuple2!7419 (select (arr!12554 _keys!709) from!863) (get!6220 (select (arr!12553 _values!549) from!863) (dynLambda!761 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428319 () Bool)

(assert (=> b!428319 (= e!253847 (not e!253841))))

(declare-fun res!251405 () Bool)

(assert (=> b!428319 (=> res!251405 e!253841)))

(assert (=> b!428319 (= res!251405 (not (validKeyInArray!0 (select (arr!12554 _keys!709) from!863))))))

(declare-fun lt!195695 () ListLongMap!6331)

(assert (=> b!428319 (= lt!195695 lt!195694)))

(declare-fun lt!195691 () ListLongMap!6331)

(assert (=> b!428319 (= lt!195694 (+!1334 lt!195691 (tuple2!7419 k!794 v!412)))))

(assert (=> b!428319 (= lt!195695 (getCurrentListMapNoExtraKeys!1383 lt!195686 lt!195689 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428319 (= lt!195691 (getCurrentListMapNoExtraKeys!1383 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195693 () Unit!12564)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!526 (array!26209 array!26207 (_ BitVec 32) (_ BitVec 32) V!16019 V!16019 (_ BitVec 32) (_ BitVec 64) V!16019 (_ BitVec 32) Int) Unit!12564)

(assert (=> b!428319 (= lt!195693 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!526 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428320 () Bool)

(declare-fun res!251408 () Bool)

(assert (=> b!428320 (=> (not res!251408) (not e!253845))))

(assert (=> b!428320 (= res!251408 (or (= (select (arr!12554 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12554 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18399 () Bool)

(declare-fun mapRes!18399 () Bool)

(assert (=> mapIsEmpty!18399 mapRes!18399))

(declare-fun b!428321 () Bool)

(declare-fun res!251402 () Bool)

(assert (=> b!428321 (=> (not res!251402) (not e!253845))))

(assert (=> b!428321 (= res!251402 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12906 _keys!709))))))

(declare-fun b!428322 () Bool)

(declare-fun res!251406 () Bool)

(assert (=> b!428322 (=> (not res!251406) (not e!253843))))

(declare-datatypes ((List!7432 0))(
  ( (Nil!7429) (Cons!7428 (h!8284 (_ BitVec 64)) (t!12914 List!7432)) )
))
(declare-fun arrayNoDuplicates!0 (array!26209 (_ BitVec 32) List!7432) Bool)

(assert (=> b!428322 (= res!251406 (arrayNoDuplicates!0 lt!195686 #b00000000000000000000000000000000 Nil!7429))))

(declare-fun b!428323 () Bool)

(declare-fun e!253848 () Bool)

(declare-fun tp_is_empty!11185 () Bool)

(assert (=> b!428323 (= e!253848 tp_is_empty!11185)))

(declare-fun b!428324 () Bool)

(declare-fun Unit!12566 () Unit!12564)

(assert (=> b!428324 (= e!253842 Unit!12566)))

(declare-fun lt!195690 () Unit!12564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26209 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12564)

(assert (=> b!428324 (= lt!195690 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428324 false))

(declare-fun b!428325 () Bool)

(declare-fun Unit!12567 () Unit!12564)

(assert (=> b!428325 (= e!253842 Unit!12567)))

(declare-fun b!428326 () Bool)

(declare-fun res!251400 () Bool)

(assert (=> b!428326 (=> (not res!251400) (not e!253845))))

(assert (=> b!428326 (= res!251400 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7429))))

(declare-fun b!428327 () Bool)

(declare-fun res!251401 () Bool)

(assert (=> b!428327 (=> (not res!251401) (not e!253843))))

(assert (=> b!428327 (= res!251401 (bvsle from!863 i!563))))

(declare-fun b!428328 () Bool)

(declare-fun e!253846 () Bool)

(declare-fun e!253840 () Bool)

(assert (=> b!428328 (= e!253846 (and e!253840 mapRes!18399))))

(declare-fun condMapEmpty!18399 () Bool)

(declare-fun mapDefault!18399 () ValueCell!5249)

