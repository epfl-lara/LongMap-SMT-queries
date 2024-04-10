; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95624 () Bool)

(assert start!95624)

(declare-fun b_free!22277 () Bool)

(declare-fun b_next!22277 () Bool)

(assert (=> start!95624 (= b_free!22277 (not b_next!22277))))

(declare-fun tp!78680 () Bool)

(declare-fun b_and!35255 () Bool)

(assert (=> start!95624 (= tp!78680 b_and!35255)))

(declare-fun b!1080502 () Bool)

(declare-fun res!720136 () Bool)

(declare-fun e!617673 () Bool)

(assert (=> b!1080502 (=> (not res!720136) (not e!617673))))

(declare-datatypes ((array!69509 0))(
  ( (array!69510 (arr!33428 (Array (_ BitVec 32) (_ BitVec 64))) (size!33964 (_ BitVec 32))) )
))
(declare-fun lt!479035 () array!69509)

(declare-datatypes ((List!23294 0))(
  ( (Nil!23291) (Cons!23290 (h!24499 (_ BitVec 64)) (t!32653 List!23294)) )
))
(declare-fun arrayNoDuplicates!0 (array!69509 (_ BitVec 32) List!23294) Bool)

(assert (=> b!1080502 (= res!720136 (arrayNoDuplicates!0 lt!479035 #b00000000000000000000000000000000 Nil!23291))))

(declare-fun b!1080503 () Bool)

(declare-fun e!617671 () Bool)

(declare-fun e!617675 () Bool)

(declare-fun mapRes!41173 () Bool)

(assert (=> b!1080503 (= e!617671 (and e!617675 mapRes!41173))))

(declare-fun condMapEmpty!41173 () Bool)

(declare-datatypes ((V!40165 0))(
  ( (V!40166 (val!13196 Int)) )
))
(declare-datatypes ((ValueCell!12430 0))(
  ( (ValueCellFull!12430 (v!15817 V!40165)) (EmptyCell!12430) )
))
(declare-datatypes ((array!69511 0))(
  ( (array!69512 (arr!33429 (Array (_ BitVec 32) ValueCell!12430)) (size!33965 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69511)

(declare-fun mapDefault!41173 () ValueCell!12430)

