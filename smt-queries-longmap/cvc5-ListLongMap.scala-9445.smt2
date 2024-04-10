; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112278 () Bool)

(assert start!112278)

(declare-fun b_free!30673 () Bool)

(declare-fun b_next!30673 () Bool)

(assert (=> start!112278 (= b_free!30673 (not b_next!30673))))

(declare-fun tp!107656 () Bool)

(declare-fun b_and!49401 () Bool)

(assert (=> start!112278 (= tp!107656 b_and!49401)))

(declare-fun b!1330349 () Bool)

(declare-fun e!758249 () Bool)

(assert (=> b!1330349 (= e!758249 (not true))))

(declare-datatypes ((V!53881 0))(
  ( (V!53882 (val!18366 Int)) )
))
(declare-datatypes ((tuple2!23652 0))(
  ( (tuple2!23653 (_1!11837 (_ BitVec 64)) (_2!11837 V!53881)) )
))
(declare-datatypes ((List!30803 0))(
  ( (Nil!30800) (Cons!30799 (h!32008 tuple2!23652) (t!44889 List!30803)) )
))
(declare-datatypes ((ListLongMap!21309 0))(
  ( (ListLongMap!21310 (toList!10670 List!30803)) )
))
(declare-fun lt!591106 () ListLongMap!21309)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8834 (ListLongMap!21309 (_ BitVec 64)) Bool)

(assert (=> b!1330349 (contains!8834 lt!591106 k!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90054 0))(
  ( (array!90055 (arr!43493 (Array (_ BitVec 32) (_ BitVec 64))) (size!44043 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90054)

(declare-datatypes ((Unit!43785 0))(
  ( (Unit!43786) )
))
(declare-fun lt!591108 () Unit!43785)

(declare-fun lt!591109 () V!53881)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!255 ((_ BitVec 64) (_ BitVec 64) V!53881 ListLongMap!21309) Unit!43785)

(assert (=> b!1330349 (= lt!591108 (lemmaInListMapAfterAddingDiffThenInBefore!255 k!1153 (select (arr!43493 _keys!1590) from!1980) lt!591109 lt!591106))))

(declare-fun lt!591107 () ListLongMap!21309)

(assert (=> b!1330349 (contains!8834 lt!591107 k!1153)))

(declare-fun lt!591105 () Unit!43785)

(declare-fun minValue!1262 () V!53881)

(assert (=> b!1330349 (= lt!591105 (lemmaInListMapAfterAddingDiffThenInBefore!255 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591107))))

(declare-fun +!4668 (ListLongMap!21309 tuple2!23652) ListLongMap!21309)

(assert (=> b!1330349 (= lt!591107 (+!4668 lt!591106 (tuple2!23653 (select (arr!43493 _keys!1590) from!1980) lt!591109)))))

(declare-datatypes ((ValueCell!17393 0))(
  ( (ValueCellFull!17393 (v!21003 V!53881)) (EmptyCell!17393) )
))
(declare-datatypes ((array!90056 0))(
  ( (array!90057 (arr!43494 (Array (_ BitVec 32) ValueCell!17393)) (size!44044 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90056)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21922 (ValueCell!17393 V!53881) V!53881)

(declare-fun dynLambda!3607 (Int (_ BitVec 64)) V!53881)

(assert (=> b!1330349 (= lt!591109 (get!21922 (select (arr!43494 _values!1320) from!1980) (dynLambda!3607 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53881)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6306 (array!90054 array!90056 (_ BitVec 32) (_ BitVec 32) V!53881 V!53881 (_ BitVec 32) Int) ListLongMap!21309)

(assert (=> b!1330349 (= lt!591106 (getCurrentListMapNoExtraKeys!6306 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330350 () Bool)

(declare-fun e!758248 () Bool)

(declare-fun tp_is_empty!36583 () Bool)

(assert (=> b!1330350 (= e!758248 tp_is_empty!36583)))

(declare-fun b!1330351 () Bool)

(declare-fun res!882747 () Bool)

(assert (=> b!1330351 (=> (not res!882747) (not e!758249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90054 (_ BitVec 32)) Bool)

(assert (=> b!1330351 (= res!882747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56548 () Bool)

(declare-fun mapRes!56548 () Bool)

(declare-fun tp!107655 () Bool)

(declare-fun e!758251 () Bool)

(assert (=> mapNonEmpty!56548 (= mapRes!56548 (and tp!107655 e!758251))))

(declare-fun mapRest!56548 () (Array (_ BitVec 32) ValueCell!17393))

(declare-fun mapValue!56548 () ValueCell!17393)

(declare-fun mapKey!56548 () (_ BitVec 32))

(assert (=> mapNonEmpty!56548 (= (arr!43494 _values!1320) (store mapRest!56548 mapKey!56548 mapValue!56548))))

(declare-fun b!1330352 () Bool)

(declare-fun res!882748 () Bool)

(assert (=> b!1330352 (=> (not res!882748) (not e!758249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330352 (= res!882748 (validKeyInArray!0 (select (arr!43493 _keys!1590) from!1980)))))

(declare-fun b!1330353 () Bool)

(assert (=> b!1330353 (= e!758251 tp_is_empty!36583)))

(declare-fun b!1330354 () Bool)

(declare-fun e!758247 () Bool)

(assert (=> b!1330354 (= e!758247 (and e!758248 mapRes!56548))))

(declare-fun condMapEmpty!56548 () Bool)

(declare-fun mapDefault!56548 () ValueCell!17393)

