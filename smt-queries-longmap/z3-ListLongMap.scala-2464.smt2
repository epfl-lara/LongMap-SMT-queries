; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38604 () Bool)

(assert start!38604)

(declare-fun b_free!9141 () Bool)

(declare-fun b_next!9141 () Bool)

(assert (=> start!38604 (= b_free!9141 (not b_next!9141))))

(declare-fun tp!32547 () Bool)

(declare-fun b_and!16527 () Bool)

(assert (=> start!38604 (= tp!32547 b_and!16527)))

(declare-fun b!400054 () Bool)

(declare-fun e!241483 () Bool)

(declare-datatypes ((V!14469 0))(
  ( (V!14470 (val!5056 Int)) )
))
(declare-datatypes ((tuple2!6700 0))(
  ( (tuple2!6701 (_1!3361 (_ BitVec 64)) (_2!3361 V!14469)) )
))
(declare-datatypes ((List!6624 0))(
  ( (Nil!6621) (Cons!6620 (h!7476 tuple2!6700) (t!11798 List!6624)) )
))
(declare-datatypes ((ListLongMap!5613 0))(
  ( (ListLongMap!5614 (toList!2822 List!6624)) )
))
(declare-fun call!28087 () ListLongMap!5613)

(declare-fun call!28088 () ListLongMap!5613)

(assert (=> b!400054 (= e!241483 (= call!28087 call!28088))))

(declare-fun b!400055 () Bool)

(declare-fun res!230113 () Bool)

(declare-fun e!241488 () Bool)

(assert (=> b!400055 (=> (not res!230113) (not e!241488))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4668 0))(
  ( (ValueCellFull!4668 (v!7303 V!14469)) (EmptyCell!4668) )
))
(declare-datatypes ((array!23957 0))(
  ( (array!23958 (arr!11428 (Array (_ BitVec 32) ValueCell!4668)) (size!11780 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23957)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23959 0))(
  ( (array!23960 (arr!11429 (Array (_ BitVec 32) (_ BitVec 64))) (size!11781 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23959)

(assert (=> b!400055 (= res!230113 (and (= (size!11780 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11781 _keys!709) (size!11780 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400056 () Bool)

(declare-fun e!241482 () Bool)

(declare-fun e!241484 () Bool)

(declare-fun mapRes!16656 () Bool)

(assert (=> b!400056 (= e!241482 (and e!241484 mapRes!16656))))

(declare-fun condMapEmpty!16656 () Bool)

(declare-fun mapDefault!16656 () ValueCell!4668)

(assert (=> b!400056 (= condMapEmpty!16656 (= (arr!11428 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4668)) mapDefault!16656)))))

(declare-fun b!400057 () Bool)

(declare-fun res!230112 () Bool)

(assert (=> b!400057 (=> (not res!230112) (not e!241488))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400057 (= res!230112 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16656 () Bool)

(declare-fun tp!32546 () Bool)

(declare-fun e!241486 () Bool)

(assert (=> mapNonEmpty!16656 (= mapRes!16656 (and tp!32546 e!241486))))

(declare-fun mapKey!16656 () (_ BitVec 32))

(declare-fun mapValue!16656 () ValueCell!4668)

(declare-fun mapRest!16656 () (Array (_ BitVec 32) ValueCell!4668))

(assert (=> mapNonEmpty!16656 (= (arr!11428 _values!549) (store mapRest!16656 mapKey!16656 mapValue!16656))))

(declare-fun b!400058 () Bool)

(declare-fun res!230121 () Bool)

(declare-fun e!241487 () Bool)

(assert (=> b!400058 (=> (not res!230121) (not e!241487))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400058 (= res!230121 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11781 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun v!412 () V!14469)

(declare-fun b!400059 () Bool)

(declare-fun +!1110 (ListLongMap!5613 tuple2!6700) ListLongMap!5613)

(assert (=> b!400059 (= e!241483 (= call!28088 (+!1110 call!28087 (tuple2!6701 k0!794 v!412))))))

(declare-fun b!400060 () Bool)

(declare-fun res!230118 () Bool)

(assert (=> b!400060 (=> (not res!230118) (not e!241488))))

(declare-fun arrayContainsKey!0 (array!23959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400060 (= res!230118 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400061 () Bool)

(declare-fun res!230117 () Bool)

(assert (=> b!400061 (=> (not res!230117) (not e!241488))))

(assert (=> b!400061 (= res!230117 (or (= (select (arr!11429 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11429 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!515 () V!14469)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14469)

(declare-fun bm!28084 () Bool)

(declare-fun lt!187649 () array!23959)

(declare-fun c!54668 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1038 (array!23959 array!23957 (_ BitVec 32) (_ BitVec 32) V!14469 V!14469 (_ BitVec 32) Int) ListLongMap!5613)

(assert (=> bm!28084 (= call!28087 (getCurrentListMapNoExtraKeys!1038 (ite c!54668 _keys!709 lt!187649) (ite c!54668 _values!549 (array!23958 (store (arr!11428 _values!549) i!563 (ValueCellFull!4668 v!412)) (size!11780 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16656 () Bool)

(assert (=> mapIsEmpty!16656 mapRes!16656))

(declare-fun b!400062 () Bool)

(assert (=> b!400062 (= e!241487 (not true))))

(assert (=> b!400062 e!241483))

(assert (=> b!400062 (= c!54668 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12124 0))(
  ( (Unit!12125) )
))
(declare-fun lt!187648 () Unit!12124)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!320 (array!23959 array!23957 (_ BitVec 32) (_ BitVec 32) V!14469 V!14469 (_ BitVec 32) (_ BitVec 64) V!14469 (_ BitVec 32) Int) Unit!12124)

(assert (=> b!400062 (= lt!187648 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!320 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400063 () Bool)

(declare-fun res!230116 () Bool)

(assert (=> b!400063 (=> (not res!230116) (not e!241487))))

(declare-datatypes ((List!6625 0))(
  ( (Nil!6622) (Cons!6621 (h!7477 (_ BitVec 64)) (t!11799 List!6625)) )
))
(declare-fun arrayNoDuplicates!0 (array!23959 (_ BitVec 32) List!6625) Bool)

(assert (=> b!400063 (= res!230116 (arrayNoDuplicates!0 lt!187649 #b00000000000000000000000000000000 Nil!6622))))

(declare-fun b!400064 () Bool)

(declare-fun res!230114 () Bool)

(assert (=> b!400064 (=> (not res!230114) (not e!241488))))

(assert (=> b!400064 (= res!230114 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11781 _keys!709))))))

(declare-fun res!230111 () Bool)

(assert (=> start!38604 (=> (not res!230111) (not e!241488))))

(assert (=> start!38604 (= res!230111 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11781 _keys!709))))))

(assert (=> start!38604 e!241488))

(declare-fun tp_is_empty!10023 () Bool)

(assert (=> start!38604 tp_is_empty!10023))

(assert (=> start!38604 tp!32547))

(assert (=> start!38604 true))

(declare-fun array_inv!8370 (array!23957) Bool)

(assert (=> start!38604 (and (array_inv!8370 _values!549) e!241482)))

(declare-fun array_inv!8371 (array!23959) Bool)

(assert (=> start!38604 (array_inv!8371 _keys!709)))

(declare-fun b!400065 () Bool)

(declare-fun res!230115 () Bool)

(assert (=> b!400065 (=> (not res!230115) (not e!241488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400065 (= res!230115 (validMask!0 mask!1025))))

(declare-fun b!400066 () Bool)

(declare-fun res!230119 () Bool)

(assert (=> b!400066 (=> (not res!230119) (not e!241488))))

(assert (=> b!400066 (= res!230119 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6622))))

(declare-fun bm!28085 () Bool)

(assert (=> bm!28085 (= call!28088 (getCurrentListMapNoExtraKeys!1038 (ite c!54668 lt!187649 _keys!709) (ite c!54668 (array!23958 (store (arr!11428 _values!549) i!563 (ValueCellFull!4668 v!412)) (size!11780 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400067 () Bool)

(assert (=> b!400067 (= e!241486 tp_is_empty!10023)))

(declare-fun b!400068 () Bool)

(assert (=> b!400068 (= e!241484 tp_is_empty!10023)))

(declare-fun b!400069 () Bool)

(declare-fun res!230120 () Bool)

(assert (=> b!400069 (=> (not res!230120) (not e!241488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23959 (_ BitVec 32)) Bool)

(assert (=> b!400069 (= res!230120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400070 () Bool)

(assert (=> b!400070 (= e!241488 e!241487)))

(declare-fun res!230110 () Bool)

(assert (=> b!400070 (=> (not res!230110) (not e!241487))))

(assert (=> b!400070 (= res!230110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187649 mask!1025))))

(assert (=> b!400070 (= lt!187649 (array!23960 (store (arr!11429 _keys!709) i!563 k0!794) (size!11781 _keys!709)))))

(assert (= (and start!38604 res!230111) b!400065))

(assert (= (and b!400065 res!230115) b!400055))

(assert (= (and b!400055 res!230113) b!400069))

(assert (= (and b!400069 res!230120) b!400066))

(assert (= (and b!400066 res!230119) b!400064))

(assert (= (and b!400064 res!230114) b!400057))

(assert (= (and b!400057 res!230112) b!400061))

(assert (= (and b!400061 res!230117) b!400060))

(assert (= (and b!400060 res!230118) b!400070))

(assert (= (and b!400070 res!230110) b!400063))

(assert (= (and b!400063 res!230116) b!400058))

(assert (= (and b!400058 res!230121) b!400062))

(assert (= (and b!400062 c!54668) b!400059))

(assert (= (and b!400062 (not c!54668)) b!400054))

(assert (= (or b!400059 b!400054) bm!28085))

(assert (= (or b!400059 b!400054) bm!28084))

(assert (= (and b!400056 condMapEmpty!16656) mapIsEmpty!16656))

(assert (= (and b!400056 (not condMapEmpty!16656)) mapNonEmpty!16656))

(get-info :version)

(assert (= (and mapNonEmpty!16656 ((_ is ValueCellFull!4668) mapValue!16656)) b!400067))

(assert (= (and b!400056 ((_ is ValueCellFull!4668) mapDefault!16656)) b!400068))

(assert (= start!38604 b!400056))

(declare-fun m!394373 () Bool)

(assert (=> b!400065 m!394373))

(declare-fun m!394375 () Bool)

(assert (=> b!400062 m!394375))

(declare-fun m!394377 () Bool)

(assert (=> b!400070 m!394377))

(declare-fun m!394379 () Bool)

(assert (=> b!400070 m!394379))

(declare-fun m!394381 () Bool)

(assert (=> b!400066 m!394381))

(declare-fun m!394383 () Bool)

(assert (=> b!400061 m!394383))

(declare-fun m!394385 () Bool)

(assert (=> mapNonEmpty!16656 m!394385))

(declare-fun m!394387 () Bool)

(assert (=> start!38604 m!394387))

(declare-fun m!394389 () Bool)

(assert (=> start!38604 m!394389))

(declare-fun m!394391 () Bool)

(assert (=> b!400063 m!394391))

(declare-fun m!394393 () Bool)

(assert (=> b!400057 m!394393))

(declare-fun m!394395 () Bool)

(assert (=> b!400059 m!394395))

(declare-fun m!394397 () Bool)

(assert (=> bm!28085 m!394397))

(declare-fun m!394399 () Bool)

(assert (=> bm!28085 m!394399))

(declare-fun m!394401 () Bool)

(assert (=> b!400060 m!394401))

(declare-fun m!394403 () Bool)

(assert (=> b!400069 m!394403))

(assert (=> bm!28084 m!394397))

(declare-fun m!394405 () Bool)

(assert (=> bm!28084 m!394405))

(check-sat (not b!400066) (not b!400070) (not bm!28084) (not b!400060) (not b!400069) (not b!400063) (not start!38604) (not b!400062) (not mapNonEmpty!16656) (not b_next!9141) (not b!400059) b_and!16527 (not bm!28085) (not b!400057) (not b!400065) tp_is_empty!10023)
(check-sat b_and!16527 (not b_next!9141))
