; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109330 () Bool)

(assert start!109330)

(declare-fun b_free!28819 () Bool)

(declare-fun b_next!28819 () Bool)

(assert (=> start!109330 (= b_free!28819 (not b_next!28819))))

(declare-fun tp!101575 () Bool)

(declare-fun b_and!46909 () Bool)

(assert (=> start!109330 (= tp!101575 b_and!46909)))

(declare-fun b!1293942 () Bool)

(declare-fun e!738425 () Bool)

(declare-fun e!738428 () Bool)

(declare-fun mapRes!53249 () Bool)

(assert (=> b!1293942 (= e!738425 (and e!738428 mapRes!53249))))

(declare-fun condMapEmpty!53249 () Bool)

(declare-datatypes ((V!51049 0))(
  ( (V!51050 (val!17304 Int)) )
))
(declare-datatypes ((ValueCell!16331 0))(
  ( (ValueCellFull!16331 (v!19907 V!51049)) (EmptyCell!16331) )
))
(declare-datatypes ((array!85944 0))(
  ( (array!85945 (arr!41473 (Array (_ BitVec 32) ValueCell!16331)) (size!42023 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85944)

(declare-fun mapDefault!53249 () ValueCell!16331)

