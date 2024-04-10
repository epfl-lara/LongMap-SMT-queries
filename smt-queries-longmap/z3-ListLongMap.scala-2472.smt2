; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38652 () Bool)

(assert start!38652)

(declare-fun b_free!9189 () Bool)

(declare-fun b_next!9189 () Bool)

(assert (=> start!38652 (= b_free!9189 (not b_next!9189))))

(declare-fun tp!32691 () Bool)

(declare-fun b_and!16575 () Bool)

(assert (=> start!38652 (= tp!32691 b_and!16575)))

(declare-fun b!401278 () Bool)

(declare-fun res!230979 () Bool)

(declare-fun e!241992 () Bool)

(assert (=> b!401278 (=> (not res!230979) (not e!241992))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401278 (= res!230979 (validKeyInArray!0 k0!794))))

(declare-fun b!401279 () Bool)

(declare-fun e!241986 () Bool)

(assert (=> b!401279 (= e!241992 e!241986)))

(declare-fun res!230984 () Bool)

(assert (=> b!401279 (=> (not res!230984) (not e!241986))))

(declare-datatypes ((array!24049 0))(
  ( (array!24050 (arr!11474 (Array (_ BitVec 32) (_ BitVec 64))) (size!11826 (_ BitVec 32))) )
))
(declare-fun lt!187793 () array!24049)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24049 (_ BitVec 32)) Bool)

(assert (=> b!401279 (= res!230984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187793 mask!1025))))

(declare-fun _keys!709 () array!24049)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401279 (= lt!187793 (array!24050 (store (arr!11474 _keys!709) i!563 k0!794) (size!11826 _keys!709)))))

(declare-fun b!401280 () Bool)

(declare-fun res!230975 () Bool)

(assert (=> b!401280 (=> (not res!230975) (not e!241992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401280 (= res!230975 (validMask!0 mask!1025))))

(declare-fun res!230981 () Bool)

(assert (=> start!38652 (=> (not res!230981) (not e!241992))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38652 (= res!230981 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11826 _keys!709))))))

(assert (=> start!38652 e!241992))

(declare-fun tp_is_empty!10071 () Bool)

(assert (=> start!38652 tp_is_empty!10071))

(assert (=> start!38652 tp!32691))

(assert (=> start!38652 true))

(declare-datatypes ((V!14533 0))(
  ( (V!14534 (val!5080 Int)) )
))
(declare-datatypes ((ValueCell!4692 0))(
  ( (ValueCellFull!4692 (v!7327 V!14533)) (EmptyCell!4692) )
))
(declare-datatypes ((array!24051 0))(
  ( (array!24052 (arr!11475 (Array (_ BitVec 32) ValueCell!4692)) (size!11827 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24051)

(declare-fun e!241991 () Bool)

(declare-fun array_inv!8398 (array!24051) Bool)

(assert (=> start!38652 (and (array_inv!8398 _values!549) e!241991)))

(declare-fun array_inv!8399 (array!24049) Bool)

(assert (=> start!38652 (array_inv!8399 _keys!709)))

(declare-fun b!401281 () Bool)

(assert (=> b!401281 (= e!241986 (not true))))

(declare-fun e!241990 () Bool)

(assert (=> b!401281 e!241990))

(declare-fun c!54740 () Bool)

(assert (=> b!401281 (= c!54740 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14533)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14533)

(declare-datatypes ((Unit!12154 0))(
  ( (Unit!12155) )
))
(declare-fun lt!187792 () Unit!12154)

(declare-fun v!412 () V!14533)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!335 (array!24049 array!24051 (_ BitVec 32) (_ BitVec 32) V!14533 V!14533 (_ BitVec 32) (_ BitVec 64) V!14533 (_ BitVec 32) Int) Unit!12154)

(assert (=> b!401281 (= lt!187792 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!335 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401282 () Bool)

(declare-fun res!230985 () Bool)

(assert (=> b!401282 (=> (not res!230985) (not e!241992))))

(declare-datatypes ((List!6662 0))(
  ( (Nil!6659) (Cons!6658 (h!7514 (_ BitVec 64)) (t!11836 List!6662)) )
))
(declare-fun arrayNoDuplicates!0 (array!24049 (_ BitVec 32) List!6662) Bool)

(assert (=> b!401282 (= res!230985 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6659))))

(declare-fun b!401283 () Bool)

(declare-fun res!230977 () Bool)

(assert (=> b!401283 (=> (not res!230977) (not e!241992))))

(assert (=> b!401283 (= res!230977 (or (= (select (arr!11474 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11474 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401284 () Bool)

(declare-fun res!230976 () Bool)

(assert (=> b!401284 (=> (not res!230976) (not e!241986))))

(assert (=> b!401284 (= res!230976 (arrayNoDuplicates!0 lt!187793 #b00000000000000000000000000000000 Nil!6659))))

(declare-fun b!401285 () Bool)

(declare-fun res!230980 () Bool)

(assert (=> b!401285 (=> (not res!230980) (not e!241992))))

(declare-fun arrayContainsKey!0 (array!24049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401285 (= res!230980 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun bm!28228 () Bool)

(declare-datatypes ((tuple2!6738 0))(
  ( (tuple2!6739 (_1!3380 (_ BitVec 64)) (_2!3380 V!14533)) )
))
(declare-datatypes ((List!6663 0))(
  ( (Nil!6660) (Cons!6659 (h!7515 tuple2!6738) (t!11837 List!6663)) )
))
(declare-datatypes ((ListLongMap!5651 0))(
  ( (ListLongMap!5652 (toList!2841 List!6663)) )
))
(declare-fun call!28231 () ListLongMap!5651)

(declare-fun getCurrentListMapNoExtraKeys!1053 (array!24049 array!24051 (_ BitVec 32) (_ BitVec 32) V!14533 V!14533 (_ BitVec 32) Int) ListLongMap!5651)

(assert (=> bm!28228 (= call!28231 (getCurrentListMapNoExtraKeys!1053 (ite c!54740 lt!187793 _keys!709) (ite c!54740 (array!24052 (store (arr!11475 _values!549) i!563 (ValueCellFull!4692 v!412)) (size!11827 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16728 () Bool)

(declare-fun mapRes!16728 () Bool)

(assert (=> mapIsEmpty!16728 mapRes!16728))

(declare-fun b!401286 () Bool)

(declare-fun call!28232 () ListLongMap!5651)

(assert (=> b!401286 (= e!241990 (= call!28232 call!28231))))

(declare-fun b!401287 () Bool)

(declare-fun +!1125 (ListLongMap!5651 tuple2!6738) ListLongMap!5651)

(assert (=> b!401287 (= e!241990 (= call!28231 (+!1125 call!28232 (tuple2!6739 k0!794 v!412))))))

(declare-fun b!401288 () Bool)

(declare-fun e!241988 () Bool)

(assert (=> b!401288 (= e!241988 tp_is_empty!10071)))

(declare-fun b!401289 () Bool)

(assert (=> b!401289 (= e!241991 (and e!241988 mapRes!16728))))

(declare-fun condMapEmpty!16728 () Bool)

(declare-fun mapDefault!16728 () ValueCell!4692)

(assert (=> b!401289 (= condMapEmpty!16728 (= (arr!11475 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4692)) mapDefault!16728)))))

(declare-fun b!401290 () Bool)

(declare-fun res!230982 () Bool)

(assert (=> b!401290 (=> (not res!230982) (not e!241992))))

(assert (=> b!401290 (= res!230982 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11826 _keys!709))))))

(declare-fun b!401291 () Bool)

(declare-fun e!241987 () Bool)

(assert (=> b!401291 (= e!241987 tp_is_empty!10071)))

(declare-fun mapNonEmpty!16728 () Bool)

(declare-fun tp!32690 () Bool)

(assert (=> mapNonEmpty!16728 (= mapRes!16728 (and tp!32690 e!241987))))

(declare-fun mapValue!16728 () ValueCell!4692)

(declare-fun mapRest!16728 () (Array (_ BitVec 32) ValueCell!4692))

(declare-fun mapKey!16728 () (_ BitVec 32))

(assert (=> mapNonEmpty!16728 (= (arr!11475 _values!549) (store mapRest!16728 mapKey!16728 mapValue!16728))))

(declare-fun bm!28229 () Bool)

(assert (=> bm!28229 (= call!28232 (getCurrentListMapNoExtraKeys!1053 (ite c!54740 _keys!709 lt!187793) (ite c!54740 _values!549 (array!24052 (store (arr!11475 _values!549) i!563 (ValueCellFull!4692 v!412)) (size!11827 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401292 () Bool)

(declare-fun res!230974 () Bool)

(assert (=> b!401292 (=> (not res!230974) (not e!241986))))

(assert (=> b!401292 (= res!230974 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11826 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401293 () Bool)

(declare-fun res!230978 () Bool)

(assert (=> b!401293 (=> (not res!230978) (not e!241992))))

(assert (=> b!401293 (= res!230978 (and (= (size!11827 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11826 _keys!709) (size!11827 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401294 () Bool)

(declare-fun res!230983 () Bool)

(assert (=> b!401294 (=> (not res!230983) (not e!241992))))

(assert (=> b!401294 (= res!230983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38652 res!230981) b!401280))

(assert (= (and b!401280 res!230975) b!401293))

(assert (= (and b!401293 res!230978) b!401294))

(assert (= (and b!401294 res!230983) b!401282))

(assert (= (and b!401282 res!230985) b!401290))

(assert (= (and b!401290 res!230982) b!401278))

(assert (= (and b!401278 res!230979) b!401283))

(assert (= (and b!401283 res!230977) b!401285))

(assert (= (and b!401285 res!230980) b!401279))

(assert (= (and b!401279 res!230984) b!401284))

(assert (= (and b!401284 res!230976) b!401292))

(assert (= (and b!401292 res!230974) b!401281))

(assert (= (and b!401281 c!54740) b!401287))

(assert (= (and b!401281 (not c!54740)) b!401286))

(assert (= (or b!401287 b!401286) bm!28228))

(assert (= (or b!401287 b!401286) bm!28229))

(assert (= (and b!401289 condMapEmpty!16728) mapIsEmpty!16728))

(assert (= (and b!401289 (not condMapEmpty!16728)) mapNonEmpty!16728))

(get-info :version)

(assert (= (and mapNonEmpty!16728 ((_ is ValueCellFull!4692) mapValue!16728)) b!401291))

(assert (= (and b!401289 ((_ is ValueCellFull!4692) mapDefault!16728)) b!401288))

(assert (= start!38652 b!401289))

(declare-fun m!395189 () Bool)

(assert (=> b!401281 m!395189))

(declare-fun m!395191 () Bool)

(assert (=> bm!28228 m!395191))

(declare-fun m!395193 () Bool)

(assert (=> bm!28228 m!395193))

(declare-fun m!395195 () Bool)

(assert (=> b!401294 m!395195))

(declare-fun m!395197 () Bool)

(assert (=> b!401283 m!395197))

(declare-fun m!395199 () Bool)

(assert (=> b!401287 m!395199))

(declare-fun m!395201 () Bool)

(assert (=> b!401280 m!395201))

(declare-fun m!395203 () Bool)

(assert (=> mapNonEmpty!16728 m!395203))

(declare-fun m!395205 () Bool)

(assert (=> b!401284 m!395205))

(declare-fun m!395207 () Bool)

(assert (=> b!401282 m!395207))

(assert (=> bm!28229 m!395191))

(declare-fun m!395209 () Bool)

(assert (=> bm!28229 m!395209))

(declare-fun m!395211 () Bool)

(assert (=> b!401285 m!395211))

(declare-fun m!395213 () Bool)

(assert (=> b!401278 m!395213))

(declare-fun m!395215 () Bool)

(assert (=> start!38652 m!395215))

(declare-fun m!395217 () Bool)

(assert (=> start!38652 m!395217))

(declare-fun m!395219 () Bool)

(assert (=> b!401279 m!395219))

(declare-fun m!395221 () Bool)

(assert (=> b!401279 m!395221))

(check-sat (not b!401279) (not bm!28228) (not b!401278) (not b_next!9189) (not start!38652) (not b!401281) (not b!401280) (not b!401282) (not b!401287) (not b!401294) (not bm!28229) b_and!16575 (not mapNonEmpty!16728) tp_is_empty!10071 (not b!401285) (not b!401284))
(check-sat b_and!16575 (not b_next!9189))
