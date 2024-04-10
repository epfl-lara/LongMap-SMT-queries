; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79034 () Bool)

(assert start!79034)

(declare-fun b_free!17247 () Bool)

(declare-fun b_next!17247 () Bool)

(assert (=> start!79034 (= b_free!17247 (not b_next!17247))))

(declare-fun tp!60182 () Bool)

(declare-fun b_and!28231 () Bool)

(assert (=> start!79034 (= tp!60182 b_and!28231)))

(declare-fun b!926073 () Bool)

(declare-datatypes ((Unit!31302 0))(
  ( (Unit!31303) )
))
(declare-fun e!519808 () Unit!31302)

(declare-fun Unit!31304 () Unit!31302)

(assert (=> b!926073 (= e!519808 Unit!31304)))

(declare-fun b!926074 () Bool)

(declare-fun e!519806 () Bool)

(declare-fun tp_is_empty!19755 () Bool)

(assert (=> b!926074 (= e!519806 tp_is_empty!19755)))

(declare-fun b!926075 () Bool)

(declare-fun e!519799 () Unit!31302)

(declare-fun Unit!31305 () Unit!31302)

(assert (=> b!926075 (= e!519799 Unit!31305)))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31305 0))(
  ( (V!31306 (val!9928 Int)) )
))
(declare-fun v!791 () V!31305)

(declare-fun b!926076 () Bool)

(declare-fun e!519805 () Bool)

(declare-datatypes ((tuple2!12950 0))(
  ( (tuple2!12951 (_1!6486 (_ BitVec 64)) (_2!6486 V!31305)) )
))
(declare-datatypes ((List!18752 0))(
  ( (Nil!18749) (Cons!18748 (h!19894 tuple2!12950) (t!26729 List!18752)) )
))
(declare-datatypes ((ListLongMap!11647 0))(
  ( (ListLongMap!11648 (toList!5839 List!18752)) )
))
(declare-fun lt!416955 () ListLongMap!11647)

(declare-fun apply!669 (ListLongMap!11647 (_ BitVec 64)) V!31305)

(assert (=> b!926076 (= e!519805 (= (apply!669 lt!416955 k0!1099) v!791))))

(declare-fun b!926077 () Bool)

(declare-fun e!519807 () Bool)

(declare-fun e!519801 () Bool)

(assert (=> b!926077 (= e!519807 e!519801)))

(declare-fun res!623968 () Bool)

(assert (=> b!926077 (=> (not res!623968) (not e!519801))))

(declare-fun lt!416954 () ListLongMap!11647)

(declare-fun contains!4898 (ListLongMap!11647 (_ BitVec 64)) Bool)

(assert (=> b!926077 (= res!623968 (contains!4898 lt!416954 k0!1099))))

(declare-datatypes ((array!55476 0))(
  ( (array!55477 (arr!26683 (Array (_ BitVec 32) (_ BitVec 64))) (size!27142 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55476)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9396 0))(
  ( (ValueCellFull!9396 (v!12446 V!31305)) (EmptyCell!9396) )
))
(declare-datatypes ((array!55478 0))(
  ( (array!55479 (arr!26684 (Array (_ BitVec 32) ValueCell!9396)) (size!27143 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55478)

(declare-fun zeroValue!1173 () V!31305)

(declare-fun minValue!1173 () V!31305)

(declare-fun getCurrentListMap!3089 (array!55476 array!55478 (_ BitVec 32) (_ BitVec 32) V!31305 V!31305 (_ BitVec 32) Int) ListLongMap!11647)

(assert (=> b!926077 (= lt!416954 (getCurrentListMap!3089 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!926078 () Bool)

(declare-fun res!623964 () Bool)

(assert (=> b!926078 (=> (not res!623964) (not e!519807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55476 (_ BitVec 32)) Bool)

(assert (=> b!926078 (= res!623964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926079 () Bool)

(declare-fun res!623966 () Bool)

(assert (=> b!926079 (=> (not res!623966) (not e!519807))))

(assert (=> b!926079 (= res!623966 (and (= (size!27143 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27142 _keys!1487) (size!27143 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926080 () Bool)

(assert (=> b!926080 (= e!519799 e!519808)))

(declare-fun lt!416966 () (_ BitVec 64))

(assert (=> b!926080 (= lt!416966 (select (arr!26683 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96672 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926080 (= c!96672 (validKeyInArray!0 lt!416966))))

(declare-fun b!926081 () Bool)

(declare-fun e!519809 () Bool)

(assert (=> b!926081 (= e!519809 (not true))))

(assert (=> b!926081 e!519805))

(declare-fun res!623967 () Bool)

(assert (=> b!926081 (=> (not res!623967) (not e!519805))))

(assert (=> b!926081 (= res!623967 (contains!4898 lt!416955 k0!1099))))

(assert (=> b!926081 (= lt!416955 (getCurrentListMap!3089 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!416958 () Unit!31302)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!77 (array!55476 array!55478 (_ BitVec 32) (_ BitVec 32) V!31305 V!31305 (_ BitVec 64) V!31305 (_ BitVec 32) Int) Unit!31302)

(assert (=> b!926081 (= lt!416958 (lemmaListMapApplyFromThenApplyFromZero!77 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926083 () Bool)

(declare-fun res!623972 () Bool)

(assert (=> b!926083 (=> (not res!623972) (not e!519807))))

(declare-datatypes ((List!18753 0))(
  ( (Nil!18750) (Cons!18749 (h!19895 (_ BitVec 64)) (t!26730 List!18753)) )
))
(declare-fun arrayNoDuplicates!0 (array!55476 (_ BitVec 32) List!18753) Bool)

(assert (=> b!926083 (= res!623972 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18750))))

(declare-fun b!926084 () Bool)

(declare-fun e!519810 () Bool)

(assert (=> b!926084 (= e!519810 tp_is_empty!19755)))

(declare-fun b!926085 () Bool)

(declare-fun lt!416967 () ListLongMap!11647)

(declare-fun lt!416956 () V!31305)

(assert (=> b!926085 (= (apply!669 lt!416967 k0!1099) lt!416956)))

(declare-fun lt!416963 () V!31305)

(declare-fun lt!416961 () Unit!31302)

(declare-fun addApplyDifferent!389 (ListLongMap!11647 (_ BitVec 64) V!31305 (_ BitVec 64)) Unit!31302)

(assert (=> b!926085 (= lt!416961 (addApplyDifferent!389 lt!416954 lt!416966 lt!416963 k0!1099))))

(assert (=> b!926085 (not (= lt!416966 k0!1099))))

(declare-fun lt!416964 () Unit!31302)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55476 (_ BitVec 64) (_ BitVec 32) List!18753) Unit!31302)

(assert (=> b!926085 (= lt!416964 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18750))))

(declare-fun e!519804 () Bool)

(assert (=> b!926085 e!519804))

(declare-fun c!96670 () Bool)

(assert (=> b!926085 (= c!96670 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416959 () Unit!31302)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!240 (array!55476 array!55478 (_ BitVec 32) (_ BitVec 32) V!31305 V!31305 (_ BitVec 64) (_ BitVec 32) Int) Unit!31302)

(assert (=> b!926085 (= lt!416959 (lemmaListMapContainsThenArrayContainsFrom!240 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!926085 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18750)))

(declare-fun lt!416953 () Unit!31302)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55476 (_ BitVec 32) (_ BitVec 32)) Unit!31302)

(assert (=> b!926085 (= lt!416953 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926085 (contains!4898 lt!416967 k0!1099)))

(declare-fun lt!416968 () tuple2!12950)

(declare-fun +!2733 (ListLongMap!11647 tuple2!12950) ListLongMap!11647)

(assert (=> b!926085 (= lt!416967 (+!2733 lt!416954 lt!416968))))

(declare-fun lt!416960 () Unit!31302)

(declare-fun addStillContains!457 (ListLongMap!11647 (_ BitVec 64) V!31305 (_ BitVec 64)) Unit!31302)

(assert (=> b!926085 (= lt!416960 (addStillContains!457 lt!416954 lt!416966 lt!416963 k0!1099))))

(assert (=> b!926085 (= (getCurrentListMap!3089 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2733 (getCurrentListMap!3089 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416968))))

(assert (=> b!926085 (= lt!416968 (tuple2!12951 lt!416966 lt!416963))))

(declare-fun get!14038 (ValueCell!9396 V!31305) V!31305)

(declare-fun dynLambda!1522 (Int (_ BitVec 64)) V!31305)

(assert (=> b!926085 (= lt!416963 (get!14038 (select (arr!26684 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1522 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416957 () Unit!31302)

(declare-fun lemmaListMapRecursiveValidKeyArray!123 (array!55476 array!55478 (_ BitVec 32) (_ BitVec 32) V!31305 V!31305 (_ BitVec 32) Int) Unit!31302)

(assert (=> b!926085 (= lt!416957 (lemmaListMapRecursiveValidKeyArray!123 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926085 (= e!519808 lt!416961)))

(declare-fun b!926086 () Bool)

(assert (=> b!926086 (= e!519804 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926087 () Bool)

(declare-fun res!623965 () Bool)

(assert (=> b!926087 (=> (not res!623965) (not e!519807))))

(assert (=> b!926087 (= res!623965 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27142 _keys!1487))))))

(declare-fun b!926088 () Bool)

(declare-fun e!519803 () Bool)

(declare-fun e!519802 () Bool)

(assert (=> b!926088 (= e!519803 e!519802)))

(declare-fun res!623973 () Bool)

(assert (=> b!926088 (=> (not res!623973) (not e!519802))))

(assert (=> b!926088 (= res!623973 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27142 _keys!1487)))))

(declare-fun lt!416962 () Unit!31302)

(assert (=> b!926088 (= lt!416962 e!519799)))

(declare-fun c!96671 () Bool)

(assert (=> b!926088 (= c!96671 (validKeyInArray!0 k0!1099))))

(declare-fun b!926089 () Bool)

(declare-fun res!623974 () Bool)

(assert (=> b!926089 (=> (not res!623974) (not e!519809))))

(declare-fun lt!416965 () ListLongMap!11647)

(assert (=> b!926089 (= res!623974 (= (apply!669 lt!416965 k0!1099) v!791))))

(declare-fun b!926090 () Bool)

(declare-fun arrayContainsKey!0 (array!55476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926090 (= e!519804 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!926091 () Bool)

(assert (=> b!926091 (= e!519802 e!519809)))

(declare-fun res!623971 () Bool)

(assert (=> b!926091 (=> (not res!623971) (not e!519809))))

(assert (=> b!926091 (= res!623971 (contains!4898 lt!416965 k0!1099))))

(assert (=> b!926091 (= lt!416965 (getCurrentListMap!3089 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31389 () Bool)

(declare-fun mapRes!31389 () Bool)

(assert (=> mapIsEmpty!31389 mapRes!31389))

(declare-fun res!623970 () Bool)

(assert (=> start!79034 (=> (not res!623970) (not e!519807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79034 (= res!623970 (validMask!0 mask!1881))))

(assert (=> start!79034 e!519807))

(assert (=> start!79034 true))

(assert (=> start!79034 tp_is_empty!19755))

(declare-fun e!519811 () Bool)

(declare-fun array_inv!20782 (array!55478) Bool)

(assert (=> start!79034 (and (array_inv!20782 _values!1231) e!519811)))

(assert (=> start!79034 tp!60182))

(declare-fun array_inv!20783 (array!55476) Bool)

(assert (=> start!79034 (array_inv!20783 _keys!1487)))

(declare-fun b!926082 () Bool)

(assert (=> b!926082 (= e!519811 (and e!519810 mapRes!31389))))

(declare-fun condMapEmpty!31389 () Bool)

(declare-fun mapDefault!31389 () ValueCell!9396)

(assert (=> b!926082 (= condMapEmpty!31389 (= (arr!26684 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9396)) mapDefault!31389)))))

(declare-fun mapNonEmpty!31389 () Bool)

(declare-fun tp!60181 () Bool)

(assert (=> mapNonEmpty!31389 (= mapRes!31389 (and tp!60181 e!519806))))

(declare-fun mapValue!31389 () ValueCell!9396)

(declare-fun mapKey!31389 () (_ BitVec 32))

(declare-fun mapRest!31389 () (Array (_ BitVec 32) ValueCell!9396))

(assert (=> mapNonEmpty!31389 (= (arr!26684 _values!1231) (store mapRest!31389 mapKey!31389 mapValue!31389))))

(declare-fun b!926092 () Bool)

(assert (=> b!926092 (= e!519801 e!519803)))

(declare-fun res!623969 () Bool)

(assert (=> b!926092 (=> (not res!623969) (not e!519803))))

(assert (=> b!926092 (= res!623969 (and (= lt!416956 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926092 (= lt!416956 (apply!669 lt!416954 k0!1099))))

(assert (= (and start!79034 res!623970) b!926079))

(assert (= (and b!926079 res!623966) b!926078))

(assert (= (and b!926078 res!623964) b!926083))

(assert (= (and b!926083 res!623972) b!926087))

(assert (= (and b!926087 res!623965) b!926077))

(assert (= (and b!926077 res!623968) b!926092))

(assert (= (and b!926092 res!623969) b!926088))

(assert (= (and b!926088 c!96671) b!926080))

(assert (= (and b!926088 (not c!96671)) b!926075))

(assert (= (and b!926080 c!96672) b!926085))

(assert (= (and b!926080 (not c!96672)) b!926073))

(assert (= (and b!926085 c!96670) b!926090))

(assert (= (and b!926085 (not c!96670)) b!926086))

(assert (= (and b!926088 res!623973) b!926091))

(assert (= (and b!926091 res!623971) b!926089))

(assert (= (and b!926089 res!623974) b!926081))

(assert (= (and b!926081 res!623967) b!926076))

(assert (= (and b!926082 condMapEmpty!31389) mapIsEmpty!31389))

(assert (= (and b!926082 (not condMapEmpty!31389)) mapNonEmpty!31389))

(get-info :version)

(assert (= (and mapNonEmpty!31389 ((_ is ValueCellFull!9396) mapValue!31389)) b!926074))

(assert (= (and b!926082 ((_ is ValueCellFull!9396) mapDefault!31389)) b!926084))

(assert (= start!79034 b!926082))

(declare-fun b_lambda!13749 () Bool)

(assert (=> (not b_lambda!13749) (not b!926085)))

(declare-fun t!26728 () Bool)

(declare-fun tb!5827 () Bool)

(assert (=> (and start!79034 (= defaultEntry!1235 defaultEntry!1235) t!26728) tb!5827))

(declare-fun result!11477 () Bool)

(assert (=> tb!5827 (= result!11477 tp_is_empty!19755)))

(assert (=> b!926085 t!26728))

(declare-fun b_and!28233 () Bool)

(assert (= b_and!28231 (and (=> t!26728 result!11477) b_and!28233)))

(declare-fun m!860575 () Bool)

(assert (=> b!926078 m!860575))

(declare-fun m!860577 () Bool)

(assert (=> b!926076 m!860577))

(declare-fun m!860579 () Bool)

(assert (=> b!926092 m!860579))

(declare-fun m!860581 () Bool)

(assert (=> b!926077 m!860581))

(declare-fun m!860583 () Bool)

(assert (=> b!926077 m!860583))

(declare-fun m!860585 () Bool)

(assert (=> mapNonEmpty!31389 m!860585))

(declare-fun m!860587 () Bool)

(assert (=> b!926083 m!860587))

(declare-fun m!860589 () Bool)

(assert (=> start!79034 m!860589))

(declare-fun m!860591 () Bool)

(assert (=> start!79034 m!860591))

(declare-fun m!860593 () Bool)

(assert (=> start!79034 m!860593))

(declare-fun m!860595 () Bool)

(assert (=> b!926091 m!860595))

(declare-fun m!860597 () Bool)

(assert (=> b!926091 m!860597))

(declare-fun m!860599 () Bool)

(assert (=> b!926085 m!860599))

(declare-fun m!860601 () Bool)

(assert (=> b!926085 m!860601))

(declare-fun m!860603 () Bool)

(assert (=> b!926085 m!860603))

(declare-fun m!860605 () Bool)

(assert (=> b!926085 m!860605))

(declare-fun m!860607 () Bool)

(assert (=> b!926085 m!860607))

(declare-fun m!860609 () Bool)

(assert (=> b!926085 m!860609))

(declare-fun m!860611 () Bool)

(assert (=> b!926085 m!860611))

(assert (=> b!926085 m!860603))

(assert (=> b!926085 m!860605))

(declare-fun m!860613 () Bool)

(assert (=> b!926085 m!860613))

(assert (=> b!926085 m!860597))

(declare-fun m!860615 () Bool)

(assert (=> b!926085 m!860615))

(declare-fun m!860617 () Bool)

(assert (=> b!926085 m!860617))

(declare-fun m!860619 () Bool)

(assert (=> b!926085 m!860619))

(declare-fun m!860621 () Bool)

(assert (=> b!926085 m!860621))

(declare-fun m!860623 () Bool)

(assert (=> b!926085 m!860623))

(assert (=> b!926085 m!860607))

(declare-fun m!860625 () Bool)

(assert (=> b!926085 m!860625))

(declare-fun m!860627 () Bool)

(assert (=> b!926085 m!860627))

(declare-fun m!860629 () Bool)

(assert (=> b!926080 m!860629))

(declare-fun m!860631 () Bool)

(assert (=> b!926080 m!860631))

(declare-fun m!860633 () Bool)

(assert (=> b!926089 m!860633))

(declare-fun m!860635 () Bool)

(assert (=> b!926090 m!860635))

(declare-fun m!860637 () Bool)

(assert (=> b!926088 m!860637))

(declare-fun m!860639 () Bool)

(assert (=> b!926081 m!860639))

(declare-fun m!860641 () Bool)

(assert (=> b!926081 m!860641))

(declare-fun m!860643 () Bool)

(assert (=> b!926081 m!860643))

(check-sat (not b_next!17247) (not b!926088) tp_is_empty!19755 (not start!79034) (not b!926080) (not b!926076) (not b!926085) (not b!926081) (not b!926078) (not b!926092) (not b!926091) (not b!926083) (not mapNonEmpty!31389) (not b!926090) (not b!926077) b_and!28233 (not b!926089) (not b_lambda!13749))
(check-sat b_and!28233 (not b_next!17247))
