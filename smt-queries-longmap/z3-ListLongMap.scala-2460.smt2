; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38564 () Bool)

(assert start!38564)

(declare-fun b_free!9115 () Bool)

(declare-fun b_next!9115 () Bool)

(assert (=> start!38564 (= b_free!9115 (not b_next!9115))))

(declare-fun tp!32469 () Bool)

(declare-fun b_and!16515 () Bool)

(assert (=> start!38564 (= tp!32469 b_and!16515)))

(declare-fun mapNonEmpty!16617 () Bool)

(declare-fun mapRes!16617 () Bool)

(declare-fun tp!32468 () Bool)

(declare-fun e!241180 () Bool)

(assert (=> mapNonEmpty!16617 (= mapRes!16617 (and tp!32468 e!241180))))

(declare-datatypes ((V!14435 0))(
  ( (V!14436 (val!5043 Int)) )
))
(declare-datatypes ((ValueCell!4655 0))(
  ( (ValueCellFull!4655 (v!7291 V!14435)) (EmptyCell!4655) )
))
(declare-fun mapValue!16617 () ValueCell!4655)

(declare-fun mapKey!16617 () (_ BitVec 32))

(declare-datatypes ((array!23884 0))(
  ( (array!23885 (arr!11391 (Array (_ BitVec 32) ValueCell!4655)) (size!11743 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23884)

(declare-fun mapRest!16617 () (Array (_ BitVec 32) ValueCell!4655))

(assert (=> mapNonEmpty!16617 (= (arr!11391 _values!549) (store mapRest!16617 mapKey!16617 mapValue!16617))))

(declare-fun b!399342 () Bool)

(declare-fun e!241181 () Bool)

(declare-fun e!241178 () Bool)

(assert (=> b!399342 (= e!241181 (and e!241178 mapRes!16617))))

(declare-fun condMapEmpty!16617 () Bool)

(declare-fun mapDefault!16617 () ValueCell!4655)

(assert (=> b!399342 (= condMapEmpty!16617 (= (arr!11391 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4655)) mapDefault!16617)))))

(declare-fun b!399343 () Bool)

(declare-fun res!229648 () Bool)

(declare-fun e!241182 () Bool)

(assert (=> b!399343 (=> (not res!229648) (not e!241182))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23886 0))(
  ( (array!23887 (arr!11392 (Array (_ BitVec 32) (_ BitVec 64))) (size!11744 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23886)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!399343 (= res!229648 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11744 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399344 () Bool)

(declare-fun res!229640 () Bool)

(declare-fun e!241177 () Bool)

(assert (=> b!399344 (=> (not res!229640) (not e!241177))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399344 (= res!229640 (validKeyInArray!0 k0!794))))

(declare-fun b!399345 () Bool)

(declare-fun tp_is_empty!9997 () Bool)

(assert (=> b!399345 (= e!241180 tp_is_empty!9997)))

(declare-fun b!399346 () Bool)

(declare-fun res!229650 () Bool)

(assert (=> b!399346 (=> (not res!229650) (not e!241177))))

(assert (=> b!399346 (= res!229650 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11744 _keys!709))))))

(declare-fun b!399347 () Bool)

(declare-fun res!229641 () Bool)

(assert (=> b!399347 (=> (not res!229641) (not e!241177))))

(declare-fun arrayContainsKey!0 (array!23886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399347 (= res!229641 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399348 () Bool)

(declare-fun res!229639 () Bool)

(assert (=> b!399348 (=> (not res!229639) (not e!241177))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399348 (= res!229639 (validMask!0 mask!1025))))

(declare-datatypes ((tuple2!6542 0))(
  ( (tuple2!6543 (_1!3282 (_ BitVec 64)) (_2!3282 V!14435)) )
))
(declare-datatypes ((List!6462 0))(
  ( (Nil!6459) (Cons!6458 (h!7314 tuple2!6542) (t!11628 List!6462)) )
))
(declare-datatypes ((ListLongMap!5457 0))(
  ( (ListLongMap!5458 (toList!2744 List!6462)) )
))
(declare-fun call!27996 () ListLongMap!5457)

(declare-fun b!399349 () Bool)

(declare-fun call!27997 () ListLongMap!5457)

(declare-fun e!241183 () Bool)

(declare-fun v!412 () V!14435)

(declare-fun +!1093 (ListLongMap!5457 tuple2!6542) ListLongMap!5457)

(assert (=> b!399349 (= e!241183 (= call!27997 (+!1093 call!27996 (tuple2!6543 k0!794 v!412))))))

(declare-fun b!399350 () Bool)

(declare-fun res!229645 () Bool)

(assert (=> b!399350 (=> (not res!229645) (not e!241177))))

(declare-datatypes ((List!6463 0))(
  ( (Nil!6460) (Cons!6459 (h!7315 (_ BitVec 64)) (t!11629 List!6463)) )
))
(declare-fun arrayNoDuplicates!0 (array!23886 (_ BitVec 32) List!6463) Bool)

(assert (=> b!399350 (= res!229645 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6460))))

(declare-fun bm!27993 () Bool)

(declare-fun minValue!515 () V!14435)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14435)

(declare-fun c!54606 () Bool)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!187589 () array!23886)

(declare-fun getCurrentListMapNoExtraKeys!1002 (array!23886 array!23884 (_ BitVec 32) (_ BitVec 32) V!14435 V!14435 (_ BitVec 32) Int) ListLongMap!5457)

(assert (=> bm!27993 (= call!27997 (getCurrentListMapNoExtraKeys!1002 (ite c!54606 lt!187589 _keys!709) (ite c!54606 (array!23885 (store (arr!11391 _values!549) i!563 (ValueCellFull!4655 v!412)) (size!11743 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399351 () Bool)

(assert (=> b!399351 (= e!241183 (= call!27996 call!27997))))

(declare-fun b!399352 () Bool)

(declare-fun res!229649 () Bool)

(assert (=> b!399352 (=> (not res!229649) (not e!241177))))

(assert (=> b!399352 (= res!229649 (and (= (size!11743 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11744 _keys!709) (size!11743 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!229644 () Bool)

(assert (=> start!38564 (=> (not res!229644) (not e!241177))))

(assert (=> start!38564 (= res!229644 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11744 _keys!709))))))

(assert (=> start!38564 e!241177))

(assert (=> start!38564 tp_is_empty!9997))

(assert (=> start!38564 tp!32469))

(assert (=> start!38564 true))

(declare-fun array_inv!8412 (array!23884) Bool)

(assert (=> start!38564 (and (array_inv!8412 _values!549) e!241181)))

(declare-fun array_inv!8413 (array!23886) Bool)

(assert (=> start!38564 (array_inv!8413 _keys!709)))

(declare-fun mapIsEmpty!16617 () Bool)

(assert (=> mapIsEmpty!16617 mapRes!16617))

(declare-fun b!399353 () Bool)

(assert (=> b!399353 (= e!241182 (not true))))

(assert (=> b!399353 e!241183))

(assert (=> b!399353 (= c!54606 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12075 0))(
  ( (Unit!12076) )
))
(declare-fun lt!187590 () Unit!12075)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!305 (array!23886 array!23884 (_ BitVec 32) (_ BitVec 32) V!14435 V!14435 (_ BitVec 32) (_ BitVec 64) V!14435 (_ BitVec 32) Int) Unit!12075)

(assert (=> b!399353 (= lt!187590 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!305 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399354 () Bool)

(declare-fun res!229647 () Bool)

(assert (=> b!399354 (=> (not res!229647) (not e!241177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23886 (_ BitVec 32)) Bool)

(assert (=> b!399354 (= res!229647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!27994 () Bool)

(assert (=> bm!27994 (= call!27996 (getCurrentListMapNoExtraKeys!1002 (ite c!54606 _keys!709 lt!187589) (ite c!54606 _values!549 (array!23885 (store (arr!11391 _values!549) i!563 (ValueCellFull!4655 v!412)) (size!11743 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399355 () Bool)

(declare-fun res!229646 () Bool)

(assert (=> b!399355 (=> (not res!229646) (not e!241182))))

(assert (=> b!399355 (= res!229646 (arrayNoDuplicates!0 lt!187589 #b00000000000000000000000000000000 Nil!6460))))

(declare-fun b!399356 () Bool)

(assert (=> b!399356 (= e!241178 tp_is_empty!9997)))

(declare-fun b!399357 () Bool)

(declare-fun res!229643 () Bool)

(assert (=> b!399357 (=> (not res!229643) (not e!241177))))

(assert (=> b!399357 (= res!229643 (or (= (select (arr!11392 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11392 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399358 () Bool)

(assert (=> b!399358 (= e!241177 e!241182)))

(declare-fun res!229642 () Bool)

(assert (=> b!399358 (=> (not res!229642) (not e!241182))))

(assert (=> b!399358 (= res!229642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187589 mask!1025))))

(assert (=> b!399358 (= lt!187589 (array!23887 (store (arr!11392 _keys!709) i!563 k0!794) (size!11744 _keys!709)))))

(assert (= (and start!38564 res!229644) b!399348))

(assert (= (and b!399348 res!229639) b!399352))

(assert (= (and b!399352 res!229649) b!399354))

(assert (= (and b!399354 res!229647) b!399350))

(assert (= (and b!399350 res!229645) b!399346))

(assert (= (and b!399346 res!229650) b!399344))

(assert (= (and b!399344 res!229640) b!399357))

(assert (= (and b!399357 res!229643) b!399347))

(assert (= (and b!399347 res!229641) b!399358))

(assert (= (and b!399358 res!229642) b!399355))

(assert (= (and b!399355 res!229646) b!399343))

(assert (= (and b!399343 res!229648) b!399353))

(assert (= (and b!399353 c!54606) b!399349))

(assert (= (and b!399353 (not c!54606)) b!399351))

(assert (= (or b!399349 b!399351) bm!27993))

(assert (= (or b!399349 b!399351) bm!27994))

(assert (= (and b!399342 condMapEmpty!16617) mapIsEmpty!16617))

(assert (= (and b!399342 (not condMapEmpty!16617)) mapNonEmpty!16617))

(get-info :version)

(assert (= (and mapNonEmpty!16617 ((_ is ValueCellFull!4655) mapValue!16617)) b!399345))

(assert (= (and b!399342 ((_ is ValueCellFull!4655) mapDefault!16617)) b!399356))

(assert (= start!38564 b!399342))

(declare-fun m!394161 () Bool)

(assert (=> bm!27993 m!394161))

(declare-fun m!394163 () Bool)

(assert (=> bm!27993 m!394163))

(assert (=> bm!27994 m!394161))

(declare-fun m!394165 () Bool)

(assert (=> bm!27994 m!394165))

(declare-fun m!394167 () Bool)

(assert (=> b!399344 m!394167))

(declare-fun m!394169 () Bool)

(assert (=> b!399353 m!394169))

(declare-fun m!394171 () Bool)

(assert (=> b!399348 m!394171))

(declare-fun m!394173 () Bool)

(assert (=> b!399347 m!394173))

(declare-fun m!394175 () Bool)

(assert (=> b!399350 m!394175))

(declare-fun m!394177 () Bool)

(assert (=> start!38564 m!394177))

(declare-fun m!394179 () Bool)

(assert (=> start!38564 m!394179))

(declare-fun m!394181 () Bool)

(assert (=> mapNonEmpty!16617 m!394181))

(declare-fun m!394183 () Bool)

(assert (=> b!399358 m!394183))

(declare-fun m!394185 () Bool)

(assert (=> b!399358 m!394185))

(declare-fun m!394187 () Bool)

(assert (=> b!399355 m!394187))

(declare-fun m!394189 () Bool)

(assert (=> b!399354 m!394189))

(declare-fun m!394191 () Bool)

(assert (=> b!399349 m!394191))

(declare-fun m!394193 () Bool)

(assert (=> b!399357 m!394193))

(check-sat (not bm!27994) (not mapNonEmpty!16617) b_and!16515 (not b!399358) (not b!399344) (not b!399349) (not b!399350) (not b_next!9115) (not b!399354) (not b!399347) (not bm!27993) (not b!399355) (not b!399348) (not b!399353) tp_is_empty!9997 (not start!38564))
(check-sat b_and!16515 (not b_next!9115))
