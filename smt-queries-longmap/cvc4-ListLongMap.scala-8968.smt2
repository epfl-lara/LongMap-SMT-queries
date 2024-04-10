; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108538 () Bool)

(assert start!108538)

(declare-fun b_free!28085 () Bool)

(declare-fun b_next!28085 () Bool)

(assert (=> start!108538 (= b_free!28085 (not b_next!28085))))

(declare-fun tp!99364 () Bool)

(declare-fun b_and!46145 () Bool)

(assert (=> start!108538 (= tp!99364 b_and!46145)))

(declare-fun b!1281175 () Bool)

(declare-fun e!732002 () Bool)

(assert (=> b!1281175 (= e!732002 (not true))))

(declare-datatypes ((V!50069 0))(
  ( (V!50070 (val!16937 Int)) )
))
(declare-fun minValue!1387 () V!50069)

(declare-fun zeroValue!1387 () V!50069)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15964 0))(
  ( (ValueCellFull!15964 (v!19537 V!50069)) (EmptyCell!15964) )
))
(declare-datatypes ((array!84520 0))(
  ( (array!84521 (arr!40764 (Array (_ BitVec 32) ValueCell!15964)) (size!41314 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84520)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84522 0))(
  ( (array!84523 (arr!40765 (Array (_ BitVec 32) (_ BitVec 64))) (size!41315 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84522)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21682 0))(
  ( (tuple2!21683 (_1!10852 (_ BitVec 64)) (_2!10852 V!50069)) )
))
(declare-datatypes ((List!28878 0))(
  ( (Nil!28875) (Cons!28874 (h!30083 tuple2!21682) (t!42418 List!28878)) )
))
(declare-datatypes ((ListLongMap!19339 0))(
  ( (ListLongMap!19340 (toList!9685 List!28878)) )
))
(declare-fun contains!7800 (ListLongMap!19339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4769 (array!84522 array!84520 (_ BitVec 32) (_ BitVec 32) V!50069 V!50069 (_ BitVec 32) Int) ListLongMap!19339)

(assert (=> b!1281175 (contains!7800 (getCurrentListMap!4769 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42427 0))(
  ( (Unit!42428) )
))
(declare-fun lt!576200 () Unit!42427)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!18 (array!84522 array!84520 (_ BitVec 32) (_ BitVec 32) V!50069 V!50069 (_ BitVec 64) (_ BitVec 32) Int) Unit!42427)

(assert (=> b!1281175 (= lt!576200 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!18 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1281177 () Bool)

(declare-fun e!732001 () Bool)

(declare-fun e!732003 () Bool)

(declare-fun mapRes!52139 () Bool)

(assert (=> b!1281177 (= e!732001 (and e!732003 mapRes!52139))))

(declare-fun condMapEmpty!52139 () Bool)

(declare-fun mapDefault!52139 () ValueCell!15964)

