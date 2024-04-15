; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39944 () Bool)

(assert start!39944)

(declare-fun b_free!10225 () Bool)

(declare-fun b_next!10225 () Bool)

(assert (=> start!39944 (= b_free!10225 (not b_next!10225))))

(declare-fun tp!36203 () Bool)

(declare-fun b_and!18083 () Bool)

(assert (=> start!39944 (= tp!36203 b_and!18083)))

(declare-fun b!433905 () Bool)

(declare-fun res!255503 () Bool)

(declare-fun e!256462 () Bool)

(assert (=> b!433905 (=> (not res!255503) (not e!256462))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433905 (= res!255503 (bvsle from!863 i!563))))

(declare-fun b!433906 () Bool)

(declare-fun res!255512 () Bool)

(declare-fun e!256466 () Bool)

(assert (=> b!433906 (=> (not res!255512) (not e!256466))))

(declare-datatypes ((array!26577 0))(
  ( (array!26578 (arr!12738 (Array (_ BitVec 32) (_ BitVec 64))) (size!13091 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26577)

(declare-datatypes ((List!7579 0))(
  ( (Nil!7576) (Cons!7575 (h!8431 (_ BitVec 64)) (t!13244 List!7579)) )
))
(declare-fun arrayNoDuplicates!0 (array!26577 (_ BitVec 32) List!7579) Bool)

(assert (=> b!433906 (= res!255512 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7576))))

(declare-fun b!433907 () Bool)

(declare-fun res!255507 () Bool)

(assert (=> b!433907 (=> (not res!255507) (not e!256466))))

(assert (=> b!433907 (= res!255507 (or (= (select (arr!12738 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12738 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433908 () Bool)

(declare-fun res!255516 () Bool)

(assert (=> b!433908 (=> (not res!255516) (not e!256466))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26577 (_ BitVec 32)) Bool)

(assert (=> b!433908 (= res!255516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433909 () Bool)

(declare-fun e!256463 () Bool)

(assert (=> b!433909 (= e!256462 e!256463)))

(declare-fun res!255502 () Bool)

(assert (=> b!433909 (=> (not res!255502) (not e!256463))))

(assert (=> b!433909 (= res!255502 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16275 0))(
  ( (V!16276 (val!5733 Int)) )
))
(declare-fun minValue!515 () V!16275)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5345 0))(
  ( (ValueCellFull!5345 (v!7974 V!16275)) (EmptyCell!5345) )
))
(declare-datatypes ((array!26579 0))(
  ( (array!26580 (arr!12739 (Array (_ BitVec 32) ValueCell!5345)) (size!13092 (_ BitVec 32))) )
))
(declare-fun lt!199336 () array!26579)

(declare-fun lt!199340 () array!26577)

(declare-fun zeroValue!515 () V!16275)

(declare-datatypes ((tuple2!7588 0))(
  ( (tuple2!7589 (_1!3805 (_ BitVec 64)) (_2!3805 V!16275)) )
))
(declare-datatypes ((List!7580 0))(
  ( (Nil!7577) (Cons!7576 (h!8432 tuple2!7588) (t!13245 List!7580)) )
))
(declare-datatypes ((ListLongMap!6491 0))(
  ( (ListLongMap!6492 (toList!3261 List!7580)) )
))
(declare-fun lt!199343 () ListLongMap!6491)

(declare-fun getCurrentListMapNoExtraKeys!1464 (array!26577 array!26579 (_ BitVec 32) (_ BitVec 32) V!16275 V!16275 (_ BitVec 32) Int) ListLongMap!6491)

(assert (=> b!433909 (= lt!199343 (getCurrentListMapNoExtraKeys!1464 lt!199340 lt!199336 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26579)

(declare-fun v!412 () V!16275)

(assert (=> b!433909 (= lt!199336 (array!26580 (store (arr!12739 _values!549) i!563 (ValueCellFull!5345 v!412)) (size!13092 _values!549)))))

(declare-fun lt!199337 () ListLongMap!6491)

(assert (=> b!433909 (= lt!199337 (getCurrentListMapNoExtraKeys!1464 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433910 () Bool)

(declare-datatypes ((Unit!12829 0))(
  ( (Unit!12830) )
))
(declare-fun e!256465 () Unit!12829)

(declare-fun Unit!12831 () Unit!12829)

(assert (=> b!433910 (= e!256465 Unit!12831)))

(declare-fun mapIsEmpty!18687 () Bool)

(declare-fun mapRes!18687 () Bool)

(assert (=> mapIsEmpty!18687 mapRes!18687))

(declare-fun res!255508 () Bool)

(assert (=> start!39944 (=> (not res!255508) (not e!256466))))

(assert (=> start!39944 (= res!255508 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13091 _keys!709))))))

(assert (=> start!39944 e!256466))

(declare-fun tp_is_empty!11377 () Bool)

(assert (=> start!39944 tp_is_empty!11377))

(assert (=> start!39944 tp!36203))

(assert (=> start!39944 true))

(declare-fun e!256464 () Bool)

(declare-fun array_inv!9298 (array!26579) Bool)

(assert (=> start!39944 (and (array_inv!9298 _values!549) e!256464)))

(declare-fun array_inv!9299 (array!26577) Bool)

(assert (=> start!39944 (array_inv!9299 _keys!709)))

(declare-fun b!433911 () Bool)

(assert (=> b!433911 (= e!256466 e!256462)))

(declare-fun res!255504 () Bool)

(assert (=> b!433911 (=> (not res!255504) (not e!256462))))

(assert (=> b!433911 (= res!255504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199340 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!433911 (= lt!199340 (array!26578 (store (arr!12738 _keys!709) i!563 k0!794) (size!13091 _keys!709)))))

(declare-fun b!433912 () Bool)

(declare-fun e!256458 () Bool)

(assert (=> b!433912 (= e!256458 true)))

(declare-fun lt!199338 () ListLongMap!6491)

(declare-fun lt!199346 () ListLongMap!6491)

(declare-fun lt!199344 () tuple2!7588)

(declare-fun lt!199332 () tuple2!7588)

(declare-fun +!1436 (ListLongMap!6491 tuple2!7588) ListLongMap!6491)

(assert (=> b!433912 (= lt!199338 (+!1436 (+!1436 lt!199346 lt!199344) lt!199332))))

(declare-fun lt!199334 () V!16275)

(declare-fun lt!199339 () Unit!12829)

(declare-fun addCommutativeForDiffKeys!391 (ListLongMap!6491 (_ BitVec 64) V!16275 (_ BitVec 64) V!16275) Unit!12829)

(assert (=> b!433912 (= lt!199339 (addCommutativeForDiffKeys!391 lt!199346 k0!794 v!412 (select (arr!12738 _keys!709) from!863) lt!199334))))

(declare-fun b!433913 () Bool)

(declare-fun res!255506 () Bool)

(assert (=> b!433913 (=> (not res!255506) (not e!256466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433913 (= res!255506 (validKeyInArray!0 k0!794))))

(declare-fun b!433914 () Bool)

(declare-fun e!256460 () Bool)

(assert (=> b!433914 (= e!256460 tp_is_empty!11377)))

(declare-fun b!433915 () Bool)

(declare-fun e!256467 () Bool)

(assert (=> b!433915 (= e!256464 (and e!256467 mapRes!18687))))

(declare-fun condMapEmpty!18687 () Bool)

(declare-fun mapDefault!18687 () ValueCell!5345)

(assert (=> b!433915 (= condMapEmpty!18687 (= (arr!12739 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5345)) mapDefault!18687)))))

(declare-fun b!433916 () Bool)

(declare-fun res!255513 () Bool)

(assert (=> b!433916 (=> (not res!255513) (not e!256466))))

(assert (=> b!433916 (= res!255513 (and (= (size!13092 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13091 _keys!709) (size!13092 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433917 () Bool)

(assert (=> b!433917 (= e!256467 tp_is_empty!11377)))

(declare-fun b!433918 () Bool)

(declare-fun e!256461 () Bool)

(assert (=> b!433918 (= e!256463 (not e!256461))))

(declare-fun res!255510 () Bool)

(assert (=> b!433918 (=> res!255510 e!256461)))

(assert (=> b!433918 (= res!255510 (not (validKeyInArray!0 (select (arr!12738 _keys!709) from!863))))))

(declare-fun lt!199342 () ListLongMap!6491)

(declare-fun lt!199335 () ListLongMap!6491)

(assert (=> b!433918 (= lt!199342 lt!199335)))

(assert (=> b!433918 (= lt!199335 (+!1436 lt!199346 lt!199332))))

(assert (=> b!433918 (= lt!199342 (getCurrentListMapNoExtraKeys!1464 lt!199340 lt!199336 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433918 (= lt!199332 (tuple2!7589 k0!794 v!412))))

(assert (=> b!433918 (= lt!199346 (getCurrentListMapNoExtraKeys!1464 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199333 () Unit!12829)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!585 (array!26577 array!26579 (_ BitVec 32) (_ BitVec 32) V!16275 V!16275 (_ BitVec 32) (_ BitVec 64) V!16275 (_ BitVec 32) Int) Unit!12829)

(assert (=> b!433918 (= lt!199333 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!585 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433919 () Bool)

(declare-fun res!255515 () Bool)

(assert (=> b!433919 (=> (not res!255515) (not e!256466))))

(assert (=> b!433919 (= res!255515 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13091 _keys!709))))))

(declare-fun mapNonEmpty!18687 () Bool)

(declare-fun tp!36204 () Bool)

(assert (=> mapNonEmpty!18687 (= mapRes!18687 (and tp!36204 e!256460))))

(declare-fun mapValue!18687 () ValueCell!5345)

(declare-fun mapKey!18687 () (_ BitVec 32))

(declare-fun mapRest!18687 () (Array (_ BitVec 32) ValueCell!5345))

(assert (=> mapNonEmpty!18687 (= (arr!12739 _values!549) (store mapRest!18687 mapKey!18687 mapValue!18687))))

(declare-fun b!433920 () Bool)

(declare-fun res!255509 () Bool)

(assert (=> b!433920 (=> (not res!255509) (not e!256466))))

(declare-fun arrayContainsKey!0 (array!26577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433920 (= res!255509 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433921 () Bool)

(declare-fun res!255511 () Bool)

(assert (=> b!433921 (=> (not res!255511) (not e!256466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433921 (= res!255511 (validMask!0 mask!1025))))

(declare-fun b!433922 () Bool)

(declare-fun Unit!12832 () Unit!12829)

(assert (=> b!433922 (= e!256465 Unit!12832)))

(declare-fun lt!199341 () Unit!12829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26577 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12829)

(assert (=> b!433922 (= lt!199341 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433922 false))

(declare-fun b!433923 () Bool)

(declare-fun res!255514 () Bool)

(assert (=> b!433923 (=> (not res!255514) (not e!256462))))

(assert (=> b!433923 (= res!255514 (arrayNoDuplicates!0 lt!199340 #b00000000000000000000000000000000 Nil!7576))))

(declare-fun b!433924 () Bool)

(assert (=> b!433924 (= e!256461 e!256458)))

(declare-fun res!255505 () Bool)

(assert (=> b!433924 (=> res!255505 e!256458)))

(assert (=> b!433924 (= res!255505 (= k0!794 (select (arr!12738 _keys!709) from!863)))))

(assert (=> b!433924 (not (= (select (arr!12738 _keys!709) from!863) k0!794))))

(declare-fun lt!199345 () Unit!12829)

(assert (=> b!433924 (= lt!199345 e!256465)))

(declare-fun c!55602 () Bool)

(assert (=> b!433924 (= c!55602 (= (select (arr!12738 _keys!709) from!863) k0!794))))

(assert (=> b!433924 (= lt!199343 lt!199338)))

(assert (=> b!433924 (= lt!199338 (+!1436 lt!199335 lt!199344))))

(assert (=> b!433924 (= lt!199344 (tuple2!7589 (select (arr!12738 _keys!709) from!863) lt!199334))))

(declare-fun get!6341 (ValueCell!5345 V!16275) V!16275)

(declare-fun dynLambda!815 (Int (_ BitVec 64)) V!16275)

(assert (=> b!433924 (= lt!199334 (get!6341 (select (arr!12739 _values!549) from!863) (dynLambda!815 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39944 res!255508) b!433921))

(assert (= (and b!433921 res!255511) b!433916))

(assert (= (and b!433916 res!255513) b!433908))

(assert (= (and b!433908 res!255516) b!433906))

(assert (= (and b!433906 res!255512) b!433919))

(assert (= (and b!433919 res!255515) b!433913))

(assert (= (and b!433913 res!255506) b!433907))

(assert (= (and b!433907 res!255507) b!433920))

(assert (= (and b!433920 res!255509) b!433911))

(assert (= (and b!433911 res!255504) b!433923))

(assert (= (and b!433923 res!255514) b!433905))

(assert (= (and b!433905 res!255503) b!433909))

(assert (= (and b!433909 res!255502) b!433918))

(assert (= (and b!433918 (not res!255510)) b!433924))

(assert (= (and b!433924 c!55602) b!433922))

(assert (= (and b!433924 (not c!55602)) b!433910))

(assert (= (and b!433924 (not res!255505)) b!433912))

(assert (= (and b!433915 condMapEmpty!18687) mapIsEmpty!18687))

(assert (= (and b!433915 (not condMapEmpty!18687)) mapNonEmpty!18687))

(get-info :version)

(assert (= (and mapNonEmpty!18687 ((_ is ValueCellFull!5345) mapValue!18687)) b!433914))

(assert (= (and b!433915 ((_ is ValueCellFull!5345) mapDefault!18687)) b!433917))

(assert (= start!39944 b!433915))

(declare-fun b_lambda!9295 () Bool)

(assert (=> (not b_lambda!9295) (not b!433924)))

(declare-fun t!13243 () Bool)

(declare-fun tb!3623 () Bool)

(assert (=> (and start!39944 (= defaultEntry!557 defaultEntry!557) t!13243) tb!3623))

(declare-fun result!6781 () Bool)

(assert (=> tb!3623 (= result!6781 tp_is_empty!11377)))

(assert (=> b!433924 t!13243))

(declare-fun b_and!18085 () Bool)

(assert (= b_and!18083 (and (=> t!13243 result!6781) b_and!18085)))

(declare-fun m!421413 () Bool)

(assert (=> b!433911 m!421413))

(declare-fun m!421415 () Bool)

(assert (=> b!433911 m!421415))

(declare-fun m!421417 () Bool)

(assert (=> b!433920 m!421417))

(declare-fun m!421419 () Bool)

(assert (=> b!433906 m!421419))

(declare-fun m!421421 () Bool)

(assert (=> start!39944 m!421421))

(declare-fun m!421423 () Bool)

(assert (=> start!39944 m!421423))

(declare-fun m!421425 () Bool)

(assert (=> b!433921 m!421425))

(declare-fun m!421427 () Bool)

(assert (=> b!433918 m!421427))

(declare-fun m!421429 () Bool)

(assert (=> b!433918 m!421429))

(declare-fun m!421431 () Bool)

(assert (=> b!433918 m!421431))

(declare-fun m!421433 () Bool)

(assert (=> b!433918 m!421433))

(assert (=> b!433918 m!421427))

(declare-fun m!421435 () Bool)

(assert (=> b!433918 m!421435))

(declare-fun m!421437 () Bool)

(assert (=> b!433918 m!421437))

(declare-fun m!421439 () Bool)

(assert (=> b!433922 m!421439))

(declare-fun m!421441 () Bool)

(assert (=> mapNonEmpty!18687 m!421441))

(declare-fun m!421443 () Bool)

(assert (=> b!433907 m!421443))

(declare-fun m!421445 () Bool)

(assert (=> b!433923 m!421445))

(declare-fun m!421447 () Bool)

(assert (=> b!433909 m!421447))

(declare-fun m!421449 () Bool)

(assert (=> b!433909 m!421449))

(declare-fun m!421451 () Bool)

(assert (=> b!433909 m!421451))

(declare-fun m!421453 () Bool)

(assert (=> b!433912 m!421453))

(assert (=> b!433912 m!421453))

(declare-fun m!421455 () Bool)

(assert (=> b!433912 m!421455))

(assert (=> b!433912 m!421427))

(assert (=> b!433912 m!421427))

(declare-fun m!421457 () Bool)

(assert (=> b!433912 m!421457))

(assert (=> b!433924 m!421427))

(declare-fun m!421459 () Bool)

(assert (=> b!433924 m!421459))

(declare-fun m!421461 () Bool)

(assert (=> b!433924 m!421461))

(declare-fun m!421463 () Bool)

(assert (=> b!433924 m!421463))

(assert (=> b!433924 m!421463))

(assert (=> b!433924 m!421461))

(declare-fun m!421465 () Bool)

(assert (=> b!433924 m!421465))

(declare-fun m!421467 () Bool)

(assert (=> b!433908 m!421467))

(declare-fun m!421469 () Bool)

(assert (=> b!433913 m!421469))

(check-sat (not b!433923) (not b!433912) (not start!39944) (not mapNonEmpty!18687) (not b_next!10225) (not b!433906) (not b!433924) (not b!433913) (not b!433909) tp_is_empty!11377 (not b!433920) (not b_lambda!9295) (not b!433918) (not b!433911) (not b!433908) b_and!18085 (not b!433922) (not b!433921))
(check-sat b_and!18085 (not b_next!10225))
