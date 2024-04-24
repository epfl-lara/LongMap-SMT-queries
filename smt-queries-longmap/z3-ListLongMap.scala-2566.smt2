; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39200 () Bool)

(assert start!39200)

(declare-fun b_free!9481 () Bool)

(declare-fun b_next!9481 () Bool)

(assert (=> start!39200 (= b_free!9481 (not b_next!9481))))

(declare-fun tp!33971 () Bool)

(declare-fun b_and!16881 () Bool)

(assert (=> start!39200 (= tp!33971 b_and!16881)))

(declare-fun b!413492 () Bool)

(declare-fun res!240316 () Bool)

(declare-fun e!247250 () Bool)

(assert (=> b!413492 (=> (not res!240316) (not e!247250))))

(declare-datatypes ((array!25128 0))(
  ( (array!25129 (arr!12013 (Array (_ BitVec 32) (_ BitVec 64))) (size!12365 (_ BitVec 32))) )
))
(declare-fun lt!189776 () array!25128)

(declare-datatypes ((List!6857 0))(
  ( (Nil!6854) (Cons!6853 (h!7709 (_ BitVec 64)) (t!12023 List!6857)) )
))
(declare-fun arrayNoDuplicates!0 (array!25128 (_ BitVec 32) List!6857) Bool)

(assert (=> b!413492 (= res!240316 (arrayNoDuplicates!0 lt!189776 #b00000000000000000000000000000000 Nil!6854))))

(declare-fun b!413493 () Bool)

(declare-fun res!240326 () Bool)

(declare-fun e!247245 () Bool)

(assert (=> b!413493 (=> (not res!240326) (not e!247245))))

(declare-fun _keys!709 () array!25128)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15283 0))(
  ( (V!15284 (val!5361 Int)) )
))
(declare-datatypes ((ValueCell!4973 0))(
  ( (ValueCellFull!4973 (v!7609 V!15283)) (EmptyCell!4973) )
))
(declare-datatypes ((array!25130 0))(
  ( (array!25131 (arr!12014 (Array (_ BitVec 32) ValueCell!4973)) (size!12366 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25130)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!413493 (= res!240326 (and (= (size!12366 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12365 _keys!709) (size!12366 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413494 () Bool)

(declare-fun e!247248 () Bool)

(declare-fun tp_is_empty!10633 () Bool)

(assert (=> b!413494 (= e!247248 tp_is_empty!10633)))

(declare-fun mapNonEmpty!17571 () Bool)

(declare-fun mapRes!17571 () Bool)

(declare-fun tp!33972 () Bool)

(assert (=> mapNonEmpty!17571 (= mapRes!17571 (and tp!33972 e!247248))))

(declare-fun mapKey!17571 () (_ BitVec 32))

(declare-fun mapRest!17571 () (Array (_ BitVec 32) ValueCell!4973))

(declare-fun mapValue!17571 () ValueCell!4973)

(assert (=> mapNonEmpty!17571 (= (arr!12014 _values!549) (store mapRest!17571 mapKey!17571 mapValue!17571))))

(declare-fun b!413495 () Bool)

(declare-fun res!240318 () Bool)

(assert (=> b!413495 (=> (not res!240318) (not e!247250))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413495 (= res!240318 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17571 () Bool)

(assert (=> mapIsEmpty!17571 mapRes!17571))

(declare-fun b!413496 () Bool)

(declare-fun res!240325 () Bool)

(assert (=> b!413496 (=> (not res!240325) (not e!247245))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413496 (= res!240325 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413497 () Bool)

(declare-fun res!240327 () Bool)

(assert (=> b!413497 (=> (not res!240327) (not e!247245))))

(assert (=> b!413497 (= res!240327 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12365 _keys!709))))))

(declare-fun b!413498 () Bool)

(declare-fun res!240324 () Bool)

(assert (=> b!413498 (=> (not res!240324) (not e!247245))))

(assert (=> b!413498 (= res!240324 (or (= (select (arr!12013 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12013 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413499 () Bool)

(declare-fun res!240321 () Bool)

(assert (=> b!413499 (=> (not res!240321) (not e!247245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413499 (= res!240321 (validMask!0 mask!1025))))

(declare-fun res!240315 () Bool)

(assert (=> start!39200 (=> (not res!240315) (not e!247245))))

(assert (=> start!39200 (= res!240315 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12365 _keys!709))))))

(assert (=> start!39200 e!247245))

(assert (=> start!39200 tp_is_empty!10633))

(assert (=> start!39200 tp!33971))

(assert (=> start!39200 true))

(declare-fun e!247246 () Bool)

(declare-fun array_inv!8840 (array!25130) Bool)

(assert (=> start!39200 (and (array_inv!8840 _values!549) e!247246)))

(declare-fun array_inv!8841 (array!25128) Bool)

(assert (=> start!39200 (array_inv!8841 _keys!709)))

(declare-fun b!413500 () Bool)

(declare-fun e!247247 () Bool)

(declare-datatypes ((tuple2!6838 0))(
  ( (tuple2!6839 (_1!3430 (_ BitVec 64)) (_2!3430 V!15283)) )
))
(declare-datatypes ((List!6858 0))(
  ( (Nil!6855) (Cons!6854 (h!7710 tuple2!6838) (t!12024 List!6858)) )
))
(declare-datatypes ((ListLongMap!5753 0))(
  ( (ListLongMap!5754 (toList!2892 List!6858)) )
))
(declare-fun call!28608 () ListLongMap!5753)

(declare-fun call!28609 () ListLongMap!5753)

(assert (=> b!413500 (= e!247247 (= call!28608 call!28609))))

(declare-fun b!413501 () Bool)

(declare-fun res!240317 () Bool)

(assert (=> b!413501 (=> (not res!240317) (not e!247245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25128 (_ BitVec 32)) Bool)

(assert (=> b!413501 (= res!240317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413502 () Bool)

(declare-fun v!412 () V!15283)

(declare-fun +!1170 (ListLongMap!5753 tuple2!6838) ListLongMap!5753)

(assert (=> b!413502 (= e!247247 (= call!28609 (+!1170 call!28608 (tuple2!6839 k0!794 v!412))))))

(declare-fun c!54912 () Bool)

(declare-fun minValue!515 () V!15283)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!28605 () Bool)

(declare-fun zeroValue!515 () V!15283)

(declare-fun lt!189773 () array!25130)

(declare-fun getCurrentListMapNoExtraKeys!1142 (array!25128 array!25130 (_ BitVec 32) (_ BitVec 32) V!15283 V!15283 (_ BitVec 32) Int) ListLongMap!5753)

(assert (=> bm!28605 (= call!28608 (getCurrentListMapNoExtraKeys!1142 (ite c!54912 _keys!709 lt!189776) (ite c!54912 _values!549 lt!189773) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413503 () Bool)

(declare-fun res!240323 () Bool)

(assert (=> b!413503 (=> (not res!240323) (not e!247245))))

(assert (=> b!413503 (= res!240323 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6854))))

(declare-fun bm!28606 () Bool)

(assert (=> bm!28606 (= call!28609 (getCurrentListMapNoExtraKeys!1142 (ite c!54912 lt!189776 _keys!709) (ite c!54912 lt!189773 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413504 () Bool)

(declare-fun e!247251 () Bool)

(assert (=> b!413504 (= e!247251 (not true))))

(assert (=> b!413504 e!247247))

(assert (=> b!413504 (= c!54912 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12231 0))(
  ( (Unit!12232) )
))
(declare-fun lt!189775 () Unit!12231)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!383 (array!25128 array!25130 (_ BitVec 32) (_ BitVec 32) V!15283 V!15283 (_ BitVec 32) (_ BitVec 64) V!15283 (_ BitVec 32) Int) Unit!12231)

(assert (=> b!413504 (= lt!189775 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!383 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413505 () Bool)

(assert (=> b!413505 (= e!247245 e!247250)))

(declare-fun res!240320 () Bool)

(assert (=> b!413505 (=> (not res!240320) (not e!247250))))

(assert (=> b!413505 (= res!240320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189776 mask!1025))))

(assert (=> b!413505 (= lt!189776 (array!25129 (store (arr!12013 _keys!709) i!563 k0!794) (size!12365 _keys!709)))))

(declare-fun b!413506 () Bool)

(declare-fun e!247252 () Bool)

(assert (=> b!413506 (= e!247252 tp_is_empty!10633)))

(declare-fun b!413507 () Bool)

(assert (=> b!413507 (= e!247250 e!247251)))

(declare-fun res!240319 () Bool)

(assert (=> b!413507 (=> (not res!240319) (not e!247251))))

(assert (=> b!413507 (= res!240319 (= from!863 i!563))))

(declare-fun lt!189777 () ListLongMap!5753)

(assert (=> b!413507 (= lt!189777 (getCurrentListMapNoExtraKeys!1142 lt!189776 lt!189773 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413507 (= lt!189773 (array!25131 (store (arr!12014 _values!549) i!563 (ValueCellFull!4973 v!412)) (size!12366 _values!549)))))

(declare-fun lt!189774 () ListLongMap!5753)

(assert (=> b!413507 (= lt!189774 (getCurrentListMapNoExtraKeys!1142 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413508 () Bool)

(assert (=> b!413508 (= e!247246 (and e!247252 mapRes!17571))))

(declare-fun condMapEmpty!17571 () Bool)

(declare-fun mapDefault!17571 () ValueCell!4973)

(assert (=> b!413508 (= condMapEmpty!17571 (= (arr!12014 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4973)) mapDefault!17571)))))

(declare-fun b!413509 () Bool)

(declare-fun res!240322 () Bool)

(assert (=> b!413509 (=> (not res!240322) (not e!247245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413509 (= res!240322 (validKeyInArray!0 k0!794))))

(assert (= (and start!39200 res!240315) b!413499))

(assert (= (and b!413499 res!240321) b!413493))

(assert (= (and b!413493 res!240326) b!413501))

(assert (= (and b!413501 res!240317) b!413503))

(assert (= (and b!413503 res!240323) b!413497))

(assert (= (and b!413497 res!240327) b!413509))

(assert (= (and b!413509 res!240322) b!413498))

(assert (= (and b!413498 res!240324) b!413496))

(assert (= (and b!413496 res!240325) b!413505))

(assert (= (and b!413505 res!240320) b!413492))

(assert (= (and b!413492 res!240316) b!413495))

(assert (= (and b!413495 res!240318) b!413507))

(assert (= (and b!413507 res!240319) b!413504))

(assert (= (and b!413504 c!54912) b!413502))

(assert (= (and b!413504 (not c!54912)) b!413500))

(assert (= (or b!413502 b!413500) bm!28606))

(assert (= (or b!413502 b!413500) bm!28605))

(assert (= (and b!413508 condMapEmpty!17571) mapIsEmpty!17571))

(assert (= (and b!413508 (not condMapEmpty!17571)) mapNonEmpty!17571))

(get-info :version)

(assert (= (and mapNonEmpty!17571 ((_ is ValueCellFull!4973) mapValue!17571)) b!413494))

(assert (= (and b!413508 ((_ is ValueCellFull!4973) mapDefault!17571)) b!413506))

(assert (= start!39200 b!413508))

(declare-fun m!403239 () Bool)

(assert (=> bm!28605 m!403239))

(declare-fun m!403241 () Bool)

(assert (=> b!413499 m!403241))

(declare-fun m!403243 () Bool)

(assert (=> start!39200 m!403243))

(declare-fun m!403245 () Bool)

(assert (=> start!39200 m!403245))

(declare-fun m!403247 () Bool)

(assert (=> b!413501 m!403247))

(declare-fun m!403249 () Bool)

(assert (=> b!413503 m!403249))

(declare-fun m!403251 () Bool)

(assert (=> b!413496 m!403251))

(declare-fun m!403253 () Bool)

(assert (=> b!413492 m!403253))

(declare-fun m!403255 () Bool)

(assert (=> bm!28606 m!403255))

(declare-fun m!403257 () Bool)

(assert (=> b!413502 m!403257))

(declare-fun m!403259 () Bool)

(assert (=> b!413504 m!403259))

(declare-fun m!403261 () Bool)

(assert (=> b!413498 m!403261))

(declare-fun m!403263 () Bool)

(assert (=> b!413507 m!403263))

(declare-fun m!403265 () Bool)

(assert (=> b!413507 m!403265))

(declare-fun m!403267 () Bool)

(assert (=> b!413507 m!403267))

(declare-fun m!403269 () Bool)

(assert (=> mapNonEmpty!17571 m!403269))

(declare-fun m!403271 () Bool)

(assert (=> b!413509 m!403271))

(declare-fun m!403273 () Bool)

(assert (=> b!413505 m!403273))

(declare-fun m!403275 () Bool)

(assert (=> b!413505 m!403275))

(check-sat (not mapNonEmpty!17571) (not b!413492) (not b_next!9481) (not b!413496) (not start!39200) (not bm!28605) (not b!413503) (not b!413507) (not b!413505) b_and!16881 (not bm!28606) (not b!413509) tp_is_empty!10633 (not b!413499) (not b!413501) (not b!413504) (not b!413502))
(check-sat b_and!16881 (not b_next!9481))
