; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109024 () Bool)

(assert start!109024)

(declare-fun b_free!28513 () Bool)

(declare-fun b_next!28513 () Bool)

(assert (=> start!109024 (= b_free!28513 (not b_next!28513))))

(declare-fun tp!100658 () Bool)

(declare-fun b_and!46603 () Bool)

(assert (=> start!109024 (= tp!100658 b_and!46603)))

(declare-fun b!1288517 () Bool)

(declare-fun e!735758 () Bool)

(declare-fun tp_is_empty!34153 () Bool)

(assert (=> b!1288517 (= e!735758 tp_is_empty!34153)))

(declare-fun b!1288518 () Bool)

(declare-fun res!855827 () Bool)

(declare-fun e!735757 () Bool)

(assert (=> b!1288518 (=> (not res!855827) (not e!735757))))

(declare-datatypes ((V!50641 0))(
  ( (V!50642 (val!17151 Int)) )
))
(declare-fun minValue!1387 () V!50641)

(declare-fun zeroValue!1387 () V!50641)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16178 0))(
  ( (ValueCellFull!16178 (v!19754 V!50641)) (EmptyCell!16178) )
))
(declare-datatypes ((array!85350 0))(
  ( (array!85351 (arr!41176 (Array (_ BitVec 32) ValueCell!16178)) (size!41726 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85350)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85352 0))(
  ( (array!85353 (arr!41177 (Array (_ BitVec 32) (_ BitVec 64))) (size!41727 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85352)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22016 0))(
  ( (tuple2!22017 (_1!11019 (_ BitVec 64)) (_2!11019 V!50641)) )
))
(declare-datatypes ((List!29190 0))(
  ( (Nil!29187) (Cons!29186 (h!30395 tuple2!22016) (t!42754 List!29190)) )
))
(declare-datatypes ((ListLongMap!19673 0))(
  ( (ListLongMap!19674 (toList!9852 List!29190)) )
))
(declare-fun contains!7970 (ListLongMap!19673 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4916 (array!85352 array!85350 (_ BitVec 32) (_ BitVec 32) V!50641 V!50641 (_ BitVec 32) Int) ListLongMap!19673)

(assert (=> b!1288518 (= res!855827 (contains!7970 (getCurrentListMap!4916 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!855834 () Bool)

(assert (=> start!109024 (=> (not res!855834) (not e!735757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109024 (= res!855834 (validMask!0 mask!2175))))

(assert (=> start!109024 e!735757))

(assert (=> start!109024 tp_is_empty!34153))

(assert (=> start!109024 true))

(declare-fun e!735755 () Bool)

(declare-fun array_inv!31221 (array!85350) Bool)

(assert (=> start!109024 (and (array_inv!31221 _values!1445) e!735755)))

(declare-fun array_inv!31222 (array!85352) Bool)

(assert (=> start!109024 (array_inv!31222 _keys!1741)))

(assert (=> start!109024 tp!100658))

(declare-fun mapNonEmpty!52790 () Bool)

(declare-fun mapRes!52790 () Bool)

(declare-fun tp!100657 () Bool)

(assert (=> mapNonEmpty!52790 (= mapRes!52790 (and tp!100657 e!735758))))

(declare-fun mapKey!52790 () (_ BitVec 32))

(declare-fun mapRest!52790 () (Array (_ BitVec 32) ValueCell!16178))

(declare-fun mapValue!52790 () ValueCell!16178)

(assert (=> mapNonEmpty!52790 (= (arr!41176 _values!1445) (store mapRest!52790 mapKey!52790 mapValue!52790))))

(declare-fun b!1288519 () Bool)

(declare-fun e!735753 () Bool)

(assert (=> b!1288519 (= e!735753 true)))

(declare-fun lt!578012 () ListLongMap!19673)

(declare-fun +!4327 (ListLongMap!19673 tuple2!22016) ListLongMap!19673)

(assert (=> b!1288519 (not (contains!7970 (+!4327 lt!578012 (tuple2!22017 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-datatypes ((Unit!42624 0))(
  ( (Unit!42625) )
))
(declare-fun lt!578011 () Unit!42624)

(declare-fun addStillNotContains!345 (ListLongMap!19673 (_ BitVec 64) V!50641 (_ BitVec 64)) Unit!42624)

(assert (=> b!1288519 (= lt!578011 (addStillNotContains!345 lt!578012 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5958 (array!85352 array!85350 (_ BitVec 32) (_ BitVec 32) V!50641 V!50641 (_ BitVec 32) Int) ListLongMap!19673)

(assert (=> b!1288519 (= lt!578012 (getCurrentListMapNoExtraKeys!5958 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1288520 () Bool)

(declare-fun e!735754 () Bool)

(assert (=> b!1288520 (= e!735754 tp_is_empty!34153)))

(declare-fun b!1288521 () Bool)

(assert (=> b!1288521 (= e!735757 (not e!735753))))

(declare-fun res!855830 () Bool)

(assert (=> b!1288521 (=> res!855830 e!735753)))

(assert (=> b!1288521 (= res!855830 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288521 (not (contains!7970 (ListLongMap!19674 Nil!29187) k!1205))))

(declare-fun lt!578010 () Unit!42624)

(declare-fun emptyContainsNothing!41 ((_ BitVec 64)) Unit!42624)

(assert (=> b!1288521 (= lt!578010 (emptyContainsNothing!41 k!1205))))

(declare-fun b!1288522 () Bool)

(declare-fun res!855832 () Bool)

(assert (=> b!1288522 (=> (not res!855832) (not e!735757))))

(assert (=> b!1288522 (= res!855832 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41727 _keys!1741))))))

(declare-fun b!1288523 () Bool)

(declare-fun res!855829 () Bool)

(assert (=> b!1288523 (=> (not res!855829) (not e!735757))))

(declare-datatypes ((List!29191 0))(
  ( (Nil!29188) (Cons!29187 (h!30396 (_ BitVec 64)) (t!42755 List!29191)) )
))
(declare-fun arrayNoDuplicates!0 (array!85352 (_ BitVec 32) List!29191) Bool)

(assert (=> b!1288523 (= res!855829 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29188))))

(declare-fun b!1288524 () Bool)

(assert (=> b!1288524 (= e!735755 (and e!735754 mapRes!52790))))

(declare-fun condMapEmpty!52790 () Bool)

(declare-fun mapDefault!52790 () ValueCell!16178)

