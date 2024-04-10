; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79066 () Bool)

(assert start!79066)

(declare-fun b_free!17279 () Bool)

(declare-fun b_next!17279 () Bool)

(assert (=> start!79066 (= b_free!17279 (not b_next!17279))))

(declare-fun tp!60278 () Bool)

(declare-fun b_and!28295 () Bool)

(assert (=> start!79066 (= tp!60278 b_and!28295)))

(declare-fun b!927065 () Bool)

(declare-fun e!520433 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!927065 (= e!520433 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!31437 () Bool)

(declare-fun mapRes!31437 () Bool)

(assert (=> mapIsEmpty!31437 mapRes!31437))

(declare-fun mapNonEmpty!31437 () Bool)

(declare-fun tp!60277 () Bool)

(declare-fun e!520435 () Bool)

(assert (=> mapNonEmpty!31437 (= mapRes!31437 (and tp!60277 e!520435))))

(declare-datatypes ((V!31347 0))(
  ( (V!31348 (val!9944 Int)) )
))
(declare-datatypes ((ValueCell!9412 0))(
  ( (ValueCellFull!9412 (v!12462 V!31347)) (EmptyCell!9412) )
))
(declare-fun mapRest!31437 () (Array (_ BitVec 32) ValueCell!9412))

(declare-fun mapKey!31437 () (_ BitVec 32))

(declare-fun mapValue!31437 () ValueCell!9412)

(declare-datatypes ((array!55536 0))(
  ( (array!55537 (arr!26713 (Array (_ BitVec 32) ValueCell!9412)) (size!27172 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55536)

(assert (=> mapNonEmpty!31437 (= (arr!26713 _values!1231) (store mapRest!31437 mapKey!31437 mapValue!31437))))

(declare-fun b!927066 () Bool)

(declare-fun e!520428 () Bool)

(declare-fun e!520429 () Bool)

(assert (=> b!927066 (= e!520428 e!520429)))

(declare-fun res!624500 () Bool)

(assert (=> b!927066 (=> (not res!624500) (not e!520429))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31347)

(declare-fun lt!417727 () V!31347)

(assert (=> b!927066 (= res!624500 (and (= lt!417727 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12978 0))(
  ( (tuple2!12979 (_1!6500 (_ BitVec 64)) (_2!6500 V!31347)) )
))
(declare-datatypes ((List!18779 0))(
  ( (Nil!18776) (Cons!18775 (h!19921 tuple2!12978) (t!26788 List!18779)) )
))
(declare-datatypes ((ListLongMap!11675 0))(
  ( (ListLongMap!11676 (toList!5853 List!18779)) )
))
(declare-fun lt!417732 () ListLongMap!11675)

(declare-fun apply!683 (ListLongMap!11675 (_ BitVec 64)) V!31347)

(assert (=> b!927066 (= lt!417727 (apply!683 lt!417732 k!1099))))

(declare-fun b!927067 () Bool)

(declare-datatypes ((array!55538 0))(
  ( (array!55539 (arr!26714 (Array (_ BitVec 32) (_ BitVec 64))) (size!27173 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55538)

(declare-fun arrayContainsKey!0 (array!55538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927067 (= e!520433 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!927068 () Bool)

(declare-fun lt!417722 () ListLongMap!11675)

(assert (=> b!927068 (= (apply!683 lt!417722 k!1099) lt!417727)))

(declare-datatypes ((Unit!31348 0))(
  ( (Unit!31349) )
))
(declare-fun lt!417723 () Unit!31348)

(declare-fun lt!417730 () V!31347)

(declare-fun lt!417734 () (_ BitVec 64))

(declare-fun addApplyDifferent!400 (ListLongMap!11675 (_ BitVec 64) V!31347 (_ BitVec 64)) Unit!31348)

(assert (=> b!927068 (= lt!417723 (addApplyDifferent!400 lt!417732 lt!417734 lt!417730 k!1099))))

(assert (=> b!927068 (not (= lt!417734 k!1099))))

(declare-fun lt!417731 () Unit!31348)

(declare-datatypes ((List!18780 0))(
  ( (Nil!18777) (Cons!18776 (h!19922 (_ BitVec 64)) (t!26789 List!18780)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55538 (_ BitVec 64) (_ BitVec 32) List!18780) Unit!31348)

(assert (=> b!927068 (= lt!417731 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18777))))

(assert (=> b!927068 e!520433))

(declare-fun c!96815 () Bool)

(assert (=> b!927068 (= c!96815 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!417724 () Unit!31348)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31347)

(declare-fun minValue!1173 () V!31347)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!251 (array!55538 array!55536 (_ BitVec 32) (_ BitVec 32) V!31347 V!31347 (_ BitVec 64) (_ BitVec 32) Int) Unit!31348)

(assert (=> b!927068 (= lt!417724 (lemmaListMapContainsThenArrayContainsFrom!251 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55538 (_ BitVec 32) List!18780) Bool)

(assert (=> b!927068 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18777)))

(declare-fun lt!417735 () Unit!31348)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55538 (_ BitVec 32) (_ BitVec 32)) Unit!31348)

(assert (=> b!927068 (= lt!417735 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4912 (ListLongMap!11675 (_ BitVec 64)) Bool)

(assert (=> b!927068 (contains!4912 lt!417722 k!1099)))

(declare-fun lt!417725 () tuple2!12978)

(declare-fun +!2744 (ListLongMap!11675 tuple2!12978) ListLongMap!11675)

(assert (=> b!927068 (= lt!417722 (+!2744 lt!417732 lt!417725))))

(declare-fun lt!417726 () Unit!31348)

(declare-fun addStillContains!468 (ListLongMap!11675 (_ BitVec 64) V!31347 (_ BitVec 64)) Unit!31348)

(assert (=> b!927068 (= lt!417726 (addStillContains!468 lt!417732 lt!417734 lt!417730 k!1099))))

(declare-fun getCurrentListMap!3103 (array!55538 array!55536 (_ BitVec 32) (_ BitVec 32) V!31347 V!31347 (_ BitVec 32) Int) ListLongMap!11675)

(assert (=> b!927068 (= (getCurrentListMap!3103 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2744 (getCurrentListMap!3103 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417725))))

(assert (=> b!927068 (= lt!417725 (tuple2!12979 lt!417734 lt!417730))))

(declare-fun get!14059 (ValueCell!9412 V!31347) V!31347)

(declare-fun dynLambda!1533 (Int (_ BitVec 64)) V!31347)

(assert (=> b!927068 (= lt!417730 (get!14059 (select (arr!26713 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1533 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417736 () Unit!31348)

(declare-fun lemmaListMapRecursiveValidKeyArray!134 (array!55538 array!55536 (_ BitVec 32) (_ BitVec 32) V!31347 V!31347 (_ BitVec 32) Int) Unit!31348)

(assert (=> b!927068 (= lt!417736 (lemmaListMapRecursiveValidKeyArray!134 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520423 () Unit!31348)

(assert (=> b!927068 (= e!520423 lt!417723)))

(declare-fun res!624496 () Bool)

(declare-fun e!520426 () Bool)

(assert (=> start!79066 (=> (not res!624496) (not e!520426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79066 (= res!624496 (validMask!0 mask!1881))))

(assert (=> start!79066 e!520426))

(assert (=> start!79066 true))

(declare-fun tp_is_empty!19787 () Bool)

(assert (=> start!79066 tp_is_empty!19787))

(declare-fun e!520430 () Bool)

(declare-fun array_inv!20802 (array!55536) Bool)

(assert (=> start!79066 (and (array_inv!20802 _values!1231) e!520430)))

(assert (=> start!79066 tp!60278))

(declare-fun array_inv!20803 (array!55538) Bool)

(assert (=> start!79066 (array_inv!20803 _keys!1487)))

(declare-fun b!927069 () Bool)

(declare-fun res!624497 () Bool)

(assert (=> b!927069 (=> (not res!624497) (not e!520426))))

(assert (=> b!927069 (= res!624497 (and (= (size!27172 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27173 _keys!1487) (size!27172 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927070 () Bool)

(assert (=> b!927070 (= e!520435 tp_is_empty!19787)))

(declare-fun b!927071 () Bool)

(declare-fun e!520434 () Bool)

(declare-fun e!520425 () Bool)

(assert (=> b!927071 (= e!520434 e!520425)))

(declare-fun res!624502 () Bool)

(assert (=> b!927071 (=> (not res!624502) (not e!520425))))

(declare-fun lt!417728 () ListLongMap!11675)

(assert (=> b!927071 (= res!624502 (contains!4912 lt!417728 k!1099))))

(assert (=> b!927071 (= lt!417728 (getCurrentListMap!3103 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927072 () Bool)

(declare-fun e!520432 () Bool)

(assert (=> b!927072 (= e!520432 tp_is_empty!19787)))

(declare-fun b!927073 () Bool)

(declare-fun e!520427 () Unit!31348)

(assert (=> b!927073 (= e!520427 e!520423)))

(assert (=> b!927073 (= lt!417734 (select (arr!26714 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96814 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927073 (= c!96814 (validKeyInArray!0 lt!417734))))

(declare-fun b!927074 () Bool)

(declare-fun res!624495 () Bool)

(assert (=> b!927074 (=> (not res!624495) (not e!520425))))

(assert (=> b!927074 (= res!624495 (= (apply!683 lt!417728 k!1099) v!791))))

(declare-fun b!927075 () Bool)

(declare-fun res!624499 () Bool)

(assert (=> b!927075 (=> (not res!624499) (not e!520426))))

(assert (=> b!927075 (= res!624499 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18777))))

(declare-fun b!927076 () Bool)

(declare-fun Unit!31350 () Unit!31348)

(assert (=> b!927076 (= e!520423 Unit!31350)))

(declare-fun b!927077 () Bool)

(declare-fun res!624492 () Bool)

(assert (=> b!927077 (=> (not res!624492) (not e!520426))))

(assert (=> b!927077 (= res!624492 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27173 _keys!1487))))))

(declare-fun b!927078 () Bool)

(assert (=> b!927078 (= e!520429 e!520434)))

(declare-fun res!624494 () Bool)

(assert (=> b!927078 (=> (not res!624494) (not e!520434))))

(assert (=> b!927078 (= res!624494 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27173 _keys!1487)))))

(declare-fun lt!417721 () Unit!31348)

(assert (=> b!927078 (= lt!417721 e!520427)))

(declare-fun c!96816 () Bool)

(assert (=> b!927078 (= c!96816 (validKeyInArray!0 k!1099))))

(declare-fun lt!417733 () ListLongMap!11675)

(declare-fun e!520424 () Bool)

(declare-fun b!927079 () Bool)

(assert (=> b!927079 (= e!520424 (= (apply!683 lt!417733 k!1099) v!791))))

(declare-fun b!927080 () Bool)

(assert (=> b!927080 (= e!520426 e!520428)))

(declare-fun res!624498 () Bool)

(assert (=> b!927080 (=> (not res!624498) (not e!520428))))

(assert (=> b!927080 (= res!624498 (contains!4912 lt!417732 k!1099))))

(assert (=> b!927080 (= lt!417732 (getCurrentListMap!3103 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927081 () Bool)

(assert (=> b!927081 (= e!520430 (and e!520432 mapRes!31437))))

(declare-fun condMapEmpty!31437 () Bool)

(declare-fun mapDefault!31437 () ValueCell!9412)

