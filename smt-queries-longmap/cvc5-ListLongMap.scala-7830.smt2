; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97724 () Bool)

(assert start!97724)

(declare-fun b!1117356 () Bool)

(declare-fun res!746151 () Bool)

(declare-fun e!636518 () Bool)

(assert (=> b!1117356 (=> (not res!746151) (not e!636518))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117356 (= res!746151 (validKeyInArray!0 k!934))))

(declare-fun b!1117357 () Bool)

(declare-fun e!636519 () Bool)

(declare-fun e!636515 () Bool)

(declare-fun mapRes!43750 () Bool)

(assert (=> b!1117357 (= e!636519 (and e!636515 mapRes!43750))))

(declare-fun condMapEmpty!43750 () Bool)

(declare-datatypes ((V!42401 0))(
  ( (V!42402 (val!14034 Int)) )
))
(declare-datatypes ((ValueCell!13268 0))(
  ( (ValueCellFull!13268 (v!16667 V!42401)) (EmptyCell!13268) )
))
(declare-datatypes ((array!72803 0))(
  ( (array!72804 (arr!35054 (Array (_ BitVec 32) ValueCell!13268)) (size!35590 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72803)

(declare-fun mapDefault!43750 () ValueCell!13268)

