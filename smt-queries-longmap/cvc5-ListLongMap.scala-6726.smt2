; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84328 () Bool)

(assert start!84328)

(declare-fun b!986452 () Bool)

(declare-fun e!556196 () Bool)

(declare-fun e!556195 () Bool)

(declare-fun mapRes!36725 () Bool)

(assert (=> b!986452 (= e!556196 (and e!556195 mapRes!36725))))

(declare-fun condMapEmpty!36725 () Bool)

(declare-datatypes ((V!35825 0))(
  ( (V!35826 (val!11616 Int)) )
))
(declare-datatypes ((ValueCell!11084 0))(
  ( (ValueCellFull!11084 (v!14178 V!35825)) (EmptyCell!11084) )
))
(declare-datatypes ((array!62229 0))(
  ( (array!62230 (arr!29972 (Array (_ BitVec 32) ValueCell!11084)) (size!30451 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62229)

(declare-fun mapDefault!36725 () ValueCell!11084)

