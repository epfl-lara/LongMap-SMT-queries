; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40744 () Bool)

(assert start!40744)

(declare-fun b_free!10747 () Bool)

(declare-fun b_next!10747 () Bool)

(assert (=> start!40744 (= b_free!10747 (not b_next!10747))))

(declare-fun tp!38063 () Bool)

(declare-fun b_and!18791 () Bool)

(assert (=> start!40744 (= tp!38063 b_and!18791)))

(declare-fun b!451348 () Bool)

(declare-fun e!264406 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((V!17219 0))(
  ( (V!17220 (val!6087 Int)) )
))
(declare-datatypes ((ValueCell!5699 0))(
  ( (ValueCellFull!5699 (v!8347 V!17219)) (EmptyCell!5699) )
))
(declare-datatypes ((array!27970 0))(
  ( (array!27971 (arr!13429 (Array (_ BitVec 32) ValueCell!5699)) (size!13781 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27970)

(assert (=> b!451348 (= e!264406 (bvslt i!563 (size!13781 _values!549)))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17219)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27972 0))(
  ( (array!27973 (arr!13430 (Array (_ BitVec 32) (_ BitVec 64))) (size!13782 (_ BitVec 32))) )
))
(declare-fun lt!204931 () array!27972)

(declare-fun lt!204933 () array!27970)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7908 0))(
  ( (tuple2!7909 (_1!3965 (_ BitVec 64)) (_2!3965 V!17219)) )
))
(declare-datatypes ((List!7978 0))(
  ( (Nil!7975) (Cons!7974 (h!8830 tuple2!7908) (t!13740 List!7978)) )
))
(declare-datatypes ((ListLongMap!6823 0))(
  ( (ListLongMap!6824 (toList!3427 List!7978)) )
))
(declare-fun lt!204934 () ListLongMap!6823)

(declare-fun zeroValue!515 () V!17219)

(declare-fun +!1554 (ListLongMap!6823 tuple2!7908) ListLongMap!6823)

(declare-fun getCurrentListMapNoExtraKeys!1656 (array!27972 array!27970 (_ BitVec 32) (_ BitVec 32) V!17219 V!17219 (_ BitVec 32) Int) ListLongMap!6823)

(declare-fun get!6623 (ValueCell!5699 V!17219) V!17219)

(declare-fun dynLambda!856 (Int (_ BitVec 64)) V!17219)

(assert (=> b!451348 (= lt!204934 (+!1554 (getCurrentListMapNoExtraKeys!1656 lt!204931 lt!204933 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7909 (select (arr!13430 lt!204931) from!863) (get!6623 (select (arr!13429 lt!204933) from!863) (dynLambda!856 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!19764 () Bool)

(declare-fun mapRes!19764 () Bool)

(declare-fun tp!38064 () Bool)

(declare-fun e!264404 () Bool)

(assert (=> mapNonEmpty!19764 (= mapRes!19764 (and tp!38064 e!264404))))

(declare-fun mapValue!19764 () ValueCell!5699)

(declare-fun mapRest!19764 () (Array (_ BitVec 32) ValueCell!5699))

(declare-fun mapKey!19764 () (_ BitVec 32))

(assert (=> mapNonEmpty!19764 (= (arr!13429 _values!549) (store mapRest!19764 mapKey!19764 mapValue!19764))))

(declare-fun b!451349 () Bool)

(declare-fun e!264403 () Bool)

(declare-fun call!29841 () ListLongMap!6823)

(declare-fun call!29840 () ListLongMap!6823)

(assert (=> b!451349 (= e!264403 (= call!29841 call!29840))))

(declare-fun b!451350 () Bool)

(declare-fun e!264407 () Bool)

(declare-fun e!264405 () Bool)

(assert (=> b!451350 (= e!264407 e!264405)))

(declare-fun res!268746 () Bool)

(assert (=> b!451350 (=> (not res!268746) (not e!264405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27972 (_ BitVec 32)) Bool)

(assert (=> b!451350 (= res!268746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204931 mask!1025))))

(declare-fun _keys!709 () array!27972)

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!451350 (= lt!204931 (array!27973 (store (arr!13430 _keys!709) i!563 k0!794) (size!13782 _keys!709)))))

(declare-fun res!268743 () Bool)

(assert (=> start!40744 (=> (not res!268743) (not e!264407))))

(assert (=> start!40744 (= res!268743 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13782 _keys!709))))))

(assert (=> start!40744 e!264407))

(declare-fun tp_is_empty!12085 () Bool)

(assert (=> start!40744 tp_is_empty!12085))

(assert (=> start!40744 tp!38063))

(assert (=> start!40744 true))

(declare-fun e!264400 () Bool)

(declare-fun array_inv!9804 (array!27970) Bool)

(assert (=> start!40744 (and (array_inv!9804 _values!549) e!264400)))

(declare-fun array_inv!9805 (array!27972) Bool)

(assert (=> start!40744 (array_inv!9805 _keys!709)))

(declare-fun bm!29837 () Bool)

(declare-fun c!56042 () Bool)

(assert (=> bm!29837 (= call!29841 (getCurrentListMapNoExtraKeys!1656 (ite c!56042 _keys!709 lt!204931) (ite c!56042 _values!549 lt!204933) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451351 () Bool)

(declare-fun res!268747 () Bool)

(assert (=> b!451351 (=> (not res!268747) (not e!264407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451351 (= res!268747 (validMask!0 mask!1025))))

(declare-fun b!451352 () Bool)

(declare-fun res!268744 () Bool)

(assert (=> b!451352 (=> (not res!268744) (not e!264405))))

(assert (=> b!451352 (= res!268744 (bvsle from!863 i!563))))

(declare-fun b!451353 () Bool)

(declare-fun res!268754 () Bool)

(assert (=> b!451353 (=> (not res!268754) (not e!264407))))

(assert (=> b!451353 (= res!268754 (or (= (select (arr!13430 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13430 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun v!412 () V!17219)

(declare-fun b!451354 () Bool)

(assert (=> b!451354 (= e!264403 (= call!29840 (+!1554 call!29841 (tuple2!7909 k0!794 v!412))))))

(declare-fun b!451355 () Bool)

(declare-fun res!268749 () Bool)

(assert (=> b!451355 (=> (not res!268749) (not e!264407))))

(assert (=> b!451355 (= res!268749 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13782 _keys!709))))))

(declare-fun bm!29838 () Bool)

(assert (=> bm!29838 (= call!29840 (getCurrentListMapNoExtraKeys!1656 (ite c!56042 lt!204931 _keys!709) (ite c!56042 lt!204933 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451356 () Bool)

(declare-fun res!268748 () Bool)

(assert (=> b!451356 (=> (not res!268748) (not e!264407))))

(declare-fun arrayContainsKey!0 (array!27972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451356 (= res!268748 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451357 () Bool)

(declare-fun e!264402 () Bool)

(assert (=> b!451357 (= e!264402 tp_is_empty!12085)))

(declare-fun b!451358 () Bool)

(declare-fun res!268755 () Bool)

(assert (=> b!451358 (=> (not res!268755) (not e!264407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451358 (= res!268755 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19764 () Bool)

(assert (=> mapIsEmpty!19764 mapRes!19764))

(declare-fun b!451359 () Bool)

(declare-fun res!268751 () Bool)

(assert (=> b!451359 (=> (not res!268751) (not e!264407))))

(assert (=> b!451359 (= res!268751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451360 () Bool)

(declare-fun res!268745 () Bool)

(assert (=> b!451360 (=> (not res!268745) (not e!264407))))

(declare-datatypes ((List!7979 0))(
  ( (Nil!7976) (Cons!7975 (h!8831 (_ BitVec 64)) (t!13741 List!7979)) )
))
(declare-fun arrayNoDuplicates!0 (array!27972 (_ BitVec 32) List!7979) Bool)

(assert (=> b!451360 (= res!268745 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7976))))

(declare-fun b!451361 () Bool)

(declare-fun res!268753 () Bool)

(assert (=> b!451361 (=> (not res!268753) (not e!264405))))

(assert (=> b!451361 (= res!268753 (arrayNoDuplicates!0 lt!204931 #b00000000000000000000000000000000 Nil!7976))))

(declare-fun b!451362 () Bool)

(declare-fun res!268750 () Bool)

(assert (=> b!451362 (=> (not res!268750) (not e!264407))))

(assert (=> b!451362 (= res!268750 (and (= (size!13781 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13782 _keys!709) (size!13781 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451363 () Bool)

(declare-fun e!264401 () Bool)

(assert (=> b!451363 (= e!264405 e!264401)))

(declare-fun res!268756 () Bool)

(assert (=> b!451363 (=> (not res!268756) (not e!264401))))

(assert (=> b!451363 (= res!268756 (= from!863 i!563))))

(assert (=> b!451363 (= lt!204934 (getCurrentListMapNoExtraKeys!1656 lt!204931 lt!204933 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!451363 (= lt!204933 (array!27971 (store (arr!13429 _values!549) i!563 (ValueCellFull!5699 v!412)) (size!13781 _values!549)))))

(declare-fun lt!204935 () ListLongMap!6823)

(assert (=> b!451363 (= lt!204935 (getCurrentListMapNoExtraKeys!1656 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451364 () Bool)

(assert (=> b!451364 (= e!264400 (and e!264402 mapRes!19764))))

(declare-fun condMapEmpty!19764 () Bool)

(declare-fun mapDefault!19764 () ValueCell!5699)

(assert (=> b!451364 (= condMapEmpty!19764 (= (arr!13429 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5699)) mapDefault!19764)))))

(declare-fun b!451365 () Bool)

(assert (=> b!451365 (= e!264404 tp_is_empty!12085)))

(declare-fun b!451366 () Bool)

(assert (=> b!451366 (= e!264401 (not e!264406))))

(declare-fun res!268752 () Bool)

(assert (=> b!451366 (=> res!268752 e!264406)))

(assert (=> b!451366 (= res!268752 (validKeyInArray!0 (select (arr!13430 _keys!709) from!863)))))

(assert (=> b!451366 e!264403))

(assert (=> b!451366 (= c!56042 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13189 0))(
  ( (Unit!13190) )
))
(declare-fun lt!204932 () Unit!13189)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!715 (array!27972 array!27970 (_ BitVec 32) (_ BitVec 32) V!17219 V!17219 (_ BitVec 32) (_ BitVec 64) V!17219 (_ BitVec 32) Int) Unit!13189)

(assert (=> b!451366 (= lt!204932 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!715 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40744 res!268743) b!451351))

(assert (= (and b!451351 res!268747) b!451362))

(assert (= (and b!451362 res!268750) b!451359))

(assert (= (and b!451359 res!268751) b!451360))

(assert (= (and b!451360 res!268745) b!451355))

(assert (= (and b!451355 res!268749) b!451358))

(assert (= (and b!451358 res!268755) b!451353))

(assert (= (and b!451353 res!268754) b!451356))

(assert (= (and b!451356 res!268748) b!451350))

(assert (= (and b!451350 res!268746) b!451361))

(assert (= (and b!451361 res!268753) b!451352))

(assert (= (and b!451352 res!268744) b!451363))

(assert (= (and b!451363 res!268756) b!451366))

(assert (= (and b!451366 c!56042) b!451354))

(assert (= (and b!451366 (not c!56042)) b!451349))

(assert (= (or b!451354 b!451349) bm!29838))

(assert (= (or b!451354 b!451349) bm!29837))

(assert (= (and b!451366 (not res!268752)) b!451348))

(assert (= (and b!451364 condMapEmpty!19764) mapIsEmpty!19764))

(assert (= (and b!451364 (not condMapEmpty!19764)) mapNonEmpty!19764))

(get-info :version)

(assert (= (and mapNonEmpty!19764 ((_ is ValueCellFull!5699) mapValue!19764)) b!451365))

(assert (= (and b!451364 ((_ is ValueCellFull!5699) mapDefault!19764)) b!451357))

(assert (= start!40744 b!451364))

(declare-fun b_lambda!9539 () Bool)

(assert (=> (not b_lambda!9539) (not b!451348)))

(declare-fun t!13739 () Bool)

(declare-fun tb!3719 () Bool)

(assert (=> (and start!40744 (= defaultEntry!557 defaultEntry!557) t!13739) tb!3719))

(declare-fun result!6983 () Bool)

(assert (=> tb!3719 (= result!6983 tp_is_empty!12085)))

(assert (=> b!451348 t!13739))

(declare-fun b_and!18793 () Bool)

(assert (= b_and!18791 (and (=> t!13739 result!6983) b_and!18793)))

(declare-fun m!435371 () Bool)

(assert (=> b!451353 m!435371))

(declare-fun m!435373 () Bool)

(assert (=> b!451354 m!435373))

(declare-fun m!435375 () Bool)

(assert (=> bm!29838 m!435375))

(declare-fun m!435377 () Bool)

(assert (=> b!451361 m!435377))

(declare-fun m!435379 () Bool)

(assert (=> b!451350 m!435379))

(declare-fun m!435381 () Bool)

(assert (=> b!451350 m!435381))

(declare-fun m!435383 () Bool)

(assert (=> start!40744 m!435383))

(declare-fun m!435385 () Bool)

(assert (=> start!40744 m!435385))

(declare-fun m!435387 () Bool)

(assert (=> mapNonEmpty!19764 m!435387))

(declare-fun m!435389 () Bool)

(assert (=> b!451360 m!435389))

(declare-fun m!435391 () Bool)

(assert (=> b!451366 m!435391))

(assert (=> b!451366 m!435391))

(declare-fun m!435393 () Bool)

(assert (=> b!451366 m!435393))

(declare-fun m!435395 () Bool)

(assert (=> b!451366 m!435395))

(declare-fun m!435397 () Bool)

(assert (=> b!451359 m!435397))

(declare-fun m!435399 () Bool)

(assert (=> b!451358 m!435399))

(declare-fun m!435401 () Bool)

(assert (=> b!451351 m!435401))

(declare-fun m!435403 () Bool)

(assert (=> b!451348 m!435403))

(declare-fun m!435405 () Bool)

(assert (=> b!451348 m!435405))

(declare-fun m!435407 () Bool)

(assert (=> b!451348 m!435407))

(declare-fun m!435409 () Bool)

(assert (=> b!451348 m!435409))

(assert (=> b!451348 m!435407))

(declare-fun m!435411 () Bool)

(assert (=> b!451348 m!435411))

(assert (=> b!451348 m!435403))

(declare-fun m!435413 () Bool)

(assert (=> b!451348 m!435413))

(assert (=> b!451348 m!435405))

(declare-fun m!435415 () Bool)

(assert (=> bm!29837 m!435415))

(declare-fun m!435417 () Bool)

(assert (=> b!451363 m!435417))

(declare-fun m!435419 () Bool)

(assert (=> b!451363 m!435419))

(declare-fun m!435421 () Bool)

(assert (=> b!451363 m!435421))

(declare-fun m!435423 () Bool)

(assert (=> b!451356 m!435423))

(check-sat (not b!451363) tp_is_empty!12085 b_and!18793 (not b_lambda!9539) (not b_next!10747) (not bm!29838) (not b!451360) (not b!451366) (not b!451358) (not b!451356) (not b!451350) (not mapNonEmpty!19764) (not bm!29837) (not start!40744) (not b!451351) (not b!451359) (not b!451361) (not b!451354) (not b!451348))
(check-sat b_and!18793 (not b_next!10747))
