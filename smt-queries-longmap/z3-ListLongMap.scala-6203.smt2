; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79354 () Bool)

(assert start!79354)

(declare-fun b_free!17541 () Bool)

(declare-fun b_next!17541 () Bool)

(assert (=> start!79354 (= b_free!17541 (not b_next!17541))))

(declare-fun tp!61066 () Bool)

(declare-fun b_and!28641 () Bool)

(assert (=> start!79354 (= tp!61066 b_and!28641)))

(declare-fun res!627719 () Bool)

(declare-fun e!523444 () Bool)

(assert (=> start!79354 (=> (not res!627719) (not e!523444))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79354 (= res!627719 (validMask!0 mask!1881))))

(assert (=> start!79354 e!523444))

(assert (=> start!79354 true))

(declare-fun tp_is_empty!20049 () Bool)

(assert (=> start!79354 tp_is_empty!20049))

(declare-datatypes ((V!31697 0))(
  ( (V!31698 (val!10075 Int)) )
))
(declare-datatypes ((ValueCell!9543 0))(
  ( (ValueCellFull!9543 (v!12594 V!31697)) (EmptyCell!9543) )
))
(declare-datatypes ((array!56038 0))(
  ( (array!56039 (arr!26963 (Array (_ BitVec 32) ValueCell!9543)) (size!27422 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56038)

(declare-fun e!523445 () Bool)

(declare-fun array_inv!20986 (array!56038) Bool)

(assert (=> start!79354 (and (array_inv!20986 _values!1231) e!523445)))

(assert (=> start!79354 tp!61066))

(declare-datatypes ((array!56040 0))(
  ( (array!56041 (arr!26964 (Array (_ BitVec 32) (_ BitVec 64))) (size!27423 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56040)

(declare-fun array_inv!20987 (array!56040) Bool)

(assert (=> start!79354 (array_inv!20987 _keys!1487)))

(declare-fun b!932076 () Bool)

(declare-fun e!523443 () Bool)

(assert (=> b!932076 (= e!523444 e!523443)))

(declare-fun res!627716 () Bool)

(assert (=> b!932076 (=> (not res!627716) (not e!523443))))

(declare-datatypes ((tuple2!13196 0))(
  ( (tuple2!13197 (_1!6609 (_ BitVec 64)) (_2!6609 V!31697)) )
))
(declare-datatypes ((List!18982 0))(
  ( (Nil!18979) (Cons!18978 (h!20124 tuple2!13196) (t!27067 List!18982)) )
))
(declare-datatypes ((ListLongMap!11893 0))(
  ( (ListLongMap!11894 (toList!5962 List!18982)) )
))
(declare-fun lt!419733 () ListLongMap!11893)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5011 (ListLongMap!11893 (_ BitVec 64)) Bool)

(assert (=> b!932076 (= res!627716 (contains!5011 lt!419733 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31697)

(declare-fun minValue!1173 () V!31697)

(declare-fun getCurrentListMap!3200 (array!56040 array!56038 (_ BitVec 32) (_ BitVec 32) V!31697 V!31697 (_ BitVec 32) Int) ListLongMap!11893)

(assert (=> b!932076 (= lt!419733 (getCurrentListMap!3200 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932077 () Bool)

(declare-fun res!627718 () Bool)

(assert (=> b!932077 (=> (not res!627718) (not e!523444))))

(assert (=> b!932077 (= res!627718 (and (= (size!27422 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27423 _keys!1487) (size!27422 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932078 () Bool)

(declare-fun e!523448 () Bool)

(assert (=> b!932078 (= e!523443 e!523448)))

(declare-fun res!627724 () Bool)

(assert (=> b!932078 (=> (not res!627724) (not e!523448))))

(declare-fun lt!419738 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932078 (= res!627724 (validKeyInArray!0 lt!419738))))

(assert (=> b!932078 (= lt!419738 (select (arr!26964 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932079 () Bool)

(declare-fun res!627717 () Bool)

(assert (=> b!932079 (=> (not res!627717) (not e!523444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56040 (_ BitVec 32)) Bool)

(assert (=> b!932079 (= res!627717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932080 () Bool)

(declare-fun res!627720 () Bool)

(assert (=> b!932080 (=> (not res!627720) (not e!523443))))

(assert (=> b!932080 (= res!627720 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31833 () Bool)

(declare-fun mapRes!31833 () Bool)

(assert (=> mapIsEmpty!31833 mapRes!31833))

(declare-fun b!932081 () Bool)

(declare-fun e!523447 () Bool)

(assert (=> b!932081 (= e!523445 (and e!523447 mapRes!31833))))

(declare-fun condMapEmpty!31833 () Bool)

(declare-fun mapDefault!31833 () ValueCell!9543)

(assert (=> b!932081 (= condMapEmpty!31833 (= (arr!26963 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9543)) mapDefault!31833)))))

(declare-fun b!932082 () Bool)

(declare-fun res!627721 () Bool)

(assert (=> b!932082 (=> (not res!627721) (not e!523443))))

(assert (=> b!932082 (= res!627721 (validKeyInArray!0 k0!1099))))

(declare-fun b!932083 () Bool)

(declare-fun e!523449 () Bool)

(assert (=> b!932083 (= e!523449 tp_is_empty!20049)))

(declare-fun b!932084 () Bool)

(declare-fun res!627723 () Bool)

(assert (=> b!932084 (=> (not res!627723) (not e!523444))))

(assert (=> b!932084 (= res!627723 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27423 _keys!1487))))))

(declare-fun b!932085 () Bool)

(declare-fun res!627715 () Bool)

(assert (=> b!932085 (=> (not res!627715) (not e!523444))))

(declare-datatypes ((List!18983 0))(
  ( (Nil!18980) (Cons!18979 (h!20125 (_ BitVec 64)) (t!27068 List!18983)) )
))
(declare-fun arrayNoDuplicates!0 (array!56040 (_ BitVec 32) List!18983) Bool)

(assert (=> b!932085 (= res!627715 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18980))))

(declare-fun b!932086 () Bool)

(assert (=> b!932086 (= e!523448 (not true))))

(declare-fun lt!419736 () tuple2!13196)

(declare-fun +!2769 (ListLongMap!11893 tuple2!13196) ListLongMap!11893)

(assert (=> b!932086 (contains!5011 (+!2769 lt!419733 lt!419736) k0!1099)))

(declare-fun lt!419734 () V!31697)

(declare-datatypes ((Unit!31453 0))(
  ( (Unit!31454) )
))
(declare-fun lt!419735 () Unit!31453)

(declare-fun addStillContains!488 (ListLongMap!11893 (_ BitVec 64) V!31697 (_ BitVec 64)) Unit!31453)

(assert (=> b!932086 (= lt!419735 (addStillContains!488 lt!419733 lt!419738 lt!419734 k0!1099))))

(assert (=> b!932086 (= (getCurrentListMap!3200 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2769 (getCurrentListMap!3200 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419736))))

(assert (=> b!932086 (= lt!419736 (tuple2!13197 lt!419738 lt!419734))))

(declare-fun get!14175 (ValueCell!9543 V!31697) V!31697)

(declare-fun dynLambda!1558 (Int (_ BitVec 64)) V!31697)

(assert (=> b!932086 (= lt!419734 (get!14175 (select (arr!26963 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1558 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419737 () Unit!31453)

(declare-fun lemmaListMapRecursiveValidKeyArray!159 (array!56040 array!56038 (_ BitVec 32) (_ BitVec 32) V!31697 V!31697 (_ BitVec 32) Int) Unit!31453)

(assert (=> b!932086 (= lt!419737 (lemmaListMapRecursiveValidKeyArray!159 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932087 () Bool)

(declare-fun res!627722 () Bool)

(assert (=> b!932087 (=> (not res!627722) (not e!523443))))

(declare-fun v!791 () V!31697)

(declare-fun apply!778 (ListLongMap!11893 (_ BitVec 64)) V!31697)

(assert (=> b!932087 (= res!627722 (= (apply!778 lt!419733 k0!1099) v!791))))

(declare-fun mapNonEmpty!31833 () Bool)

(declare-fun tp!61067 () Bool)

(assert (=> mapNonEmpty!31833 (= mapRes!31833 (and tp!61067 e!523449))))

(declare-fun mapKey!31833 () (_ BitVec 32))

(declare-fun mapValue!31833 () ValueCell!9543)

(declare-fun mapRest!31833 () (Array (_ BitVec 32) ValueCell!9543))

(assert (=> mapNonEmpty!31833 (= (arr!26963 _values!1231) (store mapRest!31833 mapKey!31833 mapValue!31833))))

(declare-fun b!932088 () Bool)

(assert (=> b!932088 (= e!523447 tp_is_empty!20049)))

(assert (= (and start!79354 res!627719) b!932077))

(assert (= (and b!932077 res!627718) b!932079))

(assert (= (and b!932079 res!627717) b!932085))

(assert (= (and b!932085 res!627715) b!932084))

(assert (= (and b!932084 res!627723) b!932076))

(assert (= (and b!932076 res!627716) b!932087))

(assert (= (and b!932087 res!627722) b!932080))

(assert (= (and b!932080 res!627720) b!932082))

(assert (= (and b!932082 res!627721) b!932078))

(assert (= (and b!932078 res!627724) b!932086))

(assert (= (and b!932081 condMapEmpty!31833) mapIsEmpty!31833))

(assert (= (and b!932081 (not condMapEmpty!31833)) mapNonEmpty!31833))

(get-info :version)

(assert (= (and mapNonEmpty!31833 ((_ is ValueCellFull!9543) mapValue!31833)) b!932083))

(assert (= (and b!932081 ((_ is ValueCellFull!9543) mapDefault!31833)) b!932088))

(assert (= start!79354 b!932081))

(declare-fun b_lambda!13875 () Bool)

(assert (=> (not b_lambda!13875) (not b!932086)))

(declare-fun t!27066 () Bool)

(declare-fun tb!5935 () Bool)

(assert (=> (and start!79354 (= defaultEntry!1235 defaultEntry!1235) t!27066) tb!5935))

(declare-fun result!11695 () Bool)

(assert (=> tb!5935 (= result!11695 tp_is_empty!20049)))

(assert (=> b!932086 t!27066))

(declare-fun b_and!28643 () Bool)

(assert (= b_and!28641 (and (=> t!27066 result!11695) b_and!28643)))

(declare-fun m!866019 () Bool)

(assert (=> b!932085 m!866019))

(declare-fun m!866021 () Bool)

(assert (=> mapNonEmpty!31833 m!866021))

(declare-fun m!866023 () Bool)

(assert (=> start!79354 m!866023))

(declare-fun m!866025 () Bool)

(assert (=> start!79354 m!866025))

(declare-fun m!866027 () Bool)

(assert (=> start!79354 m!866027))

(declare-fun m!866029 () Bool)

(assert (=> b!932079 m!866029))

(declare-fun m!866031 () Bool)

(assert (=> b!932086 m!866031))

(declare-fun m!866033 () Bool)

(assert (=> b!932086 m!866033))

(declare-fun m!866035 () Bool)

(assert (=> b!932086 m!866035))

(declare-fun m!866037 () Bool)

(assert (=> b!932086 m!866037))

(declare-fun m!866039 () Bool)

(assert (=> b!932086 m!866039))

(declare-fun m!866041 () Bool)

(assert (=> b!932086 m!866041))

(assert (=> b!932086 m!866035))

(assert (=> b!932086 m!866037))

(declare-fun m!866043 () Bool)

(assert (=> b!932086 m!866043))

(declare-fun m!866045 () Bool)

(assert (=> b!932086 m!866045))

(assert (=> b!932086 m!866039))

(assert (=> b!932086 m!866031))

(declare-fun m!866047 () Bool)

(assert (=> b!932086 m!866047))

(declare-fun m!866049 () Bool)

(assert (=> b!932086 m!866049))

(declare-fun m!866051 () Bool)

(assert (=> b!932087 m!866051))

(declare-fun m!866053 () Bool)

(assert (=> b!932082 m!866053))

(declare-fun m!866055 () Bool)

(assert (=> b!932078 m!866055))

(declare-fun m!866057 () Bool)

(assert (=> b!932078 m!866057))

(declare-fun m!866059 () Bool)

(assert (=> b!932076 m!866059))

(declare-fun m!866061 () Bool)

(assert (=> b!932076 m!866061))

(check-sat (not b!932076) (not b!932087) b_and!28643 (not mapNonEmpty!31833) (not b!932082) (not b_next!17541) (not b!932085) (not b!932078) (not start!79354) (not b!932079) (not b!932086) (not b_lambda!13875) tp_is_empty!20049)
(check-sat b_and!28643 (not b_next!17541))
