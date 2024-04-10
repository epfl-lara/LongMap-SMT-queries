; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112560 () Bool)

(assert start!112560)

(declare-fun b_free!30955 () Bool)

(declare-fun b_next!30955 () Bool)

(assert (=> start!112560 (= b_free!30955 (not b_next!30955))))

(declare-fun tp!108502 () Bool)

(declare-fun b_and!49863 () Bool)

(assert (=> start!112560 (= tp!108502 b_and!49863)))

(declare-fun b!1335180 () Bool)

(declare-fun res!886127 () Bool)

(declare-fun e!760447 () Bool)

(assert (=> b!1335180 (=> (not res!886127) (not e!760447))))

(declare-datatypes ((array!90590 0))(
  ( (array!90591 (arr!43761 (Array (_ BitVec 32) (_ BitVec 64))) (size!44311 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90590)

(declare-datatypes ((List!31004 0))(
  ( (Nil!31001) (Cons!31000 (h!32209 (_ BitVec 64)) (t!45268 List!31004)) )
))
(declare-fun arrayNoDuplicates!0 (array!90590 (_ BitVec 32) List!31004) Bool)

(assert (=> b!1335180 (= res!886127 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31001))))

(declare-fun b!1335181 () Bool)

(declare-fun e!760444 () Bool)

(declare-fun tp_is_empty!36865 () Bool)

(assert (=> b!1335181 (= e!760444 tp_is_empty!36865)))

(declare-fun res!886125 () Bool)

(assert (=> start!112560 (=> (not res!886125) (not e!760447))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112560 (= res!886125 (validMask!0 mask!1998))))

(assert (=> start!112560 e!760447))

(declare-datatypes ((V!54257 0))(
  ( (V!54258 (val!18507 Int)) )
))
(declare-datatypes ((ValueCell!17534 0))(
  ( (ValueCellFull!17534 (v!21144 V!54257)) (EmptyCell!17534) )
))
(declare-datatypes ((array!90592 0))(
  ( (array!90593 (arr!43762 (Array (_ BitVec 32) ValueCell!17534)) (size!44312 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90592)

(declare-fun e!760445 () Bool)

(declare-fun array_inv!33003 (array!90592) Bool)

(assert (=> start!112560 (and (array_inv!33003 _values!1320) e!760445)))

(assert (=> start!112560 true))

(declare-fun array_inv!33004 (array!90590) Bool)

(assert (=> start!112560 (array_inv!33004 _keys!1590)))

(assert (=> start!112560 tp!108502))

(assert (=> start!112560 tp_is_empty!36865))

(declare-fun b!1335182 () Bool)

(declare-fun res!886128 () Bool)

(assert (=> b!1335182 (=> (not res!886128) (not e!760447))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54257)

(declare-fun zeroValue!1262 () V!54257)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(declare-datatypes ((tuple2!23864 0))(
  ( (tuple2!23865 (_1!11943 (_ BitVec 64)) (_2!11943 V!54257)) )
))
(declare-datatypes ((List!31005 0))(
  ( (Nil!31002) (Cons!31001 (h!32210 tuple2!23864) (t!45269 List!31005)) )
))
(declare-datatypes ((ListLongMap!21521 0))(
  ( (ListLongMap!21522 (toList!10776 List!31005)) )
))
(declare-fun contains!8940 (ListLongMap!21521 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5750 (array!90590 array!90592 (_ BitVec 32) (_ BitVec 32) V!54257 V!54257 (_ BitVec 32) Int) ListLongMap!21521)

(assert (=> b!1335182 (= res!886128 (contains!8940 (getCurrentListMap!5750 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1335183 () Bool)

(declare-fun res!886129 () Bool)

(assert (=> b!1335183 (=> (not res!886129) (not e!760447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90590 (_ BitVec 32)) Bool)

(assert (=> b!1335183 (= res!886129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335184 () Bool)

(declare-fun e!760446 () Bool)

(assert (=> b!1335184 (= e!760446 tp_is_empty!36865)))

(declare-fun b!1335185 () Bool)

(assert (=> b!1335185 (= e!760447 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000))))

(declare-fun b!1335186 () Bool)

(declare-fun mapRes!56971 () Bool)

(assert (=> b!1335186 (= e!760445 (and e!760446 mapRes!56971))))

(declare-fun condMapEmpty!56971 () Bool)

(declare-fun mapDefault!56971 () ValueCell!17534)

