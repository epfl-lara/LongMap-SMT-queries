; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40064 () Bool)

(assert start!40064)

(declare-fun b_free!10345 () Bool)

(declare-fun b_next!10345 () Bool)

(assert (=> start!40064 (= b_free!10345 (not b_next!10345))))

(declare-fun tp!36563 () Bool)

(declare-fun b_and!18287 () Bool)

(assert (=> start!40064 (= tp!36563 b_and!18287)))

(declare-fun b!437365 () Bool)

(declare-fun e!258090 () Bool)

(declare-fun e!258094 () Bool)

(assert (=> b!437365 (= e!258090 e!258094)))

(declare-fun res!258090 () Bool)

(assert (=> b!437365 (=> (not res!258090) (not e!258094))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437365 (= res!258090 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16435 0))(
  ( (V!16436 (val!5793 Int)) )
))
(declare-datatypes ((ValueCell!5405 0))(
  ( (ValueCellFull!5405 (v!8034 V!16435)) (EmptyCell!5405) )
))
(declare-datatypes ((array!26815 0))(
  ( (array!26816 (arr!12857 (Array (_ BitVec 32) ValueCell!5405)) (size!13210 (_ BitVec 32))) )
))
(declare-fun lt!201473 () array!26815)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16435)

(declare-datatypes ((tuple2!7696 0))(
  ( (tuple2!7697 (_1!3859 (_ BitVec 64)) (_2!3859 V!16435)) )
))
(declare-datatypes ((List!7683 0))(
  ( (Nil!7680) (Cons!7679 (h!8535 tuple2!7696) (t!13430 List!7683)) )
))
(declare-datatypes ((ListLongMap!6599 0))(
  ( (ListLongMap!6600 (toList!3315 List!7683)) )
))
(declare-fun lt!201474 () ListLongMap!6599)

(declare-datatypes ((array!26817 0))(
  ( (array!26818 (arr!12858 (Array (_ BitVec 32) (_ BitVec 64))) (size!13211 (_ BitVec 32))) )
))
(declare-fun lt!201476 () array!26817)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!16435)

(declare-fun getCurrentListMapNoExtraKeys!1514 (array!26817 array!26815 (_ BitVec 32) (_ BitVec 32) V!16435 V!16435 (_ BitVec 32) Int) ListLongMap!6599)

(assert (=> b!437365 (= lt!201474 (getCurrentListMapNoExtraKeys!1514 lt!201476 lt!201473 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26815)

(declare-fun v!412 () V!16435)

(assert (=> b!437365 (= lt!201473 (array!26816 (store (arr!12857 _values!549) i!563 (ValueCellFull!5405 v!412)) (size!13210 _values!549)))))

(declare-fun lt!201472 () ListLongMap!6599)

(declare-fun _keys!709 () array!26817)

(assert (=> b!437365 (= lt!201472 (getCurrentListMapNoExtraKeys!1514 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437366 () Bool)

(declare-fun e!258092 () Bool)

(assert (=> b!437366 (= e!258092 e!258090)))

(declare-fun res!258100 () Bool)

(assert (=> b!437366 (=> (not res!258100) (not e!258090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26817 (_ BitVec 32)) Bool)

(assert (=> b!437366 (= res!258100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201476 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!437366 (= lt!201476 (array!26818 (store (arr!12858 _keys!709) i!563 k0!794) (size!13211 _keys!709)))))

(declare-fun b!437367 () Bool)

(declare-fun res!258094 () Bool)

(assert (=> b!437367 (=> (not res!258094) (not e!258092))))

(assert (=> b!437367 (= res!258094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437368 () Bool)

(declare-fun e!258093 () Bool)

(declare-fun e!258091 () Bool)

(declare-fun mapRes!18867 () Bool)

(assert (=> b!437368 (= e!258093 (and e!258091 mapRes!18867))))

(declare-fun condMapEmpty!18867 () Bool)

(declare-fun mapDefault!18867 () ValueCell!5405)

(assert (=> b!437368 (= condMapEmpty!18867 (= (arr!12857 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5405)) mapDefault!18867)))))

(declare-fun b!437369 () Bool)

(declare-fun res!258101 () Bool)

(assert (=> b!437369 (=> (not res!258101) (not e!258092))))

(assert (=> b!437369 (= res!258101 (or (= (select (arr!12858 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12858 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18867 () Bool)

(declare-fun tp!36564 () Bool)

(declare-fun e!258096 () Bool)

(assert (=> mapNonEmpty!18867 (= mapRes!18867 (and tp!36564 e!258096))))

(declare-fun mapValue!18867 () ValueCell!5405)

(declare-fun mapRest!18867 () (Array (_ BitVec 32) ValueCell!5405))

(declare-fun mapKey!18867 () (_ BitVec 32))

(assert (=> mapNonEmpty!18867 (= (arr!12857 _values!549) (store mapRest!18867 mapKey!18867 mapValue!18867))))

(declare-fun b!437370 () Bool)

(assert (=> b!437370 (= e!258094 (not true))))

(declare-fun +!1488 (ListLongMap!6599 tuple2!7696) ListLongMap!6599)

(assert (=> b!437370 (= (getCurrentListMapNoExtraKeys!1514 lt!201476 lt!201473 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1488 (getCurrentListMapNoExtraKeys!1514 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7697 k0!794 v!412)))))

(declare-datatypes ((Unit!12993 0))(
  ( (Unit!12994) )
))
(declare-fun lt!201475 () Unit!12993)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!626 (array!26817 array!26815 (_ BitVec 32) (_ BitVec 32) V!16435 V!16435 (_ BitVec 32) (_ BitVec 64) V!16435 (_ BitVec 32) Int) Unit!12993)

(assert (=> b!437370 (= lt!201475 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!626 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!258093 () Bool)

(assert (=> start!40064 (=> (not res!258093) (not e!258092))))

(assert (=> start!40064 (= res!258093 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13211 _keys!709))))))

(assert (=> start!40064 e!258092))

(declare-fun tp_is_empty!11497 () Bool)

(assert (=> start!40064 tp_is_empty!11497))

(assert (=> start!40064 tp!36563))

(assert (=> start!40064 true))

(declare-fun array_inv!9388 (array!26815) Bool)

(assert (=> start!40064 (and (array_inv!9388 _values!549) e!258093)))

(declare-fun array_inv!9389 (array!26817) Bool)

(assert (=> start!40064 (array_inv!9389 _keys!709)))

(declare-fun b!437371 () Bool)

(declare-fun res!258097 () Bool)

(assert (=> b!437371 (=> (not res!258097) (not e!258092))))

(declare-fun arrayContainsKey!0 (array!26817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437371 (= res!258097 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437372 () Bool)

(declare-fun res!258095 () Bool)

(assert (=> b!437372 (=> (not res!258095) (not e!258092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437372 (= res!258095 (validKeyInArray!0 k0!794))))

(declare-fun b!437373 () Bool)

(declare-fun res!258091 () Bool)

(assert (=> b!437373 (=> (not res!258091) (not e!258090))))

(assert (=> b!437373 (= res!258091 (bvsle from!863 i!563))))

(declare-fun b!437374 () Bool)

(declare-fun res!258096 () Bool)

(assert (=> b!437374 (=> (not res!258096) (not e!258092))))

(declare-datatypes ((List!7684 0))(
  ( (Nil!7681) (Cons!7680 (h!8536 (_ BitVec 64)) (t!13431 List!7684)) )
))
(declare-fun arrayNoDuplicates!0 (array!26817 (_ BitVec 32) List!7684) Bool)

(assert (=> b!437374 (= res!258096 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7681))))

(declare-fun b!437375 () Bool)

(assert (=> b!437375 (= e!258091 tp_is_empty!11497)))

(declare-fun b!437376 () Bool)

(declare-fun res!258099 () Bool)

(assert (=> b!437376 (=> (not res!258099) (not e!258092))))

(assert (=> b!437376 (= res!258099 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13211 _keys!709))))))

(declare-fun b!437377 () Bool)

(declare-fun res!258092 () Bool)

(assert (=> b!437377 (=> (not res!258092) (not e!258092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437377 (= res!258092 (validMask!0 mask!1025))))

(declare-fun b!437378 () Bool)

(declare-fun res!258098 () Bool)

(assert (=> b!437378 (=> (not res!258098) (not e!258090))))

(assert (=> b!437378 (= res!258098 (arrayNoDuplicates!0 lt!201476 #b00000000000000000000000000000000 Nil!7681))))

(declare-fun b!437379 () Bool)

(assert (=> b!437379 (= e!258096 tp_is_empty!11497)))

(declare-fun mapIsEmpty!18867 () Bool)

(assert (=> mapIsEmpty!18867 mapRes!18867))

(declare-fun b!437380 () Bool)

(declare-fun res!258102 () Bool)

(assert (=> b!437380 (=> (not res!258102) (not e!258092))))

(assert (=> b!437380 (= res!258102 (and (= (size!13210 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13211 _keys!709) (size!13210 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40064 res!258093) b!437377))

(assert (= (and b!437377 res!258092) b!437380))

(assert (= (and b!437380 res!258102) b!437367))

(assert (= (and b!437367 res!258094) b!437374))

(assert (= (and b!437374 res!258096) b!437376))

(assert (= (and b!437376 res!258099) b!437372))

(assert (= (and b!437372 res!258095) b!437369))

(assert (= (and b!437369 res!258101) b!437371))

(assert (= (and b!437371 res!258097) b!437366))

(assert (= (and b!437366 res!258100) b!437378))

(assert (= (and b!437378 res!258098) b!437373))

(assert (= (and b!437373 res!258091) b!437365))

(assert (= (and b!437365 res!258090) b!437370))

(assert (= (and b!437368 condMapEmpty!18867) mapIsEmpty!18867))

(assert (= (and b!437368 (not condMapEmpty!18867)) mapNonEmpty!18867))

(get-info :version)

(assert (= (and mapNonEmpty!18867 ((_ is ValueCellFull!5405) mapValue!18867)) b!437379))

(assert (= (and b!437368 ((_ is ValueCellFull!5405) mapDefault!18867)) b!437375))

(assert (= start!40064 b!437368))

(declare-fun m!424533 () Bool)

(assert (=> start!40064 m!424533))

(declare-fun m!424535 () Bool)

(assert (=> start!40064 m!424535))

(declare-fun m!424537 () Bool)

(assert (=> b!437374 m!424537))

(declare-fun m!424539 () Bool)

(assert (=> b!437377 m!424539))

(declare-fun m!424541 () Bool)

(assert (=> b!437369 m!424541))

(declare-fun m!424543 () Bool)

(assert (=> b!437370 m!424543))

(declare-fun m!424545 () Bool)

(assert (=> b!437370 m!424545))

(assert (=> b!437370 m!424545))

(declare-fun m!424547 () Bool)

(assert (=> b!437370 m!424547))

(declare-fun m!424549 () Bool)

(assert (=> b!437370 m!424549))

(declare-fun m!424551 () Bool)

(assert (=> b!437367 m!424551))

(declare-fun m!424553 () Bool)

(assert (=> b!437366 m!424553))

(declare-fun m!424555 () Bool)

(assert (=> b!437366 m!424555))

(declare-fun m!424557 () Bool)

(assert (=> b!437371 m!424557))

(declare-fun m!424559 () Bool)

(assert (=> b!437365 m!424559))

(declare-fun m!424561 () Bool)

(assert (=> b!437365 m!424561))

(declare-fun m!424563 () Bool)

(assert (=> b!437365 m!424563))

(declare-fun m!424565 () Bool)

(assert (=> b!437378 m!424565))

(declare-fun m!424567 () Bool)

(assert (=> mapNonEmpty!18867 m!424567))

(declare-fun m!424569 () Bool)

(assert (=> b!437372 m!424569))

(check-sat (not b!437365) tp_is_empty!11497 (not b!437377) (not b!437370) (not b!437367) (not b!437372) b_and!18287 (not b!437378) (not b!437371) (not b_next!10345) (not b!437374) (not start!40064) (not b!437366) (not mapNonEmpty!18867))
(check-sat b_and!18287 (not b_next!10345))
