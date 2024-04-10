; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20424 () Bool)

(assert start!20424)

(declare-fun b_free!5083 () Bool)

(declare-fun b_next!5083 () Bool)

(assert (=> start!20424 (= b_free!5083 (not b_next!5083))))

(declare-fun tp!18280 () Bool)

(declare-fun b_and!11829 () Bool)

(assert (=> start!20424 (= tp!18280 b_and!11829)))

(declare-fun b!202122 () Bool)

(declare-fun e!132423 () Bool)

(assert (=> b!202122 (= e!132423 true)))

(declare-datatypes ((V!6233 0))(
  ( (V!6234 (val!2514 Int)) )
))
(declare-datatypes ((tuple2!3808 0))(
  ( (tuple2!3809 (_1!1915 (_ BitVec 64)) (_2!1915 V!6233)) )
))
(declare-datatypes ((List!2718 0))(
  ( (Nil!2715) (Cons!2714 (h!3356 tuple2!3808) (t!7649 List!2718)) )
))
(declare-datatypes ((ListLongMap!2721 0))(
  ( (ListLongMap!2722 (toList!1376 List!2718)) )
))
(declare-fun lt!101287 () ListLongMap!2721)

(declare-fun lt!101295 () tuple2!3808)

(declare-fun lt!101281 () ListLongMap!2721)

(declare-fun lt!101293 () tuple2!3808)

(declare-fun +!403 (ListLongMap!2721 tuple2!3808) ListLongMap!2721)

(assert (=> b!202122 (= (+!403 lt!101281 lt!101293) (+!403 lt!101287 lt!101295))))

(declare-fun minValue!615 () V!6233)

(declare-fun v!520 () V!6233)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun lt!101283 () ListLongMap!2721)

(declare-datatypes ((Unit!6106 0))(
  ( (Unit!6107) )
))
(declare-fun lt!101285 () Unit!6106)

(declare-fun addCommutativeForDiffKeys!124 (ListLongMap!2721 (_ BitVec 64) V!6233 (_ BitVec 64) V!6233) Unit!6106)

(assert (=> b!202122 (= lt!101285 (addCommutativeForDiffKeys!124 lt!101283 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!202123 () Bool)

(declare-fun res!96768 () Bool)

(declare-fun e!132425 () Bool)

(assert (=> b!202123 (=> (not res!96768) (not e!132425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202123 (= res!96768 (validKeyInArray!0 k!843))))

(declare-fun b!202124 () Bool)

(declare-fun e!132419 () Bool)

(assert (=> b!202124 (= e!132419 e!132423)))

(declare-fun res!96764 () Bool)

(assert (=> b!202124 (=> res!96764 e!132423)))

(assert (=> b!202124 (= res!96764 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101294 () ListLongMap!2721)

(assert (=> b!202124 (= lt!101294 lt!101281)))

(assert (=> b!202124 (= lt!101281 (+!403 lt!101283 lt!101295))))

(declare-fun lt!101292 () ListLongMap!2721)

(declare-fun lt!101291 () Unit!6106)

(declare-fun zeroValue!615 () V!6233)

(assert (=> b!202124 (= lt!101291 (addCommutativeForDiffKeys!124 lt!101292 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!101286 () ListLongMap!2721)

(assert (=> b!202124 (= lt!101286 (+!403 lt!101294 lt!101293))))

(declare-fun lt!101284 () ListLongMap!2721)

(declare-fun lt!101290 () tuple2!3808)

(assert (=> b!202124 (= lt!101294 (+!403 lt!101284 lt!101290))))

(declare-fun lt!101282 () ListLongMap!2721)

(assert (=> b!202124 (= lt!101282 lt!101287)))

(assert (=> b!202124 (= lt!101287 (+!403 lt!101283 lt!101293))))

(assert (=> b!202124 (= lt!101283 (+!403 lt!101292 lt!101290))))

(declare-fun lt!101288 () ListLongMap!2721)

(assert (=> b!202124 (= lt!101286 (+!403 (+!403 lt!101288 lt!101290) lt!101293))))

(assert (=> b!202124 (= lt!101293 (tuple2!3809 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!202124 (= lt!101290 (tuple2!3809 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202125 () Bool)

(declare-fun e!132424 () Bool)

(declare-fun e!132420 () Bool)

(declare-fun mapRes!8477 () Bool)

(assert (=> b!202125 (= e!132424 (and e!132420 mapRes!8477))))

(declare-fun condMapEmpty!8477 () Bool)

(declare-datatypes ((ValueCell!2126 0))(
  ( (ValueCellFull!2126 (v!4484 V!6233)) (EmptyCell!2126) )
))
(declare-datatypes ((array!9105 0))(
  ( (array!9106 (arr!4303 (Array (_ BitVec 32) ValueCell!2126)) (size!4628 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9105)

(declare-fun mapDefault!8477 () ValueCell!2126)

