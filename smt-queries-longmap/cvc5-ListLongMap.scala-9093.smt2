; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109342 () Bool)

(assert start!109342)

(declare-fun b_free!28831 () Bool)

(declare-fun b_next!28831 () Bool)

(assert (=> start!109342 (= b_free!28831 (not b_next!28831))))

(declare-fun tp!101611 () Bool)

(declare-fun b_and!46921 () Bool)

(assert (=> start!109342 (= tp!101611 b_and!46921)))

(declare-fun b!1294140 () Bool)

(declare-fun res!860024 () Bool)

(declare-fun e!738515 () Bool)

(assert (=> b!1294140 (=> (not res!860024) (not e!738515))))

(declare-datatypes ((array!85964 0))(
  ( (array!85965 (arr!41483 (Array (_ BitVec 32) (_ BitVec 64))) (size!42033 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85964)

(declare-datatypes ((List!29424 0))(
  ( (Nil!29421) (Cons!29420 (h!30629 (_ BitVec 64)) (t!42988 List!29424)) )
))
(declare-fun arrayNoDuplicates!0 (array!85964 (_ BitVec 32) List!29424) Bool)

(assert (=> b!1294140 (= res!860024 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29421))))

(declare-fun b!1294141 () Bool)

(declare-fun e!738517 () Bool)

(declare-fun e!738514 () Bool)

(declare-fun mapRes!53267 () Bool)

(assert (=> b!1294141 (= e!738517 (and e!738514 mapRes!53267))))

(declare-fun condMapEmpty!53267 () Bool)

(declare-datatypes ((V!51065 0))(
  ( (V!51066 (val!17310 Int)) )
))
(declare-datatypes ((ValueCell!16337 0))(
  ( (ValueCellFull!16337 (v!19913 V!51065)) (EmptyCell!16337) )
))
(declare-datatypes ((array!85966 0))(
  ( (array!85967 (arr!41484 (Array (_ BitVec 32) ValueCell!16337)) (size!42034 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85966)

(declare-fun mapDefault!53267 () ValueCell!16337)

