; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108682 () Bool)

(assert start!108682)

(declare-fun b_free!28195 () Bool)

(declare-fun b_next!28195 () Bool)

(assert (=> start!108682 (= b_free!28195 (not b_next!28195))))

(declare-fun tp!99701 () Bool)

(declare-fun b_and!46261 () Bool)

(assert (=> start!108682 (= tp!99701 b_and!46261)))

(declare-fun b!1282948 () Bool)

(declare-fun e!733023 () Bool)

(declare-fun e!733021 () Bool)

(declare-fun mapRes!52310 () Bool)

(assert (=> b!1282948 (= e!733023 (and e!733021 mapRes!52310))))

(declare-fun condMapEmpty!52310 () Bool)

(declare-datatypes ((V!50217 0))(
  ( (V!50218 (val!16992 Int)) )
))
(declare-datatypes ((ValueCell!16019 0))(
  ( (ValueCellFull!16019 (v!19594 V!50217)) (EmptyCell!16019) )
))
(declare-datatypes ((array!84736 0))(
  ( (array!84737 (arr!40870 (Array (_ BitVec 32) ValueCell!16019)) (size!41420 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84736)

(declare-fun mapDefault!52310 () ValueCell!16019)

