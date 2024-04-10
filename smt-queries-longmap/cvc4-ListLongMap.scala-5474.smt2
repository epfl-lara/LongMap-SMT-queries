; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72632 () Bool)

(assert start!72632)

(declare-fun b!843101 () Bool)

(declare-fun e!470359 () Bool)

(declare-fun tp_is_empty!15683 () Bool)

(assert (=> b!843101 (= e!470359 tp_is_empty!15683)))

(declare-fun b!843102 () Bool)

(declare-fun res!572968 () Bool)

(declare-fun e!470361 () Bool)

(assert (=> b!843102 (=> (not res!572968) (not e!470361))))

(declare-datatypes ((array!47626 0))(
  ( (array!47627 (arr!22844 (Array (_ BitVec 32) (_ BitVec 64))) (size!23284 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47626)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47626 (_ BitVec 32)) Bool)

(assert (=> b!843102 (= res!572968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843103 () Bool)

(declare-fun res!572969 () Bool)

(assert (=> b!843103 (=> (not res!572969) (not e!470361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843103 (= res!572969 (validMask!0 mask!1196))))

(declare-fun b!843104 () Bool)

(declare-fun e!470358 () Bool)

(assert (=> b!843104 (= e!470358 tp_is_empty!15683)))

(declare-fun b!843105 () Bool)

(assert (=> b!843105 (= e!470361 false)))

(declare-fun lt!381091 () Bool)

(declare-datatypes ((List!16229 0))(
  ( (Nil!16226) (Cons!16225 (h!17356 (_ BitVec 64)) (t!22600 List!16229)) )
))
(declare-fun arrayNoDuplicates!0 (array!47626 (_ BitVec 32) List!16229) Bool)

(assert (=> b!843105 (= lt!381091 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16226))))

(declare-fun b!843106 () Bool)

(declare-fun e!470362 () Bool)

(declare-fun mapRes!25124 () Bool)

(assert (=> b!843106 (= e!470362 (and e!470358 mapRes!25124))))

(declare-fun condMapEmpty!25124 () Bool)

(declare-datatypes ((V!25957 0))(
  ( (V!25958 (val!7889 Int)) )
))
(declare-datatypes ((ValueCell!7402 0))(
  ( (ValueCellFull!7402 (v!10314 V!25957)) (EmptyCell!7402) )
))
(declare-datatypes ((array!47628 0))(
  ( (array!47629 (arr!22845 (Array (_ BitVec 32) ValueCell!7402)) (size!23285 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47628)

(declare-fun mapDefault!25124 () ValueCell!7402)

