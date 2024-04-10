; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84458 () Bool)

(assert start!84458)

(declare-fun b_free!20009 () Bool)

(declare-fun b_next!20009 () Bool)

(assert (=> start!84458 (= b_free!20009 (not b_next!20009))))

(declare-fun tp!69808 () Bool)

(declare-fun b_and!32085 () Bool)

(assert (=> start!84458 (= tp!69808 b_and!32085)))

(declare-fun b!987875 () Bool)

(declare-fun e!557037 () Bool)

(declare-fun e!557033 () Bool)

(declare-fun mapRes!36872 () Bool)

(assert (=> b!987875 (= e!557037 (and e!557033 mapRes!36872))))

(declare-fun condMapEmpty!36872 () Bool)

(declare-datatypes ((V!35949 0))(
  ( (V!35950 (val!11663 Int)) )
))
(declare-datatypes ((ValueCell!11131 0))(
  ( (ValueCellFull!11131 (v!14227 V!35949)) (EmptyCell!11131) )
))
(declare-datatypes ((array!62409 0))(
  ( (array!62410 (arr!30060 (Array (_ BitVec 32) ValueCell!11131)) (size!30539 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62409)

(declare-fun mapDefault!36872 () ValueCell!11131)

