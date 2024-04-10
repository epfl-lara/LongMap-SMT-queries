; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79424 () Bool)

(assert start!79424)

(declare-fun b_free!17611 () Bool)

(declare-fun b_next!17611 () Bool)

(assert (=> start!79424 (= b_free!17611 (not b_next!17611))))

(declare-fun tp!61276 () Bool)

(declare-fun b_and!28781 () Bool)

(assert (=> start!79424 (= tp!61276 b_and!28781)))

(declare-fun b!933511 () Bool)

(declare-fun res!628766 () Bool)

(declare-fun e!524179 () Bool)

(assert (=> b!933511 (=> (not res!628766) (not e!524179))))

(declare-datatypes ((array!56174 0))(
  ( (array!56175 (arr!27031 (Array (_ BitVec 32) (_ BitVec 64))) (size!27490 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56174)

(declare-datatypes ((List!19035 0))(
  ( (Nil!19032) (Cons!19031 (h!20177 (_ BitVec 64)) (t!27190 List!19035)) )
))
(declare-fun arrayNoDuplicates!0 (array!56174 (_ BitVec 32) List!19035) Bool)

(assert (=> b!933511 (= res!628766 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19032))))

(declare-fun mapIsEmpty!31938 () Bool)

(declare-fun mapRes!31938 () Bool)

(assert (=> mapIsEmpty!31938 mapRes!31938))

(declare-fun res!628768 () Bool)

(assert (=> start!79424 (=> (not res!628768) (not e!524179))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79424 (= res!628768 (validMask!0 mask!1881))))

(assert (=> start!79424 e!524179))

(assert (=> start!79424 true))

(declare-fun tp_is_empty!20119 () Bool)

(assert (=> start!79424 tp_is_empty!20119))

(declare-datatypes ((V!31791 0))(
  ( (V!31792 (val!10110 Int)) )
))
(declare-datatypes ((ValueCell!9578 0))(
  ( (ValueCellFull!9578 (v!12629 V!31791)) (EmptyCell!9578) )
))
(declare-datatypes ((array!56176 0))(
  ( (array!56177 (arr!27032 (Array (_ BitVec 32) ValueCell!9578)) (size!27491 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56176)

(declare-fun e!524182 () Bool)

(declare-fun array_inv!21042 (array!56176) Bool)

(assert (=> start!79424 (and (array_inv!21042 _values!1231) e!524182)))

(assert (=> start!79424 tp!61276))

(declare-fun array_inv!21043 (array!56174) Bool)

(assert (=> start!79424 (array_inv!21043 _keys!1487)))

(declare-fun b!933512 () Bool)

(declare-fun res!628773 () Bool)

(declare-fun e!524180 () Bool)

(assert (=> b!933512 (=> (not res!628773) (not e!524180))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933512 (= res!628773 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933513 () Bool)

(declare-fun res!628772 () Bool)

(assert (=> b!933513 (=> (not res!628772) (not e!524179))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!933513 (= res!628772 (and (= (size!27491 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27490 _keys!1487) (size!27491 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933514 () Bool)

(declare-fun res!628769 () Bool)

(assert (=> b!933514 (=> (not res!628769) (not e!524179))))

(assert (=> b!933514 (= res!628769 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27490 _keys!1487))))))

(declare-fun b!933515 () Bool)

(declare-fun res!628770 () Bool)

(assert (=> b!933515 (=> (not res!628770) (not e!524180))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31791)

(declare-datatypes ((tuple2!13252 0))(
  ( (tuple2!13253 (_1!6637 (_ BitVec 64)) (_2!6637 V!31791)) )
))
(declare-datatypes ((List!19036 0))(
  ( (Nil!19033) (Cons!19032 (h!20178 tuple2!13252) (t!27191 List!19036)) )
))
(declare-datatypes ((ListLongMap!11949 0))(
  ( (ListLongMap!11950 (toList!5990 List!19036)) )
))
(declare-fun lt!420438 () ListLongMap!11949)

(declare-fun apply!801 (ListLongMap!11949 (_ BitVec 64)) V!31791)

(assert (=> b!933515 (= res!628770 (= (apply!801 lt!420438 k!1099) v!791))))

(declare-fun b!933516 () Bool)

(declare-fun e!524181 () Bool)

(assert (=> b!933516 (= e!524181 tp_is_empty!20119)))

(declare-fun b!933517 () Bool)

(assert (=> b!933517 (= e!524179 e!524180)))

(declare-fun res!628767 () Bool)

(assert (=> b!933517 (=> (not res!628767) (not e!524180))))

(declare-fun contains!5039 (ListLongMap!11949 (_ BitVec 64)) Bool)

(assert (=> b!933517 (= res!628767 (contains!5039 lt!420438 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31791)

(declare-fun minValue!1173 () V!31791)

(declare-fun getCurrentListMap!3228 (array!56174 array!56176 (_ BitVec 32) (_ BitVec 32) V!31791 V!31791 (_ BitVec 32) Int) ListLongMap!11949)

(assert (=> b!933517 (= lt!420438 (getCurrentListMap!3228 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933518 () Bool)

(declare-fun res!628765 () Bool)

(assert (=> b!933518 (=> (not res!628765) (not e!524180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933518 (= res!628765 (validKeyInArray!0 k!1099))))

(declare-fun b!933519 () Bool)

(declare-fun res!628774 () Bool)

(assert (=> b!933519 (=> (not res!628774) (not e!524179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56174 (_ BitVec 32)) Bool)

(assert (=> b!933519 (= res!628774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933520 () Bool)

(declare-fun e!524178 () Bool)

(assert (=> b!933520 (= e!524180 e!524178)))

(declare-fun res!628771 () Bool)

(assert (=> b!933520 (=> (not res!628771) (not e!524178))))

(declare-fun lt!420440 () (_ BitVec 64))

(assert (=> b!933520 (= res!628771 (validKeyInArray!0 lt!420440))))

(assert (=> b!933520 (= lt!420440 (select (arr!27031 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!31938 () Bool)

(declare-fun tp!61277 () Bool)

(declare-fun e!524184 () Bool)

(assert (=> mapNonEmpty!31938 (= mapRes!31938 (and tp!61277 e!524184))))

(declare-fun mapRest!31938 () (Array (_ BitVec 32) ValueCell!9578))

(declare-fun mapKey!31938 () (_ BitVec 32))

(declare-fun mapValue!31938 () ValueCell!9578)

(assert (=> mapNonEmpty!31938 (= (arr!27032 _values!1231) (store mapRest!31938 mapKey!31938 mapValue!31938))))

(declare-fun b!933521 () Bool)

(assert (=> b!933521 (= e!524178 (not true))))

(assert (=> b!933521 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19032)))

(declare-datatypes ((Unit!31497 0))(
  ( (Unit!31498) )
))
(declare-fun lt!420443 () Unit!31497)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56174 (_ BitVec 32) (_ BitVec 32)) Unit!31497)

(assert (=> b!933521 (= lt!420443 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!420437 () tuple2!13252)

(declare-fun +!2791 (ListLongMap!11949 tuple2!13252) ListLongMap!11949)

(assert (=> b!933521 (contains!5039 (+!2791 lt!420438 lt!420437) k!1099)))

(declare-fun lt!420439 () V!31791)

(declare-fun lt!420442 () Unit!31497)

(declare-fun addStillContains!510 (ListLongMap!11949 (_ BitVec 64) V!31791 (_ BitVec 64)) Unit!31497)

(assert (=> b!933521 (= lt!420442 (addStillContains!510 lt!420438 lt!420440 lt!420439 k!1099))))

(assert (=> b!933521 (= (getCurrentListMap!3228 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2791 (getCurrentListMap!3228 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420437))))

(assert (=> b!933521 (= lt!420437 (tuple2!13253 lt!420440 lt!420439))))

(declare-fun get!14221 (ValueCell!9578 V!31791) V!31791)

(declare-fun dynLambda!1580 (Int (_ BitVec 64)) V!31791)

(assert (=> b!933521 (= lt!420439 (get!14221 (select (arr!27032 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1580 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420441 () Unit!31497)

(declare-fun lemmaListMapRecursiveValidKeyArray!181 (array!56174 array!56176 (_ BitVec 32) (_ BitVec 32) V!31791 V!31791 (_ BitVec 32) Int) Unit!31497)

(assert (=> b!933521 (= lt!420441 (lemmaListMapRecursiveValidKeyArray!181 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933522 () Bool)

(assert (=> b!933522 (= e!524182 (and e!524181 mapRes!31938))))

(declare-fun condMapEmpty!31938 () Bool)

(declare-fun mapDefault!31938 () ValueCell!9578)

