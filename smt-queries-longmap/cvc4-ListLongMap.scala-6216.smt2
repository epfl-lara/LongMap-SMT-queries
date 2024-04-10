; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79434 () Bool)

(assert start!79434)

(declare-fun b_free!17621 () Bool)

(declare-fun b_next!17621 () Bool)

(assert (=> start!79434 (= b_free!17621 (not b_next!17621))))

(declare-fun tp!61306 () Bool)

(declare-fun b_and!28801 () Bool)

(assert (=> start!79434 (= tp!61306 b_and!28801)))

(declare-fun b!933716 () Bool)

(declare-fun res!628923 () Bool)

(declare-fun e!524283 () Bool)

(assert (=> b!933716 (=> (not res!628923) (not e!524283))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56194 0))(
  ( (array!56195 (arr!27041 (Array (_ BitVec 32) (_ BitVec 64))) (size!27500 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56194)

(assert (=> b!933716 (= res!628923 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27500 _keys!1487))))))

(declare-fun b!933717 () Bool)

(declare-fun res!628921 () Bool)

(assert (=> b!933717 (=> (not res!628921) (not e!524283))))

(declare-datatypes ((List!19043 0))(
  ( (Nil!19040) (Cons!19039 (h!20185 (_ BitVec 64)) (t!27208 List!19043)) )
))
(declare-fun arrayNoDuplicates!0 (array!56194 (_ BitVec 32) List!19043) Bool)

(assert (=> b!933717 (= res!628921 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19040))))

(declare-fun mapIsEmpty!31953 () Bool)

(declare-fun mapRes!31953 () Bool)

(assert (=> mapIsEmpty!31953 mapRes!31953))

(declare-fun b!933718 () Bool)

(declare-fun res!628916 () Bool)

(declare-fun e!524285 () Bool)

(assert (=> b!933718 (=> (not res!628916) (not e!524285))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933718 (= res!628916 (validKeyInArray!0 k!1099))))

(declare-fun b!933719 () Bool)

(declare-fun res!628918 () Bool)

(assert (=> b!933719 (=> (not res!628918) (not e!524285))))

(assert (=> b!933719 (= res!628918 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!933720 () Bool)

(declare-fun e!524284 () Bool)

(declare-fun tp_is_empty!20129 () Bool)

(assert (=> b!933720 (= e!524284 tp_is_empty!20129)))

(declare-fun b!933721 () Bool)

(declare-fun e!524289 () Bool)

(assert (=> b!933721 (= e!524289 (not true))))

(assert (=> b!933721 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19040)))

(declare-datatypes ((Unit!31505 0))(
  ( (Unit!31506) )
))
(declare-fun lt!420546 () Unit!31505)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56194 (_ BitVec 32) (_ BitVec 32)) Unit!31505)

(assert (=> b!933721 (= lt!420546 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31803 0))(
  ( (V!31804 (val!10115 Int)) )
))
(declare-datatypes ((tuple2!13260 0))(
  ( (tuple2!13261 (_1!6641 (_ BitVec 64)) (_2!6641 V!31803)) )
))
(declare-datatypes ((List!19044 0))(
  ( (Nil!19041) (Cons!19040 (h!20186 tuple2!13260) (t!27209 List!19044)) )
))
(declare-datatypes ((ListLongMap!11957 0))(
  ( (ListLongMap!11958 (toList!5994 List!19044)) )
))
(declare-fun lt!420543 () ListLongMap!11957)

(declare-fun lt!420544 () tuple2!13260)

(declare-fun contains!5043 (ListLongMap!11957 (_ BitVec 64)) Bool)

(declare-fun +!2795 (ListLongMap!11957 tuple2!13260) ListLongMap!11957)

(assert (=> b!933721 (contains!5043 (+!2795 lt!420543 lt!420544) k!1099)))

(declare-fun lt!420545 () (_ BitVec 64))

(declare-fun lt!420542 () Unit!31505)

(declare-fun lt!420547 () V!31803)

(declare-fun addStillContains!514 (ListLongMap!11957 (_ BitVec 64) V!31803 (_ BitVec 64)) Unit!31505)

(assert (=> b!933721 (= lt!420542 (addStillContains!514 lt!420543 lt!420545 lt!420547 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9583 0))(
  ( (ValueCellFull!9583 (v!12634 V!31803)) (EmptyCell!9583) )
))
(declare-datatypes ((array!56196 0))(
  ( (array!56197 (arr!27042 (Array (_ BitVec 32) ValueCell!9583)) (size!27501 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56196)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31803)

(declare-fun minValue!1173 () V!31803)

(declare-fun getCurrentListMap!3232 (array!56194 array!56196 (_ BitVec 32) (_ BitVec 32) V!31803 V!31803 (_ BitVec 32) Int) ListLongMap!11957)

(assert (=> b!933721 (= (getCurrentListMap!3232 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2795 (getCurrentListMap!3232 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420544))))

(assert (=> b!933721 (= lt!420544 (tuple2!13261 lt!420545 lt!420547))))

(declare-fun get!14227 (ValueCell!9583 V!31803) V!31803)

(declare-fun dynLambda!1584 (Int (_ BitVec 64)) V!31803)

(assert (=> b!933721 (= lt!420547 (get!14227 (select (arr!27042 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1584 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420548 () Unit!31505)

(declare-fun lemmaListMapRecursiveValidKeyArray!185 (array!56194 array!56196 (_ BitVec 32) (_ BitVec 32) V!31803 V!31803 (_ BitVec 32) Int) Unit!31505)

(assert (=> b!933721 (= lt!420548 (lemmaListMapRecursiveValidKeyArray!185 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933722 () Bool)

(assert (=> b!933722 (= e!524285 e!524289)))

(declare-fun res!628920 () Bool)

(assert (=> b!933722 (=> (not res!628920) (not e!524289))))

(assert (=> b!933722 (= res!628920 (validKeyInArray!0 lt!420545))))

(assert (=> b!933722 (= lt!420545 (select (arr!27041 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933723 () Bool)

(declare-fun e!524286 () Bool)

(assert (=> b!933723 (= e!524286 tp_is_empty!20129)))

(declare-fun b!933725 () Bool)

(declare-fun res!628917 () Bool)

(assert (=> b!933725 (=> (not res!628917) (not e!524283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56194 (_ BitVec 32)) Bool)

(assert (=> b!933725 (= res!628917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933726 () Bool)

(declare-fun e!524287 () Bool)

(assert (=> b!933726 (= e!524287 (and e!524284 mapRes!31953))))

(declare-fun condMapEmpty!31953 () Bool)

(declare-fun mapDefault!31953 () ValueCell!9583)

