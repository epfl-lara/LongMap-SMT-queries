; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39350 () Bool)

(assert start!39350)

(declare-fun b_free!9631 () Bool)

(declare-fun b_next!9631 () Bool)

(assert (=> start!39350 (= b_free!9631 (not b_next!9631))))

(declare-fun tp!34422 () Bool)

(declare-fun b_and!17151 () Bool)

(assert (=> start!39350 (= tp!34422 b_and!17151)))

(declare-fun b!417853 () Bool)

(declare-fun res!243441 () Bool)

(declare-fun e!249241 () Bool)

(assert (=> b!417853 (=> (not res!243441) (not e!249241))))

(declare-datatypes ((array!25424 0))(
  ( (array!25425 (arr!12161 (Array (_ BitVec 32) (_ BitVec 64))) (size!12513 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25424)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417853 (= res!243441 (or (= (select (arr!12161 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12161 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417854 () Bool)

(declare-fun e!249242 () Bool)

(declare-fun tp_is_empty!10783 () Bool)

(assert (=> b!417854 (= e!249242 tp_is_empty!10783)))

(declare-fun b!417855 () Bool)

(declare-fun e!249237 () Bool)

(declare-datatypes ((V!15483 0))(
  ( (V!15484 (val!5436 Int)) )
))
(declare-datatypes ((tuple2!6978 0))(
  ( (tuple2!6979 (_1!3500 (_ BitVec 64)) (_2!3500 V!15483)) )
))
(declare-datatypes ((List!6993 0))(
  ( (Nil!6990) (Cons!6989 (h!7845 tuple2!6978) (t!12281 List!6993)) )
))
(declare-datatypes ((ListLongMap!5893 0))(
  ( (ListLongMap!5894 (toList!2962 List!6993)) )
))
(declare-fun call!29059 () ListLongMap!5893)

(declare-fun call!29058 () ListLongMap!5893)

(assert (=> b!417855 (= e!249237 (= call!29059 call!29058))))

(declare-fun b!417856 () Bool)

(declare-fun res!243436 () Bool)

(assert (=> b!417856 (=> (not res!243436) (not e!249241))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25424 (_ BitVec 32)) Bool)

(assert (=> b!417856 (= res!243436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417857 () Bool)

(declare-fun e!249238 () Bool)

(assert (=> b!417857 (= e!249238 tp_is_empty!10783)))

(declare-fun b!417858 () Bool)

(declare-fun res!243432 () Bool)

(declare-fun e!249244 () Bool)

(assert (=> b!417858 (=> (not res!243432) (not e!249244))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!417858 (= res!243432 (bvsle from!863 i!563))))

(declare-fun b!417859 () Bool)

(declare-fun e!249240 () Bool)

(declare-fun e!249239 () Bool)

(assert (=> b!417859 (= e!249240 (not e!249239))))

(declare-fun res!243442 () Bool)

(assert (=> b!417859 (=> res!243442 e!249239)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417859 (= res!243442 (validKeyInArray!0 (select (arr!12161 _keys!709) from!863)))))

(assert (=> b!417859 e!249237))

(declare-fun c!55137 () Bool)

(assert (=> b!417859 (= c!55137 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15483)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5048 0))(
  ( (ValueCellFull!5048 (v!7684 V!15483)) (EmptyCell!5048) )
))
(declare-datatypes ((array!25426 0))(
  ( (array!25427 (arr!12162 (Array (_ BitVec 32) ValueCell!5048)) (size!12514 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25426)

(declare-fun zeroValue!515 () V!15483)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15483)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12333 0))(
  ( (Unit!12334) )
))
(declare-fun lt!191509 () Unit!12333)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!428 (array!25424 array!25426 (_ BitVec 32) (_ BitVec 32) V!15483 V!15483 (_ BitVec 32) (_ BitVec 64) V!15483 (_ BitVec 32) Int) Unit!12333)

(assert (=> b!417859 (= lt!191509 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!428 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417860 () Bool)

(declare-fun res!243434 () Bool)

(assert (=> b!417860 (=> (not res!243434) (not e!249241))))

(assert (=> b!417860 (= res!243434 (and (= (size!12514 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12513 _keys!709) (size!12514 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!417861 () Bool)

(declare-fun res!243438 () Bool)

(assert (=> b!417861 (=> (not res!243438) (not e!249241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417861 (= res!243438 (validMask!0 mask!1025))))

(declare-fun res!243433 () Bool)

(assert (=> start!39350 (=> (not res!243433) (not e!249241))))

(assert (=> start!39350 (= res!243433 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12513 _keys!709))))))

(assert (=> start!39350 e!249241))

(assert (=> start!39350 tp_is_empty!10783))

(assert (=> start!39350 tp!34422))

(assert (=> start!39350 true))

(declare-fun e!249243 () Bool)

(declare-fun array_inv!8946 (array!25426) Bool)

(assert (=> start!39350 (and (array_inv!8946 _values!549) e!249243)))

(declare-fun array_inv!8947 (array!25424) Bool)

(assert (=> start!39350 (array_inv!8947 _keys!709)))

(declare-fun b!417862 () Bool)

(assert (=> b!417862 (= e!249244 e!249240)))

(declare-fun res!243435 () Bool)

(assert (=> b!417862 (=> (not res!243435) (not e!249240))))

(assert (=> b!417862 (= res!243435 (= from!863 i!563))))

(declare-fun lt!191507 () ListLongMap!5893)

(declare-fun lt!191513 () array!25426)

(declare-fun lt!191510 () array!25424)

(declare-fun getCurrentListMapNoExtraKeys!1208 (array!25424 array!25426 (_ BitVec 32) (_ BitVec 32) V!15483 V!15483 (_ BitVec 32) Int) ListLongMap!5893)

(assert (=> b!417862 (= lt!191507 (getCurrentListMapNoExtraKeys!1208 lt!191510 lt!191513 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417862 (= lt!191513 (array!25427 (store (arr!12162 _values!549) i!563 (ValueCellFull!5048 v!412)) (size!12514 _values!549)))))

(declare-fun lt!191506 () ListLongMap!5893)

(assert (=> b!417862 (= lt!191506 (getCurrentListMapNoExtraKeys!1208 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417863 () Bool)

(declare-fun res!243439 () Bool)

(assert (=> b!417863 (=> (not res!243439) (not e!249241))))

(declare-datatypes ((List!6994 0))(
  ( (Nil!6991) (Cons!6990 (h!7846 (_ BitVec 64)) (t!12282 List!6994)) )
))
(declare-fun arrayNoDuplicates!0 (array!25424 (_ BitVec 32) List!6994) Bool)

(assert (=> b!417863 (= res!243439 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6991))))

(declare-fun mapNonEmpty!17796 () Bool)

(declare-fun mapRes!17796 () Bool)

(declare-fun tp!34421 () Bool)

(assert (=> mapNonEmpty!17796 (= mapRes!17796 (and tp!34421 e!249238))))

(declare-fun mapRest!17796 () (Array (_ BitVec 32) ValueCell!5048))

(declare-fun mapKey!17796 () (_ BitVec 32))

(declare-fun mapValue!17796 () ValueCell!5048)

(assert (=> mapNonEmpty!17796 (= (arr!12162 _values!549) (store mapRest!17796 mapKey!17796 mapValue!17796))))

(declare-fun b!417864 () Bool)

(declare-fun res!243431 () Bool)

(assert (=> b!417864 (=> (not res!243431) (not e!249241))))

(declare-fun arrayContainsKey!0 (array!25424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417864 (= res!243431 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417865 () Bool)

(assert (=> b!417865 (= e!249243 (and e!249242 mapRes!17796))))

(declare-fun condMapEmpty!17796 () Bool)

(declare-fun mapDefault!17796 () ValueCell!5048)

(assert (=> b!417865 (= condMapEmpty!17796 (= (arr!12162 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5048)) mapDefault!17796)))))

(declare-fun b!417866 () Bool)

(assert (=> b!417866 (= e!249239 true)))

(declare-fun lt!191504 () V!15483)

(declare-fun lt!191508 () ListLongMap!5893)

(declare-fun lt!191505 () tuple2!6978)

(declare-fun +!1231 (ListLongMap!5893 tuple2!6978) ListLongMap!5893)

(assert (=> b!417866 (= (+!1231 lt!191508 lt!191505) (+!1231 (+!1231 lt!191508 (tuple2!6979 k0!794 lt!191504)) lt!191505))))

(declare-fun lt!191511 () V!15483)

(assert (=> b!417866 (= lt!191505 (tuple2!6979 k0!794 lt!191511))))

(declare-fun lt!191512 () Unit!12333)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!22 (ListLongMap!5893 (_ BitVec 64) V!15483 V!15483) Unit!12333)

(assert (=> b!417866 (= lt!191512 (addSameAsAddTwiceSameKeyDiffValues!22 lt!191508 k0!794 lt!191504 lt!191511))))

(declare-fun lt!191514 () V!15483)

(declare-fun get!6020 (ValueCell!5048 V!15483) V!15483)

(assert (=> b!417866 (= lt!191504 (get!6020 (select (arr!12162 _values!549) from!863) lt!191514))))

(assert (=> b!417866 (= lt!191507 (+!1231 lt!191508 (tuple2!6979 (select (arr!12161 lt!191510) from!863) lt!191511)))))

(assert (=> b!417866 (= lt!191511 (get!6020 (select (store (arr!12162 _values!549) i!563 (ValueCellFull!5048 v!412)) from!863) lt!191514))))

(declare-fun dynLambda!689 (Int (_ BitVec 64)) V!15483)

(assert (=> b!417866 (= lt!191514 (dynLambda!689 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!417866 (= lt!191508 (getCurrentListMapNoExtraKeys!1208 lt!191510 lt!191513 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29055 () Bool)

(assert (=> bm!29055 (= call!29059 (getCurrentListMapNoExtraKeys!1208 (ite c!55137 _keys!709 lt!191510) (ite c!55137 _values!549 lt!191513) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417867 () Bool)

(declare-fun res!243443 () Bool)

(assert (=> b!417867 (=> (not res!243443) (not e!249244))))

(assert (=> b!417867 (= res!243443 (arrayNoDuplicates!0 lt!191510 #b00000000000000000000000000000000 Nil!6991))))

(declare-fun b!417868 () Bool)

(assert (=> b!417868 (= e!249241 e!249244)))

(declare-fun res!243444 () Bool)

(assert (=> b!417868 (=> (not res!243444) (not e!249244))))

(assert (=> b!417868 (= res!243444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191510 mask!1025))))

(assert (=> b!417868 (= lt!191510 (array!25425 (store (arr!12161 _keys!709) i!563 k0!794) (size!12513 _keys!709)))))

(declare-fun b!417869 () Bool)

(assert (=> b!417869 (= e!249237 (= call!29058 (+!1231 call!29059 (tuple2!6979 k0!794 v!412))))))

(declare-fun b!417870 () Bool)

(declare-fun res!243440 () Bool)

(assert (=> b!417870 (=> (not res!243440) (not e!249241))))

(assert (=> b!417870 (= res!243440 (validKeyInArray!0 k0!794))))

(declare-fun b!417871 () Bool)

(declare-fun res!243437 () Bool)

(assert (=> b!417871 (=> (not res!243437) (not e!249241))))

(assert (=> b!417871 (= res!243437 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12513 _keys!709))))))

(declare-fun mapIsEmpty!17796 () Bool)

(assert (=> mapIsEmpty!17796 mapRes!17796))

(declare-fun bm!29056 () Bool)

(assert (=> bm!29056 (= call!29058 (getCurrentListMapNoExtraKeys!1208 (ite c!55137 lt!191510 _keys!709) (ite c!55137 lt!191513 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39350 res!243433) b!417861))

(assert (= (and b!417861 res!243438) b!417860))

(assert (= (and b!417860 res!243434) b!417856))

(assert (= (and b!417856 res!243436) b!417863))

(assert (= (and b!417863 res!243439) b!417871))

(assert (= (and b!417871 res!243437) b!417870))

(assert (= (and b!417870 res!243440) b!417853))

(assert (= (and b!417853 res!243441) b!417864))

(assert (= (and b!417864 res!243431) b!417868))

(assert (= (and b!417868 res!243444) b!417867))

(assert (= (and b!417867 res!243443) b!417858))

(assert (= (and b!417858 res!243432) b!417862))

(assert (= (and b!417862 res!243435) b!417859))

(assert (= (and b!417859 c!55137) b!417869))

(assert (= (and b!417859 (not c!55137)) b!417855))

(assert (= (or b!417869 b!417855) bm!29056))

(assert (= (or b!417869 b!417855) bm!29055))

(assert (= (and b!417859 (not res!243442)) b!417866))

(assert (= (and b!417865 condMapEmpty!17796) mapIsEmpty!17796))

(assert (= (and b!417865 (not condMapEmpty!17796)) mapNonEmpty!17796))

(get-info :version)

(assert (= (and mapNonEmpty!17796 ((_ is ValueCellFull!5048) mapValue!17796)) b!417857))

(assert (= (and b!417865 ((_ is ValueCellFull!5048) mapDefault!17796)) b!417854))

(assert (= start!39350 b!417865))

(declare-fun b_lambda!8957 () Bool)

(assert (=> (not b_lambda!8957) (not b!417866)))

(declare-fun t!12280 () Bool)

(declare-fun tb!3245 () Bool)

(assert (=> (and start!39350 (= defaultEntry!557 defaultEntry!557) t!12280) tb!3245))

(declare-fun result!6025 () Bool)

(assert (=> tb!3245 (= result!6025 tp_is_empty!10783)))

(assert (=> b!417866 t!12280))

(declare-fun b_and!17153 () Bool)

(assert (= b_and!17151 (and (=> t!12280 result!6025) b_and!17153)))

(declare-fun m!407451 () Bool)

(assert (=> b!417862 m!407451))

(declare-fun m!407453 () Bool)

(assert (=> b!417862 m!407453))

(declare-fun m!407455 () Bool)

(assert (=> b!417862 m!407455))

(declare-fun m!407457 () Bool)

(assert (=> start!39350 m!407457))

(declare-fun m!407459 () Bool)

(assert (=> start!39350 m!407459))

(declare-fun m!407461 () Bool)

(assert (=> b!417853 m!407461))

(declare-fun m!407463 () Bool)

(assert (=> b!417867 m!407463))

(declare-fun m!407465 () Bool)

(assert (=> b!417859 m!407465))

(assert (=> b!417859 m!407465))

(declare-fun m!407467 () Bool)

(assert (=> b!417859 m!407467))

(declare-fun m!407469 () Bool)

(assert (=> b!417859 m!407469))

(declare-fun m!407471 () Bool)

(assert (=> bm!29056 m!407471))

(declare-fun m!407473 () Bool)

(assert (=> b!417856 m!407473))

(declare-fun m!407475 () Bool)

(assert (=> b!417870 m!407475))

(declare-fun m!407477 () Bool)

(assert (=> b!417863 m!407477))

(declare-fun m!407479 () Bool)

(assert (=> b!417868 m!407479))

(declare-fun m!407481 () Bool)

(assert (=> b!417868 m!407481))

(declare-fun m!407483 () Bool)

(assert (=> mapNonEmpty!17796 m!407483))

(declare-fun m!407485 () Bool)

(assert (=> b!417866 m!407485))

(assert (=> b!417866 m!407453))

(declare-fun m!407487 () Bool)

(assert (=> b!417866 m!407487))

(declare-fun m!407489 () Bool)

(assert (=> b!417866 m!407489))

(declare-fun m!407491 () Bool)

(assert (=> b!417866 m!407491))

(declare-fun m!407493 () Bool)

(assert (=> b!417866 m!407493))

(declare-fun m!407495 () Bool)

(assert (=> b!417866 m!407495))

(declare-fun m!407497 () Bool)

(assert (=> b!417866 m!407497))

(declare-fun m!407499 () Bool)

(assert (=> b!417866 m!407499))

(declare-fun m!407501 () Bool)

(assert (=> b!417866 m!407501))

(declare-fun m!407503 () Bool)

(assert (=> b!417866 m!407503))

(assert (=> b!417866 m!407499))

(declare-fun m!407505 () Bool)

(assert (=> b!417866 m!407505))

(assert (=> b!417866 m!407495))

(declare-fun m!407507 () Bool)

(assert (=> b!417866 m!407507))

(assert (=> b!417866 m!407487))

(declare-fun m!407509 () Bool)

(assert (=> b!417869 m!407509))

(declare-fun m!407511 () Bool)

(assert (=> b!417864 m!407511))

(declare-fun m!407513 () Bool)

(assert (=> b!417861 m!407513))

(declare-fun m!407515 () Bool)

(assert (=> bm!29055 m!407515))

(check-sat (not b!417861) (not b!417869) (not b!417863) (not b!417870) (not b!417856) (not start!39350) (not mapNonEmpty!17796) (not b!417864) (not b!417866) (not bm!29055) (not b!417859) tp_is_empty!10783 (not b_lambda!8957) (not b!417867) (not b!417862) (not b!417868) (not bm!29056) b_and!17153 (not b_next!9631))
(check-sat b_and!17153 (not b_next!9631))
