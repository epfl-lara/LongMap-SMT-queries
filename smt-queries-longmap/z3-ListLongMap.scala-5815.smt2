; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75160 () Bool)

(assert start!75160)

(declare-fun b_free!15481 () Bool)

(declare-fun b_next!15481 () Bool)

(assert (=> start!75160 (= b_free!15481 (not b_next!15481))))

(declare-fun tp!54150 () Bool)

(declare-fun b_and!25681 () Bool)

(assert (=> start!75160 (= tp!54150 b_and!25681)))

(declare-fun b!885542 () Bool)

(declare-fun e!492897 () Bool)

(declare-fun e!492894 () Bool)

(assert (=> b!885542 (= e!492897 e!492894)))

(declare-fun res!601300 () Bool)

(assert (=> b!885542 (=> (not res!601300) (not e!492894))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!885542 (= res!601300 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!28681 0))(
  ( (V!28682 (val!8910 Int)) )
))
(declare-datatypes ((ValueCell!8423 0))(
  ( (ValueCellFull!8423 (v!11383 V!28681)) (EmptyCell!8423) )
))
(declare-datatypes ((array!51617 0))(
  ( (array!51618 (arr!24822 (Array (_ BitVec 32) ValueCell!8423)) (size!25263 (_ BitVec 32))) )
))
(declare-fun lt!401098 () array!51617)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51619 0))(
  ( (array!51620 (arr!24823 (Array (_ BitVec 32) (_ BitVec 64))) (size!25264 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51619)

(declare-fun minValue!654 () V!28681)

(declare-fun zeroValue!654 () V!28681)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11748 0))(
  ( (tuple2!11749 (_1!5885 (_ BitVec 64)) (_2!5885 V!28681)) )
))
(declare-datatypes ((List!17580 0))(
  ( (Nil!17577) (Cons!17576 (h!18713 tuple2!11748) (t!24847 List!17580)) )
))
(declare-datatypes ((ListLongMap!10519 0))(
  ( (ListLongMap!10520 (toList!5275 List!17580)) )
))
(declare-fun lt!401100 () ListLongMap!10519)

(declare-fun getCurrentListMapNoExtraKeys!3311 (array!51619 array!51617 (_ BitVec 32) (_ BitVec 32) V!28681 V!28681 (_ BitVec 32) Int) ListLongMap!10519)

(assert (=> b!885542 (= lt!401100 (getCurrentListMapNoExtraKeys!3311 _keys!868 lt!401098 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28681)

(declare-fun _values!688 () array!51617)

(assert (=> b!885542 (= lt!401098 (array!51618 (store (arr!24822 _values!688) i!612 (ValueCellFull!8423 v!557)) (size!25263 _values!688)))))

(declare-fun lt!401101 () ListLongMap!10519)

(assert (=> b!885542 (= lt!401101 (getCurrentListMapNoExtraKeys!3311 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!885543 () Bool)

(declare-fun e!492899 () Bool)

(declare-fun e!492898 () Bool)

(declare-fun mapRes!28227 () Bool)

(assert (=> b!885543 (= e!492899 (and e!492898 mapRes!28227))))

(declare-fun condMapEmpty!28227 () Bool)

(declare-fun mapDefault!28227 () ValueCell!8423)

(assert (=> b!885543 (= condMapEmpty!28227 (= (arr!24822 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8423)) mapDefault!28227)))))

(declare-fun b!885544 () Bool)

(declare-fun res!601305 () Bool)

(assert (=> b!885544 (=> (not res!601305) (not e!492897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51619 (_ BitVec 32)) Bool)

(assert (=> b!885544 (= res!601305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!885545 () Bool)

(declare-fun res!601303 () Bool)

(assert (=> b!885545 (=> (not res!601303) (not e!492897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!885545 (= res!601303 (validMask!0 mask!1196))))

(declare-fun b!885546 () Bool)

(declare-fun res!601298 () Bool)

(assert (=> b!885546 (=> (not res!601298) (not e!492897))))

(assert (=> b!885546 (= res!601298 (and (= (size!25263 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25264 _keys!868) (size!25263 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!885547 () Bool)

(declare-fun res!601306 () Bool)

(assert (=> b!885547 (=> (not res!601306) (not e!492897))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!885547 (= res!601306 (validKeyInArray!0 k0!854))))

(declare-fun res!601301 () Bool)

(assert (=> start!75160 (=> (not res!601301) (not e!492897))))

(assert (=> start!75160 (= res!601301 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25264 _keys!868))))))

(assert (=> start!75160 e!492897))

(declare-fun tp_is_empty!17725 () Bool)

(assert (=> start!75160 tp_is_empty!17725))

(assert (=> start!75160 true))

(assert (=> start!75160 tp!54150))

(declare-fun array_inv!19580 (array!51619) Bool)

(assert (=> start!75160 (array_inv!19580 _keys!868)))

(declare-fun array_inv!19581 (array!51617) Bool)

(assert (=> start!75160 (and (array_inv!19581 _values!688) e!492899)))

(declare-fun b!885548 () Bool)

(declare-fun res!601299 () Bool)

(assert (=> b!885548 (=> (not res!601299) (not e!492897))))

(assert (=> b!885548 (= res!601299 (and (= (select (arr!24823 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!885549 () Bool)

(declare-fun e!492895 () Bool)

(assert (=> b!885549 (= e!492895 tp_is_empty!17725)))

(declare-fun b!885550 () Bool)

(assert (=> b!885550 (= e!492894 (not true))))

(declare-fun +!2587 (ListLongMap!10519 tuple2!11748) ListLongMap!10519)

(assert (=> b!885550 (= (getCurrentListMapNoExtraKeys!3311 _keys!868 lt!401098 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2587 (getCurrentListMapNoExtraKeys!3311 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11749 k0!854 v!557)))))

(declare-datatypes ((Unit!30188 0))(
  ( (Unit!30189) )
))
(declare-fun lt!401099 () Unit!30188)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!748 (array!51619 array!51617 (_ BitVec 32) (_ BitVec 32) V!28681 V!28681 (_ BitVec 32) (_ BitVec 64) V!28681 (_ BitVec 32) Int) Unit!30188)

(assert (=> b!885550 (= lt!401099 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!748 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!885551 () Bool)

(declare-fun res!601304 () Bool)

(assert (=> b!885551 (=> (not res!601304) (not e!492897))))

(assert (=> b!885551 (= res!601304 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25264 _keys!868))))))

(declare-fun b!885552 () Bool)

(assert (=> b!885552 (= e!492898 tp_is_empty!17725)))

(declare-fun mapNonEmpty!28227 () Bool)

(declare-fun tp!54149 () Bool)

(assert (=> mapNonEmpty!28227 (= mapRes!28227 (and tp!54149 e!492895))))

(declare-fun mapKey!28227 () (_ BitVec 32))

(declare-fun mapRest!28227 () (Array (_ BitVec 32) ValueCell!8423))

(declare-fun mapValue!28227 () ValueCell!8423)

(assert (=> mapNonEmpty!28227 (= (arr!24822 _values!688) (store mapRest!28227 mapKey!28227 mapValue!28227))))

(declare-fun mapIsEmpty!28227 () Bool)

(assert (=> mapIsEmpty!28227 mapRes!28227))

(declare-fun b!885553 () Bool)

(declare-fun res!601302 () Bool)

(assert (=> b!885553 (=> (not res!601302) (not e!492897))))

(declare-datatypes ((List!17581 0))(
  ( (Nil!17578) (Cons!17577 (h!18714 (_ BitVec 64)) (t!24848 List!17581)) )
))
(declare-fun arrayNoDuplicates!0 (array!51619 (_ BitVec 32) List!17581) Bool)

(assert (=> b!885553 (= res!601302 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17578))))

(assert (= (and start!75160 res!601301) b!885545))

(assert (= (and b!885545 res!601303) b!885546))

(assert (= (and b!885546 res!601298) b!885544))

(assert (= (and b!885544 res!601305) b!885553))

(assert (= (and b!885553 res!601302) b!885551))

(assert (= (and b!885551 res!601304) b!885547))

(assert (= (and b!885547 res!601306) b!885548))

(assert (= (and b!885548 res!601299) b!885542))

(assert (= (and b!885542 res!601300) b!885550))

(assert (= (and b!885543 condMapEmpty!28227) mapIsEmpty!28227))

(assert (= (and b!885543 (not condMapEmpty!28227)) mapNonEmpty!28227))

(get-info :version)

(assert (= (and mapNonEmpty!28227 ((_ is ValueCellFull!8423) mapValue!28227)) b!885549))

(assert (= (and b!885543 ((_ is ValueCellFull!8423) mapDefault!28227)) b!885552))

(assert (= start!75160 b!885543))

(declare-fun m!826175 () Bool)

(assert (=> b!885550 m!826175))

(declare-fun m!826177 () Bool)

(assert (=> b!885550 m!826177))

(assert (=> b!885550 m!826177))

(declare-fun m!826179 () Bool)

(assert (=> b!885550 m!826179))

(declare-fun m!826181 () Bool)

(assert (=> b!885550 m!826181))

(declare-fun m!826183 () Bool)

(assert (=> b!885548 m!826183))

(declare-fun m!826185 () Bool)

(assert (=> start!75160 m!826185))

(declare-fun m!826187 () Bool)

(assert (=> start!75160 m!826187))

(declare-fun m!826189 () Bool)

(assert (=> b!885545 m!826189))

(declare-fun m!826191 () Bool)

(assert (=> mapNonEmpty!28227 m!826191))

(declare-fun m!826193 () Bool)

(assert (=> b!885547 m!826193))

(declare-fun m!826195 () Bool)

(assert (=> b!885542 m!826195))

(declare-fun m!826197 () Bool)

(assert (=> b!885542 m!826197))

(declare-fun m!826199 () Bool)

(assert (=> b!885542 m!826199))

(declare-fun m!826201 () Bool)

(assert (=> b!885544 m!826201))

(declare-fun m!826203 () Bool)

(assert (=> b!885553 m!826203))

(check-sat (not b!885542) (not b!885553) (not b!885544) b_and!25681 (not b_next!15481) (not start!75160) (not b!885550) (not b!885545) (not b!885547) tp_is_empty!17725 (not mapNonEmpty!28227))
(check-sat b_and!25681 (not b_next!15481))
