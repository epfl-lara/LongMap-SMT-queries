; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39876 () Bool)

(assert start!39876)

(declare-fun b_free!10143 () Bool)

(declare-fun b_next!10143 () Bool)

(assert (=> start!39876 (= b_free!10143 (not b_next!10143))))

(declare-fun tp!35957 () Bool)

(declare-fun b_and!17945 () Bool)

(assert (=> start!39876 (= tp!35957 b_and!17945)))

(declare-fun res!253790 () Bool)

(declare-fun e!255404 () Bool)

(assert (=> start!39876 (=> (not res!253790) (not e!255404))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26425 0))(
  ( (array!26426 (arr!12662 (Array (_ BitVec 32) (_ BitVec 64))) (size!13014 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26425)

(assert (=> start!39876 (= res!253790 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13014 _keys!709))))))

(assert (=> start!39876 e!255404))

(declare-fun tp_is_empty!11295 () Bool)

(assert (=> start!39876 tp_is_empty!11295))

(assert (=> start!39876 tp!35957))

(assert (=> start!39876 true))

(declare-datatypes ((V!16165 0))(
  ( (V!16166 (val!5692 Int)) )
))
(declare-datatypes ((ValueCell!5304 0))(
  ( (ValueCellFull!5304 (v!7939 V!16165)) (EmptyCell!5304) )
))
(declare-datatypes ((array!26427 0))(
  ( (array!26428 (arr!12663 (Array (_ BitVec 32) ValueCell!5304)) (size!13015 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26427)

(declare-fun e!255403 () Bool)

(declare-fun array_inv!9214 (array!26427) Bool)

(assert (=> start!39876 (and (array_inv!9214 _values!549) e!255403)))

(declare-fun array_inv!9215 (array!26425) Bool)

(assert (=> start!39876 (array_inv!9215 _keys!709)))

(declare-fun b!431634 () Bool)

(declare-fun e!255408 () Bool)

(assert (=> b!431634 (= e!255408 true)))

(declare-datatypes ((tuple2!7508 0))(
  ( (tuple2!7509 (_1!3765 (_ BitVec 64)) (_2!3765 V!16165)) )
))
(declare-fun lt!197730 () tuple2!7508)

(declare-fun lt!197723 () tuple2!7508)

(declare-datatypes ((List!7522 0))(
  ( (Nil!7519) (Cons!7518 (h!8374 tuple2!7508) (t!13114 List!7522)) )
))
(declare-datatypes ((ListLongMap!6421 0))(
  ( (ListLongMap!6422 (toList!3226 List!7522)) )
))
(declare-fun lt!197729 () ListLongMap!6421)

(declare-fun lt!197733 () ListLongMap!6421)

(declare-fun +!1374 (ListLongMap!6421 tuple2!7508) ListLongMap!6421)

(assert (=> b!431634 (= lt!197729 (+!1374 (+!1374 lt!197733 lt!197723) lt!197730))))

(declare-datatypes ((Unit!12728 0))(
  ( (Unit!12729) )
))
(declare-fun lt!197734 () Unit!12728)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!197727 () V!16165)

(declare-fun v!412 () V!16165)

(declare-fun addCommutativeForDiffKeys!366 (ListLongMap!6421 (_ BitVec 64) V!16165 (_ BitVec 64) V!16165) Unit!12728)

(assert (=> b!431634 (= lt!197734 (addCommutativeForDiffKeys!366 lt!197733 k0!794 v!412 (select (arr!12662 _keys!709) from!863) lt!197727))))

(declare-fun b!431635 () Bool)

(declare-fun e!255410 () Bool)

(assert (=> b!431635 (= e!255410 tp_is_empty!11295)))

(declare-fun mapNonEmpty!18564 () Bool)

(declare-fun mapRes!18564 () Bool)

(declare-fun tp!35958 () Bool)

(declare-fun e!255407 () Bool)

(assert (=> mapNonEmpty!18564 (= mapRes!18564 (and tp!35958 e!255407))))

(declare-fun mapValue!18564 () ValueCell!5304)

(declare-fun mapRest!18564 () (Array (_ BitVec 32) ValueCell!5304))

(declare-fun mapKey!18564 () (_ BitVec 32))

(assert (=> mapNonEmpty!18564 (= (arr!12663 _values!549) (store mapRest!18564 mapKey!18564 mapValue!18564))))

(declare-fun b!431636 () Bool)

(declare-fun res!253796 () Bool)

(assert (=> b!431636 (=> (not res!253796) (not e!255404))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431636 (= res!253796 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13014 _keys!709))))))

(declare-fun b!431637 () Bool)

(declare-fun res!253794 () Bool)

(declare-fun e!255406 () Bool)

(assert (=> b!431637 (=> (not res!253794) (not e!255406))))

(assert (=> b!431637 (= res!253794 (bvsle from!863 i!563))))

(declare-fun b!431638 () Bool)

(declare-fun e!255402 () Bool)

(assert (=> b!431638 (= e!255402 e!255408)))

(declare-fun res!253787 () Bool)

(assert (=> b!431638 (=> res!253787 e!255408)))

(assert (=> b!431638 (= res!253787 (= k0!794 (select (arr!12662 _keys!709) from!863)))))

(assert (=> b!431638 (not (= (select (arr!12662 _keys!709) from!863) k0!794))))

(declare-fun lt!197732 () Unit!12728)

(declare-fun e!255409 () Unit!12728)

(assert (=> b!431638 (= lt!197732 e!255409)))

(declare-fun c!55550 () Bool)

(assert (=> b!431638 (= c!55550 (= (select (arr!12662 _keys!709) from!863) k0!794))))

(declare-fun lt!197724 () ListLongMap!6421)

(assert (=> b!431638 (= lt!197724 lt!197729)))

(declare-fun lt!197735 () ListLongMap!6421)

(assert (=> b!431638 (= lt!197729 (+!1374 lt!197735 lt!197723))))

(assert (=> b!431638 (= lt!197723 (tuple2!7509 (select (arr!12662 _keys!709) from!863) lt!197727))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6290 (ValueCell!5304 V!16165) V!16165)

(declare-fun dynLambda!795 (Int (_ BitVec 64)) V!16165)

(assert (=> b!431638 (= lt!197727 (get!6290 (select (arr!12663 _values!549) from!863) (dynLambda!795 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431639 () Bool)

(declare-fun res!253792 () Bool)

(assert (=> b!431639 (=> (not res!253792) (not e!255404))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!431639 (= res!253792 (and (= (size!13015 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13014 _keys!709) (size!13015 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431640 () Bool)

(declare-fun Unit!12730 () Unit!12728)

(assert (=> b!431640 (= e!255409 Unit!12730)))

(declare-fun lt!197721 () Unit!12728)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26425 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12728)

(assert (=> b!431640 (= lt!197721 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431640 false))

(declare-fun b!431641 () Bool)

(declare-fun res!253800 () Bool)

(assert (=> b!431641 (=> (not res!253800) (not e!255404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431641 (= res!253800 (validKeyInArray!0 k0!794))))

(declare-fun b!431642 () Bool)

(declare-fun res!253797 () Bool)

(assert (=> b!431642 (=> (not res!253797) (not e!255404))))

(assert (=> b!431642 (= res!253797 (or (= (select (arr!12662 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12662 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431643 () Bool)

(declare-fun res!253788 () Bool)

(assert (=> b!431643 (=> (not res!253788) (not e!255404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26425 (_ BitVec 32)) Bool)

(assert (=> b!431643 (= res!253788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18564 () Bool)

(assert (=> mapIsEmpty!18564 mapRes!18564))

(declare-fun b!431644 () Bool)

(declare-fun res!253786 () Bool)

(assert (=> b!431644 (=> (not res!253786) (not e!255404))))

(declare-datatypes ((List!7523 0))(
  ( (Nil!7520) (Cons!7519 (h!8375 (_ BitVec 64)) (t!13115 List!7523)) )
))
(declare-fun arrayNoDuplicates!0 (array!26425 (_ BitVec 32) List!7523) Bool)

(assert (=> b!431644 (= res!253786 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7520))))

(declare-fun b!431645 () Bool)

(declare-fun e!255411 () Bool)

(assert (=> b!431645 (= e!255411 (not e!255402))))

(declare-fun res!253799 () Bool)

(assert (=> b!431645 (=> res!253799 e!255402)))

(assert (=> b!431645 (= res!253799 (not (validKeyInArray!0 (select (arr!12662 _keys!709) from!863))))))

(declare-fun lt!197731 () ListLongMap!6421)

(assert (=> b!431645 (= lt!197731 lt!197735)))

(assert (=> b!431645 (= lt!197735 (+!1374 lt!197733 lt!197730))))

(declare-fun minValue!515 () V!16165)

(declare-fun zeroValue!515 () V!16165)

(declare-fun lt!197722 () array!26425)

(declare-fun lt!197728 () array!26427)

(declare-fun getCurrentListMapNoExtraKeys!1424 (array!26425 array!26427 (_ BitVec 32) (_ BitVec 32) V!16165 V!16165 (_ BitVec 32) Int) ListLongMap!6421)

(assert (=> b!431645 (= lt!197731 (getCurrentListMapNoExtraKeys!1424 lt!197722 lt!197728 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431645 (= lt!197730 (tuple2!7509 k0!794 v!412))))

(assert (=> b!431645 (= lt!197733 (getCurrentListMapNoExtraKeys!1424 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197725 () Unit!12728)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!559 (array!26425 array!26427 (_ BitVec 32) (_ BitVec 32) V!16165 V!16165 (_ BitVec 32) (_ BitVec 64) V!16165 (_ BitVec 32) Int) Unit!12728)

(assert (=> b!431645 (= lt!197725 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!559 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431646 () Bool)

(declare-fun Unit!12731 () Unit!12728)

(assert (=> b!431646 (= e!255409 Unit!12731)))

(declare-fun b!431647 () Bool)

(declare-fun res!253791 () Bool)

(assert (=> b!431647 (=> (not res!253791) (not e!255406))))

(assert (=> b!431647 (= res!253791 (arrayNoDuplicates!0 lt!197722 #b00000000000000000000000000000000 Nil!7520))))

(declare-fun b!431648 () Bool)

(assert (=> b!431648 (= e!255407 tp_is_empty!11295)))

(declare-fun b!431649 () Bool)

(declare-fun res!253798 () Bool)

(assert (=> b!431649 (=> (not res!253798) (not e!255404))))

(declare-fun arrayContainsKey!0 (array!26425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431649 (= res!253798 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431650 () Bool)

(declare-fun res!253789 () Bool)

(assert (=> b!431650 (=> (not res!253789) (not e!255404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431650 (= res!253789 (validMask!0 mask!1025))))

(declare-fun b!431651 () Bool)

(assert (=> b!431651 (= e!255404 e!255406)))

(declare-fun res!253793 () Bool)

(assert (=> b!431651 (=> (not res!253793) (not e!255406))))

(assert (=> b!431651 (= res!253793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197722 mask!1025))))

(assert (=> b!431651 (= lt!197722 (array!26426 (store (arr!12662 _keys!709) i!563 k0!794) (size!13014 _keys!709)))))

(declare-fun b!431652 () Bool)

(assert (=> b!431652 (= e!255406 e!255411)))

(declare-fun res!253795 () Bool)

(assert (=> b!431652 (=> (not res!253795) (not e!255411))))

(assert (=> b!431652 (= res!253795 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!431652 (= lt!197724 (getCurrentListMapNoExtraKeys!1424 lt!197722 lt!197728 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431652 (= lt!197728 (array!26428 (store (arr!12663 _values!549) i!563 (ValueCellFull!5304 v!412)) (size!13015 _values!549)))))

(declare-fun lt!197726 () ListLongMap!6421)

(assert (=> b!431652 (= lt!197726 (getCurrentListMapNoExtraKeys!1424 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431653 () Bool)

(assert (=> b!431653 (= e!255403 (and e!255410 mapRes!18564))))

(declare-fun condMapEmpty!18564 () Bool)

(declare-fun mapDefault!18564 () ValueCell!5304)

(assert (=> b!431653 (= condMapEmpty!18564 (= (arr!12663 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5304)) mapDefault!18564)))))

(assert (= (and start!39876 res!253790) b!431650))

(assert (= (and b!431650 res!253789) b!431639))

(assert (= (and b!431639 res!253792) b!431643))

(assert (= (and b!431643 res!253788) b!431644))

(assert (= (and b!431644 res!253786) b!431636))

(assert (= (and b!431636 res!253796) b!431641))

(assert (= (and b!431641 res!253800) b!431642))

(assert (= (and b!431642 res!253797) b!431649))

(assert (= (and b!431649 res!253798) b!431651))

(assert (= (and b!431651 res!253793) b!431647))

(assert (= (and b!431647 res!253791) b!431637))

(assert (= (and b!431637 res!253794) b!431652))

(assert (= (and b!431652 res!253795) b!431645))

(assert (= (and b!431645 (not res!253799)) b!431638))

(assert (= (and b!431638 c!55550) b!431640))

(assert (= (and b!431638 (not c!55550)) b!431646))

(assert (= (and b!431638 (not res!253787)) b!431634))

(assert (= (and b!431653 condMapEmpty!18564) mapIsEmpty!18564))

(assert (= (and b!431653 (not condMapEmpty!18564)) mapNonEmpty!18564))

(get-info :version)

(assert (= (and mapNonEmpty!18564 ((_ is ValueCellFull!5304) mapValue!18564)) b!431648))

(assert (= (and b!431653 ((_ is ValueCellFull!5304) mapDefault!18564)) b!431635))

(assert (= start!39876 b!431653))

(declare-fun b_lambda!9231 () Bool)

(assert (=> (not b_lambda!9231) (not b!431638)))

(declare-fun t!13113 () Bool)

(declare-fun tb!3549 () Bool)

(assert (=> (and start!39876 (= defaultEntry!557 defaultEntry!557) t!13113) tb!3549))

(declare-fun result!6625 () Bool)

(assert (=> tb!3549 (= result!6625 tp_is_empty!11295)))

(assert (=> b!431638 t!13113))

(declare-fun b_and!17947 () Bool)

(assert (= b_and!17945 (and (=> t!13113 result!6625) b_and!17947)))

(declare-fun m!419767 () Bool)

(assert (=> b!431642 m!419767))

(declare-fun m!419769 () Bool)

(assert (=> b!431641 m!419769))

(declare-fun m!419771 () Bool)

(assert (=> b!431640 m!419771))

(declare-fun m!419773 () Bool)

(assert (=> b!431652 m!419773))

(declare-fun m!419775 () Bool)

(assert (=> b!431652 m!419775))

(declare-fun m!419777 () Bool)

(assert (=> b!431652 m!419777))

(declare-fun m!419779 () Bool)

(assert (=> b!431638 m!419779))

(declare-fun m!419781 () Bool)

(assert (=> b!431638 m!419781))

(declare-fun m!419783 () Bool)

(assert (=> b!431638 m!419783))

(assert (=> b!431638 m!419783))

(assert (=> b!431638 m!419781))

(declare-fun m!419785 () Bool)

(assert (=> b!431638 m!419785))

(declare-fun m!419787 () Bool)

(assert (=> b!431638 m!419787))

(declare-fun m!419789 () Bool)

(assert (=> b!431634 m!419789))

(assert (=> b!431634 m!419789))

(declare-fun m!419791 () Bool)

(assert (=> b!431634 m!419791))

(assert (=> b!431634 m!419779))

(assert (=> b!431634 m!419779))

(declare-fun m!419793 () Bool)

(assert (=> b!431634 m!419793))

(declare-fun m!419795 () Bool)

(assert (=> b!431651 m!419795))

(declare-fun m!419797 () Bool)

(assert (=> b!431651 m!419797))

(declare-fun m!419799 () Bool)

(assert (=> b!431650 m!419799))

(declare-fun m!419801 () Bool)

(assert (=> mapNonEmpty!18564 m!419801))

(declare-fun m!419803 () Bool)

(assert (=> start!39876 m!419803))

(declare-fun m!419805 () Bool)

(assert (=> start!39876 m!419805))

(assert (=> b!431645 m!419779))

(declare-fun m!419807 () Bool)

(assert (=> b!431645 m!419807))

(assert (=> b!431645 m!419779))

(declare-fun m!419809 () Bool)

(assert (=> b!431645 m!419809))

(declare-fun m!419811 () Bool)

(assert (=> b!431645 m!419811))

(declare-fun m!419813 () Bool)

(assert (=> b!431645 m!419813))

(declare-fun m!419815 () Bool)

(assert (=> b!431645 m!419815))

(declare-fun m!419817 () Bool)

(assert (=> b!431649 m!419817))

(declare-fun m!419819 () Bool)

(assert (=> b!431647 m!419819))

(declare-fun m!419821 () Bool)

(assert (=> b!431643 m!419821))

(declare-fun m!419823 () Bool)

(assert (=> b!431644 m!419823))

(check-sat (not b!431647) (not b!431652) (not b!431645) tp_is_empty!11295 (not b_next!10143) (not b!431643) (not b!431641) (not b!431651) (not start!39876) (not b!431634) (not b!431650) (not b!431638) (not b!431640) (not b_lambda!9231) (not mapNonEmpty!18564) b_and!17947 (not b!431644) (not b!431649))
(check-sat b_and!17947 (not b_next!10143))
