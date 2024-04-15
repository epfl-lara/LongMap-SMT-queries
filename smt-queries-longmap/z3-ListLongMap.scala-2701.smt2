; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40010 () Bool)

(assert start!40010)

(declare-fun b_free!10291 () Bool)

(declare-fun b_next!10291 () Bool)

(assert (=> start!40010 (= b_free!10291 (not b_next!10291))))

(declare-fun tp!36401 () Bool)

(declare-fun b_and!18215 () Bool)

(assert (=> start!40010 (= tp!36401 b_and!18215)))

(declare-fun b!435951 () Bool)

(declare-fun e!257454 () Bool)

(declare-fun e!257455 () Bool)

(assert (=> b!435951 (= e!257454 e!257455)))

(declare-fun res!256998 () Bool)

(assert (=> b!435951 (=> (not res!256998) (not e!257455))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435951 (= res!256998 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16363 0))(
  ( (V!16364 (val!5766 Int)) )
))
(declare-fun minValue!515 () V!16363)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7652 0))(
  ( (tuple2!7653 (_1!3837 (_ BitVec 64)) (_2!3837 V!16363)) )
))
(declare-datatypes ((List!7639 0))(
  ( (Nil!7636) (Cons!7635 (h!8491 tuple2!7652) (t!13370 List!7639)) )
))
(declare-datatypes ((ListLongMap!6555 0))(
  ( (ListLongMap!6556 (toList!3293 List!7639)) )
))
(declare-fun lt!200824 () ListLongMap!6555)

(declare-fun zeroValue!515 () V!16363)

(declare-datatypes ((ValueCell!5378 0))(
  ( (ValueCellFull!5378 (v!8007 V!16363)) (EmptyCell!5378) )
))
(declare-datatypes ((array!26709 0))(
  ( (array!26710 (arr!12804 (Array (_ BitVec 32) ValueCell!5378)) (size!13157 (_ BitVec 32))) )
))
(declare-fun lt!200825 () array!26709)

(declare-datatypes ((array!26711 0))(
  ( (array!26712 (arr!12805 (Array (_ BitVec 32) (_ BitVec 64))) (size!13158 (_ BitVec 32))) )
))
(declare-fun lt!200820 () array!26711)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1492 (array!26711 array!26709 (_ BitVec 32) (_ BitVec 32) V!16363 V!16363 (_ BitVec 32) Int) ListLongMap!6555)

(assert (=> b!435951 (= lt!200824 (getCurrentListMapNoExtraKeys!1492 lt!200820 lt!200825 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26709)

(declare-fun v!412 () V!16363)

(assert (=> b!435951 (= lt!200825 (array!26710 (store (arr!12804 _values!549) i!563 (ValueCellFull!5378 v!412)) (size!13157 _values!549)))))

(declare-fun _keys!709 () array!26711)

(declare-fun lt!200826 () ListLongMap!6555)

(assert (=> b!435951 (= lt!200826 (getCurrentListMapNoExtraKeys!1492 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435952 () Bool)

(declare-fun e!257456 () Bool)

(declare-fun e!257450 () Bool)

(assert (=> b!435952 (= e!257456 e!257450)))

(declare-fun res!256993 () Bool)

(assert (=> b!435952 (=> res!256993 e!257450)))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!435952 (= res!256993 (= k0!794 (select (arr!12805 _keys!709) from!863)))))

(assert (=> b!435952 (not (= (select (arr!12805 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12941 0))(
  ( (Unit!12942) )
))
(declare-fun lt!200822 () Unit!12941)

(declare-fun e!257457 () Unit!12941)

(assert (=> b!435952 (= lt!200822 e!257457)))

(declare-fun c!55701 () Bool)

(assert (=> b!435952 (= c!55701 (= (select (arr!12805 _keys!709) from!863) k0!794))))

(declare-fun lt!200830 () ListLongMap!6555)

(assert (=> b!435952 (= lt!200824 lt!200830)))

(declare-fun lt!200821 () ListLongMap!6555)

(declare-fun lt!200819 () tuple2!7652)

(declare-fun +!1467 (ListLongMap!6555 tuple2!7652) ListLongMap!6555)

(assert (=> b!435952 (= lt!200830 (+!1467 lt!200821 lt!200819))))

(declare-fun lt!200829 () V!16363)

(assert (=> b!435952 (= lt!200819 (tuple2!7653 (select (arr!12805 _keys!709) from!863) lt!200829))))

(declare-fun get!6390 (ValueCell!5378 V!16363) V!16363)

(declare-fun dynLambda!842 (Int (_ BitVec 64)) V!16363)

(assert (=> b!435952 (= lt!200829 (get!6390 (select (arr!12804 _values!549) from!863) (dynLambda!842 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18786 () Bool)

(declare-fun mapRes!18786 () Bool)

(declare-fun tp!36402 () Bool)

(declare-fun e!257449 () Bool)

(assert (=> mapNonEmpty!18786 (= mapRes!18786 (and tp!36402 e!257449))))

(declare-fun mapValue!18786 () ValueCell!5378)

(declare-fun mapKey!18786 () (_ BitVec 32))

(declare-fun mapRest!18786 () (Array (_ BitVec 32) ValueCell!5378))

(assert (=> mapNonEmpty!18786 (= (arr!12804 _values!549) (store mapRest!18786 mapKey!18786 mapValue!18786))))

(declare-fun b!435953 () Bool)

(declare-fun e!257452 () Bool)

(assert (=> b!435953 (= e!257452 e!257454)))

(declare-fun res!256992 () Bool)

(assert (=> b!435953 (=> (not res!256992) (not e!257454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26711 (_ BitVec 32)) Bool)

(assert (=> b!435953 (= res!256992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200820 mask!1025))))

(assert (=> b!435953 (= lt!200820 (array!26712 (store (arr!12805 _keys!709) i!563 k0!794) (size!13158 _keys!709)))))

(declare-fun b!435954 () Bool)

(declare-fun tp_is_empty!11443 () Bool)

(assert (=> b!435954 (= e!257449 tp_is_empty!11443)))

(declare-fun b!435955 () Bool)

(declare-fun res!256996 () Bool)

(assert (=> b!435955 (=> (not res!256996) (not e!257452))))

(assert (=> b!435955 (= res!256996 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13158 _keys!709))))))

(declare-fun b!435956 () Bool)

(assert (=> b!435956 (= e!257450 true)))

(declare-fun lt!200823 () ListLongMap!6555)

(declare-fun lt!200828 () tuple2!7652)

(assert (=> b!435956 (= lt!200830 (+!1467 (+!1467 lt!200823 lt!200819) lt!200828))))

(declare-fun lt!200818 () Unit!12941)

(declare-fun addCommutativeForDiffKeys!417 (ListLongMap!6555 (_ BitVec 64) V!16363 (_ BitVec 64) V!16363) Unit!12941)

(assert (=> b!435956 (= lt!200818 (addCommutativeForDiffKeys!417 lt!200823 k0!794 v!412 (select (arr!12805 _keys!709) from!863) lt!200829))))

(declare-fun b!435957 () Bool)

(declare-fun res!256999 () Bool)

(assert (=> b!435957 (=> (not res!256999) (not e!257452))))

(declare-datatypes ((List!7640 0))(
  ( (Nil!7637) (Cons!7636 (h!8492 (_ BitVec 64)) (t!13371 List!7640)) )
))
(declare-fun arrayNoDuplicates!0 (array!26711 (_ BitVec 32) List!7640) Bool)

(assert (=> b!435957 (= res!256999 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7637))))

(declare-fun b!435958 () Bool)

(declare-fun res!256988 () Bool)

(assert (=> b!435958 (=> (not res!256988) (not e!257454))))

(assert (=> b!435958 (= res!256988 (arrayNoDuplicates!0 lt!200820 #b00000000000000000000000000000000 Nil!7637))))

(declare-fun b!435959 () Bool)

(assert (=> b!435959 (= e!257455 (not e!257456))))

(declare-fun res!256995 () Bool)

(assert (=> b!435959 (=> res!256995 e!257456)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435959 (= res!256995 (not (validKeyInArray!0 (select (arr!12805 _keys!709) from!863))))))

(declare-fun lt!200817 () ListLongMap!6555)

(assert (=> b!435959 (= lt!200817 lt!200821)))

(assert (=> b!435959 (= lt!200821 (+!1467 lt!200823 lt!200828))))

(assert (=> b!435959 (= lt!200817 (getCurrentListMapNoExtraKeys!1492 lt!200820 lt!200825 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435959 (= lt!200828 (tuple2!7653 k0!794 v!412))))

(assert (=> b!435959 (= lt!200823 (getCurrentListMapNoExtraKeys!1492 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200831 () Unit!12941)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!608 (array!26711 array!26709 (_ BitVec 32) (_ BitVec 32) V!16363 V!16363 (_ BitVec 32) (_ BitVec 64) V!16363 (_ BitVec 32) Int) Unit!12941)

(assert (=> b!435959 (= lt!200831 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!608 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435960 () Bool)

(declare-fun res!257000 () Bool)

(assert (=> b!435960 (=> (not res!257000) (not e!257452))))

(assert (=> b!435960 (= res!257000 (or (= (select (arr!12805 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12805 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!256987 () Bool)

(assert (=> start!40010 (=> (not res!256987) (not e!257452))))

(assert (=> start!40010 (= res!256987 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13158 _keys!709))))))

(assert (=> start!40010 e!257452))

(assert (=> start!40010 tp_is_empty!11443))

(assert (=> start!40010 tp!36401))

(assert (=> start!40010 true))

(declare-fun e!257451 () Bool)

(declare-fun array_inv!9352 (array!26709) Bool)

(assert (=> start!40010 (and (array_inv!9352 _values!549) e!257451)))

(declare-fun array_inv!9353 (array!26711) Bool)

(assert (=> start!40010 (array_inv!9353 _keys!709)))

(declare-fun b!435961 () Bool)

(declare-fun res!256989 () Bool)

(assert (=> b!435961 (=> (not res!256989) (not e!257452))))

(declare-fun arrayContainsKey!0 (array!26711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435961 (= res!256989 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435962 () Bool)

(declare-fun Unit!12943 () Unit!12941)

(assert (=> b!435962 (= e!257457 Unit!12943)))

(declare-fun b!435963 () Bool)

(declare-fun res!256997 () Bool)

(assert (=> b!435963 (=> (not res!256997) (not e!257454))))

(assert (=> b!435963 (= res!256997 (bvsle from!863 i!563))))

(declare-fun b!435964 () Bool)

(declare-fun Unit!12944 () Unit!12941)

(assert (=> b!435964 (= e!257457 Unit!12944)))

(declare-fun lt!200827 () Unit!12941)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26711 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12941)

(assert (=> b!435964 (= lt!200827 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435964 false))

(declare-fun mapIsEmpty!18786 () Bool)

(assert (=> mapIsEmpty!18786 mapRes!18786))

(declare-fun b!435965 () Bool)

(declare-fun res!256990 () Bool)

(assert (=> b!435965 (=> (not res!256990) (not e!257452))))

(assert (=> b!435965 (= res!256990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435966 () Bool)

(declare-fun e!257453 () Bool)

(assert (=> b!435966 (= e!257451 (and e!257453 mapRes!18786))))

(declare-fun condMapEmpty!18786 () Bool)

(declare-fun mapDefault!18786 () ValueCell!5378)

(assert (=> b!435966 (= condMapEmpty!18786 (= (arr!12804 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5378)) mapDefault!18786)))))

(declare-fun b!435967 () Bool)

(declare-fun res!257001 () Bool)

(assert (=> b!435967 (=> (not res!257001) (not e!257452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435967 (= res!257001 (validMask!0 mask!1025))))

(declare-fun b!435968 () Bool)

(declare-fun res!256991 () Bool)

(assert (=> b!435968 (=> (not res!256991) (not e!257452))))

(assert (=> b!435968 (= res!256991 (validKeyInArray!0 k0!794))))

(declare-fun b!435969 () Bool)

(assert (=> b!435969 (= e!257453 tp_is_empty!11443)))

(declare-fun b!435970 () Bool)

(declare-fun res!256994 () Bool)

(assert (=> b!435970 (=> (not res!256994) (not e!257452))))

(assert (=> b!435970 (= res!256994 (and (= (size!13157 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13158 _keys!709) (size!13157 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40010 res!256987) b!435967))

(assert (= (and b!435967 res!257001) b!435970))

(assert (= (and b!435970 res!256994) b!435965))

(assert (= (and b!435965 res!256990) b!435957))

(assert (= (and b!435957 res!256999) b!435955))

(assert (= (and b!435955 res!256996) b!435968))

(assert (= (and b!435968 res!256991) b!435960))

(assert (= (and b!435960 res!257000) b!435961))

(assert (= (and b!435961 res!256989) b!435953))

(assert (= (and b!435953 res!256992) b!435958))

(assert (= (and b!435958 res!256988) b!435963))

(assert (= (and b!435963 res!256997) b!435951))

(assert (= (and b!435951 res!256998) b!435959))

(assert (= (and b!435959 (not res!256995)) b!435952))

(assert (= (and b!435952 c!55701) b!435964))

(assert (= (and b!435952 (not c!55701)) b!435962))

(assert (= (and b!435952 (not res!256993)) b!435956))

(assert (= (and b!435966 condMapEmpty!18786) mapIsEmpty!18786))

(assert (= (and b!435966 (not condMapEmpty!18786)) mapNonEmpty!18786))

(get-info :version)

(assert (= (and mapNonEmpty!18786 ((_ is ValueCellFull!5378) mapValue!18786)) b!435954))

(assert (= (and b!435966 ((_ is ValueCellFull!5378) mapDefault!18786)) b!435969))

(assert (= start!40010 b!435966))

(declare-fun b_lambda!9361 () Bool)

(assert (=> (not b_lambda!9361) (not b!435952)))

(declare-fun t!13369 () Bool)

(declare-fun tb!3689 () Bool)

(assert (=> (and start!40010 (= defaultEntry!557 defaultEntry!557) t!13369) tb!3689))

(declare-fun result!6913 () Bool)

(assert (=> tb!3689 (= result!6913 tp_is_empty!11443)))

(assert (=> b!435952 t!13369))

(declare-fun b_and!18217 () Bool)

(assert (= b_and!18215 (and (=> t!13369 result!6913) b_and!18217)))

(declare-fun m!423327 () Bool)

(assert (=> b!435956 m!423327))

(assert (=> b!435956 m!423327))

(declare-fun m!423329 () Bool)

(assert (=> b!435956 m!423329))

(declare-fun m!423331 () Bool)

(assert (=> b!435956 m!423331))

(assert (=> b!435956 m!423331))

(declare-fun m!423333 () Bool)

(assert (=> b!435956 m!423333))

(declare-fun m!423335 () Bool)

(assert (=> b!435961 m!423335))

(declare-fun m!423337 () Bool)

(assert (=> b!435967 m!423337))

(declare-fun m!423339 () Bool)

(assert (=> b!435965 m!423339))

(assert (=> b!435952 m!423331))

(declare-fun m!423341 () Bool)

(assert (=> b!435952 m!423341))

(declare-fun m!423343 () Bool)

(assert (=> b!435952 m!423343))

(declare-fun m!423345 () Bool)

(assert (=> b!435952 m!423345))

(assert (=> b!435952 m!423345))

(assert (=> b!435952 m!423341))

(declare-fun m!423347 () Bool)

(assert (=> b!435952 m!423347))

(declare-fun m!423349 () Bool)

(assert (=> b!435957 m!423349))

(declare-fun m!423351 () Bool)

(assert (=> b!435953 m!423351))

(declare-fun m!423353 () Bool)

(assert (=> b!435953 m!423353))

(declare-fun m!423355 () Bool)

(assert (=> b!435964 m!423355))

(declare-fun m!423357 () Bool)

(assert (=> b!435958 m!423357))

(declare-fun m!423359 () Bool)

(assert (=> start!40010 m!423359))

(declare-fun m!423361 () Bool)

(assert (=> start!40010 m!423361))

(declare-fun m!423363 () Bool)

(assert (=> b!435951 m!423363))

(declare-fun m!423365 () Bool)

(assert (=> b!435951 m!423365))

(declare-fun m!423367 () Bool)

(assert (=> b!435951 m!423367))

(declare-fun m!423369 () Bool)

(assert (=> b!435968 m!423369))

(assert (=> b!435959 m!423331))

(declare-fun m!423371 () Bool)

(assert (=> b!435959 m!423371))

(declare-fun m!423373 () Bool)

(assert (=> b!435959 m!423373))

(assert (=> b!435959 m!423331))

(declare-fun m!423375 () Bool)

(assert (=> b!435959 m!423375))

(declare-fun m!423377 () Bool)

(assert (=> b!435959 m!423377))

(declare-fun m!423379 () Bool)

(assert (=> b!435959 m!423379))

(declare-fun m!423381 () Bool)

(assert (=> mapNonEmpty!18786 m!423381))

(declare-fun m!423383 () Bool)

(assert (=> b!435960 m!423383))

(check-sat (not mapNonEmpty!18786) (not b!435956) (not b!435965) (not b!435968) (not b!435951) (not b!435958) tp_is_empty!11443 (not b_next!10291) (not b!435961) (not b!435959) (not b_lambda!9361) (not b!435952) (not start!40010) (not b!435957) (not b!435964) b_and!18217 (not b!435967) (not b!435953))
(check-sat b_and!18217 (not b_next!10291))
