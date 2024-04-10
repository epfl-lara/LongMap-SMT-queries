; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112486 () Bool)

(assert start!112486)

(declare-fun b_free!30881 () Bool)

(declare-fun b_next!30881 () Bool)

(assert (=> start!112486 (= b_free!30881 (not b_next!30881))))

(declare-fun tp!108279 () Bool)

(declare-fun b_and!49763 () Bool)

(assert (=> start!112486 (= tp!108279 b_and!49763)))

(declare-fun b!1334038 () Bool)

(declare-fun res!885348 () Bool)

(declare-fun e!759852 () Bool)

(assert (=> b!1334038 (=> (not res!885348) (not e!759852))))

(declare-datatypes ((V!54157 0))(
  ( (V!54158 (val!18470 Int)) )
))
(declare-datatypes ((ValueCell!17497 0))(
  ( (ValueCellFull!17497 (v!21107 V!54157)) (EmptyCell!17497) )
))
(declare-datatypes ((array!90448 0))(
  ( (array!90449 (arr!43690 (Array (_ BitVec 32) ValueCell!17497)) (size!44240 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90448)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90450 0))(
  ( (array!90451 (arr!43691 (Array (_ BitVec 32) (_ BitVec 64))) (size!44241 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90450)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54157)

(declare-fun zeroValue!1262 () V!54157)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23810 0))(
  ( (tuple2!23811 (_1!11916 (_ BitVec 64)) (_2!11916 V!54157)) )
))
(declare-datatypes ((List!30953 0))(
  ( (Nil!30950) (Cons!30949 (h!32158 tuple2!23810) (t!45193 List!30953)) )
))
(declare-datatypes ((ListLongMap!21467 0))(
  ( (ListLongMap!21468 (toList!10749 List!30953)) )
))
(declare-fun contains!8913 (ListLongMap!21467 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5726 (array!90450 array!90448 (_ BitVec 32) (_ BitVec 32) V!54157 V!54157 (_ BitVec 32) Int) ListLongMap!21467)

(assert (=> b!1334038 (= res!885348 (contains!8913 (getCurrentListMap!5726 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1334039 () Bool)

(declare-fun res!885344 () Bool)

(assert (=> b!1334039 (=> (not res!885344) (not e!759852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334039 (= res!885344 (validKeyInArray!0 (select (arr!43691 _keys!1590) from!1980)))))

(declare-fun res!885343 () Bool)

(assert (=> start!112486 (=> (not res!885343) (not e!759852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112486 (= res!885343 (validMask!0 mask!1998))))

(assert (=> start!112486 e!759852))

(declare-fun e!759855 () Bool)

(declare-fun array_inv!32951 (array!90448) Bool)

(assert (=> start!112486 (and (array_inv!32951 _values!1320) e!759855)))

(assert (=> start!112486 true))

(declare-fun array_inv!32952 (array!90450) Bool)

(assert (=> start!112486 (array_inv!32952 _keys!1590)))

(assert (=> start!112486 tp!108279))

(declare-fun tp_is_empty!36791 () Bool)

(assert (=> start!112486 tp_is_empty!36791))

(declare-fun b!1334040 () Bool)

(declare-fun res!885345 () Bool)

(assert (=> b!1334040 (=> (not res!885345) (not e!759852))))

(assert (=> b!1334040 (= res!885345 (not (= (select (arr!43691 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1334041 () Bool)

(declare-fun res!885350 () Bool)

(assert (=> b!1334041 (=> (not res!885350) (not e!759852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90450 (_ BitVec 32)) Bool)

(assert (=> b!1334041 (= res!885350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334042 () Bool)

(declare-fun res!885341 () Bool)

(declare-fun e!759856 () Bool)

(assert (=> b!1334042 (=> (not res!885341) (not e!759856))))

(assert (=> b!1334042 (= res!885341 (not (= k!1153 (select (arr!43691 _keys!1590) from!1980))))))

(declare-fun b!1334043 () Bool)

(declare-fun res!885347 () Bool)

(assert (=> b!1334043 (=> (not res!885347) (not e!759852))))

(assert (=> b!1334043 (= res!885347 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44241 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334044 () Bool)

(assert (=> b!1334044 (= e!759852 e!759856)))

(declare-fun res!885349 () Bool)

(assert (=> b!1334044 (=> (not res!885349) (not e!759856))))

(declare-fun lt!592253 () V!54157)

(declare-fun lt!592254 () ListLongMap!21467)

(declare-fun +!4720 (ListLongMap!21467 tuple2!23810) ListLongMap!21467)

(assert (=> b!1334044 (= res!885349 (contains!8913 (+!4720 lt!592254 (tuple2!23811 (select (arr!43691 _keys!1590) from!1980) lt!592253)) k!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6358 (array!90450 array!90448 (_ BitVec 32) (_ BitVec 32) V!54157 V!54157 (_ BitVec 32) Int) ListLongMap!21467)

(assert (=> b!1334044 (= lt!592254 (getCurrentListMapNoExtraKeys!6358 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22042 (ValueCell!17497 V!54157) V!54157)

(declare-fun dynLambda!3659 (Int (_ BitVec 64)) V!54157)

(assert (=> b!1334044 (= lt!592253 (get!22042 (select (arr!43690 _values!1320) from!1980) (dynLambda!3659 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334045 () Bool)

(assert (=> b!1334045 (= e!759856 (not true))))

(assert (=> b!1334045 (contains!8913 lt!592254 k!1153)))

(declare-datatypes ((Unit!43881 0))(
  ( (Unit!43882) )
))
(declare-fun lt!592255 () Unit!43881)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!303 ((_ BitVec 64) (_ BitVec 64) V!54157 ListLongMap!21467) Unit!43881)

(assert (=> b!1334045 (= lt!592255 (lemmaInListMapAfterAddingDiffThenInBefore!303 k!1153 (select (arr!43691 _keys!1590) from!1980) lt!592253 lt!592254))))

(declare-fun b!1334046 () Bool)

(declare-fun res!885346 () Bool)

(assert (=> b!1334046 (=> (not res!885346) (not e!759852))))

(assert (=> b!1334046 (= res!885346 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334047 () Bool)

(declare-fun e!759853 () Bool)

(declare-fun mapRes!56860 () Bool)

(assert (=> b!1334047 (= e!759855 (and e!759853 mapRes!56860))))

(declare-fun condMapEmpty!56860 () Bool)

(declare-fun mapDefault!56860 () ValueCell!17497)

