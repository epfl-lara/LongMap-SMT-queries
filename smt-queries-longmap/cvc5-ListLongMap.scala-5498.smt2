; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72772 () Bool)

(assert start!72772)

(declare-fun mapNonEmpty!25334 () Bool)

(declare-fun mapRes!25334 () Bool)

(declare-fun tp!48652 () Bool)

(declare-fun e!471411 () Bool)

(assert (=> mapNonEmpty!25334 (= mapRes!25334 (and tp!48652 e!471411))))

(declare-datatypes ((V!26145 0))(
  ( (V!26146 (val!7959 Int)) )
))
(declare-datatypes ((ValueCell!7472 0))(
  ( (ValueCellFull!7472 (v!10384 V!26145)) (EmptyCell!7472) )
))
(declare-fun mapRest!25334 () (Array (_ BitVec 32) ValueCell!7472))

(declare-fun mapKey!25334 () (_ BitVec 32))

(declare-fun mapValue!25334 () ValueCell!7472)

(declare-datatypes ((array!47876 0))(
  ( (array!47877 (arr!22969 (Array (_ BitVec 32) ValueCell!7472)) (size!23409 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47876)

(assert (=> mapNonEmpty!25334 (= (arr!22969 _values!688) (store mapRest!25334 mapKey!25334 mapValue!25334))))

(declare-fun b!844571 () Bool)

(declare-fun res!573807 () Bool)

(declare-fun e!471412 () Bool)

(assert (=> b!844571 (=> (not res!573807) (not e!471412))))

(declare-datatypes ((array!47878 0))(
  ( (array!47879 (arr!22970 (Array (_ BitVec 32) (_ BitVec 64))) (size!23410 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47878)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47878 (_ BitVec 32)) Bool)

(assert (=> b!844571 (= res!573807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844572 () Bool)

(declare-fun e!471410 () Bool)

(declare-fun e!471408 () Bool)

(assert (=> b!844572 (= e!471410 (and e!471408 mapRes!25334))))

(declare-fun condMapEmpty!25334 () Bool)

(declare-fun mapDefault!25334 () ValueCell!7472)

