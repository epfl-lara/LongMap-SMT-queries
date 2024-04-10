; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39468 () Bool)

(assert start!39468)

(declare-fun b_free!9735 () Bool)

(declare-fun b_next!9735 () Bool)

(assert (=> start!39468 (= b_free!9735 (not b_next!9735))))

(declare-fun tp!34733 () Bool)

(declare-fun b_and!17345 () Bool)

(assert (=> start!39468 (= tp!34733 b_and!17345)))

(declare-fun b!420970 () Bool)

(declare-fun res!245628 () Bool)

(declare-fun e!250673 () Bool)

(assert (=> b!420970 (=> (not res!245628) (not e!250673))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!420970 (= res!245628 (validKeyInArray!0 k0!794))))

(declare-fun b!420971 () Bool)

(declare-fun res!245631 () Bool)

(declare-fun e!250675 () Bool)

(assert (=> b!420971 (=> (not res!245631) (not e!250675))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!420971 (= res!245631 (bvsle from!863 i!563))))

(declare-fun b!420972 () Bool)

(declare-fun res!245624 () Bool)

(assert (=> b!420972 (=> (not res!245624) (not e!250673))))

(declare-datatypes ((array!25623 0))(
  ( (array!25624 (arr!12261 (Array (_ BitVec 32) (_ BitVec 64))) (size!12613 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25623)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15621 0))(
  ( (V!15622 (val!5488 Int)) )
))
(declare-datatypes ((ValueCell!5100 0))(
  ( (ValueCellFull!5100 (v!7735 V!15621)) (EmptyCell!5100) )
))
(declare-datatypes ((array!25625 0))(
  ( (array!25626 (arr!12262 (Array (_ BitVec 32) ValueCell!5100)) (size!12614 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25625)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!420972 (= res!245624 (and (= (size!12614 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12613 _keys!709) (size!12614 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!420973 () Bool)

(declare-fun e!250678 () Bool)

(assert (=> b!420973 (= e!250678 true)))

(declare-fun lt!193202 () V!15621)

(declare-datatypes ((tuple2!7196 0))(
  ( (tuple2!7197 (_1!3609 (_ BitVec 64)) (_2!3609 V!15621)) )
))
(declare-datatypes ((List!7203 0))(
  ( (Nil!7200) (Cons!7199 (h!8055 tuple2!7196) (t!12603 List!7203)) )
))
(declare-datatypes ((ListLongMap!6109 0))(
  ( (ListLongMap!6110 (toList!3070 List!7203)) )
))
(declare-fun lt!193205 () ListLongMap!6109)

(declare-fun lt!193208 () tuple2!7196)

(declare-fun +!1266 (ListLongMap!6109 tuple2!7196) ListLongMap!6109)

(assert (=> b!420973 (= (+!1266 lt!193205 lt!193208) (+!1266 (+!1266 lt!193205 (tuple2!7197 k0!794 lt!193202)) lt!193208))))

(declare-fun lt!193209 () V!15621)

(assert (=> b!420973 (= lt!193208 (tuple2!7197 k0!794 lt!193209))))

(declare-datatypes ((Unit!12434 0))(
  ( (Unit!12435) )
))
(declare-fun lt!193204 () Unit!12434)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!61 (ListLongMap!6109 (_ BitVec 64) V!15621 V!15621) Unit!12434)

(assert (=> b!420973 (= lt!193204 (addSameAsAddTwiceSameKeyDiffValues!61 lt!193205 k0!794 lt!193202 lt!193209))))

(declare-fun lt!193207 () V!15621)

(declare-fun get!6091 (ValueCell!5100 V!15621) V!15621)

(assert (=> b!420973 (= lt!193202 (get!6091 (select (arr!12262 _values!549) from!863) lt!193207))))

(declare-fun lt!193206 () ListLongMap!6109)

(declare-fun lt!193210 () array!25623)

(assert (=> b!420973 (= lt!193206 (+!1266 lt!193205 (tuple2!7197 (select (arr!12261 lt!193210) from!863) lt!193209)))))

(declare-fun v!412 () V!15621)

(assert (=> b!420973 (= lt!193209 (get!6091 (select (store (arr!12262 _values!549) i!563 (ValueCellFull!5100 v!412)) from!863) lt!193207))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!732 (Int (_ BitVec 64)) V!15621)

(assert (=> b!420973 (= lt!193207 (dynLambda!732 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15621)

(declare-fun lt!193201 () array!25625)

(declare-fun zeroValue!515 () V!15621)

(declare-fun getCurrentListMapNoExtraKeys!1274 (array!25623 array!25625 (_ BitVec 32) (_ BitVec 32) V!15621 V!15621 (_ BitVec 32) Int) ListLongMap!6109)

(assert (=> b!420973 (= lt!193205 (getCurrentListMapNoExtraKeys!1274 lt!193210 lt!193201 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420974 () Bool)

(declare-fun e!250677 () Bool)

(assert (=> b!420974 (= e!250675 e!250677)))

(declare-fun res!245626 () Bool)

(assert (=> b!420974 (=> (not res!245626) (not e!250677))))

(assert (=> b!420974 (= res!245626 (= from!863 i!563))))

(assert (=> b!420974 (= lt!193206 (getCurrentListMapNoExtraKeys!1274 lt!193210 lt!193201 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!420974 (= lt!193201 (array!25626 (store (arr!12262 _values!549) i!563 (ValueCellFull!5100 v!412)) (size!12614 _values!549)))))

(declare-fun lt!193211 () ListLongMap!6109)

(assert (=> b!420974 (= lt!193211 (getCurrentListMapNoExtraKeys!1274 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!420975 () Bool)

(declare-fun res!245619 () Bool)

(assert (=> b!420975 (=> (not res!245619) (not e!250675))))

(declare-datatypes ((List!7204 0))(
  ( (Nil!7201) (Cons!7200 (h!8056 (_ BitVec 64)) (t!12604 List!7204)) )
))
(declare-fun arrayNoDuplicates!0 (array!25623 (_ BitVec 32) List!7204) Bool)

(assert (=> b!420975 (= res!245619 (arrayNoDuplicates!0 lt!193210 #b00000000000000000000000000000000 Nil!7201))))

(declare-fun b!420976 () Bool)

(declare-fun e!250679 () Bool)

(declare-fun e!250672 () Bool)

(declare-fun mapRes!17952 () Bool)

(assert (=> b!420976 (= e!250679 (and e!250672 mapRes!17952))))

(declare-fun condMapEmpty!17952 () Bool)

(declare-fun mapDefault!17952 () ValueCell!5100)

(assert (=> b!420976 (= condMapEmpty!17952 (= (arr!12262 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5100)) mapDefault!17952)))))

(declare-fun c!55316 () Bool)

(declare-fun bm!29380 () Bool)

(declare-fun call!29383 () ListLongMap!6109)

(assert (=> bm!29380 (= call!29383 (getCurrentListMapNoExtraKeys!1274 (ite c!55316 _keys!709 lt!193210) (ite c!55316 _values!549 lt!193201) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17952 () Bool)

(declare-fun tp!34734 () Bool)

(declare-fun e!250674 () Bool)

(assert (=> mapNonEmpty!17952 (= mapRes!17952 (and tp!34734 e!250674))))

(declare-fun mapRest!17952 () (Array (_ BitVec 32) ValueCell!5100))

(declare-fun mapKey!17952 () (_ BitVec 32))

(declare-fun mapValue!17952 () ValueCell!5100)

(assert (=> mapNonEmpty!17952 (= (arr!12262 _values!549) (store mapRest!17952 mapKey!17952 mapValue!17952))))

(declare-fun b!420977 () Bool)

(declare-fun e!250676 () Bool)

(declare-fun call!29384 () ListLongMap!6109)

(assert (=> b!420977 (= e!250676 (= call!29383 call!29384))))

(declare-fun b!420978 () Bool)

(declare-fun res!245620 () Bool)

(assert (=> b!420978 (=> (not res!245620) (not e!250673))))

(assert (=> b!420978 (= res!245620 (or (= (select (arr!12261 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12261 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!420979 () Bool)

(declare-fun res!245629 () Bool)

(assert (=> b!420979 (=> (not res!245629) (not e!250673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25623 (_ BitVec 32)) Bool)

(assert (=> b!420979 (= res!245629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!420980 () Bool)

(assert (=> b!420980 (= e!250676 (= call!29384 (+!1266 call!29383 (tuple2!7197 k0!794 v!412))))))

(declare-fun b!420981 () Bool)

(assert (=> b!420981 (= e!250677 (not e!250678))))

(declare-fun res!245623 () Bool)

(assert (=> b!420981 (=> res!245623 e!250678)))

(assert (=> b!420981 (= res!245623 (validKeyInArray!0 (select (arr!12261 _keys!709) from!863)))))

(assert (=> b!420981 e!250676))

(assert (=> b!420981 (= c!55316 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193203 () Unit!12434)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!464 (array!25623 array!25625 (_ BitVec 32) (_ BitVec 32) V!15621 V!15621 (_ BitVec 32) (_ BitVec 64) V!15621 (_ BitVec 32) Int) Unit!12434)

(assert (=> b!420981 (= lt!193203 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!464 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420982 () Bool)

(declare-fun res!245627 () Bool)

(assert (=> b!420982 (=> (not res!245627) (not e!250673))))

(declare-fun arrayContainsKey!0 (array!25623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!420982 (= res!245627 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!420983 () Bool)

(declare-fun tp_is_empty!10887 () Bool)

(assert (=> b!420983 (= e!250674 tp_is_empty!10887)))

(declare-fun bm!29381 () Bool)

(assert (=> bm!29381 (= call!29384 (getCurrentListMapNoExtraKeys!1274 (ite c!55316 lt!193210 _keys!709) (ite c!55316 lt!193201 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!420984 () Bool)

(assert (=> b!420984 (= e!250672 tp_is_empty!10887)))

(declare-fun b!420985 () Bool)

(declare-fun res!245622 () Bool)

(assert (=> b!420985 (=> (not res!245622) (not e!250673))))

(assert (=> b!420985 (= res!245622 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12613 _keys!709))))))

(declare-fun b!420986 () Bool)

(declare-fun res!245618 () Bool)

(assert (=> b!420986 (=> (not res!245618) (not e!250673))))

(assert (=> b!420986 (= res!245618 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7201))))

(declare-fun mapIsEmpty!17952 () Bool)

(assert (=> mapIsEmpty!17952 mapRes!17952))

(declare-fun res!245630 () Bool)

(assert (=> start!39468 (=> (not res!245630) (not e!250673))))

(assert (=> start!39468 (= res!245630 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12613 _keys!709))))))

(assert (=> start!39468 e!250673))

(assert (=> start!39468 tp_is_empty!10887))

(assert (=> start!39468 tp!34733))

(assert (=> start!39468 true))

(declare-fun array_inv!8936 (array!25625) Bool)

(assert (=> start!39468 (and (array_inv!8936 _values!549) e!250679)))

(declare-fun array_inv!8937 (array!25623) Bool)

(assert (=> start!39468 (array_inv!8937 _keys!709)))

(declare-fun b!420987 () Bool)

(assert (=> b!420987 (= e!250673 e!250675)))

(declare-fun res!245625 () Bool)

(assert (=> b!420987 (=> (not res!245625) (not e!250675))))

(assert (=> b!420987 (= res!245625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193210 mask!1025))))

(assert (=> b!420987 (= lt!193210 (array!25624 (store (arr!12261 _keys!709) i!563 k0!794) (size!12613 _keys!709)))))

(declare-fun b!420988 () Bool)

(declare-fun res!245621 () Bool)

(assert (=> b!420988 (=> (not res!245621) (not e!250673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!420988 (= res!245621 (validMask!0 mask!1025))))

(assert (= (and start!39468 res!245630) b!420988))

(assert (= (and b!420988 res!245621) b!420972))

(assert (= (and b!420972 res!245624) b!420979))

(assert (= (and b!420979 res!245629) b!420986))

(assert (= (and b!420986 res!245618) b!420985))

(assert (= (and b!420985 res!245622) b!420970))

(assert (= (and b!420970 res!245628) b!420978))

(assert (= (and b!420978 res!245620) b!420982))

(assert (= (and b!420982 res!245627) b!420987))

(assert (= (and b!420987 res!245625) b!420975))

(assert (= (and b!420975 res!245619) b!420971))

(assert (= (and b!420971 res!245631) b!420974))

(assert (= (and b!420974 res!245626) b!420981))

(assert (= (and b!420981 c!55316) b!420980))

(assert (= (and b!420981 (not c!55316)) b!420977))

(assert (= (or b!420980 b!420977) bm!29381))

(assert (= (or b!420980 b!420977) bm!29380))

(assert (= (and b!420981 (not res!245623)) b!420973))

(assert (= (and b!420976 condMapEmpty!17952) mapIsEmpty!17952))

(assert (= (and b!420976 (not condMapEmpty!17952)) mapNonEmpty!17952))

(get-info :version)

(assert (= (and mapNonEmpty!17952 ((_ is ValueCellFull!5100) mapValue!17952)) b!420983))

(assert (= (and b!420976 ((_ is ValueCellFull!5100) mapDefault!17952)) b!420984))

(assert (= start!39468 b!420976))

(declare-fun b_lambda!9039 () Bool)

(assert (=> (not b_lambda!9039) (not b!420973)))

(declare-fun t!12602 () Bool)

(declare-fun tb!3357 () Bool)

(assert (=> (and start!39468 (= defaultEntry!557 defaultEntry!557) t!12602) tb!3357))

(declare-fun result!6241 () Bool)

(assert (=> tb!3357 (= result!6241 tp_is_empty!10887)))

(assert (=> b!420973 t!12602))

(declare-fun b_and!17347 () Bool)

(assert (= b_and!17345 (and (=> t!12602 result!6241) b_and!17347)))

(declare-fun m!410657 () Bool)

(assert (=> b!420986 m!410657))

(declare-fun m!410659 () Bool)

(assert (=> bm!29381 m!410659))

(declare-fun m!410661 () Bool)

(assert (=> b!420987 m!410661))

(declare-fun m!410663 () Bool)

(assert (=> b!420987 m!410663))

(declare-fun m!410665 () Bool)

(assert (=> b!420979 m!410665))

(declare-fun m!410667 () Bool)

(assert (=> b!420973 m!410667))

(declare-fun m!410669 () Bool)

(assert (=> b!420973 m!410669))

(declare-fun m!410671 () Bool)

(assert (=> b!420973 m!410671))

(declare-fun m!410673 () Bool)

(assert (=> b!420973 m!410673))

(declare-fun m!410675 () Bool)

(assert (=> b!420973 m!410675))

(declare-fun m!410677 () Bool)

(assert (=> b!420973 m!410677))

(declare-fun m!410679 () Bool)

(assert (=> b!420973 m!410679))

(declare-fun m!410681 () Bool)

(assert (=> b!420973 m!410681))

(declare-fun m!410683 () Bool)

(assert (=> b!420973 m!410683))

(assert (=> b!420973 m!410679))

(declare-fun m!410685 () Bool)

(assert (=> b!420973 m!410685))

(declare-fun m!410687 () Bool)

(assert (=> b!420973 m!410687))

(declare-fun m!410689 () Bool)

(assert (=> b!420973 m!410689))

(assert (=> b!420973 m!410673))

(assert (=> b!420973 m!410671))

(declare-fun m!410691 () Bool)

(assert (=> b!420973 m!410691))

(declare-fun m!410693 () Bool)

(assert (=> bm!29380 m!410693))

(declare-fun m!410695 () Bool)

(assert (=> b!420978 m!410695))

(declare-fun m!410697 () Bool)

(assert (=> start!39468 m!410697))

(declare-fun m!410699 () Bool)

(assert (=> start!39468 m!410699))

(declare-fun m!410701 () Bool)

(assert (=> b!420982 m!410701))

(declare-fun m!410703 () Bool)

(assert (=> b!420981 m!410703))

(assert (=> b!420981 m!410703))

(declare-fun m!410705 () Bool)

(assert (=> b!420981 m!410705))

(declare-fun m!410707 () Bool)

(assert (=> b!420981 m!410707))

(declare-fun m!410709 () Bool)

(assert (=> b!420974 m!410709))

(assert (=> b!420974 m!410689))

(declare-fun m!410711 () Bool)

(assert (=> b!420974 m!410711))

(declare-fun m!410713 () Bool)

(assert (=> b!420975 m!410713))

(declare-fun m!410715 () Bool)

(assert (=> b!420970 m!410715))

(declare-fun m!410717 () Bool)

(assert (=> b!420980 m!410717))

(declare-fun m!410719 () Bool)

(assert (=> mapNonEmpty!17952 m!410719))

(declare-fun m!410721 () Bool)

(assert (=> b!420988 m!410721))

(check-sat (not b!420974) tp_is_empty!10887 (not start!39468) (not bm!29380) (not bm!29381) (not b!420987) b_and!17347 (not b!420986) (not b!420980) (not b_lambda!9039) (not mapNonEmpty!17952) (not b!420981) (not b!420982) (not b!420970) (not b!420973) (not b_next!9735) (not b!420979) (not b!420988) (not b!420975))
(check-sat b_and!17347 (not b_next!9735))
