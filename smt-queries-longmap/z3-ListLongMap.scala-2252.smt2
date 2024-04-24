; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36960 () Bool)

(assert start!36960)

(declare-fun b_free!8101 () Bool)

(declare-fun b_next!8101 () Bool)

(assert (=> start!36960 (= b_free!8101 (not b_next!8101))))

(declare-fun tp!29018 () Bool)

(declare-fun b_and!15357 () Bool)

(assert (=> start!36960 (= tp!29018 b_and!15357)))

(declare-fun b!370960 () Bool)

(declare-fun res!208464 () Bool)

(declare-fun e!226491 () Bool)

(assert (=> b!370960 (=> (not res!208464) (not e!226491))))

(declare-datatypes ((array!21424 0))(
  ( (array!21425 (arr!10180 (Array (_ BitVec 32) (_ BitVec 64))) (size!10532 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21424)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21424 (_ BitVec 32)) Bool)

(assert (=> b!370960 (= res!208464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14688 () Bool)

(declare-fun mapRes!14688 () Bool)

(assert (=> mapIsEmpty!14688 mapRes!14688))

(declare-fun b!370961 () Bool)

(declare-fun res!208459 () Bool)

(assert (=> b!370961 (=> (not res!208459) (not e!226491))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370961 (= res!208459 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370962 () Bool)

(declare-fun res!208466 () Bool)

(assert (=> b!370962 (=> (not res!208466) (not e!226491))))

(declare-datatypes ((List!5600 0))(
  ( (Nil!5597) (Cons!5596 (h!6452 (_ BitVec 64)) (t!10742 List!5600)) )
))
(declare-fun arrayNoDuplicates!0 (array!21424 (_ BitVec 32) List!5600) Bool)

(assert (=> b!370962 (= res!208466 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5597))))

(declare-fun b!370963 () Bool)

(declare-fun e!226486 () Bool)

(assert (=> b!370963 (= e!226486 (not true))))

(declare-datatypes ((V!12771 0))(
  ( (V!12772 (val!4419 Int)) )
))
(declare-datatypes ((tuple2!5764 0))(
  ( (tuple2!5765 (_1!2893 (_ BitVec 64)) (_2!2893 V!12771)) )
))
(declare-datatypes ((List!5601 0))(
  ( (Nil!5598) (Cons!5597 (h!6453 tuple2!5764) (t!10743 List!5601)) )
))
(declare-datatypes ((ListLongMap!4679 0))(
  ( (ListLongMap!4680 (toList!2355 List!5601)) )
))
(declare-fun lt!170141 () ListLongMap!4679)

(declare-fun lt!170142 () ListLongMap!4679)

(assert (=> b!370963 (and (= lt!170141 lt!170142) (= lt!170142 lt!170141))))

(declare-fun v!373 () V!12771)

(declare-fun lt!170140 () ListLongMap!4679)

(declare-fun +!751 (ListLongMap!4679 tuple2!5764) ListLongMap!4679)

(assert (=> b!370963 (= lt!170142 (+!751 lt!170140 (tuple2!5765 k0!778 v!373)))))

(declare-datatypes ((ValueCell!4031 0))(
  ( (ValueCellFull!4031 (v!6617 V!12771)) (EmptyCell!4031) )
))
(declare-datatypes ((array!21426 0))(
  ( (array!21427 (arr!10181 (Array (_ BitVec 32) ValueCell!4031)) (size!10533 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21426)

(declare-datatypes ((Unit!11393 0))(
  ( (Unit!11394) )
))
(declare-fun lt!170143 () Unit!11393)

(declare-fun zeroValue!472 () V!12771)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12771)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!4 (array!21424 array!21426 (_ BitVec 32) (_ BitVec 32) V!12771 V!12771 (_ BitVec 32) (_ BitVec 64) V!12771 (_ BitVec 32) Int) Unit!11393)

(assert (=> b!370963 (= lt!170143 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!4 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170139 () array!21424)

(declare-fun getCurrentListMapNoExtraKeys!664 (array!21424 array!21426 (_ BitVec 32) (_ BitVec 32) V!12771 V!12771 (_ BitVec 32) Int) ListLongMap!4679)

(assert (=> b!370963 (= lt!170141 (getCurrentListMapNoExtraKeys!664 lt!170139 (array!21427 (store (arr!10181 _values!506) i!548 (ValueCellFull!4031 v!373)) (size!10533 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!370963 (= lt!170140 (getCurrentListMapNoExtraKeys!664 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370964 () Bool)

(declare-fun res!208465 () Bool)

(assert (=> b!370964 (=> (not res!208465) (not e!226491))))

(assert (=> b!370964 (= res!208465 (and (= (size!10533 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10532 _keys!658) (size!10533 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370965 () Bool)

(declare-fun res!208457 () Bool)

(assert (=> b!370965 (=> (not res!208457) (not e!226491))))

(assert (=> b!370965 (= res!208457 (or (= (select (arr!10180 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10180 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370966 () Bool)

(declare-fun res!208461 () Bool)

(assert (=> b!370966 (=> (not res!208461) (not e!226491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370966 (= res!208461 (validKeyInArray!0 k0!778))))

(declare-fun b!370967 () Bool)

(declare-fun res!208460 () Bool)

(assert (=> b!370967 (=> (not res!208460) (not e!226491))))

(assert (=> b!370967 (= res!208460 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10532 _keys!658))))))

(declare-fun mapNonEmpty!14688 () Bool)

(declare-fun tp!29019 () Bool)

(declare-fun e!226489 () Bool)

(assert (=> mapNonEmpty!14688 (= mapRes!14688 (and tp!29019 e!226489))))

(declare-fun mapRest!14688 () (Array (_ BitVec 32) ValueCell!4031))

(declare-fun mapValue!14688 () ValueCell!4031)

(declare-fun mapKey!14688 () (_ BitVec 32))

(assert (=> mapNonEmpty!14688 (= (arr!10181 _values!506) (store mapRest!14688 mapKey!14688 mapValue!14688))))

(declare-fun res!208458 () Bool)

(assert (=> start!36960 (=> (not res!208458) (not e!226491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36960 (= res!208458 (validMask!0 mask!970))))

(assert (=> start!36960 e!226491))

(declare-fun e!226490 () Bool)

(declare-fun array_inv!7552 (array!21426) Bool)

(assert (=> start!36960 (and (array_inv!7552 _values!506) e!226490)))

(assert (=> start!36960 tp!29018))

(assert (=> start!36960 true))

(declare-fun tp_is_empty!8749 () Bool)

(assert (=> start!36960 tp_is_empty!8749))

(declare-fun array_inv!7553 (array!21424) Bool)

(assert (=> start!36960 (array_inv!7553 _keys!658)))

(declare-fun b!370968 () Bool)

(assert (=> b!370968 (= e!226489 tp_is_empty!8749)))

(declare-fun b!370969 () Bool)

(declare-fun e!226487 () Bool)

(assert (=> b!370969 (= e!226490 (and e!226487 mapRes!14688))))

(declare-fun condMapEmpty!14688 () Bool)

(declare-fun mapDefault!14688 () ValueCell!4031)

(assert (=> b!370969 (= condMapEmpty!14688 (= (arr!10181 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4031)) mapDefault!14688)))))

(declare-fun b!370970 () Bool)

(declare-fun res!208463 () Bool)

(assert (=> b!370970 (=> (not res!208463) (not e!226486))))

(assert (=> b!370970 (= res!208463 (arrayNoDuplicates!0 lt!170139 #b00000000000000000000000000000000 Nil!5597))))

(declare-fun b!370971 () Bool)

(assert (=> b!370971 (= e!226491 e!226486)))

(declare-fun res!208462 () Bool)

(assert (=> b!370971 (=> (not res!208462) (not e!226486))))

(assert (=> b!370971 (= res!208462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170139 mask!970))))

(assert (=> b!370971 (= lt!170139 (array!21425 (store (arr!10180 _keys!658) i!548 k0!778) (size!10532 _keys!658)))))

(declare-fun b!370972 () Bool)

(assert (=> b!370972 (= e!226487 tp_is_empty!8749)))

(assert (= (and start!36960 res!208458) b!370964))

(assert (= (and b!370964 res!208465) b!370960))

(assert (= (and b!370960 res!208464) b!370962))

(assert (= (and b!370962 res!208466) b!370967))

(assert (= (and b!370967 res!208460) b!370966))

(assert (= (and b!370966 res!208461) b!370965))

(assert (= (and b!370965 res!208457) b!370961))

(assert (= (and b!370961 res!208459) b!370971))

(assert (= (and b!370971 res!208462) b!370970))

(assert (= (and b!370970 res!208463) b!370963))

(assert (= (and b!370969 condMapEmpty!14688) mapIsEmpty!14688))

(assert (= (and b!370969 (not condMapEmpty!14688)) mapNonEmpty!14688))

(get-info :version)

(assert (= (and mapNonEmpty!14688 ((_ is ValueCellFull!4031) mapValue!14688)) b!370968))

(assert (= (and b!370969 ((_ is ValueCellFull!4031) mapDefault!14688)) b!370972))

(assert (= start!36960 b!370969))

(declare-fun m!367265 () Bool)

(assert (=> mapNonEmpty!14688 m!367265))

(declare-fun m!367267 () Bool)

(assert (=> b!370962 m!367267))

(declare-fun m!367269 () Bool)

(assert (=> b!370966 m!367269))

(declare-fun m!367271 () Bool)

(assert (=> b!370970 m!367271))

(declare-fun m!367273 () Bool)

(assert (=> b!370961 m!367273))

(declare-fun m!367275 () Bool)

(assert (=> b!370971 m!367275))

(declare-fun m!367277 () Bool)

(assert (=> b!370971 m!367277))

(declare-fun m!367279 () Bool)

(assert (=> b!370963 m!367279))

(declare-fun m!367281 () Bool)

(assert (=> b!370963 m!367281))

(declare-fun m!367283 () Bool)

(assert (=> b!370963 m!367283))

(declare-fun m!367285 () Bool)

(assert (=> b!370963 m!367285))

(declare-fun m!367287 () Bool)

(assert (=> b!370963 m!367287))

(declare-fun m!367289 () Bool)

(assert (=> start!36960 m!367289))

(declare-fun m!367291 () Bool)

(assert (=> start!36960 m!367291))

(declare-fun m!367293 () Bool)

(assert (=> start!36960 m!367293))

(declare-fun m!367295 () Bool)

(assert (=> b!370960 m!367295))

(declare-fun m!367297 () Bool)

(assert (=> b!370965 m!367297))

(check-sat (not b!370961) (not b!370966) (not b!370970) (not b_next!8101) (not mapNonEmpty!14688) (not b!370960) b_and!15357 (not b!370971) (not b!370963) (not start!36960) (not b!370962) tp_is_empty!8749)
(check-sat b_and!15357 (not b_next!8101))
