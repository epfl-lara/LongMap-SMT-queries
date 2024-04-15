; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40088 () Bool)

(assert start!40088)

(declare-fun b_free!10369 () Bool)

(declare-fun b_next!10369 () Bool)

(assert (=> start!40088 (= b_free!10369 (not b_next!10369))))

(declare-fun tp!36636 () Bool)

(declare-fun b_and!18311 () Bool)

(assert (=> start!40088 (= tp!36636 b_and!18311)))

(declare-fun b!437941 () Bool)

(declare-fun res!258559 () Bool)

(declare-fun e!258346 () Bool)

(assert (=> b!437941 (=> (not res!258559) (not e!258346))))

(declare-datatypes ((array!26861 0))(
  ( (array!26862 (arr!12880 (Array (_ BitVec 32) (_ BitVec 64))) (size!13233 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26861)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437941 (= res!258559 (or (= (select (arr!12880 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12880 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437942 () Bool)

(declare-fun e!258345 () Bool)

(declare-fun e!258347 () Bool)

(declare-fun mapRes!18903 () Bool)

(assert (=> b!437942 (= e!258345 (and e!258347 mapRes!18903))))

(declare-fun condMapEmpty!18903 () Bool)

(declare-datatypes ((V!16467 0))(
  ( (V!16468 (val!5805 Int)) )
))
(declare-datatypes ((ValueCell!5417 0))(
  ( (ValueCellFull!5417 (v!8046 V!16467)) (EmptyCell!5417) )
))
(declare-datatypes ((array!26863 0))(
  ( (array!26864 (arr!12881 (Array (_ BitVec 32) ValueCell!5417)) (size!13234 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26863)

(declare-fun mapDefault!18903 () ValueCell!5417)

(assert (=> b!437942 (= condMapEmpty!18903 (= (arr!12881 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5417)) mapDefault!18903)))))

(declare-fun b!437943 () Bool)

(declare-fun e!258344 () Bool)

(assert (=> b!437943 (= e!258344 (not true))))

(declare-fun lt!201654 () array!26863)

(declare-fun minValue!515 () V!16467)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16467)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!201652 () array!26861)

(declare-fun v!412 () V!16467)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7716 0))(
  ( (tuple2!7717 (_1!3869 (_ BitVec 64)) (_2!3869 V!16467)) )
))
(declare-datatypes ((List!7703 0))(
  ( (Nil!7700) (Cons!7699 (h!8555 tuple2!7716) (t!13450 List!7703)) )
))
(declare-datatypes ((ListLongMap!6619 0))(
  ( (ListLongMap!6620 (toList!3325 List!7703)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1524 (array!26861 array!26863 (_ BitVec 32) (_ BitVec 32) V!16467 V!16467 (_ BitVec 32) Int) ListLongMap!6619)

(declare-fun +!1497 (ListLongMap!6619 tuple2!7716) ListLongMap!6619)

(assert (=> b!437943 (= (getCurrentListMapNoExtraKeys!1524 lt!201652 lt!201654 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1497 (getCurrentListMapNoExtraKeys!1524 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7717 k0!794 v!412)))))

(declare-datatypes ((Unit!13011 0))(
  ( (Unit!13012) )
))
(declare-fun lt!201655 () Unit!13011)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!635 (array!26861 array!26863 (_ BitVec 32) (_ BitVec 32) V!16467 V!16467 (_ BitVec 32) (_ BitVec 64) V!16467 (_ BitVec 32) Int) Unit!13011)

(assert (=> b!437943 (= lt!201655 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!635 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437944 () Bool)

(declare-fun res!258568 () Bool)

(declare-fun e!258343 () Bool)

(assert (=> b!437944 (=> (not res!258568) (not e!258343))))

(declare-datatypes ((List!7704 0))(
  ( (Nil!7701) (Cons!7700 (h!8556 (_ BitVec 64)) (t!13451 List!7704)) )
))
(declare-fun arrayNoDuplicates!0 (array!26861 (_ BitVec 32) List!7704) Bool)

(assert (=> b!437944 (= res!258568 (arrayNoDuplicates!0 lt!201652 #b00000000000000000000000000000000 Nil!7701))))

(declare-fun b!437945 () Bool)

(assert (=> b!437945 (= e!258343 e!258344)))

(declare-fun res!258569 () Bool)

(assert (=> b!437945 (=> (not res!258569) (not e!258344))))

(assert (=> b!437945 (= res!258569 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201653 () ListLongMap!6619)

(assert (=> b!437945 (= lt!201653 (getCurrentListMapNoExtraKeys!1524 lt!201652 lt!201654 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!437945 (= lt!201654 (array!26864 (store (arr!12881 _values!549) i!563 (ValueCellFull!5417 v!412)) (size!13234 _values!549)))))

(declare-fun lt!201656 () ListLongMap!6619)

(assert (=> b!437945 (= lt!201656 (getCurrentListMapNoExtraKeys!1524 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437946 () Bool)

(declare-fun res!258567 () Bool)

(assert (=> b!437946 (=> (not res!258567) (not e!258346))))

(assert (=> b!437946 (= res!258567 (and (= (size!13234 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13233 _keys!709) (size!13234 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437947 () Bool)

(declare-fun res!258561 () Bool)

(assert (=> b!437947 (=> (not res!258561) (not e!258346))))

(assert (=> b!437947 (= res!258561 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7701))))

(declare-fun b!437948 () Bool)

(assert (=> b!437948 (= e!258346 e!258343)))

(declare-fun res!258566 () Bool)

(assert (=> b!437948 (=> (not res!258566) (not e!258343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26861 (_ BitVec 32)) Bool)

(assert (=> b!437948 (= res!258566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201652 mask!1025))))

(assert (=> b!437948 (= lt!201652 (array!26862 (store (arr!12880 _keys!709) i!563 k0!794) (size!13233 _keys!709)))))

(declare-fun mapNonEmpty!18903 () Bool)

(declare-fun tp!36635 () Bool)

(declare-fun e!258348 () Bool)

(assert (=> mapNonEmpty!18903 (= mapRes!18903 (and tp!36635 e!258348))))

(declare-fun mapValue!18903 () ValueCell!5417)

(declare-fun mapKey!18903 () (_ BitVec 32))

(declare-fun mapRest!18903 () (Array (_ BitVec 32) ValueCell!5417))

(assert (=> mapNonEmpty!18903 (= (arr!12881 _values!549) (store mapRest!18903 mapKey!18903 mapValue!18903))))

(declare-fun b!437949 () Bool)

(declare-fun res!258570 () Bool)

(assert (=> b!437949 (=> (not res!258570) (not e!258346))))

(assert (=> b!437949 (= res!258570 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13233 _keys!709))))))

(declare-fun b!437950 () Bool)

(declare-fun res!258564 () Bool)

(assert (=> b!437950 (=> (not res!258564) (not e!258346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437950 (= res!258564 (validMask!0 mask!1025))))

(declare-fun b!437951 () Bool)

(declare-fun res!258562 () Bool)

(assert (=> b!437951 (=> (not res!258562) (not e!258346))))

(declare-fun arrayContainsKey!0 (array!26861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437951 (= res!258562 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437952 () Bool)

(declare-fun res!258565 () Bool)

(assert (=> b!437952 (=> (not res!258565) (not e!258346))))

(assert (=> b!437952 (= res!258565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18903 () Bool)

(assert (=> mapIsEmpty!18903 mapRes!18903))

(declare-fun b!437953 () Bool)

(declare-fun res!258563 () Bool)

(assert (=> b!437953 (=> (not res!258563) (not e!258343))))

(assert (=> b!437953 (= res!258563 (bvsle from!863 i!563))))

(declare-fun b!437954 () Bool)

(declare-fun tp_is_empty!11521 () Bool)

(assert (=> b!437954 (= e!258347 tp_is_empty!11521)))

(declare-fun res!258558 () Bool)

(assert (=> start!40088 (=> (not res!258558) (not e!258346))))

(assert (=> start!40088 (= res!258558 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13233 _keys!709))))))

(assert (=> start!40088 e!258346))

(assert (=> start!40088 tp_is_empty!11521))

(assert (=> start!40088 tp!36636))

(assert (=> start!40088 true))

(declare-fun array_inv!9402 (array!26863) Bool)

(assert (=> start!40088 (and (array_inv!9402 _values!549) e!258345)))

(declare-fun array_inv!9403 (array!26861) Bool)

(assert (=> start!40088 (array_inv!9403 _keys!709)))

(declare-fun b!437955 () Bool)

(assert (=> b!437955 (= e!258348 tp_is_empty!11521)))

(declare-fun b!437956 () Bool)

(declare-fun res!258560 () Bool)

(assert (=> b!437956 (=> (not res!258560) (not e!258346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437956 (= res!258560 (validKeyInArray!0 k0!794))))

(assert (= (and start!40088 res!258558) b!437950))

(assert (= (and b!437950 res!258564) b!437946))

(assert (= (and b!437946 res!258567) b!437952))

(assert (= (and b!437952 res!258565) b!437947))

(assert (= (and b!437947 res!258561) b!437949))

(assert (= (and b!437949 res!258570) b!437956))

(assert (= (and b!437956 res!258560) b!437941))

(assert (= (and b!437941 res!258559) b!437951))

(assert (= (and b!437951 res!258562) b!437948))

(assert (= (and b!437948 res!258566) b!437944))

(assert (= (and b!437944 res!258568) b!437953))

(assert (= (and b!437953 res!258563) b!437945))

(assert (= (and b!437945 res!258569) b!437943))

(assert (= (and b!437942 condMapEmpty!18903) mapIsEmpty!18903))

(assert (= (and b!437942 (not condMapEmpty!18903)) mapNonEmpty!18903))

(get-info :version)

(assert (= (and mapNonEmpty!18903 ((_ is ValueCellFull!5417) mapValue!18903)) b!437955))

(assert (= (and b!437942 ((_ is ValueCellFull!5417) mapDefault!18903)) b!437954))

(assert (= start!40088 b!437942))

(declare-fun m!424989 () Bool)

(assert (=> b!437950 m!424989))

(declare-fun m!424991 () Bool)

(assert (=> b!437947 m!424991))

(declare-fun m!424993 () Bool)

(assert (=> b!437951 m!424993))

(declare-fun m!424995 () Bool)

(assert (=> b!437945 m!424995))

(declare-fun m!424997 () Bool)

(assert (=> b!437945 m!424997))

(declare-fun m!424999 () Bool)

(assert (=> b!437945 m!424999))

(declare-fun m!425001 () Bool)

(assert (=> start!40088 m!425001))

(declare-fun m!425003 () Bool)

(assert (=> start!40088 m!425003))

(declare-fun m!425005 () Bool)

(assert (=> b!437941 m!425005))

(declare-fun m!425007 () Bool)

(assert (=> b!437944 m!425007))

(declare-fun m!425009 () Bool)

(assert (=> mapNonEmpty!18903 m!425009))

(declare-fun m!425011 () Bool)

(assert (=> b!437943 m!425011))

(declare-fun m!425013 () Bool)

(assert (=> b!437943 m!425013))

(assert (=> b!437943 m!425013))

(declare-fun m!425015 () Bool)

(assert (=> b!437943 m!425015))

(declare-fun m!425017 () Bool)

(assert (=> b!437943 m!425017))

(declare-fun m!425019 () Bool)

(assert (=> b!437952 m!425019))

(declare-fun m!425021 () Bool)

(assert (=> b!437948 m!425021))

(declare-fun m!425023 () Bool)

(assert (=> b!437948 m!425023))

(declare-fun m!425025 () Bool)

(assert (=> b!437956 m!425025))

(check-sat tp_is_empty!11521 (not b!437948) (not b!437947) (not b!437952) (not b!437944) (not b!437950) (not mapNonEmpty!18903) b_and!18311 (not b!437943) (not b!437956) (not b!437945) (not b!437951) (not start!40088) (not b_next!10369))
(check-sat b_and!18311 (not b_next!10369))
