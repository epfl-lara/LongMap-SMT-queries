; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40010 () Bool)

(assert start!40010)

(declare-fun b_free!10277 () Bool)

(declare-fun b_next!10277 () Bool)

(assert (=> start!40010 (= b_free!10277 (not b_next!10277))))

(declare-fun tp!36360 () Bool)

(declare-fun b_and!18213 () Bool)

(assert (=> start!40010 (= tp!36360 b_and!18213)))

(declare-fun b!435788 () Bool)

(declare-datatypes ((Unit!12947 0))(
  ( (Unit!12948) )
))
(declare-fun e!257420 () Unit!12947)

(declare-fun Unit!12949 () Unit!12947)

(assert (=> b!435788 (= e!257420 Unit!12949)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!200736 () Unit!12947)

(declare-datatypes ((array!26685 0))(
  ( (array!26686 (arr!12792 (Array (_ BitVec 32) (_ BitVec 64))) (size!13144 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26685)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26685 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12947)

(assert (=> b!435788 (= lt!200736 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435788 false))

(declare-fun b!435790 () Bool)

(declare-fun res!256811 () Bool)

(declare-fun e!257412 () Bool)

(assert (=> b!435790 (=> (not res!256811) (not e!257412))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435790 (= res!256811 (validMask!0 mask!1025))))

(declare-fun b!435791 () Bool)

(declare-fun res!256810 () Bool)

(declare-fun e!257416 () Bool)

(assert (=> b!435791 (=> (not res!256810) (not e!257416))))

(declare-fun lt!200743 () array!26685)

(declare-datatypes ((List!7628 0))(
  ( (Nil!7625) (Cons!7624 (h!8480 (_ BitVec 64)) (t!13354 List!7628)) )
))
(declare-fun arrayNoDuplicates!0 (array!26685 (_ BitVec 32) List!7628) Bool)

(assert (=> b!435791 (= res!256810 (arrayNoDuplicates!0 lt!200743 #b00000000000000000000000000000000 Nil!7625))))

(declare-fun b!435792 () Bool)

(declare-fun res!256802 () Bool)

(assert (=> b!435792 (=> (not res!256802) (not e!257412))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435792 (= res!256802 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13144 _keys!709))))))

(declare-fun b!435793 () Bool)

(declare-fun e!257413 () Bool)

(declare-fun e!257417 () Bool)

(assert (=> b!435793 (= e!257413 e!257417)))

(declare-fun res!256815 () Bool)

(assert (=> b!435793 (=> res!256815 e!257417)))

(assert (=> b!435793 (= res!256815 (= k!794 (select (arr!12792 _keys!709) from!863)))))

(assert (=> b!435793 (not (= (select (arr!12792 _keys!709) from!863) k!794))))

(declare-fun lt!200746 () Unit!12947)

(assert (=> b!435793 (= lt!200746 e!257420)))

(declare-fun c!55751 () Bool)

(assert (=> b!435793 (= c!55751 (= (select (arr!12792 _keys!709) from!863) k!794))))

(declare-datatypes ((V!16343 0))(
  ( (V!16344 (val!5759 Int)) )
))
(declare-datatypes ((tuple2!7626 0))(
  ( (tuple2!7627 (_1!3824 (_ BitVec 64)) (_2!3824 V!16343)) )
))
(declare-datatypes ((List!7629 0))(
  ( (Nil!7626) (Cons!7625 (h!8481 tuple2!7626) (t!13355 List!7629)) )
))
(declare-datatypes ((ListLongMap!6539 0))(
  ( (ListLongMap!6540 (toList!3285 List!7629)) )
))
(declare-fun lt!200747 () ListLongMap!6539)

(declare-fun lt!200738 () ListLongMap!6539)

(assert (=> b!435793 (= lt!200747 lt!200738)))

(declare-fun lt!200748 () ListLongMap!6539)

(declare-fun lt!200744 () tuple2!7626)

(declare-fun +!1433 (ListLongMap!6539 tuple2!7626) ListLongMap!6539)

(assert (=> b!435793 (= lt!200738 (+!1433 lt!200748 lt!200744))))

(declare-fun lt!200745 () V!16343)

(assert (=> b!435793 (= lt!200744 (tuple2!7627 (select (arr!12792 _keys!709) from!863) lt!200745))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5371 0))(
  ( (ValueCellFull!5371 (v!8006 V!16343)) (EmptyCell!5371) )
))
(declare-datatypes ((array!26687 0))(
  ( (array!26688 (arr!12793 (Array (_ BitVec 32) ValueCell!5371)) (size!13145 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26687)

(declare-fun get!6378 (ValueCell!5371 V!16343) V!16343)

(declare-fun dynLambda!839 (Int (_ BitVec 64)) V!16343)

(assert (=> b!435793 (= lt!200745 (get!6378 (select (arr!12793 _values!549) from!863) (dynLambda!839 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435794 () Bool)

(declare-fun res!256805 () Bool)

(assert (=> b!435794 (=> (not res!256805) (not e!257412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26685 (_ BitVec 32)) Bool)

(assert (=> b!435794 (= res!256805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435795 () Bool)

(declare-fun res!256804 () Bool)

(assert (=> b!435795 (=> (not res!256804) (not e!257412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435795 (= res!256804 (validKeyInArray!0 k!794))))

(declare-fun b!435796 () Bool)

(declare-fun res!256813 () Bool)

(assert (=> b!435796 (=> (not res!256813) (not e!257416))))

(assert (=> b!435796 (= res!256813 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18765 () Bool)

(declare-fun mapRes!18765 () Bool)

(assert (=> mapIsEmpty!18765 mapRes!18765))

(declare-fun b!435797 () Bool)

(declare-fun e!257415 () Bool)

(declare-fun tp_is_empty!11429 () Bool)

(assert (=> b!435797 (= e!257415 tp_is_empty!11429)))

(declare-fun b!435798 () Bool)

(declare-fun res!256814 () Bool)

(assert (=> b!435798 (=> (not res!256814) (not e!257412))))

(assert (=> b!435798 (= res!256814 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7625))))

(declare-fun b!435799 () Bool)

(assert (=> b!435799 (= e!257417 true)))

(declare-fun lt!200749 () tuple2!7626)

(declare-fun lt!200737 () ListLongMap!6539)

(assert (=> b!435799 (= lt!200738 (+!1433 (+!1433 lt!200737 lt!200744) lt!200749))))

(declare-fun v!412 () V!16343)

(declare-fun lt!200740 () Unit!12947)

(declare-fun addCommutativeForDiffKeys!415 (ListLongMap!6539 (_ BitVec 64) V!16343 (_ BitVec 64) V!16343) Unit!12947)

(assert (=> b!435799 (= lt!200740 (addCommutativeForDiffKeys!415 lt!200737 k!794 v!412 (select (arr!12792 _keys!709) from!863) lt!200745))))

(declare-fun b!435789 () Bool)

(declare-fun e!257418 () Bool)

(assert (=> b!435789 (= e!257418 tp_is_empty!11429)))

(declare-fun res!256806 () Bool)

(assert (=> start!40010 (=> (not res!256806) (not e!257412))))

(assert (=> start!40010 (= res!256806 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13144 _keys!709))))))

(assert (=> start!40010 e!257412))

(assert (=> start!40010 tp_is_empty!11429))

(assert (=> start!40010 tp!36360))

(assert (=> start!40010 true))

(declare-fun e!257419 () Bool)

(declare-fun array_inv!9298 (array!26687) Bool)

(assert (=> start!40010 (and (array_inv!9298 _values!549) e!257419)))

(declare-fun array_inv!9299 (array!26685) Bool)

(assert (=> start!40010 (array_inv!9299 _keys!709)))

(declare-fun b!435800 () Bool)

(declare-fun e!257414 () Bool)

(assert (=> b!435800 (= e!257416 e!257414)))

(declare-fun res!256807 () Bool)

(assert (=> b!435800 (=> (not res!256807) (not e!257414))))

(assert (=> b!435800 (= res!256807 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16343)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16343)

(declare-fun lt!200742 () array!26687)

(declare-fun getCurrentListMapNoExtraKeys!1476 (array!26685 array!26687 (_ BitVec 32) (_ BitVec 32) V!16343 V!16343 (_ BitVec 32) Int) ListLongMap!6539)

(assert (=> b!435800 (= lt!200747 (getCurrentListMapNoExtraKeys!1476 lt!200743 lt!200742 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435800 (= lt!200742 (array!26688 (store (arr!12793 _values!549) i!563 (ValueCellFull!5371 v!412)) (size!13145 _values!549)))))

(declare-fun lt!200741 () ListLongMap!6539)

(assert (=> b!435800 (= lt!200741 (getCurrentListMapNoExtraKeys!1476 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435801 () Bool)

(assert (=> b!435801 (= e!257414 (not e!257413))))

(declare-fun res!256808 () Bool)

(assert (=> b!435801 (=> res!256808 e!257413)))

(assert (=> b!435801 (= res!256808 (not (validKeyInArray!0 (select (arr!12792 _keys!709) from!863))))))

(declare-fun lt!200750 () ListLongMap!6539)

(assert (=> b!435801 (= lt!200750 lt!200748)))

(assert (=> b!435801 (= lt!200748 (+!1433 lt!200737 lt!200749))))

(assert (=> b!435801 (= lt!200750 (getCurrentListMapNoExtraKeys!1476 lt!200743 lt!200742 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435801 (= lt!200749 (tuple2!7627 k!794 v!412))))

(assert (=> b!435801 (= lt!200737 (getCurrentListMapNoExtraKeys!1476 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200739 () Unit!12947)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!605 (array!26685 array!26687 (_ BitVec 32) (_ BitVec 32) V!16343 V!16343 (_ BitVec 32) (_ BitVec 64) V!16343 (_ BitVec 32) Int) Unit!12947)

(assert (=> b!435801 (= lt!200739 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!605 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435802 () Bool)

(declare-fun Unit!12950 () Unit!12947)

(assert (=> b!435802 (= e!257420 Unit!12950)))

(declare-fun b!435803 () Bool)

(declare-fun res!256801 () Bool)

(assert (=> b!435803 (=> (not res!256801) (not e!257412))))

(assert (=> b!435803 (= res!256801 (or (= (select (arr!12792 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12792 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18765 () Bool)

(declare-fun tp!36359 () Bool)

(assert (=> mapNonEmpty!18765 (= mapRes!18765 (and tp!36359 e!257418))))

(declare-fun mapKey!18765 () (_ BitVec 32))

(declare-fun mapRest!18765 () (Array (_ BitVec 32) ValueCell!5371))

(declare-fun mapValue!18765 () ValueCell!5371)

(assert (=> mapNonEmpty!18765 (= (arr!12793 _values!549) (store mapRest!18765 mapKey!18765 mapValue!18765))))

(declare-fun b!435804 () Bool)

(assert (=> b!435804 (= e!257419 (and e!257415 mapRes!18765))))

(declare-fun condMapEmpty!18765 () Bool)

(declare-fun mapDefault!18765 () ValueCell!5371)

