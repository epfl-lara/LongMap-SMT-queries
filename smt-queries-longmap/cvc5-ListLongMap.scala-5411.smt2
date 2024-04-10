; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72220 () Bool)

(assert start!72220)

(declare-fun b!837030 () Bool)

(declare-fun res!569305 () Bool)

(declare-fun e!467095 () Bool)

(assert (=> b!837030 (=> (not res!569305) (not e!467095))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!46900 0))(
  ( (array!46901 (arr!22484 (Array (_ BitVec 32) (_ BitVec 64))) (size!22924 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46900)

(declare-datatypes ((V!25449 0))(
  ( (V!25450 (val!7698 Int)) )
))
(declare-datatypes ((ValueCell!7211 0))(
  ( (ValueCellFull!7211 (v!10122 V!25449)) (EmptyCell!7211) )
))
(declare-datatypes ((array!46902 0))(
  ( (array!46903 (arr!22485 (Array (_ BitVec 32) ValueCell!7211)) (size!22925 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46902)

(assert (=> b!837030 (= res!569305 (and (= (size!22925 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22924 _keys!868) (size!22925 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837031 () Bool)

(declare-fun e!467097 () Bool)

(declare-fun tp_is_empty!15301 () Bool)

(assert (=> b!837031 (= e!467097 tp_is_empty!15301)))

(declare-fun mapNonEmpty!24542 () Bool)

(declare-fun mapRes!24542 () Bool)

(declare-fun tp!47536 () Bool)

(assert (=> mapNonEmpty!24542 (= mapRes!24542 (and tp!47536 e!467097))))

(declare-fun mapKey!24542 () (_ BitVec 32))

(declare-fun mapValue!24542 () ValueCell!7211)

(declare-fun mapRest!24542 () (Array (_ BitVec 32) ValueCell!7211))

(assert (=> mapNonEmpty!24542 (= (arr!22485 _values!688) (store mapRest!24542 mapKey!24542 mapValue!24542))))

(declare-fun b!837032 () Bool)

(declare-fun e!467098 () Bool)

(declare-fun e!467096 () Bool)

(assert (=> b!837032 (= e!467098 (and e!467096 mapRes!24542))))

(declare-fun condMapEmpty!24542 () Bool)

(declare-fun mapDefault!24542 () ValueCell!7211)

