; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40750 () Bool)

(assert start!40750)

(declare-fun b_free!10753 () Bool)

(declare-fun b_next!10753 () Bool)

(assert (=> start!40750 (= b_free!10753 (not b_next!10753))))

(declare-fun tp!38082 () Bool)

(declare-fun b_and!18803 () Bool)

(assert (=> start!40750 (= tp!38082 b_and!18803)))

(declare-fun b!451525 () Bool)

(declare-fun res!268880 () Bool)

(declare-fun e!264480 () Bool)

(assert (=> b!451525 (=> (not res!268880) (not e!264480))))

(declare-datatypes ((array!27980 0))(
  ( (array!27981 (arr!13434 (Array (_ BitVec 32) (_ BitVec 64))) (size!13786 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27980)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451525 (= res!268880 (or (= (select (arr!13434 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13434 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451526 () Bool)

(declare-fun res!268879 () Bool)

(assert (=> b!451526 (=> (not res!268879) (not e!264480))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27980 (_ BitVec 32)) Bool)

(assert (=> b!451526 (= res!268879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451527 () Bool)

(declare-fun res!268869 () Bool)

(assert (=> b!451527 (=> (not res!268869) (not e!264480))))

(declare-datatypes ((List!7982 0))(
  ( (Nil!7979) (Cons!7978 (h!8834 (_ BitVec 64)) (t!13750 List!7982)) )
))
(declare-fun arrayNoDuplicates!0 (array!27980 (_ BitVec 32) List!7982) Bool)

(assert (=> b!451527 (= res!268869 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7979))))

(declare-fun b!451528 () Bool)

(declare-fun e!264483 () Bool)

(assert (=> b!451528 (= e!264483 true)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!204977 () array!27980)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17227 0))(
  ( (V!17228 (val!6090 Int)) )
))
(declare-fun zeroValue!515 () V!17227)

(declare-datatypes ((ValueCell!5702 0))(
  ( (ValueCellFull!5702 (v!8350 V!17227)) (EmptyCell!5702) )
))
(declare-datatypes ((array!27982 0))(
  ( (array!27983 (arr!13435 (Array (_ BitVec 32) ValueCell!5702)) (size!13787 (_ BitVec 32))) )
))
(declare-fun lt!204976 () array!27982)

(declare-datatypes ((tuple2!7912 0))(
  ( (tuple2!7913 (_1!3967 (_ BitVec 64)) (_2!3967 V!17227)) )
))
(declare-datatypes ((List!7983 0))(
  ( (Nil!7980) (Cons!7979 (h!8835 tuple2!7912) (t!13751 List!7983)) )
))
(declare-datatypes ((ListLongMap!6827 0))(
  ( (ListLongMap!6828 (toList!3429 List!7983)) )
))
(declare-fun lt!204978 () ListLongMap!6827)

(declare-fun minValue!515 () V!17227)

(declare-fun +!1556 (ListLongMap!6827 tuple2!7912) ListLongMap!6827)

(declare-fun getCurrentListMapNoExtraKeys!1658 (array!27980 array!27982 (_ BitVec 32) (_ BitVec 32) V!17227 V!17227 (_ BitVec 32) Int) ListLongMap!6827)

(declare-fun get!6627 (ValueCell!5702 V!17227) V!17227)

(declare-fun dynLambda!858 (Int (_ BitVec 64)) V!17227)

(assert (=> b!451528 (= lt!204978 (+!1556 (getCurrentListMapNoExtraKeys!1658 lt!204977 lt!204976 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7913 (select (arr!13434 lt!204977) from!863) (get!6627 (select (arr!13435 lt!204976) from!863) (dynLambda!858 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451529 () Bool)

(declare-fun res!268882 () Bool)

(assert (=> b!451529 (=> (not res!268882) (not e!264480))))

(assert (=> b!451529 (= res!268882 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13786 _keys!709))))))

(declare-fun b!451530 () Bool)

(declare-fun e!264481 () Bool)

(assert (=> b!451530 (= e!264481 (not e!264483))))

(declare-fun res!268872 () Bool)

(assert (=> b!451530 (=> res!268872 e!264483)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451530 (= res!268872 (validKeyInArray!0 (select (arr!13434 _keys!709) from!863)))))

(declare-fun e!264485 () Bool)

(assert (=> b!451530 e!264485))

(declare-fun c!56051 () Bool)

(assert (=> b!451530 (= c!56051 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13191 0))(
  ( (Unit!13192) )
))
(declare-fun lt!204979 () Unit!13191)

(declare-fun _values!549 () array!27982)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17227)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!716 (array!27980 array!27982 (_ BitVec 32) (_ BitVec 32) V!17227 V!17227 (_ BitVec 32) (_ BitVec 64) V!17227 (_ BitVec 32) Int) Unit!13191)

(assert (=> b!451530 (= lt!204979 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!716 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29859 () ListLongMap!6827)

(declare-fun bm!29855 () Bool)

(assert (=> bm!29855 (= call!29859 (getCurrentListMapNoExtraKeys!1658 (ite c!56051 _keys!709 lt!204977) (ite c!56051 _values!549 lt!204976) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451531 () Bool)

(declare-fun res!268876 () Bool)

(declare-fun e!264487 () Bool)

(assert (=> b!451531 (=> (not res!268876) (not e!264487))))

(assert (=> b!451531 (= res!268876 (bvsle from!863 i!563))))

(declare-fun b!451532 () Bool)

(declare-fun call!29858 () ListLongMap!6827)

(assert (=> b!451532 (= e!264485 (= call!29858 (+!1556 call!29859 (tuple2!7913 k0!794 v!412))))))

(declare-fun b!451533 () Bool)

(assert (=> b!451533 (= e!264485 (= call!29859 call!29858))))

(declare-fun b!451534 () Bool)

(assert (=> b!451534 (= e!264480 e!264487)))

(declare-fun res!268871 () Bool)

(assert (=> b!451534 (=> (not res!268871) (not e!264487))))

(assert (=> b!451534 (= res!268871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204977 mask!1025))))

(assert (=> b!451534 (= lt!204977 (array!27981 (store (arr!13434 _keys!709) i!563 k0!794) (size!13786 _keys!709)))))

(declare-fun b!451535 () Bool)

(declare-fun res!268873 () Bool)

(assert (=> b!451535 (=> (not res!268873) (not e!264480))))

(declare-fun arrayContainsKey!0 (array!27980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451535 (= res!268873 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451536 () Bool)

(declare-fun res!268881 () Bool)

(assert (=> b!451536 (=> (not res!268881) (not e!264480))))

(assert (=> b!451536 (= res!268881 (validKeyInArray!0 k0!794))))

(declare-fun res!268877 () Bool)

(assert (=> start!40750 (=> (not res!268877) (not e!264480))))

(assert (=> start!40750 (= res!268877 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13786 _keys!709))))))

(assert (=> start!40750 e!264480))

(declare-fun tp_is_empty!12091 () Bool)

(assert (=> start!40750 tp_is_empty!12091))

(assert (=> start!40750 tp!38082))

(assert (=> start!40750 true))

(declare-fun e!264486 () Bool)

(declare-fun array_inv!9808 (array!27982) Bool)

(assert (=> start!40750 (and (array_inv!9808 _values!549) e!264486)))

(declare-fun array_inv!9809 (array!27980) Bool)

(assert (=> start!40750 (array_inv!9809 _keys!709)))

(declare-fun mapIsEmpty!19773 () Bool)

(declare-fun mapRes!19773 () Bool)

(assert (=> mapIsEmpty!19773 mapRes!19773))

(declare-fun b!451537 () Bool)

(declare-fun e!264482 () Bool)

(assert (=> b!451537 (= e!264486 (and e!264482 mapRes!19773))))

(declare-fun condMapEmpty!19773 () Bool)

(declare-fun mapDefault!19773 () ValueCell!5702)

(assert (=> b!451537 (= condMapEmpty!19773 (= (arr!13435 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5702)) mapDefault!19773)))))

(declare-fun b!451538 () Bool)

(declare-fun e!264488 () Bool)

(assert (=> b!451538 (= e!264488 tp_is_empty!12091)))

(declare-fun mapNonEmpty!19773 () Bool)

(declare-fun tp!38081 () Bool)

(assert (=> mapNonEmpty!19773 (= mapRes!19773 (and tp!38081 e!264488))))

(declare-fun mapKey!19773 () (_ BitVec 32))

(declare-fun mapValue!19773 () ValueCell!5702)

(declare-fun mapRest!19773 () (Array (_ BitVec 32) ValueCell!5702))

(assert (=> mapNonEmpty!19773 (= (arr!13435 _values!549) (store mapRest!19773 mapKey!19773 mapValue!19773))))

(declare-fun bm!29856 () Bool)

(assert (=> bm!29856 (= call!29858 (getCurrentListMapNoExtraKeys!1658 (ite c!56051 lt!204977 _keys!709) (ite c!56051 lt!204976 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451539 () Bool)

(assert (=> b!451539 (= e!264482 tp_is_empty!12091)))

(declare-fun b!451540 () Bool)

(assert (=> b!451540 (= e!264487 e!264481)))

(declare-fun res!268878 () Bool)

(assert (=> b!451540 (=> (not res!268878) (not e!264481))))

(assert (=> b!451540 (= res!268878 (= from!863 i!563))))

(assert (=> b!451540 (= lt!204978 (getCurrentListMapNoExtraKeys!1658 lt!204977 lt!204976 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!451540 (= lt!204976 (array!27983 (store (arr!13435 _values!549) i!563 (ValueCellFull!5702 v!412)) (size!13787 _values!549)))))

(declare-fun lt!204980 () ListLongMap!6827)

(assert (=> b!451540 (= lt!204980 (getCurrentListMapNoExtraKeys!1658 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451541 () Bool)

(declare-fun res!268870 () Bool)

(assert (=> b!451541 (=> (not res!268870) (not e!264480))))

(assert (=> b!451541 (= res!268870 (and (= (size!13787 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13786 _keys!709) (size!13787 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451542 () Bool)

(declare-fun res!268875 () Bool)

(assert (=> b!451542 (=> (not res!268875) (not e!264480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451542 (= res!268875 (validMask!0 mask!1025))))

(declare-fun b!451543 () Bool)

(declare-fun res!268874 () Bool)

(assert (=> b!451543 (=> (not res!268874) (not e!264487))))

(assert (=> b!451543 (= res!268874 (arrayNoDuplicates!0 lt!204977 #b00000000000000000000000000000000 Nil!7979))))

(assert (= (and start!40750 res!268877) b!451542))

(assert (= (and b!451542 res!268875) b!451541))

(assert (= (and b!451541 res!268870) b!451526))

(assert (= (and b!451526 res!268879) b!451527))

(assert (= (and b!451527 res!268869) b!451529))

(assert (= (and b!451529 res!268882) b!451536))

(assert (= (and b!451536 res!268881) b!451525))

(assert (= (and b!451525 res!268880) b!451535))

(assert (= (and b!451535 res!268873) b!451534))

(assert (= (and b!451534 res!268871) b!451543))

(assert (= (and b!451543 res!268874) b!451531))

(assert (= (and b!451531 res!268876) b!451540))

(assert (= (and b!451540 res!268878) b!451530))

(assert (= (and b!451530 c!56051) b!451532))

(assert (= (and b!451530 (not c!56051)) b!451533))

(assert (= (or b!451532 b!451533) bm!29856))

(assert (= (or b!451532 b!451533) bm!29855))

(assert (= (and b!451530 (not res!268872)) b!451528))

(assert (= (and b!451537 condMapEmpty!19773) mapIsEmpty!19773))

(assert (= (and b!451537 (not condMapEmpty!19773)) mapNonEmpty!19773))

(get-info :version)

(assert (= (and mapNonEmpty!19773 ((_ is ValueCellFull!5702) mapValue!19773)) b!451538))

(assert (= (and b!451537 ((_ is ValueCellFull!5702) mapDefault!19773)) b!451539))

(assert (= start!40750 b!451537))

(declare-fun b_lambda!9545 () Bool)

(assert (=> (not b_lambda!9545) (not b!451528)))

(declare-fun t!13749 () Bool)

(declare-fun tb!3725 () Bool)

(assert (=> (and start!40750 (= defaultEntry!557 defaultEntry!557) t!13749) tb!3725))

(declare-fun result!6995 () Bool)

(assert (=> tb!3725 (= result!6995 tp_is_empty!12091)))

(assert (=> b!451528 t!13749))

(declare-fun b_and!18805 () Bool)

(assert (= b_and!18803 (and (=> t!13749 result!6995) b_and!18805)))

(declare-fun m!435533 () Bool)

(assert (=> b!451536 m!435533))

(declare-fun m!435535 () Bool)

(assert (=> mapNonEmpty!19773 m!435535))

(declare-fun m!435537 () Bool)

(assert (=> b!451528 m!435537))

(declare-fun m!435539 () Bool)

(assert (=> b!451528 m!435539))

(declare-fun m!435541 () Bool)

(assert (=> b!451528 m!435541))

(declare-fun m!435543 () Bool)

(assert (=> b!451528 m!435543))

(declare-fun m!435545 () Bool)

(assert (=> b!451528 m!435545))

(assert (=> b!451528 m!435543))

(assert (=> b!451528 m!435537))

(declare-fun m!435547 () Bool)

(assert (=> b!451528 m!435547))

(assert (=> b!451528 m!435541))

(declare-fun m!435549 () Bool)

(assert (=> bm!29856 m!435549))

(declare-fun m!435551 () Bool)

(assert (=> b!451540 m!435551))

(declare-fun m!435553 () Bool)

(assert (=> b!451540 m!435553))

(declare-fun m!435555 () Bool)

(assert (=> b!451540 m!435555))

(declare-fun m!435557 () Bool)

(assert (=> b!451534 m!435557))

(declare-fun m!435559 () Bool)

(assert (=> b!451534 m!435559))

(declare-fun m!435561 () Bool)

(assert (=> b!451530 m!435561))

(assert (=> b!451530 m!435561))

(declare-fun m!435563 () Bool)

(assert (=> b!451530 m!435563))

(declare-fun m!435565 () Bool)

(assert (=> b!451530 m!435565))

(declare-fun m!435567 () Bool)

(assert (=> start!40750 m!435567))

(declare-fun m!435569 () Bool)

(assert (=> start!40750 m!435569))

(declare-fun m!435571 () Bool)

(assert (=> b!451527 m!435571))

(declare-fun m!435573 () Bool)

(assert (=> bm!29855 m!435573))

(declare-fun m!435575 () Bool)

(assert (=> b!451532 m!435575))

(declare-fun m!435577 () Bool)

(assert (=> b!451535 m!435577))

(declare-fun m!435579 () Bool)

(assert (=> b!451542 m!435579))

(declare-fun m!435581 () Bool)

(assert (=> b!451543 m!435581))

(declare-fun m!435583 () Bool)

(assert (=> b!451525 m!435583))

(declare-fun m!435585 () Bool)

(assert (=> b!451526 m!435585))

(check-sat tp_is_empty!12091 (not b!451532) (not bm!29855) (not b_next!10753) (not b!451527) (not b!451542) (not b!451536) (not b!451540) (not mapNonEmpty!19773) (not b!451526) (not b!451528) (not b_lambda!9545) (not b!451535) (not b!451534) (not b!451543) (not start!40750) b_and!18805 (not b!451530) (not bm!29856))
(check-sat b_and!18805 (not b_next!10753))
