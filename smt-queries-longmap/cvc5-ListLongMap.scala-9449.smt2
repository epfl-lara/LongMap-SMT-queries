; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112302 () Bool)

(assert start!112302)

(declare-fun b_free!30697 () Bool)

(declare-fun b_next!30697 () Bool)

(assert (=> start!112302 (= b_free!30697 (not b_next!30697))))

(declare-fun tp!107727 () Bool)

(declare-fun b_and!49449 () Bool)

(assert (=> start!112302 (= tp!107727 b_and!49449)))

(declare-fun b!1330805 () Bool)

(declare-fun e!758427 () Bool)

(assert (=> b!1330805 (= e!758427 (not true))))

(declare-datatypes ((V!53913 0))(
  ( (V!53914 (val!18378 Int)) )
))
(declare-datatypes ((tuple2!23668 0))(
  ( (tuple2!23669 (_1!11845 (_ BitVec 64)) (_2!11845 V!53913)) )
))
(declare-datatypes ((List!30818 0))(
  ( (Nil!30815) (Cons!30814 (h!32023 tuple2!23668) (t!44928 List!30818)) )
))
(declare-datatypes ((ListLongMap!21325 0))(
  ( (ListLongMap!21326 (toList!10678 List!30818)) )
))
(declare-fun lt!591286 () ListLongMap!21325)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8842 (ListLongMap!21325 (_ BitVec 64)) Bool)

(assert (=> b!1330805 (contains!8842 lt!591286 k!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591287 () V!53913)

(declare-datatypes ((Unit!43799 0))(
  ( (Unit!43800) )
))
(declare-fun lt!591289 () Unit!43799)

(declare-datatypes ((array!90098 0))(
  ( (array!90099 (arr!43515 (Array (_ BitVec 32) (_ BitVec 64))) (size!44065 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90098)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!262 ((_ BitVec 64) (_ BitVec 64) V!53913 ListLongMap!21325) Unit!43799)

(assert (=> b!1330805 (= lt!591289 (lemmaInListMapAfterAddingDiffThenInBefore!262 k!1153 (select (arr!43515 _keys!1590) from!1980) lt!591287 lt!591286))))

(declare-fun lt!591288 () ListLongMap!21325)

(assert (=> b!1330805 (contains!8842 lt!591288 k!1153)))

(declare-fun lt!591285 () Unit!43799)

(declare-fun minValue!1262 () V!53913)

(assert (=> b!1330805 (= lt!591285 (lemmaInListMapAfterAddingDiffThenInBefore!262 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591288))))

(declare-fun +!4675 (ListLongMap!21325 tuple2!23668) ListLongMap!21325)

(assert (=> b!1330805 (= lt!591288 (+!4675 lt!591286 (tuple2!23669 (select (arr!43515 _keys!1590) from!1980) lt!591287)))))

(declare-datatypes ((ValueCell!17405 0))(
  ( (ValueCellFull!17405 (v!21015 V!53913)) (EmptyCell!17405) )
))
(declare-datatypes ((array!90100 0))(
  ( (array!90101 (arr!43516 (Array (_ BitVec 32) ValueCell!17405)) (size!44066 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90100)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21937 (ValueCell!17405 V!53913) V!53913)

(declare-fun dynLambda!3614 (Int (_ BitVec 64)) V!53913)

(assert (=> b!1330805 (= lt!591287 (get!21937 (select (arr!43516 _values!1320) from!1980) (dynLambda!3614 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53913)

(declare-fun getCurrentListMapNoExtraKeys!6313 (array!90098 array!90100 (_ BitVec 32) (_ BitVec 32) V!53913 V!53913 (_ BitVec 32) Int) ListLongMap!21325)

(assert (=> b!1330805 (= lt!591286 (getCurrentListMapNoExtraKeys!6313 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330806 () Bool)

(declare-fun res!883073 () Bool)

(assert (=> b!1330806 (=> (not res!883073) (not e!758427))))

(assert (=> b!1330806 (= res!883073 (not (= (select (arr!43515 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1330807 () Bool)

(declare-fun res!883072 () Bool)

(assert (=> b!1330807 (=> (not res!883072) (not e!758427))))

(declare-fun getCurrentListMap!5664 (array!90098 array!90100 (_ BitVec 32) (_ BitVec 32) V!53913 V!53913 (_ BitVec 32) Int) ListLongMap!21325)

(assert (=> b!1330807 (= res!883072 (contains!8842 (getCurrentListMap!5664 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapIsEmpty!56584 () Bool)

(declare-fun mapRes!56584 () Bool)

(assert (=> mapIsEmpty!56584 mapRes!56584))

(declare-fun res!883070 () Bool)

(assert (=> start!112302 (=> (not res!883070) (not e!758427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112302 (= res!883070 (validMask!0 mask!1998))))

(assert (=> start!112302 e!758427))

(declare-fun e!758430 () Bool)

(declare-fun array_inv!32825 (array!90100) Bool)

(assert (=> start!112302 (and (array_inv!32825 _values!1320) e!758430)))

(assert (=> start!112302 true))

(declare-fun array_inv!32826 (array!90098) Bool)

(assert (=> start!112302 (array_inv!32826 _keys!1590)))

(assert (=> start!112302 tp!107727))

(declare-fun tp_is_empty!36607 () Bool)

(assert (=> start!112302 tp_is_empty!36607))

(declare-fun b!1330808 () Bool)

(declare-fun res!883066 () Bool)

(assert (=> b!1330808 (=> (not res!883066) (not e!758427))))

(assert (=> b!1330808 (= res!883066 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44065 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330809 () Bool)

(declare-fun res!883067 () Bool)

(assert (=> b!1330809 (=> (not res!883067) (not e!758427))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90098 (_ BitVec 32)) Bool)

(assert (=> b!1330809 (= res!883067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330810 () Bool)

(declare-fun res!883071 () Bool)

(assert (=> b!1330810 (=> (not res!883071) (not e!758427))))

(declare-datatypes ((List!30819 0))(
  ( (Nil!30816) (Cons!30815 (h!32024 (_ BitVec 64)) (t!44929 List!30819)) )
))
(declare-fun arrayNoDuplicates!0 (array!90098 (_ BitVec 32) List!30819) Bool)

(assert (=> b!1330810 (= res!883071 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30816))))

(declare-fun b!1330811 () Bool)

(declare-fun e!758429 () Bool)

(assert (=> b!1330811 (= e!758430 (and e!758429 mapRes!56584))))

(declare-fun condMapEmpty!56584 () Bool)

(declare-fun mapDefault!56584 () ValueCell!17405)

