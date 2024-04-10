; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74336 () Bool)

(assert start!74336)

(declare-fun b_free!15099 () Bool)

(declare-fun b_next!15099 () Bool)

(assert (=> start!74336 (= b_free!15099 (not b_next!15099))))

(declare-fun tp!52971 () Bool)

(declare-fun b_and!24875 () Bool)

(assert (=> start!74336 (= tp!52971 b_and!24875)))

(declare-fun mapIsEmpty!27623 () Bool)

(declare-fun mapRes!27623 () Bool)

(assert (=> mapIsEmpty!27623 mapRes!27623))

(declare-fun b!874808 () Bool)

(declare-fun res!594519 () Bool)

(declare-fun e!487039 () Bool)

(assert (=> b!874808 (=> (not res!594519) (not e!487039))))

(declare-datatypes ((array!50814 0))(
  ( (array!50815 (arr!24435 (Array (_ BitVec 32) (_ BitVec 64))) (size!24875 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50814)

(declare-datatypes ((List!17342 0))(
  ( (Nil!17339) (Cons!17338 (h!18469 (_ BitVec 64)) (t!24383 List!17342)) )
))
(declare-fun arrayNoDuplicates!0 (array!50814 (_ BitVec 32) List!17342) Bool)

(assert (=> b!874808 (= res!594519 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17339))))

(declare-fun res!594515 () Bool)

(assert (=> start!74336 (=> (not res!594515) (not e!487039))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74336 (= res!594515 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24875 _keys!868))))))

(assert (=> start!74336 e!487039))

(declare-fun tp_is_empty!17343 () Bool)

(assert (=> start!74336 tp_is_empty!17343))

(assert (=> start!74336 true))

(assert (=> start!74336 tp!52971))

(declare-fun array_inv!19268 (array!50814) Bool)

(assert (=> start!74336 (array_inv!19268 _keys!868)))

(declare-datatypes ((V!28171 0))(
  ( (V!28172 (val!8719 Int)) )
))
(declare-datatypes ((ValueCell!8232 0))(
  ( (ValueCellFull!8232 (v!11148 V!28171)) (EmptyCell!8232) )
))
(declare-datatypes ((array!50816 0))(
  ( (array!50817 (arr!24436 (Array (_ BitVec 32) ValueCell!8232)) (size!24876 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50816)

(declare-fun e!487038 () Bool)

(declare-fun array_inv!19269 (array!50816) Bool)

(assert (=> start!74336 (and (array_inv!19269 _values!688) e!487038)))

(declare-fun mapNonEmpty!27623 () Bool)

(declare-fun tp!52972 () Bool)

(declare-fun e!487040 () Bool)

(assert (=> mapNonEmpty!27623 (= mapRes!27623 (and tp!52972 e!487040))))

(declare-fun mapValue!27623 () ValueCell!8232)

(declare-fun mapRest!27623 () (Array (_ BitVec 32) ValueCell!8232))

(declare-fun mapKey!27623 () (_ BitVec 32))

(assert (=> mapNonEmpty!27623 (= (arr!24436 _values!688) (store mapRest!27623 mapKey!27623 mapValue!27623))))

(declare-fun b!874809 () Bool)

(declare-fun res!594517 () Bool)

(assert (=> b!874809 (=> (not res!594517) (not e!487039))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!874809 (= res!594517 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24875 _keys!868))))))

(declare-fun b!874810 () Bool)

(declare-fun res!594521 () Bool)

(assert (=> b!874810 (=> (not res!594521) (not e!487039))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874810 (= res!594521 (validMask!0 mask!1196))))

(declare-fun b!874811 () Bool)

(declare-fun res!594516 () Bool)

(assert (=> b!874811 (=> (not res!594516) (not e!487039))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!874811 (= res!594516 (and (= (size!24876 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24875 _keys!868) (size!24876 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874812 () Bool)

(assert (=> b!874812 (= e!487040 tp_is_empty!17343)))

(declare-fun b!874813 () Bool)

(assert (=> b!874813 (= e!487039 false)))

(declare-fun v!557 () V!28171)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11520 0))(
  ( (tuple2!11521 (_1!5771 (_ BitVec 64)) (_2!5771 V!28171)) )
))
(declare-datatypes ((List!17343 0))(
  ( (Nil!17340) (Cons!17339 (h!18470 tuple2!11520) (t!24384 List!17343)) )
))
(declare-datatypes ((ListLongMap!10289 0))(
  ( (ListLongMap!10290 (toList!5160 List!17343)) )
))
(declare-fun lt!396011 () ListLongMap!10289)

(declare-fun minValue!654 () V!28171)

(declare-fun zeroValue!654 () V!28171)

(declare-fun getCurrentListMapNoExtraKeys!3127 (array!50814 array!50816 (_ BitVec 32) (_ BitVec 32) V!28171 V!28171 (_ BitVec 32) Int) ListLongMap!10289)

(assert (=> b!874813 (= lt!396011 (getCurrentListMapNoExtraKeys!3127 _keys!868 (array!50817 (store (arr!24436 _values!688) i!612 (ValueCellFull!8232 v!557)) (size!24876 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396010 () ListLongMap!10289)

(assert (=> b!874813 (= lt!396010 (getCurrentListMapNoExtraKeys!3127 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874814 () Bool)

(declare-fun res!594518 () Bool)

(assert (=> b!874814 (=> (not res!594518) (not e!487039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50814 (_ BitVec 32)) Bool)

(assert (=> b!874814 (= res!594518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874815 () Bool)

(declare-fun res!594522 () Bool)

(assert (=> b!874815 (=> (not res!594522) (not e!487039))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874815 (= res!594522 (validKeyInArray!0 k0!854))))

(declare-fun b!874816 () Bool)

(declare-fun e!487036 () Bool)

(assert (=> b!874816 (= e!487038 (and e!487036 mapRes!27623))))

(declare-fun condMapEmpty!27623 () Bool)

(declare-fun mapDefault!27623 () ValueCell!8232)

(assert (=> b!874816 (= condMapEmpty!27623 (= (arr!24436 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8232)) mapDefault!27623)))))

(declare-fun b!874817 () Bool)

(declare-fun res!594520 () Bool)

(assert (=> b!874817 (=> (not res!594520) (not e!487039))))

(assert (=> b!874817 (= res!594520 (and (= (select (arr!24435 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874818 () Bool)

(assert (=> b!874818 (= e!487036 tp_is_empty!17343)))

(assert (= (and start!74336 res!594515) b!874810))

(assert (= (and b!874810 res!594521) b!874811))

(assert (= (and b!874811 res!594516) b!874814))

(assert (= (and b!874814 res!594518) b!874808))

(assert (= (and b!874808 res!594519) b!874809))

(assert (= (and b!874809 res!594517) b!874815))

(assert (= (and b!874815 res!594522) b!874817))

(assert (= (and b!874817 res!594520) b!874813))

(assert (= (and b!874816 condMapEmpty!27623) mapIsEmpty!27623))

(assert (= (and b!874816 (not condMapEmpty!27623)) mapNonEmpty!27623))

(get-info :version)

(assert (= (and mapNonEmpty!27623 ((_ is ValueCellFull!8232) mapValue!27623)) b!874812))

(assert (= (and b!874816 ((_ is ValueCellFull!8232) mapDefault!27623)) b!874818))

(assert (= start!74336 b!874816))

(declare-fun m!814853 () Bool)

(assert (=> b!874817 m!814853))

(declare-fun m!814855 () Bool)

(assert (=> b!874808 m!814855))

(declare-fun m!814857 () Bool)

(assert (=> b!874810 m!814857))

(declare-fun m!814859 () Bool)

(assert (=> b!874815 m!814859))

(declare-fun m!814861 () Bool)

(assert (=> start!74336 m!814861))

(declare-fun m!814863 () Bool)

(assert (=> start!74336 m!814863))

(declare-fun m!814865 () Bool)

(assert (=> b!874814 m!814865))

(declare-fun m!814867 () Bool)

(assert (=> mapNonEmpty!27623 m!814867))

(declare-fun m!814869 () Bool)

(assert (=> b!874813 m!814869))

(declare-fun m!814871 () Bool)

(assert (=> b!874813 m!814871))

(declare-fun m!814873 () Bool)

(assert (=> b!874813 m!814873))

(check-sat (not b!874810) (not mapNonEmpty!27623) (not b!874814) (not start!74336) (not b!874808) tp_is_empty!17343 (not b!874813) (not b!874815) b_and!24875 (not b_next!15099))
(check-sat b_and!24875 (not b_next!15099))
