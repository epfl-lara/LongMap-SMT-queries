; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72596 () Bool)

(assert start!72596)

(declare-fun mapIsEmpty!25070 () Bool)

(declare-fun mapRes!25070 () Bool)

(assert (=> mapIsEmpty!25070 mapRes!25070))

(declare-fun b!842723 () Bool)

(declare-fun res!572750 () Bool)

(declare-fun e!470089 () Bool)

(assert (=> b!842723 (=> (not res!572750) (not e!470089))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842723 (= res!572750 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25070 () Bool)

(declare-fun tp!48388 () Bool)

(declare-fun e!470092 () Bool)

(assert (=> mapNonEmpty!25070 (= mapRes!25070 (and tp!48388 e!470092))))

(declare-datatypes ((V!25909 0))(
  ( (V!25910 (val!7871 Int)) )
))
(declare-datatypes ((ValueCell!7384 0))(
  ( (ValueCellFull!7384 (v!10296 V!25909)) (EmptyCell!7384) )
))
(declare-fun mapRest!25070 () (Array (_ BitVec 32) ValueCell!7384))

(declare-fun mapKey!25070 () (_ BitVec 32))

(declare-fun mapValue!25070 () ValueCell!7384)

(declare-datatypes ((array!47562 0))(
  ( (array!47563 (arr!22812 (Array (_ BitVec 32) ValueCell!7384)) (size!23252 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47562)

(assert (=> mapNonEmpty!25070 (= (arr!22812 _values!688) (store mapRest!25070 mapKey!25070 mapValue!25070))))

(declare-fun b!842724 () Bool)

(declare-fun res!572751 () Bool)

(assert (=> b!842724 (=> (not res!572751) (not e!470089))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!47564 0))(
  ( (array!47565 (arr!22813 (Array (_ BitVec 32) (_ BitVec 64))) (size!23253 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47564)

(assert (=> b!842724 (= res!572751 (and (= (size!23252 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23253 _keys!868) (size!23252 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842725 () Bool)

(declare-fun tp_is_empty!15647 () Bool)

(assert (=> b!842725 (= e!470092 tp_is_empty!15647)))

(declare-fun b!842727 () Bool)

(declare-fun e!470091 () Bool)

(declare-fun e!470088 () Bool)

(assert (=> b!842727 (= e!470091 (and e!470088 mapRes!25070))))

(declare-fun condMapEmpty!25070 () Bool)

(declare-fun mapDefault!25070 () ValueCell!7384)

