; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39934 () Bool)

(assert start!39934)

(declare-fun b_free!10201 () Bool)

(declare-fun b_next!10201 () Bool)

(assert (=> start!39934 (= b_free!10201 (not b_next!10201))))

(declare-fun tp!36131 () Bool)

(declare-fun b_and!18061 () Bool)

(assert (=> start!39934 (= tp!36131 b_and!18061)))

(declare-fun mapIsEmpty!18651 () Bool)

(declare-fun mapRes!18651 () Bool)

(assert (=> mapIsEmpty!18651 mapRes!18651))

(declare-fun b!433432 () Bool)

(declare-fun res!255101 () Bool)

(declare-fun e!256280 () Bool)

(assert (=> b!433432 (=> (not res!255101) (not e!256280))))

(declare-datatypes ((array!26539 0))(
  ( (array!26540 (arr!12719 (Array (_ BitVec 32) (_ BitVec 64))) (size!13071 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26539)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433432 (= res!255101 (or (= (select (arr!12719 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12719 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433433 () Bool)

(declare-fun res!255100 () Bool)

(assert (=> b!433433 (=> (not res!255100) (not e!256280))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433433 (= res!255100 (validKeyInArray!0 k!794))))

(declare-fun b!433434 () Bool)

(declare-fun res!255094 () Bool)

(assert (=> b!433434 (=> (not res!255094) (not e!256280))))

(declare-datatypes ((List!7569 0))(
  ( (Nil!7566) (Cons!7565 (h!8421 (_ BitVec 64)) (t!13219 List!7569)) )
))
(declare-fun arrayNoDuplicates!0 (array!26539 (_ BitVec 32) List!7569) Bool)

(assert (=> b!433434 (= res!255094 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7566))))

(declare-fun b!433435 () Bool)

(declare-fun e!256273 () Bool)

(declare-fun e!256272 () Bool)

(assert (=> b!433435 (= e!256273 e!256272)))

(declare-fun res!255099 () Bool)

(assert (=> b!433435 (=> res!255099 e!256272)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433435 (= res!255099 (= k!794 (select (arr!12719 _keys!709) from!863)))))

(assert (=> b!433435 (not (= (select (arr!12719 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12828 0))(
  ( (Unit!12829) )
))
(declare-fun lt!199040 () Unit!12828)

(declare-fun e!256279 () Unit!12828)

(assert (=> b!433435 (= lt!199040 e!256279)))

(declare-fun c!55637 () Bool)

(assert (=> b!433435 (= c!55637 (= (select (arr!12719 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16243 0))(
  ( (V!16244 (val!5721 Int)) )
))
(declare-datatypes ((tuple2!7560 0))(
  ( (tuple2!7561 (_1!3791 (_ BitVec 64)) (_2!3791 V!16243)) )
))
(declare-datatypes ((List!7570 0))(
  ( (Nil!7567) (Cons!7566 (h!8422 tuple2!7560) (t!13220 List!7570)) )
))
(declare-datatypes ((ListLongMap!6473 0))(
  ( (ListLongMap!6474 (toList!3252 List!7570)) )
))
(declare-fun lt!199031 () ListLongMap!6473)

(declare-fun lt!199034 () ListLongMap!6473)

(assert (=> b!433435 (= lt!199031 lt!199034)))

(declare-fun lt!199033 () ListLongMap!6473)

(declare-fun lt!199035 () tuple2!7560)

(declare-fun +!1400 (ListLongMap!6473 tuple2!7560) ListLongMap!6473)

(assert (=> b!433435 (= lt!199034 (+!1400 lt!199033 lt!199035))))

(declare-fun lt!199039 () V!16243)

(assert (=> b!433435 (= lt!199035 (tuple2!7561 (select (arr!12719 _keys!709) from!863) lt!199039))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5333 0))(
  ( (ValueCellFull!5333 (v!7968 V!16243)) (EmptyCell!5333) )
))
(declare-datatypes ((array!26541 0))(
  ( (array!26542 (arr!12720 (Array (_ BitVec 32) ValueCell!5333)) (size!13072 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26541)

(declare-fun get!6328 (ValueCell!5333 V!16243) V!16243)

(declare-fun dynLambda!813 (Int (_ BitVec 64)) V!16243)

(assert (=> b!433435 (= lt!199039 (get!6328 (select (arr!12720 _values!549) from!863) (dynLambda!813 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433436 () Bool)

(declare-fun res!255105 () Bool)

(assert (=> b!433436 (=> (not res!255105) (not e!256280))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!433436 (= res!255105 (and (= (size!13072 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13071 _keys!709) (size!13072 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433438 () Bool)

(declare-fun res!255095 () Bool)

(assert (=> b!433438 (=> (not res!255095) (not e!256280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433438 (= res!255095 (validMask!0 mask!1025))))

(declare-fun b!433439 () Bool)

(declare-fun res!255091 () Bool)

(assert (=> b!433439 (=> (not res!255091) (not e!256280))))

(assert (=> b!433439 (= res!255091 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13071 _keys!709))))))

(declare-fun b!433440 () Bool)

(declare-fun res!255093 () Bool)

(assert (=> b!433440 (=> (not res!255093) (not e!256280))))

(declare-fun arrayContainsKey!0 (array!26539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433440 (= res!255093 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!433441 () Bool)

(declare-fun e!256277 () Bool)

(declare-fun tp_is_empty!11353 () Bool)

(assert (=> b!433441 (= e!256277 tp_is_empty!11353)))

(declare-fun b!433442 () Bool)

(declare-fun e!256274 () Bool)

(declare-fun e!256276 () Bool)

(assert (=> b!433442 (= e!256274 e!256276)))

(declare-fun res!255103 () Bool)

(assert (=> b!433442 (=> (not res!255103) (not e!256276))))

(assert (=> b!433442 (= res!255103 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16243)

(declare-fun zeroValue!515 () V!16243)

(declare-fun lt!199029 () array!26541)

(declare-fun lt!199037 () array!26539)

(declare-fun getCurrentListMapNoExtraKeys!1448 (array!26539 array!26541 (_ BitVec 32) (_ BitVec 32) V!16243 V!16243 (_ BitVec 32) Int) ListLongMap!6473)

(assert (=> b!433442 (= lt!199031 (getCurrentListMapNoExtraKeys!1448 lt!199037 lt!199029 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16243)

(assert (=> b!433442 (= lt!199029 (array!26542 (store (arr!12720 _values!549) i!563 (ValueCellFull!5333 v!412)) (size!13072 _values!549)))))

(declare-fun lt!199026 () ListLongMap!6473)

(assert (=> b!433442 (= lt!199026 (getCurrentListMapNoExtraKeys!1448 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433443 () Bool)

(declare-fun e!256281 () Bool)

(assert (=> b!433443 (= e!256281 tp_is_empty!11353)))

(declare-fun b!433444 () Bool)

(declare-fun res!255097 () Bool)

(assert (=> b!433444 (=> (not res!255097) (not e!256280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26539 (_ BitVec 32)) Bool)

(assert (=> b!433444 (= res!255097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433445 () Bool)

(declare-fun Unit!12830 () Unit!12828)

(assert (=> b!433445 (= e!256279 Unit!12830)))

(declare-fun mapNonEmpty!18651 () Bool)

(declare-fun tp!36132 () Bool)

(assert (=> mapNonEmpty!18651 (= mapRes!18651 (and tp!36132 e!256281))))

(declare-fun mapValue!18651 () ValueCell!5333)

(declare-fun mapRest!18651 () (Array (_ BitVec 32) ValueCell!5333))

(declare-fun mapKey!18651 () (_ BitVec 32))

(assert (=> mapNonEmpty!18651 (= (arr!12720 _values!549) (store mapRest!18651 mapKey!18651 mapValue!18651))))

(declare-fun b!433446 () Bool)

(declare-fun res!255102 () Bool)

(assert (=> b!433446 (=> (not res!255102) (not e!256274))))

(assert (=> b!433446 (= res!255102 (arrayNoDuplicates!0 lt!199037 #b00000000000000000000000000000000 Nil!7566))))

(declare-fun b!433447 () Bool)

(declare-fun res!255098 () Bool)

(assert (=> b!433447 (=> (not res!255098) (not e!256274))))

(assert (=> b!433447 (= res!255098 (bvsle from!863 i!563))))

(declare-fun b!433437 () Bool)

(assert (=> b!433437 (= e!256272 true)))

(declare-fun lt!199028 () ListLongMap!6473)

(declare-fun lt!199030 () tuple2!7560)

(assert (=> b!433437 (= lt!199034 (+!1400 (+!1400 lt!199028 lt!199035) lt!199030))))

(declare-fun lt!199038 () Unit!12828)

(declare-fun addCommutativeForDiffKeys!389 (ListLongMap!6473 (_ BitVec 64) V!16243 (_ BitVec 64) V!16243) Unit!12828)

(assert (=> b!433437 (= lt!199038 (addCommutativeForDiffKeys!389 lt!199028 k!794 v!412 (select (arr!12719 _keys!709) from!863) lt!199039))))

(declare-fun res!255096 () Bool)

(assert (=> start!39934 (=> (not res!255096) (not e!256280))))

(assert (=> start!39934 (= res!255096 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13071 _keys!709))))))

(assert (=> start!39934 e!256280))

(assert (=> start!39934 tp_is_empty!11353))

(assert (=> start!39934 tp!36131))

(assert (=> start!39934 true))

(declare-fun e!256275 () Bool)

(declare-fun array_inv!9256 (array!26541) Bool)

(assert (=> start!39934 (and (array_inv!9256 _values!549) e!256275)))

(declare-fun array_inv!9257 (array!26539) Bool)

(assert (=> start!39934 (array_inv!9257 _keys!709)))

(declare-fun b!433448 () Bool)

(declare-fun Unit!12831 () Unit!12828)

(assert (=> b!433448 (= e!256279 Unit!12831)))

(declare-fun lt!199032 () Unit!12828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26539 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12828)

(assert (=> b!433448 (= lt!199032 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433448 false))

(declare-fun b!433449 () Bool)

(assert (=> b!433449 (= e!256275 (and e!256277 mapRes!18651))))

(declare-fun condMapEmpty!18651 () Bool)

(declare-fun mapDefault!18651 () ValueCell!5333)

