; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84124 () Bool)

(assert start!84124)

(declare-fun b!983608 () Bool)

(declare-fun e!554505 () Bool)

(declare-fun e!554502 () Bool)

(declare-fun mapRes!36419 () Bool)

(assert (=> b!983608 (= e!554505 (and e!554502 mapRes!36419))))

(declare-fun condMapEmpty!36419 () Bool)

(declare-datatypes ((V!35553 0))(
  ( (V!35554 (val!11514 Int)) )
))
(declare-datatypes ((ValueCell!10982 0))(
  ( (ValueCellFull!10982 (v!14076 V!35553)) (EmptyCell!10982) )
))
(declare-datatypes ((array!61841 0))(
  ( (array!61842 (arr!29778 (Array (_ BitVec 32) ValueCell!10982)) (size!30257 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61841)

(declare-fun mapDefault!36419 () ValueCell!10982)

