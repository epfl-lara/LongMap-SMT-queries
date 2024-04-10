; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39448 () Bool)

(assert start!39448)

(declare-fun b_free!9715 () Bool)

(declare-fun b_next!9715 () Bool)

(assert (=> start!39448 (= b_free!9715 (not b_next!9715))))

(declare-fun tp!34674 () Bool)

(declare-fun b_and!17305 () Bool)

(assert (=> start!39448 (= tp!34674 b_and!17305)))

(declare-fun b!420380 () Bool)

(declare-fun res!245203 () Bool)

(declare-fun e!250407 () Bool)

(assert (=> b!420380 (=> (not res!245203) (not e!250407))))

(declare-datatypes ((array!25583 0))(
  ( (array!25584 (arr!12241 (Array (_ BitVec 32) (_ BitVec 64))) (size!12593 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25583)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15595 0))(
  ( (V!15596 (val!5478 Int)) )
))
(declare-datatypes ((ValueCell!5090 0))(
  ( (ValueCellFull!5090 (v!7725 V!15595)) (EmptyCell!5090) )
))
(declare-datatypes ((array!25585 0))(
  ( (array!25586 (arr!12242 (Array (_ BitVec 32) ValueCell!5090)) (size!12594 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25585)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!420380 (= res!245203 (and (= (size!12594 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12593 _keys!709) (size!12594 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420381 () Bool)

(declare-fun res!245208 () Bool)

(assert (=> b!420381 (=> (not res!245208) (not e!250407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25583 (_ BitVec 32)) Bool)

(assert (=> b!420381 (= res!245208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!245205 () Bool)

(assert (=> start!39448 (=> (not res!245205) (not e!250407))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39448 (= res!245205 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12593 _keys!709))))))

(assert (=> start!39448 e!250407))

(declare-fun tp_is_empty!10867 () Bool)

(assert (=> start!39448 tp_is_empty!10867))

(assert (=> start!39448 tp!34674))

(assert (=> start!39448 true))

(declare-fun e!250404 () Bool)

(declare-fun array_inv!8924 (array!25585) Bool)

(assert (=> start!39448 (and (array_inv!8924 _values!549) e!250404)))

(declare-fun array_inv!8925 (array!25583) Bool)

(assert (=> start!39448 (array_inv!8925 _keys!709)))

(declare-fun b!420382 () Bool)

(declare-fun res!245207 () Bool)

(assert (=> b!420382 (=> (not res!245207) (not e!250407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420382 (= res!245207 (validMask!0 mask!1025))))

(declare-fun b!420383 () Bool)

(declare-fun res!245201 () Bool)

(assert (=> b!420383 (=> (not res!245201) (not e!250407))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420383 (= res!245201 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12593 _keys!709))))))

(declare-fun lt!192874 () array!25585)

(declare-fun minValue!515 () V!15595)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!29320 () Bool)

(declare-fun c!55286 () Bool)

(declare-fun zeroValue!515 () V!15595)

(declare-datatypes ((tuple2!7178 0))(
  ( (tuple2!7179 (_1!3600 (_ BitVec 64)) (_2!3600 V!15595)) )
))
(declare-datatypes ((List!7185 0))(
  ( (Nil!7182) (Cons!7181 (h!8037 tuple2!7178) (t!12565 List!7185)) )
))
(declare-datatypes ((ListLongMap!6091 0))(
  ( (ListLongMap!6092 (toList!3061 List!7185)) )
))
(declare-fun call!29323 () ListLongMap!6091)

(declare-fun lt!192879 () array!25583)

(declare-fun getCurrentListMapNoExtraKeys!1266 (array!25583 array!25585 (_ BitVec 32) (_ BitVec 32) V!15595 V!15595 (_ BitVec 32) Int) ListLongMap!6091)

(assert (=> bm!29320 (= call!29323 (getCurrentListMapNoExtraKeys!1266 (ite c!55286 lt!192879 _keys!709) (ite c!55286 lt!192874 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420384 () Bool)

(declare-fun res!245198 () Bool)

(assert (=> b!420384 (=> (not res!245198) (not e!250407))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420384 (= res!245198 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!420385 () Bool)

(declare-fun res!245202 () Bool)

(assert (=> b!420385 (=> (not res!245202) (not e!250407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420385 (= res!245202 (validKeyInArray!0 k!794))))

(declare-fun b!420386 () Bool)

(declare-fun e!250406 () Bool)

(assert (=> b!420386 (= e!250406 tp_is_empty!10867)))

(declare-fun b!420387 () Bool)

(declare-fun res!245210 () Bool)

(assert (=> b!420387 (=> (not res!245210) (not e!250407))))

(declare-datatypes ((List!7186 0))(
  ( (Nil!7183) (Cons!7182 (h!8038 (_ BitVec 64)) (t!12566 List!7186)) )
))
(declare-fun arrayNoDuplicates!0 (array!25583 (_ BitVec 32) List!7186) Bool)

(assert (=> b!420387 (= res!245210 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7183))))

(declare-fun bm!29321 () Bool)

(declare-fun call!29324 () ListLongMap!6091)

(assert (=> bm!29321 (= call!29324 (getCurrentListMapNoExtraKeys!1266 (ite c!55286 _keys!709 lt!192879) (ite c!55286 _values!549 lt!192874) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420388 () Bool)

(declare-fun e!250403 () Bool)

(assert (=> b!420388 (= e!250407 e!250403)))

(declare-fun res!245206 () Bool)

(assert (=> b!420388 (=> (not res!245206) (not e!250403))))

(assert (=> b!420388 (= res!245206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192879 mask!1025))))

(assert (=> b!420388 (= lt!192879 (array!25584 (store (arr!12241 _keys!709) i!563 k!794) (size!12593 _keys!709)))))

(declare-fun b!420389 () Bool)

(declare-fun e!250410 () Bool)

(assert (=> b!420389 (= e!250410 true)))

(declare-fun lt!192873 () tuple2!7178)

(declare-fun lt!192877 () V!15595)

(declare-fun lt!192878 () ListLongMap!6091)

(declare-fun +!1258 (ListLongMap!6091 tuple2!7178) ListLongMap!6091)

(assert (=> b!420389 (= (+!1258 lt!192878 lt!192873) (+!1258 (+!1258 lt!192878 (tuple2!7179 k!794 lt!192877)) lt!192873))))

(declare-fun lt!192876 () V!15595)

(assert (=> b!420389 (= lt!192873 (tuple2!7179 k!794 lt!192876))))

(declare-datatypes ((Unit!12420 0))(
  ( (Unit!12421) )
))
(declare-fun lt!192872 () Unit!12420)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!55 (ListLongMap!6091 (_ BitVec 64) V!15595 V!15595) Unit!12420)

(assert (=> b!420389 (= lt!192872 (addSameAsAddTwiceSameKeyDiffValues!55 lt!192878 k!794 lt!192877 lt!192876))))

(declare-fun lt!192871 () V!15595)

(declare-fun get!6079 (ValueCell!5090 V!15595) V!15595)

(assert (=> b!420389 (= lt!192877 (get!6079 (select (arr!12242 _values!549) from!863) lt!192871))))

(declare-fun lt!192875 () ListLongMap!6091)

(assert (=> b!420389 (= lt!192875 (+!1258 lt!192878 (tuple2!7179 (select (arr!12241 lt!192879) from!863) lt!192876)))))

(declare-fun v!412 () V!15595)

(assert (=> b!420389 (= lt!192876 (get!6079 (select (store (arr!12242 _values!549) i!563 (ValueCellFull!5090 v!412)) from!863) lt!192871))))

(declare-fun dynLambda!726 (Int (_ BitVec 64)) V!15595)

(assert (=> b!420389 (= lt!192871 (dynLambda!726 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420389 (= lt!192878 (getCurrentListMapNoExtraKeys!1266 lt!192879 lt!192874 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420390 () Bool)

(declare-fun res!245199 () Bool)

(assert (=> b!420390 (=> (not res!245199) (not e!250403))))

(assert (=> b!420390 (= res!245199 (bvsle from!863 i!563))))

(declare-fun b!420391 () Bool)

(declare-fun e!250408 () Bool)

(declare-fun mapRes!17922 () Bool)

(assert (=> b!420391 (= e!250404 (and e!250408 mapRes!17922))))

(declare-fun condMapEmpty!17922 () Bool)

(declare-fun mapDefault!17922 () ValueCell!5090)

