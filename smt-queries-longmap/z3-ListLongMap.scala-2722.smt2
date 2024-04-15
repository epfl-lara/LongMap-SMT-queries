; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40136 () Bool)

(assert start!40136)

(declare-fun b_free!10417 () Bool)

(declare-fun b_next!10417 () Bool)

(assert (=> start!40136 (= b_free!10417 (not b_next!10417))))

(declare-fun tp!36779 () Bool)

(declare-fun b_and!18359 () Bool)

(assert (=> start!40136 (= tp!36779 b_and!18359)))

(declare-fun b!439093 () Bool)

(declare-fun e!258846 () Bool)

(declare-fun e!258851 () Bool)

(declare-fun mapRes!18975 () Bool)

(assert (=> b!439093 (= e!258846 (and e!258851 mapRes!18975))))

(declare-fun condMapEmpty!18975 () Bool)

(declare-datatypes ((V!16531 0))(
  ( (V!16532 (val!5829 Int)) )
))
(declare-datatypes ((ValueCell!5441 0))(
  ( (ValueCellFull!5441 (v!8070 V!16531)) (EmptyCell!5441) )
))
(declare-datatypes ((array!26955 0))(
  ( (array!26956 (arr!12927 (Array (_ BitVec 32) ValueCell!5441)) (size!13280 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26955)

(declare-fun mapDefault!18975 () ValueCell!5441)

(assert (=> b!439093 (= condMapEmpty!18975 (= (arr!12927 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5441)) mapDefault!18975)))))

(declare-fun b!439094 () Bool)

(declare-fun e!258847 () Bool)

(declare-fun e!258850 () Bool)

(assert (=> b!439094 (= e!258847 e!258850)))

(declare-fun res!259497 () Bool)

(assert (=> b!439094 (=> (not res!259497) (not e!258850))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439094 (= res!259497 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16531)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!202016 () array!26955)

(declare-fun minValue!515 () V!16531)

(declare-datatypes ((tuple2!7756 0))(
  ( (tuple2!7757 (_1!3889 (_ BitVec 64)) (_2!3889 V!16531)) )
))
(declare-datatypes ((List!7743 0))(
  ( (Nil!7740) (Cons!7739 (h!8595 tuple2!7756) (t!13490 List!7743)) )
))
(declare-datatypes ((ListLongMap!6659 0))(
  ( (ListLongMap!6660 (toList!3345 List!7743)) )
))
(declare-fun lt!202015 () ListLongMap!6659)

(declare-datatypes ((array!26957 0))(
  ( (array!26958 (arr!12928 (Array (_ BitVec 32) (_ BitVec 64))) (size!13281 (_ BitVec 32))) )
))
(declare-fun lt!202013 () array!26957)

(declare-fun getCurrentListMapNoExtraKeys!1544 (array!26957 array!26955 (_ BitVec 32) (_ BitVec 32) V!16531 V!16531 (_ BitVec 32) Int) ListLongMap!6659)

(assert (=> b!439094 (= lt!202015 (getCurrentListMapNoExtraKeys!1544 lt!202013 lt!202016 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16531)

(assert (=> b!439094 (= lt!202016 (array!26956 (store (arr!12927 _values!549) i!563 (ValueCellFull!5441 v!412)) (size!13280 _values!549)))))

(declare-fun lt!202012 () ListLongMap!6659)

(declare-fun _keys!709 () array!26957)

(assert (=> b!439094 (= lt!202012 (getCurrentListMapNoExtraKeys!1544 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439095 () Bool)

(declare-fun res!259501 () Bool)

(assert (=> b!439095 (=> (not res!259501) (not e!258847))))

(assert (=> b!439095 (= res!259501 (bvsle from!863 i!563))))

(declare-fun b!439096 () Bool)

(declare-fun res!259503 () Bool)

(declare-fun e!258848 () Bool)

(assert (=> b!439096 (=> (not res!259503) (not e!258848))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439096 (= res!259503 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439097 () Bool)

(assert (=> b!439097 (= e!258848 e!258847)))

(declare-fun res!259502 () Bool)

(assert (=> b!439097 (=> (not res!259502) (not e!258847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26957 (_ BitVec 32)) Bool)

(assert (=> b!439097 (= res!259502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202013 mask!1025))))

(assert (=> b!439097 (= lt!202013 (array!26958 (store (arr!12928 _keys!709) i!563 k0!794) (size!13281 _keys!709)))))

(declare-fun b!439098 () Bool)

(declare-fun tp_is_empty!11569 () Bool)

(assert (=> b!439098 (= e!258851 tp_is_empty!11569)))

(declare-fun mapIsEmpty!18975 () Bool)

(assert (=> mapIsEmpty!18975 mapRes!18975))

(declare-fun b!439099 () Bool)

(declare-fun res!259498 () Bool)

(assert (=> b!439099 (=> (not res!259498) (not e!258848))))

(assert (=> b!439099 (= res!259498 (or (= (select (arr!12928 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12928 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439100 () Bool)

(declare-fun res!259500 () Bool)

(assert (=> b!439100 (=> (not res!259500) (not e!258848))))

(assert (=> b!439100 (= res!259500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439102 () Bool)

(declare-fun res!259505 () Bool)

(assert (=> b!439102 (=> (not res!259505) (not e!258848))))

(assert (=> b!439102 (= res!259505 (and (= (size!13280 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13281 _keys!709) (size!13280 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439103 () Bool)

(declare-fun res!259496 () Bool)

(assert (=> b!439103 (=> (not res!259496) (not e!258848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439103 (= res!259496 (validMask!0 mask!1025))))

(declare-fun b!439104 () Bool)

(declare-fun res!259506 () Bool)

(assert (=> b!439104 (=> (not res!259506) (not e!258847))))

(declare-datatypes ((List!7744 0))(
  ( (Nil!7741) (Cons!7740 (h!8596 (_ BitVec 64)) (t!13491 List!7744)) )
))
(declare-fun arrayNoDuplicates!0 (array!26957 (_ BitVec 32) List!7744) Bool)

(assert (=> b!439104 (= res!259506 (arrayNoDuplicates!0 lt!202013 #b00000000000000000000000000000000 Nil!7741))))

(declare-fun b!439105 () Bool)

(assert (=> b!439105 (= e!258850 (not true))))

(declare-fun +!1509 (ListLongMap!6659 tuple2!7756) ListLongMap!6659)

(assert (=> b!439105 (= (getCurrentListMapNoExtraKeys!1544 lt!202013 lt!202016 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1509 (getCurrentListMapNoExtraKeys!1544 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7757 k0!794 v!412)))))

(declare-datatypes ((Unit!13035 0))(
  ( (Unit!13036) )
))
(declare-fun lt!202014 () Unit!13035)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!647 (array!26957 array!26955 (_ BitVec 32) (_ BitVec 32) V!16531 V!16531 (_ BitVec 32) (_ BitVec 64) V!16531 (_ BitVec 32) Int) Unit!13035)

(assert (=> b!439105 (= lt!202014 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!647 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439106 () Bool)

(declare-fun res!259494 () Bool)

(assert (=> b!439106 (=> (not res!259494) (not e!258848))))

(assert (=> b!439106 (= res!259494 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13281 _keys!709))))))

(declare-fun mapNonEmpty!18975 () Bool)

(declare-fun tp!36780 () Bool)

(declare-fun e!258852 () Bool)

(assert (=> mapNonEmpty!18975 (= mapRes!18975 (and tp!36780 e!258852))))

(declare-fun mapRest!18975 () (Array (_ BitVec 32) ValueCell!5441))

(declare-fun mapKey!18975 () (_ BitVec 32))

(declare-fun mapValue!18975 () ValueCell!5441)

(assert (=> mapNonEmpty!18975 (= (arr!12927 _values!549) (store mapRest!18975 mapKey!18975 mapValue!18975))))

(declare-fun res!259504 () Bool)

(assert (=> start!40136 (=> (not res!259504) (not e!258848))))

(assert (=> start!40136 (= res!259504 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13281 _keys!709))))))

(assert (=> start!40136 e!258848))

(assert (=> start!40136 tp_is_empty!11569))

(assert (=> start!40136 tp!36779))

(assert (=> start!40136 true))

(declare-fun array_inv!9430 (array!26955) Bool)

(assert (=> start!40136 (and (array_inv!9430 _values!549) e!258846)))

(declare-fun array_inv!9431 (array!26957) Bool)

(assert (=> start!40136 (array_inv!9431 _keys!709)))

(declare-fun b!439101 () Bool)

(declare-fun res!259499 () Bool)

(assert (=> b!439101 (=> (not res!259499) (not e!258848))))

(assert (=> b!439101 (= res!259499 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7741))))

(declare-fun b!439107 () Bool)

(assert (=> b!439107 (= e!258852 tp_is_empty!11569)))

(declare-fun b!439108 () Bool)

(declare-fun res!259495 () Bool)

(assert (=> b!439108 (=> (not res!259495) (not e!258848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439108 (= res!259495 (validKeyInArray!0 k0!794))))

(assert (= (and start!40136 res!259504) b!439103))

(assert (= (and b!439103 res!259496) b!439102))

(assert (= (and b!439102 res!259505) b!439100))

(assert (= (and b!439100 res!259500) b!439101))

(assert (= (and b!439101 res!259499) b!439106))

(assert (= (and b!439106 res!259494) b!439108))

(assert (= (and b!439108 res!259495) b!439099))

(assert (= (and b!439099 res!259498) b!439096))

(assert (= (and b!439096 res!259503) b!439097))

(assert (= (and b!439097 res!259502) b!439104))

(assert (= (and b!439104 res!259506) b!439095))

(assert (= (and b!439095 res!259501) b!439094))

(assert (= (and b!439094 res!259497) b!439105))

(assert (= (and b!439093 condMapEmpty!18975) mapIsEmpty!18975))

(assert (= (and b!439093 (not condMapEmpty!18975)) mapNonEmpty!18975))

(get-info :version)

(assert (= (and mapNonEmpty!18975 ((_ is ValueCellFull!5441) mapValue!18975)) b!439107))

(assert (= (and b!439093 ((_ is ValueCellFull!5441) mapDefault!18975)) b!439098))

(assert (= start!40136 b!439093))

(declare-fun m!425901 () Bool)

(assert (=> b!439103 m!425901))

(declare-fun m!425903 () Bool)

(assert (=> b!439094 m!425903))

(declare-fun m!425905 () Bool)

(assert (=> b!439094 m!425905))

(declare-fun m!425907 () Bool)

(assert (=> b!439094 m!425907))

(declare-fun m!425909 () Bool)

(assert (=> b!439096 m!425909))

(declare-fun m!425911 () Bool)

(assert (=> b!439108 m!425911))

(declare-fun m!425913 () Bool)

(assert (=> b!439097 m!425913))

(declare-fun m!425915 () Bool)

(assert (=> b!439097 m!425915))

(declare-fun m!425917 () Bool)

(assert (=> b!439104 m!425917))

(declare-fun m!425919 () Bool)

(assert (=> start!40136 m!425919))

(declare-fun m!425921 () Bool)

(assert (=> start!40136 m!425921))

(declare-fun m!425923 () Bool)

(assert (=> mapNonEmpty!18975 m!425923))

(declare-fun m!425925 () Bool)

(assert (=> b!439105 m!425925))

(declare-fun m!425927 () Bool)

(assert (=> b!439105 m!425927))

(assert (=> b!439105 m!425927))

(declare-fun m!425929 () Bool)

(assert (=> b!439105 m!425929))

(declare-fun m!425931 () Bool)

(assert (=> b!439105 m!425931))

(declare-fun m!425933 () Bool)

(assert (=> b!439099 m!425933))

(declare-fun m!425935 () Bool)

(assert (=> b!439101 m!425935))

(declare-fun m!425937 () Bool)

(assert (=> b!439100 m!425937))

(check-sat (not b!439104) tp_is_empty!11569 (not b!439094) (not start!40136) (not b!439096) (not b!439100) (not b_next!10417) (not b!439103) (not b!439097) (not b!439105) (not b!439108) (not mapNonEmpty!18975) b_and!18359 (not b!439101))
(check-sat b_and!18359 (not b_next!10417))
