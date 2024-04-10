; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133708 () Bool)

(assert start!133708)

(declare-fun b_free!32071 () Bool)

(declare-fun b_next!32071 () Bool)

(assert (=> start!133708 (= b_free!32071 (not b_next!32071))))

(declare-fun tp!113417 () Bool)

(declare-fun b_and!51641 () Bool)

(assert (=> start!133708 (= tp!113417 b_and!51641)))

(declare-fun b!1563335 () Bool)

(declare-fun e!871292 () Bool)

(declare-fun e!871293 () Bool)

(declare-fun mapRes!59562 () Bool)

(assert (=> b!1563335 (= e!871292 (and e!871293 mapRes!59562))))

(declare-fun condMapEmpty!59562 () Bool)

(declare-datatypes ((V!59929 0))(
  ( (V!59930 (val!19479 Int)) )
))
(declare-datatypes ((ValueCell!18365 0))(
  ( (ValueCellFull!18365 (v!22231 V!59929)) (EmptyCell!18365) )
))
(declare-datatypes ((array!104280 0))(
  ( (array!104281 (arr!50332 (Array (_ BitVec 32) ValueCell!18365)) (size!50882 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104280)

(declare-fun mapDefault!59562 () ValueCell!18365)

