; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79538 () Bool)

(assert start!79538)

(declare-fun b_free!17659 () Bool)

(declare-fun b_next!17659 () Bool)

(assert (=> start!79538 (= b_free!17659 (not b_next!17659))))

(declare-fun tp!61426 () Bool)

(declare-fun b_and!28893 () Bool)

(assert (=> start!79538 (= tp!61426 b_and!28893)))

(declare-fun b!935002 () Bool)

(declare-fun res!629682 () Bool)

(declare-fun e!525009 () Bool)

(assert (=> b!935002 (=> (not res!629682) (not e!525009))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56274 0))(
  ( (array!56275 (arr!27079 (Array (_ BitVec 32) (_ BitVec 64))) (size!27538 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56274)

(assert (=> b!935002 (= res!629682 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27538 _keys!1487))))))

(declare-fun b!935003 () Bool)

(declare-fun res!629684 () Bool)

(declare-fun e!525003 () Bool)

(assert (=> b!935003 (=> (not res!629684) (not e!525003))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!935003 (= res!629684 (validKeyInArray!0 k!1099))))

(declare-fun b!935004 () Bool)

(declare-fun res!629680 () Bool)

(assert (=> b!935004 (=> (not res!629680) (not e!525003))))

(assert (=> b!935004 (= res!629680 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!935005 () Bool)

(declare-fun e!525004 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!935005 (= e!525004 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!935006 () Bool)

(declare-fun e!525006 () Bool)

(declare-fun e!525007 () Bool)

(assert (=> b!935006 (= e!525006 (not e!525007))))

(declare-fun res!629677 () Bool)

(assert (=> b!935006 (=> res!629677 e!525007)))

(assert (=> b!935006 (= res!629677 (or (bvsge (size!27538 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!27538 _keys!1487))))))

(assert (=> b!935006 e!525004))

(declare-fun c!97226 () Bool)

(assert (=> b!935006 (= c!97226 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!31855 0))(
  ( (V!31856 (val!10134 Int)) )
))
(declare-datatypes ((ValueCell!9602 0))(
  ( (ValueCellFull!9602 (v!12655 V!31855)) (EmptyCell!9602) )
))
(declare-datatypes ((array!56276 0))(
  ( (array!56277 (arr!27080 (Array (_ BitVec 32) ValueCell!9602)) (size!27539 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56276)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31855)

(declare-fun minValue!1173 () V!31855)

(declare-datatypes ((Unit!31543 0))(
  ( (Unit!31544) )
))
(declare-fun lt!421324 () Unit!31543)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!281 (array!56274 array!56276 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 64) (_ BitVec 32) Int) Unit!31543)

(assert (=> b!935006 (= lt!421324 (lemmaListMapContainsThenArrayContainsFrom!281 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!19078 0))(
  ( (Nil!19075) (Cons!19074 (h!20220 (_ BitVec 64)) (t!27281 List!19078)) )
))
(declare-fun arrayNoDuplicates!0 (array!56274 (_ BitVec 32) List!19078) Bool)

(assert (=> b!935006 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19075)))

(declare-fun lt!421323 () Unit!31543)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56274 (_ BitVec 32) (_ BitVec 32)) Unit!31543)

(assert (=> b!935006 (= lt!421323 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13298 0))(
  ( (tuple2!13299 (_1!6660 (_ BitVec 64)) (_2!6660 V!31855)) )
))
(declare-datatypes ((List!19079 0))(
  ( (Nil!19076) (Cons!19075 (h!20221 tuple2!13298) (t!27282 List!19079)) )
))
(declare-datatypes ((ListLongMap!11995 0))(
  ( (ListLongMap!11996 (toList!6013 List!19079)) )
))
(declare-fun lt!421325 () ListLongMap!11995)

(declare-fun lt!421327 () tuple2!13298)

(declare-fun contains!5065 (ListLongMap!11995 (_ BitVec 64)) Bool)

(declare-fun +!2809 (ListLongMap!11995 tuple2!13298) ListLongMap!11995)

(assert (=> b!935006 (contains!5065 (+!2809 lt!421325 lt!421327) k!1099)))

(declare-fun lt!421328 () Unit!31543)

(declare-fun lt!421329 () (_ BitVec 64))

(declare-fun lt!421326 () V!31855)

(declare-fun addStillContains!528 (ListLongMap!11995 (_ BitVec 64) V!31855 (_ BitVec 64)) Unit!31543)

(assert (=> b!935006 (= lt!421328 (addStillContains!528 lt!421325 lt!421329 lt!421326 k!1099))))

(declare-fun getCurrentListMap!3250 (array!56274 array!56276 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 32) Int) ListLongMap!11995)

(assert (=> b!935006 (= (getCurrentListMap!3250 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2809 (getCurrentListMap!3250 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!421327))))

(assert (=> b!935006 (= lt!421327 (tuple2!13299 lt!421329 lt!421326))))

(declare-fun get!14261 (ValueCell!9602 V!31855) V!31855)

(declare-fun dynLambda!1598 (Int (_ BitVec 64)) V!31855)

(assert (=> b!935006 (= lt!421326 (get!14261 (select (arr!27080 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1598 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!421330 () Unit!31543)

(declare-fun lemmaListMapRecursiveValidKeyArray!199 (array!56274 array!56276 (_ BitVec 32) (_ BitVec 32) V!31855 V!31855 (_ BitVec 32) Int) Unit!31543)

(assert (=> b!935006 (= lt!421330 (lemmaListMapRecursiveValidKeyArray!199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!935007 () Bool)

(declare-fun e!525012 () Bool)

(declare-fun tp_is_empty!20167 () Bool)

(assert (=> b!935007 (= e!525012 tp_is_empty!20167)))

(declare-fun mapNonEmpty!32016 () Bool)

(declare-fun mapRes!32016 () Bool)

(declare-fun tp!61427 () Bool)

(declare-fun e!525008 () Bool)

(assert (=> mapNonEmpty!32016 (= mapRes!32016 (and tp!61427 e!525008))))

(declare-fun mapKey!32016 () (_ BitVec 32))

(declare-fun mapValue!32016 () ValueCell!9602)

(declare-fun mapRest!32016 () (Array (_ BitVec 32) ValueCell!9602))

(assert (=> mapNonEmpty!32016 (= (arr!27080 _values!1231) (store mapRest!32016 mapKey!32016 mapValue!32016))))

(declare-fun b!935008 () Bool)

(declare-fun arrayContainsKey!0 (array!56274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!935008 (= e!525004 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun res!629674 () Bool)

(assert (=> start!79538 (=> (not res!629674) (not e!525009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79538 (= res!629674 (validMask!0 mask!1881))))

(assert (=> start!79538 e!525009))

(assert (=> start!79538 true))

(assert (=> start!79538 tp_is_empty!20167))

(declare-fun e!525005 () Bool)

(declare-fun array_inv!21074 (array!56276) Bool)

(assert (=> start!79538 (and (array_inv!21074 _values!1231) e!525005)))

(assert (=> start!79538 tp!61426))

(declare-fun array_inv!21075 (array!56274) Bool)

(assert (=> start!79538 (array_inv!21075 _keys!1487)))

(declare-fun b!935009 () Bool)

(assert (=> b!935009 (= e!525009 e!525003)))

(declare-fun res!629676 () Bool)

(assert (=> b!935009 (=> (not res!629676) (not e!525003))))

(assert (=> b!935009 (= res!629676 (contains!5065 lt!421325 k!1099))))

(assert (=> b!935009 (= lt!421325 (getCurrentListMap!3250 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!935010 () Bool)

(declare-fun res!629683 () Bool)

(assert (=> b!935010 (=> (not res!629683) (not e!525009))))

(assert (=> b!935010 (= res!629683 (and (= (size!27539 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27538 _keys!1487) (size!27539 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!935011 () Bool)

(declare-fun res!629686 () Bool)

(assert (=> b!935011 (=> (not res!629686) (not e!525003))))

(declare-fun v!791 () V!31855)

(declare-fun apply!816 (ListLongMap!11995 (_ BitVec 64)) V!31855)

(assert (=> b!935011 (= res!629686 (= (apply!816 lt!421325 k!1099) v!791))))

(declare-fun b!935012 () Bool)

(declare-fun e!525011 () Bool)

(assert (=> b!935012 (= e!525007 e!525011)))

(declare-fun res!629679 () Bool)

(assert (=> b!935012 (=> (not res!629679) (not e!525011))))

(declare-fun contains!5066 (List!19078 (_ BitVec 64)) Bool)

(assert (=> b!935012 (= res!629679 (not (contains!5066 Nil!19075 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!935013 () Bool)

(declare-fun res!629675 () Bool)

(assert (=> b!935013 (=> (not res!629675) (not e!525009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56274 (_ BitVec 32)) Bool)

(assert (=> b!935013 (= res!629675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!32016 () Bool)

(assert (=> mapIsEmpty!32016 mapRes!32016))

(declare-fun b!935014 () Bool)

(declare-fun res!629678 () Bool)

(assert (=> b!935014 (=> (not res!629678) (not e!525009))))

(assert (=> b!935014 (= res!629678 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19075))))

(declare-fun b!935015 () Bool)

(declare-fun res!629681 () Bool)

(assert (=> b!935015 (=> res!629681 e!525007)))

(declare-fun noDuplicate!1350 (List!19078) Bool)

(assert (=> b!935015 (= res!629681 (not (noDuplicate!1350 Nil!19075)))))

(declare-fun b!935016 () Bool)

(assert (=> b!935016 (= e!525008 tp_is_empty!20167)))

(declare-fun b!935017 () Bool)

(assert (=> b!935017 (= e!525003 e!525006)))

(declare-fun res!629685 () Bool)

(assert (=> b!935017 (=> (not res!629685) (not e!525006))))

(assert (=> b!935017 (= res!629685 (validKeyInArray!0 lt!421329))))

(assert (=> b!935017 (= lt!421329 (select (arr!27079 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!935018 () Bool)

(assert (=> b!935018 (= e!525011 (not (contains!5066 Nil!19075 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!935019 () Bool)

(assert (=> b!935019 (= e!525005 (and e!525012 mapRes!32016))))

(declare-fun condMapEmpty!32016 () Bool)

(declare-fun mapDefault!32016 () ValueCell!9602)

