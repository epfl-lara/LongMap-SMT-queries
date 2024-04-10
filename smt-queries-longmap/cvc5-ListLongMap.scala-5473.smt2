; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72622 () Bool)

(assert start!72622)

(declare-fun b!842996 () Bool)

(declare-fun res!572906 () Bool)

(declare-fun e!470287 () Bool)

(assert (=> b!842996 (=> (not res!572906) (not e!470287))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842996 (= res!572906 (validMask!0 mask!1196))))

(declare-fun b!842997 () Bool)

(declare-fun e!470284 () Bool)

(declare-fun e!470283 () Bool)

(declare-fun mapRes!25109 () Bool)

(assert (=> b!842997 (= e!470284 (and e!470283 mapRes!25109))))

(declare-fun condMapEmpty!25109 () Bool)

(declare-datatypes ((V!25945 0))(
  ( (V!25946 (val!7884 Int)) )
))
(declare-datatypes ((ValueCell!7397 0))(
  ( (ValueCellFull!7397 (v!10309 V!25945)) (EmptyCell!7397) )
))
(declare-datatypes ((array!47608 0))(
  ( (array!47609 (arr!22835 (Array (_ BitVec 32) ValueCell!7397)) (size!23275 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47608)

(declare-fun mapDefault!25109 () ValueCell!7397)

