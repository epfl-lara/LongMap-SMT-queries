; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38694 () Bool)

(assert start!38694)

(declare-fun b_free!9231 () Bool)

(declare-fun b_next!9231 () Bool)

(assert (=> start!38694 (= b_free!9231 (not b_next!9231))))

(declare-fun tp!32816 () Bool)

(declare-fun b_and!16617 () Bool)

(assert (=> start!38694 (= tp!32816 b_and!16617)))

(declare-fun b!402349 () Bool)

(declare-fun e!242430 () Bool)

(assert (=> b!402349 (= e!242430 (not true))))

(declare-fun e!242427 () Bool)

(assert (=> b!402349 e!242427))

(declare-fun c!54803 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402349 (= c!54803 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14589 0))(
  ( (V!14590 (val!5101 Int)) )
))
(declare-fun minValue!515 () V!14589)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12180 0))(
  ( (Unit!12181) )
))
(declare-fun lt!187919 () Unit!12180)

(declare-datatypes ((ValueCell!4713 0))(
  ( (ValueCellFull!4713 (v!7348 V!14589)) (EmptyCell!4713) )
))
(declare-datatypes ((array!24131 0))(
  ( (array!24132 (arr!11515 (Array (_ BitVec 32) ValueCell!4713)) (size!11867 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24131)

(declare-fun zeroValue!515 () V!14589)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14589)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24133 0))(
  ( (array!24134 (arr!11516 (Array (_ BitVec 32) (_ BitVec 64))) (size!11868 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24133)

(declare-fun defaultEntry!557 () Int)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!348 (array!24133 array!24131 (_ BitVec 32) (_ BitVec 32) V!14589 V!14589 (_ BitVec 32) (_ BitVec 64) V!14589 (_ BitVec 32) Int) Unit!12180)

(assert (=> b!402349 (= lt!187919 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!348 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402350 () Bool)

(declare-datatypes ((tuple2!6776 0))(
  ( (tuple2!6777 (_1!3399 (_ BitVec 64)) (_2!3399 V!14589)) )
))
(declare-datatypes ((List!6698 0))(
  ( (Nil!6695) (Cons!6694 (h!7550 tuple2!6776) (t!11872 List!6698)) )
))
(declare-datatypes ((ListLongMap!5689 0))(
  ( (ListLongMap!5690 (toList!2860 List!6698)) )
))
(declare-fun call!28358 () ListLongMap!5689)

(declare-fun call!28357 () ListLongMap!5689)

(declare-fun +!1138 (ListLongMap!5689 tuple2!6776) ListLongMap!5689)

(assert (=> b!402350 (= e!242427 (= call!28358 (+!1138 call!28357 (tuple2!6777 k0!794 v!412))))))

(declare-fun b!402351 () Bool)

(assert (=> b!402351 (= e!242427 (= call!28357 call!28358))))

(declare-fun b!402352 () Bool)

(declare-fun res!231735 () Bool)

(declare-fun e!242431 () Bool)

(assert (=> b!402352 (=> (not res!231735) (not e!242431))))

(assert (=> b!402352 (= res!231735 (and (= (size!11867 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11868 _keys!709) (size!11867 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402353 () Bool)

(declare-fun res!231739 () Bool)

(assert (=> b!402353 (=> (not res!231739) (not e!242431))))

(declare-datatypes ((List!6699 0))(
  ( (Nil!6696) (Cons!6695 (h!7551 (_ BitVec 64)) (t!11873 List!6699)) )
))
(declare-fun arrayNoDuplicates!0 (array!24133 (_ BitVec 32) List!6699) Bool)

(assert (=> b!402353 (= res!231739 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6696))))

(declare-fun res!231730 () Bool)

(assert (=> start!38694 (=> (not res!231730) (not e!242431))))

(assert (=> start!38694 (= res!231730 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11868 _keys!709))))))

(assert (=> start!38694 e!242431))

(declare-fun tp_is_empty!10113 () Bool)

(assert (=> start!38694 tp_is_empty!10113))

(assert (=> start!38694 tp!32816))

(assert (=> start!38694 true))

(declare-fun e!242428 () Bool)

(declare-fun array_inv!8426 (array!24131) Bool)

(assert (=> start!38694 (and (array_inv!8426 _values!549) e!242428)))

(declare-fun array_inv!8427 (array!24133) Bool)

(assert (=> start!38694 (array_inv!8427 _keys!709)))

(declare-fun b!402354 () Bool)

(declare-fun res!231737 () Bool)

(assert (=> b!402354 (=> (not res!231737) (not e!242431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402354 (= res!231737 (validMask!0 mask!1025))))

(declare-fun bm!28354 () Bool)

(declare-fun lt!187918 () array!24133)

(declare-fun getCurrentListMapNoExtraKeys!1070 (array!24133 array!24131 (_ BitVec 32) (_ BitVec 32) V!14589 V!14589 (_ BitVec 32) Int) ListLongMap!5689)

(assert (=> bm!28354 (= call!28357 (getCurrentListMapNoExtraKeys!1070 (ite c!54803 _keys!709 lt!187918) (ite c!54803 _values!549 (array!24132 (store (arr!11515 _values!549) i!563 (ValueCellFull!4713 v!412)) (size!11867 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402355 () Bool)

(declare-fun e!242433 () Bool)

(declare-fun mapRes!16791 () Bool)

(assert (=> b!402355 (= e!242428 (and e!242433 mapRes!16791))))

(declare-fun condMapEmpty!16791 () Bool)

(declare-fun mapDefault!16791 () ValueCell!4713)

(assert (=> b!402355 (= condMapEmpty!16791 (= (arr!11515 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4713)) mapDefault!16791)))))

(declare-fun b!402356 () Bool)

(declare-fun res!231738 () Bool)

(assert (=> b!402356 (=> (not res!231738) (not e!242430))))

(assert (=> b!402356 (= res!231738 (arrayNoDuplicates!0 lt!187918 #b00000000000000000000000000000000 Nil!6696))))

(declare-fun b!402357 () Bool)

(declare-fun e!242432 () Bool)

(assert (=> b!402357 (= e!242432 tp_is_empty!10113)))

(declare-fun mapNonEmpty!16791 () Bool)

(declare-fun tp!32817 () Bool)

(assert (=> mapNonEmpty!16791 (= mapRes!16791 (and tp!32817 e!242432))))

(declare-fun mapValue!16791 () ValueCell!4713)

(declare-fun mapKey!16791 () (_ BitVec 32))

(declare-fun mapRest!16791 () (Array (_ BitVec 32) ValueCell!4713))

(assert (=> mapNonEmpty!16791 (= (arr!11515 _values!549) (store mapRest!16791 mapKey!16791 mapValue!16791))))

(declare-fun b!402358 () Bool)

(declare-fun res!231731 () Bool)

(assert (=> b!402358 (=> (not res!231731) (not e!242431))))

(declare-fun arrayContainsKey!0 (array!24133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402358 (= res!231731 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16791 () Bool)

(assert (=> mapIsEmpty!16791 mapRes!16791))

(declare-fun b!402359 () Bool)

(assert (=> b!402359 (= e!242431 e!242430)))

(declare-fun res!231736 () Bool)

(assert (=> b!402359 (=> (not res!231736) (not e!242430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24133 (_ BitVec 32)) Bool)

(assert (=> b!402359 (= res!231736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187918 mask!1025))))

(assert (=> b!402359 (= lt!187918 (array!24134 (store (arr!11516 _keys!709) i!563 k0!794) (size!11868 _keys!709)))))

(declare-fun b!402360 () Bool)

(declare-fun res!231732 () Bool)

(assert (=> b!402360 (=> (not res!231732) (not e!242430))))

(assert (=> b!402360 (= res!231732 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11868 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402361 () Bool)

(declare-fun res!231733 () Bool)

(assert (=> b!402361 (=> (not res!231733) (not e!242431))))

(assert (=> b!402361 (= res!231733 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11868 _keys!709))))))

(declare-fun b!402362 () Bool)

(assert (=> b!402362 (= e!242433 tp_is_empty!10113)))

(declare-fun b!402363 () Bool)

(declare-fun res!231741 () Bool)

(assert (=> b!402363 (=> (not res!231741) (not e!242431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402363 (= res!231741 (validKeyInArray!0 k0!794))))

(declare-fun b!402364 () Bool)

(declare-fun res!231740 () Bool)

(assert (=> b!402364 (=> (not res!231740) (not e!242431))))

(assert (=> b!402364 (= res!231740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28355 () Bool)

(assert (=> bm!28355 (= call!28358 (getCurrentListMapNoExtraKeys!1070 (ite c!54803 lt!187918 _keys!709) (ite c!54803 (array!24132 (store (arr!11515 _values!549) i!563 (ValueCellFull!4713 v!412)) (size!11867 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402365 () Bool)

(declare-fun res!231734 () Bool)

(assert (=> b!402365 (=> (not res!231734) (not e!242431))))

(assert (=> b!402365 (= res!231734 (or (= (select (arr!11516 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11516 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38694 res!231730) b!402354))

(assert (= (and b!402354 res!231737) b!402352))

(assert (= (and b!402352 res!231735) b!402364))

(assert (= (and b!402364 res!231740) b!402353))

(assert (= (and b!402353 res!231739) b!402361))

(assert (= (and b!402361 res!231733) b!402363))

(assert (= (and b!402363 res!231741) b!402365))

(assert (= (and b!402365 res!231734) b!402358))

(assert (= (and b!402358 res!231731) b!402359))

(assert (= (and b!402359 res!231736) b!402356))

(assert (= (and b!402356 res!231738) b!402360))

(assert (= (and b!402360 res!231732) b!402349))

(assert (= (and b!402349 c!54803) b!402350))

(assert (= (and b!402349 (not c!54803)) b!402351))

(assert (= (or b!402350 b!402351) bm!28355))

(assert (= (or b!402350 b!402351) bm!28354))

(assert (= (and b!402355 condMapEmpty!16791) mapIsEmpty!16791))

(assert (= (and b!402355 (not condMapEmpty!16791)) mapNonEmpty!16791))

(get-info :version)

(assert (= (and mapNonEmpty!16791 ((_ is ValueCellFull!4713) mapValue!16791)) b!402357))

(assert (= (and b!402355 ((_ is ValueCellFull!4713) mapDefault!16791)) b!402362))

(assert (= start!38694 b!402355))

(declare-fun m!395903 () Bool)

(assert (=> b!402359 m!395903))

(declare-fun m!395905 () Bool)

(assert (=> b!402359 m!395905))

(declare-fun m!395907 () Bool)

(assert (=> start!38694 m!395907))

(declare-fun m!395909 () Bool)

(assert (=> start!38694 m!395909))

(declare-fun m!395911 () Bool)

(assert (=> b!402350 m!395911))

(declare-fun m!395913 () Bool)

(assert (=> mapNonEmpty!16791 m!395913))

(declare-fun m!395915 () Bool)

(assert (=> b!402364 m!395915))

(declare-fun m!395917 () Bool)

(assert (=> b!402349 m!395917))

(declare-fun m!395919 () Bool)

(assert (=> b!402365 m!395919))

(declare-fun m!395921 () Bool)

(assert (=> bm!28355 m!395921))

(declare-fun m!395923 () Bool)

(assert (=> bm!28355 m!395923))

(declare-fun m!395925 () Bool)

(assert (=> b!402358 m!395925))

(declare-fun m!395927 () Bool)

(assert (=> b!402356 m!395927))

(declare-fun m!395929 () Bool)

(assert (=> b!402363 m!395929))

(assert (=> bm!28354 m!395921))

(declare-fun m!395931 () Bool)

(assert (=> bm!28354 m!395931))

(declare-fun m!395933 () Bool)

(assert (=> b!402354 m!395933))

(declare-fun m!395935 () Bool)

(assert (=> b!402353 m!395935))

(check-sat (not start!38694) (not b!402354) b_and!16617 (not b!402359) (not b!402364) (not b!402349) (not mapNonEmpty!16791) (not bm!28355) (not b!402358) (not b_next!9231) tp_is_empty!10113 (not b!402356) (not b!402350) (not b!402353) (not b!402363) (not bm!28354))
(check-sat b_and!16617 (not b_next!9231))
