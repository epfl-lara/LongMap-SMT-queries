; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79054 () Bool)

(assert start!79054)

(declare-fun b_free!17267 () Bool)

(declare-fun b_next!17267 () Bool)

(assert (=> start!79054 (= b_free!17267 (not b_next!17267))))

(declare-fun tp!60241 () Bool)

(declare-fun b_and!28271 () Bool)

(assert (=> start!79054 (= tp!60241 b_and!28271)))

(declare-fun b!926693 () Bool)

(declare-fun e!520198 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!926693 (= e!520198 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!926694 () Bool)

(declare-fun res!624299 () Bool)

(declare-fun e!520201 () Bool)

(assert (=> b!926694 (=> (not res!624299) (not e!520201))))

(declare-datatypes ((V!31331 0))(
  ( (V!31332 (val!9938 Int)) )
))
(declare-fun v!791 () V!31331)

(declare-datatypes ((tuple2!12968 0))(
  ( (tuple2!12969 (_1!6495 (_ BitVec 64)) (_2!6495 V!31331)) )
))
(declare-datatypes ((List!18769 0))(
  ( (Nil!18766) (Cons!18765 (h!19911 tuple2!12968) (t!26766 List!18769)) )
))
(declare-datatypes ((ListLongMap!11665 0))(
  ( (ListLongMap!11666 (toList!5848 List!18769)) )
))
(declare-fun lt!417434 () ListLongMap!11665)

(declare-fun apply!678 (ListLongMap!11665 (_ BitVec 64)) V!31331)

(assert (=> b!926694 (= res!624299 (= (apply!678 lt!417434 k!1099) v!791))))

(declare-fun b!926695 () Bool)

(declare-fun e!520197 () Bool)

(declare-fun e!520189 () Bool)

(assert (=> b!926695 (= e!520197 e!520189)))

(declare-fun res!624297 () Bool)

(assert (=> b!926695 (=> (not res!624297) (not e!520189))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417445 () V!31331)

(assert (=> b!926695 (= res!624297 (and (= lt!417445 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!417447 () ListLongMap!11665)

(assert (=> b!926695 (= lt!417445 (apply!678 lt!417447 k!1099))))

(declare-fun b!926696 () Bool)

(declare-fun res!624298 () Bool)

(declare-fun e!520193 () Bool)

(assert (=> b!926696 (=> (not res!624298) (not e!520193))))

(declare-datatypes ((array!55514 0))(
  ( (array!55515 (arr!26702 (Array (_ BitVec 32) (_ BitVec 64))) (size!27161 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55514)

(assert (=> b!926696 (= res!624298 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27161 _keys!1487))))))

(declare-fun b!926697 () Bool)

(declare-fun res!624303 () Bool)

(assert (=> b!926697 (=> (not res!624303) (not e!520193))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55514 (_ BitVec 32)) Bool)

(assert (=> b!926697 (= res!624303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926698 () Bool)

(declare-fun arrayContainsKey!0 (array!55514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926698 (= e!520198 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun mapIsEmpty!31419 () Bool)

(declare-fun mapRes!31419 () Bool)

(assert (=> mapIsEmpty!31419 mapRes!31419))

(declare-fun b!926699 () Bool)

(declare-fun e!520191 () Bool)

(assert (=> b!926699 (= e!520191 e!520201)))

(declare-fun res!624300 () Bool)

(assert (=> b!926699 (=> (not res!624300) (not e!520201))))

(declare-fun contains!4907 (ListLongMap!11665 (_ BitVec 64)) Bool)

(assert (=> b!926699 (= res!624300 (contains!4907 lt!417434 k!1099))))

(declare-datatypes ((ValueCell!9406 0))(
  ( (ValueCellFull!9406 (v!12456 V!31331)) (EmptyCell!9406) )
))
(declare-datatypes ((array!55516 0))(
  ( (array!55517 (arr!26703 (Array (_ BitVec 32) ValueCell!9406)) (size!27162 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55516)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31331)

(declare-fun minValue!1173 () V!31331)

(declare-fun getCurrentListMap!3098 (array!55514 array!55516 (_ BitVec 32) (_ BitVec 32) V!31331 V!31331 (_ BitVec 32) Int) ListLongMap!11665)

(assert (=> b!926699 (= lt!417434 (getCurrentListMap!3098 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31419 () Bool)

(declare-fun tp!60242 () Bool)

(declare-fun e!520199 () Bool)

(assert (=> mapNonEmpty!31419 (= mapRes!31419 (and tp!60242 e!520199))))

(declare-fun mapValue!31419 () ValueCell!9406)

(declare-fun mapKey!31419 () (_ BitVec 32))

(declare-fun mapRest!31419 () (Array (_ BitVec 32) ValueCell!9406))

(assert (=> mapNonEmpty!31419 (= (arr!26703 _values!1231) (store mapRest!31419 mapKey!31419 mapValue!31419))))

(declare-fun b!926700 () Bool)

(declare-fun res!624304 () Bool)

(assert (=> b!926700 (=> (not res!624304) (not e!520193))))

(declare-datatypes ((List!18770 0))(
  ( (Nil!18767) (Cons!18766 (h!19912 (_ BitVec 64)) (t!26767 List!18770)) )
))
(declare-fun arrayNoDuplicates!0 (array!55514 (_ BitVec 32) List!18770) Bool)

(assert (=> b!926700 (= res!624304 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18767))))

(declare-fun b!926701 () Bool)

(declare-datatypes ((Unit!31333 0))(
  ( (Unit!31334) )
))
(declare-fun e!520196 () Unit!31333)

(declare-fun e!520200 () Unit!31333)

(assert (=> b!926701 (= e!520196 e!520200)))

(declare-fun lt!417446 () (_ BitVec 64))

(assert (=> b!926701 (= lt!417446 (select (arr!26702 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96761 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926701 (= c!96761 (validKeyInArray!0 lt!417446))))

(declare-fun b!926702 () Bool)

(declare-fun e!520190 () Bool)

(declare-fun lt!417444 () ListLongMap!11665)

(assert (=> b!926702 (= e!520190 (= (apply!678 lt!417444 k!1099) v!791))))

(declare-fun b!926704 () Bool)

(assert (=> b!926704 (= e!520189 e!520191)))

(declare-fun res!624295 () Bool)

(assert (=> b!926704 (=> (not res!624295) (not e!520191))))

(assert (=> b!926704 (= res!624295 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27161 _keys!1487)))))

(declare-fun lt!417438 () Unit!31333)

(assert (=> b!926704 (= lt!417438 e!520196)))

(declare-fun c!96760 () Bool)

(assert (=> b!926704 (= c!96760 (validKeyInArray!0 k!1099))))

(declare-fun b!926705 () Bool)

(declare-fun e!520195 () Bool)

(declare-fun e!520192 () Bool)

(assert (=> b!926705 (= e!520195 (and e!520192 mapRes!31419))))

(declare-fun condMapEmpty!31419 () Bool)

(declare-fun mapDefault!31419 () ValueCell!9406)

