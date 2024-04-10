; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108382 () Bool)

(assert start!108382)

(declare-fun b_free!27929 () Bool)

(declare-fun b_next!27929 () Bool)

(assert (=> start!108382 (= b_free!27929 (not b_next!27929))))

(declare-fun tp!98897 () Bool)

(declare-fun b_and!45989 () Bool)

(assert (=> start!108382 (= tp!98897 b_and!45989)))

(declare-fun b!1279152 () Bool)

(declare-fun e!730835 () Bool)

(declare-fun tp_is_empty!33569 () Bool)

(assert (=> b!1279152 (= e!730835 tp_is_empty!33569)))

(declare-fun b!1279153 () Bool)

(declare-fun e!730834 () Bool)

(assert (=> b!1279153 (= e!730834 false)))

(declare-datatypes ((V!49861 0))(
  ( (V!49862 (val!16859 Int)) )
))
(declare-fun minValue!1387 () V!49861)

(declare-fun zeroValue!1387 () V!49861)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575975 () Bool)

(declare-datatypes ((ValueCell!15886 0))(
  ( (ValueCellFull!15886 (v!19459 V!49861)) (EmptyCell!15886) )
))
(declare-datatypes ((array!84226 0))(
  ( (array!84227 (arr!40617 (Array (_ BitVec 32) ValueCell!15886)) (size!41167 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84226)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84228 0))(
  ( (array!84229 (arr!40618 (Array (_ BitVec 32) (_ BitVec 64))) (size!41168 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84228)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21568 0))(
  ( (tuple2!21569 (_1!10795 (_ BitVec 64)) (_2!10795 V!49861)) )
))
(declare-datatypes ((List!28767 0))(
  ( (Nil!28764) (Cons!28763 (h!29972 tuple2!21568) (t!42307 List!28767)) )
))
(declare-datatypes ((ListLongMap!19225 0))(
  ( (ListLongMap!19226 (toList!9628 List!28767)) )
))
(declare-fun contains!7743 (ListLongMap!19225 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4712 (array!84228 array!84226 (_ BitVec 32) (_ BitVec 32) V!49861 V!49861 (_ BitVec 32) Int) ListLongMap!19225)

(assert (=> b!1279153 (= lt!575975 (contains!7743 (getCurrentListMap!4712 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!849729 () Bool)

(assert (=> start!108382 (=> (not res!849729) (not e!730834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108382 (= res!849729 (validMask!0 mask!2175))))

(assert (=> start!108382 e!730834))

(assert (=> start!108382 tp_is_empty!33569))

(assert (=> start!108382 true))

(declare-fun e!730832 () Bool)

(declare-fun array_inv!30839 (array!84226) Bool)

(assert (=> start!108382 (and (array_inv!30839 _values!1445) e!730832)))

(declare-fun array_inv!30840 (array!84228) Bool)

(assert (=> start!108382 (array_inv!30840 _keys!1741)))

(assert (=> start!108382 tp!98897))

(declare-fun mapIsEmpty!51905 () Bool)

(declare-fun mapRes!51905 () Bool)

(assert (=> mapIsEmpty!51905 mapRes!51905))

(declare-fun b!1279154 () Bool)

(declare-fun res!849731 () Bool)

(assert (=> b!1279154 (=> (not res!849731) (not e!730834))))

(declare-datatypes ((List!28768 0))(
  ( (Nil!28765) (Cons!28764 (h!29973 (_ BitVec 64)) (t!42308 List!28768)) )
))
(declare-fun arrayNoDuplicates!0 (array!84228 (_ BitVec 32) List!28768) Bool)

(assert (=> b!1279154 (= res!849731 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28765))))

(declare-fun b!1279155 () Bool)

(declare-fun e!730833 () Bool)

(assert (=> b!1279155 (= e!730833 tp_is_empty!33569)))

(declare-fun b!1279156 () Bool)

(declare-fun res!849730 () Bool)

(assert (=> b!1279156 (=> (not res!849730) (not e!730834))))

(assert (=> b!1279156 (= res!849730 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41168 _keys!1741))))))

(declare-fun b!1279157 () Bool)

(assert (=> b!1279157 (= e!730832 (and e!730833 mapRes!51905))))

(declare-fun condMapEmpty!51905 () Bool)

(declare-fun mapDefault!51905 () ValueCell!15886)

