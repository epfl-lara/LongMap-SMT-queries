; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79074 () Bool)

(assert start!79074)

(declare-fun b_free!17287 () Bool)

(declare-fun b_next!17287 () Bool)

(assert (=> start!79074 (= b_free!17287 (not b_next!17287))))

(declare-fun tp!60301 () Bool)

(declare-fun b_and!28311 () Bool)

(assert (=> start!79074 (= tp!60301 b_and!28311)))

(declare-fun b!927313 () Bool)

(declare-datatypes ((V!31359 0))(
  ( (V!31360 (val!9948 Int)) )
))
(declare-datatypes ((tuple2!12986 0))(
  ( (tuple2!12987 (_1!6504 (_ BitVec 64)) (_2!6504 V!31359)) )
))
(declare-datatypes ((List!18787 0))(
  ( (Nil!18784) (Cons!18783 (h!19929 tuple2!12986) (t!26804 List!18787)) )
))
(declare-datatypes ((ListLongMap!11683 0))(
  ( (ListLongMap!11684 (toList!5857 List!18787)) )
))
(declare-fun lt!417928 () ListLongMap!11683)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun lt!417915 () V!31359)

(declare-fun apply!687 (ListLongMap!11683 (_ BitVec 64)) V!31359)

(assert (=> b!927313 (= (apply!687 lt!417928 k!1099) lt!417915)))

(declare-datatypes ((Unit!31359 0))(
  ( (Unit!31360) )
))
(declare-fun lt!417924 () Unit!31359)

(declare-fun lt!417917 () (_ BitVec 64))

(declare-fun lt!417927 () V!31359)

(declare-fun lt!417920 () ListLongMap!11683)

(declare-fun addApplyDifferent!402 (ListLongMap!11683 (_ BitVec 64) V!31359 (_ BitVec 64)) Unit!31359)

(assert (=> b!927313 (= lt!417924 (addApplyDifferent!402 lt!417920 lt!417917 lt!417927 k!1099))))

(assert (=> b!927313 (not (= lt!417917 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417921 () Unit!31359)

(declare-datatypes ((array!55552 0))(
  ( (array!55553 (arr!26721 (Array (_ BitVec 32) (_ BitVec 64))) (size!27180 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55552)

(declare-datatypes ((List!18788 0))(
  ( (Nil!18785) (Cons!18784 (h!19930 (_ BitVec 64)) (t!26805 List!18788)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55552 (_ BitVec 64) (_ BitVec 32) List!18788) Unit!31359)

(assert (=> b!927313 (= lt!417921 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18785))))

(declare-fun e!520579 () Bool)

(assert (=> b!927313 e!520579))

(declare-fun c!96850 () Bool)

(assert (=> b!927313 (= c!96850 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9416 0))(
  ( (ValueCellFull!9416 (v!12466 V!31359)) (EmptyCell!9416) )
))
(declare-datatypes ((array!55554 0))(
  ( (array!55555 (arr!26722 (Array (_ BitVec 32) ValueCell!9416)) (size!27181 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55554)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!417919 () Unit!31359)

(declare-fun zeroValue!1173 () V!31359)

(declare-fun minValue!1173 () V!31359)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!253 (array!55552 array!55554 (_ BitVec 32) (_ BitVec 32) V!31359 V!31359 (_ BitVec 64) (_ BitVec 32) Int) Unit!31359)

(assert (=> b!927313 (= lt!417919 (lemmaListMapContainsThenArrayContainsFrom!253 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55552 (_ BitVec 32) List!18788) Bool)

(assert (=> b!927313 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18785)))

(declare-fun lt!417926 () Unit!31359)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55552 (_ BitVec 32) (_ BitVec 32)) Unit!31359)

(assert (=> b!927313 (= lt!417926 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4915 (ListLongMap!11683 (_ BitVec 64)) Bool)

(assert (=> b!927313 (contains!4915 lt!417928 k!1099)))

(declare-fun lt!417913 () tuple2!12986)

(declare-fun +!2746 (ListLongMap!11683 tuple2!12986) ListLongMap!11683)

(assert (=> b!927313 (= lt!417928 (+!2746 lt!417920 lt!417913))))

(declare-fun lt!417914 () Unit!31359)

(declare-fun addStillContains!470 (ListLongMap!11683 (_ BitVec 64) V!31359 (_ BitVec 64)) Unit!31359)

(assert (=> b!927313 (= lt!417914 (addStillContains!470 lt!417920 lt!417917 lt!417927 k!1099))))

(declare-fun getCurrentListMap!3106 (array!55552 array!55554 (_ BitVec 32) (_ BitVec 32) V!31359 V!31359 (_ BitVec 32) Int) ListLongMap!11683)

(assert (=> b!927313 (= (getCurrentListMap!3106 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2746 (getCurrentListMap!3106 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417913))))

(assert (=> b!927313 (= lt!417913 (tuple2!12987 lt!417917 lt!417927))))

(declare-fun get!14065 (ValueCell!9416 V!31359) V!31359)

(declare-fun dynLambda!1535 (Int (_ BitVec 64)) V!31359)

(assert (=> b!927313 (= lt!417927 (get!14065 (select (arr!26722 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1535 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417925 () Unit!31359)

(declare-fun lemmaListMapRecursiveValidKeyArray!136 (array!55552 array!55554 (_ BitVec 32) (_ BitVec 32) V!31359 V!31359 (_ BitVec 32) Int) Unit!31359)

(assert (=> b!927313 (= lt!417925 (lemmaListMapRecursiveValidKeyArray!136 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520591 () Unit!31359)

(assert (=> b!927313 (= e!520591 lt!417924)))

(declare-fun b!927314 () Bool)

(declare-fun res!624631 () Bool)

(declare-fun e!520586 () Bool)

(assert (=> b!927314 (=> (not res!624631) (not e!520586))))

(declare-fun v!791 () V!31359)

(declare-fun lt!417918 () ListLongMap!11683)

(assert (=> b!927314 (= res!624631 (= (apply!687 lt!417918 k!1099) v!791))))

(declare-fun b!927315 () Bool)

(declare-fun e!520585 () Bool)

(declare-fun tp_is_empty!19795 () Bool)

(assert (=> b!927315 (= e!520585 tp_is_empty!19795)))

(declare-fun b!927316 () Bool)

(declare-fun e!520582 () Unit!31359)

(declare-fun Unit!31361 () Unit!31359)

(assert (=> b!927316 (= e!520582 Unit!31361)))

(declare-fun mapIsEmpty!31449 () Bool)

(declare-fun mapRes!31449 () Bool)

(assert (=> mapIsEmpty!31449 mapRes!31449))

(declare-fun b!927317 () Bool)

(declare-fun res!624627 () Bool)

(declare-fun e!520580 () Bool)

(assert (=> b!927317 (=> (not res!624627) (not e!520580))))

(assert (=> b!927317 (= res!624627 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27180 _keys!1487))))))

(declare-fun b!927318 () Bool)

(declare-fun e!520584 () Bool)

(declare-fun e!520583 () Bool)

(assert (=> b!927318 (= e!520584 e!520583)))

(declare-fun res!624633 () Bool)

(assert (=> b!927318 (=> (not res!624633) (not e!520583))))

(assert (=> b!927318 (= res!624633 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27180 _keys!1487)))))

(declare-fun lt!417916 () Unit!31359)

(assert (=> b!927318 (= lt!417916 e!520582)))

(declare-fun c!96851 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927318 (= c!96851 (validKeyInArray!0 k!1099))))

(declare-fun b!927319 () Bool)

(declare-fun Unit!31362 () Unit!31359)

(assert (=> b!927319 (= e!520591 Unit!31362)))

(declare-fun b!927320 () Bool)

(declare-fun res!624625 () Bool)

(assert (=> b!927320 (=> (not res!624625) (not e!520580))))

(assert (=> b!927320 (= res!624625 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18785))))

(declare-fun b!927321 () Bool)

(declare-fun res!624634 () Bool)

(assert (=> b!927321 (=> (not res!624634) (not e!520580))))

(assert (=> b!927321 (= res!624634 (and (= (size!27181 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27180 _keys!1487) (size!27181 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927322 () Bool)

(declare-fun e!520590 () Bool)

(assert (=> b!927322 (= e!520590 tp_is_empty!19795)))

(declare-fun res!624626 () Bool)

(assert (=> start!79074 (=> (not res!624626) (not e!520580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79074 (= res!624626 (validMask!0 mask!1881))))

(assert (=> start!79074 e!520580))

(assert (=> start!79074 true))

(assert (=> start!79074 tp_is_empty!19795))

(declare-fun e!520588 () Bool)

(declare-fun array_inv!20808 (array!55554) Bool)

(assert (=> start!79074 (and (array_inv!20808 _values!1231) e!520588)))

(assert (=> start!79074 tp!60301))

(declare-fun array_inv!20809 (array!55552) Bool)

(assert (=> start!79074 (array_inv!20809 _keys!1487)))

(declare-fun b!927323 () Bool)

(declare-fun arrayContainsKey!0 (array!55552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927323 (= e!520579 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!927324 () Bool)

(assert (=> b!927324 (= e!520582 e!520591)))

(assert (=> b!927324 (= lt!417917 (select (arr!26721 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96852 () Bool)

(assert (=> b!927324 (= c!96852 (validKeyInArray!0 lt!417917))))

(declare-fun b!927325 () Bool)

(assert (=> b!927325 (= e!520588 (and e!520590 mapRes!31449))))

(declare-fun condMapEmpty!31449 () Bool)

(declare-fun mapDefault!31449 () ValueCell!9416)

