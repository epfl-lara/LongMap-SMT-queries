; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72830 () Bool)

(assert start!72830)

(declare-fun b!845180 () Bool)

(declare-fun res!574157 () Bool)

(declare-fun e!471843 () Bool)

(assert (=> b!845180 (=> (not res!574157) (not e!471843))))

(declare-datatypes ((array!47982 0))(
  ( (array!47983 (arr!23022 (Array (_ BitVec 32) (_ BitVec 64))) (size!23462 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47982)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47982 (_ BitVec 32)) Bool)

(assert (=> b!845180 (= res!574157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25421 () Bool)

(declare-fun mapRes!25421 () Bool)

(assert (=> mapIsEmpty!25421 mapRes!25421))

(declare-fun b!845181 () Bool)

(declare-fun res!574154 () Bool)

(assert (=> b!845181 (=> (not res!574154) (not e!471843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845181 (= res!574154 (validMask!0 mask!1196))))

(declare-fun b!845182 () Bool)

(declare-fun res!574156 () Bool)

(assert (=> b!845182 (=> (not res!574156) (not e!471843))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26221 0))(
  ( (V!26222 (val!7988 Int)) )
))
(declare-datatypes ((ValueCell!7501 0))(
  ( (ValueCellFull!7501 (v!10413 V!26221)) (EmptyCell!7501) )
))
(declare-datatypes ((array!47984 0))(
  ( (array!47985 (arr!23023 (Array (_ BitVec 32) ValueCell!7501)) (size!23463 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47984)

(assert (=> b!845182 (= res!574156 (and (= (size!23463 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23462 _keys!868) (size!23463 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845183 () Bool)

(assert (=> b!845183 (= e!471843 false)))

(declare-fun lt!381388 () Bool)

(declare-datatypes ((List!16296 0))(
  ( (Nil!16293) (Cons!16292 (h!17423 (_ BitVec 64)) (t!22667 List!16296)) )
))
(declare-fun arrayNoDuplicates!0 (array!47982 (_ BitVec 32) List!16296) Bool)

(assert (=> b!845183 (= lt!381388 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16293))))

(declare-fun b!845184 () Bool)

(declare-fun e!471845 () Bool)

(declare-fun tp_is_empty!15881 () Bool)

(assert (=> b!845184 (= e!471845 tp_is_empty!15881)))

(declare-fun b!845185 () Bool)

(declare-fun e!471844 () Bool)

(declare-fun e!471846 () Bool)

(assert (=> b!845185 (= e!471844 (and e!471846 mapRes!25421))))

(declare-fun condMapEmpty!25421 () Bool)

(declare-fun mapDefault!25421 () ValueCell!7501)

