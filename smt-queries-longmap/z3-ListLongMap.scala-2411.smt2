; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38136 () Bool)

(assert start!38136)

(declare-fun b_free!9031 () Bool)

(declare-fun b_next!9031 () Bool)

(assert (=> start!38136 (= b_free!9031 (not b_next!9031))))

(declare-fun tp!31875 () Bool)

(declare-fun b_and!16367 () Bool)

(assert (=> start!38136 (= tp!31875 b_and!16367)))

(declare-datatypes ((V!14043 0))(
  ( (V!14044 (val!4896 Int)) )
))
(declare-datatypes ((tuple2!6576 0))(
  ( (tuple2!6577 (_1!3299 (_ BitVec 64)) (_2!3299 V!14043)) )
))
(declare-datatypes ((List!6416 0))(
  ( (Nil!6413) (Cons!6412 (h!7268 tuple2!6576) (t!11577 List!6416)) )
))
(declare-datatypes ((ListLongMap!5479 0))(
  ( (ListLongMap!5480 (toList!2755 List!6416)) )
))
(declare-fun lt!185799 () ListLongMap!5479)

(declare-fun e!237912 () Bool)

(declare-fun lt!185794 () ListLongMap!5479)

(declare-fun b!392938 () Bool)

(declare-fun lt!185793 () tuple2!6576)

(declare-fun +!1075 (ListLongMap!5479 tuple2!6576) ListLongMap!5479)

(assert (=> b!392938 (= e!237912 (= (+!1075 lt!185794 lt!185793) lt!185799))))

(declare-fun lt!185803 () ListLongMap!5479)

(declare-fun lt!185801 () ListLongMap!5479)

(assert (=> b!392938 (= lt!185803 (+!1075 lt!185801 lt!185793))))

(declare-datatypes ((Unit!11998 0))(
  ( (Unit!11999) )
))
(declare-fun lt!185798 () Unit!11998)

(declare-fun v!373 () V!14043)

(declare-fun lt!185792 () ListLongMap!5479)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun minValue!472 () V!14043)

(declare-fun addCommutativeForDiffKeys!344 (ListLongMap!5479 (_ BitVec 64) V!14043 (_ BitVec 64) V!14043) Unit!11998)

(assert (=> b!392938 (= lt!185798 (addCommutativeForDiffKeys!344 lt!185792 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392939 () Bool)

(declare-fun res!225122 () Bool)

(declare-fun e!237916 () Bool)

(assert (=> b!392939 (=> (not res!225122) (not e!237916))))

(declare-datatypes ((array!23295 0))(
  ( (array!23296 (arr!11106 (Array (_ BitVec 32) (_ BitVec 64))) (size!11459 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23295)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!392939 (= res!225122 (or (= (select (arr!11106 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11106 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392940 () Bool)

(declare-fun e!237919 () Bool)

(declare-fun e!237917 () Bool)

(declare-fun mapRes!16149 () Bool)

(assert (=> b!392940 (= e!237919 (and e!237917 mapRes!16149))))

(declare-fun condMapEmpty!16149 () Bool)

(declare-datatypes ((ValueCell!4508 0))(
  ( (ValueCellFull!4508 (v!7127 V!14043)) (EmptyCell!4508) )
))
(declare-datatypes ((array!23297 0))(
  ( (array!23298 (arr!11107 (Array (_ BitVec 32) ValueCell!4508)) (size!11460 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23297)

(declare-fun mapDefault!16149 () ValueCell!4508)

(assert (=> b!392940 (= condMapEmpty!16149 (= (arr!11107 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4508)) mapDefault!16149)))))

(declare-fun b!392941 () Bool)

(declare-fun res!225126 () Bool)

(assert (=> b!392941 (=> (not res!225126) (not e!237916))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!392941 (= res!225126 (and (= (size!11460 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11459 _keys!658) (size!11460 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392942 () Bool)

(declare-fun tp_is_empty!9703 () Bool)

(assert (=> b!392942 (= e!237917 tp_is_empty!9703)))

(declare-fun b!392944 () Bool)

(declare-fun res!225128 () Bool)

(assert (=> b!392944 (=> (not res!225128) (not e!237916))))

(declare-datatypes ((List!6417 0))(
  ( (Nil!6414) (Cons!6413 (h!7269 (_ BitVec 64)) (t!11578 List!6417)) )
))
(declare-fun arrayNoDuplicates!0 (array!23295 (_ BitVec 32) List!6417) Bool)

(assert (=> b!392944 (= res!225128 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6414))))

(declare-fun b!392945 () Bool)

(declare-fun res!225121 () Bool)

(assert (=> b!392945 (=> (not res!225121) (not e!237916))))

(declare-fun arrayContainsKey!0 (array!23295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392945 (= res!225121 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!392946 () Bool)

(declare-fun e!237913 () Bool)

(assert (=> b!392946 (= e!237916 e!237913)))

(declare-fun res!225123 () Bool)

(assert (=> b!392946 (=> (not res!225123) (not e!237913))))

(declare-fun lt!185791 () array!23295)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23295 (_ BitVec 32)) Bool)

(assert (=> b!392946 (= res!225123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185791 mask!970))))

(assert (=> b!392946 (= lt!185791 (array!23296 (store (arr!11106 _keys!658) i!548 k0!778) (size!11459 _keys!658)))))

(declare-fun b!392947 () Bool)

(declare-fun res!225119 () Bool)

(assert (=> b!392947 (=> (not res!225119) (not e!237916))))

(assert (=> b!392947 (= res!225119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392948 () Bool)

(declare-fun e!237915 () Bool)

(assert (=> b!392948 (= e!237913 (not e!237915))))

(declare-fun res!225129 () Bool)

(assert (=> b!392948 (=> res!225129 e!237915)))

(assert (=> b!392948 (= res!225129 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14043)

(declare-fun getCurrentListMap!2071 (array!23295 array!23297 (_ BitVec 32) (_ BitVec 32) V!14043 V!14043 (_ BitVec 32) Int) ListLongMap!5479)

(assert (=> b!392948 (= lt!185794 (getCurrentListMap!2071 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185800 () array!23297)

(assert (=> b!392948 (= lt!185799 (getCurrentListMap!2071 lt!185791 lt!185800 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185795 () ListLongMap!5479)

(declare-fun lt!185802 () ListLongMap!5479)

(assert (=> b!392948 (and (= lt!185795 lt!185802) (= lt!185802 lt!185795))))

(assert (=> b!392948 (= lt!185802 (+!1075 lt!185792 lt!185793))))

(assert (=> b!392948 (= lt!185793 (tuple2!6577 k0!778 v!373))))

(declare-fun lt!185797 () Unit!11998)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!272 (array!23295 array!23297 (_ BitVec 32) (_ BitVec 32) V!14043 V!14043 (_ BitVec 32) (_ BitVec 64) V!14043 (_ BitVec 32) Int) Unit!11998)

(assert (=> b!392948 (= lt!185797 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!272 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!981 (array!23295 array!23297 (_ BitVec 32) (_ BitVec 32) V!14043 V!14043 (_ BitVec 32) Int) ListLongMap!5479)

(assert (=> b!392948 (= lt!185795 (getCurrentListMapNoExtraKeys!981 lt!185791 lt!185800 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392948 (= lt!185800 (array!23298 (store (arr!11107 _values!506) i!548 (ValueCellFull!4508 v!373)) (size!11460 _values!506)))))

(assert (=> b!392948 (= lt!185792 (getCurrentListMapNoExtraKeys!981 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392949 () Bool)

(declare-fun res!225127 () Bool)

(assert (=> b!392949 (=> (not res!225127) (not e!237913))))

(assert (=> b!392949 (= res!225127 (arrayNoDuplicates!0 lt!185791 #b00000000000000000000000000000000 Nil!6414))))

(declare-fun b!392950 () Bool)

(assert (=> b!392950 (= e!237915 e!237912)))

(declare-fun res!225120 () Bool)

(assert (=> b!392950 (=> res!225120 e!237912)))

(assert (=> b!392950 (= res!225120 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!392950 (= lt!185794 lt!185801)))

(declare-fun lt!185796 () tuple2!6576)

(assert (=> b!392950 (= lt!185801 (+!1075 lt!185792 lt!185796))))

(assert (=> b!392950 (= lt!185799 lt!185803)))

(assert (=> b!392950 (= lt!185803 (+!1075 lt!185802 lt!185796))))

(assert (=> b!392950 (= lt!185799 (+!1075 lt!185795 lt!185796))))

(assert (=> b!392950 (= lt!185796 (tuple2!6577 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392951 () Bool)

(declare-fun res!225118 () Bool)

(assert (=> b!392951 (=> (not res!225118) (not e!237916))))

(assert (=> b!392951 (= res!225118 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11459 _keys!658))))))

(declare-fun mapIsEmpty!16149 () Bool)

(assert (=> mapIsEmpty!16149 mapRes!16149))

(declare-fun b!392943 () Bool)

(declare-fun res!225124 () Bool)

(assert (=> b!392943 (=> (not res!225124) (not e!237916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392943 (= res!225124 (validKeyInArray!0 k0!778))))

(declare-fun res!225125 () Bool)

(assert (=> start!38136 (=> (not res!225125) (not e!237916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38136 (= res!225125 (validMask!0 mask!970))))

(assert (=> start!38136 e!237916))

(declare-fun array_inv!8158 (array!23297) Bool)

(assert (=> start!38136 (and (array_inv!8158 _values!506) e!237919)))

(assert (=> start!38136 tp!31875))

(assert (=> start!38136 true))

(assert (=> start!38136 tp_is_empty!9703))

(declare-fun array_inv!8159 (array!23295) Bool)

(assert (=> start!38136 (array_inv!8159 _keys!658)))

(declare-fun mapNonEmpty!16149 () Bool)

(declare-fun tp!31874 () Bool)

(declare-fun e!237918 () Bool)

(assert (=> mapNonEmpty!16149 (= mapRes!16149 (and tp!31874 e!237918))))

(declare-fun mapRest!16149 () (Array (_ BitVec 32) ValueCell!4508))

(declare-fun mapValue!16149 () ValueCell!4508)

(declare-fun mapKey!16149 () (_ BitVec 32))

(assert (=> mapNonEmpty!16149 (= (arr!11107 _values!506) (store mapRest!16149 mapKey!16149 mapValue!16149))))

(declare-fun b!392952 () Bool)

(assert (=> b!392952 (= e!237918 tp_is_empty!9703)))

(assert (= (and start!38136 res!225125) b!392941))

(assert (= (and b!392941 res!225126) b!392947))

(assert (= (and b!392947 res!225119) b!392944))

(assert (= (and b!392944 res!225128) b!392951))

(assert (= (and b!392951 res!225118) b!392943))

(assert (= (and b!392943 res!225124) b!392939))

(assert (= (and b!392939 res!225122) b!392945))

(assert (= (and b!392945 res!225121) b!392946))

(assert (= (and b!392946 res!225123) b!392949))

(assert (= (and b!392949 res!225127) b!392948))

(assert (= (and b!392948 (not res!225129)) b!392950))

(assert (= (and b!392950 (not res!225120)) b!392938))

(assert (= (and b!392940 condMapEmpty!16149) mapIsEmpty!16149))

(assert (= (and b!392940 (not condMapEmpty!16149)) mapNonEmpty!16149))

(get-info :version)

(assert (= (and mapNonEmpty!16149 ((_ is ValueCellFull!4508) mapValue!16149)) b!392952))

(assert (= (and b!392940 ((_ is ValueCellFull!4508) mapDefault!16149)) b!392942))

(assert (= start!38136 b!392940))

(declare-fun m!388939 () Bool)

(assert (=> b!392945 m!388939))

(declare-fun m!388941 () Bool)

(assert (=> b!392939 m!388941))

(declare-fun m!388943 () Bool)

(assert (=> b!392938 m!388943))

(declare-fun m!388945 () Bool)

(assert (=> b!392938 m!388945))

(declare-fun m!388947 () Bool)

(assert (=> b!392938 m!388947))

(declare-fun m!388949 () Bool)

(assert (=> b!392949 m!388949))

(declare-fun m!388951 () Bool)

(assert (=> mapNonEmpty!16149 m!388951))

(declare-fun m!388953 () Bool)

(assert (=> start!38136 m!388953))

(declare-fun m!388955 () Bool)

(assert (=> start!38136 m!388955))

(declare-fun m!388957 () Bool)

(assert (=> start!38136 m!388957))

(declare-fun m!388959 () Bool)

(assert (=> b!392943 m!388959))

(declare-fun m!388961 () Bool)

(assert (=> b!392946 m!388961))

(declare-fun m!388963 () Bool)

(assert (=> b!392946 m!388963))

(declare-fun m!388965 () Bool)

(assert (=> b!392947 m!388965))

(declare-fun m!388967 () Bool)

(assert (=> b!392948 m!388967))

(declare-fun m!388969 () Bool)

(assert (=> b!392948 m!388969))

(declare-fun m!388971 () Bool)

(assert (=> b!392948 m!388971))

(declare-fun m!388973 () Bool)

(assert (=> b!392948 m!388973))

(declare-fun m!388975 () Bool)

(assert (=> b!392948 m!388975))

(declare-fun m!388977 () Bool)

(assert (=> b!392948 m!388977))

(declare-fun m!388979 () Bool)

(assert (=> b!392948 m!388979))

(declare-fun m!388981 () Bool)

(assert (=> b!392944 m!388981))

(declare-fun m!388983 () Bool)

(assert (=> b!392950 m!388983))

(declare-fun m!388985 () Bool)

(assert (=> b!392950 m!388985))

(declare-fun m!388987 () Bool)

(assert (=> b!392950 m!388987))

(check-sat (not b!392945) b_and!16367 (not start!38136) (not b!392950) tp_is_empty!9703 (not b!392947) (not b_next!9031) (not b!392938) (not mapNonEmpty!16149) (not b!392944) (not b!392943) (not b!392948) (not b!392949) (not b!392946))
(check-sat b_and!16367 (not b_next!9031))
