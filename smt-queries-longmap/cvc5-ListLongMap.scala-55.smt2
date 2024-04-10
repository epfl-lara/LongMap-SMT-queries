; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!842 () Bool)

(assert start!842)

(declare-fun b_free!235 () Bool)

(declare-fun b_next!235 () Bool)

(assert (=> start!842 (= b_free!235 (not b_next!235))))

(declare-fun tp!934 () Bool)

(declare-fun b_and!381 () Bool)

(assert (=> start!842 (= tp!934 b_and!381)))

(declare-fun b!6745 () Bool)

(declare-fun res!7015 () Bool)

(declare-fun e!3730 () Bool)

(assert (=> b!6745 (=> (not res!7015) (not e!3730))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6745 (= res!7015 (validKeyInArray!0 k!1278))))

(declare-fun mapIsEmpty!440 () Bool)

(declare-fun mapRes!440 () Bool)

(assert (=> mapIsEmpty!440 mapRes!440))

(declare-fun b!6746 () Bool)

(declare-fun e!3726 () Bool)

(declare-fun e!3729 () Bool)

(assert (=> b!6746 (= e!3726 (and e!3729 mapRes!440))))

(declare-fun condMapEmpty!440 () Bool)

(declare-datatypes ((V!595 0))(
  ( (V!596 (val!162 Int)) )
))
(declare-datatypes ((ValueCell!140 0))(
  ( (ValueCellFull!140 (v!1253 V!595)) (EmptyCell!140) )
))
(declare-datatypes ((array!559 0))(
  ( (array!560 (arr!268 (Array (_ BitVec 32) ValueCell!140)) (size!330 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!559)

(declare-fun mapDefault!440 () ValueCell!140)

