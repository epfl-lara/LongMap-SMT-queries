; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109244 () Bool)

(assert start!109244)

(declare-fun b_free!28733 () Bool)

(declare-fun b_next!28733 () Bool)

(assert (=> start!109244 (= b_free!28733 (not b_next!28733))))

(declare-fun tp!101317 () Bool)

(declare-fun b_and!46823 () Bool)

(assert (=> start!109244 (= tp!101317 b_and!46823)))

(declare-fun b!1292415 () Bool)

(declare-fun e!737674 () Bool)

(declare-fun tp_is_empty!34373 () Bool)

(assert (=> b!1292415 (= e!737674 tp_is_empty!34373)))

(declare-fun b!1292416 () Bool)

(declare-fun res!858737 () Bool)

(declare-fun e!737672 () Bool)

(assert (=> b!1292416 (=> (not res!858737) (not e!737672))))

(declare-datatypes ((array!85778 0))(
  ( (array!85779 (arr!41390 (Array (_ BitVec 32) (_ BitVec 64))) (size!41940 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85778)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292416 (= res!858737 (not (validKeyInArray!0 (select (arr!41390 _keys!1741) from!2144))))))

(declare-fun b!1292417 () Bool)

(declare-fun res!858738 () Bool)

(assert (=> b!1292417 (=> (not res!858738) (not e!737672))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50933 0))(
  ( (V!50934 (val!17261 Int)) )
))
(declare-datatypes ((ValueCell!16288 0))(
  ( (ValueCellFull!16288 (v!19864 V!50933)) (EmptyCell!16288) )
))
(declare-datatypes ((array!85780 0))(
  ( (array!85781 (arr!41391 (Array (_ BitVec 32) ValueCell!16288)) (size!41941 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85780)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292417 (= res!858738 (and (= (size!41941 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41940 _keys!1741) (size!41941 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292418 () Bool)

(declare-fun res!858734 () Bool)

(assert (=> b!1292418 (=> (not res!858734) (not e!737672))))

(declare-datatypes ((List!29360 0))(
  ( (Nil!29357) (Cons!29356 (h!30565 (_ BitVec 64)) (t!42924 List!29360)) )
))
(declare-fun arrayNoDuplicates!0 (array!85778 (_ BitVec 32) List!29360) Bool)

(assert (=> b!1292418 (= res!858734 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29357))))

(declare-fun b!1292419 () Bool)

(declare-fun res!858741 () Bool)

(assert (=> b!1292419 (=> (not res!858741) (not e!737672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85778 (_ BitVec 32)) Bool)

(assert (=> b!1292419 (= res!858741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292420 () Bool)

(declare-fun res!858739 () Bool)

(assert (=> b!1292420 (=> (not res!858739) (not e!737672))))

(assert (=> b!1292420 (= res!858739 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41940 _keys!1741))))))

(declare-fun b!1292421 () Bool)

(declare-fun e!737675 () Bool)

(assert (=> b!1292421 (= e!737675 tp_is_empty!34373)))

(declare-fun b!1292422 () Bool)

(declare-fun res!858736 () Bool)

(assert (=> b!1292422 (=> (not res!858736) (not e!737672))))

(declare-fun minValue!1387 () V!50933)

(declare-fun zeroValue!1387 () V!50933)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22208 0))(
  ( (tuple2!22209 (_1!11115 (_ BitVec 64)) (_2!11115 V!50933)) )
))
(declare-datatypes ((List!29361 0))(
  ( (Nil!29358) (Cons!29357 (h!30566 tuple2!22208) (t!42925 List!29361)) )
))
(declare-datatypes ((ListLongMap!19865 0))(
  ( (ListLongMap!19866 (toList!9948 List!29361)) )
))
(declare-fun contains!8066 (ListLongMap!19865 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4994 (array!85778 array!85780 (_ BitVec 32) (_ BitVec 32) V!50933 V!50933 (_ BitVec 32) Int) ListLongMap!19865)

(assert (=> b!1292422 (= res!858736 (contains!8066 (getCurrentListMap!4994 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1292423 () Bool)

(declare-fun res!858740 () Bool)

(assert (=> b!1292423 (=> (not res!858740) (not e!737672))))

(assert (=> b!1292423 (= res!858740 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41940 _keys!1741))))))

(declare-fun b!1292424 () Bool)

(declare-fun e!737671 () Bool)

(declare-fun mapRes!53120 () Bool)

(assert (=> b!1292424 (= e!737671 (and e!737674 mapRes!53120))))

(declare-fun condMapEmpty!53120 () Bool)

(declare-fun mapDefault!53120 () ValueCell!16288)

