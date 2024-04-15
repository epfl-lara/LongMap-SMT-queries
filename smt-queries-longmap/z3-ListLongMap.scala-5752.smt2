; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74322 () Bool)

(assert start!74322)

(declare-fun b_free!15103 () Bool)

(declare-fun b_next!15103 () Bool)

(assert (=> start!74322 (= b_free!15103 (not b_next!15103))))

(declare-fun tp!52985 () Bool)

(declare-fun b_and!24853 () Bool)

(assert (=> start!74322 (= tp!52985 b_and!24853)))

(declare-fun b!874635 () Bool)

(declare-fun res!594457 () Bool)

(declare-fun e!486918 () Bool)

(assert (=> b!874635 (=> (not res!594457) (not e!486918))))

(declare-datatypes ((array!50803 0))(
  ( (array!50804 (arr!24430 (Array (_ BitVec 32) (_ BitVec 64))) (size!24872 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50803)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50803 (_ BitVec 32)) Bool)

(assert (=> b!874635 (= res!594457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27629 () Bool)

(declare-fun mapRes!27629 () Bool)

(assert (=> mapIsEmpty!27629 mapRes!27629))

(declare-fun b!874636 () Bool)

(declare-fun res!594458 () Bool)

(assert (=> b!874636 (=> (not res!594458) (not e!486918))))

(declare-datatypes ((List!17344 0))(
  ( (Nil!17341) (Cons!17340 (h!18471 (_ BitVec 64)) (t!24376 List!17344)) )
))
(declare-fun arrayNoDuplicates!0 (array!50803 (_ BitVec 32) List!17344) Bool)

(assert (=> b!874636 (= res!594458 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17341))))

(declare-fun b!874637 () Bool)

(declare-fun e!486919 () Bool)

(declare-fun e!486921 () Bool)

(assert (=> b!874637 (= e!486919 (and e!486921 mapRes!27629))))

(declare-fun condMapEmpty!27629 () Bool)

(declare-datatypes ((V!28177 0))(
  ( (V!28178 (val!8721 Int)) )
))
(declare-datatypes ((ValueCell!8234 0))(
  ( (ValueCellFull!8234 (v!11144 V!28177)) (EmptyCell!8234) )
))
(declare-datatypes ((array!50805 0))(
  ( (array!50806 (arr!24431 (Array (_ BitVec 32) ValueCell!8234)) (size!24873 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50805)

(declare-fun mapDefault!27629 () ValueCell!8234)

(assert (=> b!874637 (= condMapEmpty!27629 (= (arr!24431 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8234)) mapDefault!27629)))))

(declare-fun b!874638 () Bool)

(declare-fun res!594459 () Bool)

(assert (=> b!874638 (=> (not res!594459) (not e!486918))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874638 (= res!594459 (validKeyInArray!0 k0!854))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun b!874639 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874639 (= e!486918 (and (= from!1053 i!612) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24872 _keys!868)) (bvsge (bvsub (size!24872 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (bvsub (size!24872 _keys!868) from!1053))))))

(declare-fun v!557 () V!28177)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28177)

(declare-fun zeroValue!654 () V!28177)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11530 0))(
  ( (tuple2!11531 (_1!5776 (_ BitVec 64)) (_2!5776 V!28177)) )
))
(declare-datatypes ((List!17345 0))(
  ( (Nil!17342) (Cons!17341 (h!18472 tuple2!11530) (t!24377 List!17345)) )
))
(declare-datatypes ((ListLongMap!10289 0))(
  ( (ListLongMap!10290 (toList!5160 List!17345)) )
))
(declare-fun lt!395787 () ListLongMap!10289)

(declare-fun getCurrentListMapNoExtraKeys!3153 (array!50803 array!50805 (_ BitVec 32) (_ BitVec 32) V!28177 V!28177 (_ BitVec 32) Int) ListLongMap!10289)

(assert (=> b!874639 (= lt!395787 (getCurrentListMapNoExtraKeys!3153 _keys!868 (array!50806 (store (arr!24431 _values!688) i!612 (ValueCellFull!8234 v!557)) (size!24873 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395786 () ListLongMap!10289)

(assert (=> b!874639 (= lt!395786 (getCurrentListMapNoExtraKeys!3153 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874640 () Bool)

(declare-fun e!486920 () Bool)

(declare-fun tp_is_empty!17347 () Bool)

(assert (=> b!874640 (= e!486920 tp_is_empty!17347)))

(declare-fun b!874641 () Bool)

(declare-fun res!594453 () Bool)

(assert (=> b!874641 (=> (not res!594453) (not e!486918))))

(assert (=> b!874641 (= res!594453 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24872 _keys!868))))))

(declare-fun mapNonEmpty!27629 () Bool)

(declare-fun tp!52984 () Bool)

(assert (=> mapNonEmpty!27629 (= mapRes!27629 (and tp!52984 e!486920))))

(declare-fun mapKey!27629 () (_ BitVec 32))

(declare-fun mapValue!27629 () ValueCell!8234)

(declare-fun mapRest!27629 () (Array (_ BitVec 32) ValueCell!8234))

(assert (=> mapNonEmpty!27629 (= (arr!24431 _values!688) (store mapRest!27629 mapKey!27629 mapValue!27629))))

(declare-fun res!594456 () Bool)

(assert (=> start!74322 (=> (not res!594456) (not e!486918))))

(assert (=> start!74322 (= res!594456 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24872 _keys!868))))))

(assert (=> start!74322 e!486918))

(assert (=> start!74322 tp_is_empty!17347))

(assert (=> start!74322 true))

(assert (=> start!74322 tp!52985))

(declare-fun array_inv!19316 (array!50803) Bool)

(assert (=> start!74322 (array_inv!19316 _keys!868)))

(declare-fun array_inv!19317 (array!50805) Bool)

(assert (=> start!74322 (and (array_inv!19317 _values!688) e!486919)))

(declare-fun b!874642 () Bool)

(assert (=> b!874642 (= e!486921 tp_is_empty!17347)))

(declare-fun b!874643 () Bool)

(declare-fun res!594455 () Bool)

(assert (=> b!874643 (=> (not res!594455) (not e!486918))))

(assert (=> b!874643 (= res!594455 (and (= (select (arr!24430 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874644 () Bool)

(declare-fun res!594460 () Bool)

(assert (=> b!874644 (=> (not res!594460) (not e!486918))))

(assert (=> b!874644 (= res!594460 (and (= (size!24873 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24872 _keys!868) (size!24873 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874645 () Bool)

(declare-fun res!594454 () Bool)

(assert (=> b!874645 (=> (not res!594454) (not e!486918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874645 (= res!594454 (validMask!0 mask!1196))))

(assert (= (and start!74322 res!594456) b!874645))

(assert (= (and b!874645 res!594454) b!874644))

(assert (= (and b!874644 res!594460) b!874635))

(assert (= (and b!874635 res!594457) b!874636))

(assert (= (and b!874636 res!594458) b!874641))

(assert (= (and b!874641 res!594453) b!874638))

(assert (= (and b!874638 res!594459) b!874643))

(assert (= (and b!874643 res!594455) b!874639))

(assert (= (and b!874637 condMapEmpty!27629) mapIsEmpty!27629))

(assert (= (and b!874637 (not condMapEmpty!27629)) mapNonEmpty!27629))

(get-info :version)

(assert (= (and mapNonEmpty!27629 ((_ is ValueCellFull!8234) mapValue!27629)) b!874640))

(assert (= (and b!874637 ((_ is ValueCellFull!8234) mapDefault!27629)) b!874642))

(assert (= start!74322 b!874637))

(declare-fun m!814139 () Bool)

(assert (=> b!874639 m!814139))

(declare-fun m!814141 () Bool)

(assert (=> b!874639 m!814141))

(declare-fun m!814143 () Bool)

(assert (=> b!874639 m!814143))

(declare-fun m!814145 () Bool)

(assert (=> b!874635 m!814145))

(declare-fun m!814147 () Bool)

(assert (=> b!874643 m!814147))

(declare-fun m!814149 () Bool)

(assert (=> b!874638 m!814149))

(declare-fun m!814151 () Bool)

(assert (=> start!74322 m!814151))

(declare-fun m!814153 () Bool)

(assert (=> start!74322 m!814153))

(declare-fun m!814155 () Bool)

(assert (=> b!874645 m!814155))

(declare-fun m!814157 () Bool)

(assert (=> b!874636 m!814157))

(declare-fun m!814159 () Bool)

(assert (=> mapNonEmpty!27629 m!814159))

(check-sat (not b!874645) (not b_next!15103) (not b!874636) (not b!874635) (not b!874638) (not b!874639) (not start!74322) (not mapNonEmpty!27629) tp_is_empty!17347 b_and!24853)
(check-sat b_and!24853 (not b_next!15103))
