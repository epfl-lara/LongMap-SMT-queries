; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40692 () Bool)

(assert start!40692)

(declare-fun b_free!10717 () Bool)

(declare-fun b_next!10717 () Bool)

(assert (=> start!40692 (= b_free!10717 (not b_next!10717))))

(declare-fun tp!37970 () Bool)

(declare-fun b_and!18739 () Bool)

(assert (=> start!40692 (= tp!37970 b_and!18739)))

(declare-datatypes ((V!17179 0))(
  ( (V!17180 (val!6072 Int)) )
))
(declare-datatypes ((tuple2!7880 0))(
  ( (tuple2!7881 (_1!3951 (_ BitVec 64)) (_2!3951 V!17179)) )
))
(declare-datatypes ((List!7952 0))(
  ( (Nil!7949) (Cons!7948 (h!8804 tuple2!7880) (t!13706 List!7952)) )
))
(declare-datatypes ((ListLongMap!6795 0))(
  ( (ListLongMap!6796 (toList!3413 List!7952)) )
))
(declare-fun call!29731 () ListLongMap!6795)

(declare-fun b!450349 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!263910 () Bool)

(declare-fun v!412 () V!17179)

(declare-fun call!29730 () ListLongMap!6795)

(declare-fun +!1542 (ListLongMap!6795 tuple2!7880) ListLongMap!6795)

(assert (=> b!450349 (= e!263910 (= call!29730 (+!1542 call!29731 (tuple2!7881 k0!794 v!412))))))

(declare-fun mapNonEmpty!19716 () Bool)

(declare-fun mapRes!19716 () Bool)

(declare-fun tp!37971 () Bool)

(declare-fun e!263911 () Bool)

(assert (=> mapNonEmpty!19716 (= mapRes!19716 (and tp!37971 e!263911))))

(declare-datatypes ((ValueCell!5684 0))(
  ( (ValueCellFull!5684 (v!8328 V!17179)) (EmptyCell!5684) )
))
(declare-fun mapValue!19716 () ValueCell!5684)

(declare-fun mapRest!19716 () (Array (_ BitVec 32) ValueCell!5684))

(declare-datatypes ((array!27910 0))(
  ( (array!27911 (arr!13400 (Array (_ BitVec 32) ValueCell!5684)) (size!13752 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27910)

(declare-fun mapKey!19716 () (_ BitVec 32))

(assert (=> mapNonEmpty!19716 (= (arr!13400 _values!549) (store mapRest!19716 mapKey!19716 mapValue!19716))))

(declare-fun b!450350 () Bool)

(declare-fun e!263913 () Bool)

(declare-fun e!263909 () Bool)

(assert (=> b!450350 (= e!263913 e!263909)))

(declare-fun res!268060 () Bool)

(assert (=> b!450350 (=> (not res!268060) (not e!263909))))

(declare-datatypes ((array!27912 0))(
  ( (array!27913 (arr!13401 (Array (_ BitVec 32) (_ BitVec 64))) (size!13753 (_ BitVec 32))) )
))
(declare-fun lt!204617 () array!27912)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27912 (_ BitVec 32)) Bool)

(assert (=> b!450350 (= res!268060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204617 mask!1025))))

(declare-fun _keys!709 () array!27912)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450350 (= lt!204617 (array!27913 (store (arr!13401 _keys!709) i!563 k0!794) (size!13753 _keys!709)))))

(declare-fun res!268068 () Bool)

(assert (=> start!40692 (=> (not res!268068) (not e!263913))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40692 (= res!268068 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13753 _keys!709))))))

(assert (=> start!40692 e!263913))

(declare-fun tp_is_empty!12055 () Bool)

(assert (=> start!40692 tp_is_empty!12055))

(assert (=> start!40692 tp!37970))

(assert (=> start!40692 true))

(declare-fun e!263908 () Bool)

(declare-fun array_inv!9786 (array!27910) Bool)

(assert (=> start!40692 (and (array_inv!9786 _values!549) e!263908)))

(declare-fun array_inv!9787 (array!27912) Bool)

(assert (=> start!40692 (array_inv!9787 _keys!709)))

(declare-fun b!450351 () Bool)

(declare-fun e!263907 () Bool)

(assert (=> b!450351 (= e!263907 (not true))))

(assert (=> b!450351 e!263910))

(declare-fun c!55959 () Bool)

(assert (=> b!450351 (= c!55959 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!17179)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!13169 0))(
  ( (Unit!13170) )
))
(declare-fun lt!204619 () Unit!13169)

(declare-fun zeroValue!515 () V!17179)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!705 (array!27912 array!27910 (_ BitVec 32) (_ BitVec 32) V!17179 V!17179 (_ BitVec 32) (_ BitVec 64) V!17179 (_ BitVec 32) Int) Unit!13169)

(assert (=> b!450351 (= lt!204619 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!705 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450352 () Bool)

(declare-fun res!268067 () Bool)

(assert (=> b!450352 (=> (not res!268067) (not e!263909))))

(declare-datatypes ((List!7953 0))(
  ( (Nil!7950) (Cons!7949 (h!8805 (_ BitVec 64)) (t!13707 List!7953)) )
))
(declare-fun arrayNoDuplicates!0 (array!27912 (_ BitVec 32) List!7953) Bool)

(assert (=> b!450352 (= res!268067 (arrayNoDuplicates!0 lt!204617 #b00000000000000000000000000000000 Nil!7950))))

(declare-fun b!450353 () Bool)

(declare-fun res!268062 () Bool)

(assert (=> b!450353 (=> (not res!268062) (not e!263913))))

(assert (=> b!450353 (= res!268062 (and (= (size!13752 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13753 _keys!709) (size!13752 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450354 () Bool)

(assert (=> b!450354 (= e!263911 tp_is_empty!12055)))

(declare-fun b!450355 () Bool)

(declare-fun res!268069 () Bool)

(assert (=> b!450355 (=> (not res!268069) (not e!263909))))

(assert (=> b!450355 (= res!268069 (bvsle from!863 i!563))))

(declare-fun b!450356 () Bool)

(declare-fun res!268070 () Bool)

(assert (=> b!450356 (=> (not res!268070) (not e!263913))))

(assert (=> b!450356 (= res!268070 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13753 _keys!709))))))

(declare-fun b!450357 () Bool)

(declare-fun res!268071 () Bool)

(assert (=> b!450357 (=> (not res!268071) (not e!263913))))

(declare-fun arrayContainsKey!0 (array!27912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450357 (= res!268071 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun lt!204616 () array!27910)

(declare-fun bm!29727 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1643 (array!27912 array!27910 (_ BitVec 32) (_ BitVec 32) V!17179 V!17179 (_ BitVec 32) Int) ListLongMap!6795)

(assert (=> bm!29727 (= call!29731 (getCurrentListMapNoExtraKeys!1643 (ite c!55959 _keys!709 lt!204617) (ite c!55959 _values!549 lt!204616) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450358 () Bool)

(declare-fun e!263906 () Bool)

(assert (=> b!450358 (= e!263908 (and e!263906 mapRes!19716))))

(declare-fun condMapEmpty!19716 () Bool)

(declare-fun mapDefault!19716 () ValueCell!5684)

(assert (=> b!450358 (= condMapEmpty!19716 (= (arr!13400 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5684)) mapDefault!19716)))))

(declare-fun mapIsEmpty!19716 () Bool)

(assert (=> mapIsEmpty!19716 mapRes!19716))

(declare-fun bm!29728 () Bool)

(assert (=> bm!29728 (= call!29730 (getCurrentListMapNoExtraKeys!1643 (ite c!55959 lt!204617 _keys!709) (ite c!55959 lt!204616 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450359 () Bool)

(declare-fun res!268063 () Bool)

(assert (=> b!450359 (=> (not res!268063) (not e!263913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450359 (= res!268063 (validMask!0 mask!1025))))

(declare-fun b!450360 () Bool)

(declare-fun res!268059 () Bool)

(assert (=> b!450360 (=> (not res!268059) (not e!263913))))

(assert (=> b!450360 (= res!268059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450361 () Bool)

(assert (=> b!450361 (= e!263909 e!263907)))

(declare-fun res!268064 () Bool)

(assert (=> b!450361 (=> (not res!268064) (not e!263907))))

(assert (=> b!450361 (= res!268064 (= from!863 i!563))))

(declare-fun lt!204615 () ListLongMap!6795)

(assert (=> b!450361 (= lt!204615 (getCurrentListMapNoExtraKeys!1643 lt!204617 lt!204616 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!450361 (= lt!204616 (array!27911 (store (arr!13400 _values!549) i!563 (ValueCellFull!5684 v!412)) (size!13752 _values!549)))))

(declare-fun lt!204618 () ListLongMap!6795)

(assert (=> b!450361 (= lt!204618 (getCurrentListMapNoExtraKeys!1643 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450362 () Bool)

(assert (=> b!450362 (= e!263906 tp_is_empty!12055)))

(declare-fun b!450363 () Bool)

(declare-fun res!268061 () Bool)

(assert (=> b!450363 (=> (not res!268061) (not e!263913))))

(assert (=> b!450363 (= res!268061 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7950))))

(declare-fun b!450364 () Bool)

(declare-fun res!268066 () Bool)

(assert (=> b!450364 (=> (not res!268066) (not e!263913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450364 (= res!268066 (validKeyInArray!0 k0!794))))

(declare-fun b!450365 () Bool)

(assert (=> b!450365 (= e!263910 (= call!29731 call!29730))))

(declare-fun b!450366 () Bool)

(declare-fun res!268065 () Bool)

(assert (=> b!450366 (=> (not res!268065) (not e!263913))))

(assert (=> b!450366 (= res!268065 (or (= (select (arr!13401 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13401 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40692 res!268068) b!450359))

(assert (= (and b!450359 res!268063) b!450353))

(assert (= (and b!450353 res!268062) b!450360))

(assert (= (and b!450360 res!268059) b!450363))

(assert (= (and b!450363 res!268061) b!450356))

(assert (= (and b!450356 res!268070) b!450364))

(assert (= (and b!450364 res!268066) b!450366))

(assert (= (and b!450366 res!268065) b!450357))

(assert (= (and b!450357 res!268071) b!450350))

(assert (= (and b!450350 res!268060) b!450352))

(assert (= (and b!450352 res!268067) b!450355))

(assert (= (and b!450355 res!268069) b!450361))

(assert (= (and b!450361 res!268064) b!450351))

(assert (= (and b!450351 c!55959) b!450349))

(assert (= (and b!450351 (not c!55959)) b!450365))

(assert (= (or b!450349 b!450365) bm!29728))

(assert (= (or b!450349 b!450365) bm!29727))

(assert (= (and b!450358 condMapEmpty!19716) mapIsEmpty!19716))

(assert (= (and b!450358 (not condMapEmpty!19716)) mapNonEmpty!19716))

(get-info :version)

(assert (= (and mapNonEmpty!19716 ((_ is ValueCellFull!5684) mapValue!19716)) b!450354))

(assert (= (and b!450358 ((_ is ValueCellFull!5684) mapDefault!19716)) b!450362))

(assert (= start!40692 b!450358))

(declare-fun m!434535 () Bool)

(assert (=> b!450349 m!434535))

(declare-fun m!434537 () Bool)

(assert (=> start!40692 m!434537))

(declare-fun m!434539 () Bool)

(assert (=> start!40692 m!434539))

(declare-fun m!434541 () Bool)

(assert (=> b!450359 m!434541))

(declare-fun m!434543 () Bool)

(assert (=> bm!29727 m!434543))

(declare-fun m!434545 () Bool)

(assert (=> b!450366 m!434545))

(declare-fun m!434547 () Bool)

(assert (=> b!450360 m!434547))

(declare-fun m!434549 () Bool)

(assert (=> b!450363 m!434549))

(declare-fun m!434551 () Bool)

(assert (=> b!450364 m!434551))

(declare-fun m!434553 () Bool)

(assert (=> bm!29728 m!434553))

(declare-fun m!434555 () Bool)

(assert (=> b!450351 m!434555))

(declare-fun m!434557 () Bool)

(assert (=> b!450357 m!434557))

(declare-fun m!434559 () Bool)

(assert (=> b!450352 m!434559))

(declare-fun m!434561 () Bool)

(assert (=> mapNonEmpty!19716 m!434561))

(declare-fun m!434563 () Bool)

(assert (=> b!450361 m!434563))

(declare-fun m!434565 () Bool)

(assert (=> b!450361 m!434565))

(declare-fun m!434567 () Bool)

(assert (=> b!450361 m!434567))

(declare-fun m!434569 () Bool)

(assert (=> b!450350 m!434569))

(declare-fun m!434571 () Bool)

(assert (=> b!450350 m!434571))

(check-sat (not bm!29727) (not b!450364) (not b!450349) (not b!450350) (not b!450359) b_and!18739 (not b_next!10717) (not b!450361) (not b!450360) tp_is_empty!12055 (not bm!29728) (not b!450352) (not mapNonEmpty!19716) (not b!450351) (not b!450363) (not start!40692) (not b!450357))
(check-sat b_and!18739 (not b_next!10717))
