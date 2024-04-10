; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39946 () Bool)

(assert start!39946)

(declare-fun b_free!10213 () Bool)

(declare-fun b_next!10213 () Bool)

(assert (=> start!39946 (= b_free!10213 (not b_next!10213))))

(declare-fun tp!36168 () Bool)

(declare-fun b_and!18085 () Bool)

(assert (=> start!39946 (= tp!36168 b_and!18085)))

(declare-fun b!433804 () Bool)

(declare-fun e!256453 () Bool)

(declare-fun e!256460 () Bool)

(assert (=> b!433804 (= e!256453 e!256460)))

(declare-fun res!255361 () Bool)

(assert (=> b!433804 (=> res!255361 e!256460)))

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26563 0))(
  ( (array!26564 (arr!12731 (Array (_ BitVec 32) (_ BitVec 64))) (size!13083 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26563)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433804 (= res!255361 (= k!794 (select (arr!12731 _keys!709) from!863)))))

(assert (=> b!433804 (not (= (select (arr!12731 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12849 0))(
  ( (Unit!12850) )
))
(declare-fun lt!199301 () Unit!12849)

(declare-fun e!256452 () Unit!12849)

(assert (=> b!433804 (= lt!199301 e!256452)))

(declare-fun c!55655 () Bool)

(assert (=> b!433804 (= c!55655 (= (select (arr!12731 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16259 0))(
  ( (V!16260 (val!5727 Int)) )
))
(declare-datatypes ((tuple2!7572 0))(
  ( (tuple2!7573 (_1!3797 (_ BitVec 64)) (_2!3797 V!16259)) )
))
(declare-datatypes ((List!7579 0))(
  ( (Nil!7576) (Cons!7575 (h!8431 tuple2!7572) (t!13241 List!7579)) )
))
(declare-datatypes ((ListLongMap!6485 0))(
  ( (ListLongMap!6486 (toList!3258 List!7579)) )
))
(declare-fun lt!199310 () ListLongMap!6485)

(declare-fun lt!199306 () ListLongMap!6485)

(assert (=> b!433804 (= lt!199310 lt!199306)))

(declare-fun lt!199299 () ListLongMap!6485)

(declare-fun lt!199304 () tuple2!7572)

(declare-fun +!1406 (ListLongMap!6485 tuple2!7572) ListLongMap!6485)

(assert (=> b!433804 (= lt!199306 (+!1406 lt!199299 lt!199304))))

(declare-fun lt!199309 () V!16259)

(assert (=> b!433804 (= lt!199304 (tuple2!7573 (select (arr!12731 _keys!709) from!863) lt!199309))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5339 0))(
  ( (ValueCellFull!5339 (v!7974 V!16259)) (EmptyCell!5339) )
))
(declare-datatypes ((array!26565 0))(
  ( (array!26566 (arr!12732 (Array (_ BitVec 32) ValueCell!5339)) (size!13084 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26565)

(declare-fun get!6337 (ValueCell!5339 V!16259) V!16259)

(declare-fun dynLambda!818 (Int (_ BitVec 64)) V!16259)

(assert (=> b!433804 (= lt!199309 (get!6337 (select (arr!12732 _values!549) from!863) (dynLambda!818 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!255372 () Bool)

(declare-fun e!256461 () Bool)

(assert (=> start!39946 (=> (not res!255372) (not e!256461))))

(assert (=> start!39946 (= res!255372 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13083 _keys!709))))))

(assert (=> start!39946 e!256461))

(declare-fun tp_is_empty!11365 () Bool)

(assert (=> start!39946 tp_is_empty!11365))

(assert (=> start!39946 tp!36168))

(assert (=> start!39946 true))

(declare-fun e!256457 () Bool)

(declare-fun array_inv!9262 (array!26565) Bool)

(assert (=> start!39946 (and (array_inv!9262 _values!549) e!256457)))

(declare-fun array_inv!9263 (array!26563) Bool)

(assert (=> start!39946 (array_inv!9263 _keys!709)))

(declare-fun b!433805 () Bool)

(declare-fun e!256454 () Bool)

(assert (=> b!433805 (= e!256454 tp_is_empty!11365)))

(declare-fun b!433806 () Bool)

(declare-fun e!256458 () Bool)

(assert (=> b!433806 (= e!256461 e!256458)))

(declare-fun res!255370 () Bool)

(assert (=> b!433806 (=> (not res!255370) (not e!256458))))

(declare-fun lt!199307 () array!26563)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26563 (_ BitVec 32)) Bool)

(assert (=> b!433806 (= res!255370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199307 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433806 (= lt!199307 (array!26564 (store (arr!12731 _keys!709) i!563 k!794) (size!13083 _keys!709)))))

(declare-fun b!433807 () Bool)

(declare-fun res!255367 () Bool)

(assert (=> b!433807 (=> (not res!255367) (not e!256458))))

(assert (=> b!433807 (= res!255367 (bvsle from!863 i!563))))

(declare-fun b!433808 () Bool)

(declare-fun Unit!12851 () Unit!12849)

(assert (=> b!433808 (= e!256452 Unit!12851)))

(declare-fun b!433809 () Bool)

(declare-fun res!255365 () Bool)

(assert (=> b!433809 (=> (not res!255365) (not e!256461))))

(assert (=> b!433809 (= res!255365 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13083 _keys!709))))))

(declare-fun mapIsEmpty!18669 () Bool)

(declare-fun mapRes!18669 () Bool)

(assert (=> mapIsEmpty!18669 mapRes!18669))

(declare-fun b!433810 () Bool)

(declare-fun res!255366 () Bool)

(assert (=> b!433810 (=> (not res!255366) (not e!256461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433810 (= res!255366 (validKeyInArray!0 k!794))))

(declare-fun b!433811 () Bool)

(declare-fun res!255369 () Bool)

(assert (=> b!433811 (=> (not res!255369) (not e!256461))))

(assert (=> b!433811 (= res!255369 (or (= (select (arr!12731 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12731 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433812 () Bool)

(declare-fun Unit!12852 () Unit!12849)

(assert (=> b!433812 (= e!256452 Unit!12852)))

(declare-fun lt!199296 () Unit!12849)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26563 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12849)

(assert (=> b!433812 (= lt!199296 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433812 false))

(declare-fun mapNonEmpty!18669 () Bool)

(declare-fun tp!36167 () Bool)

(declare-fun e!256456 () Bool)

(assert (=> mapNonEmpty!18669 (= mapRes!18669 (and tp!36167 e!256456))))

(declare-fun mapKey!18669 () (_ BitVec 32))

(declare-fun mapRest!18669 () (Array (_ BitVec 32) ValueCell!5339))

(declare-fun mapValue!18669 () ValueCell!5339)

(assert (=> mapNonEmpty!18669 (= (arr!12732 _values!549) (store mapRest!18669 mapKey!18669 mapValue!18669))))

(declare-fun b!433813 () Bool)

(assert (=> b!433813 (= e!256460 true)))

(declare-fun lt!199300 () ListLongMap!6485)

(declare-fun lt!199302 () tuple2!7572)

(assert (=> b!433813 (= lt!199306 (+!1406 (+!1406 lt!199300 lt!199304) lt!199302))))

(declare-fun lt!199303 () Unit!12849)

(declare-fun v!412 () V!16259)

(declare-fun addCommutativeForDiffKeys!394 (ListLongMap!6485 (_ BitVec 64) V!16259 (_ BitVec 64) V!16259) Unit!12849)

(assert (=> b!433813 (= lt!199303 (addCommutativeForDiffKeys!394 lt!199300 k!794 v!412 (select (arr!12731 _keys!709) from!863) lt!199309))))

(declare-fun b!433814 () Bool)

(declare-fun res!255373 () Bool)

(assert (=> b!433814 (=> (not res!255373) (not e!256461))))

(declare-datatypes ((List!7580 0))(
  ( (Nil!7577) (Cons!7576 (h!8432 (_ BitVec 64)) (t!13242 List!7580)) )
))
(declare-fun arrayNoDuplicates!0 (array!26563 (_ BitVec 32) List!7580) Bool)

(assert (=> b!433814 (= res!255373 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7577))))

(declare-fun b!433815 () Bool)

(declare-fun e!256459 () Bool)

(assert (=> b!433815 (= e!256459 (not e!256453))))

(declare-fun res!255374 () Bool)

(assert (=> b!433815 (=> res!255374 e!256453)))

(assert (=> b!433815 (= res!255374 (not (validKeyInArray!0 (select (arr!12731 _keys!709) from!863))))))

(declare-fun lt!199297 () ListLongMap!6485)

(assert (=> b!433815 (= lt!199297 lt!199299)))

(assert (=> b!433815 (= lt!199299 (+!1406 lt!199300 lt!199302))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16259)

(declare-fun minValue!515 () V!16259)

(declare-fun lt!199298 () array!26565)

(declare-fun getCurrentListMapNoExtraKeys!1452 (array!26563 array!26565 (_ BitVec 32) (_ BitVec 32) V!16259 V!16259 (_ BitVec 32) Int) ListLongMap!6485)

(assert (=> b!433815 (= lt!199297 (getCurrentListMapNoExtraKeys!1452 lt!199307 lt!199298 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433815 (= lt!199302 (tuple2!7573 k!794 v!412))))

(assert (=> b!433815 (= lt!199300 (getCurrentListMapNoExtraKeys!1452 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199308 () Unit!12849)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!584 (array!26563 array!26565 (_ BitVec 32) (_ BitVec 32) V!16259 V!16259 (_ BitVec 32) (_ BitVec 64) V!16259 (_ BitVec 32) Int) Unit!12849)

(assert (=> b!433815 (= lt!199308 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!584 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433816 () Bool)

(declare-fun res!255362 () Bool)

(assert (=> b!433816 (=> (not res!255362) (not e!256461))))

(assert (=> b!433816 (= res!255362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433817 () Bool)

(declare-fun res!255363 () Bool)

(assert (=> b!433817 (=> (not res!255363) (not e!256461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433817 (= res!255363 (validMask!0 mask!1025))))

(declare-fun b!433818 () Bool)

(assert (=> b!433818 (= e!256456 tp_is_empty!11365)))

(declare-fun b!433819 () Bool)

(declare-fun res!255364 () Bool)

(assert (=> b!433819 (=> (not res!255364) (not e!256461))))

(declare-fun arrayContainsKey!0 (array!26563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433819 (= res!255364 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!433820 () Bool)

(declare-fun res!255375 () Bool)

(assert (=> b!433820 (=> (not res!255375) (not e!256458))))

(assert (=> b!433820 (= res!255375 (arrayNoDuplicates!0 lt!199307 #b00000000000000000000000000000000 Nil!7577))))

(declare-fun b!433821 () Bool)

(assert (=> b!433821 (= e!256457 (and e!256454 mapRes!18669))))

(declare-fun condMapEmpty!18669 () Bool)

(declare-fun mapDefault!18669 () ValueCell!5339)

