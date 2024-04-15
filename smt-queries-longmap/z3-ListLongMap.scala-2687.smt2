; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39926 () Bool)

(assert start!39926)

(declare-fun b_free!10207 () Bool)

(declare-fun b_next!10207 () Bool)

(assert (=> start!39926 (= b_free!10207 (not b_next!10207))))

(declare-fun tp!36149 () Bool)

(declare-fun b_and!18047 () Bool)

(assert (=> start!39926 (= tp!36149 b_and!18047)))

(declare-fun b!433347 () Bool)

(declare-fun res!255100 () Bool)

(declare-fun e!256195 () Bool)

(assert (=> b!433347 (=> (not res!255100) (not e!256195))))

(declare-datatypes ((array!26543 0))(
  ( (array!26544 (arr!12721 (Array (_ BitVec 32) (_ BitVec 64))) (size!13074 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26543)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433347 (= res!255100 (or (= (select (arr!12721 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12721 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433348 () Bool)

(declare-fun e!256197 () Bool)

(assert (=> b!433348 (= e!256197 true)))

(declare-datatypes ((V!16251 0))(
  ( (V!16252 (val!5724 Int)) )
))
(declare-datatypes ((tuple2!7574 0))(
  ( (tuple2!7575 (_1!3798 (_ BitVec 64)) (_2!3798 V!16251)) )
))
(declare-datatypes ((List!7565 0))(
  ( (Nil!7562) (Cons!7561 (h!8417 tuple2!7574) (t!13212 List!7565)) )
))
(declare-datatypes ((ListLongMap!6477 0))(
  ( (ListLongMap!6478 (toList!3254 List!7565)) )
))
(declare-fun lt!198940 () ListLongMap!6477)

(declare-fun lt!198934 () tuple2!7574)

(declare-fun lt!198941 () ListLongMap!6477)

(declare-fun lt!198932 () tuple2!7574)

(declare-fun +!1429 (ListLongMap!6477 tuple2!7574) ListLongMap!6477)

(assert (=> b!433348 (= lt!198940 (+!1429 (+!1429 lt!198941 lt!198934) lt!198932))))

(declare-datatypes ((Unit!12804 0))(
  ( (Unit!12805) )
))
(declare-fun lt!198938 () Unit!12804)

(declare-fun lt!198931 () V!16251)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun v!412 () V!16251)

(declare-fun addCommutativeForDiffKeys!385 (ListLongMap!6477 (_ BitVec 64) V!16251 (_ BitVec 64) V!16251) Unit!12804)

(assert (=> b!433348 (= lt!198938 (addCommutativeForDiffKeys!385 lt!198941 k0!794 v!412 (select (arr!12721 _keys!709) from!863) lt!198931))))

(declare-fun b!433349 () Bool)

(declare-fun e!256189 () Bool)

(declare-fun e!256192 () Bool)

(declare-fun mapRes!18660 () Bool)

(assert (=> b!433349 (= e!256189 (and e!256192 mapRes!18660))))

(declare-fun condMapEmpty!18660 () Bool)

(declare-datatypes ((ValueCell!5336 0))(
  ( (ValueCellFull!5336 (v!7965 V!16251)) (EmptyCell!5336) )
))
(declare-datatypes ((array!26545 0))(
  ( (array!26546 (arr!12722 (Array (_ BitVec 32) ValueCell!5336)) (size!13075 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26545)

(declare-fun mapDefault!18660 () ValueCell!5336)

(assert (=> b!433349 (= condMapEmpty!18660 (= (arr!12722 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5336)) mapDefault!18660)))))

(declare-fun b!433350 () Bool)

(declare-fun res!255098 () Bool)

(declare-fun e!256194 () Bool)

(assert (=> b!433350 (=> (not res!255098) (not e!256194))))

(declare-fun lt!198935 () array!26543)

(declare-datatypes ((List!7566 0))(
  ( (Nil!7563) (Cons!7562 (h!8418 (_ BitVec 64)) (t!13213 List!7566)) )
))
(declare-fun arrayNoDuplicates!0 (array!26543 (_ BitVec 32) List!7566) Bool)

(assert (=> b!433350 (= res!255098 (arrayNoDuplicates!0 lt!198935 #b00000000000000000000000000000000 Nil!7563))))

(declare-fun b!433351 () Bool)

(declare-fun res!255105 () Bool)

(assert (=> b!433351 (=> (not res!255105) (not e!256195))))

(assert (=> b!433351 (= res!255105 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7563))))

(declare-fun b!433352 () Bool)

(declare-fun tp_is_empty!11359 () Bool)

(assert (=> b!433352 (= e!256192 tp_is_empty!11359)))

(declare-fun b!433353 () Bool)

(declare-fun e!256188 () Bool)

(assert (=> b!433353 (= e!256194 e!256188)))

(declare-fun res!255111 () Bool)

(assert (=> b!433353 (=> (not res!255111) (not e!256188))))

(assert (=> b!433353 (= res!255111 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16251)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!198937 () array!26545)

(declare-fun zeroValue!515 () V!16251)

(declare-fun lt!198927 () ListLongMap!6477)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1457 (array!26543 array!26545 (_ BitVec 32) (_ BitVec 32) V!16251 V!16251 (_ BitVec 32) Int) ListLongMap!6477)

(assert (=> b!433353 (= lt!198927 (getCurrentListMapNoExtraKeys!1457 lt!198935 lt!198937 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433353 (= lt!198937 (array!26546 (store (arr!12722 _values!549) i!563 (ValueCellFull!5336 v!412)) (size!13075 _values!549)))))

(declare-fun lt!198930 () ListLongMap!6477)

(assert (=> b!433353 (= lt!198930 (getCurrentListMapNoExtraKeys!1457 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433354 () Bool)

(assert (=> b!433354 (= e!256195 e!256194)))

(declare-fun res!255108 () Bool)

(assert (=> b!433354 (=> (not res!255108) (not e!256194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26543 (_ BitVec 32)) Bool)

(assert (=> b!433354 (= res!255108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198935 mask!1025))))

(assert (=> b!433354 (= lt!198935 (array!26544 (store (arr!12721 _keys!709) i!563 k0!794) (size!13074 _keys!709)))))

(declare-fun mapNonEmpty!18660 () Bool)

(declare-fun tp!36150 () Bool)

(declare-fun e!256190 () Bool)

(assert (=> mapNonEmpty!18660 (= mapRes!18660 (and tp!36150 e!256190))))

(declare-fun mapRest!18660 () (Array (_ BitVec 32) ValueCell!5336))

(declare-fun mapKey!18660 () (_ BitVec 32))

(declare-fun mapValue!18660 () ValueCell!5336)

(assert (=> mapNonEmpty!18660 (= (arr!12722 _values!549) (store mapRest!18660 mapKey!18660 mapValue!18660))))

(declare-fun b!433355 () Bool)

(declare-fun res!255099 () Bool)

(assert (=> b!433355 (=> (not res!255099) (not e!256195))))

(declare-fun arrayContainsKey!0 (array!26543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433355 (= res!255099 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433356 () Bool)

(declare-fun e!256196 () Bool)

(assert (=> b!433356 (= e!256188 (not e!256196))))

(declare-fun res!255110 () Bool)

(assert (=> b!433356 (=> res!255110 e!256196)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433356 (= res!255110 (not (validKeyInArray!0 (select (arr!12721 _keys!709) from!863))))))

(declare-fun lt!198933 () ListLongMap!6477)

(declare-fun lt!198939 () ListLongMap!6477)

(assert (=> b!433356 (= lt!198933 lt!198939)))

(assert (=> b!433356 (= lt!198939 (+!1429 lt!198941 lt!198932))))

(assert (=> b!433356 (= lt!198933 (getCurrentListMapNoExtraKeys!1457 lt!198935 lt!198937 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433356 (= lt!198932 (tuple2!7575 k0!794 v!412))))

(assert (=> b!433356 (= lt!198941 (getCurrentListMapNoExtraKeys!1457 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198929 () Unit!12804)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!579 (array!26543 array!26545 (_ BitVec 32) (_ BitVec 32) V!16251 V!16251 (_ BitVec 32) (_ BitVec 64) V!16251 (_ BitVec 32) Int) Unit!12804)

(assert (=> b!433356 (= lt!198929 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!579 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433357 () Bool)

(declare-fun res!255102 () Bool)

(assert (=> b!433357 (=> (not res!255102) (not e!256194))))

(assert (=> b!433357 (= res!255102 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18660 () Bool)

(assert (=> mapIsEmpty!18660 mapRes!18660))

(declare-fun b!433358 () Bool)

(declare-fun e!256191 () Unit!12804)

(declare-fun Unit!12806 () Unit!12804)

(assert (=> b!433358 (= e!256191 Unit!12806)))

(declare-fun b!433359 () Bool)

(declare-fun res!255109 () Bool)

(assert (=> b!433359 (=> (not res!255109) (not e!256195))))

(assert (=> b!433359 (= res!255109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433360 () Bool)

(declare-fun res!255104 () Bool)

(assert (=> b!433360 (=> (not res!255104) (not e!256195))))

(assert (=> b!433360 (= res!255104 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13074 _keys!709))))))

(declare-fun b!433361 () Bool)

(declare-fun res!255107 () Bool)

(assert (=> b!433361 (=> (not res!255107) (not e!256195))))

(assert (=> b!433361 (= res!255107 (and (= (size!13075 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13074 _keys!709) (size!13075 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433362 () Bool)

(assert (=> b!433362 (= e!256190 tp_is_empty!11359)))

(declare-fun b!433363 () Bool)

(declare-fun res!255103 () Bool)

(assert (=> b!433363 (=> (not res!255103) (not e!256195))))

(assert (=> b!433363 (= res!255103 (validKeyInArray!0 k0!794))))

(declare-fun res!255101 () Bool)

(assert (=> start!39926 (=> (not res!255101) (not e!256195))))

(assert (=> start!39926 (= res!255101 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13074 _keys!709))))))

(assert (=> start!39926 e!256195))

(assert (=> start!39926 tp_is_empty!11359))

(assert (=> start!39926 tp!36149))

(assert (=> start!39926 true))

(declare-fun array_inv!9286 (array!26545) Bool)

(assert (=> start!39926 (and (array_inv!9286 _values!549) e!256189)))

(declare-fun array_inv!9287 (array!26543) Bool)

(assert (=> start!39926 (array_inv!9287 _keys!709)))

(declare-fun b!433364 () Bool)

(assert (=> b!433364 (= e!256196 e!256197)))

(declare-fun res!255106 () Bool)

(assert (=> b!433364 (=> res!255106 e!256197)))

(assert (=> b!433364 (= res!255106 (= k0!794 (select (arr!12721 _keys!709) from!863)))))

(assert (=> b!433364 (not (= (select (arr!12721 _keys!709) from!863) k0!794))))

(declare-fun lt!198936 () Unit!12804)

(assert (=> b!433364 (= lt!198936 e!256191)))

(declare-fun c!55575 () Bool)

(assert (=> b!433364 (= c!55575 (= (select (arr!12721 _keys!709) from!863) k0!794))))

(assert (=> b!433364 (= lt!198927 lt!198940)))

(assert (=> b!433364 (= lt!198940 (+!1429 lt!198939 lt!198934))))

(assert (=> b!433364 (= lt!198934 (tuple2!7575 (select (arr!12721 _keys!709) from!863) lt!198931))))

(declare-fun get!6331 (ValueCell!5336 V!16251) V!16251)

(declare-fun dynLambda!811 (Int (_ BitVec 64)) V!16251)

(assert (=> b!433364 (= lt!198931 (get!6331 (select (arr!12722 _values!549) from!863) (dynLambda!811 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433365 () Bool)

(declare-fun Unit!12807 () Unit!12804)

(assert (=> b!433365 (= e!256191 Unit!12807)))

(declare-fun lt!198928 () Unit!12804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26543 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12804)

(assert (=> b!433365 (= lt!198928 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433365 false))

(declare-fun b!433366 () Bool)

(declare-fun res!255097 () Bool)

(assert (=> b!433366 (=> (not res!255097) (not e!256195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433366 (= res!255097 (validMask!0 mask!1025))))

(assert (= (and start!39926 res!255101) b!433366))

(assert (= (and b!433366 res!255097) b!433361))

(assert (= (and b!433361 res!255107) b!433359))

(assert (= (and b!433359 res!255109) b!433351))

(assert (= (and b!433351 res!255105) b!433360))

(assert (= (and b!433360 res!255104) b!433363))

(assert (= (and b!433363 res!255103) b!433347))

(assert (= (and b!433347 res!255100) b!433355))

(assert (= (and b!433355 res!255099) b!433354))

(assert (= (and b!433354 res!255108) b!433350))

(assert (= (and b!433350 res!255098) b!433357))

(assert (= (and b!433357 res!255102) b!433353))

(assert (= (and b!433353 res!255111) b!433356))

(assert (= (and b!433356 (not res!255110)) b!433364))

(assert (= (and b!433364 c!55575) b!433365))

(assert (= (and b!433364 (not c!55575)) b!433358))

(assert (= (and b!433364 (not res!255106)) b!433348))

(assert (= (and b!433349 condMapEmpty!18660) mapIsEmpty!18660))

(assert (= (and b!433349 (not condMapEmpty!18660)) mapNonEmpty!18660))

(get-info :version)

(assert (= (and mapNonEmpty!18660 ((_ is ValueCellFull!5336) mapValue!18660)) b!433362))

(assert (= (and b!433349 ((_ is ValueCellFull!5336) mapDefault!18660)) b!433352))

(assert (= start!39926 b!433349))

(declare-fun b_lambda!9277 () Bool)

(assert (=> (not b_lambda!9277) (not b!433364)))

(declare-fun t!13211 () Bool)

(declare-fun tb!3605 () Bool)

(assert (=> (and start!39926 (= defaultEntry!557 defaultEntry!557) t!13211) tb!3605))

(declare-fun result!6745 () Bool)

(assert (=> tb!3605 (= result!6745 tp_is_empty!11359)))

(assert (=> b!433364 t!13211))

(declare-fun b_and!18049 () Bool)

(assert (= b_and!18047 (and (=> t!13211 result!6745) b_and!18049)))

(declare-fun m!420891 () Bool)

(assert (=> b!433353 m!420891))

(declare-fun m!420893 () Bool)

(assert (=> b!433353 m!420893))

(declare-fun m!420895 () Bool)

(assert (=> b!433353 m!420895))

(declare-fun m!420897 () Bool)

(assert (=> mapNonEmpty!18660 m!420897))

(declare-fun m!420899 () Bool)

(assert (=> start!39926 m!420899))

(declare-fun m!420901 () Bool)

(assert (=> start!39926 m!420901))

(declare-fun m!420903 () Bool)

(assert (=> b!433363 m!420903))

(declare-fun m!420905 () Bool)

(assert (=> b!433364 m!420905))

(declare-fun m!420907 () Bool)

(assert (=> b!433364 m!420907))

(declare-fun m!420909 () Bool)

(assert (=> b!433364 m!420909))

(declare-fun m!420911 () Bool)

(assert (=> b!433364 m!420911))

(assert (=> b!433364 m!420909))

(assert (=> b!433364 m!420907))

(declare-fun m!420913 () Bool)

(assert (=> b!433364 m!420913))

(assert (=> b!433356 m!420905))

(declare-fun m!420915 () Bool)

(assert (=> b!433356 m!420915))

(declare-fun m!420917 () Bool)

(assert (=> b!433356 m!420917))

(assert (=> b!433356 m!420905))

(declare-fun m!420919 () Bool)

(assert (=> b!433356 m!420919))

(declare-fun m!420921 () Bool)

(assert (=> b!433356 m!420921))

(declare-fun m!420923 () Bool)

(assert (=> b!433356 m!420923))

(declare-fun m!420925 () Bool)

(assert (=> b!433348 m!420925))

(assert (=> b!433348 m!420925))

(declare-fun m!420927 () Bool)

(assert (=> b!433348 m!420927))

(assert (=> b!433348 m!420905))

(assert (=> b!433348 m!420905))

(declare-fun m!420929 () Bool)

(assert (=> b!433348 m!420929))

(declare-fun m!420931 () Bool)

(assert (=> b!433350 m!420931))

(declare-fun m!420933 () Bool)

(assert (=> b!433351 m!420933))

(declare-fun m!420935 () Bool)

(assert (=> b!433355 m!420935))

(declare-fun m!420937 () Bool)

(assert (=> b!433366 m!420937))

(declare-fun m!420939 () Bool)

(assert (=> b!433359 m!420939))

(declare-fun m!420941 () Bool)

(assert (=> b!433365 m!420941))

(declare-fun m!420943 () Bool)

(assert (=> b!433347 m!420943))

(declare-fun m!420945 () Bool)

(assert (=> b!433354 m!420945))

(declare-fun m!420947 () Bool)

(assert (=> b!433354 m!420947))

(check-sat (not b!433356) (not b!433359) b_and!18049 (not b_lambda!9277) (not b!433351) (not b!433363) (not start!39926) (not b!433364) (not b!433348) (not b_next!10207) (not mapNonEmpty!18660) (not b!433350) (not b!433365) tp_is_empty!11359 (not b!433366) (not b!433355) (not b!433354) (not b!433353))
(check-sat b_and!18049 (not b_next!10207))
