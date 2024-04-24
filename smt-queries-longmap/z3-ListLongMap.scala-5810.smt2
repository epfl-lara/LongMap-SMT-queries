; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75100 () Bool)

(assert start!75100)

(declare-fun b_free!15451 () Bool)

(declare-fun b_next!15451 () Bool)

(assert (=> start!75100 (= b_free!15451 (not b_next!15451))))

(declare-fun tp!54056 () Bool)

(declare-fun b_and!25611 () Bool)

(assert (=> start!75100 (= tp!54056 b_and!25611)))

(declare-fun b!884693 () Bool)

(declare-fun res!600764 () Bool)

(declare-fun e!492425 () Bool)

(assert (=> b!884693 (=> (not res!600764) (not e!492425))))

(declare-datatypes ((array!51555 0))(
  ( (array!51556 (arr!24792 (Array (_ BitVec 32) (_ BitVec 64))) (size!25233 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51555)

(declare-datatypes ((List!17556 0))(
  ( (Nil!17553) (Cons!17552 (h!18689 (_ BitVec 64)) (t!24801 List!17556)) )
))
(declare-fun arrayNoDuplicates!0 (array!51555 (_ BitVec 32) List!17556) Bool)

(assert (=> b!884693 (= res!600764 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17553))))

(declare-fun b!884694 () Bool)

(declare-fun e!492430 () Bool)

(declare-fun tp_is_empty!17695 () Bool)

(assert (=> b!884694 (= e!492430 tp_is_empty!17695)))

(declare-fun b!884695 () Bool)

(declare-fun res!600759 () Bool)

(assert (=> b!884695 (=> (not res!600759) (not e!492425))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!884695 (= res!600759 (and (= (select (arr!24792 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!884696 () Bool)

(declare-datatypes ((Unit!30145 0))(
  ( (Unit!30146) )
))
(declare-fun e!492428 () Unit!30145)

(declare-fun Unit!30147 () Unit!30145)

(assert (=> b!884696 (= e!492428 Unit!30147)))

(declare-fun b!884697 () Bool)

(declare-fun e!492429 () Bool)

(declare-fun mapRes!28179 () Bool)

(assert (=> b!884697 (= e!492429 (and e!492430 mapRes!28179))))

(declare-fun condMapEmpty!28179 () Bool)

(declare-datatypes ((V!28641 0))(
  ( (V!28642 (val!8895 Int)) )
))
(declare-datatypes ((ValueCell!8408 0))(
  ( (ValueCellFull!8408 (v!11364 V!28641)) (EmptyCell!8408) )
))
(declare-datatypes ((array!51557 0))(
  ( (array!51558 (arr!24793 (Array (_ BitVec 32) ValueCell!8408)) (size!25234 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51557)

(declare-fun mapDefault!28179 () ValueCell!8408)

(assert (=> b!884697 (= condMapEmpty!28179 (= (arr!24793 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8408)) mapDefault!28179)))))

(declare-fun b!884698 () Bool)

(declare-fun res!600763 () Bool)

(assert (=> b!884698 (=> (not res!600763) (not e!492425))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!884698 (= res!600763 (validMask!0 mask!1196))))

(declare-fun b!884699 () Bool)

(declare-fun e!492427 () Bool)

(assert (=> b!884699 (= e!492425 e!492427)))

(declare-fun res!600761 () Bool)

(assert (=> b!884699 (=> (not res!600761) (not e!492427))))

(assert (=> b!884699 (= res!600761 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11724 0))(
  ( (tuple2!11725 (_1!5873 (_ BitVec 64)) (_2!5873 V!28641)) )
))
(declare-datatypes ((List!17557 0))(
  ( (Nil!17554) (Cons!17553 (h!18690 tuple2!11724) (t!24802 List!17557)) )
))
(declare-datatypes ((ListLongMap!10495 0))(
  ( (ListLongMap!10496 (toList!5263 List!17557)) )
))
(declare-fun lt!400454 () ListLongMap!10495)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!400461 () array!51557)

(declare-fun minValue!654 () V!28641)

(declare-fun zeroValue!654 () V!28641)

(declare-fun getCurrentListMapNoExtraKeys!3301 (array!51555 array!51557 (_ BitVec 32) (_ BitVec 32) V!28641 V!28641 (_ BitVec 32) Int) ListLongMap!10495)

(assert (=> b!884699 (= lt!400454 (getCurrentListMapNoExtraKeys!3301 _keys!868 lt!400461 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28641)

(assert (=> b!884699 (= lt!400461 (array!51558 (store (arr!24793 _values!688) i!612 (ValueCellFull!8408 v!557)) (size!25234 _values!688)))))

(declare-fun lt!400452 () ListLongMap!10495)

(assert (=> b!884699 (= lt!400452 (getCurrentListMapNoExtraKeys!3301 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!884700 () Bool)

(declare-fun e!492432 () Bool)

(assert (=> b!884700 (= e!492427 (not e!492432))))

(declare-fun res!600760 () Bool)

(assert (=> b!884700 (=> res!600760 e!492432)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!884700 (= res!600760 (not (validKeyInArray!0 (select (arr!24792 _keys!868) from!1053))))))

(declare-fun lt!400455 () ListLongMap!10495)

(declare-fun lt!400453 () ListLongMap!10495)

(assert (=> b!884700 (= lt!400455 lt!400453)))

(declare-fun lt!400451 () ListLongMap!10495)

(declare-fun +!2575 (ListLongMap!10495 tuple2!11724) ListLongMap!10495)

(assert (=> b!884700 (= lt!400453 (+!2575 lt!400451 (tuple2!11725 k0!854 v!557)))))

(assert (=> b!884700 (= lt!400455 (getCurrentListMapNoExtraKeys!3301 _keys!868 lt!400461 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!884700 (= lt!400451 (getCurrentListMapNoExtraKeys!3301 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400457 () Unit!30145)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!738 (array!51555 array!51557 (_ BitVec 32) (_ BitVec 32) V!28641 V!28641 (_ BitVec 32) (_ BitVec 64) V!28641 (_ BitVec 32) Int) Unit!30145)

(assert (=> b!884700 (= lt!400457 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!738 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!884701 () Bool)

(declare-fun e!492431 () Bool)

(assert (=> b!884701 (= e!492431 tp_is_empty!17695)))

(declare-fun b!884702 () Bool)

(declare-fun res!600765 () Bool)

(assert (=> b!884702 (=> (not res!600765) (not e!492425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51555 (_ BitVec 32)) Bool)

(assert (=> b!884702 (= res!600765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!884703 () Bool)

(assert (=> b!884703 (= e!492432 (not (= k0!854 (select (arr!24792 _keys!868) from!1053))))))

(assert (=> b!884703 (not (= (select (arr!24792 _keys!868) from!1053) k0!854))))

(declare-fun lt!400459 () Unit!30145)

(assert (=> b!884703 (= lt!400459 e!492428)))

(declare-fun c!93364 () Bool)

(assert (=> b!884703 (= c!93364 (= (select (arr!24792 _keys!868) from!1053) k0!854))))

(declare-fun get!13081 (ValueCell!8408 V!28641) V!28641)

(declare-fun dynLambda!1292 (Int (_ BitVec 64)) V!28641)

(assert (=> b!884703 (= lt!400454 (+!2575 lt!400453 (tuple2!11725 (select (arr!24792 _keys!868) from!1053) (get!13081 (select (arr!24793 _values!688) from!1053) (dynLambda!1292 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!884704 () Bool)

(declare-fun res!600758 () Bool)

(assert (=> b!884704 (=> (not res!600758) (not e!492425))))

(assert (=> b!884704 (= res!600758 (and (= (size!25234 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25233 _keys!868) (size!25234 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!600766 () Bool)

(assert (=> start!75100 (=> (not res!600766) (not e!492425))))

(assert (=> start!75100 (= res!600766 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25233 _keys!868))))))

(assert (=> start!75100 e!492425))

(assert (=> start!75100 tp_is_empty!17695))

(assert (=> start!75100 true))

(assert (=> start!75100 tp!54056))

(declare-fun array_inv!19558 (array!51555) Bool)

(assert (=> start!75100 (array_inv!19558 _keys!868)))

(declare-fun array_inv!19559 (array!51557) Bool)

(assert (=> start!75100 (and (array_inv!19559 _values!688) e!492429)))

(declare-fun mapNonEmpty!28179 () Bool)

(declare-fun tp!54057 () Bool)

(assert (=> mapNonEmpty!28179 (= mapRes!28179 (and tp!54057 e!492431))))

(declare-fun mapRest!28179 () (Array (_ BitVec 32) ValueCell!8408))

(declare-fun mapValue!28179 () ValueCell!8408)

(declare-fun mapKey!28179 () (_ BitVec 32))

(assert (=> mapNonEmpty!28179 (= (arr!24793 _values!688) (store mapRest!28179 mapKey!28179 mapValue!28179))))

(declare-fun mapIsEmpty!28179 () Bool)

(assert (=> mapIsEmpty!28179 mapRes!28179))

(declare-fun b!884705 () Bool)

(declare-fun res!600762 () Bool)

(assert (=> b!884705 (=> (not res!600762) (not e!492425))))

(assert (=> b!884705 (= res!600762 (validKeyInArray!0 k0!854))))

(declare-fun b!884706 () Bool)

(declare-fun Unit!30148 () Unit!30145)

(assert (=> b!884706 (= e!492428 Unit!30148)))

(declare-fun lt!400458 () Unit!30145)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51555 (_ BitVec 32) (_ BitVec 32)) Unit!30145)

(assert (=> b!884706 (= lt!400458 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!884706 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17553)))

(declare-fun lt!400460 () Unit!30145)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51555 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30145)

(assert (=> b!884706 (= lt!400460 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!884706 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400456 () Unit!30145)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51555 (_ BitVec 64) (_ BitVec 32) List!17556) Unit!30145)

(assert (=> b!884706 (= lt!400456 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17553))))

(assert (=> b!884706 false))

(declare-fun b!884707 () Bool)

(declare-fun res!600767 () Bool)

(assert (=> b!884707 (=> (not res!600767) (not e!492425))))

(assert (=> b!884707 (= res!600767 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25233 _keys!868))))))

(assert (= (and start!75100 res!600766) b!884698))

(assert (= (and b!884698 res!600763) b!884704))

(assert (= (and b!884704 res!600758) b!884702))

(assert (= (and b!884702 res!600765) b!884693))

(assert (= (and b!884693 res!600764) b!884707))

(assert (= (and b!884707 res!600767) b!884705))

(assert (= (and b!884705 res!600762) b!884695))

(assert (= (and b!884695 res!600759) b!884699))

(assert (= (and b!884699 res!600761) b!884700))

(assert (= (and b!884700 (not res!600760)) b!884703))

(assert (= (and b!884703 c!93364) b!884706))

(assert (= (and b!884703 (not c!93364)) b!884696))

(assert (= (and b!884697 condMapEmpty!28179) mapIsEmpty!28179))

(assert (= (and b!884697 (not condMapEmpty!28179)) mapNonEmpty!28179))

(get-info :version)

(assert (= (and mapNonEmpty!28179 ((_ is ValueCellFull!8408) mapValue!28179)) b!884701))

(assert (= (and b!884697 ((_ is ValueCellFull!8408) mapDefault!28179)) b!884694))

(assert (= start!75100 b!884697))

(declare-fun b_lambda!12743 () Bool)

(assert (=> (not b_lambda!12743) (not b!884703)))

(declare-fun t!24800 () Bool)

(declare-fun tb!5101 () Bool)

(assert (=> (and start!75100 (= defaultEntry!696 defaultEntry!696) t!24800) tb!5101))

(declare-fun result!9845 () Bool)

(assert (=> tb!5101 (= result!9845 tp_is_empty!17695)))

(assert (=> b!884703 t!24800))

(declare-fun b_and!25613 () Bool)

(assert (= b_and!25611 (and (=> t!24800 result!9845) b_and!25613)))

(declare-fun m!825183 () Bool)

(assert (=> b!884703 m!825183))

(declare-fun m!825185 () Bool)

(assert (=> b!884703 m!825185))

(declare-fun m!825187 () Bool)

(assert (=> b!884703 m!825187))

(declare-fun m!825189 () Bool)

(assert (=> b!884703 m!825189))

(assert (=> b!884703 m!825185))

(declare-fun m!825191 () Bool)

(assert (=> b!884703 m!825191))

(assert (=> b!884703 m!825187))

(declare-fun m!825193 () Bool)

(assert (=> b!884700 m!825193))

(assert (=> b!884700 m!825191))

(declare-fun m!825195 () Bool)

(assert (=> b!884700 m!825195))

(declare-fun m!825197 () Bool)

(assert (=> b!884700 m!825197))

(declare-fun m!825199 () Bool)

(assert (=> b!884700 m!825199))

(assert (=> b!884700 m!825191))

(declare-fun m!825201 () Bool)

(assert (=> b!884700 m!825201))

(declare-fun m!825203 () Bool)

(assert (=> mapNonEmpty!28179 m!825203))

(declare-fun m!825205 () Bool)

(assert (=> b!884702 m!825205))

(declare-fun m!825207 () Bool)

(assert (=> b!884693 m!825207))

(declare-fun m!825209 () Bool)

(assert (=> b!884699 m!825209))

(declare-fun m!825211 () Bool)

(assert (=> b!884699 m!825211))

(declare-fun m!825213 () Bool)

(assert (=> b!884699 m!825213))

(declare-fun m!825215 () Bool)

(assert (=> b!884695 m!825215))

(declare-fun m!825217 () Bool)

(assert (=> b!884705 m!825217))

(declare-fun m!825219 () Bool)

(assert (=> start!75100 m!825219))

(declare-fun m!825221 () Bool)

(assert (=> start!75100 m!825221))

(declare-fun m!825223 () Bool)

(assert (=> b!884698 m!825223))

(declare-fun m!825225 () Bool)

(assert (=> b!884706 m!825225))

(declare-fun m!825227 () Bool)

(assert (=> b!884706 m!825227))

(declare-fun m!825229 () Bool)

(assert (=> b!884706 m!825229))

(declare-fun m!825231 () Bool)

(assert (=> b!884706 m!825231))

(declare-fun m!825233 () Bool)

(assert (=> b!884706 m!825233))

(check-sat (not b!884703) (not b_next!15451) (not b!884699) (not mapNonEmpty!28179) (not start!75100) (not b_lambda!12743) tp_is_empty!17695 (not b!884698) b_and!25613 (not b!884702) (not b!884705) (not b!884706) (not b!884700) (not b!884693))
(check-sat b_and!25613 (not b_next!15451))
