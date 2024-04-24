; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39290 () Bool)

(assert start!39290)

(declare-fun b_free!9571 () Bool)

(declare-fun b_next!9571 () Bool)

(assert (=> start!39290 (= b_free!9571 (not b_next!9571))))

(declare-fun tp!34241 () Bool)

(declare-fun b_and!17031 () Bool)

(assert (=> start!39290 (= tp!34241 b_and!17031)))

(declare-fun b!416083 () Bool)

(declare-fun res!242178 () Bool)

(declare-fun e!248433 () Bool)

(assert (=> b!416083 (=> (not res!242178) (not e!248433))))

(declare-datatypes ((array!25306 0))(
  ( (array!25307 (arr!12102 (Array (_ BitVec 32) (_ BitVec 64))) (size!12454 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25306)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25306 (_ BitVec 32)) Bool)

(assert (=> b!416083 (= res!242178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416084 () Bool)

(declare-fun e!248426 () Bool)

(declare-fun e!248434 () Bool)

(declare-fun mapRes!17706 () Bool)

(assert (=> b!416084 (= e!248426 (and e!248434 mapRes!17706))))

(declare-fun condMapEmpty!17706 () Bool)

(declare-datatypes ((V!15403 0))(
  ( (V!15404 (val!5406 Int)) )
))
(declare-datatypes ((ValueCell!5018 0))(
  ( (ValueCellFull!5018 (v!7654 V!15403)) (EmptyCell!5018) )
))
(declare-datatypes ((array!25308 0))(
  ( (array!25309 (arr!12103 (Array (_ BitVec 32) ValueCell!5018)) (size!12455 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25308)

(declare-fun mapDefault!17706 () ValueCell!5018)

(assert (=> b!416084 (= condMapEmpty!17706 (= (arr!12103 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5018)) mapDefault!17706)))))

(declare-fun b!416085 () Bool)

(declare-fun e!248432 () Bool)

(declare-fun e!248431 () Bool)

(assert (=> b!416085 (= e!248432 e!248431)))

(declare-fun res!242177 () Bool)

(assert (=> b!416085 (=> (not res!242177) (not e!248431))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416085 (= res!242177 (= from!863 i!563))))

(declare-fun minValue!515 () V!15403)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15403)

(declare-datatypes ((tuple2!6922 0))(
  ( (tuple2!6923 (_1!3472 (_ BitVec 64)) (_2!3472 V!15403)) )
))
(declare-datatypes ((List!6942 0))(
  ( (Nil!6939) (Cons!6938 (h!7794 tuple2!6922) (t!12170 List!6942)) )
))
(declare-datatypes ((ListLongMap!5837 0))(
  ( (ListLongMap!5838 (toList!2934 List!6942)) )
))
(declare-fun lt!190522 () ListLongMap!5837)

(declare-fun lt!190519 () array!25306)

(declare-fun lt!190520 () array!25308)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1181 (array!25306 array!25308 (_ BitVec 32) (_ BitVec 32) V!15403 V!15403 (_ BitVec 32) Int) ListLongMap!5837)

(assert (=> b!416085 (= lt!190522 (getCurrentListMapNoExtraKeys!1181 lt!190519 lt!190520 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15403)

(assert (=> b!416085 (= lt!190520 (array!25309 (store (arr!12103 _values!549) i!563 (ValueCellFull!5018 v!412)) (size!12455 _values!549)))))

(declare-fun lt!190518 () ListLongMap!5837)

(assert (=> b!416085 (= lt!190518 (getCurrentListMapNoExtraKeys!1181 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416086 () Bool)

(declare-fun e!248429 () Bool)

(declare-fun tp_is_empty!10723 () Bool)

(assert (=> b!416086 (= e!248429 tp_is_empty!10723)))

(declare-fun b!416087 () Bool)

(declare-fun res!242173 () Bool)

(assert (=> b!416087 (=> (not res!242173) (not e!248433))))

(assert (=> b!416087 (= res!242173 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12454 _keys!709))))))

(declare-fun e!248427 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun b!416088 () Bool)

(declare-fun call!28878 () ListLongMap!5837)

(declare-fun call!28879 () ListLongMap!5837)

(declare-fun +!1206 (ListLongMap!5837 tuple2!6922) ListLongMap!5837)

(assert (=> b!416088 (= e!248427 (= call!28878 (+!1206 call!28879 (tuple2!6923 k0!794 v!412))))))

(declare-fun b!416089 () Bool)

(assert (=> b!416089 (= e!248434 tp_is_empty!10723)))

(declare-fun b!416090 () Bool)

(declare-fun res!242176 () Bool)

(assert (=> b!416090 (=> (not res!242176) (not e!248433))))

(declare-fun arrayContainsKey!0 (array!25306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416090 (= res!242176 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416091 () Bool)

(declare-fun res!242172 () Bool)

(assert (=> b!416091 (=> (not res!242172) (not e!248433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416091 (= res!242172 (validKeyInArray!0 k0!794))))

(declare-fun b!416092 () Bool)

(declare-fun e!248428 () Bool)

(assert (=> b!416092 (= e!248431 (not e!248428))))

(declare-fun res!242183 () Bool)

(assert (=> b!416092 (=> res!242183 e!248428)))

(assert (=> b!416092 (= res!242183 (validKeyInArray!0 (select (arr!12102 _keys!709) from!863)))))

(assert (=> b!416092 e!248427))

(declare-fun c!55047 () Bool)

(assert (=> b!416092 (= c!55047 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12291 0))(
  ( (Unit!12292) )
))
(declare-fun lt!190515 () Unit!12291)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!413 (array!25306 array!25308 (_ BitVec 32) (_ BitVec 32) V!15403 V!15403 (_ BitVec 32) (_ BitVec 64) V!15403 (_ BitVec 32) Int) Unit!12291)

(assert (=> b!416092 (= lt!190515 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!413 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416093 () Bool)

(assert (=> b!416093 (= e!248427 (= call!28879 call!28878))))

(declare-fun res!242184 () Bool)

(assert (=> start!39290 (=> (not res!242184) (not e!248433))))

(assert (=> start!39290 (= res!242184 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12454 _keys!709))))))

(assert (=> start!39290 e!248433))

(assert (=> start!39290 tp_is_empty!10723))

(assert (=> start!39290 tp!34241))

(assert (=> start!39290 true))

(declare-fun array_inv!8904 (array!25308) Bool)

(assert (=> start!39290 (and (array_inv!8904 _values!549) e!248426)))

(declare-fun array_inv!8905 (array!25306) Bool)

(assert (=> start!39290 (array_inv!8905 _keys!709)))

(declare-fun b!416094 () Bool)

(declare-fun res!242182 () Bool)

(assert (=> b!416094 (=> (not res!242182) (not e!248433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416094 (= res!242182 (validMask!0 mask!1025))))

(declare-fun b!416095 () Bool)

(assert (=> b!416095 (= e!248433 e!248432)))

(declare-fun res!242171 () Bool)

(assert (=> b!416095 (=> (not res!242171) (not e!248432))))

(assert (=> b!416095 (= res!242171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190519 mask!1025))))

(assert (=> b!416095 (= lt!190519 (array!25307 (store (arr!12102 _keys!709) i!563 k0!794) (size!12454 _keys!709)))))

(declare-fun bm!28875 () Bool)

(assert (=> bm!28875 (= call!28878 (getCurrentListMapNoExtraKeys!1181 (ite c!55047 lt!190519 _keys!709) (ite c!55047 lt!190520 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416096 () Bool)

(declare-fun res!242181 () Bool)

(assert (=> b!416096 (=> (not res!242181) (not e!248433))))

(assert (=> b!416096 (= res!242181 (and (= (size!12455 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12454 _keys!709) (size!12455 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28876 () Bool)

(assert (=> bm!28876 (= call!28879 (getCurrentListMapNoExtraKeys!1181 (ite c!55047 _keys!709 lt!190519) (ite c!55047 _values!549 lt!190520) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416097 () Bool)

(declare-fun res!242175 () Bool)

(assert (=> b!416097 (=> (not res!242175) (not e!248433))))

(declare-datatypes ((List!6943 0))(
  ( (Nil!6940) (Cons!6939 (h!7795 (_ BitVec 64)) (t!12171 List!6943)) )
))
(declare-fun arrayNoDuplicates!0 (array!25306 (_ BitVec 32) List!6943) Bool)

(assert (=> b!416097 (= res!242175 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6940))))

(declare-fun b!416098 () Bool)

(declare-fun res!242180 () Bool)

(assert (=> b!416098 (=> (not res!242180) (not e!248432))))

(assert (=> b!416098 (= res!242180 (bvsle from!863 i!563))))

(declare-fun b!416099 () Bool)

(assert (=> b!416099 (= e!248428 true)))

(declare-fun lt!190523 () tuple2!6922)

(declare-fun lt!190521 () ListLongMap!5837)

(declare-fun lt!190514 () V!15403)

(assert (=> b!416099 (= (+!1206 lt!190521 lt!190523) (+!1206 (+!1206 lt!190521 (tuple2!6923 k0!794 lt!190514)) lt!190523))))

(declare-fun lt!190517 () V!15403)

(assert (=> b!416099 (= lt!190523 (tuple2!6923 k0!794 lt!190517))))

(declare-fun lt!190516 () Unit!12291)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!3 (ListLongMap!5837 (_ BitVec 64) V!15403 V!15403) Unit!12291)

(assert (=> b!416099 (= lt!190516 (addSameAsAddTwiceSameKeyDiffValues!3 lt!190521 k0!794 lt!190514 lt!190517))))

(declare-fun lt!190524 () V!15403)

(declare-fun get!5981 (ValueCell!5018 V!15403) V!15403)

(assert (=> b!416099 (= lt!190514 (get!5981 (select (arr!12103 _values!549) from!863) lt!190524))))

(assert (=> b!416099 (= lt!190522 (+!1206 lt!190521 (tuple2!6923 (select (arr!12102 lt!190519) from!863) lt!190517)))))

(assert (=> b!416099 (= lt!190517 (get!5981 (select (store (arr!12103 _values!549) i!563 (ValueCellFull!5018 v!412)) from!863) lt!190524))))

(declare-fun dynLambda!670 (Int (_ BitVec 64)) V!15403)

(assert (=> b!416099 (= lt!190524 (dynLambda!670 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416099 (= lt!190521 (getCurrentListMapNoExtraKeys!1181 lt!190519 lt!190520 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17706 () Bool)

(assert (=> mapIsEmpty!17706 mapRes!17706))

(declare-fun mapNonEmpty!17706 () Bool)

(declare-fun tp!34242 () Bool)

(assert (=> mapNonEmpty!17706 (= mapRes!17706 (and tp!34242 e!248429))))

(declare-fun mapKey!17706 () (_ BitVec 32))

(declare-fun mapValue!17706 () ValueCell!5018)

(declare-fun mapRest!17706 () (Array (_ BitVec 32) ValueCell!5018))

(assert (=> mapNonEmpty!17706 (= (arr!12103 _values!549) (store mapRest!17706 mapKey!17706 mapValue!17706))))

(declare-fun b!416100 () Bool)

(declare-fun res!242174 () Bool)

(assert (=> b!416100 (=> (not res!242174) (not e!248433))))

(assert (=> b!416100 (= res!242174 (or (= (select (arr!12102 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12102 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!416101 () Bool)

(declare-fun res!242179 () Bool)

(assert (=> b!416101 (=> (not res!242179) (not e!248432))))

(assert (=> b!416101 (= res!242179 (arrayNoDuplicates!0 lt!190519 #b00000000000000000000000000000000 Nil!6940))))

(assert (= (and start!39290 res!242184) b!416094))

(assert (= (and b!416094 res!242182) b!416096))

(assert (= (and b!416096 res!242181) b!416083))

(assert (= (and b!416083 res!242178) b!416097))

(assert (= (and b!416097 res!242175) b!416087))

(assert (= (and b!416087 res!242173) b!416091))

(assert (= (and b!416091 res!242172) b!416100))

(assert (= (and b!416100 res!242174) b!416090))

(assert (= (and b!416090 res!242176) b!416095))

(assert (= (and b!416095 res!242171) b!416101))

(assert (= (and b!416101 res!242179) b!416098))

(assert (= (and b!416098 res!242180) b!416085))

(assert (= (and b!416085 res!242177) b!416092))

(assert (= (and b!416092 c!55047) b!416088))

(assert (= (and b!416092 (not c!55047)) b!416093))

(assert (= (or b!416088 b!416093) bm!28875))

(assert (= (or b!416088 b!416093) bm!28876))

(assert (= (and b!416092 (not res!242183)) b!416099))

(assert (= (and b!416084 condMapEmpty!17706) mapIsEmpty!17706))

(assert (= (and b!416084 (not condMapEmpty!17706)) mapNonEmpty!17706))

(get-info :version)

(assert (= (and mapNonEmpty!17706 ((_ is ValueCellFull!5018) mapValue!17706)) b!416086))

(assert (= (and b!416084 ((_ is ValueCellFull!5018) mapDefault!17706)) b!416089))

(assert (= start!39290 b!416084))

(declare-fun b_lambda!8897 () Bool)

(assert (=> (not b_lambda!8897) (not b!416099)))

(declare-fun t!12169 () Bool)

(declare-fun tb!3185 () Bool)

(assert (=> (and start!39290 (= defaultEntry!557 defaultEntry!557) t!12169) tb!3185))

(declare-fun result!5905 () Bool)

(assert (=> tb!3185 (= result!5905 tp_is_empty!10723)))

(assert (=> b!416099 t!12169))

(declare-fun b_and!17033 () Bool)

(assert (= b_and!17031 (and (=> t!12169 result!5905) b_and!17033)))

(declare-fun m!405475 () Bool)

(assert (=> bm!28875 m!405475))

(declare-fun m!405477 () Bool)

(assert (=> b!416085 m!405477))

(declare-fun m!405479 () Bool)

(assert (=> b!416085 m!405479))

(declare-fun m!405481 () Bool)

(assert (=> b!416085 m!405481))

(declare-fun m!405483 () Bool)

(assert (=> bm!28876 m!405483))

(declare-fun m!405485 () Bool)

(assert (=> b!416083 m!405485))

(declare-fun m!405487 () Bool)

(assert (=> start!39290 m!405487))

(declare-fun m!405489 () Bool)

(assert (=> start!39290 m!405489))

(declare-fun m!405491 () Bool)

(assert (=> b!416100 m!405491))

(declare-fun m!405493 () Bool)

(assert (=> b!416099 m!405493))

(declare-fun m!405495 () Bool)

(assert (=> b!416099 m!405495))

(declare-fun m!405497 () Bool)

(assert (=> b!416099 m!405497))

(assert (=> b!416099 m!405479))

(declare-fun m!405499 () Bool)

(assert (=> b!416099 m!405499))

(declare-fun m!405501 () Bool)

(assert (=> b!416099 m!405501))

(declare-fun m!405503 () Bool)

(assert (=> b!416099 m!405503))

(declare-fun m!405505 () Bool)

(assert (=> b!416099 m!405505))

(declare-fun m!405507 () Bool)

(assert (=> b!416099 m!405507))

(assert (=> b!416099 m!405505))

(declare-fun m!405509 () Bool)

(assert (=> b!416099 m!405509))

(declare-fun m!405511 () Bool)

(assert (=> b!416099 m!405511))

(declare-fun m!405513 () Bool)

(assert (=> b!416099 m!405513))

(assert (=> b!416099 m!405493))

(declare-fun m!405515 () Bool)

(assert (=> b!416099 m!405515))

(assert (=> b!416099 m!405501))

(declare-fun m!405517 () Bool)

(assert (=> b!416095 m!405517))

(declare-fun m!405519 () Bool)

(assert (=> b!416095 m!405519))

(declare-fun m!405521 () Bool)

(assert (=> b!416091 m!405521))

(declare-fun m!405523 () Bool)

(assert (=> b!416092 m!405523))

(assert (=> b!416092 m!405523))

(declare-fun m!405525 () Bool)

(assert (=> b!416092 m!405525))

(declare-fun m!405527 () Bool)

(assert (=> b!416092 m!405527))

(declare-fun m!405529 () Bool)

(assert (=> b!416088 m!405529))

(declare-fun m!405531 () Bool)

(assert (=> b!416101 m!405531))

(declare-fun m!405533 () Bool)

(assert (=> b!416097 m!405533))

(declare-fun m!405535 () Bool)

(assert (=> b!416090 m!405535))

(declare-fun m!405537 () Bool)

(assert (=> mapNonEmpty!17706 m!405537))

(declare-fun m!405539 () Bool)

(assert (=> b!416094 m!405539))

(check-sat (not b!416094) (not b!416083) (not b!416085) (not b!416092) (not b_lambda!8897) (not start!39290) (not b_next!9571) (not b!416095) (not mapNonEmpty!17706) (not b!416099) (not b!416101) (not bm!28875) (not b!416090) tp_is_empty!10723 (not bm!28876) (not b!416097) (not b!416088) b_and!17033 (not b!416091))
(check-sat b_and!17033 (not b_next!9571))
