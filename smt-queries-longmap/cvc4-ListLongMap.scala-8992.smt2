; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108716 () Bool)

(assert start!108716)

(declare-fun b_free!28229 () Bool)

(declare-fun b_next!28229 () Bool)

(assert (=> start!108716 (= b_free!28229 (not b_next!28229))))

(declare-fun tp!99803 () Bool)

(declare-fun b_and!46295 () Bool)

(assert (=> start!108716 (= tp!99803 b_and!46295)))

(declare-fun b!1283561 () Bool)

(declare-fun res!852639 () Bool)

(declare-fun e!733276 () Bool)

(assert (=> b!1283561 (=> (not res!852639) (not e!733276))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84800 0))(
  ( (array!84801 (arr!40902 (Array (_ BitVec 32) (_ BitVec 64))) (size!41452 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84800)

(assert (=> b!1283561 (= res!852639 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41452 _keys!1741))))))

(declare-fun b!1283562 () Bool)

(declare-fun e!733280 () Bool)

(declare-fun e!733278 () Bool)

(declare-fun mapRes!52361 () Bool)

(assert (=> b!1283562 (= e!733280 (and e!733278 mapRes!52361))))

(declare-fun condMapEmpty!52361 () Bool)

(declare-datatypes ((V!50261 0))(
  ( (V!50262 (val!17009 Int)) )
))
(declare-datatypes ((ValueCell!16036 0))(
  ( (ValueCellFull!16036 (v!19611 V!50261)) (EmptyCell!16036) )
))
(declare-datatypes ((array!84802 0))(
  ( (array!84803 (arr!40903 (Array (_ BitVec 32) ValueCell!16036)) (size!41453 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84802)

(declare-fun mapDefault!52361 () ValueCell!16036)

