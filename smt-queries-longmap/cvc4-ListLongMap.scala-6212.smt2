; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79410 () Bool)

(assert start!79410)

(declare-fun b_free!17597 () Bool)

(declare-fun b_next!17597 () Bool)

(assert (=> start!79410 (= b_free!17597 (not b_next!17597))))

(declare-fun tp!61234 () Bool)

(declare-fun b_and!28753 () Bool)

(assert (=> start!79410 (= tp!61234 b_and!28753)))

(declare-fun b!933224 () Bool)

(declare-fun e!524031 () Bool)

(declare-fun tp_is_empty!20105 () Bool)

(assert (=> b!933224 (= e!524031 tp_is_empty!20105)))

(declare-fun b!933225 () Bool)

(declare-fun e!524032 () Bool)

(assert (=> b!933225 (= e!524032 tp_is_empty!20105)))

(declare-fun b!933226 () Bool)

(declare-fun res!628555 () Bool)

(declare-fun e!524033 () Bool)

(assert (=> b!933226 (=> (not res!628555) (not e!524033))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31771 0))(
  ( (V!31772 (val!10103 Int)) )
))
(declare-datatypes ((ValueCell!9571 0))(
  ( (ValueCellFull!9571 (v!12622 V!31771)) (EmptyCell!9571) )
))
(declare-datatypes ((array!56146 0))(
  ( (array!56147 (arr!27017 (Array (_ BitVec 32) ValueCell!9571)) (size!27476 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56146)

(declare-datatypes ((array!56148 0))(
  ( (array!56149 (arr!27018 (Array (_ BitVec 32) (_ BitVec 64))) (size!27477 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56148)

(assert (=> b!933226 (= res!628555 (and (= (size!27476 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27477 _keys!1487) (size!27476 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933227 () Bool)

(declare-fun res!628562 () Bool)

(assert (=> b!933227 (=> (not res!628562) (not e!524033))))

(declare-datatypes ((List!19025 0))(
  ( (Nil!19022) (Cons!19021 (h!20167 (_ BitVec 64)) (t!27166 List!19025)) )
))
(declare-fun arrayNoDuplicates!0 (array!56148 (_ BitVec 32) List!19025) Bool)

(assert (=> b!933227 (= res!628562 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19022))))

(declare-fun b!933228 () Bool)

(declare-fun e!524034 () Bool)

(declare-fun e!524036 () Bool)

(assert (=> b!933228 (= e!524034 e!524036)))

(declare-fun res!628563 () Bool)

(assert (=> b!933228 (=> (not res!628563) (not e!524036))))

(declare-fun lt!420294 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933228 (= res!628563 (validKeyInArray!0 lt!420294))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933228 (= lt!420294 (select (arr!27018 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933229 () Bool)

(assert (=> b!933229 (= e!524036 (not true))))

(assert (=> b!933229 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19022)))

(declare-datatypes ((Unit!31491 0))(
  ( (Unit!31492) )
))
(declare-fun lt!420293 () Unit!31491)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56148 (_ BitVec 32) (_ BitVec 32)) Unit!31491)

(assert (=> b!933229 (= lt!420293 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13244 0))(
  ( (tuple2!13245 (_1!6633 (_ BitVec 64)) (_2!6633 V!31771)) )
))
(declare-datatypes ((List!19026 0))(
  ( (Nil!19023) (Cons!19022 (h!20168 tuple2!13244) (t!27167 List!19026)) )
))
(declare-datatypes ((ListLongMap!11941 0))(
  ( (ListLongMap!11942 (toList!5986 List!19026)) )
))
(declare-fun lt!420295 () ListLongMap!11941)

(declare-fun lt!420291 () tuple2!13244)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5035 (ListLongMap!11941 (_ BitVec 64)) Bool)

(declare-fun +!2788 (ListLongMap!11941 tuple2!13244) ListLongMap!11941)

(assert (=> b!933229 (contains!5035 (+!2788 lt!420295 lt!420291) k!1099)))

(declare-fun lt!420292 () V!31771)

(declare-fun lt!420296 () Unit!31491)

(declare-fun addStillContains!507 (ListLongMap!11941 (_ BitVec 64) V!31771 (_ BitVec 64)) Unit!31491)

(assert (=> b!933229 (= lt!420296 (addStillContains!507 lt!420295 lt!420294 lt!420292 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31771)

(declare-fun minValue!1173 () V!31771)

(declare-fun getCurrentListMap!3224 (array!56148 array!56146 (_ BitVec 32) (_ BitVec 32) V!31771 V!31771 (_ BitVec 32) Int) ListLongMap!11941)

(assert (=> b!933229 (= (getCurrentListMap!3224 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2788 (getCurrentListMap!3224 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420291))))

(assert (=> b!933229 (= lt!420291 (tuple2!13245 lt!420294 lt!420292))))

(declare-fun get!14212 (ValueCell!9571 V!31771) V!31771)

(declare-fun dynLambda!1577 (Int (_ BitVec 64)) V!31771)

(assert (=> b!933229 (= lt!420292 (get!14212 (select (arr!27017 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1577 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420290 () Unit!31491)

(declare-fun lemmaListMapRecursiveValidKeyArray!178 (array!56148 array!56146 (_ BitVec 32) (_ BitVec 32) V!31771 V!31771 (_ BitVec 32) Int) Unit!31491)

(assert (=> b!933229 (= lt!420290 (lemmaListMapRecursiveValidKeyArray!178 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933230 () Bool)

(declare-fun res!628564 () Bool)

(assert (=> b!933230 (=> (not res!628564) (not e!524034))))

(assert (=> b!933230 (= res!628564 (validKeyInArray!0 k!1099))))

(declare-fun b!933231 () Bool)

(declare-fun e!524035 () Bool)

(declare-fun mapRes!31917 () Bool)

(assert (=> b!933231 (= e!524035 (and e!524031 mapRes!31917))))

(declare-fun condMapEmpty!31917 () Bool)

(declare-fun mapDefault!31917 () ValueCell!9571)

