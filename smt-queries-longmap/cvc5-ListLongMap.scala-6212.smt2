; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79406 () Bool)

(assert start!79406)

(declare-fun b_free!17593 () Bool)

(declare-fun b_next!17593 () Bool)

(assert (=> start!79406 (= b_free!17593 (not b_next!17593))))

(declare-fun tp!61223 () Bool)

(declare-fun b_and!28745 () Bool)

(assert (=> start!79406 (= tp!61223 b_and!28745)))

(declare-fun b!933142 () Bool)

(declare-fun e!523994 () Bool)

(assert (=> b!933142 (= e!523994 (not true))))

(declare-datatypes ((array!56138 0))(
  ( (array!56139 (arr!27013 (Array (_ BitVec 32) (_ BitVec 64))) (size!27472 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56138)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!19021 0))(
  ( (Nil!19018) (Cons!19017 (h!20163 (_ BitVec 64)) (t!27158 List!19021)) )
))
(declare-fun arrayNoDuplicates!0 (array!56138 (_ BitVec 32) List!19021) Bool)

(assert (=> b!933142 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19018)))

(declare-datatypes ((Unit!31487 0))(
  ( (Unit!31488) )
))
(declare-fun lt!420251 () Unit!31487)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56138 (_ BitVec 32) (_ BitVec 32)) Unit!31487)

(assert (=> b!933142 (= lt!420251 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31767 0))(
  ( (V!31768 (val!10101 Int)) )
))
(declare-datatypes ((tuple2!13240 0))(
  ( (tuple2!13241 (_1!6631 (_ BitVec 64)) (_2!6631 V!31767)) )
))
(declare-datatypes ((List!19022 0))(
  ( (Nil!19019) (Cons!19018 (h!20164 tuple2!13240) (t!27159 List!19022)) )
))
(declare-datatypes ((ListLongMap!11937 0))(
  ( (ListLongMap!11938 (toList!5984 List!19022)) )
))
(declare-fun lt!420253 () ListLongMap!11937)

(declare-fun lt!420250 () tuple2!13240)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5033 (ListLongMap!11937 (_ BitVec 64)) Bool)

(declare-fun +!2786 (ListLongMap!11937 tuple2!13240) ListLongMap!11937)

(assert (=> b!933142 (contains!5033 (+!2786 lt!420253 lt!420250) k!1099)))

(declare-fun lt!420252 () (_ BitVec 64))

(declare-fun lt!420254 () V!31767)

(declare-fun lt!420249 () Unit!31487)

(declare-fun addStillContains!505 (ListLongMap!11937 (_ BitVec 64) V!31767 (_ BitVec 64)) Unit!31487)

(assert (=> b!933142 (= lt!420249 (addStillContains!505 lt!420253 lt!420252 lt!420254 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9569 0))(
  ( (ValueCellFull!9569 (v!12620 V!31767)) (EmptyCell!9569) )
))
(declare-datatypes ((array!56140 0))(
  ( (array!56141 (arr!27014 (Array (_ BitVec 32) ValueCell!9569)) (size!27473 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56140)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31767)

(declare-fun minValue!1173 () V!31767)

(declare-fun getCurrentListMap!3222 (array!56138 array!56140 (_ BitVec 32) (_ BitVec 32) V!31767 V!31767 (_ BitVec 32) Int) ListLongMap!11937)

(assert (=> b!933142 (= (getCurrentListMap!3222 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2786 (getCurrentListMap!3222 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420250))))

(assert (=> b!933142 (= lt!420250 (tuple2!13241 lt!420252 lt!420254))))

(declare-fun get!14210 (ValueCell!9569 V!31767) V!31767)

(declare-fun dynLambda!1575 (Int (_ BitVec 64)) V!31767)

(assert (=> b!933142 (= lt!420254 (get!14210 (select (arr!27014 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1575 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420248 () Unit!31487)

(declare-fun lemmaListMapRecursiveValidKeyArray!176 (array!56138 array!56140 (_ BitVec 32) (_ BitVec 32) V!31767 V!31767 (_ BitVec 32) Int) Unit!31487)

(assert (=> b!933142 (= lt!420248 (lemmaListMapRecursiveValidKeyArray!176 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933143 () Bool)

(declare-fun res!628503 () Bool)

(declare-fun e!523995 () Bool)

(assert (=> b!933143 (=> (not res!628503) (not e!523995))))

(declare-fun v!791 () V!31767)

(declare-fun apply!797 (ListLongMap!11937 (_ BitVec 64)) V!31767)

(assert (=> b!933143 (= res!628503 (= (apply!797 lt!420253 k!1099) v!791))))

(declare-fun b!933144 () Bool)

(declare-fun e!523992 () Bool)

(assert (=> b!933144 (= e!523992 e!523995)))

(declare-fun res!628501 () Bool)

(assert (=> b!933144 (=> (not res!628501) (not e!523995))))

(assert (=> b!933144 (= res!628501 (contains!5033 lt!420253 k!1099))))

(assert (=> b!933144 (= lt!420253 (getCurrentListMap!3222 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933145 () Bool)

(declare-fun e!523989 () Bool)

(declare-fun tp_is_empty!20101 () Bool)

(assert (=> b!933145 (= e!523989 tp_is_empty!20101)))

(declare-fun mapIsEmpty!31911 () Bool)

(declare-fun mapRes!31911 () Bool)

(assert (=> mapIsEmpty!31911 mapRes!31911))

(declare-fun b!933146 () Bool)

(declare-fun res!628498 () Bool)

(assert (=> b!933146 (=> (not res!628498) (not e!523995))))

(assert (=> b!933146 (= res!628498 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31911 () Bool)

(declare-fun tp!61222 () Bool)

(declare-fun e!523990 () Bool)

(assert (=> mapNonEmpty!31911 (= mapRes!31911 (and tp!61222 e!523990))))

(declare-fun mapValue!31911 () ValueCell!9569)

(declare-fun mapRest!31911 () (Array (_ BitVec 32) ValueCell!9569))

(declare-fun mapKey!31911 () (_ BitVec 32))

(assert (=> mapNonEmpty!31911 (= (arr!27014 _values!1231) (store mapRest!31911 mapKey!31911 mapValue!31911))))

(declare-fun b!933147 () Bool)

(declare-fun res!628495 () Bool)

(assert (=> b!933147 (=> (not res!628495) (not e!523992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56138 (_ BitVec 32)) Bool)

(assert (=> b!933147 (= res!628495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933148 () Bool)

(assert (=> b!933148 (= e!523995 e!523994)))

(declare-fun res!628496 () Bool)

(assert (=> b!933148 (=> (not res!628496) (not e!523994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933148 (= res!628496 (validKeyInArray!0 lt!420252))))

(assert (=> b!933148 (= lt!420252 (select (arr!27013 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933149 () Bool)

(assert (=> b!933149 (= e!523990 tp_is_empty!20101)))

(declare-fun b!933150 () Bool)

(declare-fun res!628497 () Bool)

(assert (=> b!933150 (=> (not res!628497) (not e!523992))))

(assert (=> b!933150 (= res!628497 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27472 _keys!1487))))))

(declare-fun b!933151 () Bool)

(declare-fun res!628500 () Bool)

(assert (=> b!933151 (=> (not res!628500) (not e!523992))))

(assert (=> b!933151 (= res!628500 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19018))))

(declare-fun res!628499 () Bool)

(assert (=> start!79406 (=> (not res!628499) (not e!523992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79406 (= res!628499 (validMask!0 mask!1881))))

(assert (=> start!79406 e!523992))

(assert (=> start!79406 true))

(assert (=> start!79406 tp_is_empty!20101))

(declare-fun e!523993 () Bool)

(declare-fun array_inv!21026 (array!56140) Bool)

(assert (=> start!79406 (and (array_inv!21026 _values!1231) e!523993)))

(assert (=> start!79406 tp!61223))

(declare-fun array_inv!21027 (array!56138) Bool)

(assert (=> start!79406 (array_inv!21027 _keys!1487)))

(declare-fun b!933152 () Bool)

(declare-fun res!628504 () Bool)

(assert (=> b!933152 (=> (not res!628504) (not e!523992))))

(assert (=> b!933152 (= res!628504 (and (= (size!27473 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27472 _keys!1487) (size!27473 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933153 () Bool)

(declare-fun res!628502 () Bool)

(assert (=> b!933153 (=> (not res!628502) (not e!523995))))

(assert (=> b!933153 (= res!628502 (validKeyInArray!0 k!1099))))

(declare-fun b!933154 () Bool)

(assert (=> b!933154 (= e!523993 (and e!523989 mapRes!31911))))

(declare-fun condMapEmpty!31911 () Bool)

(declare-fun mapDefault!31911 () ValueCell!9569)

