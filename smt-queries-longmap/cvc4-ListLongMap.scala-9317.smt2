; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111342 () Bool)

(assert start!111342)

(declare-fun b!1317519 () Bool)

(declare-fun e!751834 () Bool)

(declare-fun e!751831 () Bool)

(declare-fun mapRes!55376 () Bool)

(assert (=> b!1317519 (= e!751834 (and e!751831 mapRes!55376))))

(declare-fun condMapEmpty!55376 () Bool)

(declare-datatypes ((V!52861 0))(
  ( (V!52862 (val!17984 Int)) )
))
(declare-datatypes ((ValueCell!17011 0))(
  ( (ValueCellFull!17011 (v!20614 V!52861)) (EmptyCell!17011) )
))
(declare-datatypes ((array!88594 0))(
  ( (array!88595 (arr!42771 (Array (_ BitVec 32) ValueCell!17011)) (size!43321 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88594)

(declare-fun mapDefault!55376 () ValueCell!17011)

