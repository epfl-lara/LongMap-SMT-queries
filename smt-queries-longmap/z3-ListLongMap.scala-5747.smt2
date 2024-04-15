; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74292 () Bool)

(assert start!74292)

(declare-fun b_free!15073 () Bool)

(declare-fun b_next!15073 () Bool)

(assert (=> start!74292 (= b_free!15073 (not b_next!15073))))

(declare-fun tp!52894 () Bool)

(declare-fun b_and!24823 () Bool)

(assert (=> start!74292 (= tp!52894 b_and!24823)))

(declare-fun b!874140 () Bool)

(declare-fun res!594098 () Bool)

(declare-fun e!486693 () Bool)

(assert (=> b!874140 (=> (not res!594098) (not e!486693))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50743 0))(
  ( (array!50744 (arr!24400 (Array (_ BitVec 32) (_ BitVec 64))) (size!24842 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50743)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874140 (= res!594098 (and (= (select (arr!24400 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874141 () Bool)

(declare-fun res!594095 () Bool)

(assert (=> b!874141 (=> (not res!594095) (not e!486693))))

(assert (=> b!874141 (= res!594095 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24842 _keys!868))))))

(declare-fun b!874142 () Bool)

(declare-fun res!594097 () Bool)

(assert (=> b!874142 (=> (not res!594097) (not e!486693))))

(declare-datatypes ((List!17325 0))(
  ( (Nil!17322) (Cons!17321 (h!18452 (_ BitVec 64)) (t!24357 List!17325)) )
))
(declare-fun arrayNoDuplicates!0 (array!50743 (_ BitVec 32) List!17325) Bool)

(assert (=> b!874142 (= res!594097 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17322))))

(declare-fun b!874143 () Bool)

(declare-fun res!594099 () Bool)

(assert (=> b!874143 (=> (not res!594099) (not e!486693))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50743 (_ BitVec 32)) Bool)

(assert (=> b!874143 (= res!594099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!594094 () Bool)

(assert (=> start!74292 (=> (not res!594094) (not e!486693))))

(assert (=> start!74292 (= res!594094 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24842 _keys!868))))))

(assert (=> start!74292 e!486693))

(declare-fun tp_is_empty!17317 () Bool)

(assert (=> start!74292 tp_is_empty!17317))

(assert (=> start!74292 true))

(assert (=> start!74292 tp!52894))

(declare-fun array_inv!19300 (array!50743) Bool)

(assert (=> start!74292 (array_inv!19300 _keys!868)))

(declare-datatypes ((V!28137 0))(
  ( (V!28138 (val!8706 Int)) )
))
(declare-datatypes ((ValueCell!8219 0))(
  ( (ValueCellFull!8219 (v!11129 V!28137)) (EmptyCell!8219) )
))
(declare-datatypes ((array!50745 0))(
  ( (array!50746 (arr!24401 (Array (_ BitVec 32) ValueCell!8219)) (size!24843 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50745)

(declare-fun e!486694 () Bool)

(declare-fun array_inv!19301 (array!50745) Bool)

(assert (=> start!74292 (and (array_inv!19301 _values!688) e!486694)))

(declare-fun b!874144 () Bool)

(declare-fun e!486695 () Bool)

(assert (=> b!874144 (= e!486695 tp_is_empty!17317)))

(declare-fun mapNonEmpty!27584 () Bool)

(declare-fun mapRes!27584 () Bool)

(declare-fun tp!52895 () Bool)

(declare-fun e!486697 () Bool)

(assert (=> mapNonEmpty!27584 (= mapRes!27584 (and tp!52895 e!486697))))

(declare-fun mapValue!27584 () ValueCell!8219)

(declare-fun mapKey!27584 () (_ BitVec 32))

(declare-fun mapRest!27584 () (Array (_ BitVec 32) ValueCell!8219))

(assert (=> mapNonEmpty!27584 (= (arr!24401 _values!688) (store mapRest!27584 mapKey!27584 mapValue!27584))))

(declare-fun b!874145 () Bool)

(assert (=> b!874145 (= e!486693 false)))

(declare-fun v!557 () V!28137)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11512 0))(
  ( (tuple2!11513 (_1!5767 (_ BitVec 64)) (_2!5767 V!28137)) )
))
(declare-datatypes ((List!17326 0))(
  ( (Nil!17323) (Cons!17322 (h!18453 tuple2!11512) (t!24358 List!17326)) )
))
(declare-datatypes ((ListLongMap!10271 0))(
  ( (ListLongMap!10272 (toList!5151 List!17326)) )
))
(declare-fun lt!395697 () ListLongMap!10271)

(declare-fun minValue!654 () V!28137)

(declare-fun zeroValue!654 () V!28137)

(declare-fun getCurrentListMapNoExtraKeys!3144 (array!50743 array!50745 (_ BitVec 32) (_ BitVec 32) V!28137 V!28137 (_ BitVec 32) Int) ListLongMap!10271)

(assert (=> b!874145 (= lt!395697 (getCurrentListMapNoExtraKeys!3144 _keys!868 (array!50746 (store (arr!24401 _values!688) i!612 (ValueCellFull!8219 v!557)) (size!24843 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395696 () ListLongMap!10271)

(assert (=> b!874145 (= lt!395696 (getCurrentListMapNoExtraKeys!3144 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874146 () Bool)

(declare-fun res!594096 () Bool)

(assert (=> b!874146 (=> (not res!594096) (not e!486693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874146 (= res!594096 (validMask!0 mask!1196))))

(declare-fun b!874147 () Bool)

(declare-fun res!594100 () Bool)

(assert (=> b!874147 (=> (not res!594100) (not e!486693))))

(assert (=> b!874147 (= res!594100 (and (= (size!24843 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24842 _keys!868) (size!24843 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874148 () Bool)

(assert (=> b!874148 (= e!486697 tp_is_empty!17317)))

(declare-fun b!874149 () Bool)

(assert (=> b!874149 (= e!486694 (and e!486695 mapRes!27584))))

(declare-fun condMapEmpty!27584 () Bool)

(declare-fun mapDefault!27584 () ValueCell!8219)

(assert (=> b!874149 (= condMapEmpty!27584 (= (arr!24401 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8219)) mapDefault!27584)))))

(declare-fun mapIsEmpty!27584 () Bool)

(assert (=> mapIsEmpty!27584 mapRes!27584))

(declare-fun b!874150 () Bool)

(declare-fun res!594093 () Bool)

(assert (=> b!874150 (=> (not res!594093) (not e!486693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874150 (= res!594093 (validKeyInArray!0 k0!854))))

(assert (= (and start!74292 res!594094) b!874146))

(assert (= (and b!874146 res!594096) b!874147))

(assert (= (and b!874147 res!594100) b!874143))

(assert (= (and b!874143 res!594099) b!874142))

(assert (= (and b!874142 res!594097) b!874141))

(assert (= (and b!874141 res!594095) b!874150))

(assert (= (and b!874150 res!594093) b!874140))

(assert (= (and b!874140 res!594098) b!874145))

(assert (= (and b!874149 condMapEmpty!27584) mapIsEmpty!27584))

(assert (= (and b!874149 (not condMapEmpty!27584)) mapNonEmpty!27584))

(get-info :version)

(assert (= (and mapNonEmpty!27584 ((_ is ValueCellFull!8219) mapValue!27584)) b!874148))

(assert (= (and b!874149 ((_ is ValueCellFull!8219) mapDefault!27584)) b!874144))

(assert (= start!74292 b!874149))

(declare-fun m!813809 () Bool)

(assert (=> b!874145 m!813809))

(declare-fun m!813811 () Bool)

(assert (=> b!874145 m!813811))

(declare-fun m!813813 () Bool)

(assert (=> b!874145 m!813813))

(declare-fun m!813815 () Bool)

(assert (=> b!874146 m!813815))

(declare-fun m!813817 () Bool)

(assert (=> start!74292 m!813817))

(declare-fun m!813819 () Bool)

(assert (=> start!74292 m!813819))

(declare-fun m!813821 () Bool)

(assert (=> b!874150 m!813821))

(declare-fun m!813823 () Bool)

(assert (=> b!874140 m!813823))

(declare-fun m!813825 () Bool)

(assert (=> b!874143 m!813825))

(declare-fun m!813827 () Bool)

(assert (=> mapNonEmpty!27584 m!813827))

(declare-fun m!813829 () Bool)

(assert (=> b!874142 m!813829))

(check-sat (not b!874142) (not b!874145) b_and!24823 (not b!874143) (not b!874146) (not start!74292) tp_is_empty!17317 (not b_next!15073) (not b!874150) (not mapNonEmpty!27584))
(check-sat b_and!24823 (not b_next!15073))
