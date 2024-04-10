; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108564 () Bool)

(assert start!108564)

(declare-fun b_free!28111 () Bool)

(declare-fun b_next!28111 () Bool)

(assert (=> start!108564 (= b_free!28111 (not b_next!28111))))

(declare-fun tp!99442 () Bool)

(declare-fun b_and!46171 () Bool)

(assert (=> start!108564 (= tp!99442 b_and!46171)))

(declare-fun mapIsEmpty!52178 () Bool)

(declare-fun mapRes!52178 () Bool)

(assert (=> mapIsEmpty!52178 mapRes!52178))

(declare-fun b!1281585 () Bool)

(declare-fun res!851346 () Bool)

(declare-fun e!732217 () Bool)

(assert (=> b!1281585 (=> (not res!851346) (not e!732217))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!84572 0))(
  ( (array!84573 (arr!40790 (Array (_ BitVec 32) (_ BitVec 64))) (size!41340 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84572)

(assert (=> b!1281585 (= res!851346 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!41340 _keys!1741)) (not (= (select (arr!40790 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1281586 () Bool)

(declare-fun res!851345 () Bool)

(assert (=> b!1281586 (=> (not res!851345) (not e!732217))))

(declare-datatypes ((V!50105 0))(
  ( (V!50106 (val!16950 Int)) )
))
(declare-fun minValue!1387 () V!50105)

(declare-fun zeroValue!1387 () V!50105)

(declare-datatypes ((ValueCell!15977 0))(
  ( (ValueCellFull!15977 (v!19550 V!50105)) (EmptyCell!15977) )
))
(declare-datatypes ((array!84574 0))(
  ( (array!84575 (arr!40791 (Array (_ BitVec 32) ValueCell!15977)) (size!41341 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84574)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21706 0))(
  ( (tuple2!21707 (_1!10864 (_ BitVec 64)) (_2!10864 V!50105)) )
))
(declare-datatypes ((List!28898 0))(
  ( (Nil!28895) (Cons!28894 (h!30103 tuple2!21706) (t!42438 List!28898)) )
))
(declare-datatypes ((ListLongMap!19363 0))(
  ( (ListLongMap!19364 (toList!9697 List!28898)) )
))
(declare-fun contains!7812 (ListLongMap!19363 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4781 (array!84572 array!84574 (_ BitVec 32) (_ BitVec 32) V!50105 V!50105 (_ BitVec 32) Int) ListLongMap!19363)

(assert (=> b!1281586 (= res!851345 (contains!7812 (getCurrentListMap!4781 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1281587 () Bool)

(declare-fun e!732221 () Bool)

(declare-fun e!732216 () Bool)

(assert (=> b!1281587 (= e!732221 (and e!732216 mapRes!52178))))

(declare-fun condMapEmpty!52178 () Bool)

(declare-fun mapDefault!52178 () ValueCell!15977)

