; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82892 () Bool)

(assert start!82892)

(declare-fun b_free!19019 () Bool)

(declare-fun b_next!19019 () Bool)

(assert (=> start!82892 (= b_free!19019 (not b_next!19019))))

(declare-fun tp!66185 () Bool)

(declare-fun b_and!30507 () Bool)

(assert (=> start!82892 (= tp!66185 b_and!30507)))

(declare-fun b!967152 () Bool)

(declare-fun res!647405 () Bool)

(declare-fun e!545153 () Bool)

(assert (=> b!967152 (=> (not res!647405) (not e!545153))))

(declare-datatypes ((array!59729 0))(
  ( (array!59730 (arr!28733 (Array (_ BitVec 32) (_ BitVec 64))) (size!29212 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59729)

(declare-datatypes ((List!19948 0))(
  ( (Nil!19945) (Cons!19944 (h!21106 (_ BitVec 64)) (t!28311 List!19948)) )
))
(declare-fun arrayNoDuplicates!0 (array!59729 (_ BitVec 32) List!19948) Bool)

(assert (=> b!967152 (= res!647405 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19945))))

(declare-fun b!967153 () Bool)

(declare-fun e!545152 () Bool)

(declare-fun e!545156 () Bool)

(declare-fun mapRes!34735 () Bool)

(assert (=> b!967153 (= e!545152 (and e!545156 mapRes!34735))))

(declare-fun condMapEmpty!34735 () Bool)

(declare-datatypes ((V!34085 0))(
  ( (V!34086 (val!10964 Int)) )
))
(declare-datatypes ((ValueCell!10432 0))(
  ( (ValueCellFull!10432 (v!13522 V!34085)) (EmptyCell!10432) )
))
(declare-datatypes ((array!59731 0))(
  ( (array!59732 (arr!28734 (Array (_ BitVec 32) ValueCell!10432)) (size!29213 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59731)

(declare-fun mapDefault!34735 () ValueCell!10432)

