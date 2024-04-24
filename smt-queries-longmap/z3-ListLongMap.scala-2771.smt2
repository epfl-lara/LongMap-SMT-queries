; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40464 () Bool)

(assert start!40464)

(declare-fun b_free!10549 () Bool)

(declare-fun b_next!10549 () Bool)

(assert (=> start!40464 (= b_free!10549 (not b_next!10549))))

(declare-fun tp!37425 () Bool)

(declare-fun b_and!18547 () Bool)

(assert (=> start!40464 (= tp!37425 b_and!18547)))

(declare-fun b!445707 () Bool)

(declare-fun res!264527 () Bool)

(declare-fun e!261929 () Bool)

(assert (=> b!445707 (=> (not res!264527) (not e!261929))))

(declare-datatypes ((array!27538 0))(
  ( (array!27539 (arr!13216 (Array (_ BitVec 32) (_ BitVec 64))) (size!13568 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27538)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445707 (= res!264527 (or (= (select (arr!13216 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13216 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445708 () Bool)

(declare-fun res!264528 () Bool)

(declare-fun e!261930 () Bool)

(assert (=> b!445708 (=> (not res!264528) (not e!261930))))

(declare-fun lt!203690 () array!27538)

(declare-datatypes ((List!7817 0))(
  ( (Nil!7814) (Cons!7813 (h!8669 (_ BitVec 64)) (t!13567 List!7817)) )
))
(declare-fun arrayNoDuplicates!0 (array!27538 (_ BitVec 32) List!7817) Bool)

(assert (=> b!445708 (= res!264528 (arrayNoDuplicates!0 lt!203690 #b00000000000000000000000000000000 Nil!7814))))

(declare-fun b!445709 () Bool)

(declare-fun res!264536 () Bool)

(assert (=> b!445709 (=> (not res!264536) (not e!261929))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16923 0))(
  ( (V!16924 (val!5976 Int)) )
))
(declare-datatypes ((ValueCell!5588 0))(
  ( (ValueCellFull!5588 (v!8228 V!16923)) (EmptyCell!5588) )
))
(declare-datatypes ((array!27540 0))(
  ( (array!27541 (arr!13217 (Array (_ BitVec 32) ValueCell!5588)) (size!13569 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27540)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!445709 (= res!264536 (and (= (size!13569 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13568 _keys!709) (size!13569 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445710 () Bool)

(declare-fun e!261928 () Bool)

(declare-datatypes ((tuple2!7756 0))(
  ( (tuple2!7757 (_1!3889 (_ BitVec 64)) (_2!3889 V!16923)) )
))
(declare-datatypes ((List!7818 0))(
  ( (Nil!7815) (Cons!7814 (h!8670 tuple2!7756) (t!13568 List!7818)) )
))
(declare-datatypes ((ListLongMap!6671 0))(
  ( (ListLongMap!6672 (toList!3351 List!7818)) )
))
(declare-fun call!29591 () ListLongMap!6671)

(declare-fun call!29590 () ListLongMap!6671)

(assert (=> b!445710 (= e!261928 (= call!29591 call!29590))))

(declare-fun minValue!515 () V!16923)

(declare-fun zeroValue!515 () V!16923)

(declare-fun v!412 () V!16923)

(declare-fun bm!29587 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!55846 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1582 (array!27538 array!27540 (_ BitVec 32) (_ BitVec 32) V!16923 V!16923 (_ BitVec 32) Int) ListLongMap!6671)

(assert (=> bm!29587 (= call!29591 (getCurrentListMapNoExtraKeys!1582 (ite c!55846 _keys!709 lt!203690) (ite c!55846 _values!549 (array!27541 (store (arr!13217 _values!549) i!563 (ValueCellFull!5588 v!412)) (size!13569 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445711 () Bool)

(assert (=> b!445711 (= e!261929 e!261930)))

(declare-fun res!264530 () Bool)

(assert (=> b!445711 (=> (not res!264530) (not e!261930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27538 (_ BitVec 32)) Bool)

(assert (=> b!445711 (= res!264530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203690 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!445711 (= lt!203690 (array!27539 (store (arr!13216 _keys!709) i!563 k0!794) (size!13568 _keys!709)))))

(declare-fun b!445712 () Bool)

(declare-fun res!264534 () Bool)

(assert (=> b!445712 (=> (not res!264534) (not e!261929))))

(assert (=> b!445712 (= res!264534 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7814))))

(declare-fun b!445713 () Bool)

(declare-fun +!1530 (ListLongMap!6671 tuple2!7756) ListLongMap!6671)

(assert (=> b!445713 (= e!261928 (= call!29590 (+!1530 call!29591 (tuple2!7757 k0!794 v!412))))))

(declare-fun mapIsEmpty!19422 () Bool)

(declare-fun mapRes!19422 () Bool)

(assert (=> mapIsEmpty!19422 mapRes!19422))

(declare-fun b!445714 () Bool)

(declare-fun e!261932 () Bool)

(declare-fun e!261931 () Bool)

(assert (=> b!445714 (= e!261932 (and e!261931 mapRes!19422))))

(declare-fun condMapEmpty!19422 () Bool)

(declare-fun mapDefault!19422 () ValueCell!5588)

(assert (=> b!445714 (= condMapEmpty!19422 (= (arr!13217 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5588)) mapDefault!19422)))))

(declare-fun b!445715 () Bool)

(assert (=> b!445715 (= e!261930 (not true))))

(assert (=> b!445715 e!261928))

(assert (=> b!445715 (= c!55846 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13139 0))(
  ( (Unit!13140) )
))
(declare-fun lt!203691 () Unit!13139)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!691 (array!27538 array!27540 (_ BitVec 32) (_ BitVec 32) V!16923 V!16923 (_ BitVec 32) (_ BitVec 64) V!16923 (_ BitVec 32) Int) Unit!13139)

(assert (=> b!445715 (= lt!203691 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!691 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!264537 () Bool)

(assert (=> start!40464 (=> (not res!264537) (not e!261929))))

(assert (=> start!40464 (= res!264537 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13568 _keys!709))))))

(assert (=> start!40464 e!261929))

(declare-fun tp_is_empty!11863 () Bool)

(assert (=> start!40464 tp_is_empty!11863))

(assert (=> start!40464 tp!37425))

(assert (=> start!40464 true))

(declare-fun array_inv!9662 (array!27540) Bool)

(assert (=> start!40464 (and (array_inv!9662 _values!549) e!261932)))

(declare-fun array_inv!9663 (array!27538) Bool)

(assert (=> start!40464 (array_inv!9663 _keys!709)))

(declare-fun mapNonEmpty!19422 () Bool)

(declare-fun tp!37424 () Bool)

(declare-fun e!261927 () Bool)

(assert (=> mapNonEmpty!19422 (= mapRes!19422 (and tp!37424 e!261927))))

(declare-fun mapKey!19422 () (_ BitVec 32))

(declare-fun mapRest!19422 () (Array (_ BitVec 32) ValueCell!5588))

(declare-fun mapValue!19422 () ValueCell!5588)

(assert (=> mapNonEmpty!19422 (= (arr!13217 _values!549) (store mapRest!19422 mapKey!19422 mapValue!19422))))

(declare-fun b!445716 () Bool)

(declare-fun res!264531 () Bool)

(assert (=> b!445716 (=> (not res!264531) (not e!261929))))

(declare-fun arrayContainsKey!0 (array!27538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445716 (= res!264531 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445717 () Bool)

(assert (=> b!445717 (= e!261931 tp_is_empty!11863)))

(declare-fun b!445718 () Bool)

(declare-fun res!264532 () Bool)

(assert (=> b!445718 (=> (not res!264532) (not e!261930))))

(assert (=> b!445718 (= res!264532 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13568 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445719 () Bool)

(declare-fun res!264529 () Bool)

(assert (=> b!445719 (=> (not res!264529) (not e!261929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445719 (= res!264529 (validMask!0 mask!1025))))

(declare-fun b!445720 () Bool)

(declare-fun res!264538 () Bool)

(assert (=> b!445720 (=> (not res!264538) (not e!261929))))

(assert (=> b!445720 (= res!264538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445721 () Bool)

(declare-fun res!264533 () Bool)

(assert (=> b!445721 (=> (not res!264533) (not e!261929))))

(assert (=> b!445721 (= res!264533 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13568 _keys!709))))))

(declare-fun b!445722 () Bool)

(assert (=> b!445722 (= e!261927 tp_is_empty!11863)))

(declare-fun bm!29588 () Bool)

(assert (=> bm!29588 (= call!29590 (getCurrentListMapNoExtraKeys!1582 (ite c!55846 lt!203690 _keys!709) (ite c!55846 (array!27541 (store (arr!13217 _values!549) i!563 (ValueCellFull!5588 v!412)) (size!13569 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445723 () Bool)

(declare-fun res!264535 () Bool)

(assert (=> b!445723 (=> (not res!264535) (not e!261929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445723 (= res!264535 (validKeyInArray!0 k0!794))))

(assert (= (and start!40464 res!264537) b!445719))

(assert (= (and b!445719 res!264529) b!445709))

(assert (= (and b!445709 res!264536) b!445720))

(assert (= (and b!445720 res!264538) b!445712))

(assert (= (and b!445712 res!264534) b!445721))

(assert (= (and b!445721 res!264533) b!445723))

(assert (= (and b!445723 res!264535) b!445707))

(assert (= (and b!445707 res!264527) b!445716))

(assert (= (and b!445716 res!264531) b!445711))

(assert (= (and b!445711 res!264530) b!445708))

(assert (= (and b!445708 res!264528) b!445718))

(assert (= (and b!445718 res!264532) b!445715))

(assert (= (and b!445715 c!55846) b!445713))

(assert (= (and b!445715 (not c!55846)) b!445710))

(assert (= (or b!445713 b!445710) bm!29588))

(assert (= (or b!445713 b!445710) bm!29587))

(assert (= (and b!445714 condMapEmpty!19422) mapIsEmpty!19422))

(assert (= (and b!445714 (not condMapEmpty!19422)) mapNonEmpty!19422))

(get-info :version)

(assert (= (and mapNonEmpty!19422 ((_ is ValueCellFull!5588) mapValue!19422)) b!445722))

(assert (= (and b!445714 ((_ is ValueCellFull!5588) mapDefault!19422)) b!445717))

(assert (= start!40464 b!445714))

(declare-fun m!431355 () Bool)

(assert (=> b!445716 m!431355))

(declare-fun m!431357 () Bool)

(assert (=> bm!29588 m!431357))

(declare-fun m!431359 () Bool)

(assert (=> bm!29588 m!431359))

(declare-fun m!431361 () Bool)

(assert (=> start!40464 m!431361))

(declare-fun m!431363 () Bool)

(assert (=> start!40464 m!431363))

(assert (=> bm!29587 m!431357))

(declare-fun m!431365 () Bool)

(assert (=> bm!29587 m!431365))

(declare-fun m!431367 () Bool)

(assert (=> b!445707 m!431367))

(declare-fun m!431369 () Bool)

(assert (=> b!445708 m!431369))

(declare-fun m!431371 () Bool)

(assert (=> b!445719 m!431371))

(declare-fun m!431373 () Bool)

(assert (=> b!445711 m!431373))

(declare-fun m!431375 () Bool)

(assert (=> b!445711 m!431375))

(declare-fun m!431377 () Bool)

(assert (=> b!445713 m!431377))

(declare-fun m!431379 () Bool)

(assert (=> mapNonEmpty!19422 m!431379))

(declare-fun m!431381 () Bool)

(assert (=> b!445723 m!431381))

(declare-fun m!431383 () Bool)

(assert (=> b!445712 m!431383))

(declare-fun m!431385 () Bool)

(assert (=> b!445715 m!431385))

(declare-fun m!431387 () Bool)

(assert (=> b!445720 m!431387))

(check-sat (not start!40464) (not b!445715) b_and!18547 (not b!445708) (not b_next!10549) (not b!445719) (not b!445723) (not b!445713) (not mapNonEmpty!19422) (not b!445712) tp_is_empty!11863 (not bm!29587) (not b!445720) (not bm!29588) (not b!445716) (not b!445711))
(check-sat b_and!18547 (not b_next!10549))
