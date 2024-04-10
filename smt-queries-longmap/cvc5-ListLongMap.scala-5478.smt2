; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72652 () Bool)

(assert start!72652)

(declare-fun res!573089 () Bool)

(declare-fun e!470508 () Bool)

(assert (=> start!72652 (=> (not res!573089) (not e!470508))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47662 0))(
  ( (array!47663 (arr!22862 (Array (_ BitVec 32) (_ BitVec 64))) (size!23302 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47662)

(assert (=> start!72652 (= res!573089 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23302 _keys!868))))))

(assert (=> start!72652 e!470508))

(assert (=> start!72652 true))

(declare-fun array_inv!18182 (array!47662) Bool)

(assert (=> start!72652 (array_inv!18182 _keys!868)))

(declare-datatypes ((V!25985 0))(
  ( (V!25986 (val!7899 Int)) )
))
(declare-datatypes ((ValueCell!7412 0))(
  ( (ValueCellFull!7412 (v!10324 V!25985)) (EmptyCell!7412) )
))
(declare-datatypes ((array!47664 0))(
  ( (array!47665 (arr!22863 (Array (_ BitVec 32) ValueCell!7412)) (size!23303 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47664)

(declare-fun e!470512 () Bool)

(declare-fun array_inv!18183 (array!47664) Bool)

(assert (=> start!72652 (and (array_inv!18183 _values!688) e!470512)))

(declare-fun b!843311 () Bool)

(declare-fun res!573087 () Bool)

(assert (=> b!843311 (=> (not res!573087) (not e!470508))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843311 (= res!573087 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25154 () Bool)

(declare-fun mapRes!25154 () Bool)

(assert (=> mapIsEmpty!25154 mapRes!25154))

(declare-fun b!843312 () Bool)

(declare-fun res!573088 () Bool)

(assert (=> b!843312 (=> (not res!573088) (not e!470508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47662 (_ BitVec 32)) Bool)

(assert (=> b!843312 (= res!573088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843313 () Bool)

(declare-fun e!470510 () Bool)

(declare-fun tp_is_empty!15703 () Bool)

(assert (=> b!843313 (= e!470510 tp_is_empty!15703)))

(declare-fun b!843314 () Bool)

(assert (=> b!843314 (= e!470512 (and e!470510 mapRes!25154))))

(declare-fun condMapEmpty!25154 () Bool)

(declare-fun mapDefault!25154 () ValueCell!7412)

