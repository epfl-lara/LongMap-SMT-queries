; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39842 () Bool)

(assert start!39842)

(declare-fun b_free!10123 () Bool)

(declare-fun b_next!10123 () Bool)

(assert (=> start!39842 (= b_free!10123 (not b_next!10123))))

(declare-fun tp!35898 () Bool)

(declare-fun b_and!17919 () Bool)

(assert (=> start!39842 (= tp!35898 b_and!17919)))

(declare-fun b!430965 () Bool)

(declare-fun res!253343 () Bool)

(declare-fun e!255076 () Bool)

(assert (=> b!430965 (=> (not res!253343) (not e!255076))))

(declare-datatypes ((array!26390 0))(
  ( (array!26391 (arr!12644 (Array (_ BitVec 32) (_ BitVec 64))) (size!12996 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26390)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26390 (_ BitVec 32)) Bool)

(assert (=> b!430965 (= res!253343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18534 () Bool)

(declare-fun mapRes!18534 () Bool)

(assert (=> mapIsEmpty!18534 mapRes!18534))

(declare-fun b!430966 () Bool)

(declare-fun res!253337 () Bool)

(assert (=> b!430966 (=> (not res!253337) (not e!255076))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16139 0))(
  ( (V!16140 (val!5682 Int)) )
))
(declare-datatypes ((ValueCell!5294 0))(
  ( (ValueCellFull!5294 (v!7930 V!16139)) (EmptyCell!5294) )
))
(declare-datatypes ((array!26392 0))(
  ( (array!26393 (arr!12645 (Array (_ BitVec 32) ValueCell!5294)) (size!12997 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26392)

(assert (=> b!430966 (= res!253337 (and (= (size!12997 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12996 _keys!709) (size!12997 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430967 () Bool)

(declare-fun e!255072 () Bool)

(assert (=> b!430967 (= e!255072 true)))

(declare-datatypes ((tuple2!7398 0))(
  ( (tuple2!7399 (_1!3710 (_ BitVec 64)) (_2!3710 V!16139)) )
))
(declare-datatypes ((List!7395 0))(
  ( (Nil!7392) (Cons!7391 (h!8247 tuple2!7398) (t!12959 List!7395)) )
))
(declare-datatypes ((ListLongMap!6313 0))(
  ( (ListLongMap!6314 (toList!3172 List!7395)) )
))
(declare-fun lt!197294 () ListLongMap!6313)

(declare-fun lt!197297 () tuple2!7398)

(declare-fun lt!197292 () tuple2!7398)

(declare-fun lt!197295 () ListLongMap!6313)

(declare-fun +!1381 (ListLongMap!6313 tuple2!7398) ListLongMap!6313)

(assert (=> b!430967 (= lt!197294 (+!1381 (+!1381 lt!197295 lt!197297) lt!197292))))

(declare-datatypes ((Unit!12702 0))(
  ( (Unit!12703) )
))
(declare-fun lt!197302 () Unit!12702)

(declare-fun v!412 () V!16139)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!197293 () V!16139)

(declare-fun addCommutativeForDiffKeys!361 (ListLongMap!6313 (_ BitVec 64) V!16139 (_ BitVec 64) V!16139) Unit!12702)

(assert (=> b!430967 (= lt!197302 (addCommutativeForDiffKeys!361 lt!197295 k0!794 v!412 (select (arr!12644 _keys!709) from!863) lt!197293))))

(declare-fun b!430968 () Bool)

(declare-fun res!253339 () Bool)

(assert (=> b!430968 (=> (not res!253339) (not e!255076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430968 (= res!253339 (validKeyInArray!0 k0!794))))

(declare-fun b!430969 () Bool)

(declare-fun e!255075 () Bool)

(declare-fun tp_is_empty!11275 () Bool)

(assert (=> b!430969 (= e!255075 tp_is_empty!11275)))

(declare-fun b!430970 () Bool)

(declare-fun res!253340 () Bool)

(declare-fun e!255078 () Bool)

(assert (=> b!430970 (=> (not res!253340) (not e!255078))))

(declare-fun lt!197303 () array!26390)

(declare-datatypes ((List!7396 0))(
  ( (Nil!7393) (Cons!7392 (h!8248 (_ BitVec 64)) (t!12960 List!7396)) )
))
(declare-fun arrayNoDuplicates!0 (array!26390 (_ BitVec 32) List!7396) Bool)

(assert (=> b!430970 (= res!253340 (arrayNoDuplicates!0 lt!197303 #b00000000000000000000000000000000 Nil!7393))))

(declare-fun b!430971 () Bool)

(declare-fun res!253333 () Bool)

(assert (=> b!430971 (=> (not res!253333) (not e!255076))))

(assert (=> b!430971 (= res!253333 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7393))))

(declare-fun b!430972 () Bool)

(declare-fun res!253345 () Bool)

(assert (=> b!430972 (=> (not res!253345) (not e!255076))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430972 (= res!253345 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12996 _keys!709))))))

(declare-fun b!430973 () Bool)

(declare-fun res!253334 () Bool)

(assert (=> b!430973 (=> (not res!253334) (not e!255078))))

(assert (=> b!430973 (= res!253334 (bvsle from!863 i!563))))

(declare-fun b!430974 () Bool)

(declare-fun e!255073 () Bool)

(assert (=> b!430974 (= e!255078 e!255073)))

(declare-fun res!253341 () Bool)

(assert (=> b!430974 (=> (not res!253341) (not e!255073))))

(assert (=> b!430974 (= res!253341 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16139)

(declare-fun lt!197304 () array!26392)

(declare-fun lt!197298 () ListLongMap!6313)

(declare-fun minValue!515 () V!16139)

(declare-fun getCurrentListMapNoExtraKeys!1415 (array!26390 array!26392 (_ BitVec 32) (_ BitVec 32) V!16139 V!16139 (_ BitVec 32) Int) ListLongMap!6313)

(assert (=> b!430974 (= lt!197298 (getCurrentListMapNoExtraKeys!1415 lt!197303 lt!197304 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430974 (= lt!197304 (array!26393 (store (arr!12645 _values!549) i!563 (ValueCellFull!5294 v!412)) (size!12997 _values!549)))))

(declare-fun lt!197290 () ListLongMap!6313)

(assert (=> b!430974 (= lt!197290 (getCurrentListMapNoExtraKeys!1415 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430975 () Bool)

(declare-fun res!253346 () Bool)

(assert (=> b!430975 (=> (not res!253346) (not e!255076))))

(assert (=> b!430975 (= res!253346 (or (= (select (arr!12644 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12644 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430976 () Bool)

(declare-fun e!255074 () Unit!12702)

(declare-fun Unit!12704 () Unit!12702)

(assert (=> b!430976 (= e!255074 Unit!12704)))

(declare-fun b!430977 () Bool)

(declare-fun e!255079 () Bool)

(assert (=> b!430977 (= e!255079 e!255072)))

(declare-fun res!253336 () Bool)

(assert (=> b!430977 (=> res!253336 e!255072)))

(assert (=> b!430977 (= res!253336 (= k0!794 (select (arr!12644 _keys!709) from!863)))))

(assert (=> b!430977 (not (= (select (arr!12644 _keys!709) from!863) k0!794))))

(declare-fun lt!197299 () Unit!12702)

(assert (=> b!430977 (= lt!197299 e!255074)))

(declare-fun c!55497 () Bool)

(assert (=> b!430977 (= c!55497 (= (select (arr!12644 _keys!709) from!863) k0!794))))

(assert (=> b!430977 (= lt!197298 lt!197294)))

(declare-fun lt!197291 () ListLongMap!6313)

(assert (=> b!430977 (= lt!197294 (+!1381 lt!197291 lt!197297))))

(assert (=> b!430977 (= lt!197297 (tuple2!7399 (select (arr!12644 _keys!709) from!863) lt!197293))))

(declare-fun get!6288 (ValueCell!5294 V!16139) V!16139)

(declare-fun dynLambda!793 (Int (_ BitVec 64)) V!16139)

(assert (=> b!430977 (= lt!197293 (get!6288 (select (arr!12645 _values!549) from!863) (dynLambda!793 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430978 () Bool)

(declare-fun res!253344 () Bool)

(assert (=> b!430978 (=> (not res!253344) (not e!255076))))

(declare-fun arrayContainsKey!0 (array!26390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430978 (= res!253344 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430979 () Bool)

(assert (=> b!430979 (= e!255076 e!255078)))

(declare-fun res!253335 () Bool)

(assert (=> b!430979 (=> (not res!253335) (not e!255078))))

(assert (=> b!430979 (= res!253335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197303 mask!1025))))

(assert (=> b!430979 (= lt!197303 (array!26391 (store (arr!12644 _keys!709) i!563 k0!794) (size!12996 _keys!709)))))

(declare-fun b!430980 () Bool)

(declare-fun Unit!12705 () Unit!12702)

(assert (=> b!430980 (= e!255074 Unit!12705)))

(declare-fun lt!197301 () Unit!12702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26390 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12702)

(assert (=> b!430980 (= lt!197301 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430980 false))

(declare-fun mapNonEmpty!18534 () Bool)

(declare-fun tp!35897 () Bool)

(assert (=> mapNonEmpty!18534 (= mapRes!18534 (and tp!35897 e!255075))))

(declare-fun mapKey!18534 () (_ BitVec 32))

(declare-fun mapValue!18534 () ValueCell!5294)

(declare-fun mapRest!18534 () (Array (_ BitVec 32) ValueCell!5294))

(assert (=> mapNonEmpty!18534 (= (arr!12645 _values!549) (store mapRest!18534 mapKey!18534 mapValue!18534))))

(declare-fun b!430981 () Bool)

(assert (=> b!430981 (= e!255073 (not e!255079))))

(declare-fun res!253347 () Bool)

(assert (=> b!430981 (=> res!253347 e!255079)))

(assert (=> b!430981 (= res!253347 (not (validKeyInArray!0 (select (arr!12644 _keys!709) from!863))))))

(declare-fun lt!197296 () ListLongMap!6313)

(assert (=> b!430981 (= lt!197296 lt!197291)))

(assert (=> b!430981 (= lt!197291 (+!1381 lt!197295 lt!197292))))

(assert (=> b!430981 (= lt!197296 (getCurrentListMapNoExtraKeys!1415 lt!197303 lt!197304 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430981 (= lt!197292 (tuple2!7399 k0!794 v!412))))

(assert (=> b!430981 (= lt!197295 (getCurrentListMapNoExtraKeys!1415 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197300 () Unit!12702)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!558 (array!26390 array!26392 (_ BitVec 32) (_ BitVec 32) V!16139 V!16139 (_ BitVec 32) (_ BitVec 64) V!16139 (_ BitVec 32) Int) Unit!12702)

(assert (=> b!430981 (= lt!197300 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!558 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!253342 () Bool)

(assert (=> start!39842 (=> (not res!253342) (not e!255076))))

(assert (=> start!39842 (= res!253342 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12996 _keys!709))))))

(assert (=> start!39842 e!255076))

(assert (=> start!39842 tp_is_empty!11275))

(assert (=> start!39842 tp!35898))

(assert (=> start!39842 true))

(declare-fun e!255077 () Bool)

(declare-fun array_inv!9268 (array!26392) Bool)

(assert (=> start!39842 (and (array_inv!9268 _values!549) e!255077)))

(declare-fun array_inv!9269 (array!26390) Bool)

(assert (=> start!39842 (array_inv!9269 _keys!709)))

(declare-fun b!430982 () Bool)

(declare-fun res!253338 () Bool)

(assert (=> b!430982 (=> (not res!253338) (not e!255076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430982 (= res!253338 (validMask!0 mask!1025))))

(declare-fun b!430983 () Bool)

(declare-fun e!255071 () Bool)

(assert (=> b!430983 (= e!255077 (and e!255071 mapRes!18534))))

(declare-fun condMapEmpty!18534 () Bool)

(declare-fun mapDefault!18534 () ValueCell!5294)

(assert (=> b!430983 (= condMapEmpty!18534 (= (arr!12645 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5294)) mapDefault!18534)))))

(declare-fun b!430984 () Bool)

(assert (=> b!430984 (= e!255071 tp_is_empty!11275)))

(assert (= (and start!39842 res!253342) b!430982))

(assert (= (and b!430982 res!253338) b!430966))

(assert (= (and b!430966 res!253337) b!430965))

(assert (= (and b!430965 res!253343) b!430971))

(assert (= (and b!430971 res!253333) b!430972))

(assert (= (and b!430972 res!253345) b!430968))

(assert (= (and b!430968 res!253339) b!430975))

(assert (= (and b!430975 res!253346) b!430978))

(assert (= (and b!430978 res!253344) b!430979))

(assert (= (and b!430979 res!253335) b!430970))

(assert (= (and b!430970 res!253340) b!430973))

(assert (= (and b!430973 res!253334) b!430974))

(assert (= (and b!430974 res!253341) b!430981))

(assert (= (and b!430981 (not res!253347)) b!430977))

(assert (= (and b!430977 c!55497) b!430980))

(assert (= (and b!430977 (not c!55497)) b!430976))

(assert (= (and b!430977 (not res!253336)) b!430967))

(assert (= (and b!430983 condMapEmpty!18534) mapIsEmpty!18534))

(assert (= (and b!430983 (not condMapEmpty!18534)) mapNonEmpty!18534))

(get-info :version)

(assert (= (and mapNonEmpty!18534 ((_ is ValueCellFull!5294) mapValue!18534)) b!430969))

(assert (= (and b!430983 ((_ is ValueCellFull!5294) mapDefault!18534)) b!430984))

(assert (= start!39842 b!430983))

(declare-fun b_lambda!9233 () Bool)

(assert (=> (not b_lambda!9233) (not b!430977)))

(declare-fun t!12958 () Bool)

(declare-fun tb!3521 () Bool)

(assert (=> (and start!39842 (= defaultEntry!557 defaultEntry!557) t!12958) tb!3521))

(declare-fun result!6577 () Bool)

(assert (=> tb!3521 (= result!6577 tp_is_empty!11275)))

(assert (=> b!430977 t!12958))

(declare-fun b_and!17921 () Bool)

(assert (= b_and!17919 (and (=> t!12958 result!6577) b_and!17921)))

(declare-fun m!419405 () Bool)

(assert (=> b!430982 m!419405))

(declare-fun m!419407 () Bool)

(assert (=> mapNonEmpty!18534 m!419407))

(declare-fun m!419409 () Bool)

(assert (=> b!430977 m!419409))

(declare-fun m!419411 () Bool)

(assert (=> b!430977 m!419411))

(declare-fun m!419413 () Bool)

(assert (=> b!430977 m!419413))

(declare-fun m!419415 () Bool)

(assert (=> b!430977 m!419415))

(assert (=> b!430977 m!419413))

(assert (=> b!430977 m!419411))

(declare-fun m!419417 () Bool)

(assert (=> b!430977 m!419417))

(declare-fun m!419419 () Bool)

(assert (=> b!430967 m!419419))

(assert (=> b!430967 m!419419))

(declare-fun m!419421 () Bool)

(assert (=> b!430967 m!419421))

(assert (=> b!430967 m!419409))

(assert (=> b!430967 m!419409))

(declare-fun m!419423 () Bool)

(assert (=> b!430967 m!419423))

(assert (=> b!430981 m!419409))

(declare-fun m!419425 () Bool)

(assert (=> b!430981 m!419425))

(declare-fun m!419427 () Bool)

(assert (=> b!430981 m!419427))

(declare-fun m!419429 () Bool)

(assert (=> b!430981 m!419429))

(assert (=> b!430981 m!419409))

(declare-fun m!419431 () Bool)

(assert (=> b!430981 m!419431))

(declare-fun m!419433 () Bool)

(assert (=> b!430981 m!419433))

(declare-fun m!419435 () Bool)

(assert (=> b!430980 m!419435))

(declare-fun m!419437 () Bool)

(assert (=> b!430970 m!419437))

(declare-fun m!419439 () Bool)

(assert (=> start!39842 m!419439))

(declare-fun m!419441 () Bool)

(assert (=> start!39842 m!419441))

(declare-fun m!419443 () Bool)

(assert (=> b!430965 m!419443))

(declare-fun m!419445 () Bool)

(assert (=> b!430974 m!419445))

(declare-fun m!419447 () Bool)

(assert (=> b!430974 m!419447))

(declare-fun m!419449 () Bool)

(assert (=> b!430974 m!419449))

(declare-fun m!419451 () Bool)

(assert (=> b!430975 m!419451))

(declare-fun m!419453 () Bool)

(assert (=> b!430968 m!419453))

(declare-fun m!419455 () Bool)

(assert (=> b!430979 m!419455))

(declare-fun m!419457 () Bool)

(assert (=> b!430979 m!419457))

(declare-fun m!419459 () Bool)

(assert (=> b!430978 m!419459))

(declare-fun m!419461 () Bool)

(assert (=> b!430971 m!419461))

(check-sat (not b!430967) (not b!430965) (not b!430968) (not b!430979) (not b!430977) (not b!430970) (not b!430978) b_and!17921 (not b!430982) (not mapNonEmpty!18534) (not b!430974) (not start!39842) (not b_next!10123) (not b!430981) tp_is_empty!11275 (not b!430971) (not b_lambda!9233) (not b!430980))
(check-sat b_and!17921 (not b_next!10123))
