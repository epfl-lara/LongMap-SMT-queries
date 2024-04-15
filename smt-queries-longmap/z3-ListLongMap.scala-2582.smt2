; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39296 () Bool)

(assert start!39296)

(declare-fun b_free!9577 () Bool)

(declare-fun b_next!9577 () Bool)

(assert (=> start!39296 (= b_free!9577 (not b_next!9577))))

(declare-fun tp!34259 () Bool)

(declare-fun b_and!17003 () Bool)

(assert (=> start!39296 (= tp!34259 b_and!17003)))

(declare-fun b!416038 () Bool)

(declare-fun res!242180 () Bool)

(declare-fun e!248369 () Bool)

(assert (=> b!416038 (=> (not res!242180) (not e!248369))))

(declare-datatypes ((array!25303 0))(
  ( (array!25304 (arr!12101 (Array (_ BitVec 32) (_ BitVec 64))) (size!12454 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25303)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416038 (= res!242180 (or (= (select (arr!12101 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12101 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28881 () Bool)

(declare-datatypes ((V!15411 0))(
  ( (V!15412 (val!5409 Int)) )
))
(declare-fun minValue!515 () V!15411)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!190370 () array!25303)

(declare-fun zeroValue!515 () V!15411)

(declare-datatypes ((ValueCell!5021 0))(
  ( (ValueCellFull!5021 (v!7650 V!15411)) (EmptyCell!5021) )
))
(declare-datatypes ((array!25305 0))(
  ( (array!25306 (arr!12102 (Array (_ BitVec 32) ValueCell!5021)) (size!12455 (_ BitVec 32))) )
))
(declare-fun lt!190366 () array!25305)

(declare-datatypes ((tuple2!7036 0))(
  ( (tuple2!7037 (_1!3529 (_ BitVec 64)) (_2!3529 V!15411)) )
))
(declare-datatypes ((List!7041 0))(
  ( (Nil!7038) (Cons!7037 (h!7893 tuple2!7036) (t!12274 List!7041)) )
))
(declare-datatypes ((ListLongMap!5939 0))(
  ( (ListLongMap!5940 (toList!2985 List!7041)) )
))
(declare-fun call!28885 () ListLongMap!5939)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!55008 () Bool)

(declare-fun _values!549 () array!25305)

(declare-fun getCurrentListMapNoExtraKeys!1196 (array!25303 array!25305 (_ BitVec 32) (_ BitVec 32) V!15411 V!15411 (_ BitVec 32) Int) ListLongMap!5939)

(assert (=> bm!28881 (= call!28885 (getCurrentListMapNoExtraKeys!1196 (ite c!55008 _keys!709 lt!190370) (ite c!55008 _values!549 lt!190366) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!242172 () Bool)

(assert (=> start!39296 (=> (not res!242172) (not e!248369))))

(assert (=> start!39296 (= res!242172 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12454 _keys!709))))))

(assert (=> start!39296 e!248369))

(declare-fun tp_is_empty!10729 () Bool)

(assert (=> start!39296 tp_is_empty!10729))

(assert (=> start!39296 tp!34259))

(assert (=> start!39296 true))

(declare-fun e!248372 () Bool)

(declare-fun array_inv!8868 (array!25305) Bool)

(assert (=> start!39296 (and (array_inv!8868 _values!549) e!248372)))

(declare-fun array_inv!8869 (array!25303) Bool)

(assert (=> start!39296 (array_inv!8869 _keys!709)))

(declare-fun bm!28882 () Bool)

(declare-fun call!28884 () ListLongMap!5939)

(assert (=> bm!28882 (= call!28884 (getCurrentListMapNoExtraKeys!1196 (ite c!55008 lt!190370 _keys!709) (ite c!55008 lt!190366 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17715 () Bool)

(declare-fun mapRes!17715 () Bool)

(assert (=> mapIsEmpty!17715 mapRes!17715))

(declare-fun b!416039 () Bool)

(declare-fun e!248365 () Bool)

(assert (=> b!416039 (= e!248365 (= call!28885 call!28884))))

(declare-fun b!416040 () Bool)

(declare-fun res!242179 () Bool)

(declare-fun e!248370 () Bool)

(assert (=> b!416040 (=> (not res!242179) (not e!248370))))

(assert (=> b!416040 (= res!242179 (bvsle from!863 i!563))))

(declare-fun b!416041 () Bool)

(declare-fun e!248367 () Bool)

(assert (=> b!416041 (= e!248367 tp_is_empty!10729)))

(declare-fun b!416042 () Bool)

(declare-fun res!242171 () Bool)

(assert (=> b!416042 (=> (not res!242171) (not e!248370))))

(declare-datatypes ((List!7042 0))(
  ( (Nil!7039) (Cons!7038 (h!7894 (_ BitVec 64)) (t!12275 List!7042)) )
))
(declare-fun arrayNoDuplicates!0 (array!25303 (_ BitVec 32) List!7042) Bool)

(assert (=> b!416042 (= res!242171 (arrayNoDuplicates!0 lt!190370 #b00000000000000000000000000000000 Nil!7039))))

(declare-fun b!416043 () Bool)

(declare-fun res!242174 () Bool)

(assert (=> b!416043 (=> (not res!242174) (not e!248369))))

(assert (=> b!416043 (= res!242174 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12454 _keys!709))))))

(declare-fun b!416044 () Bool)

(assert (=> b!416044 (= e!248369 e!248370)))

(declare-fun res!242173 () Bool)

(assert (=> b!416044 (=> (not res!242173) (not e!248370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25303 (_ BitVec 32)) Bool)

(assert (=> b!416044 (= res!242173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190370 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!416044 (= lt!190370 (array!25304 (store (arr!12101 _keys!709) i!563 k0!794) (size!12454 _keys!709)))))

(declare-fun b!416045 () Bool)

(declare-fun res!242177 () Bool)

(assert (=> b!416045 (=> (not res!242177) (not e!248369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416045 (= res!242177 (validKeyInArray!0 k0!794))))

(declare-fun b!416046 () Bool)

(declare-fun e!248368 () Bool)

(assert (=> b!416046 (= e!248368 tp_is_empty!10729)))

(declare-fun b!416047 () Bool)

(declare-fun v!412 () V!15411)

(declare-fun +!1216 (ListLongMap!5939 tuple2!7036) ListLongMap!5939)

(assert (=> b!416047 (= e!248365 (= call!28884 (+!1216 call!28885 (tuple2!7037 k0!794 v!412))))))

(declare-fun b!416048 () Bool)

(declare-fun res!242181 () Bool)

(assert (=> b!416048 (=> (not res!242181) (not e!248369))))

(assert (=> b!416048 (= res!242181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17715 () Bool)

(declare-fun tp!34260 () Bool)

(assert (=> mapNonEmpty!17715 (= mapRes!17715 (and tp!34260 e!248368))))

(declare-fun mapKey!17715 () (_ BitVec 32))

(declare-fun mapRest!17715 () (Array (_ BitVec 32) ValueCell!5021))

(declare-fun mapValue!17715 () ValueCell!5021)

(assert (=> mapNonEmpty!17715 (= (arr!12102 _values!549) (store mapRest!17715 mapKey!17715 mapValue!17715))))

(declare-fun b!416049 () Bool)

(declare-fun e!248373 () Bool)

(declare-fun e!248366 () Bool)

(assert (=> b!416049 (= e!248373 (not e!248366))))

(declare-fun res!242178 () Bool)

(assert (=> b!416049 (=> res!242178 e!248366)))

(assert (=> b!416049 (= res!242178 (validKeyInArray!0 (select (arr!12101 _keys!709) from!863)))))

(assert (=> b!416049 e!248365))

(assert (=> b!416049 (= c!55008 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12272 0))(
  ( (Unit!12273) )
))
(declare-fun lt!190365 () Unit!12272)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!398 (array!25303 array!25305 (_ BitVec 32) (_ BitVec 32) V!15411 V!15411 (_ BitVec 32) (_ BitVec 64) V!15411 (_ BitVec 32) Int) Unit!12272)

(assert (=> b!416049 (= lt!190365 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!398 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416050 () Bool)

(assert (=> b!416050 (= e!248372 (and e!248367 mapRes!17715))))

(declare-fun condMapEmpty!17715 () Bool)

(declare-fun mapDefault!17715 () ValueCell!5021)

(assert (=> b!416050 (= condMapEmpty!17715 (= (arr!12102 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5021)) mapDefault!17715)))))

(declare-fun b!416051 () Bool)

(assert (=> b!416051 (= e!248370 e!248373)))

(declare-fun res!242183 () Bool)

(assert (=> b!416051 (=> (not res!242183) (not e!248373))))

(assert (=> b!416051 (= res!242183 (= from!863 i!563))))

(declare-fun lt!190362 () ListLongMap!5939)

(assert (=> b!416051 (= lt!190362 (getCurrentListMapNoExtraKeys!1196 lt!190370 lt!190366 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416051 (= lt!190366 (array!25306 (store (arr!12102 _values!549) i!563 (ValueCellFull!5021 v!412)) (size!12455 _values!549)))))

(declare-fun lt!190369 () ListLongMap!5939)

(assert (=> b!416051 (= lt!190369 (getCurrentListMapNoExtraKeys!1196 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416052 () Bool)

(assert (=> b!416052 (= e!248366 true)))

(declare-fun lt!190363 () tuple2!7036)

(declare-fun lt!190364 () V!15411)

(declare-fun lt!190361 () ListLongMap!5939)

(assert (=> b!416052 (= (+!1216 lt!190361 lt!190363) (+!1216 (+!1216 lt!190361 (tuple2!7037 k0!794 lt!190364)) lt!190363))))

(declare-fun lt!190360 () V!15411)

(assert (=> b!416052 (= lt!190363 (tuple2!7037 k0!794 lt!190360))))

(declare-fun lt!190368 () Unit!12272)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!6 (ListLongMap!5939 (_ BitVec 64) V!15411 V!15411) Unit!12272)

(assert (=> b!416052 (= lt!190368 (addSameAsAddTwiceSameKeyDiffValues!6 lt!190361 k0!794 lt!190364 lt!190360))))

(declare-fun lt!190367 () V!15411)

(declare-fun get!5973 (ValueCell!5021 V!15411) V!15411)

(assert (=> b!416052 (= lt!190364 (get!5973 (select (arr!12102 _values!549) from!863) lt!190367))))

(assert (=> b!416052 (= lt!190362 (+!1216 lt!190361 (tuple2!7037 (select (arr!12101 lt!190370) from!863) lt!190360)))))

(assert (=> b!416052 (= lt!190360 (get!5973 (select (store (arr!12102 _values!549) i!563 (ValueCellFull!5021 v!412)) from!863) lt!190367))))

(declare-fun dynLambda!663 (Int (_ BitVec 64)) V!15411)

(assert (=> b!416052 (= lt!190367 (dynLambda!663 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416052 (= lt!190361 (getCurrentListMapNoExtraKeys!1196 lt!190370 lt!190366 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416053 () Bool)

(declare-fun res!242182 () Bool)

(assert (=> b!416053 (=> (not res!242182) (not e!248369))))

(declare-fun arrayContainsKey!0 (array!25303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416053 (= res!242182 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416054 () Bool)

(declare-fun res!242175 () Bool)

(assert (=> b!416054 (=> (not res!242175) (not e!248369))))

(assert (=> b!416054 (= res!242175 (and (= (size!12455 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12454 _keys!709) (size!12455 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416055 () Bool)

(declare-fun res!242184 () Bool)

(assert (=> b!416055 (=> (not res!242184) (not e!248369))))

(assert (=> b!416055 (= res!242184 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7039))))

(declare-fun b!416056 () Bool)

(declare-fun res!242176 () Bool)

(assert (=> b!416056 (=> (not res!242176) (not e!248369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416056 (= res!242176 (validMask!0 mask!1025))))

(assert (= (and start!39296 res!242172) b!416056))

(assert (= (and b!416056 res!242176) b!416054))

(assert (= (and b!416054 res!242175) b!416048))

(assert (= (and b!416048 res!242181) b!416055))

(assert (= (and b!416055 res!242184) b!416043))

(assert (= (and b!416043 res!242174) b!416045))

(assert (= (and b!416045 res!242177) b!416038))

(assert (= (and b!416038 res!242180) b!416053))

(assert (= (and b!416053 res!242182) b!416044))

(assert (= (and b!416044 res!242173) b!416042))

(assert (= (and b!416042 res!242171) b!416040))

(assert (= (and b!416040 res!242179) b!416051))

(assert (= (and b!416051 res!242183) b!416049))

(assert (= (and b!416049 c!55008) b!416047))

(assert (= (and b!416049 (not c!55008)) b!416039))

(assert (= (or b!416047 b!416039) bm!28882))

(assert (= (or b!416047 b!416039) bm!28881))

(assert (= (and b!416049 (not res!242178)) b!416052))

(assert (= (and b!416050 condMapEmpty!17715) mapIsEmpty!17715))

(assert (= (and b!416050 (not condMapEmpty!17715)) mapNonEmpty!17715))

(get-info :version)

(assert (= (and mapNonEmpty!17715 ((_ is ValueCellFull!5021) mapValue!17715)) b!416046))

(assert (= (and b!416050 ((_ is ValueCellFull!5021) mapDefault!17715)) b!416041))

(assert (= start!39296 b!416050))

(declare-fun b_lambda!8863 () Bool)

(assert (=> (not b_lambda!8863) (not b!416052)))

(declare-fun t!12273 () Bool)

(declare-fun tb!3191 () Bool)

(assert (=> (and start!39296 (= defaultEntry!557 defaultEntry!557) t!12273) tb!3191))

(declare-fun result!5917 () Bool)

(assert (=> tb!3191 (= result!5917 tp_is_empty!10729)))

(assert (=> b!416052 t!12273))

(declare-fun b_and!17005 () Bool)

(assert (= b_and!17003 (and (=> t!12273 result!5917) b_and!17005)))

(declare-fun m!404717 () Bool)

(assert (=> b!416051 m!404717))

(declare-fun m!404719 () Bool)

(assert (=> b!416051 m!404719))

(declare-fun m!404721 () Bool)

(assert (=> b!416051 m!404721))

(declare-fun m!404723 () Bool)

(assert (=> b!416044 m!404723))

(declare-fun m!404725 () Bool)

(assert (=> b!416044 m!404725))

(declare-fun m!404727 () Bool)

(assert (=> b!416047 m!404727))

(declare-fun m!404729 () Bool)

(assert (=> b!416055 m!404729))

(declare-fun m!404731 () Bool)

(assert (=> b!416052 m!404731))

(declare-fun m!404733 () Bool)

(assert (=> b!416052 m!404733))

(assert (=> b!416052 m!404719))

(declare-fun m!404735 () Bool)

(assert (=> b!416052 m!404735))

(declare-fun m!404737 () Bool)

(assert (=> b!416052 m!404737))

(declare-fun m!404739 () Bool)

(assert (=> b!416052 m!404739))

(declare-fun m!404741 () Bool)

(assert (=> b!416052 m!404741))

(declare-fun m!404743 () Bool)

(assert (=> b!416052 m!404743))

(assert (=> b!416052 m!404739))

(declare-fun m!404745 () Bool)

(assert (=> b!416052 m!404745))

(declare-fun m!404747 () Bool)

(assert (=> b!416052 m!404747))

(assert (=> b!416052 m!404731))

(declare-fun m!404749 () Bool)

(assert (=> b!416052 m!404749))

(declare-fun m!404751 () Bool)

(assert (=> b!416052 m!404751))

(declare-fun m!404753 () Bool)

(assert (=> b!416052 m!404753))

(assert (=> b!416052 m!404745))

(declare-fun m!404755 () Bool)

(assert (=> bm!28882 m!404755))

(declare-fun m!404757 () Bool)

(assert (=> b!416048 m!404757))

(declare-fun m!404759 () Bool)

(assert (=> mapNonEmpty!17715 m!404759))

(declare-fun m!404761 () Bool)

(assert (=> start!39296 m!404761))

(declare-fun m!404763 () Bool)

(assert (=> start!39296 m!404763))

(declare-fun m!404765 () Bool)

(assert (=> b!416049 m!404765))

(assert (=> b!416049 m!404765))

(declare-fun m!404767 () Bool)

(assert (=> b!416049 m!404767))

(declare-fun m!404769 () Bool)

(assert (=> b!416049 m!404769))

(declare-fun m!404771 () Bool)

(assert (=> bm!28881 m!404771))

(declare-fun m!404773 () Bool)

(assert (=> b!416056 m!404773))

(declare-fun m!404775 () Bool)

(assert (=> b!416045 m!404775))

(declare-fun m!404777 () Bool)

(assert (=> b!416042 m!404777))

(declare-fun m!404779 () Bool)

(assert (=> b!416038 m!404779))

(declare-fun m!404781 () Bool)

(assert (=> b!416053 m!404781))

(check-sat (not bm!28882) (not b!416055) (not b_next!9577) (not b_lambda!8863) (not b!416045) (not mapNonEmpty!17715) (not b!416048) b_and!17005 (not b!416042) (not bm!28881) (not b!416051) tp_is_empty!10729 (not b!416053) (not b!416052) (not b!416049) (not start!39296) (not b!416044) (not b!416047) (not b!416056))
(check-sat b_and!17005 (not b_next!9577))
