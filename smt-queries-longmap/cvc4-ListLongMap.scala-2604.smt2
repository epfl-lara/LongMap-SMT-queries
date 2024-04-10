; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39446 () Bool)

(assert start!39446)

(declare-fun b_free!9713 () Bool)

(declare-fun b_next!9713 () Bool)

(assert (=> start!39446 (= b_free!9713 (not b_next!9713))))

(declare-fun tp!34668 () Bool)

(declare-fun b_and!17301 () Bool)

(assert (=> start!39446 (= tp!34668 b_and!17301)))

(declare-fun b!420321 () Bool)

(declare-fun res!245162 () Bool)

(declare-fun e!250381 () Bool)

(assert (=> b!420321 (=> (not res!245162) (not e!250381))))

(declare-datatypes ((array!25579 0))(
  ( (array!25580 (arr!12239 (Array (_ BitVec 32) (_ BitVec 64))) (size!12591 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25579)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420321 (= res!245162 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!245163 () Bool)

(assert (=> start!39446 (=> (not res!245163) (not e!250381))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39446 (= res!245163 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12591 _keys!709))))))

(assert (=> start!39446 e!250381))

(declare-fun tp_is_empty!10865 () Bool)

(assert (=> start!39446 tp_is_empty!10865))

(assert (=> start!39446 tp!34668))

(assert (=> start!39446 true))

(declare-datatypes ((V!15591 0))(
  ( (V!15592 (val!5477 Int)) )
))
(declare-datatypes ((ValueCell!5089 0))(
  ( (ValueCellFull!5089 (v!7724 V!15591)) (EmptyCell!5089) )
))
(declare-datatypes ((array!25581 0))(
  ( (array!25582 (arr!12240 (Array (_ BitVec 32) ValueCell!5089)) (size!12592 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25581)

(declare-fun e!250383 () Bool)

(declare-fun array_inv!8922 (array!25581) Bool)

(assert (=> start!39446 (and (array_inv!8922 _values!549) e!250383)))

(declare-fun array_inv!8923 (array!25579) Bool)

(assert (=> start!39446 (array_inv!8923 _keys!709)))

(declare-fun b!420322 () Bool)

(declare-fun res!245164 () Bool)

(declare-fun e!250380 () Bool)

(assert (=> b!420322 (=> (not res!245164) (not e!250380))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420322 (= res!245164 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17919 () Bool)

(declare-fun mapRes!17919 () Bool)

(assert (=> mapIsEmpty!17919 mapRes!17919))

(declare-fun mapNonEmpty!17919 () Bool)

(declare-fun tp!34667 () Bool)

(declare-fun e!250376 () Bool)

(assert (=> mapNonEmpty!17919 (= mapRes!17919 (and tp!34667 e!250376))))

(declare-fun mapValue!17919 () ValueCell!5089)

(declare-fun mapKey!17919 () (_ BitVec 32))

(declare-fun mapRest!17919 () (Array (_ BitVec 32) ValueCell!5089))

(assert (=> mapNonEmpty!17919 (= (arr!12240 _values!549) (store mapRest!17919 mapKey!17919 mapValue!17919))))

(declare-fun b!420323 () Bool)

(declare-fun e!250378 () Bool)

(declare-fun e!250375 () Bool)

(assert (=> b!420323 (= e!250378 (not e!250375))))

(declare-fun res!245167 () Bool)

(assert (=> b!420323 (=> res!245167 e!250375)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420323 (= res!245167 (validKeyInArray!0 (select (arr!12239 _keys!709) from!863)))))

(declare-fun e!250379 () Bool)

(assert (=> b!420323 e!250379))

(declare-fun c!55283 () Bool)

(assert (=> b!420323 (= c!55283 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15591)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15591)

(declare-datatypes ((Unit!12418 0))(
  ( (Unit!12419) )
))
(declare-fun lt!192845 () Unit!12418)

(declare-fun v!412 () V!15591)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!457 (array!25579 array!25581 (_ BitVec 32) (_ BitVec 32) V!15591 V!15591 (_ BitVec 32) (_ BitVec 64) V!15591 (_ BitVec 32) Int) Unit!12418)

(assert (=> b!420323 (= lt!192845 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!457 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((tuple2!7176 0))(
  ( (tuple2!7177 (_1!3599 (_ BitVec 64)) (_2!3599 V!15591)) )
))
(declare-datatypes ((List!7183 0))(
  ( (Nil!7180) (Cons!7179 (h!8035 tuple2!7176) (t!12561 List!7183)) )
))
(declare-datatypes ((ListLongMap!6089 0))(
  ( (ListLongMap!6090 (toList!3060 List!7183)) )
))
(declare-fun call!29318 () ListLongMap!6089)

(declare-fun lt!192841 () array!25579)

(declare-fun bm!29314 () Bool)

(declare-fun lt!192847 () array!25581)

(declare-fun getCurrentListMapNoExtraKeys!1265 (array!25579 array!25581 (_ BitVec 32) (_ BitVec 32) V!15591 V!15591 (_ BitVec 32) Int) ListLongMap!6089)

(assert (=> bm!29314 (= call!29318 (getCurrentListMapNoExtraKeys!1265 (ite c!55283 _keys!709 lt!192841) (ite c!55283 _values!549 lt!192847) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420324 () Bool)

(assert (=> b!420324 (= e!250375 true)))

(declare-fun lt!192838 () tuple2!7176)

(declare-fun lt!192839 () V!15591)

(declare-fun lt!192846 () ListLongMap!6089)

(declare-fun +!1257 (ListLongMap!6089 tuple2!7176) ListLongMap!6089)

(assert (=> b!420324 (= (+!1257 lt!192846 lt!192838) (+!1257 (+!1257 lt!192846 (tuple2!7177 k!794 lt!192839)) lt!192838))))

(declare-fun lt!192842 () V!15591)

(assert (=> b!420324 (= lt!192838 (tuple2!7177 k!794 lt!192842))))

(declare-fun lt!192843 () Unit!12418)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!54 (ListLongMap!6089 (_ BitVec 64) V!15591 V!15591) Unit!12418)

(assert (=> b!420324 (= lt!192843 (addSameAsAddTwiceSameKeyDiffValues!54 lt!192846 k!794 lt!192839 lt!192842))))

(declare-fun lt!192848 () V!15591)

(declare-fun get!6076 (ValueCell!5089 V!15591) V!15591)

(assert (=> b!420324 (= lt!192839 (get!6076 (select (arr!12240 _values!549) from!863) lt!192848))))

(declare-fun lt!192844 () ListLongMap!6089)

(assert (=> b!420324 (= lt!192844 (+!1257 lt!192846 (tuple2!7177 (select (arr!12239 lt!192841) from!863) lt!192842)))))

(assert (=> b!420324 (= lt!192842 (get!6076 (select (store (arr!12240 _values!549) i!563 (ValueCellFull!5089 v!412)) from!863) lt!192848))))

(declare-fun dynLambda!725 (Int (_ BitVec 64)) V!15591)

(assert (=> b!420324 (= lt!192848 (dynLambda!725 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!420324 (= lt!192846 (getCurrentListMapNoExtraKeys!1265 lt!192841 lt!192847 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420325 () Bool)

(assert (=> b!420325 (= e!250380 e!250378)))

(declare-fun res!245166 () Bool)

(assert (=> b!420325 (=> (not res!245166) (not e!250378))))

(assert (=> b!420325 (= res!245166 (= from!863 i!563))))

(assert (=> b!420325 (= lt!192844 (getCurrentListMapNoExtraKeys!1265 lt!192841 lt!192847 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420325 (= lt!192847 (array!25582 (store (arr!12240 _values!549) i!563 (ValueCellFull!5089 v!412)) (size!12592 _values!549)))))

(declare-fun lt!192840 () ListLongMap!6089)

(assert (=> b!420325 (= lt!192840 (getCurrentListMapNoExtraKeys!1265 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420326 () Bool)

(assert (=> b!420326 (= e!250381 e!250380)))

(declare-fun res!245168 () Bool)

(assert (=> b!420326 (=> (not res!245168) (not e!250380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25579 (_ BitVec 32)) Bool)

(assert (=> b!420326 (= res!245168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192841 mask!1025))))

(assert (=> b!420326 (= lt!192841 (array!25580 (store (arr!12239 _keys!709) i!563 k!794) (size!12591 _keys!709)))))

(declare-fun b!420327 () Bool)

(declare-fun res!245161 () Bool)

(assert (=> b!420327 (=> (not res!245161) (not e!250381))))

(assert (=> b!420327 (= res!245161 (and (= (size!12592 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12591 _keys!709) (size!12592 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420328 () Bool)

(declare-fun res!245159 () Bool)

(assert (=> b!420328 (=> (not res!245159) (not e!250381))))

(assert (=> b!420328 (= res!245159 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12591 _keys!709))))))

(declare-fun b!420329 () Bool)

(declare-fun res!245156 () Bool)

(assert (=> b!420329 (=> (not res!245156) (not e!250380))))

(declare-datatypes ((List!7184 0))(
  ( (Nil!7181) (Cons!7180 (h!8036 (_ BitVec 64)) (t!12562 List!7184)) )
))
(declare-fun arrayNoDuplicates!0 (array!25579 (_ BitVec 32) List!7184) Bool)

(assert (=> b!420329 (= res!245156 (arrayNoDuplicates!0 lt!192841 #b00000000000000000000000000000000 Nil!7181))))

(declare-fun b!420330 () Bool)

(declare-fun res!245158 () Bool)

(assert (=> b!420330 (=> (not res!245158) (not e!250381))))

(assert (=> b!420330 (= res!245158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420331 () Bool)

(declare-fun res!245157 () Bool)

(assert (=> b!420331 (=> (not res!245157) (not e!250381))))

(assert (=> b!420331 (= res!245157 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7181))))

(declare-fun bm!29315 () Bool)

(declare-fun call!29317 () ListLongMap!6089)

(assert (=> bm!29315 (= call!29317 (getCurrentListMapNoExtraKeys!1265 (ite c!55283 lt!192841 _keys!709) (ite c!55283 lt!192847 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420332 () Bool)

(assert (=> b!420332 (= e!250379 (= call!29317 (+!1257 call!29318 (tuple2!7177 k!794 v!412))))))

(declare-fun b!420333 () Bool)

(declare-fun res!245160 () Bool)

(assert (=> b!420333 (=> (not res!245160) (not e!250381))))

(assert (=> b!420333 (= res!245160 (validKeyInArray!0 k!794))))

(declare-fun b!420334 () Bool)

(declare-fun e!250382 () Bool)

(assert (=> b!420334 (= e!250383 (and e!250382 mapRes!17919))))

(declare-fun condMapEmpty!17919 () Bool)

(declare-fun mapDefault!17919 () ValueCell!5089)

