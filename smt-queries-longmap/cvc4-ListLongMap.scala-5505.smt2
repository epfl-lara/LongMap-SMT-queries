; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72818 () Bool)

(assert start!72818)

(declare-fun b!845054 () Bool)

(declare-fun e!471757 () Bool)

(assert (=> b!845054 (= e!471757 false)))

(declare-fun lt!381370 () Bool)

(declare-datatypes ((array!47960 0))(
  ( (array!47961 (arr!23011 (Array (_ BitVec 32) (_ BitVec 64))) (size!23451 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47960)

(declare-datatypes ((List!16292 0))(
  ( (Nil!16289) (Cons!16288 (h!17419 (_ BitVec 64)) (t!22663 List!16292)) )
))
(declare-fun arrayNoDuplicates!0 (array!47960 (_ BitVec 32) List!16292) Bool)

(assert (=> b!845054 (= lt!381370 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16289))))

(declare-fun mapIsEmpty!25403 () Bool)

(declare-fun mapRes!25403 () Bool)

(assert (=> mapIsEmpty!25403 mapRes!25403))

(declare-fun b!845055 () Bool)

(declare-fun e!471755 () Bool)

(declare-fun e!471754 () Bool)

(assert (=> b!845055 (= e!471755 (and e!471754 mapRes!25403))))

(declare-fun condMapEmpty!25403 () Bool)

(declare-datatypes ((V!26205 0))(
  ( (V!26206 (val!7982 Int)) )
))
(declare-datatypes ((ValueCell!7495 0))(
  ( (ValueCellFull!7495 (v!10407 V!26205)) (EmptyCell!7495) )
))
(declare-datatypes ((array!47962 0))(
  ( (array!47963 (arr!23012 (Array (_ BitVec 32) ValueCell!7495)) (size!23452 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47962)

(declare-fun mapDefault!25403 () ValueCell!7495)

