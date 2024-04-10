; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108790 () Bool)

(assert start!108790)

(declare-fun b_free!28303 () Bool)

(declare-fun b_next!28303 () Bool)

(assert (=> start!108790 (= b_free!28303 (not b_next!28303))))

(declare-fun tp!100024 () Bool)

(declare-fun b_and!46369 () Bool)

(assert (=> start!108790 (= tp!100024 b_and!46369)))

(declare-fun b!1284668 () Bool)

(declare-fun e!733835 () Bool)

(assert (=> b!1284668 (= e!733835 false)))

(declare-datatypes ((V!50361 0))(
  ( (V!50362 (val!17046 Int)) )
))
(declare-fun minValue!1387 () V!50361)

(declare-fun zeroValue!1387 () V!50361)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576841 () Bool)

(declare-datatypes ((ValueCell!16073 0))(
  ( (ValueCellFull!16073 (v!19648 V!50361)) (EmptyCell!16073) )
))
(declare-datatypes ((array!84944 0))(
  ( (array!84945 (arr!40974 (Array (_ BitVec 32) ValueCell!16073)) (size!41524 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84944)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84946 0))(
  ( (array!84947 (arr!40975 (Array (_ BitVec 32) (_ BitVec 64))) (size!41525 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84946)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21842 0))(
  ( (tuple2!21843 (_1!10932 (_ BitVec 64)) (_2!10932 V!50361)) )
))
(declare-datatypes ((List!29036 0))(
  ( (Nil!29033) (Cons!29032 (h!30241 tuple2!21842) (t!42580 List!29036)) )
))
(declare-datatypes ((ListLongMap!19499 0))(
  ( (ListLongMap!19500 (toList!9765 List!29036)) )
))
(declare-fun contains!7882 (ListLongMap!19499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4844 (array!84946 array!84944 (_ BitVec 32) (_ BitVec 32) V!50361 V!50361 (_ BitVec 32) Int) ListLongMap!19499)

(assert (=> b!1284668 (= lt!576841 (contains!7882 (getCurrentListMap!4844 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!853414 () Bool)

(assert (=> start!108790 (=> (not res!853414) (not e!733835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108790 (= res!853414 (validMask!0 mask!2175))))

(assert (=> start!108790 e!733835))

(declare-fun tp_is_empty!33943 () Bool)

(assert (=> start!108790 tp_is_empty!33943))

(assert (=> start!108790 true))

(declare-fun e!733834 () Bool)

(declare-fun array_inv!31077 (array!84944) Bool)

(assert (=> start!108790 (and (array_inv!31077 _values!1445) e!733834)))

(declare-fun array_inv!31078 (array!84946) Bool)

(assert (=> start!108790 (array_inv!31078 _keys!1741)))

(assert (=> start!108790 tp!100024))

(declare-fun b!1284669 () Bool)

(declare-fun e!733831 () Bool)

(declare-fun mapRes!52472 () Bool)

(assert (=> b!1284669 (= e!733834 (and e!733831 mapRes!52472))))

(declare-fun condMapEmpty!52472 () Bool)

(declare-fun mapDefault!52472 () ValueCell!16073)

