; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98540 () Bool)

(assert start!98540)

(declare-fun b_free!24145 () Bool)

(declare-fun b_next!24145 () Bool)

(assert (=> start!98540 (= b_free!24145 (not b_next!24145))))

(declare-fun tp!85145 () Bool)

(declare-fun b_and!39139 () Bool)

(assert (=> start!98540 (= tp!85145 b_and!39139)))

(declare-fun b!1141761 () Bool)

(declare-fun e!649565 () Bool)

(declare-fun e!649571 () Bool)

(declare-fun mapRes!44837 () Bool)

(assert (=> b!1141761 (= e!649565 (and e!649571 mapRes!44837))))

(declare-fun condMapEmpty!44837 () Bool)

(declare-datatypes ((V!43361 0))(
  ( (V!43362 (val!14394 Int)) )
))
(declare-datatypes ((ValueCell!13628 0))(
  ( (ValueCellFull!13628 (v!17031 V!43361)) (EmptyCell!13628) )
))
(declare-datatypes ((array!74205 0))(
  ( (array!74206 (arr!35753 (Array (_ BitVec 32) ValueCell!13628)) (size!36289 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74205)

(declare-fun mapDefault!44837 () ValueCell!13628)

