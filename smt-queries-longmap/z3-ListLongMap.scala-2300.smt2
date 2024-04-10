; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37264 () Bool)

(assert start!37264)

(declare-fun b_free!8391 () Bool)

(declare-fun b_next!8391 () Bool)

(assert (=> start!37264 (= b_free!8391 (not b_next!8391))))

(declare-fun tp!29888 () Bool)

(declare-fun b_and!15633 () Bool)

(assert (=> start!37264 (= tp!29888 b_and!15633)))

(declare-fun b!377241 () Bool)

(declare-fun res!213393 () Bool)

(declare-fun e!229690 () Bool)

(assert (=> b!377241 (=> (not res!213393) (not e!229690))))

(declare-datatypes ((array!22007 0))(
  ( (array!22008 (arr!10472 (Array (_ BitVec 32) (_ BitVec 64))) (size!10824 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22007)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377241 (= res!213393 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377242 () Bool)

(declare-fun e!229688 () Bool)

(assert (=> b!377242 (= e!229690 e!229688)))

(declare-fun res!213394 () Bool)

(assert (=> b!377242 (=> (not res!213394) (not e!229688))))

(declare-fun lt!175326 () array!22007)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22007 (_ BitVec 32)) Bool)

(assert (=> b!377242 (= res!213394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175326 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377242 (= lt!175326 (array!22008 (store (arr!10472 _keys!658) i!548 k0!778) (size!10824 _keys!658)))))

(declare-fun b!377243 () Bool)

(declare-fun res!213387 () Bool)

(assert (=> b!377243 (=> (not res!213387) (not e!229690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377243 (= res!213387 (validKeyInArray!0 k0!778))))

(declare-fun b!377244 () Bool)

(declare-fun res!213396 () Bool)

(assert (=> b!377244 (=> (not res!213396) (not e!229690))))

(declare-datatypes ((List!5923 0))(
  ( (Nil!5920) (Cons!5919 (h!6775 (_ BitVec 64)) (t!11073 List!5923)) )
))
(declare-fun arrayNoDuplicates!0 (array!22007 (_ BitVec 32) List!5923) Bool)

(assert (=> b!377244 (= res!213396 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5920))))

(declare-fun mapIsEmpty!15123 () Bool)

(declare-fun mapRes!15123 () Bool)

(assert (=> mapIsEmpty!15123 mapRes!15123))

(declare-fun b!377246 () Bool)

(declare-fun res!213390 () Bool)

(assert (=> b!377246 (=> (not res!213390) (not e!229690))))

(assert (=> b!377246 (= res!213390 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10824 _keys!658))))))

(declare-fun b!377247 () Bool)

(declare-fun res!213391 () Bool)

(assert (=> b!377247 (=> (not res!213391) (not e!229690))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13157 0))(
  ( (V!13158 (val!4564 Int)) )
))
(declare-datatypes ((ValueCell!4176 0))(
  ( (ValueCellFull!4176 (v!6761 V!13157)) (EmptyCell!4176) )
))
(declare-datatypes ((array!22009 0))(
  ( (array!22010 (arr!10473 (Array (_ BitVec 32) ValueCell!4176)) (size!10825 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22009)

(assert (=> b!377247 (= res!213391 (and (= (size!10825 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10824 _keys!658) (size!10825 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377248 () Bool)

(declare-fun res!213388 () Bool)

(assert (=> b!377248 (=> (not res!213388) (not e!229690))))

(assert (=> b!377248 (= res!213388 (or (= (select (arr!10472 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10472 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377249 () Bool)

(declare-fun e!229687 () Bool)

(assert (=> b!377249 (= e!229688 (not e!229687))))

(declare-fun res!213398 () Bool)

(assert (=> b!377249 (=> res!213398 e!229687)))

(assert (=> b!377249 (= res!213398 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!472 () V!13157)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6082 0))(
  ( (tuple2!6083 (_1!3052 (_ BitVec 64)) (_2!3052 V!13157)) )
))
(declare-datatypes ((List!5924 0))(
  ( (Nil!5921) (Cons!5920 (h!6776 tuple2!6082) (t!11074 List!5924)) )
))
(declare-datatypes ((ListLongMap!4995 0))(
  ( (ListLongMap!4996 (toList!2513 List!5924)) )
))
(declare-fun lt!175325 () ListLongMap!4995)

(declare-fun minValue!472 () V!13157)

(declare-fun getCurrentListMap!1944 (array!22007 array!22009 (_ BitVec 32) (_ BitVec 32) V!13157 V!13157 (_ BitVec 32) Int) ListLongMap!4995)

(assert (=> b!377249 (= lt!175325 (getCurrentListMap!1944 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175334 () array!22009)

(declare-fun lt!175329 () ListLongMap!4995)

(assert (=> b!377249 (= lt!175329 (getCurrentListMap!1944 lt!175326 lt!175334 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175324 () ListLongMap!4995)

(declare-fun lt!175333 () ListLongMap!4995)

(assert (=> b!377249 (and (= lt!175324 lt!175333) (= lt!175333 lt!175324))))

(declare-fun lt!175332 () ListLongMap!4995)

(declare-fun lt!175331 () tuple2!6082)

(declare-fun +!859 (ListLongMap!4995 tuple2!6082) ListLongMap!4995)

(assert (=> b!377249 (= lt!175333 (+!859 lt!175332 lt!175331))))

(declare-fun v!373 () V!13157)

(assert (=> b!377249 (= lt!175331 (tuple2!6083 k0!778 v!373))))

(declare-datatypes ((Unit!11622 0))(
  ( (Unit!11623) )
))
(declare-fun lt!175330 () Unit!11622)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!102 (array!22007 array!22009 (_ BitVec 32) (_ BitVec 32) V!13157 V!13157 (_ BitVec 32) (_ BitVec 64) V!13157 (_ BitVec 32) Int) Unit!11622)

(assert (=> b!377249 (= lt!175330 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!102 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!778 (array!22007 array!22009 (_ BitVec 32) (_ BitVec 32) V!13157 V!13157 (_ BitVec 32) Int) ListLongMap!4995)

(assert (=> b!377249 (= lt!175324 (getCurrentListMapNoExtraKeys!778 lt!175326 lt!175334 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377249 (= lt!175334 (array!22010 (store (arr!10473 _values!506) i!548 (ValueCellFull!4176 v!373)) (size!10825 _values!506)))))

(assert (=> b!377249 (= lt!175332 (getCurrentListMapNoExtraKeys!778 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377250 () Bool)

(declare-fun e!229691 () Bool)

(declare-fun e!229694 () Bool)

(assert (=> b!377250 (= e!229691 (and e!229694 mapRes!15123))))

(declare-fun condMapEmpty!15123 () Bool)

(declare-fun mapDefault!15123 () ValueCell!4176)

(assert (=> b!377250 (= condMapEmpty!15123 (= (arr!10473 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4176)) mapDefault!15123)))))

(declare-fun b!377251 () Bool)

(declare-fun e!229689 () Bool)

(declare-fun tp_is_empty!9039 () Bool)

(assert (=> b!377251 (= e!229689 tp_is_empty!9039)))

(declare-fun b!377252 () Bool)

(declare-fun res!213389 () Bool)

(assert (=> b!377252 (=> (not res!213389) (not e!229690))))

(assert (=> b!377252 (= res!213389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377253 () Bool)

(declare-fun e!229693 () Bool)

(assert (=> b!377253 (= e!229687 e!229693)))

(declare-fun res!213395 () Bool)

(assert (=> b!377253 (=> res!213395 e!229693)))

(assert (=> b!377253 (= res!213395 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!175335 () ListLongMap!4995)

(assert (=> b!377253 (= lt!175329 lt!175335)))

(declare-fun lt!175328 () tuple2!6082)

(assert (=> b!377253 (= lt!175335 (+!859 lt!175333 lt!175328))))

(declare-fun lt!175327 () ListLongMap!4995)

(assert (=> b!377253 (= lt!175325 lt!175327)))

(assert (=> b!377253 (= lt!175327 (+!859 lt!175332 lt!175328))))

(assert (=> b!377253 (= lt!175329 (+!859 lt!175324 lt!175328))))

(assert (=> b!377253 (= lt!175328 (tuple2!6083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377254 () Bool)

(declare-fun res!213392 () Bool)

(assert (=> b!377254 (=> (not res!213392) (not e!229688))))

(assert (=> b!377254 (= res!213392 (arrayNoDuplicates!0 lt!175326 #b00000000000000000000000000000000 Nil!5920))))

(declare-fun res!213397 () Bool)

(assert (=> start!37264 (=> (not res!213397) (not e!229690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37264 (= res!213397 (validMask!0 mask!970))))

(assert (=> start!37264 e!229690))

(declare-fun array_inv!7718 (array!22009) Bool)

(assert (=> start!37264 (and (array_inv!7718 _values!506) e!229691)))

(assert (=> start!37264 tp!29888))

(assert (=> start!37264 true))

(assert (=> start!37264 tp_is_empty!9039))

(declare-fun array_inv!7719 (array!22007) Bool)

(assert (=> start!37264 (array_inv!7719 _keys!658)))

(declare-fun b!377245 () Bool)

(assert (=> b!377245 (= e!229693 true)))

(assert (=> b!377245 (= lt!175335 (+!859 lt!175327 lt!175331))))

(declare-fun lt!175323 () Unit!11622)

(declare-fun addCommutativeForDiffKeys!269 (ListLongMap!4995 (_ BitVec 64) V!13157 (_ BitVec 64) V!13157) Unit!11622)

(assert (=> b!377245 (= lt!175323 (addCommutativeForDiffKeys!269 lt!175332 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377255 () Bool)

(assert (=> b!377255 (= e!229694 tp_is_empty!9039)))

(declare-fun mapNonEmpty!15123 () Bool)

(declare-fun tp!29889 () Bool)

(assert (=> mapNonEmpty!15123 (= mapRes!15123 (and tp!29889 e!229689))))

(declare-fun mapValue!15123 () ValueCell!4176)

(declare-fun mapRest!15123 () (Array (_ BitVec 32) ValueCell!4176))

(declare-fun mapKey!15123 () (_ BitVec 32))

(assert (=> mapNonEmpty!15123 (= (arr!10473 _values!506) (store mapRest!15123 mapKey!15123 mapValue!15123))))

(assert (= (and start!37264 res!213397) b!377247))

(assert (= (and b!377247 res!213391) b!377252))

(assert (= (and b!377252 res!213389) b!377244))

(assert (= (and b!377244 res!213396) b!377246))

(assert (= (and b!377246 res!213390) b!377243))

(assert (= (and b!377243 res!213387) b!377248))

(assert (= (and b!377248 res!213388) b!377241))

(assert (= (and b!377241 res!213393) b!377242))

(assert (= (and b!377242 res!213394) b!377254))

(assert (= (and b!377254 res!213392) b!377249))

(assert (= (and b!377249 (not res!213398)) b!377253))

(assert (= (and b!377253 (not res!213395)) b!377245))

(assert (= (and b!377250 condMapEmpty!15123) mapIsEmpty!15123))

(assert (= (and b!377250 (not condMapEmpty!15123)) mapNonEmpty!15123))

(get-info :version)

(assert (= (and mapNonEmpty!15123 ((_ is ValueCellFull!4176) mapValue!15123)) b!377251))

(assert (= (and b!377250 ((_ is ValueCellFull!4176) mapDefault!15123)) b!377255))

(assert (= start!37264 b!377250))

(declare-fun m!373995 () Bool)

(assert (=> b!377254 m!373995))

(declare-fun m!373997 () Bool)

(assert (=> b!377242 m!373997))

(declare-fun m!373999 () Bool)

(assert (=> b!377242 m!373999))

(declare-fun m!374001 () Bool)

(assert (=> b!377245 m!374001))

(declare-fun m!374003 () Bool)

(assert (=> b!377245 m!374003))

(declare-fun m!374005 () Bool)

(assert (=> b!377253 m!374005))

(declare-fun m!374007 () Bool)

(assert (=> b!377253 m!374007))

(declare-fun m!374009 () Bool)

(assert (=> b!377253 m!374009))

(declare-fun m!374011 () Bool)

(assert (=> b!377249 m!374011))

(declare-fun m!374013 () Bool)

(assert (=> b!377249 m!374013))

(declare-fun m!374015 () Bool)

(assert (=> b!377249 m!374015))

(declare-fun m!374017 () Bool)

(assert (=> b!377249 m!374017))

(declare-fun m!374019 () Bool)

(assert (=> b!377249 m!374019))

(declare-fun m!374021 () Bool)

(assert (=> b!377249 m!374021))

(declare-fun m!374023 () Bool)

(assert (=> b!377249 m!374023))

(declare-fun m!374025 () Bool)

(assert (=> b!377252 m!374025))

(declare-fun m!374027 () Bool)

(assert (=> mapNonEmpty!15123 m!374027))

(declare-fun m!374029 () Bool)

(assert (=> b!377244 m!374029))

(declare-fun m!374031 () Bool)

(assert (=> b!377248 m!374031))

(declare-fun m!374033 () Bool)

(assert (=> start!37264 m!374033))

(declare-fun m!374035 () Bool)

(assert (=> start!37264 m!374035))

(declare-fun m!374037 () Bool)

(assert (=> start!37264 m!374037))

(declare-fun m!374039 () Bool)

(assert (=> b!377241 m!374039))

(declare-fun m!374041 () Bool)

(assert (=> b!377243 m!374041))

(check-sat (not b!377245) b_and!15633 (not b!377242) (not b!377241) (not b!377253) tp_is_empty!9039 (not mapNonEmpty!15123) (not b!377254) (not b!377244) (not b_next!8391) (not start!37264) (not b!377252) (not b!377243) (not b!377249))
(check-sat b_and!15633 (not b_next!8391))
