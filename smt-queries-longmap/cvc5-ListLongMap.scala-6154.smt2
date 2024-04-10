; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79032 () Bool)

(assert start!79032)

(declare-fun b_free!17245 () Bool)

(declare-fun b_next!17245 () Bool)

(assert (=> start!79032 (= b_free!17245 (not b_next!17245))))

(declare-fun tp!60176 () Bool)

(declare-fun b_and!28227 () Bool)

(assert (=> start!79032 (= tp!60176 b_and!28227)))

(declare-fun b!926011 () Bool)

(declare-fun e!519763 () Bool)

(declare-fun e!519765 () Bool)

(assert (=> b!926011 (= e!519763 e!519765)))

(declare-fun res!623938 () Bool)

(assert (=> b!926011 (=> (not res!623938) (not e!519765))))

(declare-datatypes ((V!31303 0))(
  ( (V!31304 (val!9927 Int)) )
))
(declare-datatypes ((tuple2!12948 0))(
  ( (tuple2!12949 (_1!6485 (_ BitVec 64)) (_2!6485 V!31303)) )
))
(declare-datatypes ((List!18750 0))(
  ( (Nil!18747) (Cons!18746 (h!19892 tuple2!12948) (t!26725 List!18750)) )
))
(declare-datatypes ((ListLongMap!11645 0))(
  ( (ListLongMap!11646 (toList!5838 List!18750)) )
))
(declare-fun lt!416914 () ListLongMap!11645)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4897 (ListLongMap!11645 (_ BitVec 64)) Bool)

(assert (=> b!926011 (= res!623938 (contains!4897 lt!416914 k!1099))))

(declare-datatypes ((array!55472 0))(
  ( (array!55473 (arr!26681 (Array (_ BitVec 32) (_ BitVec 64))) (size!27140 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55472)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9395 0))(
  ( (ValueCellFull!9395 (v!12445 V!31303)) (EmptyCell!9395) )
))
(declare-datatypes ((array!55474 0))(
  ( (array!55475 (arr!26682 (Array (_ BitVec 32) ValueCell!9395)) (size!27141 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55474)

(declare-fun defaultEntry!1235 () Int)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31303)

(declare-fun minValue!1173 () V!31303)

(declare-fun getCurrentListMap!3088 (array!55472 array!55474 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 32) Int) ListLongMap!11645)

(assert (=> b!926011 (= lt!416914 (getCurrentListMap!3088 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31386 () Bool)

(declare-fun mapRes!31386 () Bool)

(declare-fun tp!60175 () Bool)

(declare-fun e!519766 () Bool)

(assert (=> mapNonEmpty!31386 (= mapRes!31386 (and tp!60175 e!519766))))

(declare-fun mapKey!31386 () (_ BitVec 32))

(declare-fun mapRest!31386 () (Array (_ BitVec 32) ValueCell!9395))

(declare-fun mapValue!31386 () ValueCell!9395)

(assert (=> mapNonEmpty!31386 (= (arr!26682 _values!1231) (store mapRest!31386 mapKey!31386 mapValue!31386))))

(declare-fun b!926012 () Bool)

(declare-fun tp_is_empty!19753 () Bool)

(assert (=> b!926012 (= e!519766 tp_is_empty!19753)))

(declare-fun b!926014 () Bool)

(declare-datatypes ((Unit!31299 0))(
  ( (Unit!31300) )
))
(declare-fun e!519761 () Unit!31299)

(declare-fun e!519771 () Unit!31299)

(assert (=> b!926014 (= e!519761 e!519771)))

(declare-fun lt!416905 () (_ BitVec 64))

(assert (=> b!926014 (= lt!416905 (select (arr!26681 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96661 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926014 (= c!96661 (validKeyInArray!0 lt!416905))))

(declare-fun b!926015 () Bool)

(declare-fun res!623935 () Bool)

(declare-fun e!519768 () Bool)

(assert (=> b!926015 (=> (not res!623935) (not e!519768))))

(assert (=> b!926015 (= res!623935 (and (= (size!27141 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27140 _keys!1487) (size!27141 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!926016 () Bool)

(declare-fun res!623932 () Bool)

(assert (=> b!926016 (=> (not res!623932) (not e!519768))))

(assert (=> b!926016 (= res!623932 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27140 _keys!1487))))))

(declare-fun mapIsEmpty!31386 () Bool)

(assert (=> mapIsEmpty!31386 mapRes!31386))

(declare-fun b!926017 () Bool)

(declare-fun lt!416912 () ListLongMap!11645)

(declare-fun lt!416918 () V!31303)

(declare-fun apply!668 (ListLongMap!11645 (_ BitVec 64)) V!31303)

(assert (=> b!926017 (= (apply!668 lt!416912 k!1099) lt!416918)))

(declare-fun lt!416908 () V!31303)

(declare-fun lt!416919 () Unit!31299)

(declare-fun lt!416916 () ListLongMap!11645)

(declare-fun addApplyDifferent!388 (ListLongMap!11645 (_ BitVec 64) V!31303 (_ BitVec 64)) Unit!31299)

(assert (=> b!926017 (= lt!416919 (addApplyDifferent!388 lt!416916 lt!416905 lt!416908 k!1099))))

(assert (=> b!926017 (not (= lt!416905 k!1099))))

(declare-fun lt!416906 () Unit!31299)

(declare-datatypes ((List!18751 0))(
  ( (Nil!18748) (Cons!18747 (h!19893 (_ BitVec 64)) (t!26726 List!18751)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55472 (_ BitVec 64) (_ BitVec 32) List!18751) Unit!31299)

(assert (=> b!926017 (= lt!416906 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18748))))

(declare-fun e!519769 () Bool)

(assert (=> b!926017 e!519769))

(declare-fun c!96662 () Bool)

(assert (=> b!926017 (= c!96662 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416909 () Unit!31299)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!239 (array!55472 array!55474 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 64) (_ BitVec 32) Int) Unit!31299)

(assert (=> b!926017 (= lt!416909 (lemmaListMapContainsThenArrayContainsFrom!239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55472 (_ BitVec 32) List!18751) Bool)

(assert (=> b!926017 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18748)))

(declare-fun lt!416910 () Unit!31299)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55472 (_ BitVec 32) (_ BitVec 32)) Unit!31299)

(assert (=> b!926017 (= lt!416910 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!926017 (contains!4897 lt!416912 k!1099)))

(declare-fun lt!416913 () tuple2!12948)

(declare-fun +!2732 (ListLongMap!11645 tuple2!12948) ListLongMap!11645)

(assert (=> b!926017 (= lt!416912 (+!2732 lt!416916 lt!416913))))

(declare-fun lt!416915 () Unit!31299)

(declare-fun addStillContains!456 (ListLongMap!11645 (_ BitVec 64) V!31303 (_ BitVec 64)) Unit!31299)

(assert (=> b!926017 (= lt!416915 (addStillContains!456 lt!416916 lt!416905 lt!416908 k!1099))))

(assert (=> b!926017 (= (getCurrentListMap!3088 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2732 (getCurrentListMap!3088 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416913))))

(assert (=> b!926017 (= lt!416913 (tuple2!12949 lt!416905 lt!416908))))

(declare-fun get!14037 (ValueCell!9395 V!31303) V!31303)

(declare-fun dynLambda!1521 (Int (_ BitVec 64)) V!31303)

(assert (=> b!926017 (= lt!416908 (get!14037 (select (arr!26682 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1521 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416911 () Unit!31299)

(declare-fun lemmaListMapRecursiveValidKeyArray!122 (array!55472 array!55474 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 32) Int) Unit!31299)

(assert (=> b!926017 (= lt!416911 (lemmaListMapRecursiveValidKeyArray!122 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!926017 (= e!519771 lt!416919)))

(declare-fun b!926018 () Bool)

(declare-fun res!623939 () Bool)

(assert (=> b!926018 (=> (not res!623939) (not e!519768))))

(assert (=> b!926018 (= res!623939 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18748))))

(declare-fun b!926019 () Bool)

(declare-fun res!623933 () Bool)

(assert (=> b!926019 (=> (not res!623933) (not e!519768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55472 (_ BitVec 32)) Bool)

(assert (=> b!926019 (= res!623933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926020 () Bool)

(assert (=> b!926020 (= e!519765 (not true))))

(declare-fun e!519772 () Bool)

(assert (=> b!926020 e!519772))

(declare-fun res!623931 () Bool)

(assert (=> b!926020 (=> (not res!623931) (not e!519772))))

(declare-fun lt!416907 () ListLongMap!11645)

(assert (=> b!926020 (= res!623931 (contains!4897 lt!416907 k!1099))))

(assert (=> b!926020 (= lt!416907 (getCurrentListMap!3088 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun v!791 () V!31303)

(declare-fun lt!416917 () Unit!31299)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!76 (array!55472 array!55474 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 64) V!31303 (_ BitVec 32) Int) Unit!31299)

(assert (=> b!926020 (= lt!416917 (lemmaListMapApplyFromThenApplyFromZero!76 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!623941 () Bool)

(assert (=> start!79032 (=> (not res!623941) (not e!519768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79032 (= res!623941 (validMask!0 mask!1881))))

(assert (=> start!79032 e!519768))

(assert (=> start!79032 true))

(assert (=> start!79032 tp_is_empty!19753))

(declare-fun e!519764 () Bool)

(declare-fun array_inv!20780 (array!55474) Bool)

(assert (=> start!79032 (and (array_inv!20780 _values!1231) e!519764)))

(assert (=> start!79032 tp!60176))

(declare-fun array_inv!20781 (array!55472) Bool)

(assert (=> start!79032 (array_inv!20781 _keys!1487)))

(declare-fun b!926013 () Bool)

(declare-fun e!519767 () Bool)

(declare-fun e!519760 () Bool)

(assert (=> b!926013 (= e!519767 e!519760)))

(declare-fun res!623937 () Bool)

(assert (=> b!926013 (=> (not res!623937) (not e!519760))))

(assert (=> b!926013 (= res!623937 (and (= lt!416918 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!926013 (= lt!416918 (apply!668 lt!416916 k!1099))))

(declare-fun b!926021 () Bool)

(declare-fun Unit!31301 () Unit!31299)

(assert (=> b!926021 (= e!519761 Unit!31301)))

(declare-fun b!926022 () Bool)

(declare-fun arrayContainsKey!0 (array!55472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926022 (= e!519769 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!926023 () Bool)

(declare-fun e!519770 () Bool)

(assert (=> b!926023 (= e!519770 tp_is_empty!19753)))

(declare-fun b!926024 () Bool)

(assert (=> b!926024 (= e!519772 (= (apply!668 lt!416907 k!1099) v!791))))

(declare-fun b!926025 () Bool)

(assert (=> b!926025 (= e!519760 e!519763)))

(declare-fun res!623936 () Bool)

(assert (=> b!926025 (=> (not res!623936) (not e!519763))))

(assert (=> b!926025 (= res!623936 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27140 _keys!1487)))))

(declare-fun lt!416920 () Unit!31299)

(assert (=> b!926025 (= lt!416920 e!519761)))

(declare-fun c!96663 () Bool)

(assert (=> b!926025 (= c!96663 (validKeyInArray!0 k!1099))))

(declare-fun b!926026 () Bool)

(assert (=> b!926026 (= e!519769 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926027 () Bool)

(assert (=> b!926027 (= e!519764 (and e!519770 mapRes!31386))))

(declare-fun condMapEmpty!31386 () Bool)

(declare-fun mapDefault!31386 () ValueCell!9395)

