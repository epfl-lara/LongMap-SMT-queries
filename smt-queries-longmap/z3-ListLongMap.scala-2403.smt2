; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38022 () Bool)

(assert start!38022)

(declare-fun b_free!8983 () Bool)

(declare-fun b_next!8983 () Bool)

(assert (=> start!38022 (= b_free!8983 (not b_next!8983))))

(declare-fun tp!31722 () Bool)

(declare-fun b_and!16323 () Bool)

(assert (=> start!38022 (= tp!31722 b_and!16323)))

(declare-fun b!391478 () Bool)

(declare-fun res!224125 () Bool)

(declare-fun e!237102 () Bool)

(assert (=> b!391478 (=> (not res!224125) (not e!237102))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23198 0))(
  ( (array!23199 (arr!11060 (Array (_ BitVec 32) (_ BitVec 64))) (size!11412 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23198)

(assert (=> b!391478 (= res!224125 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11412 _keys!658))))))

(declare-fun mapNonEmpty!16068 () Bool)

(declare-fun mapRes!16068 () Bool)

(declare-fun tp!31721 () Bool)

(declare-fun e!237105 () Bool)

(assert (=> mapNonEmpty!16068 (= mapRes!16068 (and tp!31721 e!237105))))

(declare-fun mapKey!16068 () (_ BitVec 32))

(declare-datatypes ((V!13979 0))(
  ( (V!13980 (val!4872 Int)) )
))
(declare-datatypes ((ValueCell!4484 0))(
  ( (ValueCellFull!4484 (v!7098 V!13979)) (EmptyCell!4484) )
))
(declare-fun mapRest!16068 () (Array (_ BitVec 32) ValueCell!4484))

(declare-datatypes ((array!23200 0))(
  ( (array!23201 (arr!11061 (Array (_ BitVec 32) ValueCell!4484)) (size!11413 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23200)

(declare-fun mapValue!16068 () ValueCell!4484)

(assert (=> mapNonEmpty!16068 (= (arr!11061 _values!506) (store mapRest!16068 mapKey!16068 mapValue!16068))))

(declare-fun b!391479 () Bool)

(declare-fun e!237107 () Bool)

(assert (=> b!391479 (= e!237107 (bvslt i!548 (size!11413 _values!506)))))

(declare-datatypes ((tuple2!6430 0))(
  ( (tuple2!6431 (_1!3226 (_ BitVec 64)) (_2!3226 V!13979)) )
))
(declare-datatypes ((List!6278 0))(
  ( (Nil!6275) (Cons!6274 (h!7130 tuple2!6430) (t!11434 List!6278)) )
))
(declare-datatypes ((ListLongMap!5345 0))(
  ( (ListLongMap!5346 (toList!2688 List!6278)) )
))
(declare-fun lt!184807 () ListLongMap!5345)

(declare-fun lt!184814 () ListLongMap!5345)

(declare-fun lt!184804 () tuple2!6430)

(declare-fun +!1042 (ListLongMap!5345 tuple2!6430) ListLongMap!5345)

(assert (=> b!391479 (= lt!184807 (+!1042 lt!184814 lt!184804))))

(declare-fun v!373 () V!13979)

(declare-fun lt!184811 () ListLongMap!5345)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13979)

(declare-datatypes ((Unit!11957 0))(
  ( (Unit!11958) )
))
(declare-fun lt!184810 () Unit!11957)

(declare-fun addCommutativeForDiffKeys!341 (ListLongMap!5345 (_ BitVec 64) V!13979 (_ BitVec 64) V!13979) Unit!11957)

(assert (=> b!391479 (= lt!184810 (addCommutativeForDiffKeys!341 lt!184811 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391480 () Bool)

(declare-fun res!224124 () Bool)

(assert (=> b!391480 (=> (not res!224124) (not e!237102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391480 (= res!224124 (validKeyInArray!0 k0!778))))

(declare-fun b!391482 () Bool)

(declare-fun e!237106 () Bool)

(declare-fun e!237104 () Bool)

(assert (=> b!391482 (= e!237106 (not e!237104))))

(declare-fun res!224117 () Bool)

(assert (=> b!391482 (=> res!224117 e!237104)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391482 (= res!224117 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!184813 () ListLongMap!5345)

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13979)

(declare-fun getCurrentListMap!2068 (array!23198 array!23200 (_ BitVec 32) (_ BitVec 32) V!13979 V!13979 (_ BitVec 32) Int) ListLongMap!5345)

(assert (=> b!391482 (= lt!184813 (getCurrentListMap!2068 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184805 () array!23198)

(declare-fun lt!184806 () array!23200)

(declare-fun lt!184809 () ListLongMap!5345)

(assert (=> b!391482 (= lt!184809 (getCurrentListMap!2068 lt!184805 lt!184806 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184808 () ListLongMap!5345)

(declare-fun lt!184815 () ListLongMap!5345)

(assert (=> b!391482 (and (= lt!184808 lt!184815) (= lt!184815 lt!184808))))

(assert (=> b!391482 (= lt!184815 (+!1042 lt!184811 lt!184804))))

(assert (=> b!391482 (= lt!184804 (tuple2!6431 k0!778 v!373))))

(declare-fun lt!184812 () Unit!11957)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!259 (array!23198 array!23200 (_ BitVec 32) (_ BitVec 32) V!13979 V!13979 (_ BitVec 32) (_ BitVec 64) V!13979 (_ BitVec 32) Int) Unit!11957)

(assert (=> b!391482 (= lt!184812 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!259 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!957 (array!23198 array!23200 (_ BitVec 32) (_ BitVec 32) V!13979 V!13979 (_ BitVec 32) Int) ListLongMap!5345)

(assert (=> b!391482 (= lt!184808 (getCurrentListMapNoExtraKeys!957 lt!184805 lt!184806 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391482 (= lt!184806 (array!23201 (store (arr!11061 _values!506) i!548 (ValueCellFull!4484 v!373)) (size!11413 _values!506)))))

(assert (=> b!391482 (= lt!184811 (getCurrentListMapNoExtraKeys!957 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!16068 () Bool)

(assert (=> mapIsEmpty!16068 mapRes!16068))

(declare-fun b!391483 () Bool)

(declare-fun res!224121 () Bool)

(assert (=> b!391483 (=> (not res!224121) (not e!237102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23198 (_ BitVec 32)) Bool)

(assert (=> b!391483 (= res!224121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391484 () Bool)

(declare-fun res!224116 () Bool)

(assert (=> b!391484 (=> (not res!224116) (not e!237102))))

(declare-fun arrayContainsKey!0 (array!23198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391484 (= res!224116 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!391481 () Bool)

(assert (=> b!391481 (= e!237102 e!237106)))

(declare-fun res!224115 () Bool)

(assert (=> b!391481 (=> (not res!224115) (not e!237106))))

(assert (=> b!391481 (= res!224115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184805 mask!970))))

(assert (=> b!391481 (= lt!184805 (array!23199 (store (arr!11060 _keys!658) i!548 k0!778) (size!11412 _keys!658)))))

(declare-fun res!224120 () Bool)

(assert (=> start!38022 (=> (not res!224120) (not e!237102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38022 (= res!224120 (validMask!0 mask!970))))

(assert (=> start!38022 e!237102))

(declare-fun e!237103 () Bool)

(declare-fun array_inv!8178 (array!23200) Bool)

(assert (=> start!38022 (and (array_inv!8178 _values!506) e!237103)))

(assert (=> start!38022 tp!31722))

(assert (=> start!38022 true))

(declare-fun tp_is_empty!9655 () Bool)

(assert (=> start!38022 tp_is_empty!9655))

(declare-fun array_inv!8179 (array!23198) Bool)

(assert (=> start!38022 (array_inv!8179 _keys!658)))

(declare-fun b!391485 () Bool)

(declare-fun e!237108 () Bool)

(assert (=> b!391485 (= e!237108 tp_is_empty!9655)))

(declare-fun b!391486 () Bool)

(declare-fun res!224119 () Bool)

(assert (=> b!391486 (=> (not res!224119) (not e!237102))))

(assert (=> b!391486 (= res!224119 (or (= (select (arr!11060 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11060 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391487 () Bool)

(declare-fun res!224118 () Bool)

(assert (=> b!391487 (=> (not res!224118) (not e!237106))))

(declare-datatypes ((List!6279 0))(
  ( (Nil!6276) (Cons!6275 (h!7131 (_ BitVec 64)) (t!11435 List!6279)) )
))
(declare-fun arrayNoDuplicates!0 (array!23198 (_ BitVec 32) List!6279) Bool)

(assert (=> b!391487 (= res!224118 (arrayNoDuplicates!0 lt!184805 #b00000000000000000000000000000000 Nil!6276))))

(declare-fun b!391488 () Bool)

(assert (=> b!391488 (= e!237103 (and e!237108 mapRes!16068))))

(declare-fun condMapEmpty!16068 () Bool)

(declare-fun mapDefault!16068 () ValueCell!4484)

(assert (=> b!391488 (= condMapEmpty!16068 (= (arr!11061 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4484)) mapDefault!16068)))))

(declare-fun b!391489 () Bool)

(declare-fun res!224114 () Bool)

(assert (=> b!391489 (=> (not res!224114) (not e!237102))))

(assert (=> b!391489 (= res!224114 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6276))))

(declare-fun b!391490 () Bool)

(assert (=> b!391490 (= e!237104 e!237107)))

(declare-fun res!224123 () Bool)

(assert (=> b!391490 (=> res!224123 e!237107)))

(assert (=> b!391490 (= res!224123 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!391490 (= lt!184809 lt!184807)))

(declare-fun lt!184816 () tuple2!6430)

(assert (=> b!391490 (= lt!184807 (+!1042 lt!184815 lt!184816))))

(assert (=> b!391490 (= lt!184813 lt!184814)))

(assert (=> b!391490 (= lt!184814 (+!1042 lt!184811 lt!184816))))

(assert (=> b!391490 (= lt!184809 (+!1042 lt!184808 lt!184816))))

(assert (=> b!391490 (= lt!184816 (tuple2!6431 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391491 () Bool)

(declare-fun res!224122 () Bool)

(assert (=> b!391491 (=> (not res!224122) (not e!237102))))

(assert (=> b!391491 (= res!224122 (and (= (size!11413 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11412 _keys!658) (size!11413 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391492 () Bool)

(assert (=> b!391492 (= e!237105 tp_is_empty!9655)))

(assert (= (and start!38022 res!224120) b!391491))

(assert (= (and b!391491 res!224122) b!391483))

(assert (= (and b!391483 res!224121) b!391489))

(assert (= (and b!391489 res!224114) b!391478))

(assert (= (and b!391478 res!224125) b!391480))

(assert (= (and b!391480 res!224124) b!391486))

(assert (= (and b!391486 res!224119) b!391484))

(assert (= (and b!391484 res!224116) b!391481))

(assert (= (and b!391481 res!224115) b!391487))

(assert (= (and b!391487 res!224118) b!391482))

(assert (= (and b!391482 (not res!224117)) b!391490))

(assert (= (and b!391490 (not res!224123)) b!391479))

(assert (= (and b!391488 condMapEmpty!16068) mapIsEmpty!16068))

(assert (= (and b!391488 (not condMapEmpty!16068)) mapNonEmpty!16068))

(get-info :version)

(assert (= (and mapNonEmpty!16068 ((_ is ValueCellFull!4484) mapValue!16068)) b!391492))

(assert (= (and b!391488 ((_ is ValueCellFull!4484) mapDefault!16068)) b!391485))

(assert (= start!38022 b!391488))

(declare-fun m!388129 () Bool)

(assert (=> b!391480 m!388129))

(declare-fun m!388131 () Bool)

(assert (=> b!391489 m!388131))

(declare-fun m!388133 () Bool)

(assert (=> b!391483 m!388133))

(declare-fun m!388135 () Bool)

(assert (=> start!38022 m!388135))

(declare-fun m!388137 () Bool)

(assert (=> start!38022 m!388137))

(declare-fun m!388139 () Bool)

(assert (=> start!38022 m!388139))

(declare-fun m!388141 () Bool)

(assert (=> b!391481 m!388141))

(declare-fun m!388143 () Bool)

(assert (=> b!391481 m!388143))

(declare-fun m!388145 () Bool)

(assert (=> mapNonEmpty!16068 m!388145))

(declare-fun m!388147 () Bool)

(assert (=> b!391482 m!388147))

(declare-fun m!388149 () Bool)

(assert (=> b!391482 m!388149))

(declare-fun m!388151 () Bool)

(assert (=> b!391482 m!388151))

(declare-fun m!388153 () Bool)

(assert (=> b!391482 m!388153))

(declare-fun m!388155 () Bool)

(assert (=> b!391482 m!388155))

(declare-fun m!388157 () Bool)

(assert (=> b!391482 m!388157))

(declare-fun m!388159 () Bool)

(assert (=> b!391482 m!388159))

(declare-fun m!388161 () Bool)

(assert (=> b!391486 m!388161))

(declare-fun m!388163 () Bool)

(assert (=> b!391490 m!388163))

(declare-fun m!388165 () Bool)

(assert (=> b!391490 m!388165))

(declare-fun m!388167 () Bool)

(assert (=> b!391490 m!388167))

(declare-fun m!388169 () Bool)

(assert (=> b!391487 m!388169))

(declare-fun m!388171 () Bool)

(assert (=> b!391479 m!388171))

(declare-fun m!388173 () Bool)

(assert (=> b!391479 m!388173))

(declare-fun m!388175 () Bool)

(assert (=> b!391484 m!388175))

(check-sat (not b!391479) (not b!391484) (not mapNonEmpty!16068) (not b_next!8983) (not b!391482) (not b!391481) (not b!391490) tp_is_empty!9655 (not b!391480) (not start!38022) (not b!391487) (not b!391489) (not b!391483) b_and!16323)
(check-sat b_and!16323 (not b_next!8983))
