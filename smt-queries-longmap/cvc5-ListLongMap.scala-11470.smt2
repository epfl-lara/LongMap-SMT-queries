; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133618 () Bool)

(assert start!133618)

(declare-fun b_free!32035 () Bool)

(declare-fun b_next!32035 () Bool)

(assert (=> start!133618 (= b_free!32035 (not b_next!32035))))

(declare-fun tp!113229 () Bool)

(declare-fun b_and!51581 () Bool)

(assert (=> start!133618 (= tp!113229 b_and!51581)))

(declare-fun b!1562292 () Bool)

(declare-fun res!1068158 () Bool)

(declare-fun e!870598 () Bool)

(assert (=> b!1562292 (=> (not res!1068158) (not e!870598))))

(declare-datatypes ((array!104118 0))(
  ( (array!104119 (arr!50251 (Array (_ BitVec 32) (_ BitVec 64))) (size!50801 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104118)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104118 (_ BitVec 32)) Bool)

(assert (=> b!1562292 (= res!1068158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562294 () Bool)

(declare-fun e!870595 () Bool)

(declare-fun e!870596 () Bool)

(declare-fun mapRes!59427 () Bool)

(assert (=> b!1562294 (= e!870595 (and e!870596 mapRes!59427))))

(declare-fun condMapEmpty!59427 () Bool)

(declare-datatypes ((V!59809 0))(
  ( (V!59810 (val!19434 Int)) )
))
(declare-datatypes ((ValueCell!18320 0))(
  ( (ValueCellFull!18320 (v!22186 V!59809)) (EmptyCell!18320) )
))
(declare-datatypes ((array!104120 0))(
  ( (array!104121 (arr!50252 (Array (_ BitVec 32) ValueCell!18320)) (size!50802 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104120)

(declare-fun mapDefault!59427 () ValueCell!18320)

