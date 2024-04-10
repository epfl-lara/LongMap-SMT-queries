; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38146 () Bool)

(assert start!38146)

(declare-fun b_free!9027 () Bool)

(declare-fun b_next!9027 () Bool)

(assert (=> start!38146 (= b_free!9027 (not b_next!9027))))

(declare-fun tp!31862 () Bool)

(declare-fun b_and!16389 () Bool)

(assert (=> start!38146 (= tp!31862 b_and!16389)))

(declare-fun b!393119 () Bool)

(declare-fun e!238039 () Bool)

(declare-fun e!238044 () Bool)

(assert (=> b!393119 (= e!238039 e!238044)))

(declare-fun res!225176 () Bool)

(assert (=> b!393119 (=> (not res!225176) (not e!238044))))

(declare-datatypes ((array!23305 0))(
  ( (array!23306 (arr!11111 (Array (_ BitVec 32) (_ BitVec 64))) (size!11463 (_ BitVec 32))) )
))
(declare-fun lt!185952 () array!23305)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23305 (_ BitVec 32)) Bool)

(assert (=> b!393119 (= res!225176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185952 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23305)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393119 (= lt!185952 (array!23306 (store (arr!11111 _keys!658) i!548 k0!778) (size!11463 _keys!658)))))

(declare-fun res!225185 () Bool)

(assert (=> start!38146 (=> (not res!225185) (not e!238039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38146 (= res!225185 (validMask!0 mask!970))))

(assert (=> start!38146 e!238039))

(declare-datatypes ((V!14037 0))(
  ( (V!14038 (val!4894 Int)) )
))
(declare-datatypes ((ValueCell!4506 0))(
  ( (ValueCellFull!4506 (v!7131 V!14037)) (EmptyCell!4506) )
))
(declare-datatypes ((array!23307 0))(
  ( (array!23308 (arr!11112 (Array (_ BitVec 32) ValueCell!4506)) (size!11464 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23307)

(declare-fun e!238043 () Bool)

(declare-fun array_inv!8162 (array!23307) Bool)

(assert (=> start!38146 (and (array_inv!8162 _values!506) e!238043)))

(assert (=> start!38146 tp!31862))

(assert (=> start!38146 true))

(declare-fun tp_is_empty!9699 () Bool)

(assert (=> start!38146 tp_is_empty!9699))

(declare-fun array_inv!8163 (array!23305) Bool)

(assert (=> start!38146 (array_inv!8163 _keys!658)))

(declare-fun b!393120 () Bool)

(declare-fun res!225182 () Bool)

(assert (=> b!393120 (=> (not res!225182) (not e!238039))))

(declare-fun arrayContainsKey!0 (array!23305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393120 (= res!225182 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393121 () Bool)

(declare-fun e!238038 () Bool)

(assert (=> b!393121 (= e!238038 tp_is_empty!9699)))

(declare-fun b!393122 () Bool)

(declare-fun res!225181 () Bool)

(assert (=> b!393122 (=> (not res!225181) (not e!238039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393122 (= res!225181 (validKeyInArray!0 k0!778))))

(declare-fun b!393123 () Bool)

(declare-fun res!225186 () Bool)

(assert (=> b!393123 (=> (not res!225186) (not e!238044))))

(declare-datatypes ((List!6455 0))(
  ( (Nil!6452) (Cons!6451 (h!7307 (_ BitVec 64)) (t!11625 List!6455)) )
))
(declare-fun arrayNoDuplicates!0 (array!23305 (_ BitVec 32) List!6455) Bool)

(assert (=> b!393123 (= res!225186 (arrayNoDuplicates!0 lt!185952 #b00000000000000000000000000000000 Nil!6452))))

(declare-fun b!393124 () Bool)

(declare-fun res!225175 () Bool)

(assert (=> b!393124 (=> (not res!225175) (not e!238039))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393124 (= res!225175 (and (= (size!11464 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11463 _keys!658) (size!11464 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16143 () Bool)

(declare-fun mapRes!16143 () Bool)

(assert (=> mapIsEmpty!16143 mapRes!16143))

(declare-fun b!393125 () Bool)

(declare-fun e!238040 () Bool)

(assert (=> b!393125 (= e!238040 tp_is_empty!9699)))

(declare-fun b!393126 () Bool)

(declare-fun e!238042 () Bool)

(assert (=> b!393126 (= e!238042 (bvslt i!548 (size!11464 _values!506)))))

(declare-datatypes ((tuple2!6602 0))(
  ( (tuple2!6603 (_1!3312 (_ BitVec 64)) (_2!3312 V!14037)) )
))
(declare-datatypes ((List!6456 0))(
  ( (Nil!6453) (Cons!6452 (h!7308 tuple2!6602) (t!11626 List!6456)) )
))
(declare-datatypes ((ListLongMap!5515 0))(
  ( (ListLongMap!5516 (toList!2773 List!6456)) )
))
(declare-fun lt!185953 () ListLongMap!5515)

(declare-fun lt!185950 () ListLongMap!5515)

(declare-fun lt!185956 () tuple2!6602)

(declare-fun +!1068 (ListLongMap!5515 tuple2!6602) ListLongMap!5515)

(assert (=> b!393126 (= lt!185953 (+!1068 lt!185950 lt!185956))))

(declare-fun v!373 () V!14037)

(declare-fun lt!185959 () ListLongMap!5515)

(declare-datatypes ((Unit!12024 0))(
  ( (Unit!12025) )
))
(declare-fun lt!185955 () Unit!12024)

(declare-fun minValue!472 () V!14037)

(declare-fun addCommutativeForDiffKeys!346 (ListLongMap!5515 (_ BitVec 64) V!14037 (_ BitVec 64) V!14037) Unit!12024)

(assert (=> b!393126 (= lt!185955 (addCommutativeForDiffKeys!346 lt!185959 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun mapNonEmpty!16143 () Bool)

(declare-fun tp!31863 () Bool)

(assert (=> mapNonEmpty!16143 (= mapRes!16143 (and tp!31863 e!238038))))

(declare-fun mapRest!16143 () (Array (_ BitVec 32) ValueCell!4506))

(declare-fun mapValue!16143 () ValueCell!4506)

(declare-fun mapKey!16143 () (_ BitVec 32))

(assert (=> mapNonEmpty!16143 (= (arr!11112 _values!506) (store mapRest!16143 mapKey!16143 mapValue!16143))))

(declare-fun b!393127 () Bool)

(declare-fun e!238045 () Bool)

(assert (=> b!393127 (= e!238045 e!238042)))

(declare-fun res!225180 () Bool)

(assert (=> b!393127 (=> res!225180 e!238042)))

(assert (=> b!393127 (= res!225180 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!185954 () ListLongMap!5515)

(assert (=> b!393127 (= lt!185954 lt!185950)))

(declare-fun lt!185951 () tuple2!6602)

(assert (=> b!393127 (= lt!185950 (+!1068 lt!185959 lt!185951))))

(declare-fun lt!185948 () ListLongMap!5515)

(assert (=> b!393127 (= lt!185948 lt!185953)))

(declare-fun lt!185958 () ListLongMap!5515)

(assert (=> b!393127 (= lt!185953 (+!1068 lt!185958 lt!185951))))

(declare-fun lt!185957 () ListLongMap!5515)

(assert (=> b!393127 (= lt!185948 (+!1068 lt!185957 lt!185951))))

(assert (=> b!393127 (= lt!185951 (tuple2!6603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!393128 () Bool)

(declare-fun res!225184 () Bool)

(assert (=> b!393128 (=> (not res!225184) (not e!238039))))

(assert (=> b!393128 (= res!225184 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11463 _keys!658))))))

(declare-fun b!393129 () Bool)

(assert (=> b!393129 (= e!238044 (not e!238045))))

(declare-fun res!225183 () Bool)

(assert (=> b!393129 (=> res!225183 e!238045)))

(assert (=> b!393129 (= res!225183 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14037)

(declare-fun getCurrentListMap!2115 (array!23305 array!23307 (_ BitVec 32) (_ BitVec 32) V!14037 V!14037 (_ BitVec 32) Int) ListLongMap!5515)

(assert (=> b!393129 (= lt!185954 (getCurrentListMap!2115 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185949 () array!23307)

(assert (=> b!393129 (= lt!185948 (getCurrentListMap!2115 lt!185952 lt!185949 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393129 (and (= lt!185957 lt!185958) (= lt!185958 lt!185957))))

(assert (=> b!393129 (= lt!185958 (+!1068 lt!185959 lt!185956))))

(assert (=> b!393129 (= lt!185956 (tuple2!6603 k0!778 v!373))))

(declare-fun lt!185947 () Unit!12024)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!279 (array!23305 array!23307 (_ BitVec 32) (_ BitVec 32) V!14037 V!14037 (_ BitVec 32) (_ BitVec 64) V!14037 (_ BitVec 32) Int) Unit!12024)

(assert (=> b!393129 (= lt!185947 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!279 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!995 (array!23305 array!23307 (_ BitVec 32) (_ BitVec 32) V!14037 V!14037 (_ BitVec 32) Int) ListLongMap!5515)

(assert (=> b!393129 (= lt!185957 (getCurrentListMapNoExtraKeys!995 lt!185952 lt!185949 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393129 (= lt!185949 (array!23308 (store (arr!11112 _values!506) i!548 (ValueCellFull!4506 v!373)) (size!11464 _values!506)))))

(assert (=> b!393129 (= lt!185959 (getCurrentListMapNoExtraKeys!995 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393130 () Bool)

(assert (=> b!393130 (= e!238043 (and e!238040 mapRes!16143))))

(declare-fun condMapEmpty!16143 () Bool)

(declare-fun mapDefault!16143 () ValueCell!4506)

(assert (=> b!393130 (= condMapEmpty!16143 (= (arr!11112 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4506)) mapDefault!16143)))))

(declare-fun b!393131 () Bool)

(declare-fun res!225177 () Bool)

(assert (=> b!393131 (=> (not res!225177) (not e!238039))))

(assert (=> b!393131 (= res!225177 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6452))))

(declare-fun b!393132 () Bool)

(declare-fun res!225178 () Bool)

(assert (=> b!393132 (=> (not res!225178) (not e!238039))))

(assert (=> b!393132 (= res!225178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393133 () Bool)

(declare-fun res!225179 () Bool)

(assert (=> b!393133 (=> (not res!225179) (not e!238039))))

(assert (=> b!393133 (= res!225179 (or (= (select (arr!11111 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11111 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38146 res!225185) b!393124))

(assert (= (and b!393124 res!225175) b!393132))

(assert (= (and b!393132 res!225178) b!393131))

(assert (= (and b!393131 res!225177) b!393128))

(assert (= (and b!393128 res!225184) b!393122))

(assert (= (and b!393122 res!225181) b!393133))

(assert (= (and b!393133 res!225179) b!393120))

(assert (= (and b!393120 res!225182) b!393119))

(assert (= (and b!393119 res!225176) b!393123))

(assert (= (and b!393123 res!225186) b!393129))

(assert (= (and b!393129 (not res!225183)) b!393127))

(assert (= (and b!393127 (not res!225180)) b!393126))

(assert (= (and b!393130 condMapEmpty!16143) mapIsEmpty!16143))

(assert (= (and b!393130 (not condMapEmpty!16143)) mapNonEmpty!16143))

(get-info :version)

(assert (= (and mapNonEmpty!16143 ((_ is ValueCellFull!4506) mapValue!16143)) b!393121))

(assert (= (and b!393130 ((_ is ValueCellFull!4506) mapDefault!16143)) b!393125))

(assert (= start!38146 b!393130))

(declare-fun m!389567 () Bool)

(assert (=> b!393131 m!389567))

(declare-fun m!389569 () Bool)

(assert (=> b!393133 m!389569))

(declare-fun m!389571 () Bool)

(assert (=> b!393132 m!389571))

(declare-fun m!389573 () Bool)

(assert (=> b!393129 m!389573))

(declare-fun m!389575 () Bool)

(assert (=> b!393129 m!389575))

(declare-fun m!389577 () Bool)

(assert (=> b!393129 m!389577))

(declare-fun m!389579 () Bool)

(assert (=> b!393129 m!389579))

(declare-fun m!389581 () Bool)

(assert (=> b!393129 m!389581))

(declare-fun m!389583 () Bool)

(assert (=> b!393129 m!389583))

(declare-fun m!389585 () Bool)

(assert (=> b!393129 m!389585))

(declare-fun m!389587 () Bool)

(assert (=> b!393126 m!389587))

(declare-fun m!389589 () Bool)

(assert (=> b!393126 m!389589))

(declare-fun m!389591 () Bool)

(assert (=> b!393123 m!389591))

(declare-fun m!389593 () Bool)

(assert (=> b!393119 m!389593))

(declare-fun m!389595 () Bool)

(assert (=> b!393119 m!389595))

(declare-fun m!389597 () Bool)

(assert (=> start!38146 m!389597))

(declare-fun m!389599 () Bool)

(assert (=> start!38146 m!389599))

(declare-fun m!389601 () Bool)

(assert (=> start!38146 m!389601))

(declare-fun m!389603 () Bool)

(assert (=> b!393122 m!389603))

(declare-fun m!389605 () Bool)

(assert (=> b!393120 m!389605))

(declare-fun m!389607 () Bool)

(assert (=> b!393127 m!389607))

(declare-fun m!389609 () Bool)

(assert (=> b!393127 m!389609))

(declare-fun m!389611 () Bool)

(assert (=> b!393127 m!389611))

(declare-fun m!389613 () Bool)

(assert (=> mapNonEmpty!16143 m!389613))

(check-sat tp_is_empty!9699 b_and!16389 (not b_next!9027) (not b!393120) (not b!393132) (not b!393131) (not b!393119) (not start!38146) (not b!393123) (not b!393122) (not b!393127) (not b!393126) (not b!393129) (not mapNonEmpty!16143))
(check-sat b_and!16389 (not b_next!9027))
