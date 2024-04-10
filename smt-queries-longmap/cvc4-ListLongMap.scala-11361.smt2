; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132074 () Bool)

(assert start!132074)

(declare-fun b_free!31787 () Bool)

(declare-fun b_next!31787 () Bool)

(assert (=> start!132074 (= b_free!31787 (not b_next!31787))))

(declare-fun tp!111612 () Bool)

(declare-fun b_and!51197 () Bool)

(assert (=> start!132074 (= tp!111612 b_and!51197)))

(declare-fun b!1548329 () Bool)

(declare-fun res!1061076 () Bool)

(declare-fun e!861855 () Bool)

(assert (=> b!1548329 (=> (not res!1061076) (not e!861855))))

(declare-datatypes ((array!103326 0))(
  ( (array!103327 (arr!49865 (Array (_ BitVec 32) (_ BitVec 64))) (size!50415 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103326)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1548329 (= res!1061076 (validKeyInArray!0 (select (arr!49865 _keys!618) from!762)))))

(declare-fun b!1548330 () Bool)

(declare-fun e!861848 () Bool)

(declare-fun e!861850 () Bool)

(declare-fun mapRes!58798 () Bool)

(assert (=> b!1548330 (= e!861848 (and e!861850 mapRes!58798))))

(declare-fun condMapEmpty!58798 () Bool)

(declare-datatypes ((V!59193 0))(
  ( (V!59194 (val!19109 Int)) )
))
(declare-datatypes ((ValueCell!18121 0))(
  ( (ValueCellFull!18121 (v!21910 V!59193)) (EmptyCell!18121) )
))
(declare-datatypes ((array!103328 0))(
  ( (array!103329 (arr!49866 (Array (_ BitVec 32) ValueCell!18121)) (size!50416 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103328)

(declare-fun mapDefault!58798 () ValueCell!18121)

