; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109384 () Bool)

(assert start!109384)

(declare-fun b_free!28873 () Bool)

(declare-fun b_next!28873 () Bool)

(assert (=> start!109384 (= b_free!28873 (not b_next!28873))))

(declare-fun tp!101737 () Bool)

(declare-fun b_and!46963 () Bool)

(assert (=> start!109384 (= tp!101737 b_and!46963)))

(declare-fun b!1294835 () Bool)

(declare-fun e!738833 () Bool)

(declare-fun tp_is_empty!34513 () Bool)

(assert (=> b!1294835 (= e!738833 tp_is_empty!34513)))

(declare-fun mapIsEmpty!53330 () Bool)

(declare-fun mapRes!53330 () Bool)

(assert (=> mapIsEmpty!53330 mapRes!53330))

(declare-fun b!1294836 () Bool)

(declare-fun res!860529 () Bool)

(declare-fun e!738835 () Bool)

(assert (=> b!1294836 (=> (not res!860529) (not e!738835))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86046 0))(
  ( (array!86047 (arr!41524 (Array (_ BitVec 32) (_ BitVec 64))) (size!42074 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86046)

(assert (=> b!1294836 (= res!860529 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42074 _keys!1741))))))

(declare-fun b!1294837 () Bool)

(declare-fun e!738831 () Bool)

(declare-fun e!738836 () Bool)

(assert (=> b!1294837 (= e!738831 (and e!738836 mapRes!53330))))

(declare-fun condMapEmpty!53330 () Bool)

(declare-datatypes ((V!51121 0))(
  ( (V!51122 (val!17331 Int)) )
))
(declare-datatypes ((ValueCell!16358 0))(
  ( (ValueCellFull!16358 (v!19934 V!51121)) (EmptyCell!16358) )
))
(declare-datatypes ((array!86048 0))(
  ( (array!86049 (arr!41525 (Array (_ BitVec 32) ValueCell!16358)) (size!42075 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86048)

(declare-fun mapDefault!53330 () ValueCell!16358)

