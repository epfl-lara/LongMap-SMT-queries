; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74058 () Bool)

(assert start!74058)

(declare-fun b_free!14973 () Bool)

(declare-fun b_next!14973 () Bool)

(assert (=> start!74058 (= b_free!14973 (not b_next!14973))))

(declare-fun tp!52422 () Bool)

(declare-fun b_and!24725 () Bool)

(assert (=> start!74058 (= tp!52422 b_and!24725)))

(declare-fun mapIsEmpty!27263 () Bool)

(declare-fun mapRes!27263 () Bool)

(assert (=> mapIsEmpty!27263 mapRes!27263))

(declare-fun b!871167 () Bool)

(declare-fun e!485056 () Bool)

(declare-fun e!485055 () Bool)

(assert (=> b!871167 (= e!485056 (and e!485055 mapRes!27263))))

(declare-fun condMapEmpty!27263 () Bool)

(declare-datatypes ((V!27859 0))(
  ( (V!27860 (val!8602 Int)) )
))
(declare-datatypes ((ValueCell!8115 0))(
  ( (ValueCellFull!8115 (v!11027 V!27859)) (EmptyCell!8115) )
))
(declare-datatypes ((array!50358 0))(
  ( (array!50359 (arr!24210 (Array (_ BitVec 32) ValueCell!8115)) (size!24650 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50358)

(declare-fun mapDefault!27263 () ValueCell!8115)

(assert (=> b!871167 (= condMapEmpty!27263 (= (arr!24210 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8115)) mapDefault!27263)))))

(declare-fun b!871168 () Bool)

(declare-fun res!592155 () Bool)

(declare-fun e!485059 () Bool)

(assert (=> b!871168 (=> (not res!592155) (not e!485059))))

(declare-datatypes ((array!50360 0))(
  ( (array!50361 (arr!24211 (Array (_ BitVec 32) (_ BitVec 64))) (size!24651 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50360)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50360 (_ BitVec 32)) Bool)

(assert (=> b!871168 (= res!592155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27263 () Bool)

(declare-fun tp!52423 () Bool)

(declare-fun e!485054 () Bool)

(assert (=> mapNonEmpty!27263 (= mapRes!27263 (and tp!52423 e!485054))))

(declare-fun mapKey!27263 () (_ BitVec 32))

(declare-fun mapValue!27263 () ValueCell!8115)

(declare-fun mapRest!27263 () (Array (_ BitVec 32) ValueCell!8115))

(assert (=> mapNonEmpty!27263 (= (arr!24210 _values!688) (store mapRest!27263 mapKey!27263 mapValue!27263))))

(declare-fun b!871169 () Bool)

(declare-fun res!592156 () Bool)

(assert (=> b!871169 (=> (not res!592156) (not e!485059))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871169 (= res!592156 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24651 _keys!868))))))

(declare-fun b!871170 () Bool)

(declare-fun res!592157 () Bool)

(assert (=> b!871170 (=> (not res!592157) (not e!485059))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871170 (= res!592157 (validKeyInArray!0 k0!854))))

(declare-fun b!871171 () Bool)

(declare-fun tp_is_empty!17109 () Bool)

(assert (=> b!871171 (= e!485054 tp_is_empty!17109)))

(declare-fun b!871172 () Bool)

(assert (=> b!871172 (= e!485055 tp_is_empty!17109)))

(declare-fun b!871173 () Bool)

(declare-fun res!592151 () Bool)

(assert (=> b!871173 (=> (not res!592151) (not e!485059))))

(declare-datatypes ((List!17217 0))(
  ( (Nil!17214) (Cons!17213 (h!18344 (_ BitVec 64)) (t!24254 List!17217)) )
))
(declare-fun arrayNoDuplicates!0 (array!50360 (_ BitVec 32) List!17217) Bool)

(assert (=> b!871173 (= res!592151 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17214))))

(declare-fun b!871174 () Bool)

(declare-fun res!592152 () Bool)

(assert (=> b!871174 (=> (not res!592152) (not e!485059))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!871174 (= res!592152 (and (= (select (arr!24211 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871175 () Bool)

(declare-fun e!485058 () Bool)

(assert (=> b!871175 (= e!485059 e!485058)))

(declare-fun res!592149 () Bool)

(assert (=> b!871175 (=> (not res!592149) (not e!485058))))

(assert (=> b!871175 (= res!592149 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395377 () array!50358)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11430 0))(
  ( (tuple2!11431 (_1!5726 (_ BitVec 64)) (_2!5726 V!27859)) )
))
(declare-datatypes ((List!17218 0))(
  ( (Nil!17215) (Cons!17214 (h!18345 tuple2!11430) (t!24255 List!17218)) )
))
(declare-datatypes ((ListLongMap!10199 0))(
  ( (ListLongMap!10200 (toList!5115 List!17218)) )
))
(declare-fun lt!395379 () ListLongMap!10199)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27859)

(declare-fun zeroValue!654 () V!27859)

(declare-fun getCurrentListMapNoExtraKeys!3084 (array!50360 array!50358 (_ BitVec 32) (_ BitVec 32) V!27859 V!27859 (_ BitVec 32) Int) ListLongMap!10199)

(assert (=> b!871175 (= lt!395379 (getCurrentListMapNoExtraKeys!3084 _keys!868 lt!395377 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27859)

(assert (=> b!871175 (= lt!395377 (array!50359 (store (arr!24210 _values!688) i!612 (ValueCellFull!8115 v!557)) (size!24650 _values!688)))))

(declare-fun lt!395378 () ListLongMap!10199)

(assert (=> b!871175 (= lt!395378 (getCurrentListMapNoExtraKeys!3084 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871176 () Bool)

(declare-fun res!592153 () Bool)

(assert (=> b!871176 (=> (not res!592153) (not e!485059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871176 (= res!592153 (validMask!0 mask!1196))))

(declare-fun b!871177 () Bool)

(assert (=> b!871177 (= e!485058 (not true))))

(declare-fun +!2450 (ListLongMap!10199 tuple2!11430) ListLongMap!10199)

(assert (=> b!871177 (= (getCurrentListMapNoExtraKeys!3084 _keys!868 lt!395377 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2450 (getCurrentListMapNoExtraKeys!3084 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11431 k0!854 v!557)))))

(declare-datatypes ((Unit!29898 0))(
  ( (Unit!29899) )
))
(declare-fun lt!395380 () Unit!29898)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!644 (array!50360 array!50358 (_ BitVec 32) (_ BitVec 32) V!27859 V!27859 (_ BitVec 32) (_ BitVec 64) V!27859 (_ BitVec 32) Int) Unit!29898)

(assert (=> b!871177 (= lt!395380 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!644 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871178 () Bool)

(declare-fun res!592154 () Bool)

(assert (=> b!871178 (=> (not res!592154) (not e!485059))))

(assert (=> b!871178 (= res!592154 (and (= (size!24650 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24651 _keys!868) (size!24650 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!592150 () Bool)

(assert (=> start!74058 (=> (not res!592150) (not e!485059))))

(assert (=> start!74058 (= res!592150 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24651 _keys!868))))))

(assert (=> start!74058 e!485059))

(assert (=> start!74058 tp_is_empty!17109))

(assert (=> start!74058 true))

(assert (=> start!74058 tp!52422))

(declare-fun array_inv!19116 (array!50360) Bool)

(assert (=> start!74058 (array_inv!19116 _keys!868)))

(declare-fun array_inv!19117 (array!50358) Bool)

(assert (=> start!74058 (and (array_inv!19117 _values!688) e!485056)))

(assert (= (and start!74058 res!592150) b!871176))

(assert (= (and b!871176 res!592153) b!871178))

(assert (= (and b!871178 res!592154) b!871168))

(assert (= (and b!871168 res!592155) b!871173))

(assert (= (and b!871173 res!592151) b!871169))

(assert (= (and b!871169 res!592156) b!871170))

(assert (= (and b!871170 res!592157) b!871174))

(assert (= (and b!871174 res!592152) b!871175))

(assert (= (and b!871175 res!592149) b!871177))

(assert (= (and b!871167 condMapEmpty!27263) mapIsEmpty!27263))

(assert (= (and b!871167 (not condMapEmpty!27263)) mapNonEmpty!27263))

(get-info :version)

(assert (= (and mapNonEmpty!27263 ((_ is ValueCellFull!8115) mapValue!27263)) b!871171))

(assert (= (and b!871167 ((_ is ValueCellFull!8115) mapDefault!27263)) b!871172))

(assert (= start!74058 b!871167))

(declare-fun m!812417 () Bool)

(assert (=> b!871170 m!812417))

(declare-fun m!812419 () Bool)

(assert (=> b!871177 m!812419))

(declare-fun m!812421 () Bool)

(assert (=> b!871177 m!812421))

(assert (=> b!871177 m!812421))

(declare-fun m!812423 () Bool)

(assert (=> b!871177 m!812423))

(declare-fun m!812425 () Bool)

(assert (=> b!871177 m!812425))

(declare-fun m!812427 () Bool)

(assert (=> b!871176 m!812427))

(declare-fun m!812429 () Bool)

(assert (=> b!871175 m!812429))

(declare-fun m!812431 () Bool)

(assert (=> b!871175 m!812431))

(declare-fun m!812433 () Bool)

(assert (=> b!871175 m!812433))

(declare-fun m!812435 () Bool)

(assert (=> b!871168 m!812435))

(declare-fun m!812437 () Bool)

(assert (=> start!74058 m!812437))

(declare-fun m!812439 () Bool)

(assert (=> start!74058 m!812439))

(declare-fun m!812441 () Bool)

(assert (=> b!871174 m!812441))

(declare-fun m!812443 () Bool)

(assert (=> mapNonEmpty!27263 m!812443))

(declare-fun m!812445 () Bool)

(assert (=> b!871173 m!812445))

(check-sat (not b!871173) b_and!24725 (not b!871176) (not b!871177) (not mapNonEmpty!27263) tp_is_empty!17109 (not b!871175) (not b!871170) (not b!871168) (not start!74058) (not b_next!14973))
(check-sat b_and!24725 (not b_next!14973))
