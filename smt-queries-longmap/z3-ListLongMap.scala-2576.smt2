; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39276 () Bool)

(assert start!39276)

(declare-fun b_free!9543 () Bool)

(declare-fun b_next!9543 () Bool)

(assert (=> start!39276 (= b_free!9543 (not b_next!9543))))

(declare-fun tp!34158 () Bool)

(declare-fun b_and!16961 () Bool)

(assert (=> start!39276 (= tp!34158 b_and!16961)))

(declare-fun b!415306 () Bool)

(declare-fun res!241587 () Bool)

(declare-fun e!248088 () Bool)

(assert (=> b!415306 (=> (not res!241587) (not e!248088))))

(declare-datatypes ((array!25247 0))(
  ( (array!25248 (arr!12073 (Array (_ BitVec 32) (_ BitVec 64))) (size!12425 (_ BitVec 32))) )
))
(declare-fun lt!190223 () array!25247)

(declare-datatypes ((List!7045 0))(
  ( (Nil!7042) (Cons!7041 (h!7897 (_ BitVec 64)) (t!12253 List!7045)) )
))
(declare-fun arrayNoDuplicates!0 (array!25247 (_ BitVec 32) List!7045) Bool)

(assert (=> b!415306 (= res!241587 (arrayNoDuplicates!0 lt!190223 #b00000000000000000000000000000000 Nil!7042))))

(declare-fun b!415307 () Bool)

(declare-fun res!241595 () Bool)

(declare-fun e!248081 () Bool)

(assert (=> b!415307 (=> (not res!241595) (not e!248081))))

(declare-fun _keys!709 () array!25247)

(assert (=> b!415307 (= res!241595 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7042))))

(declare-fun mapNonEmpty!17664 () Bool)

(declare-fun mapRes!17664 () Bool)

(declare-fun tp!34157 () Bool)

(declare-fun e!248087 () Bool)

(assert (=> mapNonEmpty!17664 (= mapRes!17664 (and tp!34157 e!248087))))

(declare-fun mapKey!17664 () (_ BitVec 32))

(declare-datatypes ((V!15365 0))(
  ( (V!15366 (val!5392 Int)) )
))
(declare-datatypes ((ValueCell!5004 0))(
  ( (ValueCellFull!5004 (v!7639 V!15365)) (EmptyCell!5004) )
))
(declare-fun mapRest!17664 () (Array (_ BitVec 32) ValueCell!5004))

(declare-datatypes ((array!25249 0))(
  ( (array!25250 (arr!12074 (Array (_ BitVec 32) ValueCell!5004)) (size!12426 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25249)

(declare-fun mapValue!17664 () ValueCell!5004)

(assert (=> mapNonEmpty!17664 (= (arr!12074 _values!549) (store mapRest!17664 mapKey!17664 mapValue!17664))))

(declare-fun b!415308 () Bool)

(declare-fun res!241589 () Bool)

(assert (=> b!415308 (=> (not res!241589) (not e!248081))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415308 (= res!241589 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!415309 () Bool)

(declare-fun res!241590 () Bool)

(assert (=> b!415309 (=> (not res!241590) (not e!248081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415309 (= res!241590 (validKeyInArray!0 k0!794))))

(declare-fun c!55028 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7024 0))(
  ( (tuple2!7025 (_1!3523 (_ BitVec 64)) (_2!3523 V!15365)) )
))
(declare-datatypes ((List!7046 0))(
  ( (Nil!7043) (Cons!7042 (h!7898 tuple2!7024) (t!12254 List!7046)) )
))
(declare-datatypes ((ListLongMap!5937 0))(
  ( (ListLongMap!5938 (toList!2984 List!7046)) )
))
(declare-fun call!28807 () ListLongMap!5937)

(declare-fun bm!28804 () Bool)

(declare-fun zeroValue!515 () V!15365)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!190222 () array!25249)

(declare-fun minValue!515 () V!15365)

(declare-fun getCurrentListMapNoExtraKeys!1190 (array!25247 array!25249 (_ BitVec 32) (_ BitVec 32) V!15365 V!15365 (_ BitVec 32) Int) ListLongMap!5937)

(assert (=> bm!28804 (= call!28807 (getCurrentListMapNoExtraKeys!1190 (ite c!55028 _keys!709 lt!190223) (ite c!55028 _values!549 lt!190222) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415310 () Bool)

(declare-fun e!248080 () Bool)

(declare-fun call!28808 () ListLongMap!5937)

(assert (=> b!415310 (= e!248080 (= call!28807 call!28808))))

(declare-fun b!415311 () Bool)

(declare-fun e!248085 () Bool)

(declare-fun e!248086 () Bool)

(assert (=> b!415311 (= e!248085 (not e!248086))))

(declare-fun res!241598 () Bool)

(assert (=> b!415311 (=> res!241598 e!248086)))

(assert (=> b!415311 (= res!241598 (validKeyInArray!0 (select (arr!12073 _keys!709) from!863)))))

(assert (=> b!415311 e!248080))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415311 (= c!55028 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12278 0))(
  ( (Unit!12279) )
))
(declare-fun lt!190221 () Unit!12278)

(declare-fun v!412 () V!15365)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!397 (array!25247 array!25249 (_ BitVec 32) (_ BitVec 32) V!15365 V!15365 (_ BitVec 32) (_ BitVec 64) V!15365 (_ BitVec 32) Int) Unit!12278)

(assert (=> b!415311 (= lt!190221 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!397 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415312 () Bool)

(declare-fun res!241597 () Bool)

(assert (=> b!415312 (=> (not res!241597) (not e!248088))))

(assert (=> b!415312 (= res!241597 (bvsle from!863 i!563))))

(declare-fun b!415313 () Bool)

(declare-fun res!241593 () Bool)

(assert (=> b!415313 (=> (not res!241593) (not e!248081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415313 (= res!241593 (validMask!0 mask!1025))))

(declare-fun b!415314 () Bool)

(declare-fun res!241596 () Bool)

(assert (=> b!415314 (=> (not res!241596) (not e!248081))))

(assert (=> b!415314 (= res!241596 (and (= (size!12426 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12425 _keys!709) (size!12426 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415315 () Bool)

(assert (=> b!415315 (= e!248081 e!248088)))

(declare-fun res!241591 () Bool)

(assert (=> b!415315 (=> (not res!241591) (not e!248088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25247 (_ BitVec 32)) Bool)

(assert (=> b!415315 (= res!241591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190223 mask!1025))))

(assert (=> b!415315 (= lt!190223 (array!25248 (store (arr!12073 _keys!709) i!563 k0!794) (size!12425 _keys!709)))))

(declare-fun b!415317 () Bool)

(declare-fun e!248082 () Bool)

(declare-fun tp_is_empty!10695 () Bool)

(assert (=> b!415317 (= e!248082 tp_is_empty!10695)))

(declare-fun b!415318 () Bool)

(assert (=> b!415318 (= e!248087 tp_is_empty!10695)))

(declare-fun mapIsEmpty!17664 () Bool)

(assert (=> mapIsEmpty!17664 mapRes!17664))

(declare-fun b!415319 () Bool)

(declare-fun res!241586 () Bool)

(assert (=> b!415319 (=> (not res!241586) (not e!248081))))

(assert (=> b!415319 (= res!241586 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12425 _keys!709))))))

(declare-fun b!415320 () Bool)

(declare-fun +!1188 (ListLongMap!5937 tuple2!7024) ListLongMap!5937)

(assert (=> b!415320 (= e!248080 (= call!28808 (+!1188 call!28807 (tuple2!7025 k0!794 v!412))))))

(declare-fun b!415321 () Bool)

(declare-fun e!248084 () Bool)

(assert (=> b!415321 (= e!248084 (and e!248082 mapRes!17664))))

(declare-fun condMapEmpty!17664 () Bool)

(declare-fun mapDefault!17664 () ValueCell!5004)

(assert (=> b!415321 (= condMapEmpty!17664 (= (arr!12074 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5004)) mapDefault!17664)))))

(declare-fun b!415322 () Bool)

(assert (=> b!415322 (= e!248086 true)))

(declare-fun lt!190219 () ListLongMap!5937)

(declare-fun get!5960 (ValueCell!5004 V!15365) V!15365)

(declare-fun dynLambda!665 (Int (_ BitVec 64)) V!15365)

(assert (=> b!415322 (= lt!190219 (+!1188 (getCurrentListMapNoExtraKeys!1190 lt!190223 lt!190222 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7025 (select (arr!12073 lt!190223) from!863) (get!5960 (select (arr!12074 lt!190222) from!863) (dynLambda!665 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415323 () Bool)

(declare-fun res!241599 () Bool)

(assert (=> b!415323 (=> (not res!241599) (not e!248081))))

(assert (=> b!415323 (= res!241599 (or (= (select (arr!12073 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12073 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!241588 () Bool)

(assert (=> start!39276 (=> (not res!241588) (not e!248081))))

(assert (=> start!39276 (= res!241588 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12425 _keys!709))))))

(assert (=> start!39276 e!248081))

(assert (=> start!39276 tp_is_empty!10695))

(assert (=> start!39276 tp!34158))

(assert (=> start!39276 true))

(declare-fun array_inv!8804 (array!25249) Bool)

(assert (=> start!39276 (and (array_inv!8804 _values!549) e!248084)))

(declare-fun array_inv!8805 (array!25247) Bool)

(assert (=> start!39276 (array_inv!8805 _keys!709)))

(declare-fun b!415316 () Bool)

(declare-fun res!241594 () Bool)

(assert (=> b!415316 (=> (not res!241594) (not e!248081))))

(assert (=> b!415316 (= res!241594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415324 () Bool)

(assert (=> b!415324 (= e!248088 e!248085)))

(declare-fun res!241592 () Bool)

(assert (=> b!415324 (=> (not res!241592) (not e!248085))))

(assert (=> b!415324 (= res!241592 (= from!863 i!563))))

(assert (=> b!415324 (= lt!190219 (getCurrentListMapNoExtraKeys!1190 lt!190223 lt!190222 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!415324 (= lt!190222 (array!25250 (store (arr!12074 _values!549) i!563 (ValueCellFull!5004 v!412)) (size!12426 _values!549)))))

(declare-fun lt!190220 () ListLongMap!5937)

(assert (=> b!415324 (= lt!190220 (getCurrentListMapNoExtraKeys!1190 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!28805 () Bool)

(assert (=> bm!28805 (= call!28808 (getCurrentListMapNoExtraKeys!1190 (ite c!55028 lt!190223 _keys!709) (ite c!55028 lt!190222 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39276 res!241588) b!415313))

(assert (= (and b!415313 res!241593) b!415314))

(assert (= (and b!415314 res!241596) b!415316))

(assert (= (and b!415316 res!241594) b!415307))

(assert (= (and b!415307 res!241595) b!415319))

(assert (= (and b!415319 res!241586) b!415309))

(assert (= (and b!415309 res!241590) b!415323))

(assert (= (and b!415323 res!241599) b!415308))

(assert (= (and b!415308 res!241589) b!415315))

(assert (= (and b!415315 res!241591) b!415306))

(assert (= (and b!415306 res!241587) b!415312))

(assert (= (and b!415312 res!241597) b!415324))

(assert (= (and b!415324 res!241592) b!415311))

(assert (= (and b!415311 c!55028) b!415320))

(assert (= (and b!415311 (not c!55028)) b!415310))

(assert (= (or b!415320 b!415310) bm!28805))

(assert (= (or b!415320 b!415310) bm!28804))

(assert (= (and b!415311 (not res!241598)) b!415322))

(assert (= (and b!415321 condMapEmpty!17664) mapIsEmpty!17664))

(assert (= (and b!415321 (not condMapEmpty!17664)) mapNonEmpty!17664))

(get-info :version)

(assert (= (and mapNonEmpty!17664 ((_ is ValueCellFull!5004) mapValue!17664)) b!415318))

(assert (= (and b!415321 ((_ is ValueCellFull!5004) mapDefault!17664)) b!415317))

(assert (= start!39276 b!415321))

(declare-fun b_lambda!8847 () Bool)

(assert (=> (not b_lambda!8847) (not b!415322)))

(declare-fun t!12252 () Bool)

(declare-fun tb!3165 () Bool)

(assert (=> (and start!39276 (= defaultEntry!557 defaultEntry!557) t!12252) tb!3165))

(declare-fun result!5857 () Bool)

(assert (=> tb!3165 (= result!5857 tp_is_empty!10695)))

(assert (=> b!415322 t!12252))

(declare-fun b_and!16963 () Bool)

(assert (= b_and!16961 (and (=> t!12252 result!5857) b_and!16963)))

(declare-fun m!404453 () Bool)

(assert (=> b!415316 m!404453))

(declare-fun m!404455 () Bool)

(assert (=> mapNonEmpty!17664 m!404455))

(declare-fun m!404457 () Bool)

(assert (=> b!415323 m!404457))

(declare-fun m!404459 () Bool)

(assert (=> b!415322 m!404459))

(declare-fun m!404461 () Bool)

(assert (=> b!415322 m!404461))

(declare-fun m!404463 () Bool)

(assert (=> b!415322 m!404463))

(declare-fun m!404465 () Bool)

(assert (=> b!415322 m!404465))

(assert (=> b!415322 m!404461))

(declare-fun m!404467 () Bool)

(assert (=> b!415322 m!404467))

(assert (=> b!415322 m!404463))

(declare-fun m!404469 () Bool)

(assert (=> b!415322 m!404469))

(assert (=> b!415322 m!404465))

(declare-fun m!404471 () Bool)

(assert (=> b!415308 m!404471))

(declare-fun m!404473 () Bool)

(assert (=> b!415313 m!404473))

(declare-fun m!404475 () Bool)

(assert (=> bm!28804 m!404475))

(declare-fun m!404477 () Bool)

(assert (=> b!415309 m!404477))

(declare-fun m!404479 () Bool)

(assert (=> b!415315 m!404479))

(declare-fun m!404481 () Bool)

(assert (=> b!415315 m!404481))

(declare-fun m!404483 () Bool)

(assert (=> start!39276 m!404483))

(declare-fun m!404485 () Bool)

(assert (=> start!39276 m!404485))

(declare-fun m!404487 () Bool)

(assert (=> b!415307 m!404487))

(declare-fun m!404489 () Bool)

(assert (=> b!415311 m!404489))

(assert (=> b!415311 m!404489))

(declare-fun m!404491 () Bool)

(assert (=> b!415311 m!404491))

(declare-fun m!404493 () Bool)

(assert (=> b!415311 m!404493))

(declare-fun m!404495 () Bool)

(assert (=> bm!28805 m!404495))

(declare-fun m!404497 () Bool)

(assert (=> b!415320 m!404497))

(declare-fun m!404499 () Bool)

(assert (=> b!415324 m!404499))

(declare-fun m!404501 () Bool)

(assert (=> b!415324 m!404501))

(declare-fun m!404503 () Bool)

(assert (=> b!415324 m!404503))

(declare-fun m!404505 () Bool)

(assert (=> b!415306 m!404505))

(check-sat (not b!415322) (not mapNonEmpty!17664) (not b!415316) (not b!415308) (not b!415307) (not b!415320) (not b!415313) (not b_next!9543) (not start!39276) (not b!415315) (not b!415306) (not bm!28805) b_and!16963 (not b!415311) (not bm!28804) tp_is_empty!10695 (not b!415324) (not b!415309) (not b_lambda!8847))
(check-sat b_and!16963 (not b_next!9543))
