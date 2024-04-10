; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79090 () Bool)

(assert start!79090)

(declare-fun b_free!17303 () Bool)

(declare-fun b_next!17303 () Bool)

(assert (=> start!79090 (= b_free!17303 (not b_next!17303))))

(declare-fun tp!60350 () Bool)

(declare-fun b_and!28343 () Bool)

(assert (=> start!79090 (= tp!60350 b_and!28343)))

(declare-fun b!927809 () Bool)

(declare-fun e!520903 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!927809 (= e!520903 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927810 () Bool)

(declare-fun res!624896 () Bool)

(declare-fun e!520892 () Bool)

(assert (=> b!927810 (=> (not res!624896) (not e!520892))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55582 0))(
  ( (array!55583 (arr!26736 (Array (_ BitVec 32) (_ BitVec 64))) (size!27195 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55582)

(assert (=> b!927810 (= res!624896 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27195 _keys!1487))))))

(declare-fun b!927811 () Bool)

(declare-fun res!624897 () Bool)

(assert (=> b!927811 (=> (not res!624897) (not e!520892))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!31379 0))(
  ( (V!31380 (val!9956 Int)) )
))
(declare-datatypes ((ValueCell!9424 0))(
  ( (ValueCellFull!9424 (v!12474 V!31379)) (EmptyCell!9424) )
))
(declare-datatypes ((array!55584 0))(
  ( (array!55585 (arr!26737 (Array (_ BitVec 32) ValueCell!9424)) (size!27196 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55584)

(assert (=> b!927811 (= res!624897 (and (= (size!27196 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27195 _keys!1487) (size!27196 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927812 () Bool)

(declare-fun e!520894 () Bool)

(declare-fun e!520897 () Bool)

(assert (=> b!927812 (= e!520894 e!520897)))

(declare-fun res!624898 () Bool)

(assert (=> b!927812 (=> (not res!624898) (not e!520897))))

(declare-datatypes ((tuple2!13000 0))(
  ( (tuple2!13001 (_1!6511 (_ BitVec 64)) (_2!6511 V!31379)) )
))
(declare-datatypes ((List!18801 0))(
  ( (Nil!18798) (Cons!18797 (h!19943 tuple2!13000) (t!26834 List!18801)) )
))
(declare-datatypes ((ListLongMap!11697 0))(
  ( (ListLongMap!11698 (toList!5864 List!18801)) )
))
(declare-fun lt!418309 () ListLongMap!11697)

(declare-fun contains!4922 (ListLongMap!11697 (_ BitVec 64)) Bool)

(assert (=> b!927812 (= res!624898 (contains!4922 lt!418309 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31379)

(declare-fun minValue!1173 () V!31379)

(declare-fun getCurrentListMap!3113 (array!55582 array!55584 (_ BitVec 32) (_ BitVec 32) V!31379 V!31379 (_ BitVec 32) Int) ListLongMap!11697)

(assert (=> b!927812 (= lt!418309 (getCurrentListMap!3113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927813 () Bool)

(declare-fun e!520902 () Bool)

(assert (=> b!927813 (= e!520892 e!520902)))

(declare-fun res!624890 () Bool)

(assert (=> b!927813 (=> (not res!624890) (not e!520902))))

(declare-fun lt!418297 () ListLongMap!11697)

(assert (=> b!927813 (= res!624890 (contains!4922 lt!418297 k!1099))))

(assert (=> b!927813 (= lt!418297 (getCurrentListMap!3113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927814 () Bool)

(declare-fun e!520893 () Bool)

(assert (=> b!927814 (= e!520902 e!520893)))

(declare-fun res!624889 () Bool)

(assert (=> b!927814 (=> (not res!624889) (not e!520893))))

(declare-fun v!791 () V!31379)

(declare-fun lt!418311 () V!31379)

(assert (=> b!927814 (= res!624889 (and (= lt!418311 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun apply!694 (ListLongMap!11697 (_ BitVec 64)) V!31379)

(assert (=> b!927814 (= lt!418311 (apply!694 lt!418297 k!1099))))

(declare-fun b!927815 () Bool)

(declare-datatypes ((Unit!31390 0))(
  ( (Unit!31391) )
))
(declare-fun e!520896 () Unit!31390)

(declare-fun e!520901 () Unit!31390)

(assert (=> b!927815 (= e!520896 e!520901)))

(declare-fun lt!418299 () (_ BitVec 64))

(assert (=> b!927815 (= lt!418299 (select (arr!26736 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96922 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927815 (= c!96922 (validKeyInArray!0 lt!418299))))

(declare-fun b!927816 () Bool)

(assert (=> b!927816 (= e!520893 e!520894)))

(declare-fun res!624891 () Bool)

(assert (=> b!927816 (=> (not res!624891) (not e!520894))))

(assert (=> b!927816 (= res!624891 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27195 _keys!1487)))))

(declare-fun lt!418305 () Unit!31390)

(assert (=> b!927816 (= lt!418305 e!520896)))

(declare-fun c!96924 () Bool)

(assert (=> b!927816 (= c!96924 (validKeyInArray!0 k!1099))))

(declare-fun b!927817 () Bool)

(assert (=> b!927817 (= e!520897 (not true))))

(declare-fun e!520899 () Bool)

(assert (=> b!927817 e!520899))

(declare-fun res!624892 () Bool)

(assert (=> b!927817 (=> (not res!624892) (not e!520899))))

(declare-fun lt!418304 () ListLongMap!11697)

(assert (=> b!927817 (= res!624892 (contains!4922 lt!418304 k!1099))))

(assert (=> b!927817 (= lt!418304 (getCurrentListMap!3113 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418303 () Unit!31390)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!94 (array!55582 array!55584 (_ BitVec 32) (_ BitVec 32) V!31379 V!31379 (_ BitVec 64) V!31379 (_ BitVec 32) Int) Unit!31390)

(assert (=> b!927817 (= lt!418303 (lemmaListMapApplyFromThenApplyFromZero!94 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927818 () Bool)

(declare-fun e!520891 () Bool)

(declare-fun e!520900 () Bool)

(declare-fun mapRes!31473 () Bool)

(assert (=> b!927818 (= e!520891 (and e!520900 mapRes!31473))))

(declare-fun condMapEmpty!31473 () Bool)

(declare-fun mapDefault!31473 () ValueCell!9424)

