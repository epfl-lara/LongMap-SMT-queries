; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38636 () Bool)

(assert start!38636)

(declare-fun b_free!9187 () Bool)

(declare-fun b_next!9187 () Bool)

(assert (=> start!38636 (= b_free!9187 (not b_next!9187))))

(declare-fun tp!32684 () Bool)

(declare-fun b_and!16587 () Bool)

(assert (=> start!38636 (= tp!32684 b_and!16587)))

(declare-fun b!401178 () Bool)

(declare-fun e!241939 () Bool)

(assert (=> b!401178 (= e!241939 (not true))))

(declare-fun e!241934 () Bool)

(assert (=> b!401178 e!241934))

(declare-fun c!54714 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401178 (= c!54714 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14531 0))(
  ( (V!14532 (val!5079 Int)) )
))
(declare-fun minValue!515 () V!14531)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4691 0))(
  ( (ValueCellFull!4691 (v!7327 V!14531)) (EmptyCell!4691) )
))
(declare-datatypes ((array!24022 0))(
  ( (array!24023 (arr!11460 (Array (_ BitVec 32) ValueCell!4691)) (size!11812 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24022)

(declare-fun zeroValue!515 () V!14531)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14531)

(declare-datatypes ((array!24024 0))(
  ( (array!24025 (arr!11461 (Array (_ BitVec 32) (_ BitVec 64))) (size!11813 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24024)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!12125 0))(
  ( (Unit!12126) )
))
(declare-fun lt!187806 () Unit!12125)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!330 (array!24024 array!24022 (_ BitVec 32) (_ BitVec 32) V!14531 V!14531 (_ BitVec 32) (_ BitVec 64) V!14531 (_ BitVec 32) Int) Unit!12125)

(assert (=> b!401178 (= lt!187806 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!330 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401179 () Bool)

(declare-datatypes ((tuple2!6602 0))(
  ( (tuple2!6603 (_1!3312 (_ BitVec 64)) (_2!3312 V!14531)) )
))
(declare-datatypes ((List!6523 0))(
  ( (Nil!6520) (Cons!6519 (h!7375 tuple2!6602) (t!11689 List!6523)) )
))
(declare-datatypes ((ListLongMap!5517 0))(
  ( (ListLongMap!5518 (toList!2774 List!6523)) )
))
(declare-fun call!28212 () ListLongMap!5517)

(declare-fun call!28213 () ListLongMap!5517)

(assert (=> b!401179 (= e!241934 (= call!28212 call!28213))))

(declare-fun lt!187805 () array!24024)

(declare-fun bm!28209 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1031 (array!24024 array!24022 (_ BitVec 32) (_ BitVec 32) V!14531 V!14531 (_ BitVec 32) Int) ListLongMap!5517)

(assert (=> bm!28209 (= call!28212 (getCurrentListMapNoExtraKeys!1031 (ite c!54714 _keys!709 lt!187805) (ite c!54714 _values!549 (array!24023 (store (arr!11460 _values!549) i!563 (ValueCellFull!4691 v!412)) (size!11812 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401180 () Bool)

(declare-fun res!230946 () Bool)

(declare-fun e!241936 () Bool)

(assert (=> b!401180 (=> (not res!230946) (not e!241936))))

(assert (=> b!401180 (= res!230946 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11813 _keys!709))))))

(declare-fun mapIsEmpty!16725 () Bool)

(declare-fun mapRes!16725 () Bool)

(assert (=> mapIsEmpty!16725 mapRes!16725))

(declare-fun b!401181 () Bool)

(declare-fun res!230937 () Bool)

(assert (=> b!401181 (=> (not res!230937) (not e!241936))))

(assert (=> b!401181 (= res!230937 (and (= (size!11812 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11813 _keys!709) (size!11812 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401182 () Bool)

(declare-fun +!1119 (ListLongMap!5517 tuple2!6602) ListLongMap!5517)

(assert (=> b!401182 (= e!241934 (= call!28213 (+!1119 call!28212 (tuple2!6603 k0!794 v!412))))))

(declare-fun b!401183 () Bool)

(declare-fun e!241937 () Bool)

(declare-fun tp_is_empty!10069 () Bool)

(assert (=> b!401183 (= e!241937 tp_is_empty!10069)))

(declare-fun b!401184 () Bool)

(declare-fun res!230939 () Bool)

(assert (=> b!401184 (=> (not res!230939) (not e!241936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24024 (_ BitVec 32)) Bool)

(assert (=> b!401184 (= res!230939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401185 () Bool)

(declare-fun res!230944 () Bool)

(assert (=> b!401185 (=> (not res!230944) (not e!241939))))

(declare-datatypes ((List!6524 0))(
  ( (Nil!6521) (Cons!6520 (h!7376 (_ BitVec 64)) (t!11690 List!6524)) )
))
(declare-fun arrayNoDuplicates!0 (array!24024 (_ BitVec 32) List!6524) Bool)

(assert (=> b!401185 (= res!230944 (arrayNoDuplicates!0 lt!187805 #b00000000000000000000000000000000 Nil!6521))))

(declare-fun mapNonEmpty!16725 () Bool)

(declare-fun tp!32685 () Bool)

(assert (=> mapNonEmpty!16725 (= mapRes!16725 (and tp!32685 e!241937))))

(declare-fun mapRest!16725 () (Array (_ BitVec 32) ValueCell!4691))

(declare-fun mapKey!16725 () (_ BitVec 32))

(declare-fun mapValue!16725 () ValueCell!4691)

(assert (=> mapNonEmpty!16725 (= (arr!11460 _values!549) (store mapRest!16725 mapKey!16725 mapValue!16725))))

(declare-fun res!230943 () Bool)

(assert (=> start!38636 (=> (not res!230943) (not e!241936))))

(assert (=> start!38636 (= res!230943 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11813 _keys!709))))))

(assert (=> start!38636 e!241936))

(assert (=> start!38636 tp_is_empty!10069))

(assert (=> start!38636 tp!32684))

(assert (=> start!38636 true))

(declare-fun e!241933 () Bool)

(declare-fun array_inv!8462 (array!24022) Bool)

(assert (=> start!38636 (and (array_inv!8462 _values!549) e!241933)))

(declare-fun array_inv!8463 (array!24024) Bool)

(assert (=> start!38636 (array_inv!8463 _keys!709)))

(declare-fun b!401186 () Bool)

(declare-fun res!230945 () Bool)

(assert (=> b!401186 (=> (not res!230945) (not e!241936))))

(declare-fun arrayContainsKey!0 (array!24024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401186 (= res!230945 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!401187 () Bool)

(declare-fun e!241938 () Bool)

(assert (=> b!401187 (= e!241933 (and e!241938 mapRes!16725))))

(declare-fun condMapEmpty!16725 () Bool)

(declare-fun mapDefault!16725 () ValueCell!4691)

(assert (=> b!401187 (= condMapEmpty!16725 (= (arr!11460 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4691)) mapDefault!16725)))))

(declare-fun b!401188 () Bool)

(declare-fun res!230938 () Bool)

(assert (=> b!401188 (=> (not res!230938) (not e!241936))))

(assert (=> b!401188 (= res!230938 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6521))))

(declare-fun bm!28210 () Bool)

(assert (=> bm!28210 (= call!28213 (getCurrentListMapNoExtraKeys!1031 (ite c!54714 lt!187805 _keys!709) (ite c!54714 (array!24023 (store (arr!11460 _values!549) i!563 (ValueCellFull!4691 v!412)) (size!11812 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401189 () Bool)

(declare-fun res!230940 () Bool)

(assert (=> b!401189 (=> (not res!230940) (not e!241936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401189 (= res!230940 (validMask!0 mask!1025))))

(declare-fun b!401190 () Bool)

(declare-fun res!230936 () Bool)

(assert (=> b!401190 (=> (not res!230936) (not e!241939))))

(assert (=> b!401190 (= res!230936 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11813 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401191 () Bool)

(assert (=> b!401191 (= e!241936 e!241939)))

(declare-fun res!230941 () Bool)

(assert (=> b!401191 (=> (not res!230941) (not e!241939))))

(assert (=> b!401191 (= res!230941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187805 mask!1025))))

(assert (=> b!401191 (= lt!187805 (array!24025 (store (arr!11461 _keys!709) i!563 k0!794) (size!11813 _keys!709)))))

(declare-fun b!401192 () Bool)

(declare-fun res!230942 () Bool)

(assert (=> b!401192 (=> (not res!230942) (not e!241936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401192 (= res!230942 (validKeyInArray!0 k0!794))))

(declare-fun b!401193 () Bool)

(declare-fun res!230935 () Bool)

(assert (=> b!401193 (=> (not res!230935) (not e!241936))))

(assert (=> b!401193 (= res!230935 (or (= (select (arr!11461 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11461 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401194 () Bool)

(assert (=> b!401194 (= e!241938 tp_is_empty!10069)))

(assert (= (and start!38636 res!230943) b!401189))

(assert (= (and b!401189 res!230940) b!401181))

(assert (= (and b!401181 res!230937) b!401184))

(assert (= (and b!401184 res!230939) b!401188))

(assert (= (and b!401188 res!230938) b!401180))

(assert (= (and b!401180 res!230946) b!401192))

(assert (= (and b!401192 res!230942) b!401193))

(assert (= (and b!401193 res!230935) b!401186))

(assert (= (and b!401186 res!230945) b!401191))

(assert (= (and b!401191 res!230941) b!401185))

(assert (= (and b!401185 res!230944) b!401190))

(assert (= (and b!401190 res!230936) b!401178))

(assert (= (and b!401178 c!54714) b!401182))

(assert (= (and b!401178 (not c!54714)) b!401179))

(assert (= (or b!401182 b!401179) bm!28210))

(assert (= (or b!401182 b!401179) bm!28209))

(assert (= (and b!401187 condMapEmpty!16725) mapIsEmpty!16725))

(assert (= (and b!401187 (not condMapEmpty!16725)) mapNonEmpty!16725))

(get-info :version)

(assert (= (and mapNonEmpty!16725 ((_ is ValueCellFull!4691) mapValue!16725)) b!401183))

(assert (= (and b!401187 ((_ is ValueCellFull!4691) mapDefault!16725)) b!401194))

(assert (= start!38636 b!401187))

(declare-fun m!395385 () Bool)

(assert (=> start!38636 m!395385))

(declare-fun m!395387 () Bool)

(assert (=> start!38636 m!395387))

(declare-fun m!395389 () Bool)

(assert (=> b!401188 m!395389))

(declare-fun m!395391 () Bool)

(assert (=> mapNonEmpty!16725 m!395391))

(declare-fun m!395393 () Bool)

(assert (=> b!401182 m!395393))

(declare-fun m!395395 () Bool)

(assert (=> b!401189 m!395395))

(declare-fun m!395397 () Bool)

(assert (=> bm!28209 m!395397))

(declare-fun m!395399 () Bool)

(assert (=> bm!28209 m!395399))

(declare-fun m!395401 () Bool)

(assert (=> b!401193 m!395401))

(declare-fun m!395403 () Bool)

(assert (=> b!401192 m!395403))

(declare-fun m!395405 () Bool)

(assert (=> b!401185 m!395405))

(declare-fun m!395407 () Bool)

(assert (=> b!401184 m!395407))

(declare-fun m!395409 () Bool)

(assert (=> b!401186 m!395409))

(declare-fun m!395411 () Bool)

(assert (=> b!401191 m!395411))

(declare-fun m!395413 () Bool)

(assert (=> b!401191 m!395413))

(assert (=> bm!28210 m!395397))

(declare-fun m!395415 () Bool)

(assert (=> bm!28210 m!395415))

(declare-fun m!395417 () Bool)

(assert (=> b!401178 m!395417))

(check-sat (not b!401192) (not start!38636) tp_is_empty!10069 (not b!401189) (not b!401191) (not b!401184) (not b!401186) b_and!16587 (not mapNonEmpty!16725) (not b_next!9187) (not b!401178) (not bm!28209) (not b!401188) (not bm!28210) (not b!401185) (not b!401182))
(check-sat b_and!16587 (not b_next!9187))
