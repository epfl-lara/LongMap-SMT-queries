; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40058 () Bool)

(assert start!40058)

(declare-fun b_free!10339 () Bool)

(declare-fun b_next!10339 () Bool)

(assert (=> start!40058 (= b_free!10339 (not b_next!10339))))

(declare-fun tp!36546 () Bool)

(declare-fun b_and!18321 () Bool)

(assert (=> start!40058 (= tp!36546 b_and!18321)))

(declare-fun b!437443 () Bool)

(declare-fun res!258110 () Bool)

(declare-fun e!258169 () Bool)

(assert (=> b!437443 (=> (not res!258110) (not e!258169))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437443 (= res!258110 (bvsle from!863 i!563))))

(declare-fun b!437444 () Bool)

(declare-fun res!258104 () Bool)

(declare-fun e!258170 () Bool)

(assert (=> b!437444 (=> (not res!258104) (not e!258170))))

(declare-datatypes ((array!26808 0))(
  ( (array!26809 (arr!12853 (Array (_ BitVec 32) (_ BitVec 64))) (size!13205 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26808)

(assert (=> b!437444 (= res!258104 (or (= (select (arr!12853 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12853 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437445 () Bool)

(declare-fun e!258174 () Bool)

(declare-fun tp_is_empty!11491 () Bool)

(assert (=> b!437445 (= e!258174 tp_is_empty!11491)))

(declare-fun mapIsEmpty!18858 () Bool)

(declare-fun mapRes!18858 () Bool)

(assert (=> mapIsEmpty!18858 mapRes!18858))

(declare-fun b!437446 () Bool)

(declare-fun res!258102 () Bool)

(assert (=> b!437446 (=> (not res!258102) (not e!258170))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16427 0))(
  ( (V!16428 (val!5790 Int)) )
))
(declare-datatypes ((ValueCell!5402 0))(
  ( (ValueCellFull!5402 (v!8038 V!16427)) (EmptyCell!5402) )
))
(declare-datatypes ((array!26810 0))(
  ( (array!26811 (arr!12854 (Array (_ BitVec 32) ValueCell!5402)) (size!13206 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26810)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!437446 (= res!258102 (and (= (size!13206 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13205 _keys!709) (size!13206 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437447 () Bool)

(declare-fun res!258107 () Bool)

(assert (=> b!437447 (=> (not res!258107) (not e!258170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26808 (_ BitVec 32)) Bool)

(assert (=> b!437447 (= res!258107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437448 () Bool)

(assert (=> b!437448 (= e!258170 e!258169)))

(declare-fun res!258100 () Bool)

(assert (=> b!437448 (=> (not res!258100) (not e!258169))))

(declare-fun lt!201681 () array!26808)

(assert (=> b!437448 (= res!258100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201681 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!437448 (= lt!201681 (array!26809 (store (arr!12853 _keys!709) i!563 k0!794) (size!13205 _keys!709)))))

(declare-fun b!437449 () Bool)

(declare-fun e!258172 () Bool)

(assert (=> b!437449 (= e!258169 e!258172)))

(declare-fun res!258105 () Bool)

(assert (=> b!437449 (=> (not res!258105) (not e!258172))))

(assert (=> b!437449 (= res!258105 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16427)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!201684 () array!26810)

(declare-datatypes ((tuple2!7582 0))(
  ( (tuple2!7583 (_1!3802 (_ BitVec 64)) (_2!3802 V!16427)) )
))
(declare-datatypes ((List!7570 0))(
  ( (Nil!7567) (Cons!7566 (h!8422 tuple2!7582) (t!13318 List!7570)) )
))
(declare-datatypes ((ListLongMap!6497 0))(
  ( (ListLongMap!6498 (toList!3264 List!7570)) )
))
(declare-fun lt!201683 () ListLongMap!6497)

(declare-fun zeroValue!515 () V!16427)

(declare-fun getCurrentListMapNoExtraKeys!1497 (array!26808 array!26810 (_ BitVec 32) (_ BitVec 32) V!16427 V!16427 (_ BitVec 32) Int) ListLongMap!6497)

(assert (=> b!437449 (= lt!201683 (getCurrentListMapNoExtraKeys!1497 lt!201681 lt!201684 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16427)

(assert (=> b!437449 (= lt!201684 (array!26811 (store (arr!12854 _values!549) i!563 (ValueCellFull!5402 v!412)) (size!13206 _values!549)))))

(declare-fun lt!201682 () ListLongMap!6497)

(assert (=> b!437449 (= lt!201682 (getCurrentListMapNoExtraKeys!1497 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437450 () Bool)

(declare-fun res!258109 () Bool)

(assert (=> b!437450 (=> (not res!258109) (not e!258169))))

(declare-datatypes ((List!7571 0))(
  ( (Nil!7568) (Cons!7567 (h!8423 (_ BitVec 64)) (t!13319 List!7571)) )
))
(declare-fun arrayNoDuplicates!0 (array!26808 (_ BitVec 32) List!7571) Bool)

(assert (=> b!437450 (= res!258109 (arrayNoDuplicates!0 lt!201681 #b00000000000000000000000000000000 Nil!7568))))

(declare-fun b!437451 () Bool)

(declare-fun res!258099 () Bool)

(assert (=> b!437451 (=> (not res!258099) (not e!258170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437451 (= res!258099 (validMask!0 mask!1025))))

(declare-fun b!437452 () Bool)

(declare-fun res!258106 () Bool)

(assert (=> b!437452 (=> (not res!258106) (not e!258170))))

(declare-fun arrayContainsKey!0 (array!26808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437452 (= res!258106 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18858 () Bool)

(declare-fun tp!36545 () Bool)

(declare-fun e!258175 () Bool)

(assert (=> mapNonEmpty!18858 (= mapRes!18858 (and tp!36545 e!258175))))

(declare-fun mapKey!18858 () (_ BitVec 32))

(declare-fun mapRest!18858 () (Array (_ BitVec 32) ValueCell!5402))

(declare-fun mapValue!18858 () ValueCell!5402)

(assert (=> mapNonEmpty!18858 (= (arr!12854 _values!549) (store mapRest!18858 mapKey!18858 mapValue!18858))))

(declare-fun b!437453 () Bool)

(assert (=> b!437453 (= e!258175 tp_is_empty!11491)))

(declare-fun b!437454 () Bool)

(declare-fun res!258108 () Bool)

(assert (=> b!437454 (=> (not res!258108) (not e!258170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437454 (= res!258108 (validKeyInArray!0 k0!794))))

(declare-fun res!258111 () Bool)

(assert (=> start!40058 (=> (not res!258111) (not e!258170))))

(assert (=> start!40058 (= res!258111 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13205 _keys!709))))))

(assert (=> start!40058 e!258170))

(assert (=> start!40058 tp_is_empty!11491))

(assert (=> start!40058 tp!36546))

(assert (=> start!40058 true))

(declare-fun e!258173 () Bool)

(declare-fun array_inv!9402 (array!26810) Bool)

(assert (=> start!40058 (and (array_inv!9402 _values!549) e!258173)))

(declare-fun array_inv!9403 (array!26808) Bool)

(assert (=> start!40058 (array_inv!9403 _keys!709)))

(declare-fun b!437455 () Bool)

(declare-fun res!258103 () Bool)

(assert (=> b!437455 (=> (not res!258103) (not e!258170))))

(assert (=> b!437455 (= res!258103 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13205 _keys!709))))))

(declare-fun b!437456 () Bool)

(assert (=> b!437456 (= e!258172 (not true))))

(declare-fun +!1464 (ListLongMap!6497 tuple2!7582) ListLongMap!6497)

(assert (=> b!437456 (= (getCurrentListMapNoExtraKeys!1497 lt!201681 lt!201684 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1464 (getCurrentListMapNoExtraKeys!1497 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7583 k0!794 v!412)))))

(declare-datatypes ((Unit!13003 0))(
  ( (Unit!13004) )
))
(declare-fun lt!201680 () Unit!13003)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!624 (array!26808 array!26810 (_ BitVec 32) (_ BitVec 32) V!16427 V!16427 (_ BitVec 32) (_ BitVec 64) V!16427 (_ BitVec 32) Int) Unit!13003)

(assert (=> b!437456 (= lt!201680 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!624 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437457 () Bool)

(declare-fun res!258101 () Bool)

(assert (=> b!437457 (=> (not res!258101) (not e!258170))))

(assert (=> b!437457 (= res!258101 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7568))))

(declare-fun b!437458 () Bool)

(assert (=> b!437458 (= e!258173 (and e!258174 mapRes!18858))))

(declare-fun condMapEmpty!18858 () Bool)

(declare-fun mapDefault!18858 () ValueCell!5402)

(assert (=> b!437458 (= condMapEmpty!18858 (= (arr!12854 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5402)) mapDefault!18858)))))

(assert (= (and start!40058 res!258111) b!437451))

(assert (= (and b!437451 res!258099) b!437446))

(assert (= (and b!437446 res!258102) b!437447))

(assert (= (and b!437447 res!258107) b!437457))

(assert (= (and b!437457 res!258101) b!437455))

(assert (= (and b!437455 res!258103) b!437454))

(assert (= (and b!437454 res!258108) b!437444))

(assert (= (and b!437444 res!258104) b!437452))

(assert (= (and b!437452 res!258106) b!437448))

(assert (= (and b!437448 res!258100) b!437450))

(assert (= (and b!437450 res!258109) b!437443))

(assert (= (and b!437443 res!258110) b!437449))

(assert (= (and b!437449 res!258105) b!437456))

(assert (= (and b!437458 condMapEmpty!18858) mapIsEmpty!18858))

(assert (= (and b!437458 (not condMapEmpty!18858)) mapNonEmpty!18858))

(get-info :version)

(assert (= (and mapNonEmpty!18858 ((_ is ValueCellFull!5402) mapValue!18858)) b!437453))

(assert (= (and b!437458 ((_ is ValueCellFull!5402) mapDefault!18858)) b!437445))

(assert (= start!40058 b!437458))

(declare-fun m!425369 () Bool)

(assert (=> b!437448 m!425369))

(declare-fun m!425371 () Bool)

(assert (=> b!437448 m!425371))

(declare-fun m!425373 () Bool)

(assert (=> b!437452 m!425373))

(declare-fun m!425375 () Bool)

(assert (=> b!437444 m!425375))

(declare-fun m!425377 () Bool)

(assert (=> b!437456 m!425377))

(declare-fun m!425379 () Bool)

(assert (=> b!437456 m!425379))

(assert (=> b!437456 m!425379))

(declare-fun m!425381 () Bool)

(assert (=> b!437456 m!425381))

(declare-fun m!425383 () Bool)

(assert (=> b!437456 m!425383))

(declare-fun m!425385 () Bool)

(assert (=> b!437447 m!425385))

(declare-fun m!425387 () Bool)

(assert (=> start!40058 m!425387))

(declare-fun m!425389 () Bool)

(assert (=> start!40058 m!425389))

(declare-fun m!425391 () Bool)

(assert (=> b!437450 m!425391))

(declare-fun m!425393 () Bool)

(assert (=> b!437451 m!425393))

(declare-fun m!425395 () Bool)

(assert (=> b!437449 m!425395))

(declare-fun m!425397 () Bool)

(assert (=> b!437449 m!425397))

(declare-fun m!425399 () Bool)

(assert (=> b!437449 m!425399))

(declare-fun m!425401 () Bool)

(assert (=> mapNonEmpty!18858 m!425401))

(declare-fun m!425403 () Bool)

(assert (=> b!437454 m!425403))

(declare-fun m!425405 () Bool)

(assert (=> b!437457 m!425405))

(check-sat (not mapNonEmpty!18858) (not b!437450) (not b!437448) (not b_next!10339) tp_is_empty!11491 (not b!437447) (not b!437452) (not start!40058) (not b!437457) b_and!18321 (not b!437456) (not b!437451) (not b!437449) (not b!437454))
(check-sat b_and!18321 (not b_next!10339))
