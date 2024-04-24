; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37158 () Bool)

(assert start!37158)

(declare-fun b_free!8299 () Bool)

(declare-fun b_next!8299 () Bool)

(assert (=> start!37158 (= b_free!8299 (not b_next!8299))))

(declare-fun tp!29613 () Bool)

(declare-fun b_and!15555 () Bool)

(assert (=> start!37158 (= tp!29613 b_and!15555)))

(declare-fun b!375113 () Bool)

(declare-fun res!211729 () Bool)

(declare-fun e!228557 () Bool)

(assert (=> b!375113 (=> (not res!211729) (not e!228557))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375113 (= res!211729 (validKeyInArray!0 k0!778))))

(declare-fun b!375114 () Bool)

(declare-fun res!211727 () Bool)

(assert (=> b!375114 (=> (not res!211727) (not e!228557))))

(declare-datatypes ((array!21812 0))(
  ( (array!21813 (arr!10374 (Array (_ BitVec 32) (_ BitVec 64))) (size!10726 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21812)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21812 (_ BitVec 32)) Bool)

(assert (=> b!375114 (= res!211727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14985 () Bool)

(declare-fun mapRes!14985 () Bool)

(assert (=> mapIsEmpty!14985 mapRes!14985))

(declare-fun res!211721 () Bool)

(assert (=> start!37158 (=> (not res!211721) (not e!228557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37158 (= res!211721 (validMask!0 mask!970))))

(assert (=> start!37158 e!228557))

(declare-datatypes ((V!13035 0))(
  ( (V!13036 (val!4518 Int)) )
))
(declare-datatypes ((ValueCell!4130 0))(
  ( (ValueCellFull!4130 (v!6716 V!13035)) (EmptyCell!4130) )
))
(declare-datatypes ((array!21814 0))(
  ( (array!21815 (arr!10375 (Array (_ BitVec 32) ValueCell!4130)) (size!10727 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21814)

(declare-fun e!228551 () Bool)

(declare-fun array_inv!7700 (array!21814) Bool)

(assert (=> start!37158 (and (array_inv!7700 _values!506) e!228551)))

(assert (=> start!37158 tp!29613))

(assert (=> start!37158 true))

(declare-fun tp_is_empty!8947 () Bool)

(assert (=> start!37158 tp_is_empty!8947))

(declare-fun array_inv!7701 (array!21812) Bool)

(assert (=> start!37158 (array_inv!7701 _keys!658)))

(declare-fun b!375115 () Bool)

(declare-fun res!211728 () Bool)

(assert (=> b!375115 (=> (not res!211728) (not e!228557))))

(declare-fun arrayContainsKey!0 (array!21812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375115 (= res!211728 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!375116 () Bool)

(declare-fun e!228553 () Bool)

(assert (=> b!375116 (= e!228551 (and e!228553 mapRes!14985))))

(declare-fun condMapEmpty!14985 () Bool)

(declare-fun mapDefault!14985 () ValueCell!4130)

(assert (=> b!375116 (= condMapEmpty!14985 (= (arr!10375 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4130)) mapDefault!14985)))))

(declare-fun b!375117 () Bool)

(declare-fun e!228554 () Bool)

(assert (=> b!375117 (= e!228557 e!228554)))

(declare-fun res!211720 () Bool)

(assert (=> b!375117 (=> (not res!211720) (not e!228554))))

(declare-fun lt!173454 () array!21812)

(assert (=> b!375117 (= res!211720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173454 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375117 (= lt!173454 (array!21813 (store (arr!10374 _keys!658) i!548 k0!778) (size!10726 _keys!658)))))

(declare-fun b!375118 () Bool)

(declare-fun e!228552 () Bool)

(assert (=> b!375118 (= e!228554 (not e!228552))))

(declare-fun res!211719 () Bool)

(assert (=> b!375118 (=> res!211719 e!228552)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375118 (= res!211719 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!5914 0))(
  ( (tuple2!5915 (_1!2968 (_ BitVec 64)) (_2!2968 V!13035)) )
))
(declare-datatypes ((List!5758 0))(
  ( (Nil!5755) (Cons!5754 (h!6610 tuple2!5914) (t!10900 List!5758)) )
))
(declare-datatypes ((ListLongMap!4829 0))(
  ( (ListLongMap!4830 (toList!2430 List!5758)) )
))
(declare-fun lt!173460 () ListLongMap!4829)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13035)

(declare-fun minValue!472 () V!13035)

(declare-fun getCurrentListMap!1886 (array!21812 array!21814 (_ BitVec 32) (_ BitVec 32) V!13035 V!13035 (_ BitVec 32) Int) ListLongMap!4829)

(assert (=> b!375118 (= lt!173460 (getCurrentListMap!1886 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173457 () array!21814)

(declare-fun lt!173464 () ListLongMap!4829)

(assert (=> b!375118 (= lt!173464 (getCurrentListMap!1886 lt!173454 lt!173457 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173455 () ListLongMap!4829)

(declare-fun lt!173450 () ListLongMap!4829)

(assert (=> b!375118 (and (= lt!173455 lt!173450) (= lt!173450 lt!173455))))

(declare-fun lt!173448 () ListLongMap!4829)

(declare-fun lt!173458 () tuple2!5914)

(declare-fun +!826 (ListLongMap!4829 tuple2!5914) ListLongMap!4829)

(assert (=> b!375118 (= lt!173450 (+!826 lt!173448 lt!173458))))

(declare-fun v!373 () V!13035)

(assert (=> b!375118 (= lt!173458 (tuple2!5915 k0!778 v!373))))

(declare-datatypes ((Unit!11541 0))(
  ( (Unit!11542) )
))
(declare-fun lt!173461 () Unit!11541)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!73 (array!21812 array!21814 (_ BitVec 32) (_ BitVec 32) V!13035 V!13035 (_ BitVec 32) (_ BitVec 64) V!13035 (_ BitVec 32) Int) Unit!11541)

(assert (=> b!375118 (= lt!173461 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!73 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!733 (array!21812 array!21814 (_ BitVec 32) (_ BitVec 32) V!13035 V!13035 (_ BitVec 32) Int) ListLongMap!4829)

(assert (=> b!375118 (= lt!173455 (getCurrentListMapNoExtraKeys!733 lt!173454 lt!173457 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375118 (= lt!173457 (array!21815 (store (arr!10375 _values!506) i!548 (ValueCellFull!4130 v!373)) (size!10727 _values!506)))))

(assert (=> b!375118 (= lt!173448 (getCurrentListMapNoExtraKeys!733 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375119 () Bool)

(declare-fun res!211722 () Bool)

(assert (=> b!375119 (=> (not res!211722) (not e!228557))))

(assert (=> b!375119 (= res!211722 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10726 _keys!658))))))

(declare-fun b!375120 () Bool)

(declare-fun res!211726 () Bool)

(assert (=> b!375120 (=> (not res!211726) (not e!228557))))

(assert (=> b!375120 (= res!211726 (and (= (size!10727 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10726 _keys!658) (size!10727 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375121 () Bool)

(declare-fun e!228556 () Bool)

(assert (=> b!375121 (= e!228556 tp_is_empty!8947)))

(declare-fun b!375122 () Bool)

(declare-fun res!211725 () Bool)

(assert (=> b!375122 (=> (not res!211725) (not e!228554))))

(declare-datatypes ((List!5759 0))(
  ( (Nil!5756) (Cons!5755 (h!6611 (_ BitVec 64)) (t!10901 List!5759)) )
))
(declare-fun arrayNoDuplicates!0 (array!21812 (_ BitVec 32) List!5759) Bool)

(assert (=> b!375122 (= res!211725 (arrayNoDuplicates!0 lt!173454 #b00000000000000000000000000000000 Nil!5756))))

(declare-fun mapNonEmpty!14985 () Bool)

(declare-fun tp!29612 () Bool)

(assert (=> mapNonEmpty!14985 (= mapRes!14985 (and tp!29612 e!228556))))

(declare-fun mapKey!14985 () (_ BitVec 32))

(declare-fun mapValue!14985 () ValueCell!4130)

(declare-fun mapRest!14985 () (Array (_ BitVec 32) ValueCell!4130))

(assert (=> mapNonEmpty!14985 (= (arr!10375 _values!506) (store mapRest!14985 mapKey!14985 mapValue!14985))))

(declare-fun b!375123 () Bool)

(declare-fun e!228555 () Bool)

(assert (=> b!375123 (= e!228555 true)))

(declare-fun lt!173451 () ListLongMap!4829)

(declare-fun lt!173456 () ListLongMap!4829)

(declare-fun lt!173453 () tuple2!5914)

(assert (=> b!375123 (= (+!826 lt!173451 lt!173453) (+!826 lt!173456 lt!173458))))

(declare-fun lt!173462 () Unit!11541)

(declare-fun lt!173452 () ListLongMap!4829)

(declare-fun addCommutativeForDiffKeys!253 (ListLongMap!4829 (_ BitVec 64) V!13035 (_ BitVec 64) V!13035) Unit!11541)

(assert (=> b!375123 (= lt!173462 (addCommutativeForDiffKeys!253 lt!173452 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!375124 () Bool)

(assert (=> b!375124 (= e!228553 tp_is_empty!8947)))

(declare-fun b!375125 () Bool)

(assert (=> b!375125 (= e!228552 e!228555)))

(declare-fun res!211730 () Bool)

(assert (=> b!375125 (=> res!211730 e!228555)))

(assert (=> b!375125 (= res!211730 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!173463 () ListLongMap!4829)

(assert (=> b!375125 (= lt!173463 lt!173451)))

(assert (=> b!375125 (= lt!173451 (+!826 lt!173452 lt!173458))))

(declare-fun lt!173449 () Unit!11541)

(assert (=> b!375125 (= lt!173449 (addCommutativeForDiffKeys!253 lt!173448 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> b!375125 (= lt!173464 (+!826 lt!173463 lt!173453))))

(declare-fun lt!173459 () tuple2!5914)

(assert (=> b!375125 (= lt!173463 (+!826 lt!173450 lt!173459))))

(assert (=> b!375125 (= lt!173460 lt!173456)))

(assert (=> b!375125 (= lt!173456 (+!826 lt!173452 lt!173453))))

(assert (=> b!375125 (= lt!173452 (+!826 lt!173448 lt!173459))))

(assert (=> b!375125 (= lt!173464 (+!826 (+!826 lt!173455 lt!173459) lt!173453))))

(assert (=> b!375125 (= lt!173453 (tuple2!5915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!375125 (= lt!173459 (tuple2!5915 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375126 () Bool)

(declare-fun res!211724 () Bool)

(assert (=> b!375126 (=> (not res!211724) (not e!228557))))

(assert (=> b!375126 (= res!211724 (or (= (select (arr!10374 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10374 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375127 () Bool)

(declare-fun res!211723 () Bool)

(assert (=> b!375127 (=> (not res!211723) (not e!228557))))

(assert (=> b!375127 (= res!211723 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5756))))

(assert (= (and start!37158 res!211721) b!375120))

(assert (= (and b!375120 res!211726) b!375114))

(assert (= (and b!375114 res!211727) b!375127))

(assert (= (and b!375127 res!211723) b!375119))

(assert (= (and b!375119 res!211722) b!375113))

(assert (= (and b!375113 res!211729) b!375126))

(assert (= (and b!375126 res!211724) b!375115))

(assert (= (and b!375115 res!211728) b!375117))

(assert (= (and b!375117 res!211720) b!375122))

(assert (= (and b!375122 res!211725) b!375118))

(assert (= (and b!375118 (not res!211719)) b!375125))

(assert (= (and b!375125 (not res!211730)) b!375123))

(assert (= (and b!375116 condMapEmpty!14985) mapIsEmpty!14985))

(assert (= (and b!375116 (not condMapEmpty!14985)) mapNonEmpty!14985))

(get-info :version)

(assert (= (and mapNonEmpty!14985 ((_ is ValueCellFull!4130) mapValue!14985)) b!375121))

(assert (= (and b!375116 ((_ is ValueCellFull!4130) mapDefault!14985)) b!375124))

(assert (= start!37158 b!375116))

(declare-fun m!371885 () Bool)

(assert (=> b!375114 m!371885))

(declare-fun m!371887 () Bool)

(assert (=> start!37158 m!371887))

(declare-fun m!371889 () Bool)

(assert (=> start!37158 m!371889))

(declare-fun m!371891 () Bool)

(assert (=> start!37158 m!371891))

(declare-fun m!371893 () Bool)

(assert (=> b!375126 m!371893))

(declare-fun m!371895 () Bool)

(assert (=> b!375125 m!371895))

(declare-fun m!371897 () Bool)

(assert (=> b!375125 m!371897))

(declare-fun m!371899 () Bool)

(assert (=> b!375125 m!371899))

(declare-fun m!371901 () Bool)

(assert (=> b!375125 m!371901))

(declare-fun m!371903 () Bool)

(assert (=> b!375125 m!371903))

(declare-fun m!371905 () Bool)

(assert (=> b!375125 m!371905))

(assert (=> b!375125 m!371897))

(declare-fun m!371907 () Bool)

(assert (=> b!375125 m!371907))

(declare-fun m!371909 () Bool)

(assert (=> b!375125 m!371909))

(declare-fun m!371911 () Bool)

(assert (=> b!375115 m!371911))

(declare-fun m!371913 () Bool)

(assert (=> b!375127 m!371913))

(declare-fun m!371915 () Bool)

(assert (=> b!375113 m!371915))

(declare-fun m!371917 () Bool)

(assert (=> b!375117 m!371917))

(declare-fun m!371919 () Bool)

(assert (=> b!375117 m!371919))

(declare-fun m!371921 () Bool)

(assert (=> b!375123 m!371921))

(declare-fun m!371923 () Bool)

(assert (=> b!375123 m!371923))

(declare-fun m!371925 () Bool)

(assert (=> b!375123 m!371925))

(declare-fun m!371927 () Bool)

(assert (=> b!375122 m!371927))

(declare-fun m!371929 () Bool)

(assert (=> b!375118 m!371929))

(declare-fun m!371931 () Bool)

(assert (=> b!375118 m!371931))

(declare-fun m!371933 () Bool)

(assert (=> b!375118 m!371933))

(declare-fun m!371935 () Bool)

(assert (=> b!375118 m!371935))

(declare-fun m!371937 () Bool)

(assert (=> b!375118 m!371937))

(declare-fun m!371939 () Bool)

(assert (=> b!375118 m!371939))

(declare-fun m!371941 () Bool)

(assert (=> b!375118 m!371941))

(declare-fun m!371943 () Bool)

(assert (=> mapNonEmpty!14985 m!371943))

(check-sat (not b_next!8299) b_and!15555 (not b!375115) (not b!375118) (not b!375122) (not b!375127) (not b!375123) (not b!375125) (not b!375113) tp_is_empty!8947 (not mapNonEmpty!14985) (not b!375114) (not b!375117) (not start!37158))
(check-sat b_and!15555 (not b_next!8299))
