; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37386 () Bool)

(assert start!37386)

(declare-fun b_free!8527 () Bool)

(declare-fun b_next!8527 () Bool)

(assert (=> start!37386 (= b_free!8527 (not b_next!8527))))

(declare-fun tp!30297 () Bool)

(declare-fun b_and!15783 () Bool)

(assert (=> start!37386 (= tp!30297 b_and!15783)))

(declare-fun b!380261 () Bool)

(declare-fun res!215844 () Bool)

(declare-fun e!231294 () Bool)

(assert (=> b!380261 (=> (not res!215844) (not e!231294))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22256 0))(
  ( (array!22257 (arr!10596 (Array (_ BitVec 32) (_ BitVec 64))) (size!10948 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22256)

(assert (=> b!380261 (= res!215844 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10948 _keys!658))))))

(declare-fun b!380262 () Bool)

(declare-fun res!215850 () Bool)

(assert (=> b!380262 (=> (not res!215850) (not e!231294))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380262 (= res!215850 (validKeyInArray!0 k0!778))))

(declare-fun b!380263 () Bool)

(declare-fun e!231290 () Bool)

(declare-fun e!231287 () Bool)

(declare-fun mapRes!15327 () Bool)

(assert (=> b!380263 (= e!231290 (and e!231287 mapRes!15327))))

(declare-fun condMapEmpty!15327 () Bool)

(declare-datatypes ((V!13339 0))(
  ( (V!13340 (val!4632 Int)) )
))
(declare-datatypes ((ValueCell!4244 0))(
  ( (ValueCellFull!4244 (v!6830 V!13339)) (EmptyCell!4244) )
))
(declare-datatypes ((array!22258 0))(
  ( (array!22259 (arr!10597 (Array (_ BitVec 32) ValueCell!4244)) (size!10949 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22258)

(declare-fun mapDefault!15327 () ValueCell!4244)

(assert (=> b!380263 (= condMapEmpty!15327 (= (arr!10597 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4244)) mapDefault!15327)))))

(declare-fun b!380264 () Bool)

(declare-fun res!215841 () Bool)

(assert (=> b!380264 (=> (not res!215841) (not e!231294))))

(declare-fun arrayContainsKey!0 (array!22256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380264 (= res!215841 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15327 () Bool)

(assert (=> mapIsEmpty!15327 mapRes!15327))

(declare-fun b!380265 () Bool)

(declare-fun res!215849 () Bool)

(assert (=> b!380265 (=> (not res!215849) (not e!231294))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22256 (_ BitVec 32)) Bool)

(assert (=> b!380265 (= res!215849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380266 () Bool)

(declare-fun e!231292 () Bool)

(declare-fun e!231289 () Bool)

(assert (=> b!380266 (= e!231292 e!231289)))

(declare-fun res!215845 () Bool)

(assert (=> b!380266 (=> res!215845 e!231289)))

(assert (=> b!380266 (= res!215845 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6092 0))(
  ( (tuple2!6093 (_1!3057 (_ BitVec 64)) (_2!3057 V!13339)) )
))
(declare-datatypes ((List!5930 0))(
  ( (Nil!5927) (Cons!5926 (h!6782 tuple2!6092) (t!11072 List!5930)) )
))
(declare-datatypes ((ListLongMap!5007 0))(
  ( (ListLongMap!5008 (toList!2519 List!5930)) )
))
(declare-fun lt!177969 () ListLongMap!5007)

(declare-fun lt!177960 () ListLongMap!5007)

(assert (=> b!380266 (= lt!177969 lt!177960)))

(declare-fun lt!177962 () ListLongMap!5007)

(declare-fun lt!177966 () tuple2!6092)

(declare-fun +!915 (ListLongMap!5007 tuple2!6092) ListLongMap!5007)

(assert (=> b!380266 (= lt!177960 (+!915 lt!177962 lt!177966))))

(declare-fun lt!177964 () ListLongMap!5007)

(declare-fun lt!177959 () ListLongMap!5007)

(assert (=> b!380266 (= lt!177964 lt!177959)))

(declare-fun lt!177958 () ListLongMap!5007)

(assert (=> b!380266 (= lt!177959 (+!915 lt!177958 lt!177966))))

(declare-fun lt!177968 () ListLongMap!5007)

(assert (=> b!380266 (= lt!177964 (+!915 lt!177968 lt!177966))))

(declare-fun minValue!472 () V!13339)

(assert (=> b!380266 (= lt!177966 (tuple2!6093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380267 () Bool)

(declare-fun res!215852 () Bool)

(assert (=> b!380267 (=> (not res!215852) (not e!231294))))

(assert (=> b!380267 (= res!215852 (or (= (select (arr!10596 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10596 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!215843 () Bool)

(assert (=> start!37386 (=> (not res!215843) (not e!231294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37386 (= res!215843 (validMask!0 mask!970))))

(assert (=> start!37386 e!231294))

(declare-fun array_inv!7844 (array!22258) Bool)

(assert (=> start!37386 (and (array_inv!7844 _values!506) e!231290)))

(assert (=> start!37386 tp!30297))

(assert (=> start!37386 true))

(declare-fun tp_is_empty!9175 () Bool)

(assert (=> start!37386 tp_is_empty!9175))

(declare-fun array_inv!7845 (array!22256) Bool)

(assert (=> start!37386 (array_inv!7845 _keys!658)))

(declare-fun mapNonEmpty!15327 () Bool)

(declare-fun tp!30296 () Bool)

(declare-fun e!231291 () Bool)

(assert (=> mapNonEmpty!15327 (= mapRes!15327 (and tp!30296 e!231291))))

(declare-fun mapValue!15327 () ValueCell!4244)

(declare-fun mapRest!15327 () (Array (_ BitVec 32) ValueCell!4244))

(declare-fun mapKey!15327 () (_ BitVec 32))

(assert (=> mapNonEmpty!15327 (= (arr!10597 _values!506) (store mapRest!15327 mapKey!15327 mapValue!15327))))

(declare-fun b!380268 () Bool)

(assert (=> b!380268 (= e!231291 tp_is_empty!9175)))

(declare-fun b!380269 () Bool)

(assert (=> b!380269 (= e!231289 true)))

(declare-fun lt!177963 () tuple2!6092)

(assert (=> b!380269 (= lt!177959 (+!915 lt!177960 lt!177963))))

(declare-fun v!373 () V!13339)

(declare-datatypes ((Unit!11711 0))(
  ( (Unit!11712) )
))
(declare-fun lt!177965 () Unit!11711)

(declare-fun addCommutativeForDiffKeys!325 (ListLongMap!5007 (_ BitVec 64) V!13339 (_ BitVec 64) V!13339) Unit!11711)

(assert (=> b!380269 (= lt!177965 (addCommutativeForDiffKeys!325 lt!177962 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380270 () Bool)

(declare-fun e!231288 () Bool)

(assert (=> b!380270 (= e!231294 e!231288)))

(declare-fun res!215848 () Bool)

(assert (=> b!380270 (=> (not res!215848) (not e!231288))))

(declare-fun lt!177961 () array!22256)

(assert (=> b!380270 (= res!215848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177961 mask!970))))

(assert (=> b!380270 (= lt!177961 (array!22257 (store (arr!10596 _keys!658) i!548 k0!778) (size!10948 _keys!658)))))

(declare-fun b!380271 () Bool)

(assert (=> b!380271 (= e!231288 (not e!231292))))

(declare-fun res!215846 () Bool)

(assert (=> b!380271 (=> res!215846 e!231292)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380271 (= res!215846 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13339)

(declare-fun getCurrentListMap!1958 (array!22256 array!22258 (_ BitVec 32) (_ BitVec 32) V!13339 V!13339 (_ BitVec 32) Int) ListLongMap!5007)

(assert (=> b!380271 (= lt!177969 (getCurrentListMap!1958 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177967 () array!22258)

(assert (=> b!380271 (= lt!177964 (getCurrentListMap!1958 lt!177961 lt!177967 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380271 (and (= lt!177968 lt!177958) (= lt!177958 lt!177968))))

(assert (=> b!380271 (= lt!177958 (+!915 lt!177962 lt!177963))))

(assert (=> b!380271 (= lt!177963 (tuple2!6093 k0!778 v!373))))

(declare-fun lt!177970 () Unit!11711)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!145 (array!22256 array!22258 (_ BitVec 32) (_ BitVec 32) V!13339 V!13339 (_ BitVec 32) (_ BitVec 64) V!13339 (_ BitVec 32) Int) Unit!11711)

(assert (=> b!380271 (= lt!177970 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!145 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!805 (array!22256 array!22258 (_ BitVec 32) (_ BitVec 32) V!13339 V!13339 (_ BitVec 32) Int) ListLongMap!5007)

(assert (=> b!380271 (= lt!177968 (getCurrentListMapNoExtraKeys!805 lt!177961 lt!177967 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380271 (= lt!177967 (array!22259 (store (arr!10597 _values!506) i!548 (ValueCellFull!4244 v!373)) (size!10949 _values!506)))))

(assert (=> b!380271 (= lt!177962 (getCurrentListMapNoExtraKeys!805 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380272 () Bool)

(declare-fun res!215842 () Bool)

(assert (=> b!380272 (=> (not res!215842) (not e!231288))))

(declare-datatypes ((List!5931 0))(
  ( (Nil!5928) (Cons!5927 (h!6783 (_ BitVec 64)) (t!11073 List!5931)) )
))
(declare-fun arrayNoDuplicates!0 (array!22256 (_ BitVec 32) List!5931) Bool)

(assert (=> b!380272 (= res!215842 (arrayNoDuplicates!0 lt!177961 #b00000000000000000000000000000000 Nil!5928))))

(declare-fun b!380273 () Bool)

(assert (=> b!380273 (= e!231287 tp_is_empty!9175)))

(declare-fun b!380274 () Bool)

(declare-fun res!215851 () Bool)

(assert (=> b!380274 (=> (not res!215851) (not e!231294))))

(assert (=> b!380274 (= res!215851 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5928))))

(declare-fun b!380275 () Bool)

(declare-fun res!215847 () Bool)

(assert (=> b!380275 (=> (not res!215847) (not e!231294))))

(assert (=> b!380275 (= res!215847 (and (= (size!10949 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10948 _keys!658) (size!10949 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37386 res!215843) b!380275))

(assert (= (and b!380275 res!215847) b!380265))

(assert (= (and b!380265 res!215849) b!380274))

(assert (= (and b!380274 res!215851) b!380261))

(assert (= (and b!380261 res!215844) b!380262))

(assert (= (and b!380262 res!215850) b!380267))

(assert (= (and b!380267 res!215852) b!380264))

(assert (= (and b!380264 res!215841) b!380270))

(assert (= (and b!380270 res!215848) b!380272))

(assert (= (and b!380272 res!215842) b!380271))

(assert (= (and b!380271 (not res!215846)) b!380266))

(assert (= (and b!380266 (not res!215845)) b!380269))

(assert (= (and b!380263 condMapEmpty!15327) mapIsEmpty!15327))

(assert (= (and b!380263 (not condMapEmpty!15327)) mapNonEmpty!15327))

(get-info :version)

(assert (= (and mapNonEmpty!15327 ((_ is ValueCellFull!4244) mapValue!15327)) b!380268))

(assert (= (and b!380263 ((_ is ValueCellFull!4244) mapDefault!15327)) b!380273))

(assert (= start!37386 b!380263))

(declare-fun m!377477 () Bool)

(assert (=> b!380269 m!377477))

(declare-fun m!377479 () Bool)

(assert (=> b!380269 m!377479))

(declare-fun m!377481 () Bool)

(assert (=> b!380267 m!377481))

(declare-fun m!377483 () Bool)

(assert (=> b!380264 m!377483))

(declare-fun m!377485 () Bool)

(assert (=> b!380266 m!377485))

(declare-fun m!377487 () Bool)

(assert (=> b!380266 m!377487))

(declare-fun m!377489 () Bool)

(assert (=> b!380266 m!377489))

(declare-fun m!377491 () Bool)

(assert (=> b!380270 m!377491))

(declare-fun m!377493 () Bool)

(assert (=> b!380270 m!377493))

(declare-fun m!377495 () Bool)

(assert (=> start!37386 m!377495))

(declare-fun m!377497 () Bool)

(assert (=> start!37386 m!377497))

(declare-fun m!377499 () Bool)

(assert (=> start!37386 m!377499))

(declare-fun m!377501 () Bool)

(assert (=> mapNonEmpty!15327 m!377501))

(declare-fun m!377503 () Bool)

(assert (=> b!380274 m!377503))

(declare-fun m!377505 () Bool)

(assert (=> b!380262 m!377505))

(declare-fun m!377507 () Bool)

(assert (=> b!380265 m!377507))

(declare-fun m!377509 () Bool)

(assert (=> b!380272 m!377509))

(declare-fun m!377511 () Bool)

(assert (=> b!380271 m!377511))

(declare-fun m!377513 () Bool)

(assert (=> b!380271 m!377513))

(declare-fun m!377515 () Bool)

(assert (=> b!380271 m!377515))

(declare-fun m!377517 () Bool)

(assert (=> b!380271 m!377517))

(declare-fun m!377519 () Bool)

(assert (=> b!380271 m!377519))

(declare-fun m!377521 () Bool)

(assert (=> b!380271 m!377521))

(declare-fun m!377523 () Bool)

(assert (=> b!380271 m!377523))

(check-sat tp_is_empty!9175 (not b!380269) (not b!380262) (not start!37386) (not b!380271) (not b!380266) (not b!380274) (not b!380264) (not mapNonEmpty!15327) (not b!380272) (not b!380270) (not b_next!8527) b_and!15783 (not b!380265))
(check-sat b_and!15783 (not b_next!8527))
