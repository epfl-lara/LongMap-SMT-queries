; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109106 () Bool)

(assert start!109106)

(declare-fun b_free!28595 () Bool)

(declare-fun b_next!28595 () Bool)

(assert (=> start!109106 (= b_free!28595 (not b_next!28595))))

(declare-fun tp!100903 () Bool)

(declare-fun b_and!46685 () Bool)

(assert (=> start!109106 (= tp!100903 b_and!46685)))

(declare-fun b!1289993 () Bool)

(declare-fun e!736491 () Bool)

(assert (=> b!1289993 (= e!736491 true)))

(declare-datatypes ((V!50749 0))(
  ( (V!50750 (val!17192 Int)) )
))
(declare-datatypes ((tuple2!22086 0))(
  ( (tuple2!22087 (_1!11054 (_ BitVec 64)) (_2!11054 V!50749)) )
))
(declare-datatypes ((List!29254 0))(
  ( (Nil!29251) (Cons!29250 (h!30459 tuple2!22086) (t!42818 List!29254)) )
))
(declare-datatypes ((ListLongMap!19743 0))(
  ( (ListLongMap!19744 (toList!9887 List!29254)) )
))
(declare-fun lt!578443 () ListLongMap!19743)

(declare-fun minValue!1387 () V!50749)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!8005 (ListLongMap!19743 (_ BitVec 64)) Bool)

(declare-fun +!4356 (ListLongMap!19743 tuple2!22086) ListLongMap!19743)

(assert (=> b!1289993 (not (contains!8005 (+!4356 lt!578443 (tuple2!22087 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-datatypes ((Unit!42688 0))(
  ( (Unit!42689) )
))
(declare-fun lt!578441 () Unit!42688)

(declare-fun addStillNotContains!374 (ListLongMap!19743 (_ BitVec 64) V!50749 (_ BitVec 64)) Unit!42688)

(assert (=> b!1289993 (= lt!578441 (addStillNotContains!374 lt!578443 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!50749)

(assert (=> b!1289993 (not (contains!8005 (+!4356 lt!578443 (tuple2!22087 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578444 () Unit!42688)

(assert (=> b!1289993 (= lt!578444 (addStillNotContains!374 lt!578443 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16219 0))(
  ( (ValueCellFull!16219 (v!19795 V!50749)) (EmptyCell!16219) )
))
(declare-datatypes ((array!85512 0))(
  ( (array!85513 (arr!41257 (Array (_ BitVec 32) ValueCell!16219)) (size!41807 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85512)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85514 0))(
  ( (array!85515 (arr!41258 (Array (_ BitVec 32) (_ BitVec 64))) (size!41808 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85514)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5987 (array!85514 array!85512 (_ BitVec 32) (_ BitVec 32) V!50749 V!50749 (_ BitVec 32) Int) ListLongMap!19743)

(assert (=> b!1289993 (= lt!578443 (getCurrentListMapNoExtraKeys!5987 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289994 () Bool)

(declare-fun res!856941 () Bool)

(declare-fun e!736496 () Bool)

(assert (=> b!1289994 (=> (not res!856941) (not e!736496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289994 (= res!856941 (not (validKeyInArray!0 (select (arr!41258 _keys!1741) from!2144))))))

(declare-fun b!1289995 () Bool)

(declare-fun e!736495 () Bool)

(declare-fun e!736492 () Bool)

(declare-fun mapRes!52913 () Bool)

(assert (=> b!1289995 (= e!736495 (and e!736492 mapRes!52913))))

(declare-fun condMapEmpty!52913 () Bool)

(declare-fun mapDefault!52913 () ValueCell!16219)

