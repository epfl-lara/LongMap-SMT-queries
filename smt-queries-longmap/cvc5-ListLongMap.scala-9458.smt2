; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112356 () Bool)

(assert start!112356)

(declare-fun b_free!30751 () Bool)

(declare-fun b_next!30751 () Bool)

(assert (=> start!112356 (= b_free!30751 (not b_next!30751))))

(declare-fun tp!107889 () Bool)

(declare-fun b_and!49557 () Bool)

(assert (=> start!112356 (= tp!107889 b_and!49557)))

(declare-fun b!1331831 () Bool)

(declare-fun res!883801 () Bool)

(declare-fun e!758834 () Bool)

(assert (=> b!1331831 (=> (not res!883801) (not e!758834))))

(declare-datatypes ((array!90202 0))(
  ( (array!90203 (arr!43567 (Array (_ BitVec 32) (_ BitVec 64))) (size!44117 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90202)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90202 (_ BitVec 32)) Bool)

(assert (=> b!1331831 (= res!883801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331832 () Bool)

(declare-fun res!883797 () Bool)

(assert (=> b!1331832 (=> (not res!883797) (not e!758834))))

(declare-datatypes ((V!53985 0))(
  ( (V!53986 (val!18405 Int)) )
))
(declare-datatypes ((ValueCell!17432 0))(
  ( (ValueCellFull!17432 (v!21042 V!53985)) (EmptyCell!17432) )
))
(declare-datatypes ((array!90204 0))(
  ( (array!90205 (arr!43568 (Array (_ BitVec 32) ValueCell!17432)) (size!44118 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90204)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1331832 (= res!883797 (and (= (size!44118 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44117 _keys!1590) (size!44118 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56665 () Bool)

(declare-fun mapRes!56665 () Bool)

(declare-fun tp!107890 () Bool)

(declare-fun e!758836 () Bool)

(assert (=> mapNonEmpty!56665 (= mapRes!56665 (and tp!107890 e!758836))))

(declare-fun mapValue!56665 () ValueCell!17432)

(declare-fun mapKey!56665 () (_ BitVec 32))

(declare-fun mapRest!56665 () (Array (_ BitVec 32) ValueCell!17432))

(assert (=> mapNonEmpty!56665 (= (arr!43568 _values!1320) (store mapRest!56665 mapKey!56665 mapValue!56665))))

(declare-fun b!1331833 () Bool)

(declare-fun res!883796 () Bool)

(assert (=> b!1331833 (=> (not res!883796) (not e!758834))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1331833 (= res!883796 (not (= (select (arr!43567 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1331834 () Bool)

(declare-fun res!883800 () Bool)

(assert (=> b!1331834 (=> (not res!883800) (not e!758834))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53985)

(declare-fun zeroValue!1262 () V!53985)

(declare-datatypes ((tuple2!23712 0))(
  ( (tuple2!23713 (_1!11867 (_ BitVec 64)) (_2!11867 V!53985)) )
))
(declare-datatypes ((List!30860 0))(
  ( (Nil!30857) (Cons!30856 (h!32065 tuple2!23712) (t!45024 List!30860)) )
))
(declare-datatypes ((ListLongMap!21369 0))(
  ( (ListLongMap!21370 (toList!10700 List!30860)) )
))
(declare-fun contains!8864 (ListLongMap!21369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5683 (array!90202 array!90204 (_ BitVec 32) (_ BitVec 32) V!53985 V!53985 (_ BitVec 32) Int) ListLongMap!21369)

(assert (=> b!1331834 (= res!883800 (contains!8864 (getCurrentListMap!5683 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1331835 () Bool)

(assert (=> b!1331835 (= e!758834 (not true))))

(declare-fun lt!591723 () ListLongMap!21369)

(declare-fun +!4694 (ListLongMap!21369 tuple2!23712) ListLongMap!21369)

(assert (=> b!1331835 (contains!8864 (+!4694 lt!591723 (tuple2!23713 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43837 0))(
  ( (Unit!43838) )
))
(declare-fun lt!591720 () Unit!43837)

(declare-fun addStillContains!1173 (ListLongMap!21369 (_ BitVec 64) V!53985 (_ BitVec 64)) Unit!43837)

(assert (=> b!1331835 (= lt!591720 (addStillContains!1173 lt!591723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1331835 (contains!8864 lt!591723 k!1153)))

(declare-fun lt!591719 () V!53985)

(declare-fun lt!591722 () Unit!43837)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!281 ((_ BitVec 64) (_ BitVec 64) V!53985 ListLongMap!21369) Unit!43837)

(assert (=> b!1331835 (= lt!591722 (lemmaInListMapAfterAddingDiffThenInBefore!281 k!1153 (select (arr!43567 _keys!1590) from!1980) lt!591719 lt!591723))))

(declare-fun lt!591721 () ListLongMap!21369)

(assert (=> b!1331835 (contains!8864 lt!591721 k!1153)))

(declare-fun lt!591724 () Unit!43837)

(assert (=> b!1331835 (= lt!591724 (lemmaInListMapAfterAddingDiffThenInBefore!281 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591721))))

(assert (=> b!1331835 (= lt!591721 (+!4694 lt!591723 (tuple2!23713 (select (arr!43567 _keys!1590) from!1980) lt!591719)))))

(declare-fun get!21974 (ValueCell!17432 V!53985) V!53985)

(declare-fun dynLambda!3633 (Int (_ BitVec 64)) V!53985)

(assert (=> b!1331835 (= lt!591719 (get!21974 (select (arr!43568 _values!1320) from!1980) (dynLambda!3633 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6332 (array!90202 array!90204 (_ BitVec 32) (_ BitVec 32) V!53985 V!53985 (_ BitVec 32) Int) ListLongMap!21369)

(assert (=> b!1331835 (= lt!591723 (getCurrentListMapNoExtraKeys!6332 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331836 () Bool)

(declare-fun res!883802 () Bool)

(assert (=> b!1331836 (=> (not res!883802) (not e!758834))))

(assert (=> b!1331836 (= res!883802 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331837 () Bool)

(declare-fun res!883799 () Bool)

(assert (=> b!1331837 (=> (not res!883799) (not e!758834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331837 (= res!883799 (validKeyInArray!0 (select (arr!43567 _keys!1590) from!1980)))))

(declare-fun b!1331838 () Bool)

(declare-fun e!758833 () Bool)

(declare-fun tp_is_empty!36661 () Bool)

(assert (=> b!1331838 (= e!758833 tp_is_empty!36661)))

(declare-fun b!1331839 () Bool)

(declare-fun res!883803 () Bool)

(assert (=> b!1331839 (=> (not res!883803) (not e!758834))))

(declare-datatypes ((List!30861 0))(
  ( (Nil!30858) (Cons!30857 (h!32066 (_ BitVec 64)) (t!45025 List!30861)) )
))
(declare-fun arrayNoDuplicates!0 (array!90202 (_ BitVec 32) List!30861) Bool)

(assert (=> b!1331839 (= res!883803 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30858))))

(declare-fun b!1331841 () Bool)

(declare-fun e!758835 () Bool)

(assert (=> b!1331841 (= e!758835 (and e!758833 mapRes!56665))))

(declare-fun condMapEmpty!56665 () Bool)

(declare-fun mapDefault!56665 () ValueCell!17432)

