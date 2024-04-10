; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112372 () Bool)

(assert start!112372)

(declare-fun b_free!30767 () Bool)

(declare-fun b_next!30767 () Bool)

(assert (=> start!112372 (= b_free!30767 (not b_next!30767))))

(declare-fun tp!107937 () Bool)

(declare-fun b_and!49589 () Bool)

(assert (=> start!112372 (= tp!107937 b_and!49589)))

(declare-fun b!1332135 () Bool)

(declare-fun e!758952 () Bool)

(declare-fun tp_is_empty!36677 () Bool)

(assert (=> b!1332135 (= e!758952 tp_is_empty!36677)))

(declare-fun b!1332136 () Bool)

(declare-fun res!884015 () Bool)

(declare-fun e!758953 () Bool)

(assert (=> b!1332136 (=> (not res!884015) (not e!758953))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332136 (= res!884015 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332137 () Bool)

(declare-fun res!884018 () Bool)

(assert (=> b!1332137 (=> (not res!884018) (not e!758953))))

(declare-datatypes ((array!90234 0))(
  ( (array!90235 (arr!43583 (Array (_ BitVec 32) (_ BitVec 64))) (size!44133 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90234)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332137 (= res!884018 (validKeyInArray!0 (select (arr!43583 _keys!1590) from!1980)))))

(declare-fun b!1332138 () Bool)

(assert (=> b!1332138 (= e!758953 (not true))))

(declare-datatypes ((V!54005 0))(
  ( (V!54006 (val!18413 Int)) )
))
(declare-datatypes ((tuple2!23728 0))(
  ( (tuple2!23729 (_1!11875 (_ BitVec 64)) (_2!11875 V!54005)) )
))
(declare-datatypes ((List!30873 0))(
  ( (Nil!30870) (Cons!30869 (h!32078 tuple2!23728) (t!45053 List!30873)) )
))
(declare-datatypes ((ListLongMap!21385 0))(
  ( (ListLongMap!21386 (toList!10708 List!30873)) )
))
(declare-fun lt!591867 () ListLongMap!21385)

(declare-fun minValue!1262 () V!54005)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8872 (ListLongMap!21385 (_ BitVec 64)) Bool)

(declare-fun +!4702 (ListLongMap!21385 tuple2!23728) ListLongMap!21385)

(assert (=> b!1332138 (contains!8872 (+!4702 lt!591867 (tuple2!23729 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43853 0))(
  ( (Unit!43854) )
))
(declare-fun lt!591868 () Unit!43853)

(declare-fun addStillContains!1181 (ListLongMap!21385 (_ BitVec 64) V!54005 (_ BitVec 64)) Unit!43853)

(assert (=> b!1332138 (= lt!591868 (addStillContains!1181 lt!591867 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1332138 (contains!8872 lt!591867 k!1153)))

(declare-fun lt!591863 () Unit!43853)

(declare-fun lt!591864 () V!54005)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!289 ((_ BitVec 64) (_ BitVec 64) V!54005 ListLongMap!21385) Unit!43853)

(assert (=> b!1332138 (= lt!591863 (lemmaInListMapAfterAddingDiffThenInBefore!289 k!1153 (select (arr!43583 _keys!1590) from!1980) lt!591864 lt!591867))))

(declare-fun lt!591865 () ListLongMap!21385)

(assert (=> b!1332138 (contains!8872 lt!591865 k!1153)))

(declare-fun lt!591866 () Unit!43853)

(assert (=> b!1332138 (= lt!591866 (lemmaInListMapAfterAddingDiffThenInBefore!289 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591865))))

(assert (=> b!1332138 (= lt!591865 (+!4702 lt!591867 (tuple2!23729 (select (arr!43583 _keys!1590) from!1980) lt!591864)))))

(declare-datatypes ((ValueCell!17440 0))(
  ( (ValueCellFull!17440 (v!21050 V!54005)) (EmptyCell!17440) )
))
(declare-datatypes ((array!90236 0))(
  ( (array!90237 (arr!43584 (Array (_ BitVec 32) ValueCell!17440)) (size!44134 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90236)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21986 (ValueCell!17440 V!54005) V!54005)

(declare-fun dynLambda!3641 (Int (_ BitVec 64)) V!54005)

(assert (=> b!1332138 (= lt!591864 (get!21986 (select (arr!43584 _values!1320) from!1980) (dynLambda!3641 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!54005)

(declare-fun getCurrentListMapNoExtraKeys!6340 (array!90234 array!90236 (_ BitVec 32) (_ BitVec 32) V!54005 V!54005 (_ BitVec 32) Int) ListLongMap!21385)

(assert (=> b!1332138 (= lt!591867 (getCurrentListMapNoExtraKeys!6340 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332139 () Bool)

(declare-fun res!884013 () Bool)

(assert (=> b!1332139 (=> (not res!884013) (not e!758953))))

(declare-fun getCurrentListMap!5689 (array!90234 array!90236 (_ BitVec 32) (_ BitVec 32) V!54005 V!54005 (_ BitVec 32) Int) ListLongMap!21385)

(assert (=> b!1332139 (= res!884013 (contains!8872 (getCurrentListMap!5689 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1332140 () Bool)

(declare-fun res!884012 () Bool)

(assert (=> b!1332140 (=> (not res!884012) (not e!758953))))

(assert (=> b!1332140 (= res!884012 (and (= (size!44134 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44133 _keys!1590) (size!44134 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56689 () Bool)

(declare-fun mapRes!56689 () Bool)

(assert (=> mapIsEmpty!56689 mapRes!56689))

(declare-fun b!1332141 () Bool)

(declare-fun e!758955 () Bool)

(assert (=> b!1332141 (= e!758955 (and e!758952 mapRes!56689))))

(declare-fun condMapEmpty!56689 () Bool)

(declare-fun mapDefault!56689 () ValueCell!17440)

