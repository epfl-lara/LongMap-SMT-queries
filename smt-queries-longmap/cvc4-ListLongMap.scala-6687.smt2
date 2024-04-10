; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84098 () Bool)

(assert start!84098)

(declare-fun mapIsEmpty!36380 () Bool)

(declare-fun mapRes!36380 () Bool)

(assert (=> mapIsEmpty!36380 mapRes!36380))

(declare-fun b!983374 () Bool)

(declare-fun e!554309 () Bool)

(declare-fun e!554310 () Bool)

(assert (=> b!983374 (= e!554309 (and e!554310 mapRes!36380))))

(declare-fun condMapEmpty!36380 () Bool)

(declare-datatypes ((V!35517 0))(
  ( (V!35518 (val!11501 Int)) )
))
(declare-datatypes ((ValueCell!10969 0))(
  ( (ValueCellFull!10969 (v!14063 V!35517)) (EmptyCell!10969) )
))
(declare-datatypes ((array!61791 0))(
  ( (array!61792 (arr!29753 (Array (_ BitVec 32) ValueCell!10969)) (size!30232 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61791)

(declare-fun mapDefault!36380 () ValueCell!10969)

