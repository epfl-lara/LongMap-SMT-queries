; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79352 () Bool)

(assert start!79352)

(declare-fun b_free!17557 () Bool)

(declare-fun b_next!17557 () Bool)

(assert (=> start!79352 (= b_free!17557 (not b_next!17557))))

(declare-fun tp!61116 () Bool)

(declare-fun b_and!28647 () Bool)

(assert (=> start!79352 (= tp!61116 b_and!28647)))

(declare-fun b!932165 () Bool)

(declare-fun e!523466 () Bool)

(declare-fun e!523469 () Bool)

(assert (=> b!932165 (= e!523466 e!523469)))

(declare-fun res!627853 () Bool)

(assert (=> b!932165 (=> (not res!627853) (not e!523469))))

(declare-fun lt!419644 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932165 (= res!627853 (validKeyInArray!0 lt!419644))))

(declare-datatypes ((array!56037 0))(
  ( (array!56038 (arr!26963 (Array (_ BitVec 32) (_ BitVec 64))) (size!27424 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56037)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932165 (= lt!419644 (select (arr!26963 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932166 () Bool)

(declare-fun res!627852 () Bool)

(declare-fun e!523467 () Bool)

(assert (=> b!932166 (=> (not res!627852) (not e!523467))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31719 0))(
  ( (V!31720 (val!10083 Int)) )
))
(declare-datatypes ((ValueCell!9551 0))(
  ( (ValueCellFull!9551 (v!12601 V!31719)) (EmptyCell!9551) )
))
(declare-datatypes ((array!56039 0))(
  ( (array!56040 (arr!26964 (Array (_ BitVec 32) ValueCell!9551)) (size!27425 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56039)

(assert (=> b!932166 (= res!627852 (and (= (size!27425 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27424 _keys!1487) (size!27425 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932167 () Bool)

(declare-fun res!627847 () Bool)

(assert (=> b!932167 (=> (not res!627847) (not e!523467))))

(declare-datatypes ((List!19016 0))(
  ( (Nil!19013) (Cons!19012 (h!20158 (_ BitVec 64)) (t!27108 List!19016)) )
))
(declare-fun arrayNoDuplicates!0 (array!56037 (_ BitVec 32) List!19016) Bool)

(assert (=> b!932167 (= res!627847 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19013))))

(declare-fun b!932168 () Bool)

(declare-fun e!523468 () Bool)

(declare-fun tp_is_empty!20065 () Bool)

(assert (=> b!932168 (= e!523468 tp_is_empty!20065)))

(declare-fun b!932169 () Bool)

(declare-fun e!523465 () Bool)

(assert (=> b!932169 (= e!523465 tp_is_empty!20065)))

(declare-fun mapIsEmpty!31857 () Bool)

(declare-fun mapRes!31857 () Bool)

(assert (=> mapIsEmpty!31857 mapRes!31857))

(declare-fun b!932170 () Bool)

(declare-fun e!523463 () Bool)

(assert (=> b!932170 (= e!523463 (and e!523465 mapRes!31857))))

(declare-fun condMapEmpty!31857 () Bool)

(declare-fun mapDefault!31857 () ValueCell!9551)

(assert (=> b!932170 (= condMapEmpty!31857 (= (arr!26964 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9551)) mapDefault!31857)))))

(declare-fun b!932171 () Bool)

(declare-fun res!627854 () Bool)

(assert (=> b!932171 (=> (not res!627854) (not e!523466))))

(assert (=> b!932171 (= res!627854 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932173 () Bool)

(declare-fun res!627849 () Bool)

(assert (=> b!932173 (=> (not res!627849) (not e!523467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56037 (_ BitVec 32)) Bool)

(assert (=> b!932173 (= res!627849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932174 () Bool)

(assert (=> b!932174 (= e!523469 (not true))))

(declare-datatypes ((tuple2!13264 0))(
  ( (tuple2!13265 (_1!6643 (_ BitVec 64)) (_2!6643 V!31719)) )
))
(declare-datatypes ((List!19017 0))(
  ( (Nil!19014) (Cons!19013 (h!20159 tuple2!13264) (t!27109 List!19017)) )
))
(declare-datatypes ((ListLongMap!11951 0))(
  ( (ListLongMap!11952 (toList!5991 List!19017)) )
))
(declare-fun lt!419646 () ListLongMap!11951)

(declare-fun lt!419642 () tuple2!13264)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4989 (ListLongMap!11951 (_ BitVec 64)) Bool)

(declare-fun +!2800 (ListLongMap!11951 tuple2!13264) ListLongMap!11951)

(assert (=> b!932174 (contains!4989 (+!2800 lt!419646 lt!419642) k0!1099)))

(declare-fun lt!419643 () V!31719)

(declare-datatypes ((Unit!31370 0))(
  ( (Unit!31371) )
))
(declare-fun lt!419641 () Unit!31370)

(declare-fun addStillContains!489 (ListLongMap!11951 (_ BitVec 64) V!31719 (_ BitVec 64)) Unit!31370)

(assert (=> b!932174 (= lt!419641 (addStillContains!489 lt!419646 lt!419644 lt!419643 k0!1099))))

(declare-fun zeroValue!1173 () V!31719)

(declare-fun minValue!1173 () V!31719)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3164 (array!56037 array!56039 (_ BitVec 32) (_ BitVec 32) V!31719 V!31719 (_ BitVec 32) Int) ListLongMap!11951)

(assert (=> b!932174 (= (getCurrentListMap!3164 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2800 (getCurrentListMap!3164 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419642))))

(assert (=> b!932174 (= lt!419642 (tuple2!13265 lt!419644 lt!419643))))

(declare-fun get!14184 (ValueCell!9551 V!31719) V!31719)

(declare-fun dynLambda!1556 (Int (_ BitVec 64)) V!31719)

(assert (=> b!932174 (= lt!419643 (get!14184 (select (arr!26964 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1556 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419645 () Unit!31370)

(declare-fun lemmaListMapRecursiveValidKeyArray!164 (array!56037 array!56039 (_ BitVec 32) (_ BitVec 32) V!31719 V!31719 (_ BitVec 32) Int) Unit!31370)

(assert (=> b!932174 (= lt!419645 (lemmaListMapRecursiveValidKeyArray!164 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932175 () Bool)

(assert (=> b!932175 (= e!523467 e!523466)))

(declare-fun res!627851 () Bool)

(assert (=> b!932175 (=> (not res!627851) (not e!523466))))

(assert (=> b!932175 (= res!627851 (contains!4989 lt!419646 k0!1099))))

(assert (=> b!932175 (= lt!419646 (getCurrentListMap!3164 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932176 () Bool)

(declare-fun res!627845 () Bool)

(assert (=> b!932176 (=> (not res!627845) (not e!523467))))

(assert (=> b!932176 (= res!627845 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27424 _keys!1487))))))

(declare-fun b!932172 () Bool)

(declare-fun res!627846 () Bool)

(assert (=> b!932172 (=> (not res!627846) (not e!523466))))

(assert (=> b!932172 (= res!627846 (validKeyInArray!0 k0!1099))))

(declare-fun res!627848 () Bool)

(assert (=> start!79352 (=> (not res!627848) (not e!523467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79352 (= res!627848 (validMask!0 mask!1881))))

(assert (=> start!79352 e!523467))

(assert (=> start!79352 true))

(assert (=> start!79352 tp_is_empty!20065))

(declare-fun array_inv!21052 (array!56039) Bool)

(assert (=> start!79352 (and (array_inv!21052 _values!1231) e!523463)))

(assert (=> start!79352 tp!61116))

(declare-fun array_inv!21053 (array!56037) Bool)

(assert (=> start!79352 (array_inv!21053 _keys!1487)))

(declare-fun mapNonEmpty!31857 () Bool)

(declare-fun tp!61115 () Bool)

(assert (=> mapNonEmpty!31857 (= mapRes!31857 (and tp!61115 e!523468))))

(declare-fun mapKey!31857 () (_ BitVec 32))

(declare-fun mapRest!31857 () (Array (_ BitVec 32) ValueCell!9551))

(declare-fun mapValue!31857 () ValueCell!9551)

(assert (=> mapNonEmpty!31857 (= (arr!26964 _values!1231) (store mapRest!31857 mapKey!31857 mapValue!31857))))

(declare-fun b!932177 () Bool)

(declare-fun res!627850 () Bool)

(assert (=> b!932177 (=> (not res!627850) (not e!523466))))

(declare-fun v!791 () V!31719)

(declare-fun apply!782 (ListLongMap!11951 (_ BitVec 64)) V!31719)

(assert (=> b!932177 (= res!627850 (= (apply!782 lt!419646 k0!1099) v!791))))

(assert (= (and start!79352 res!627848) b!932166))

(assert (= (and b!932166 res!627852) b!932173))

(assert (= (and b!932173 res!627849) b!932167))

(assert (= (and b!932167 res!627847) b!932176))

(assert (= (and b!932176 res!627845) b!932175))

(assert (= (and b!932175 res!627851) b!932177))

(assert (= (and b!932177 res!627850) b!932171))

(assert (= (and b!932171 res!627854) b!932172))

(assert (= (and b!932172 res!627846) b!932165))

(assert (= (and b!932165 res!627853) b!932174))

(assert (= (and b!932170 condMapEmpty!31857) mapIsEmpty!31857))

(assert (= (and b!932170 (not condMapEmpty!31857)) mapNonEmpty!31857))

(get-info :version)

(assert (= (and mapNonEmpty!31857 ((_ is ValueCellFull!9551) mapValue!31857)) b!932168))

(assert (= (and b!932170 ((_ is ValueCellFull!9551) mapDefault!31857)) b!932169))

(assert (= start!79352 b!932170))

(declare-fun b_lambda!13873 () Bool)

(assert (=> (not b_lambda!13873) (not b!932174)))

(declare-fun t!27107 () Bool)

(declare-fun tb!5943 () Bool)

(assert (=> (and start!79352 (= defaultEntry!1235 defaultEntry!1235) t!27107) tb!5943))

(declare-fun result!11719 () Bool)

(assert (=> tb!5943 (= result!11719 tp_is_empty!20065)))

(assert (=> b!932174 t!27107))

(declare-fun b_and!28649 () Bool)

(assert (= b_and!28647 (and (=> t!27107 result!11719) b_and!28649)))

(declare-fun m!865613 () Bool)

(assert (=> b!932167 m!865613))

(declare-fun m!865615 () Bool)

(assert (=> b!932175 m!865615))

(declare-fun m!865617 () Bool)

(assert (=> b!932175 m!865617))

(declare-fun m!865619 () Bool)

(assert (=> mapNonEmpty!31857 m!865619))

(declare-fun m!865621 () Bool)

(assert (=> b!932165 m!865621))

(declare-fun m!865623 () Bool)

(assert (=> b!932165 m!865623))

(declare-fun m!865625 () Bool)

(assert (=> b!932172 m!865625))

(declare-fun m!865627 () Bool)

(assert (=> b!932173 m!865627))

(declare-fun m!865629 () Bool)

(assert (=> b!932177 m!865629))

(declare-fun m!865631 () Bool)

(assert (=> start!79352 m!865631))

(declare-fun m!865633 () Bool)

(assert (=> start!79352 m!865633))

(declare-fun m!865635 () Bool)

(assert (=> start!79352 m!865635))

(declare-fun m!865637 () Bool)

(assert (=> b!932174 m!865637))

(declare-fun m!865639 () Bool)

(assert (=> b!932174 m!865639))

(declare-fun m!865641 () Bool)

(assert (=> b!932174 m!865641))

(assert (=> b!932174 m!865641))

(declare-fun m!865643 () Bool)

(assert (=> b!932174 m!865643))

(declare-fun m!865645 () Bool)

(assert (=> b!932174 m!865645))

(declare-fun m!865647 () Bool)

(assert (=> b!932174 m!865647))

(assert (=> b!932174 m!865645))

(declare-fun m!865649 () Bool)

(assert (=> b!932174 m!865649))

(declare-fun m!865651 () Bool)

(assert (=> b!932174 m!865651))

(assert (=> b!932174 m!865637))

(declare-fun m!865653 () Bool)

(assert (=> b!932174 m!865653))

(declare-fun m!865655 () Bool)

(assert (=> b!932174 m!865655))

(assert (=> b!932174 m!865647))

(check-sat (not b_lambda!13873) (not b!932175) (not b_next!17557) (not b!932174) (not start!79352) b_and!28649 (not b!932167) (not b!932165) (not b!932172) tp_is_empty!20065 (not mapNonEmpty!31857) (not b!932173) (not b!932177))
(check-sat b_and!28649 (not b_next!17557))
