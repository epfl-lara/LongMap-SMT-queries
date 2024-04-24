; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112454 () Bool)

(assert start!112454)

(declare-fun b_free!30625 () Bool)

(declare-fun b_next!30625 () Bool)

(assert (=> start!112454 (= b_free!30625 (not b_next!30625))))

(declare-fun tp!107512 () Bool)

(declare-fun b_and!49307 () Bool)

(assert (=> start!112454 (= tp!107512 b_and!49307)))

(declare-fun b!1330736 () Bool)

(declare-fun e!758731 () Bool)

(declare-fun e!758734 () Bool)

(declare-fun mapRes!56476 () Bool)

(assert (=> b!1330736 (= e!758731 (and e!758734 mapRes!56476))))

(declare-fun condMapEmpty!56476 () Bool)

(declare-datatypes ((V!53817 0))(
  ( (V!53818 (val!18342 Int)) )
))
(declare-datatypes ((ValueCell!17369 0))(
  ( (ValueCellFull!17369 (v!20974 V!53817)) (EmptyCell!17369) )
))
(declare-datatypes ((array!90069 0))(
  ( (array!90070 (arr!43496 (Array (_ BitVec 32) ValueCell!17369)) (size!44047 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90069)

(declare-fun mapDefault!56476 () ValueCell!17369)

(assert (=> b!1330736 (= condMapEmpty!56476 (= (arr!43496 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17369)) mapDefault!56476)))))

(declare-fun b!1330737 () Bool)

(declare-fun res!882616 () Bool)

(declare-fun e!758730 () Bool)

(assert (=> b!1330737 (=> (not res!882616) (not e!758730))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90071 0))(
  ( (array!90072 (arr!43497 (Array (_ BitVec 32) (_ BitVec 64))) (size!44048 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90071)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1330737 (= res!882616 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44048 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330738 () Bool)

(declare-fun tp_is_empty!36535 () Bool)

(assert (=> b!1330738 (= e!758734 tp_is_empty!36535)))

(declare-fun mapIsEmpty!56476 () Bool)

(assert (=> mapIsEmpty!56476 mapRes!56476))

(declare-fun b!1330739 () Bool)

(assert (=> b!1330739 (= e!758730 (not true))))

(declare-datatypes ((tuple2!23646 0))(
  ( (tuple2!23647 (_1!11834 (_ BitVec 64)) (_2!11834 V!53817)) )
))
(declare-datatypes ((List!30818 0))(
  ( (Nil!30815) (Cons!30814 (h!32032 tuple2!23646) (t!44848 List!30818)) )
))
(declare-datatypes ((ListLongMap!21311 0))(
  ( (ListLongMap!21312 (toList!10671 List!30818)) )
))
(declare-fun lt!591431 () ListLongMap!21311)

(declare-fun contains!8847 (ListLongMap!21311 (_ BitVec 64)) Bool)

(assert (=> b!1330739 (contains!8847 lt!591431 k0!1153)))

(declare-datatypes ((Unit!43696 0))(
  ( (Unit!43697) )
))
(declare-fun lt!591432 () Unit!43696)

(declare-fun minValue!1262 () V!53817)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!236 ((_ BitVec 64) (_ BitVec 64) V!53817 ListLongMap!21311) Unit!43696)

(assert (=> b!1330739 (= lt!591432 (lemmaInListMapAfterAddingDiffThenInBefore!236 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591431))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53817)

(declare-fun +!4693 (ListLongMap!21311 tuple2!23646) ListLongMap!21311)

(declare-fun getCurrentListMapNoExtraKeys!6337 (array!90071 array!90069 (_ BitVec 32) (_ BitVec 32) V!53817 V!53817 (_ BitVec 32) Int) ListLongMap!21311)

(declare-fun get!21934 (ValueCell!17369 V!53817) V!53817)

(declare-fun dynLambda!3647 (Int (_ BitVec 64)) V!53817)

(assert (=> b!1330739 (= lt!591431 (+!4693 (getCurrentListMapNoExtraKeys!6337 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23647 (select (arr!43497 _keys!1590) from!1980) (get!21934 (select (arr!43496 _values!1320) from!1980) (dynLambda!3647 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1330740 () Bool)

(declare-fun res!882613 () Bool)

(assert (=> b!1330740 (=> (not res!882613) (not e!758730))))

(declare-fun getCurrentListMap!5645 (array!90071 array!90069 (_ BitVec 32) (_ BitVec 32) V!53817 V!53817 (_ BitVec 32) Int) ListLongMap!21311)

(assert (=> b!1330740 (= res!882613 (contains!8847 (getCurrentListMap!5645 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!882617 () Bool)

(assert (=> start!112454 (=> (not res!882617) (not e!758730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112454 (= res!882617 (validMask!0 mask!1998))))

(assert (=> start!112454 e!758730))

(declare-fun array_inv!33101 (array!90069) Bool)

(assert (=> start!112454 (and (array_inv!33101 _values!1320) e!758731)))

(assert (=> start!112454 true))

(declare-fun array_inv!33102 (array!90071) Bool)

(assert (=> start!112454 (array_inv!33102 _keys!1590)))

(assert (=> start!112454 tp!107512))

(assert (=> start!112454 tp_is_empty!36535))

(declare-fun b!1330741 () Bool)

(declare-fun res!882619 () Bool)

(assert (=> b!1330741 (=> (not res!882619) (not e!758730))))

(assert (=> b!1330741 (= res!882619 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330742 () Bool)

(declare-fun res!882612 () Bool)

(assert (=> b!1330742 (=> (not res!882612) (not e!758730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90071 (_ BitVec 32)) Bool)

(assert (=> b!1330742 (= res!882612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330743 () Bool)

(declare-fun res!882614 () Bool)

(assert (=> b!1330743 (=> (not res!882614) (not e!758730))))

(assert (=> b!1330743 (= res!882614 (not (= (select (arr!43497 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330744 () Bool)

(declare-fun res!882618 () Bool)

(assert (=> b!1330744 (=> (not res!882618) (not e!758730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330744 (= res!882618 (validKeyInArray!0 (select (arr!43497 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56476 () Bool)

(declare-fun tp!107511 () Bool)

(declare-fun e!758733 () Bool)

(assert (=> mapNonEmpty!56476 (= mapRes!56476 (and tp!107511 e!758733))))

(declare-fun mapKey!56476 () (_ BitVec 32))

(declare-fun mapValue!56476 () ValueCell!17369)

(declare-fun mapRest!56476 () (Array (_ BitVec 32) ValueCell!17369))

(assert (=> mapNonEmpty!56476 (= (arr!43496 _values!1320) (store mapRest!56476 mapKey!56476 mapValue!56476))))

(declare-fun b!1330745 () Bool)

(assert (=> b!1330745 (= e!758733 tp_is_empty!36535)))

(declare-fun b!1330746 () Bool)

(declare-fun res!882620 () Bool)

(assert (=> b!1330746 (=> (not res!882620) (not e!758730))))

(assert (=> b!1330746 (= res!882620 (and (= (size!44047 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44048 _keys!1590) (size!44047 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330747 () Bool)

(declare-fun res!882615 () Bool)

(assert (=> b!1330747 (=> (not res!882615) (not e!758730))))

(declare-datatypes ((List!30819 0))(
  ( (Nil!30816) (Cons!30815 (h!32033 (_ BitVec 64)) (t!44849 List!30819)) )
))
(declare-fun arrayNoDuplicates!0 (array!90071 (_ BitVec 32) List!30819) Bool)

(assert (=> b!1330747 (= res!882615 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30816))))

(assert (= (and start!112454 res!882617) b!1330746))

(assert (= (and b!1330746 res!882620) b!1330742))

(assert (= (and b!1330742 res!882612) b!1330747))

(assert (= (and b!1330747 res!882615) b!1330737))

(assert (= (and b!1330737 res!882616) b!1330740))

(assert (= (and b!1330740 res!882613) b!1330743))

(assert (= (and b!1330743 res!882614) b!1330744))

(assert (= (and b!1330744 res!882618) b!1330741))

(assert (= (and b!1330741 res!882619) b!1330739))

(assert (= (and b!1330736 condMapEmpty!56476) mapIsEmpty!56476))

(assert (= (and b!1330736 (not condMapEmpty!56476)) mapNonEmpty!56476))

(get-info :version)

(assert (= (and mapNonEmpty!56476 ((_ is ValueCellFull!17369) mapValue!56476)) b!1330745))

(assert (= (and b!1330736 ((_ is ValueCellFull!17369) mapDefault!56476)) b!1330738))

(assert (= start!112454 b!1330736))

(declare-fun b_lambda!23879 () Bool)

(assert (=> (not b_lambda!23879) (not b!1330739)))

(declare-fun t!44847 () Bool)

(declare-fun tb!11833 () Bool)

(assert (=> (and start!112454 (= defaultEntry!1323 defaultEntry!1323) t!44847) tb!11833))

(declare-fun result!24745 () Bool)

(assert (=> tb!11833 (= result!24745 tp_is_empty!36535)))

(assert (=> b!1330739 t!44847))

(declare-fun b_and!49309 () Bool)

(assert (= b_and!49307 (and (=> t!44847 result!24745) b_and!49309)))

(declare-fun m!1219793 () Bool)

(assert (=> mapNonEmpty!56476 m!1219793))

(declare-fun m!1219795 () Bool)

(assert (=> b!1330747 m!1219795))

(declare-fun m!1219797 () Bool)

(assert (=> b!1330742 m!1219797))

(declare-fun m!1219799 () Bool)

(assert (=> b!1330740 m!1219799))

(assert (=> b!1330740 m!1219799))

(declare-fun m!1219801 () Bool)

(assert (=> b!1330740 m!1219801))

(declare-fun m!1219803 () Bool)

(assert (=> b!1330739 m!1219803))

(declare-fun m!1219805 () Bool)

(assert (=> b!1330739 m!1219805))

(declare-fun m!1219807 () Bool)

(assert (=> b!1330739 m!1219807))

(declare-fun m!1219809 () Bool)

(assert (=> b!1330739 m!1219809))

(assert (=> b!1330739 m!1219803))

(declare-fun m!1219811 () Bool)

(assert (=> b!1330739 m!1219811))

(assert (=> b!1330739 m!1219805))

(declare-fun m!1219813 () Bool)

(assert (=> b!1330739 m!1219813))

(declare-fun m!1219815 () Bool)

(assert (=> b!1330739 m!1219815))

(assert (=> b!1330739 m!1219809))

(declare-fun m!1219817 () Bool)

(assert (=> b!1330739 m!1219817))

(assert (=> b!1330744 m!1219815))

(assert (=> b!1330744 m!1219815))

(declare-fun m!1219819 () Bool)

(assert (=> b!1330744 m!1219819))

(assert (=> b!1330743 m!1219815))

(declare-fun m!1219821 () Bool)

(assert (=> start!112454 m!1219821))

(declare-fun m!1219823 () Bool)

(assert (=> start!112454 m!1219823))

(declare-fun m!1219825 () Bool)

(assert (=> start!112454 m!1219825))

(check-sat (not b!1330744) (not b!1330742) (not start!112454) b_and!49309 tp_is_empty!36535 (not b_next!30625) (not b_lambda!23879) (not mapNonEmpty!56476) (not b!1330739) (not b!1330747) (not b!1330740))
(check-sat b_and!49309 (not b_next!30625))
