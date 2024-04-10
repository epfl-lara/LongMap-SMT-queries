; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112658 () Bool)

(assert start!112658)

(declare-fun b_free!30995 () Bool)

(declare-fun b_next!30995 () Bool)

(assert (=> start!112658 (= b_free!30995 (not b_next!30995))))

(declare-fun tp!108625 () Bool)

(declare-fun b_and!49927 () Bool)

(assert (=> start!112658 (= tp!108625 b_and!49927)))

(declare-fun b!1336215 () Bool)

(declare-fun e!760987 () Bool)

(assert (=> b!1336215 (= e!760987 false)))

(declare-datatypes ((V!54309 0))(
  ( (V!54310 (val!18527 Int)) )
))
(declare-datatypes ((ValueCell!17554 0))(
  ( (ValueCellFull!17554 (v!21167 V!54309)) (EmptyCell!17554) )
))
(declare-datatypes ((array!90670 0))(
  ( (array!90671 (arr!43800 (Array (_ BitVec 32) ValueCell!17554)) (size!44350 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90670)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90672 0))(
  ( (array!90673 (arr!43801 (Array (_ BitVec 32) (_ BitVec 64))) (size!44351 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90672)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun lt!592739 () Bool)

(declare-fun minValue!1262 () V!54309)

(declare-fun zeroValue!1262 () V!54309)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((tuple2!23894 0))(
  ( (tuple2!23895 (_1!11958 (_ BitVec 64)) (_2!11958 V!54309)) )
))
(declare-datatypes ((List!31036 0))(
  ( (Nil!31033) (Cons!31032 (h!32241 tuple2!23894) (t!45312 List!31036)) )
))
(declare-datatypes ((ListLongMap!21551 0))(
  ( (ListLongMap!21552 (toList!10791 List!31036)) )
))
(declare-fun contains!8956 (ListLongMap!21551 (_ BitVec 64)) Bool)

(declare-fun +!4734 (ListLongMap!21551 tuple2!23894) ListLongMap!21551)

(declare-fun getCurrentListMapNoExtraKeys!6376 (array!90672 array!90670 (_ BitVec 32) (_ BitVec 32) V!54309 V!54309 (_ BitVec 32) Int) ListLongMap!21551)

(declare-fun get!22097 (ValueCell!17554 V!54309) V!54309)

(declare-fun dynLambda!3673 (Int (_ BitVec 64)) V!54309)

(assert (=> b!1336215 (= lt!592739 (contains!8956 (+!4734 (+!4734 (getCurrentListMapNoExtraKeys!6376 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23895 (select (arr!43801 _keys!1590) from!1980) (get!22097 (select (arr!43800 _values!1320) from!1980) (dynLambda!3673 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23895 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k!1153))))

(declare-fun b!1336216 () Bool)

(declare-fun res!886753 () Bool)

(assert (=> b!1336216 (=> (not res!886753) (not e!760987))))

(assert (=> b!1336216 (= res!886753 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336217 () Bool)

(declare-fun res!886749 () Bool)

(assert (=> b!1336217 (=> (not res!886749) (not e!760987))))

(declare-datatypes ((List!31037 0))(
  ( (Nil!31034) (Cons!31033 (h!32242 (_ BitVec 64)) (t!45313 List!31037)) )
))
(declare-fun arrayNoDuplicates!0 (array!90672 (_ BitVec 32) List!31037) Bool)

(assert (=> b!1336217 (= res!886749 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31034))))

(declare-fun b!1336218 () Bool)

(declare-fun res!886747 () Bool)

(assert (=> b!1336218 (=> (not res!886747) (not e!760987))))

(assert (=> b!1336218 (= res!886747 (not (= (select (arr!43801 _keys!1590) from!1980) k!1153)))))

(declare-fun mapNonEmpty!57035 () Bool)

(declare-fun mapRes!57035 () Bool)

(declare-fun tp!108626 () Bool)

(declare-fun e!760986 () Bool)

(assert (=> mapNonEmpty!57035 (= mapRes!57035 (and tp!108626 e!760986))))

(declare-fun mapValue!57035 () ValueCell!17554)

(declare-fun mapRest!57035 () (Array (_ BitVec 32) ValueCell!17554))

(declare-fun mapKey!57035 () (_ BitVec 32))

(assert (=> mapNonEmpty!57035 (= (arr!43800 _values!1320) (store mapRest!57035 mapKey!57035 mapValue!57035))))

(declare-fun b!1336220 () Bool)

(declare-fun res!886748 () Bool)

(assert (=> b!1336220 (=> (not res!886748) (not e!760987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90672 (_ BitVec 32)) Bool)

(assert (=> b!1336220 (= res!886748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336221 () Bool)

(declare-fun tp_is_empty!36905 () Bool)

(assert (=> b!1336221 (= e!760986 tp_is_empty!36905)))

(declare-fun b!1336222 () Bool)

(declare-fun res!886751 () Bool)

(assert (=> b!1336222 (=> (not res!886751) (not e!760987))))

(assert (=> b!1336222 (= res!886751 (and (= (size!44350 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44351 _keys!1590) (size!44350 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1336223 () Bool)

(declare-fun res!886754 () Bool)

(assert (=> b!1336223 (=> (not res!886754) (not e!760987))))

(declare-fun getCurrentListMap!5763 (array!90672 array!90670 (_ BitVec 32) (_ BitVec 32) V!54309 V!54309 (_ BitVec 32) Int) ListLongMap!21551)

(assert (=> b!1336223 (= res!886754 (contains!8956 (getCurrentListMap!5763 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapIsEmpty!57035 () Bool)

(assert (=> mapIsEmpty!57035 mapRes!57035))

(declare-fun b!1336224 () Bool)

(declare-fun res!886746 () Bool)

(assert (=> b!1336224 (=> (not res!886746) (not e!760987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336224 (= res!886746 (validKeyInArray!0 (select (arr!43801 _keys!1590) from!1980)))))

(declare-fun res!886752 () Bool)

(assert (=> start!112658 (=> (not res!886752) (not e!760987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112658 (= res!886752 (validMask!0 mask!1998))))

(assert (=> start!112658 e!760987))

(declare-fun e!760989 () Bool)

(declare-fun array_inv!33031 (array!90670) Bool)

(assert (=> start!112658 (and (array_inv!33031 _values!1320) e!760989)))

(assert (=> start!112658 true))

(declare-fun array_inv!33032 (array!90672) Bool)

(assert (=> start!112658 (array_inv!33032 _keys!1590)))

(assert (=> start!112658 tp!108625))

(assert (=> start!112658 tp_is_empty!36905))

(declare-fun b!1336219 () Bool)

(declare-fun e!760988 () Bool)

(assert (=> b!1336219 (= e!760988 tp_is_empty!36905)))

(declare-fun b!1336225 () Bool)

(assert (=> b!1336225 (= e!760989 (and e!760988 mapRes!57035))))

(declare-fun condMapEmpty!57035 () Bool)

(declare-fun mapDefault!57035 () ValueCell!17554)

