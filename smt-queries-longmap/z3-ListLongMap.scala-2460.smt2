; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38564 () Bool)

(assert start!38564)

(declare-fun b_free!9115 () Bool)

(declare-fun b_next!9115 () Bool)

(assert (=> start!38564 (= b_free!9115 (not b_next!9115))))

(declare-fun tp!32469 () Bool)

(declare-fun b_and!16475 () Bool)

(assert (=> start!38564 (= tp!32469 b_and!16475)))

(declare-fun b!399120 () Bool)

(declare-fun res!229518 () Bool)

(declare-fun e!241039 () Bool)

(assert (=> b!399120 (=> (not res!229518) (not e!241039))))

(declare-datatypes ((array!23883 0))(
  ( (array!23884 (arr!11391 (Array (_ BitVec 32) (_ BitVec 64))) (size!11744 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23883)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399120 (= res!229518 (or (= (select (arr!11391 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11391 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!187337 () array!23883)

(declare-datatypes ((V!14435 0))(
  ( (V!14436 (val!5043 Int)) )
))
(declare-fun minValue!515 () V!14435)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4655 0))(
  ( (ValueCellFull!4655 (v!7284 V!14435)) (EmptyCell!4655) )
))
(declare-datatypes ((array!23885 0))(
  ( (array!23886 (arr!11392 (Array (_ BitVec 32) ValueCell!4655)) (size!11745 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23885)

(declare-fun c!54558 () Bool)

(declare-fun zeroValue!515 () V!14435)

(declare-datatypes ((tuple2!6648 0))(
  ( (tuple2!6649 (_1!3335 (_ BitVec 64)) (_2!3335 V!14435)) )
))
(declare-datatypes ((List!6559 0))(
  ( (Nil!6556) (Cons!6555 (h!7411 tuple2!6648) (t!11724 List!6559)) )
))
(declare-datatypes ((ListLongMap!5551 0))(
  ( (ListLongMap!5552 (toList!2791 List!6559)) )
))
(declare-fun call!27985 () ListLongMap!5551)

(declare-fun v!412 () V!14435)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!27981 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1012 (array!23883 array!23885 (_ BitVec 32) (_ BitVec 32) V!14435 V!14435 (_ BitVec 32) Int) ListLongMap!5551)

(assert (=> bm!27981 (= call!27985 (getCurrentListMapNoExtraKeys!1012 (ite c!54558 lt!187337 _keys!709) (ite c!54558 (array!23886 (store (arr!11392 _values!549) i!563 (ValueCellFull!4655 v!412)) (size!11745 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399121 () Bool)

(declare-fun e!241041 () Bool)

(declare-fun call!27984 () ListLongMap!5551)

(assert (=> b!399121 (= e!241041 (= call!27984 call!27985))))

(declare-fun b!399122 () Bool)

(declare-fun e!241037 () Bool)

(assert (=> b!399122 (= e!241037 (not true))))

(assert (=> b!399122 e!241041))

(assert (=> b!399122 (= c!54558 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12076 0))(
  ( (Unit!12077) )
))
(declare-fun lt!187336 () Unit!12076)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!301 (array!23883 array!23885 (_ BitVec 32) (_ BitVec 32) V!14435 V!14435 (_ BitVec 32) (_ BitVec 64) V!14435 (_ BitVec 32) Int) Unit!12076)

(assert (=> b!399122 (= lt!187336 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!301 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399123 () Bool)

(declare-fun e!241036 () Bool)

(declare-fun e!241038 () Bool)

(declare-fun mapRes!16617 () Bool)

(assert (=> b!399123 (= e!241036 (and e!241038 mapRes!16617))))

(declare-fun condMapEmpty!16617 () Bool)

(declare-fun mapDefault!16617 () ValueCell!4655)

(assert (=> b!399123 (= condMapEmpty!16617 (= (arr!11392 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4655)) mapDefault!16617)))))

(declare-fun mapIsEmpty!16617 () Bool)

(assert (=> mapIsEmpty!16617 mapRes!16617))

(declare-fun b!399124 () Bool)

(declare-fun res!229514 () Bool)

(assert (=> b!399124 (=> (not res!229514) (not e!241039))))

(assert (=> b!399124 (= res!229514 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11744 _keys!709))))))

(declare-fun b!399125 () Bool)

(declare-fun e!241040 () Bool)

(declare-fun tp_is_empty!9997 () Bool)

(assert (=> b!399125 (= e!241040 tp_is_empty!9997)))

(declare-fun b!399126 () Bool)

(declare-fun res!229517 () Bool)

(assert (=> b!399126 (=> (not res!229517) (not e!241039))))

(declare-fun arrayContainsKey!0 (array!23883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399126 (= res!229517 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399127 () Bool)

(declare-fun res!229521 () Bool)

(assert (=> b!399127 (=> (not res!229521) (not e!241039))))

(assert (=> b!399127 (= res!229521 (and (= (size!11745 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11744 _keys!709) (size!11745 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399129 () Bool)

(declare-fun +!1108 (ListLongMap!5551 tuple2!6648) ListLongMap!5551)

(assert (=> b!399129 (= e!241041 (= call!27985 (+!1108 call!27984 (tuple2!6649 k0!794 v!412))))))

(declare-fun b!399130 () Bool)

(declare-fun res!229522 () Bool)

(assert (=> b!399130 (=> (not res!229522) (not e!241039))))

(declare-datatypes ((List!6560 0))(
  ( (Nil!6557) (Cons!6556 (h!7412 (_ BitVec 64)) (t!11725 List!6560)) )
))
(declare-fun arrayNoDuplicates!0 (array!23883 (_ BitVec 32) List!6560) Bool)

(assert (=> b!399130 (= res!229522 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6557))))

(declare-fun bm!27982 () Bool)

(assert (=> bm!27982 (= call!27984 (getCurrentListMapNoExtraKeys!1012 (ite c!54558 _keys!709 lt!187337) (ite c!54558 _values!549 (array!23886 (store (arr!11392 _values!549) i!563 (ValueCellFull!4655 v!412)) (size!11745 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399131 () Bool)

(declare-fun res!229524 () Bool)

(assert (=> b!399131 (=> (not res!229524) (not e!241037))))

(assert (=> b!399131 (= res!229524 (arrayNoDuplicates!0 lt!187337 #b00000000000000000000000000000000 Nil!6557))))

(declare-fun b!399132 () Bool)

(declare-fun res!229515 () Bool)

(assert (=> b!399132 (=> (not res!229515) (not e!241039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399132 (= res!229515 (validKeyInArray!0 k0!794))))

(declare-fun b!399133 () Bool)

(declare-fun res!229519 () Bool)

(assert (=> b!399133 (=> (not res!229519) (not e!241039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399133 (= res!229519 (validMask!0 mask!1025))))

(declare-fun b!399134 () Bool)

(declare-fun res!229523 () Bool)

(assert (=> b!399134 (=> (not res!229523) (not e!241037))))

(assert (=> b!399134 (= res!229523 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11744 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399135 () Bool)

(assert (=> b!399135 (= e!241038 tp_is_empty!9997)))

(declare-fun b!399136 () Bool)

(assert (=> b!399136 (= e!241039 e!241037)))

(declare-fun res!229516 () Bool)

(assert (=> b!399136 (=> (not res!229516) (not e!241037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23883 (_ BitVec 32)) Bool)

(assert (=> b!399136 (= res!229516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187337 mask!1025))))

(assert (=> b!399136 (= lt!187337 (array!23884 (store (arr!11391 _keys!709) i!563 k0!794) (size!11744 _keys!709)))))

(declare-fun mapNonEmpty!16617 () Bool)

(declare-fun tp!32468 () Bool)

(assert (=> mapNonEmpty!16617 (= mapRes!16617 (and tp!32468 e!241040))))

(declare-fun mapValue!16617 () ValueCell!4655)

(declare-fun mapKey!16617 () (_ BitVec 32))

(declare-fun mapRest!16617 () (Array (_ BitVec 32) ValueCell!4655))

(assert (=> mapNonEmpty!16617 (= (arr!11392 _values!549) (store mapRest!16617 mapKey!16617 mapValue!16617))))

(declare-fun b!399128 () Bool)

(declare-fun res!229520 () Bool)

(assert (=> b!399128 (=> (not res!229520) (not e!241039))))

(assert (=> b!399128 (= res!229520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!229513 () Bool)

(assert (=> start!38564 (=> (not res!229513) (not e!241039))))

(assert (=> start!38564 (= res!229513 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11744 _keys!709))))))

(assert (=> start!38564 e!241039))

(assert (=> start!38564 tp_is_empty!9997))

(assert (=> start!38564 tp!32469))

(assert (=> start!38564 true))

(declare-fun array_inv!8362 (array!23885) Bool)

(assert (=> start!38564 (and (array_inv!8362 _values!549) e!241036)))

(declare-fun array_inv!8363 (array!23883) Bool)

(assert (=> start!38564 (array_inv!8363 _keys!709)))

(assert (= (and start!38564 res!229513) b!399133))

(assert (= (and b!399133 res!229519) b!399127))

(assert (= (and b!399127 res!229521) b!399128))

(assert (= (and b!399128 res!229520) b!399130))

(assert (= (and b!399130 res!229522) b!399124))

(assert (= (and b!399124 res!229514) b!399132))

(assert (= (and b!399132 res!229515) b!399120))

(assert (= (and b!399120 res!229518) b!399126))

(assert (= (and b!399126 res!229517) b!399136))

(assert (= (and b!399136 res!229516) b!399131))

(assert (= (and b!399131 res!229524) b!399134))

(assert (= (and b!399134 res!229523) b!399122))

(assert (= (and b!399122 c!54558) b!399129))

(assert (= (and b!399122 (not c!54558)) b!399121))

(assert (= (or b!399129 b!399121) bm!27981))

(assert (= (or b!399129 b!399121) bm!27982))

(assert (= (and b!399123 condMapEmpty!16617) mapIsEmpty!16617))

(assert (= (and b!399123 (not condMapEmpty!16617)) mapNonEmpty!16617))

(get-info :version)

(assert (= (and mapNonEmpty!16617 ((_ is ValueCellFull!4655) mapValue!16617)) b!399125))

(assert (= (and b!399123 ((_ is ValueCellFull!4655) mapDefault!16617)) b!399135))

(assert (= start!38564 b!399123))

(declare-fun m!393207 () Bool)

(assert (=> bm!27982 m!393207))

(declare-fun m!393209 () Bool)

(assert (=> bm!27982 m!393209))

(declare-fun m!393211 () Bool)

(assert (=> b!399129 m!393211))

(assert (=> bm!27981 m!393207))

(declare-fun m!393213 () Bool)

(assert (=> bm!27981 m!393213))

(declare-fun m!393215 () Bool)

(assert (=> b!399122 m!393215))

(declare-fun m!393217 () Bool)

(assert (=> b!399130 m!393217))

(declare-fun m!393219 () Bool)

(assert (=> b!399126 m!393219))

(declare-fun m!393221 () Bool)

(assert (=> b!399133 m!393221))

(declare-fun m!393223 () Bool)

(assert (=> start!38564 m!393223))

(declare-fun m!393225 () Bool)

(assert (=> start!38564 m!393225))

(declare-fun m!393227 () Bool)

(assert (=> b!399131 m!393227))

(declare-fun m!393229 () Bool)

(assert (=> b!399132 m!393229))

(declare-fun m!393231 () Bool)

(assert (=> b!399128 m!393231))

(declare-fun m!393233 () Bool)

(assert (=> b!399120 m!393233))

(declare-fun m!393235 () Bool)

(assert (=> mapNonEmpty!16617 m!393235))

(declare-fun m!393237 () Bool)

(assert (=> b!399136 m!393237))

(declare-fun m!393239 () Bool)

(assert (=> b!399136 m!393239))

(check-sat (not b!399126) (not b!399133) (not b!399132) (not b!399131) (not bm!27982) b_and!16475 (not b!399136) tp_is_empty!9997 (not b!399128) (not b!399130) (not b_next!9115) (not mapNonEmpty!16617) (not b!399129) (not start!38564) (not bm!27981) (not b!399122))
(check-sat b_and!16475 (not b_next!9115))
