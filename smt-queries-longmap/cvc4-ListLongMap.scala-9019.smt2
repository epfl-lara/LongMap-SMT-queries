; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108878 () Bool)

(assert start!108878)

(declare-fun b_free!28391 () Bool)

(declare-fun b_next!28391 () Bool)

(assert (=> start!108878 (= b_free!28391 (not b_next!28391))))

(declare-fun tp!100288 () Bool)

(declare-fun b_and!46457 () Bool)

(assert (=> start!108878 (= tp!100288 b_and!46457)))

(declare-fun b!1285882 () Bool)

(declare-fun e!734492 () Bool)

(declare-fun tp_is_empty!34031 () Bool)

(assert (=> b!1285882 (= e!734492 tp_is_empty!34031)))

(declare-fun b!1285883 () Bool)

(declare-fun res!854231 () Bool)

(declare-fun e!734493 () Bool)

(assert (=> b!1285883 (=> (not res!854231) (not e!734493))))

(declare-datatypes ((array!85116 0))(
  ( (array!85117 (arr!41060 (Array (_ BitVec 32) (_ BitVec 64))) (size!41610 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85116)

(declare-datatypes ((List!29098 0))(
  ( (Nil!29095) (Cons!29094 (h!30303 (_ BitVec 64)) (t!42642 List!29098)) )
))
(declare-fun arrayNoDuplicates!0 (array!85116 (_ BitVec 32) List!29098) Bool)

(assert (=> b!1285883 (= res!854231 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29095))))

(declare-fun b!1285884 () Bool)

(declare-fun res!854234 () Bool)

(assert (=> b!1285884 (=> (not res!854234) (not e!734493))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1285884 (= res!854234 (validKeyInArray!0 (select (arr!41060 _keys!1741) from!2144)))))

(declare-fun b!1285885 () Bool)

(declare-fun e!734491 () Bool)

(declare-fun e!734495 () Bool)

(declare-fun mapRes!52604 () Bool)

(assert (=> b!1285885 (= e!734491 (and e!734495 mapRes!52604))))

(declare-fun condMapEmpty!52604 () Bool)

(declare-datatypes ((V!50477 0))(
  ( (V!50478 (val!17090 Int)) )
))
(declare-datatypes ((ValueCell!16117 0))(
  ( (ValueCellFull!16117 (v!19692 V!50477)) (EmptyCell!16117) )
))
(declare-datatypes ((array!85118 0))(
  ( (array!85119 (arr!41061 (Array (_ BitVec 32) ValueCell!16117)) (size!41611 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85118)

(declare-fun mapDefault!52604 () ValueCell!16117)

