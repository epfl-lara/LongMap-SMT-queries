; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112366 () Bool)

(assert start!112366)

(declare-fun b_free!30761 () Bool)

(declare-fun b_next!30761 () Bool)

(assert (=> start!112366 (= b_free!30761 (not b_next!30761))))

(declare-fun tp!107920 () Bool)

(declare-fun b_and!49577 () Bool)

(assert (=> start!112366 (= tp!107920 b_and!49577)))

(declare-fun b!1332021 () Bool)

(declare-fun res!883937 () Bool)

(declare-fun e!758909 () Bool)

(assert (=> b!1332021 (=> (not res!883937) (not e!758909))))

(declare-datatypes ((array!90222 0))(
  ( (array!90223 (arr!43577 (Array (_ BitVec 32) (_ BitVec 64))) (size!44127 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90222)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90222 (_ BitVec 32)) Bool)

(assert (=> b!1332021 (= res!883937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332022 () Bool)

(assert (=> b!1332022 (= e!758909 (not true))))

(declare-datatypes ((V!53997 0))(
  ( (V!53998 (val!18410 Int)) )
))
(declare-datatypes ((tuple2!23722 0))(
  ( (tuple2!23723 (_1!11872 (_ BitVec 64)) (_2!11872 V!53997)) )
))
(declare-datatypes ((List!30869 0))(
  ( (Nil!30866) (Cons!30865 (h!32074 tuple2!23722) (t!45043 List!30869)) )
))
(declare-datatypes ((ListLongMap!21379 0))(
  ( (ListLongMap!21380 (toList!10705 List!30869)) )
))
(declare-fun lt!591813 () ListLongMap!21379)

(declare-fun minValue!1262 () V!53997)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8869 (ListLongMap!21379 (_ BitVec 64)) Bool)

(declare-fun +!4699 (ListLongMap!21379 tuple2!23722) ListLongMap!21379)

(assert (=> b!1332022 (contains!8869 (+!4699 lt!591813 (tuple2!23723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153)))

(declare-datatypes ((Unit!43847 0))(
  ( (Unit!43848) )
))
(declare-fun lt!591809 () Unit!43847)

(declare-fun addStillContains!1178 (ListLongMap!21379 (_ BitVec 64) V!53997 (_ BitVec 64)) Unit!43847)

(assert (=> b!1332022 (= lt!591809 (addStillContains!1178 lt!591813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k!1153))))

(assert (=> b!1332022 (contains!8869 lt!591813 k!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591810 () Unit!43847)

(declare-fun lt!591812 () V!53997)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!286 ((_ BitVec 64) (_ BitVec 64) V!53997 ListLongMap!21379) Unit!43847)

(assert (=> b!1332022 (= lt!591810 (lemmaInListMapAfterAddingDiffThenInBefore!286 k!1153 (select (arr!43577 _keys!1590) from!1980) lt!591812 lt!591813))))

(declare-fun lt!591811 () ListLongMap!21379)

(assert (=> b!1332022 (contains!8869 lt!591811 k!1153)))

(declare-fun lt!591814 () Unit!43847)

(assert (=> b!1332022 (= lt!591814 (lemmaInListMapAfterAddingDiffThenInBefore!286 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591811))))

(assert (=> b!1332022 (= lt!591811 (+!4699 lt!591813 (tuple2!23723 (select (arr!43577 _keys!1590) from!1980) lt!591812)))))

(declare-datatypes ((ValueCell!17437 0))(
  ( (ValueCellFull!17437 (v!21047 V!53997)) (EmptyCell!17437) )
))
(declare-datatypes ((array!90224 0))(
  ( (array!90225 (arr!43578 (Array (_ BitVec 32) ValueCell!17437)) (size!44128 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90224)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21981 (ValueCell!17437 V!53997) V!53997)

(declare-fun dynLambda!3638 (Int (_ BitVec 64)) V!53997)

(assert (=> b!1332022 (= lt!591812 (get!21981 (select (arr!43578 _values!1320) from!1980) (dynLambda!3638 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53997)

(declare-fun getCurrentListMapNoExtraKeys!6337 (array!90222 array!90224 (_ BitVec 32) (_ BitVec 32) V!53997 V!53997 (_ BitVec 32) Int) ListLongMap!21379)

(assert (=> b!1332022 (= lt!591813 (getCurrentListMapNoExtraKeys!6337 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332023 () Bool)

(declare-fun res!883933 () Bool)

(assert (=> b!1332023 (=> (not res!883933) (not e!758909))))

(assert (=> b!1332023 (= res!883933 (and (= (size!44128 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44127 _keys!1590) (size!44128 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332024 () Bool)

(declare-fun res!883935 () Bool)

(assert (=> b!1332024 (=> (not res!883935) (not e!758909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332024 (= res!883935 (validKeyInArray!0 (select (arr!43577 _keys!1590) from!1980)))))

(declare-fun b!1332025 () Bool)

(declare-fun e!758911 () Bool)

(declare-fun tp_is_empty!36671 () Bool)

(assert (=> b!1332025 (= e!758911 tp_is_empty!36671)))

(declare-fun mapNonEmpty!56680 () Bool)

(declare-fun mapRes!56680 () Bool)

(declare-fun tp!107919 () Bool)

(assert (=> mapNonEmpty!56680 (= mapRes!56680 (and tp!107919 e!758911))))

(declare-fun mapKey!56680 () (_ BitVec 32))

(declare-fun mapRest!56680 () (Array (_ BitVec 32) ValueCell!17437))

(declare-fun mapValue!56680 () ValueCell!17437)

(assert (=> mapNonEmpty!56680 (= (arr!43578 _values!1320) (store mapRest!56680 mapKey!56680 mapValue!56680))))

(declare-fun b!1332026 () Bool)

(declare-fun res!883932 () Bool)

(assert (=> b!1332026 (=> (not res!883932) (not e!758909))))

(assert (=> b!1332026 (= res!883932 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44127 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332027 () Bool)

(declare-fun res!883930 () Bool)

(assert (=> b!1332027 (=> (not res!883930) (not e!758909))))

(assert (=> b!1332027 (= res!883930 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332028 () Bool)

(declare-fun e!758910 () Bool)

(declare-fun e!758907 () Bool)

(assert (=> b!1332028 (= e!758910 (and e!758907 mapRes!56680))))

(declare-fun condMapEmpty!56680 () Bool)

(declare-fun mapDefault!56680 () ValueCell!17437)

