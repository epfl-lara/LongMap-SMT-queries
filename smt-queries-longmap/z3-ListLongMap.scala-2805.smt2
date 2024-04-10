; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40720 () Bool)

(assert start!40720)

(declare-fun b_free!10731 () Bool)

(declare-fun b_next!10731 () Bool)

(assert (=> start!40720 (= b_free!10731 (not b_next!10731))))

(declare-fun tp!38013 () Bool)

(declare-fun b_and!18739 () Bool)

(assert (=> start!40720 (= tp!38013 b_and!18739)))

(declare-fun b!450790 () Bool)

(declare-fun res!268355 () Bool)

(declare-fun e!264127 () Bool)

(assert (=> b!450790 (=> (not res!268355) (not e!264127))))

(declare-datatypes ((array!27943 0))(
  ( (array!27944 (arr!13417 (Array (_ BitVec 32) (_ BitVec 64))) (size!13769 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27943)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450790 (= res!268355 (or (= (select (arr!13417 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13417 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450791 () Bool)

(declare-fun res!268353 () Bool)

(assert (=> b!450791 (=> (not res!268353) (not e!264127))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17197 0))(
  ( (V!17198 (val!6079 Int)) )
))
(declare-datatypes ((ValueCell!5691 0))(
  ( (ValueCellFull!5691 (v!8334 V!17197)) (EmptyCell!5691) )
))
(declare-datatypes ((array!27945 0))(
  ( (array!27946 (arr!13418 (Array (_ BitVec 32) ValueCell!5691)) (size!13770 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27945)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!450791 (= res!268353 (and (= (size!13770 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13769 _keys!709) (size!13770 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450792 () Bool)

(declare-fun res!268350 () Bool)

(assert (=> b!450792 (=> (not res!268350) (not e!264127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27943 (_ BitVec 32)) Bool)

(assert (=> b!450792 (= res!268350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450793 () Bool)

(declare-fun res!268361 () Bool)

(declare-fun e!264123 () Bool)

(assert (=> b!450793 (=> (not res!268361) (not e!264123))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!450793 (= res!268361 (bvsle from!863 i!563))))

(declare-fun res!268354 () Bool)

(assert (=> start!40720 (=> (not res!268354) (not e!264127))))

(assert (=> start!40720 (= res!268354 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13769 _keys!709))))))

(assert (=> start!40720 e!264127))

(declare-fun tp_is_empty!12069 () Bool)

(assert (=> start!40720 tp_is_empty!12069))

(assert (=> start!40720 tp!38013))

(assert (=> start!40720 true))

(declare-fun e!264121 () Bool)

(declare-fun array_inv!9716 (array!27945) Bool)

(assert (=> start!40720 (and (array_inv!9716 _values!549) e!264121)))

(declare-fun array_inv!9717 (array!27943) Bool)

(assert (=> start!40720 (array_inv!9717 _keys!709)))

(declare-fun mapNonEmpty!19737 () Bool)

(declare-fun mapRes!19737 () Bool)

(declare-fun tp!38012 () Bool)

(declare-fun e!264124 () Bool)

(assert (=> mapNonEmpty!19737 (= mapRes!19737 (and tp!38012 e!264124))))

(declare-fun mapValue!19737 () ValueCell!5691)

(declare-fun mapRest!19737 () (Array (_ BitVec 32) ValueCell!5691))

(declare-fun mapKey!19737 () (_ BitVec 32))

(assert (=> mapNonEmpty!19737 (= (arr!13418 _values!549) (store mapRest!19737 mapKey!19737 mapValue!19737))))

(declare-fun b!450794 () Bool)

(assert (=> b!450794 (= e!264124 tp_is_empty!12069)))

(declare-fun b!450795 () Bool)

(declare-fun e!264120 () Bool)

(declare-fun e!264126 () Bool)

(assert (=> b!450795 (= e!264120 (not e!264126))))

(declare-fun res!268349 () Bool)

(assert (=> b!450795 (=> res!268349 e!264126)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450795 (= res!268349 (validKeyInArray!0 (select (arr!13417 _keys!709) from!863)))))

(declare-fun e!264122 () Bool)

(assert (=> b!450795 e!264122))

(declare-fun c!56003 () Bool)

(assert (=> b!450795 (= c!56003 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!17197)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17197)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13200 0))(
  ( (Unit!13201) )
))
(declare-fun lt!204710 () Unit!13200)

(declare-fun v!412 () V!17197)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!715 (array!27943 array!27945 (_ BitVec 32) (_ BitVec 32) V!17197 V!17197 (_ BitVec 32) (_ BitVec 64) V!17197 (_ BitVec 32) Int) Unit!13200)

(assert (=> b!450795 (= lt!204710 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!715 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450796 () Bool)

(declare-fun res!268360 () Bool)

(assert (=> b!450796 (=> (not res!268360) (not e!264127))))

(assert (=> b!450796 (= res!268360 (validKeyInArray!0 k0!794))))

(declare-fun b!450797 () Bool)

(declare-fun res!268359 () Bool)

(assert (=> b!450797 (=> (not res!268359) (not e!264127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450797 (= res!268359 (validMask!0 mask!1025))))

(declare-fun b!450798 () Bool)

(assert (=> b!450798 (= e!264127 e!264123)))

(declare-fun res!268352 () Bool)

(assert (=> b!450798 (=> (not res!268352) (not e!264123))))

(declare-fun lt!204706 () array!27943)

(assert (=> b!450798 (= res!268352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204706 mask!1025))))

(assert (=> b!450798 (= lt!204706 (array!27944 (store (arr!13417 _keys!709) i!563 k0!794) (size!13769 _keys!709)))))

(declare-fun b!450799 () Bool)

(assert (=> b!450799 (= e!264126 (bvslt from!863 (size!13769 _keys!709)))))

(declare-fun lt!204707 () array!27945)

(declare-datatypes ((tuple2!7988 0))(
  ( (tuple2!7989 (_1!4005 (_ BitVec 64)) (_2!4005 V!17197)) )
))
(declare-datatypes ((List!8053 0))(
  ( (Nil!8050) (Cons!8049 (h!8905 tuple2!7988) (t!13815 List!8053)) )
))
(declare-datatypes ((ListLongMap!6901 0))(
  ( (ListLongMap!6902 (toList!3466 List!8053)) )
))
(declare-fun lt!204708 () ListLongMap!6901)

(declare-fun getCurrentListMapNoExtraKeys!1650 (array!27943 array!27945 (_ BitVec 32) (_ BitVec 32) V!17197 V!17197 (_ BitVec 32) Int) ListLongMap!6901)

(assert (=> b!450799 (= lt!204708 (getCurrentListMapNoExtraKeys!1650 lt!204706 lt!204707 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29782 () Bool)

(declare-fun call!29785 () ListLongMap!6901)

(assert (=> bm!29782 (= call!29785 (getCurrentListMapNoExtraKeys!1650 (ite c!56003 _keys!709 lt!204706) (ite c!56003 _values!549 lt!204707) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450800 () Bool)

(assert (=> b!450800 (= e!264123 e!264120)))

(declare-fun res!268362 () Bool)

(assert (=> b!450800 (=> (not res!268362) (not e!264120))))

(assert (=> b!450800 (= res!268362 (= from!863 i!563))))

(declare-fun lt!204709 () ListLongMap!6901)

(assert (=> b!450800 (= lt!204709 (getCurrentListMapNoExtraKeys!1650 lt!204706 lt!204707 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!450800 (= lt!204707 (array!27946 (store (arr!13418 _values!549) i!563 (ValueCellFull!5691 v!412)) (size!13770 _values!549)))))

(declare-fun lt!204711 () ListLongMap!6901)

(assert (=> b!450800 (= lt!204711 (getCurrentListMapNoExtraKeys!1650 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!19737 () Bool)

(assert (=> mapIsEmpty!19737 mapRes!19737))

(declare-fun b!450801 () Bool)

(declare-fun call!29786 () ListLongMap!6901)

(declare-fun +!1547 (ListLongMap!6901 tuple2!7988) ListLongMap!6901)

(assert (=> b!450801 (= e!264122 (= call!29786 (+!1547 call!29785 (tuple2!7989 k0!794 v!412))))))

(declare-fun bm!29783 () Bool)

(assert (=> bm!29783 (= call!29786 (getCurrentListMapNoExtraKeys!1650 (ite c!56003 lt!204706 _keys!709) (ite c!56003 lt!204707 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450802 () Bool)

(assert (=> b!450802 (= e!264122 (= call!29785 call!29786))))

(declare-fun b!450803 () Bool)

(declare-fun res!268357 () Bool)

(assert (=> b!450803 (=> (not res!268357) (not e!264127))))

(declare-datatypes ((List!8054 0))(
  ( (Nil!8051) (Cons!8050 (h!8906 (_ BitVec 64)) (t!13816 List!8054)) )
))
(declare-fun arrayNoDuplicates!0 (array!27943 (_ BitVec 32) List!8054) Bool)

(assert (=> b!450803 (= res!268357 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8051))))

(declare-fun b!450804 () Bool)

(declare-fun res!268351 () Bool)

(assert (=> b!450804 (=> (not res!268351) (not e!264123))))

(assert (=> b!450804 (= res!268351 (arrayNoDuplicates!0 lt!204706 #b00000000000000000000000000000000 Nil!8051))))

(declare-fun b!450805 () Bool)

(declare-fun e!264125 () Bool)

(assert (=> b!450805 (= e!264121 (and e!264125 mapRes!19737))))

(declare-fun condMapEmpty!19737 () Bool)

(declare-fun mapDefault!19737 () ValueCell!5691)

(assert (=> b!450805 (= condMapEmpty!19737 (= (arr!13418 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5691)) mapDefault!19737)))))

(declare-fun b!450806 () Bool)

(assert (=> b!450806 (= e!264125 tp_is_empty!12069)))

(declare-fun b!450807 () Bool)

(declare-fun res!268358 () Bool)

(assert (=> b!450807 (=> (not res!268358) (not e!264127))))

(declare-fun arrayContainsKey!0 (array!27943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450807 (= res!268358 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450808 () Bool)

(declare-fun res!268356 () Bool)

(assert (=> b!450808 (=> (not res!268356) (not e!264127))))

(assert (=> b!450808 (= res!268356 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13769 _keys!709))))))

(assert (= (and start!40720 res!268354) b!450797))

(assert (= (and b!450797 res!268359) b!450791))

(assert (= (and b!450791 res!268353) b!450792))

(assert (= (and b!450792 res!268350) b!450803))

(assert (= (and b!450803 res!268357) b!450808))

(assert (= (and b!450808 res!268356) b!450796))

(assert (= (and b!450796 res!268360) b!450790))

(assert (= (and b!450790 res!268355) b!450807))

(assert (= (and b!450807 res!268358) b!450798))

(assert (= (and b!450798 res!268352) b!450804))

(assert (= (and b!450804 res!268351) b!450793))

(assert (= (and b!450793 res!268361) b!450800))

(assert (= (and b!450800 res!268362) b!450795))

(assert (= (and b!450795 c!56003) b!450801))

(assert (= (and b!450795 (not c!56003)) b!450802))

(assert (= (or b!450801 b!450802) bm!29783))

(assert (= (or b!450801 b!450802) bm!29782))

(assert (= (and b!450795 (not res!268349)) b!450799))

(assert (= (and b!450805 condMapEmpty!19737) mapIsEmpty!19737))

(assert (= (and b!450805 (not condMapEmpty!19737)) mapNonEmpty!19737))

(get-info :version)

(assert (= (and mapNonEmpty!19737 ((_ is ValueCellFull!5691) mapValue!19737)) b!450794))

(assert (= (and b!450805 ((_ is ValueCellFull!5691) mapDefault!19737)) b!450806))

(assert (= start!40720 b!450805))

(declare-fun m!434601 () Bool)

(assert (=> b!450795 m!434601))

(assert (=> b!450795 m!434601))

(declare-fun m!434603 () Bool)

(assert (=> b!450795 m!434603))

(declare-fun m!434605 () Bool)

(assert (=> b!450795 m!434605))

(declare-fun m!434607 () Bool)

(assert (=> b!450798 m!434607))

(declare-fun m!434609 () Bool)

(assert (=> b!450798 m!434609))

(declare-fun m!434611 () Bool)

(assert (=> b!450799 m!434611))

(declare-fun m!434613 () Bool)

(assert (=> b!450796 m!434613))

(declare-fun m!434615 () Bool)

(assert (=> bm!29783 m!434615))

(declare-fun m!434617 () Bool)

(assert (=> b!450792 m!434617))

(declare-fun m!434619 () Bool)

(assert (=> mapNonEmpty!19737 m!434619))

(declare-fun m!434621 () Bool)

(assert (=> b!450807 m!434621))

(declare-fun m!434623 () Bool)

(assert (=> start!40720 m!434623))

(declare-fun m!434625 () Bool)

(assert (=> start!40720 m!434625))

(declare-fun m!434627 () Bool)

(assert (=> b!450800 m!434627))

(declare-fun m!434629 () Bool)

(assert (=> b!450800 m!434629))

(declare-fun m!434631 () Bool)

(assert (=> b!450800 m!434631))

(declare-fun m!434633 () Bool)

(assert (=> b!450803 m!434633))

(declare-fun m!434635 () Bool)

(assert (=> b!450804 m!434635))

(declare-fun m!434637 () Bool)

(assert (=> b!450790 m!434637))

(declare-fun m!434639 () Bool)

(assert (=> b!450801 m!434639))

(declare-fun m!434641 () Bool)

(assert (=> b!450797 m!434641))

(declare-fun m!434643 () Bool)

(assert (=> bm!29782 m!434643))

(check-sat (not b!450792) (not b!450796) (not b_next!10731) (not b!450807) (not b!450795) (not mapNonEmpty!19737) (not b!450803) (not b!450800) (not b!450804) (not bm!29783) (not b!450797) (not bm!29782) (not b!450801) b_and!18739 (not start!40720) (not b!450798) (not b!450799) tp_is_empty!12069)
(check-sat b_and!18739 (not b_next!10731))
