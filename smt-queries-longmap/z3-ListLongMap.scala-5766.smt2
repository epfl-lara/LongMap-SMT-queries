; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74480 () Bool)

(assert start!74480)

(declare-fun b_free!15187 () Bool)

(declare-fun b_next!15187 () Bool)

(assert (=> start!74480 (= b_free!15187 (not b_next!15187))))

(declare-fun tp!53243 () Bool)

(declare-fun b_and!25037 () Bool)

(assert (=> start!74480 (= tp!53243 b_and!25037)))

(declare-fun b!877182 () Bool)

(declare-fun e!488292 () Bool)

(declare-fun tp_is_empty!17431 () Bool)

(assert (=> b!877182 (= e!488292 tp_is_empty!17431)))

(declare-fun b!877183 () Bool)

(declare-fun res!595935 () Bool)

(declare-fun e!488291 () Bool)

(assert (=> b!877183 (=> (not res!595935) (not e!488291))))

(declare-datatypes ((array!50969 0))(
  ( (array!50970 (arr!24511 (Array (_ BitVec 32) (_ BitVec 64))) (size!24953 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50969)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50969 (_ BitVec 32)) Bool)

(assert (=> b!877183 (= res!595935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27762 () Bool)

(declare-fun mapRes!27762 () Bool)

(assert (=> mapIsEmpty!27762 mapRes!27762))

(declare-fun mapNonEmpty!27762 () Bool)

(declare-fun tp!53244 () Bool)

(assert (=> mapNonEmpty!27762 (= mapRes!27762 (and tp!53244 e!488292))))

(declare-datatypes ((V!28289 0))(
  ( (V!28290 (val!8763 Int)) )
))
(declare-datatypes ((ValueCell!8276 0))(
  ( (ValueCellFull!8276 (v!11197 V!28289)) (EmptyCell!8276) )
))
(declare-fun mapRest!27762 () (Array (_ BitVec 32) ValueCell!8276))

(declare-fun mapValue!27762 () ValueCell!8276)

(declare-fun mapKey!27762 () (_ BitVec 32))

(declare-datatypes ((array!50971 0))(
  ( (array!50972 (arr!24512 (Array (_ BitVec 32) ValueCell!8276)) (size!24954 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50971)

(assert (=> mapNonEmpty!27762 (= (arr!24512 _values!688) (store mapRest!27762 mapKey!27762 mapValue!27762))))

(declare-fun res!595934 () Bool)

(assert (=> start!74480 (=> (not res!595934) (not e!488291))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74480 (= res!595934 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24953 _keys!868))))))

(assert (=> start!74480 e!488291))

(assert (=> start!74480 tp_is_empty!17431))

(assert (=> start!74480 true))

(assert (=> start!74480 tp!53243))

(declare-fun array_inv!19364 (array!50969) Bool)

(assert (=> start!74480 (array_inv!19364 _keys!868)))

(declare-fun e!488289 () Bool)

(declare-fun array_inv!19365 (array!50971) Bool)

(assert (=> start!74480 (and (array_inv!19365 _values!688) e!488289)))

(declare-fun b!877184 () Bool)

(declare-fun res!595936 () Bool)

(assert (=> b!877184 (=> (not res!595936) (not e!488291))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!877184 (= res!595936 (and (= (select (arr!24511 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877185 () Bool)

(declare-fun res!595931 () Bool)

(assert (=> b!877185 (=> (not res!595931) (not e!488291))))

(declare-datatypes ((List!17404 0))(
  ( (Nil!17401) (Cons!17400 (h!18531 (_ BitVec 64)) (t!24484 List!17404)) )
))
(declare-fun arrayNoDuplicates!0 (array!50969 (_ BitVec 32) List!17404) Bool)

(assert (=> b!877185 (= res!595931 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17401))))

(declare-fun b!877186 () Bool)

(declare-fun res!595932 () Bool)

(assert (=> b!877186 (=> (not res!595932) (not e!488291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877186 (= res!595932 (validMask!0 mask!1196))))

(declare-fun b!877187 () Bool)

(declare-fun e!488288 () Bool)

(assert (=> b!877187 (= e!488289 (and e!488288 mapRes!27762))))

(declare-fun condMapEmpty!27762 () Bool)

(declare-fun mapDefault!27762 () ValueCell!8276)

(assert (=> b!877187 (= condMapEmpty!27762 (= (arr!24512 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8276)) mapDefault!27762)))))

(declare-fun b!877188 () Bool)

(declare-fun res!595937 () Bool)

(assert (=> b!877188 (=> (not res!595937) (not e!488291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877188 (= res!595937 (validKeyInArray!0 k0!854))))

(declare-fun b!877189 () Bool)

(declare-fun res!595938 () Bool)

(assert (=> b!877189 (=> (not res!595938) (not e!488291))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!877189 (= res!595938 (and (= (size!24954 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24953 _keys!868) (size!24954 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877190 () Bool)

(declare-fun res!595933 () Bool)

(assert (=> b!877190 (=> (not res!595933) (not e!488291))))

(assert (=> b!877190 (= res!595933 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24953 _keys!868))))))

(declare-fun b!877191 () Bool)

(assert (=> b!877191 (= e!488288 tp_is_empty!17431)))

(declare-fun b!877192 () Bool)

(assert (=> b!877192 (= e!488291 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612) (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24953 _keys!868)))))))

(declare-fun v!557 () V!28289)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11600 0))(
  ( (tuple2!11601 (_1!5811 (_ BitVec 64)) (_2!5811 V!28289)) )
))
(declare-datatypes ((List!17405 0))(
  ( (Nil!17402) (Cons!17401 (h!18532 tuple2!11600) (t!24485 List!17405)) )
))
(declare-datatypes ((ListLongMap!10359 0))(
  ( (ListLongMap!10360 (toList!5195 List!17405)) )
))
(declare-fun lt!396835 () ListLongMap!10359)

(declare-fun minValue!654 () V!28289)

(declare-fun zeroValue!654 () V!28289)

(declare-fun getCurrentListMapNoExtraKeys!3188 (array!50969 array!50971 (_ BitVec 32) (_ BitVec 32) V!28289 V!28289 (_ BitVec 32) Int) ListLongMap!10359)

(assert (=> b!877192 (= lt!396835 (getCurrentListMapNoExtraKeys!3188 _keys!868 (array!50972 (store (arr!24512 _values!688) i!612 (ValueCellFull!8276 v!557)) (size!24954 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396834 () ListLongMap!10359)

(assert (=> b!877192 (= lt!396834 (getCurrentListMapNoExtraKeys!3188 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74480 res!595934) b!877186))

(assert (= (and b!877186 res!595932) b!877189))

(assert (= (and b!877189 res!595938) b!877183))

(assert (= (and b!877183 res!595935) b!877185))

(assert (= (and b!877185 res!595931) b!877190))

(assert (= (and b!877190 res!595933) b!877188))

(assert (= (and b!877188 res!595937) b!877184))

(assert (= (and b!877184 res!595936) b!877192))

(assert (= (and b!877187 condMapEmpty!27762) mapIsEmpty!27762))

(assert (= (and b!877187 (not condMapEmpty!27762)) mapNonEmpty!27762))

(get-info :version)

(assert (= (and mapNonEmpty!27762 ((_ is ValueCellFull!8276) mapValue!27762)) b!877182))

(assert (= (and b!877187 ((_ is ValueCellFull!8276) mapDefault!27762)) b!877191))

(assert (= start!74480 b!877187))

(declare-fun m!816873 () Bool)

(assert (=> b!877184 m!816873))

(declare-fun m!816875 () Bool)

(assert (=> b!877192 m!816875))

(declare-fun m!816877 () Bool)

(assert (=> b!877192 m!816877))

(declare-fun m!816879 () Bool)

(assert (=> b!877192 m!816879))

(declare-fun m!816881 () Bool)

(assert (=> b!877186 m!816881))

(declare-fun m!816883 () Bool)

(assert (=> b!877185 m!816883))

(declare-fun m!816885 () Bool)

(assert (=> b!877188 m!816885))

(declare-fun m!816887 () Bool)

(assert (=> b!877183 m!816887))

(declare-fun m!816889 () Bool)

(assert (=> mapNonEmpty!27762 m!816889))

(declare-fun m!816891 () Bool)

(assert (=> start!74480 m!816891))

(declare-fun m!816893 () Bool)

(assert (=> start!74480 m!816893))

(check-sat (not b!877188) (not b_next!15187) (not b!877192) (not start!74480) (not mapNonEmpty!27762) (not b!877186) (not b!877183) (not b!877185) b_and!25037 tp_is_empty!17431)
(check-sat b_and!25037 (not b_next!15187))
