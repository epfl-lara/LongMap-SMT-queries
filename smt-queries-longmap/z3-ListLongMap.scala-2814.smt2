; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40780 () Bool)

(assert start!40780)

(declare-fun b_free!10783 () Bool)

(declare-fun b_next!10783 () Bool)

(assert (=> start!40780 (= b_free!10783 (not b_next!10783))))

(declare-fun tp!38171 () Bool)

(declare-fun b_and!18863 () Bool)

(assert (=> start!40780 (= tp!38171 b_and!18863)))

(declare-fun res!269504 () Bool)

(declare-fun e!264890 () Bool)

(assert (=> start!40780 (=> (not res!269504) (not e!264890))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28038 0))(
  ( (array!28039 (arr!13463 (Array (_ BitVec 32) (_ BitVec 64))) (size!13815 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28038)

(assert (=> start!40780 (= res!269504 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13815 _keys!709))))))

(assert (=> start!40780 e!264890))

(declare-fun tp_is_empty!12121 () Bool)

(assert (=> start!40780 tp_is_empty!12121))

(assert (=> start!40780 tp!38171))

(assert (=> start!40780 true))

(declare-datatypes ((V!17267 0))(
  ( (V!17268 (val!6105 Int)) )
))
(declare-datatypes ((ValueCell!5717 0))(
  ( (ValueCellFull!5717 (v!8365 V!17267)) (EmptyCell!5717) )
))
(declare-datatypes ((array!28040 0))(
  ( (array!28041 (arr!13464 (Array (_ BitVec 32) ValueCell!5717)) (size!13816 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28040)

(declare-fun e!264885 () Bool)

(declare-fun array_inv!9830 (array!28040) Bool)

(assert (=> start!40780 (and (array_inv!9830 _values!549) e!264885)))

(declare-fun array_inv!9831 (array!28038) Bool)

(assert (=> start!40780 (array_inv!9831 _keys!709)))

(declare-fun b!452410 () Bool)

(declare-fun e!264891 () Bool)

(declare-fun e!264892 () Bool)

(assert (=> b!452410 (= e!264891 (not e!264892))))

(declare-fun res!269510 () Bool)

(assert (=> b!452410 (=> res!269510 e!264892)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452410 (= res!269510 (validKeyInArray!0 (select (arr!13463 _keys!709) from!863)))))

(declare-fun e!264886 () Bool)

(assert (=> b!452410 e!264886))

(declare-fun c!56096 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452410 (= c!56096 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!17267)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17267)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!13213 0))(
  ( (Unit!13214) )
))
(declare-fun lt!205276 () Unit!13213)

(declare-fun v!412 () V!17267)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!727 (array!28038 array!28040 (_ BitVec 32) (_ BitVec 32) V!17267 V!17267 (_ BitVec 32) (_ BitVec 64) V!17267 (_ BitVec 32) Int) Unit!13213)

(assert (=> b!452410 (= lt!205276 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!727 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452411 () Bool)

(declare-fun e!264893 () Bool)

(assert (=> b!452411 (= e!264893 tp_is_empty!12121)))

(declare-fun b!452412 () Bool)

(declare-fun res!269507 () Bool)

(assert (=> b!452412 (=> (not res!269507) (not e!264890))))

(assert (=> b!452412 (= res!269507 (and (= (size!13816 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13815 _keys!709) (size!13816 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452413 () Bool)

(declare-fun e!264887 () Bool)

(assert (=> b!452413 (= e!264887 tp_is_empty!12121)))

(declare-fun b!452414 () Bool)

(assert (=> b!452414 (= e!264892 (bvslt i!563 (size!13816 _values!549)))))

(declare-datatypes ((tuple2!7938 0))(
  ( (tuple2!7939 (_1!3980 (_ BitVec 64)) (_2!3980 V!17267)) )
))
(declare-datatypes ((List!8006 0))(
  ( (Nil!8003) (Cons!8002 (h!8858 tuple2!7938) (t!13804 List!8006)) )
))
(declare-datatypes ((ListLongMap!6853 0))(
  ( (ListLongMap!6854 (toList!3442 List!8006)) )
))
(declare-fun lt!205270 () ListLongMap!6853)

(declare-fun lt!205268 () tuple2!7938)

(declare-fun lt!205271 () V!17267)

(declare-fun +!1567 (ListLongMap!6853 tuple2!7938) ListLongMap!6853)

(assert (=> b!452414 (= (+!1567 lt!205270 lt!205268) (+!1567 (+!1567 lt!205270 (tuple2!7939 k0!794 lt!205271)) lt!205268))))

(declare-fun lt!205272 () V!17267)

(assert (=> b!452414 (= lt!205268 (tuple2!7939 k0!794 lt!205272))))

(declare-fun lt!205277 () Unit!13213)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!83 (ListLongMap!6853 (_ BitVec 64) V!17267 V!17267) Unit!13213)

(assert (=> b!452414 (= lt!205277 (addSameAsAddTwiceSameKeyDiffValues!83 lt!205270 k0!794 lt!205271 lt!205272))))

(declare-fun lt!205267 () V!17267)

(declare-fun get!6644 (ValueCell!5717 V!17267) V!17267)

(assert (=> b!452414 (= lt!205271 (get!6644 (select (arr!13464 _values!549) from!863) lt!205267))))

(declare-fun lt!205275 () array!28038)

(declare-fun lt!205273 () ListLongMap!6853)

(assert (=> b!452414 (= lt!205273 (+!1567 lt!205270 (tuple2!7939 (select (arr!13463 lt!205275) from!863) lt!205272)))))

(assert (=> b!452414 (= lt!205272 (get!6644 (select (store (arr!13464 _values!549) i!563 (ValueCellFull!5717 v!412)) from!863) lt!205267))))

(declare-fun dynLambda!865 (Int (_ BitVec 64)) V!17267)

(assert (=> b!452414 (= lt!205267 (dynLambda!865 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!205269 () array!28040)

(declare-fun getCurrentListMapNoExtraKeys!1671 (array!28038 array!28040 (_ BitVec 32) (_ BitVec 32) V!17267 V!17267 (_ BitVec 32) Int) ListLongMap!6853)

(assert (=> b!452414 (= lt!205270 (getCurrentListMapNoExtraKeys!1671 lt!205275 lt!205269 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452415 () Bool)

(declare-fun mapRes!19818 () Bool)

(assert (=> b!452415 (= e!264885 (and e!264893 mapRes!19818))))

(declare-fun condMapEmpty!19818 () Bool)

(declare-fun mapDefault!19818 () ValueCell!5717)

(assert (=> b!452415 (= condMapEmpty!19818 (= (arr!13464 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5717)) mapDefault!19818)))))

(declare-fun b!452416 () Bool)

(declare-fun res!269512 () Bool)

(assert (=> b!452416 (=> (not res!269512) (not e!264890))))

(assert (=> b!452416 (= res!269512 (or (= (select (arr!13463 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13463 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452417 () Bool)

(declare-fun call!29949 () ListLongMap!6853)

(declare-fun call!29948 () ListLongMap!6853)

(assert (=> b!452417 (= e!264886 (= call!29949 call!29948))))

(declare-fun b!452418 () Bool)

(declare-fun res!269509 () Bool)

(declare-fun e!264888 () Bool)

(assert (=> b!452418 (=> (not res!269509) (not e!264888))))

(declare-datatypes ((List!8007 0))(
  ( (Nil!8004) (Cons!8003 (h!8859 (_ BitVec 64)) (t!13805 List!8007)) )
))
(declare-fun arrayNoDuplicates!0 (array!28038 (_ BitVec 32) List!8007) Bool)

(assert (=> b!452418 (= res!269509 (arrayNoDuplicates!0 lt!205275 #b00000000000000000000000000000000 Nil!8004))))

(declare-fun mapNonEmpty!19818 () Bool)

(declare-fun tp!38172 () Bool)

(assert (=> mapNonEmpty!19818 (= mapRes!19818 (and tp!38172 e!264887))))

(declare-fun mapValue!19818 () ValueCell!5717)

(declare-fun mapKey!19818 () (_ BitVec 32))

(declare-fun mapRest!19818 () (Array (_ BitVec 32) ValueCell!5717))

(assert (=> mapNonEmpty!19818 (= (arr!13464 _values!549) (store mapRest!19818 mapKey!19818 mapValue!19818))))

(declare-fun b!452419 () Bool)

(declare-fun res!269499 () Bool)

(assert (=> b!452419 (=> (not res!269499) (not e!264890))))

(declare-fun arrayContainsKey!0 (array!28038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452419 (= res!269499 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452420 () Bool)

(declare-fun res!269502 () Bool)

(assert (=> b!452420 (=> (not res!269502) (not e!264890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452420 (= res!269502 (validMask!0 mask!1025))))

(declare-fun b!452421 () Bool)

(assert (=> b!452421 (= e!264890 e!264888)))

(declare-fun res!269511 () Bool)

(assert (=> b!452421 (=> (not res!269511) (not e!264888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28038 (_ BitVec 32)) Bool)

(assert (=> b!452421 (= res!269511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205275 mask!1025))))

(assert (=> b!452421 (= lt!205275 (array!28039 (store (arr!13463 _keys!709) i!563 k0!794) (size!13815 _keys!709)))))

(declare-fun bm!29945 () Bool)

(assert (=> bm!29945 (= call!29949 (getCurrentListMapNoExtraKeys!1671 (ite c!56096 _keys!709 lt!205275) (ite c!56096 _values!549 lt!205269) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452422 () Bool)

(declare-fun res!269506 () Bool)

(assert (=> b!452422 (=> (not res!269506) (not e!264890))))

(assert (=> b!452422 (= res!269506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452423 () Bool)

(declare-fun res!269503 () Bool)

(assert (=> b!452423 (=> (not res!269503) (not e!264888))))

(assert (=> b!452423 (= res!269503 (bvsle from!863 i!563))))

(declare-fun b!452424 () Bool)

(declare-fun res!269508 () Bool)

(assert (=> b!452424 (=> (not res!269508) (not e!264890))))

(assert (=> b!452424 (= res!269508 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8004))))

(declare-fun b!452425 () Bool)

(declare-fun res!269500 () Bool)

(assert (=> b!452425 (=> (not res!269500) (not e!264890))))

(assert (=> b!452425 (= res!269500 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19818 () Bool)

(assert (=> mapIsEmpty!19818 mapRes!19818))

(declare-fun b!452426 () Bool)

(assert (=> b!452426 (= e!264888 e!264891)))

(declare-fun res!269505 () Bool)

(assert (=> b!452426 (=> (not res!269505) (not e!264891))))

(assert (=> b!452426 (= res!269505 (= from!863 i!563))))

(assert (=> b!452426 (= lt!205273 (getCurrentListMapNoExtraKeys!1671 lt!205275 lt!205269 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452426 (= lt!205269 (array!28041 (store (arr!13464 _values!549) i!563 (ValueCellFull!5717 v!412)) (size!13816 _values!549)))))

(declare-fun lt!205274 () ListLongMap!6853)

(assert (=> b!452426 (= lt!205274 (getCurrentListMapNoExtraKeys!1671 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!29946 () Bool)

(assert (=> bm!29946 (= call!29948 (getCurrentListMapNoExtraKeys!1671 (ite c!56096 lt!205275 _keys!709) (ite c!56096 lt!205269 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452427 () Bool)

(declare-fun res!269501 () Bool)

(assert (=> b!452427 (=> (not res!269501) (not e!264890))))

(assert (=> b!452427 (= res!269501 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13815 _keys!709))))))

(declare-fun b!452428 () Bool)

(assert (=> b!452428 (= e!264886 (= call!29948 (+!1567 call!29949 (tuple2!7939 k0!794 v!412))))))

(assert (= (and start!40780 res!269504) b!452420))

(assert (= (and b!452420 res!269502) b!452412))

(assert (= (and b!452412 res!269507) b!452422))

(assert (= (and b!452422 res!269506) b!452424))

(assert (= (and b!452424 res!269508) b!452427))

(assert (= (and b!452427 res!269501) b!452425))

(assert (= (and b!452425 res!269500) b!452416))

(assert (= (and b!452416 res!269512) b!452419))

(assert (= (and b!452419 res!269499) b!452421))

(assert (= (and b!452421 res!269511) b!452418))

(assert (= (and b!452418 res!269509) b!452423))

(assert (= (and b!452423 res!269503) b!452426))

(assert (= (and b!452426 res!269505) b!452410))

(assert (= (and b!452410 c!56096) b!452428))

(assert (= (and b!452410 (not c!56096)) b!452417))

(assert (= (or b!452428 b!452417) bm!29946))

(assert (= (or b!452428 b!452417) bm!29945))

(assert (= (and b!452410 (not res!269510)) b!452414))

(assert (= (and b!452415 condMapEmpty!19818) mapIsEmpty!19818))

(assert (= (and b!452415 (not condMapEmpty!19818)) mapNonEmpty!19818))

(get-info :version)

(assert (= (and mapNonEmpty!19818 ((_ is ValueCellFull!5717) mapValue!19818)) b!452413))

(assert (= (and b!452415 ((_ is ValueCellFull!5717) mapDefault!19818)) b!452411))

(assert (= start!40780 b!452415))

(declare-fun b_lambda!9575 () Bool)

(assert (=> (not b_lambda!9575) (not b!452414)))

(declare-fun t!13803 () Bool)

(declare-fun tb!3755 () Bool)

(assert (=> (and start!40780 (= defaultEntry!557 defaultEntry!557) t!13803) tb!3755))

(declare-fun result!7055 () Bool)

(assert (=> tb!3755 (= result!7055 tp_is_empty!12121)))

(assert (=> b!452414 t!13803))

(declare-fun b_and!18865 () Bool)

(assert (= b_and!18863 (and (=> t!13803 result!7055) b_and!18865)))

(declare-fun m!436377 () Bool)

(assert (=> b!452416 m!436377))

(declare-fun m!436379 () Bool)

(assert (=> b!452424 m!436379))

(declare-fun m!436381 () Bool)

(assert (=> b!452428 m!436381))

(declare-fun m!436383 () Bool)

(assert (=> b!452418 m!436383))

(declare-fun m!436385 () Bool)

(assert (=> bm!29946 m!436385))

(declare-fun m!436387 () Bool)

(assert (=> b!452421 m!436387))

(declare-fun m!436389 () Bool)

(assert (=> b!452421 m!436389))

(declare-fun m!436391 () Bool)

(assert (=> mapNonEmpty!19818 m!436391))

(declare-fun m!436393 () Bool)

(assert (=> b!452425 m!436393))

(declare-fun m!436395 () Bool)

(assert (=> b!452414 m!436395))

(declare-fun m!436397 () Bool)

(assert (=> b!452414 m!436397))

(declare-fun m!436399 () Bool)

(assert (=> b!452414 m!436399))

(declare-fun m!436401 () Bool)

(assert (=> b!452414 m!436401))

(declare-fun m!436403 () Bool)

(assert (=> b!452414 m!436403))

(assert (=> b!452414 m!436395))

(declare-fun m!436405 () Bool)

(assert (=> b!452414 m!436405))

(declare-fun m!436407 () Bool)

(assert (=> b!452414 m!436407))

(declare-fun m!436409 () Bool)

(assert (=> b!452414 m!436409))

(declare-fun m!436411 () Bool)

(assert (=> b!452414 m!436411))

(declare-fun m!436413 () Bool)

(assert (=> b!452414 m!436413))

(assert (=> b!452414 m!436405))

(declare-fun m!436415 () Bool)

(assert (=> b!452414 m!436415))

(assert (=> b!452414 m!436409))

(declare-fun m!436417 () Bool)

(assert (=> b!452414 m!436417))

(declare-fun m!436419 () Bool)

(assert (=> b!452414 m!436419))

(declare-fun m!436421 () Bool)

(assert (=> b!452420 m!436421))

(declare-fun m!436423 () Bool)

(assert (=> b!452419 m!436423))

(declare-fun m!436425 () Bool)

(assert (=> bm!29945 m!436425))

(declare-fun m!436427 () Bool)

(assert (=> b!452422 m!436427))

(declare-fun m!436429 () Bool)

(assert (=> b!452426 m!436429))

(assert (=> b!452426 m!436411))

(declare-fun m!436431 () Bool)

(assert (=> b!452426 m!436431))

(declare-fun m!436433 () Bool)

(assert (=> b!452410 m!436433))

(assert (=> b!452410 m!436433))

(declare-fun m!436435 () Bool)

(assert (=> b!452410 m!436435))

(declare-fun m!436437 () Bool)

(assert (=> b!452410 m!436437))

(declare-fun m!436439 () Bool)

(assert (=> start!40780 m!436439))

(declare-fun m!436441 () Bool)

(assert (=> start!40780 m!436441))

(check-sat (not b_next!10783) (not b_lambda!9575) (not mapNonEmpty!19818) (not b!452426) (not b!452425) (not b!452421) (not start!40780) (not b!452428) (not b!452410) (not bm!29945) b_and!18865 (not b!452414) (not b!452422) (not b!452419) (not b!452420) (not b!452424) tp_is_empty!12121 (not b!452418) (not bm!29946))
(check-sat b_and!18865 (not b_next!10783))
