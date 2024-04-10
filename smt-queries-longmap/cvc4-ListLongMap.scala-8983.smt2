; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108662 () Bool)

(assert start!108662)

(declare-fun b_free!28175 () Bool)

(declare-fun b_next!28175 () Bool)

(assert (=> start!108662 (= b_free!28175 (not b_next!28175))))

(declare-fun tp!99641 () Bool)

(declare-fun b_and!46241 () Bool)

(assert (=> start!108662 (= tp!99641 b_and!46241)))

(declare-fun b!1282637 () Bool)

(declare-fun e!732871 () Bool)

(declare-fun e!732872 () Bool)

(declare-fun mapRes!52280 () Bool)

(assert (=> b!1282637 (= e!732871 (and e!732872 mapRes!52280))))

(declare-fun condMapEmpty!52280 () Bool)

(declare-datatypes ((V!50189 0))(
  ( (V!50190 (val!16982 Int)) )
))
(declare-datatypes ((ValueCell!16009 0))(
  ( (ValueCellFull!16009 (v!19584 V!50189)) (EmptyCell!16009) )
))
(declare-datatypes ((array!84700 0))(
  ( (array!84701 (arr!40852 (Array (_ BitVec 32) ValueCell!16009)) (size!41402 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84700)

(declare-fun mapDefault!52280 () ValueCell!16009)

