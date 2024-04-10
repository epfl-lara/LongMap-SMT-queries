; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109202 () Bool)

(assert start!109202)

(declare-fun b_free!28691 () Bool)

(declare-fun b_next!28691 () Bool)

(assert (=> start!109202 (= b_free!28691 (not b_next!28691))))

(declare-fun tp!101191 () Bool)

(declare-fun b_and!46781 () Bool)

(assert (=> start!109202 (= tp!101191 b_and!46781)))

(declare-fun b!1291721 () Bool)

(declare-fun res!858232 () Bool)

(declare-fun e!737357 () Bool)

(assert (=> b!1291721 (=> (not res!858232) (not e!737357))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50877 0))(
  ( (V!50878 (val!17240 Int)) )
))
(declare-datatypes ((ValueCell!16267 0))(
  ( (ValueCellFull!16267 (v!19843 V!50877)) (EmptyCell!16267) )
))
(declare-datatypes ((array!85698 0))(
  ( (array!85699 (arr!41350 (Array (_ BitVec 32) ValueCell!16267)) (size!41900 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85698)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85700 0))(
  ( (array!85701 (arr!41351 (Array (_ BitVec 32) (_ BitVec 64))) (size!41901 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85700)

(assert (=> b!1291721 (= res!858232 (and (= (size!41900 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41901 _keys!1741) (size!41900 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291722 () Bool)

(declare-fun e!737360 () Bool)

(assert (=> b!1291722 (= e!737357 (not e!737360))))

(declare-fun res!858231 () Bool)

(assert (=> b!1291722 (=> res!858231 e!737360)))

(assert (=> b!1291722 (= res!858231 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22172 0))(
  ( (tuple2!22173 (_1!11097 (_ BitVec 64)) (_2!11097 V!50877)) )
))
(declare-datatypes ((List!29327 0))(
  ( (Nil!29324) (Cons!29323 (h!30532 tuple2!22172) (t!42891 List!29327)) )
))
(declare-datatypes ((ListLongMap!19829 0))(
  ( (ListLongMap!19830 (toList!9930 List!29327)) )
))
(declare-fun contains!8048 (ListLongMap!19829 (_ BitVec 64)) Bool)

(assert (=> b!1291722 (not (contains!8048 (ListLongMap!19830 Nil!29324) k!1205))))

(declare-datatypes ((Unit!42770 0))(
  ( (Unit!42771) )
))
(declare-fun lt!579270 () Unit!42770)

(declare-fun emptyContainsNothing!107 ((_ BitVec 64)) Unit!42770)

(assert (=> b!1291722 (= lt!579270 (emptyContainsNothing!107 k!1205))))

(declare-fun b!1291723 () Bool)

(declare-fun res!858235 () Bool)

(assert (=> b!1291723 (=> (not res!858235) (not e!737357))))

(declare-fun minValue!1387 () V!50877)

(declare-fun zeroValue!1387 () V!50877)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4978 (array!85700 array!85698 (_ BitVec 32) (_ BitVec 32) V!50877 V!50877 (_ BitVec 32) Int) ListLongMap!19829)

(assert (=> b!1291723 (= res!858235 (contains!8048 (getCurrentListMap!4978 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1291724 () Bool)

(declare-fun e!737359 () Bool)

(declare-fun tp_is_empty!34331 () Bool)

(assert (=> b!1291724 (= e!737359 tp_is_empty!34331)))

(declare-fun b!1291725 () Bool)

(declare-fun e!737355 () Bool)

(declare-fun e!737356 () Bool)

(declare-fun mapRes!53057 () Bool)

(assert (=> b!1291725 (= e!737355 (and e!737356 mapRes!53057))))

(declare-fun condMapEmpty!53057 () Bool)

(declare-fun mapDefault!53057 () ValueCell!16267)

