; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40082 () Bool)

(assert start!40082)

(declare-fun b_free!10363 () Bool)

(declare-fun b_next!10363 () Bool)

(assert (=> start!40082 (= b_free!10363 (not b_next!10363))))

(declare-fun tp!36618 () Bool)

(declare-fun b_and!18345 () Bool)

(assert (=> start!40082 (= tp!36618 b_and!18345)))

(declare-fun b!438020 () Bool)

(declare-fun res!258571 () Bool)

(declare-fun e!258423 () Bool)

(assert (=> b!438020 (=> (not res!258571) (not e!258423))))

(declare-datatypes ((array!26854 0))(
  ( (array!26855 (arr!12876 (Array (_ BitVec 32) (_ BitVec 64))) (size!13228 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26854)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438020 (= res!258571 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438021 () Bool)

(declare-fun e!258422 () Bool)

(declare-fun tp_is_empty!11515 () Bool)

(assert (=> b!438021 (= e!258422 tp_is_empty!11515)))

(declare-fun b!438022 () Bool)

(declare-fun res!258573 () Bool)

(assert (=> b!438022 (=> (not res!258573) (not e!258423))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438022 (= res!258573 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13228 _keys!709))))))

(declare-fun b!438023 () Bool)

(declare-fun res!258576 () Bool)

(assert (=> b!438023 (=> (not res!258576) (not e!258423))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16459 0))(
  ( (V!16460 (val!5802 Int)) )
))
(declare-datatypes ((ValueCell!5414 0))(
  ( (ValueCellFull!5414 (v!8050 V!16459)) (EmptyCell!5414) )
))
(declare-datatypes ((array!26856 0))(
  ( (array!26857 (arr!12877 (Array (_ BitVec 32) ValueCell!5414)) (size!13229 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26856)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!438023 (= res!258576 (and (= (size!13229 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13228 _keys!709) (size!13229 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438024 () Bool)

(declare-fun e!258426 () Bool)

(assert (=> b!438024 (= e!258423 e!258426)))

(declare-fun res!258572 () Bool)

(assert (=> b!438024 (=> (not res!258572) (not e!258426))))

(declare-fun lt!201861 () array!26854)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26854 (_ BitVec 32)) Bool)

(assert (=> b!438024 (= res!258572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201861 mask!1025))))

(assert (=> b!438024 (= lt!201861 (array!26855 (store (arr!12876 _keys!709) i!563 k0!794) (size!13228 _keys!709)))))

(declare-fun b!438025 () Bool)

(declare-fun res!258579 () Bool)

(assert (=> b!438025 (=> (not res!258579) (not e!258426))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!438025 (= res!258579 (bvsle from!863 i!563))))

(declare-fun b!438026 () Bool)

(declare-fun res!258575 () Bool)

(assert (=> b!438026 (=> (not res!258575) (not e!258423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438026 (= res!258575 (validKeyInArray!0 k0!794))))

(declare-fun b!438027 () Bool)

(declare-fun e!258427 () Bool)

(declare-fun mapRes!18894 () Bool)

(assert (=> b!438027 (= e!258427 (and e!258422 mapRes!18894))))

(declare-fun condMapEmpty!18894 () Bool)

(declare-fun mapDefault!18894 () ValueCell!5414)

(assert (=> b!438027 (= condMapEmpty!18894 (= (arr!12877 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5414)) mapDefault!18894)))))

(declare-fun mapNonEmpty!18894 () Bool)

(declare-fun tp!36617 () Bool)

(declare-fun e!258421 () Bool)

(assert (=> mapNonEmpty!18894 (= mapRes!18894 (and tp!36617 e!258421))))

(declare-fun mapValue!18894 () ValueCell!5414)

(declare-fun mapRest!18894 () (Array (_ BitVec 32) ValueCell!5414))

(declare-fun mapKey!18894 () (_ BitVec 32))

(assert (=> mapNonEmpty!18894 (= (arr!12877 _values!549) (store mapRest!18894 mapKey!18894 mapValue!18894))))

(declare-fun b!438028 () Bool)

(assert (=> b!438028 (= e!258421 tp_is_empty!11515)))

(declare-fun mapIsEmpty!18894 () Bool)

(assert (=> mapIsEmpty!18894 mapRes!18894))

(declare-fun b!438029 () Bool)

(declare-fun res!258568 () Bool)

(assert (=> b!438029 (=> (not res!258568) (not e!258423))))

(declare-datatypes ((List!7587 0))(
  ( (Nil!7584) (Cons!7583 (h!8439 (_ BitVec 64)) (t!13335 List!7587)) )
))
(declare-fun arrayNoDuplicates!0 (array!26854 (_ BitVec 32) List!7587) Bool)

(assert (=> b!438029 (= res!258568 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7584))))

(declare-fun b!438019 () Bool)

(declare-fun e!258425 () Bool)

(assert (=> b!438019 (= e!258425 (not true))))

(declare-fun minValue!515 () V!16459)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!201862 () array!26856)

(declare-fun zeroValue!515 () V!16459)

(declare-fun v!412 () V!16459)

(declare-datatypes ((tuple2!7600 0))(
  ( (tuple2!7601 (_1!3811 (_ BitVec 64)) (_2!3811 V!16459)) )
))
(declare-datatypes ((List!7588 0))(
  ( (Nil!7585) (Cons!7584 (h!8440 tuple2!7600) (t!13336 List!7588)) )
))
(declare-datatypes ((ListLongMap!6515 0))(
  ( (ListLongMap!6516 (toList!3273 List!7588)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1506 (array!26854 array!26856 (_ BitVec 32) (_ BitVec 32) V!16459 V!16459 (_ BitVec 32) Int) ListLongMap!6515)

(declare-fun +!1470 (ListLongMap!6515 tuple2!7600) ListLongMap!6515)

(assert (=> b!438019 (= (getCurrentListMapNoExtraKeys!1506 lt!201861 lt!201862 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1470 (getCurrentListMapNoExtraKeys!1506 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7601 k0!794 v!412)))))

(declare-datatypes ((Unit!13015 0))(
  ( (Unit!13016) )
))
(declare-fun lt!201864 () Unit!13015)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!630 (array!26854 array!26856 (_ BitVec 32) (_ BitVec 32) V!16459 V!16459 (_ BitVec 32) (_ BitVec 64) V!16459 (_ BitVec 32) Int) Unit!13015)

(assert (=> b!438019 (= lt!201864 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!630 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!258567 () Bool)

(assert (=> start!40082 (=> (not res!258567) (not e!258423))))

(assert (=> start!40082 (= res!258567 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13228 _keys!709))))))

(assert (=> start!40082 e!258423))

(assert (=> start!40082 tp_is_empty!11515))

(assert (=> start!40082 tp!36618))

(assert (=> start!40082 true))

(declare-fun array_inv!9416 (array!26856) Bool)

(assert (=> start!40082 (and (array_inv!9416 _values!549) e!258427)))

(declare-fun array_inv!9417 (array!26854) Bool)

(assert (=> start!40082 (array_inv!9417 _keys!709)))

(declare-fun b!438030 () Bool)

(declare-fun res!258570 () Bool)

(assert (=> b!438030 (=> (not res!258570) (not e!258423))))

(assert (=> b!438030 (= res!258570 (or (= (select (arr!12876 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12876 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438031 () Bool)

(declare-fun res!258574 () Bool)

(assert (=> b!438031 (=> (not res!258574) (not e!258423))))

(assert (=> b!438031 (= res!258574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438032 () Bool)

(declare-fun res!258577 () Bool)

(assert (=> b!438032 (=> (not res!258577) (not e!258426))))

(assert (=> b!438032 (= res!258577 (arrayNoDuplicates!0 lt!201861 #b00000000000000000000000000000000 Nil!7584))))

(declare-fun b!438033 () Bool)

(declare-fun res!258569 () Bool)

(assert (=> b!438033 (=> (not res!258569) (not e!258423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438033 (= res!258569 (validMask!0 mask!1025))))

(declare-fun b!438034 () Bool)

(assert (=> b!438034 (= e!258426 e!258425)))

(declare-fun res!258578 () Bool)

(assert (=> b!438034 (=> (not res!258578) (not e!258425))))

(assert (=> b!438034 (= res!258578 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201863 () ListLongMap!6515)

(assert (=> b!438034 (= lt!201863 (getCurrentListMapNoExtraKeys!1506 lt!201861 lt!201862 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438034 (= lt!201862 (array!26857 (store (arr!12877 _values!549) i!563 (ValueCellFull!5414 v!412)) (size!13229 _values!549)))))

(declare-fun lt!201860 () ListLongMap!6515)

(assert (=> b!438034 (= lt!201860 (getCurrentListMapNoExtraKeys!1506 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40082 res!258567) b!438033))

(assert (= (and b!438033 res!258569) b!438023))

(assert (= (and b!438023 res!258576) b!438031))

(assert (= (and b!438031 res!258574) b!438029))

(assert (= (and b!438029 res!258568) b!438022))

(assert (= (and b!438022 res!258573) b!438026))

(assert (= (and b!438026 res!258575) b!438030))

(assert (= (and b!438030 res!258570) b!438020))

(assert (= (and b!438020 res!258571) b!438024))

(assert (= (and b!438024 res!258572) b!438032))

(assert (= (and b!438032 res!258577) b!438025))

(assert (= (and b!438025 res!258579) b!438034))

(assert (= (and b!438034 res!258578) b!438019))

(assert (= (and b!438027 condMapEmpty!18894) mapIsEmpty!18894))

(assert (= (and b!438027 (not condMapEmpty!18894)) mapNonEmpty!18894))

(get-info :version)

(assert (= (and mapNonEmpty!18894 ((_ is ValueCellFull!5414) mapValue!18894)) b!438028))

(assert (= (and b!438027 ((_ is ValueCellFull!5414) mapDefault!18894)) b!438021))

(assert (= start!40082 b!438027))

(declare-fun m!425825 () Bool)

(assert (=> mapNonEmpty!18894 m!425825))

(declare-fun m!425827 () Bool)

(assert (=> b!438029 m!425827))

(declare-fun m!425829 () Bool)

(assert (=> b!438024 m!425829))

(declare-fun m!425831 () Bool)

(assert (=> b!438024 m!425831))

(declare-fun m!425833 () Bool)

(assert (=> b!438031 m!425833))

(declare-fun m!425835 () Bool)

(assert (=> b!438026 m!425835))

(declare-fun m!425837 () Bool)

(assert (=> b!438020 m!425837))

(declare-fun m!425839 () Bool)

(assert (=> b!438034 m!425839))

(declare-fun m!425841 () Bool)

(assert (=> b!438034 m!425841))

(declare-fun m!425843 () Bool)

(assert (=> b!438034 m!425843))

(declare-fun m!425845 () Bool)

(assert (=> b!438033 m!425845))

(declare-fun m!425847 () Bool)

(assert (=> b!438030 m!425847))

(declare-fun m!425849 () Bool)

(assert (=> b!438019 m!425849))

(declare-fun m!425851 () Bool)

(assert (=> b!438019 m!425851))

(assert (=> b!438019 m!425851))

(declare-fun m!425853 () Bool)

(assert (=> b!438019 m!425853))

(declare-fun m!425855 () Bool)

(assert (=> b!438019 m!425855))

(declare-fun m!425857 () Bool)

(assert (=> b!438032 m!425857))

(declare-fun m!425859 () Bool)

(assert (=> start!40082 m!425859))

(declare-fun m!425861 () Bool)

(assert (=> start!40082 m!425861))

(check-sat (not b!438020) tp_is_empty!11515 (not b!438032) (not b!438026) (not mapNonEmpty!18894) (not b!438031) (not b!438029) (not b!438019) (not b!438024) b_and!18345 (not b!438034) (not b!438033) (not start!40082) (not b_next!10363))
(check-sat b_and!18345 (not b_next!10363))
