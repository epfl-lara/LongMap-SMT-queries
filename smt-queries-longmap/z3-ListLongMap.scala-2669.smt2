; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39834 () Bool)

(assert start!39834)

(declare-fun b_free!10101 () Bool)

(declare-fun b_next!10101 () Bool)

(assert (=> start!39834 (= b_free!10101 (not b_next!10101))))

(declare-fun tp!35832 () Bool)

(declare-fun b_and!17861 () Bool)

(assert (=> start!39834 (= tp!35832 b_and!17861)))

(declare-fun b!430332 () Bool)

(declare-fun res!252851 () Bool)

(declare-fun e!254781 () Bool)

(assert (=> b!430332 (=> (not res!252851) (not e!254781))))

(declare-datatypes ((array!26341 0))(
  ( (array!26342 (arr!12620 (Array (_ BitVec 32) (_ BitVec 64))) (size!12972 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26341)

(declare-datatypes ((V!16109 0))(
  ( (V!16110 (val!5671 Int)) )
))
(declare-datatypes ((ValueCell!5283 0))(
  ( (ValueCellFull!5283 (v!7918 V!16109)) (EmptyCell!5283) )
))
(declare-datatypes ((array!26343 0))(
  ( (array!26344 (arr!12621 (Array (_ BitVec 32) ValueCell!5283)) (size!12973 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26343)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!430332 (= res!252851 (and (= (size!12973 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12972 _keys!709) (size!12973 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430333 () Bool)

(declare-fun res!252852 () Bool)

(assert (=> b!430333 (=> (not res!252852) (not e!254781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26341 (_ BitVec 32)) Bool)

(assert (=> b!430333 (= res!252852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430334 () Bool)

(declare-fun res!252846 () Bool)

(assert (=> b!430334 (=> (not res!252846) (not e!254781))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430334 (= res!252846 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430335 () Bool)

(declare-fun e!254778 () Bool)

(declare-fun e!254777 () Bool)

(assert (=> b!430335 (= e!254778 e!254777)))

(declare-fun res!252847 () Bool)

(assert (=> b!430335 (=> (not res!252847) (not e!254777))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430335 (= res!252847 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((tuple2!7468 0))(
  ( (tuple2!7469 (_1!3745 (_ BitVec 64)) (_2!3745 V!16109)) )
))
(declare-datatypes ((List!7487 0))(
  ( (Nil!7484) (Cons!7483 (h!8339 tuple2!7468) (t!13037 List!7487)) )
))
(declare-datatypes ((ListLongMap!6381 0))(
  ( (ListLongMap!6382 (toList!3206 List!7487)) )
))
(declare-fun lt!196778 () ListLongMap!6381)

(declare-fun minValue!515 () V!16109)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!196790 () array!26341)

(declare-fun zeroValue!515 () V!16109)

(declare-fun lt!196781 () array!26343)

(declare-fun getCurrentListMapNoExtraKeys!1408 (array!26341 array!26343 (_ BitVec 32) (_ BitVec 32) V!16109 V!16109 (_ BitVec 32) Int) ListLongMap!6381)

(assert (=> b!430335 (= lt!196778 (getCurrentListMapNoExtraKeys!1408 lt!196790 lt!196781 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16109)

(assert (=> b!430335 (= lt!196781 (array!26344 (store (arr!12621 _values!549) i!563 (ValueCellFull!5283 v!412)) (size!12973 _values!549)))))

(declare-fun lt!196783 () ListLongMap!6381)

(assert (=> b!430335 (= lt!196783 (getCurrentListMapNoExtraKeys!1408 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430336 () Bool)

(declare-fun res!252854 () Bool)

(assert (=> b!430336 (=> (not res!252854) (not e!254781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430336 (= res!252854 (validKeyInArray!0 k0!794))))

(declare-fun b!430337 () Bool)

(declare-fun e!254776 () Bool)

(declare-fun tp_is_empty!11253 () Bool)

(assert (=> b!430337 (= e!254776 tp_is_empty!11253)))

(declare-fun b!430338 () Bool)

(declare-fun e!254775 () Bool)

(assert (=> b!430338 (= e!254777 (not e!254775))))

(declare-fun res!252842 () Bool)

(assert (=> b!430338 (=> res!252842 e!254775)))

(assert (=> b!430338 (= res!252842 (not (validKeyInArray!0 (select (arr!12620 _keys!709) from!863))))))

(declare-fun lt!196777 () ListLongMap!6381)

(declare-fun lt!196779 () ListLongMap!6381)

(assert (=> b!430338 (= lt!196777 lt!196779)))

(declare-fun lt!196788 () ListLongMap!6381)

(declare-fun lt!196776 () tuple2!7468)

(declare-fun +!1355 (ListLongMap!6381 tuple2!7468) ListLongMap!6381)

(assert (=> b!430338 (= lt!196779 (+!1355 lt!196788 lt!196776))))

(assert (=> b!430338 (= lt!196777 (getCurrentListMapNoExtraKeys!1408 lt!196790 lt!196781 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430338 (= lt!196776 (tuple2!7469 k0!794 v!412))))

(assert (=> b!430338 (= lt!196788 (getCurrentListMapNoExtraKeys!1408 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12662 0))(
  ( (Unit!12663) )
))
(declare-fun lt!196780 () Unit!12662)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!544 (array!26341 array!26343 (_ BitVec 32) (_ BitVec 32) V!16109 V!16109 (_ BitVec 32) (_ BitVec 64) V!16109 (_ BitVec 32) Int) Unit!12662)

(assert (=> b!430338 (= lt!196780 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!544 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430339 () Bool)

(assert (=> b!430339 (= e!254781 e!254778)))

(declare-fun res!252853 () Bool)

(assert (=> b!430339 (=> (not res!252853) (not e!254778))))

(assert (=> b!430339 (= res!252853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196790 mask!1025))))

(assert (=> b!430339 (= lt!196790 (array!26342 (store (arr!12620 _keys!709) i!563 k0!794) (size!12972 _keys!709)))))

(declare-fun b!430340 () Bool)

(declare-fun e!254772 () Unit!12662)

(declare-fun Unit!12664 () Unit!12662)

(assert (=> b!430340 (= e!254772 Unit!12664)))

(declare-fun b!430341 () Bool)

(declare-fun e!254774 () Bool)

(assert (=> b!430341 (= e!254774 tp_is_empty!11253)))

(declare-fun b!430342 () Bool)

(declare-fun res!252844 () Bool)

(assert (=> b!430342 (=> (not res!252844) (not e!254778))))

(declare-datatypes ((List!7488 0))(
  ( (Nil!7485) (Cons!7484 (h!8340 (_ BitVec 64)) (t!13038 List!7488)) )
))
(declare-fun arrayNoDuplicates!0 (array!26341 (_ BitVec 32) List!7488) Bool)

(assert (=> b!430342 (= res!252844 (arrayNoDuplicates!0 lt!196790 #b00000000000000000000000000000000 Nil!7485))))

(declare-fun b!430344 () Bool)

(declare-fun res!252848 () Bool)

(assert (=> b!430344 (=> (not res!252848) (not e!254781))))

(assert (=> b!430344 (= res!252848 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7485))))

(declare-fun b!430345 () Bool)

(declare-fun res!252841 () Bool)

(assert (=> b!430345 (=> (not res!252841) (not e!254781))))

(assert (=> b!430345 (= res!252841 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12972 _keys!709))))))

(declare-fun b!430346 () Bool)

(declare-fun res!252850 () Bool)

(assert (=> b!430346 (=> (not res!252850) (not e!254778))))

(assert (=> b!430346 (= res!252850 (bvsle from!863 i!563))))

(declare-fun b!430347 () Bool)

(declare-fun e!254780 () Bool)

(assert (=> b!430347 (= e!254775 e!254780)))

(declare-fun res!252855 () Bool)

(assert (=> b!430347 (=> res!252855 e!254780)))

(assert (=> b!430347 (= res!252855 (= k0!794 (select (arr!12620 _keys!709) from!863)))))

(assert (=> b!430347 (not (= (select (arr!12620 _keys!709) from!863) k0!794))))

(declare-fun lt!196785 () Unit!12662)

(assert (=> b!430347 (= lt!196785 e!254772)))

(declare-fun c!55487 () Bool)

(assert (=> b!430347 (= c!55487 (= (select (arr!12620 _keys!709) from!863) k0!794))))

(declare-fun lt!196786 () ListLongMap!6381)

(assert (=> b!430347 (= lt!196778 lt!196786)))

(declare-fun lt!196782 () tuple2!7468)

(assert (=> b!430347 (= lt!196786 (+!1355 lt!196779 lt!196782))))

(declare-fun lt!196784 () V!16109)

(assert (=> b!430347 (= lt!196782 (tuple2!7469 (select (arr!12620 _keys!709) from!863) lt!196784))))

(declare-fun get!6262 (ValueCell!5283 V!16109) V!16109)

(declare-fun dynLambda!781 (Int (_ BitVec 64)) V!16109)

(assert (=> b!430347 (= lt!196784 (get!6262 (select (arr!12621 _values!549) from!863) (dynLambda!781 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430348 () Bool)

(declare-fun res!252849 () Bool)

(assert (=> b!430348 (=> (not res!252849) (not e!254781))))

(assert (=> b!430348 (= res!252849 (or (= (select (arr!12620 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12620 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18501 () Bool)

(declare-fun mapRes!18501 () Bool)

(declare-fun tp!35831 () Bool)

(assert (=> mapNonEmpty!18501 (= mapRes!18501 (and tp!35831 e!254776))))

(declare-fun mapKey!18501 () (_ BitVec 32))

(declare-fun mapRest!18501 () (Array (_ BitVec 32) ValueCell!5283))

(declare-fun mapValue!18501 () ValueCell!5283)

(assert (=> mapNonEmpty!18501 (= (arr!12621 _values!549) (store mapRest!18501 mapKey!18501 mapValue!18501))))

(declare-fun b!430349 () Bool)

(declare-fun Unit!12665 () Unit!12662)

(assert (=> b!430349 (= e!254772 Unit!12665)))

(declare-fun lt!196789 () Unit!12662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12662)

(assert (=> b!430349 (= lt!196789 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430349 false))

(declare-fun b!430350 () Bool)

(declare-fun res!252845 () Bool)

(assert (=> b!430350 (=> (not res!252845) (not e!254781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430350 (= res!252845 (validMask!0 mask!1025))))

(declare-fun res!252843 () Bool)

(assert (=> start!39834 (=> (not res!252843) (not e!254781))))

(assert (=> start!39834 (= res!252843 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12972 _keys!709))))))

(assert (=> start!39834 e!254781))

(assert (=> start!39834 tp_is_empty!11253))

(assert (=> start!39834 tp!35832))

(assert (=> start!39834 true))

(declare-fun e!254773 () Bool)

(declare-fun array_inv!9190 (array!26343) Bool)

(assert (=> start!39834 (and (array_inv!9190 _values!549) e!254773)))

(declare-fun array_inv!9191 (array!26341) Bool)

(assert (=> start!39834 (array_inv!9191 _keys!709)))

(declare-fun b!430343 () Bool)

(assert (=> b!430343 (= e!254773 (and e!254774 mapRes!18501))))

(declare-fun condMapEmpty!18501 () Bool)

(declare-fun mapDefault!18501 () ValueCell!5283)

(assert (=> b!430343 (= condMapEmpty!18501 (= (arr!12621 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5283)) mapDefault!18501)))))

(declare-fun b!430351 () Bool)

(assert (=> b!430351 (= e!254780 true)))

(assert (=> b!430351 (= lt!196786 (+!1355 (+!1355 lt!196788 lt!196782) lt!196776))))

(declare-fun lt!196787 () Unit!12662)

(declare-fun addCommutativeForDiffKeys!351 (ListLongMap!6381 (_ BitVec 64) V!16109 (_ BitVec 64) V!16109) Unit!12662)

(assert (=> b!430351 (= lt!196787 (addCommutativeForDiffKeys!351 lt!196788 k0!794 v!412 (select (arr!12620 _keys!709) from!863) lt!196784))))

(declare-fun mapIsEmpty!18501 () Bool)

(assert (=> mapIsEmpty!18501 mapRes!18501))

(assert (= (and start!39834 res!252843) b!430350))

(assert (= (and b!430350 res!252845) b!430332))

(assert (= (and b!430332 res!252851) b!430333))

(assert (= (and b!430333 res!252852) b!430344))

(assert (= (and b!430344 res!252848) b!430345))

(assert (= (and b!430345 res!252841) b!430336))

(assert (= (and b!430336 res!252854) b!430348))

(assert (= (and b!430348 res!252849) b!430334))

(assert (= (and b!430334 res!252846) b!430339))

(assert (= (and b!430339 res!252853) b!430342))

(assert (= (and b!430342 res!252844) b!430346))

(assert (= (and b!430346 res!252850) b!430335))

(assert (= (and b!430335 res!252847) b!430338))

(assert (= (and b!430338 (not res!252842)) b!430347))

(assert (= (and b!430347 c!55487) b!430349))

(assert (= (and b!430347 (not c!55487)) b!430340))

(assert (= (and b!430347 (not res!252855)) b!430351))

(assert (= (and b!430343 condMapEmpty!18501) mapIsEmpty!18501))

(assert (= (and b!430343 (not condMapEmpty!18501)) mapNonEmpty!18501))

(get-info :version)

(assert (= (and mapNonEmpty!18501 ((_ is ValueCellFull!5283) mapValue!18501)) b!430337))

(assert (= (and b!430343 ((_ is ValueCellFull!5283) mapDefault!18501)) b!430341))

(assert (= start!39834 b!430343))

(declare-fun b_lambda!9189 () Bool)

(assert (=> (not b_lambda!9189) (not b!430347)))

(declare-fun t!13036 () Bool)

(declare-fun tb!3507 () Bool)

(assert (=> (and start!39834 (= defaultEntry!557 defaultEntry!557) t!13036) tb!3507))

(declare-fun result!6541 () Bool)

(assert (=> tb!3507 (= result!6541 tp_is_empty!11253)))

(assert (=> b!430347 t!13036))

(declare-fun b_and!17863 () Bool)

(assert (= b_and!17861 (and (=> t!13036 result!6541) b_and!17863)))

(declare-fun m!418549 () Bool)

(assert (=> b!430350 m!418549))

(declare-fun m!418551 () Bool)

(assert (=> b!430335 m!418551))

(declare-fun m!418553 () Bool)

(assert (=> b!430335 m!418553))

(declare-fun m!418555 () Bool)

(assert (=> b!430335 m!418555))

(declare-fun m!418557 () Bool)

(assert (=> b!430338 m!418557))

(declare-fun m!418559 () Bool)

(assert (=> b!430338 m!418559))

(assert (=> b!430338 m!418557))

(declare-fun m!418561 () Bool)

(assert (=> b!430338 m!418561))

(declare-fun m!418563 () Bool)

(assert (=> b!430338 m!418563))

(declare-fun m!418565 () Bool)

(assert (=> b!430338 m!418565))

(declare-fun m!418567 () Bool)

(assert (=> b!430338 m!418567))

(declare-fun m!418569 () Bool)

(assert (=> mapNonEmpty!18501 m!418569))

(declare-fun m!418571 () Bool)

(assert (=> b!430334 m!418571))

(declare-fun m!418573 () Bool)

(assert (=> b!430333 m!418573))

(declare-fun m!418575 () Bool)

(assert (=> b!430336 m!418575))

(declare-fun m!418577 () Bool)

(assert (=> start!39834 m!418577))

(declare-fun m!418579 () Bool)

(assert (=> start!39834 m!418579))

(declare-fun m!418581 () Bool)

(assert (=> b!430342 m!418581))

(declare-fun m!418583 () Bool)

(assert (=> b!430344 m!418583))

(declare-fun m!418585 () Bool)

(assert (=> b!430349 m!418585))

(declare-fun m!418587 () Bool)

(assert (=> b!430339 m!418587))

(declare-fun m!418589 () Bool)

(assert (=> b!430339 m!418589))

(assert (=> b!430347 m!418557))

(declare-fun m!418591 () Bool)

(assert (=> b!430347 m!418591))

(declare-fun m!418593 () Bool)

(assert (=> b!430347 m!418593))

(declare-fun m!418595 () Bool)

(assert (=> b!430347 m!418595))

(assert (=> b!430347 m!418595))

(assert (=> b!430347 m!418593))

(declare-fun m!418597 () Bool)

(assert (=> b!430347 m!418597))

(declare-fun m!418599 () Bool)

(assert (=> b!430351 m!418599))

(assert (=> b!430351 m!418599))

(declare-fun m!418601 () Bool)

(assert (=> b!430351 m!418601))

(assert (=> b!430351 m!418557))

(assert (=> b!430351 m!418557))

(declare-fun m!418603 () Bool)

(assert (=> b!430351 m!418603))

(declare-fun m!418605 () Bool)

(assert (=> b!430348 m!418605))

(check-sat (not start!39834) (not b!430344) (not b!430339) (not b_lambda!9189) b_and!17863 (not b!430351) tp_is_empty!11253 (not b!430342) (not mapNonEmpty!18501) (not b_next!10101) (not b!430336) (not b!430349) (not b!430347) (not b!430335) (not b!430333) (not b!430350) (not b!430338) (not b!430334))
(check-sat b_and!17863 (not b_next!10101))
