; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39762 () Bool)

(assert start!39762)

(declare-fun b_free!10029 () Bool)

(declare-fun b_next!10029 () Bool)

(assert (=> start!39762 (= b_free!10029 (not b_next!10029))))

(declare-fun tp!35616 () Bool)

(declare-fun b_and!17717 () Bool)

(assert (=> start!39762 (= tp!35616 b_and!17717)))

(declare-fun b!428202 () Bool)

(declare-fun e!253797 () Bool)

(declare-fun e!253793 () Bool)

(declare-fun mapRes!18393 () Bool)

(assert (=> b!428202 (= e!253797 (and e!253793 mapRes!18393))))

(declare-fun condMapEmpty!18393 () Bool)

(declare-datatypes ((V!16013 0))(
  ( (V!16014 (val!5635 Int)) )
))
(declare-datatypes ((ValueCell!5247 0))(
  ( (ValueCellFull!5247 (v!7882 V!16013)) (EmptyCell!5247) )
))
(declare-datatypes ((array!26199 0))(
  ( (array!26200 (arr!12549 (Array (_ BitVec 32) ValueCell!5247)) (size!12901 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26199)

(declare-fun mapDefault!18393 () ValueCell!5247)

(assert (=> b!428202 (= condMapEmpty!18393 (= (arr!12549 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5247)) mapDefault!18393)))))

(declare-fun b!428203 () Bool)

(declare-fun res!251319 () Bool)

(declare-fun e!253792 () Bool)

(assert (=> b!428203 (=> (not res!251319) (not e!253792))))

(declare-datatypes ((array!26201 0))(
  ( (array!26202 (arr!12550 (Array (_ BitVec 32) (_ BitVec 64))) (size!12902 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26201)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428203 (= res!251319 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428204 () Bool)

(declare-fun tp_is_empty!11181 () Bool)

(assert (=> b!428204 (= e!253793 tp_is_empty!11181)))

(declare-fun res!251317 () Bool)

(assert (=> start!39762 (=> (not res!251317) (not e!253792))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39762 (= res!251317 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12902 _keys!709))))))

(assert (=> start!39762 e!253792))

(assert (=> start!39762 tp_is_empty!11181))

(assert (=> start!39762 tp!35616))

(assert (=> start!39762 true))

(declare-fun array_inv!9148 (array!26199) Bool)

(assert (=> start!39762 (and (array_inv!9148 _values!549) e!253797)))

(declare-fun array_inv!9149 (array!26201) Bool)

(assert (=> start!39762 (array_inv!9149 _keys!709)))

(declare-fun b!428205 () Bool)

(declare-fun res!251326 () Bool)

(assert (=> b!428205 (=> (not res!251326) (not e!253792))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26201 (_ BitVec 32)) Bool)

(assert (=> b!428205 (= res!251326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428206 () Bool)

(declare-fun res!251322 () Bool)

(assert (=> b!428206 (=> (not res!251322) (not e!253792))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428206 (= res!251322 (or (= (select (arr!12550 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12550 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428207 () Bool)

(declare-fun res!251318 () Bool)

(assert (=> b!428207 (=> (not res!251318) (not e!253792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428207 (= res!251318 (validMask!0 mask!1025))))

(declare-fun b!428208 () Bool)

(declare-fun res!251327 () Bool)

(assert (=> b!428208 (=> (not res!251327) (not e!253792))))

(declare-datatypes ((List!7427 0))(
  ( (Nil!7424) (Cons!7423 (h!8279 (_ BitVec 64)) (t!12905 List!7427)) )
))
(declare-fun arrayNoDuplicates!0 (array!26201 (_ BitVec 32) List!7427) Bool)

(assert (=> b!428208 (= res!251327 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7424))))

(declare-fun mapNonEmpty!18393 () Bool)

(declare-fun tp!35615 () Bool)

(declare-fun e!253794 () Bool)

(assert (=> mapNonEmpty!18393 (= mapRes!18393 (and tp!35615 e!253794))))

(declare-fun mapRest!18393 () (Array (_ BitVec 32) ValueCell!5247))

(declare-fun mapKey!18393 () (_ BitVec 32))

(declare-fun mapValue!18393 () ValueCell!5247)

(assert (=> mapNonEmpty!18393 (= (arr!12549 _values!549) (store mapRest!18393 mapKey!18393 mapValue!18393))))

(declare-fun b!428209 () Bool)

(declare-fun res!251316 () Bool)

(assert (=> b!428209 (=> (not res!251316) (not e!253792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428209 (= res!251316 (validKeyInArray!0 k0!794))))

(declare-fun b!428210 () Bool)

(declare-fun e!253791 () Bool)

(declare-fun e!253795 () Bool)

(assert (=> b!428210 (= e!253791 (not e!253795))))

(declare-fun res!251324 () Bool)

(assert (=> b!428210 (=> res!251324 e!253795)))

(assert (=> b!428210 (= res!251324 (not (validKeyInArray!0 (select (arr!12550 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7414 0))(
  ( (tuple2!7415 (_1!3718 (_ BitVec 64)) (_2!3718 V!16013)) )
))
(declare-datatypes ((List!7428 0))(
  ( (Nil!7425) (Cons!7424 (h!8280 tuple2!7414) (t!12906 List!7428)) )
))
(declare-datatypes ((ListLongMap!6327 0))(
  ( (ListLongMap!6328 (toList!3179 List!7428)) )
))
(declare-fun lt!195634 () ListLongMap!6327)

(declare-fun lt!195638 () ListLongMap!6327)

(assert (=> b!428210 (= lt!195634 lt!195638)))

(declare-fun lt!195641 () ListLongMap!6327)

(declare-fun v!412 () V!16013)

(declare-fun +!1333 (ListLongMap!6327 tuple2!7414) ListLongMap!6327)

(assert (=> b!428210 (= lt!195638 (+!1333 lt!195641 (tuple2!7415 k0!794 v!412)))))

(declare-fun lt!195637 () array!26199)

(declare-fun minValue!515 () V!16013)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16013)

(declare-fun lt!195640 () array!26201)

(declare-fun getCurrentListMapNoExtraKeys!1381 (array!26201 array!26199 (_ BitVec 32) (_ BitVec 32) V!16013 V!16013 (_ BitVec 32) Int) ListLongMap!6327)

(assert (=> b!428210 (= lt!195634 (getCurrentListMapNoExtraKeys!1381 lt!195640 lt!195637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428210 (= lt!195641 (getCurrentListMapNoExtraKeys!1381 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12562 0))(
  ( (Unit!12563) )
))
(declare-fun lt!195636 () Unit!12562)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!525 (array!26201 array!26199 (_ BitVec 32) (_ BitVec 32) V!16013 V!16013 (_ BitVec 32) (_ BitVec 64) V!16013 (_ BitVec 32) Int) Unit!12562)

(assert (=> b!428210 (= lt!195636 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!525 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428211 () Bool)

(declare-fun e!253790 () Bool)

(assert (=> b!428211 (= e!253790 e!253791)))

(declare-fun res!251321 () Bool)

(assert (=> b!428211 (=> (not res!251321) (not e!253791))))

(assert (=> b!428211 (= res!251321 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195639 () ListLongMap!6327)

(assert (=> b!428211 (= lt!195639 (getCurrentListMapNoExtraKeys!1381 lt!195640 lt!195637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428211 (= lt!195637 (array!26200 (store (arr!12549 _values!549) i!563 (ValueCellFull!5247 v!412)) (size!12901 _values!549)))))

(declare-fun lt!195635 () ListLongMap!6327)

(assert (=> b!428211 (= lt!195635 (getCurrentListMapNoExtraKeys!1381 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428212 () Bool)

(declare-fun res!251320 () Bool)

(assert (=> b!428212 (=> (not res!251320) (not e!253790))))

(assert (=> b!428212 (= res!251320 (arrayNoDuplicates!0 lt!195640 #b00000000000000000000000000000000 Nil!7424))))

(declare-fun mapIsEmpty!18393 () Bool)

(assert (=> mapIsEmpty!18393 mapRes!18393))

(declare-fun b!428213 () Bool)

(assert (=> b!428213 (= e!253795 true)))

(declare-fun get!6217 (ValueCell!5247 V!16013) V!16013)

(declare-fun dynLambda!760 (Int (_ BitVec 64)) V!16013)

(assert (=> b!428213 (= lt!195639 (+!1333 lt!195638 (tuple2!7415 (select (arr!12550 _keys!709) from!863) (get!6217 (select (arr!12549 _values!549) from!863) (dynLambda!760 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428214 () Bool)

(declare-fun res!251328 () Bool)

(assert (=> b!428214 (=> (not res!251328) (not e!253792))))

(assert (=> b!428214 (= res!251328 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12902 _keys!709))))))

(declare-fun b!428215 () Bool)

(declare-fun res!251315 () Bool)

(assert (=> b!428215 (=> (not res!251315) (not e!253792))))

(assert (=> b!428215 (= res!251315 (and (= (size!12901 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12902 _keys!709) (size!12901 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428216 () Bool)

(assert (=> b!428216 (= e!253794 tp_is_empty!11181)))

(declare-fun b!428217 () Bool)

(assert (=> b!428217 (= e!253792 e!253790)))

(declare-fun res!251325 () Bool)

(assert (=> b!428217 (=> (not res!251325) (not e!253790))))

(assert (=> b!428217 (= res!251325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195640 mask!1025))))

(assert (=> b!428217 (= lt!195640 (array!26202 (store (arr!12550 _keys!709) i!563 k0!794) (size!12902 _keys!709)))))

(declare-fun b!428218 () Bool)

(declare-fun res!251323 () Bool)

(assert (=> b!428218 (=> (not res!251323) (not e!253790))))

(assert (=> b!428218 (= res!251323 (bvsle from!863 i!563))))

(assert (= (and start!39762 res!251317) b!428207))

(assert (= (and b!428207 res!251318) b!428215))

(assert (= (and b!428215 res!251315) b!428205))

(assert (= (and b!428205 res!251326) b!428208))

(assert (= (and b!428208 res!251327) b!428214))

(assert (= (and b!428214 res!251328) b!428209))

(assert (= (and b!428209 res!251316) b!428206))

(assert (= (and b!428206 res!251322) b!428203))

(assert (= (and b!428203 res!251319) b!428217))

(assert (= (and b!428217 res!251325) b!428212))

(assert (= (and b!428212 res!251320) b!428218))

(assert (= (and b!428218 res!251323) b!428211))

(assert (= (and b!428211 res!251321) b!428210))

(assert (= (and b!428210 (not res!251324)) b!428213))

(assert (= (and b!428202 condMapEmpty!18393) mapIsEmpty!18393))

(assert (= (and b!428202 (not condMapEmpty!18393)) mapNonEmpty!18393))

(get-info :version)

(assert (= (and mapNonEmpty!18393 ((_ is ValueCellFull!5247) mapValue!18393)) b!428216))

(assert (= (and b!428202 ((_ is ValueCellFull!5247) mapDefault!18393)) b!428204))

(assert (= start!39762 b!428202))

(declare-fun b_lambda!9117 () Bool)

(assert (=> (not b_lambda!9117) (not b!428213)))

(declare-fun t!12904 () Bool)

(declare-fun tb!3435 () Bool)

(assert (=> (and start!39762 (= defaultEntry!557 defaultEntry!557) t!12904) tb!3435))

(declare-fun result!6397 () Bool)

(assert (=> tb!3435 (= result!6397 tp_is_empty!11181)))

(assert (=> b!428213 t!12904))

(declare-fun b_and!17719 () Bool)

(assert (= b_and!17717 (and (=> t!12904 result!6397) b_and!17719)))

(declare-fun m!416657 () Bool)

(assert (=> mapNonEmpty!18393 m!416657))

(declare-fun m!416659 () Bool)

(assert (=> b!428210 m!416659))

(declare-fun m!416661 () Bool)

(assert (=> b!428210 m!416661))

(declare-fun m!416663 () Bool)

(assert (=> b!428210 m!416663))

(declare-fun m!416665 () Bool)

(assert (=> b!428210 m!416665))

(assert (=> b!428210 m!416659))

(declare-fun m!416667 () Bool)

(assert (=> b!428210 m!416667))

(declare-fun m!416669 () Bool)

(assert (=> b!428210 m!416669))

(declare-fun m!416671 () Bool)

(assert (=> start!39762 m!416671))

(declare-fun m!416673 () Bool)

(assert (=> start!39762 m!416673))

(declare-fun m!416675 () Bool)

(assert (=> b!428207 m!416675))

(declare-fun m!416677 () Bool)

(assert (=> b!428209 m!416677))

(declare-fun m!416679 () Bool)

(assert (=> b!428211 m!416679))

(declare-fun m!416681 () Bool)

(assert (=> b!428211 m!416681))

(declare-fun m!416683 () Bool)

(assert (=> b!428211 m!416683))

(declare-fun m!416685 () Bool)

(assert (=> b!428208 m!416685))

(declare-fun m!416687 () Bool)

(assert (=> b!428206 m!416687))

(assert (=> b!428213 m!416659))

(declare-fun m!416689 () Bool)

(assert (=> b!428213 m!416689))

(assert (=> b!428213 m!416689))

(declare-fun m!416691 () Bool)

(assert (=> b!428213 m!416691))

(declare-fun m!416693 () Bool)

(assert (=> b!428213 m!416693))

(assert (=> b!428213 m!416691))

(declare-fun m!416695 () Bool)

(assert (=> b!428213 m!416695))

(declare-fun m!416697 () Bool)

(assert (=> b!428203 m!416697))

(declare-fun m!416699 () Bool)

(assert (=> b!428212 m!416699))

(declare-fun m!416701 () Bool)

(assert (=> b!428217 m!416701))

(declare-fun m!416703 () Bool)

(assert (=> b!428217 m!416703))

(declare-fun m!416705 () Bool)

(assert (=> b!428205 m!416705))

(check-sat (not b!428213) (not b_lambda!9117) tp_is_empty!11181 (not b!428207) (not mapNonEmpty!18393) (not b!428211) (not b_next!10029) (not b!428209) (not b!428217) (not b!428212) b_and!17719 (not b!428208) (not b!428205) (not start!39762) (not b!428210) (not b!428203))
(check-sat b_and!17719 (not b_next!10029))
