; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72434 () Bool)

(assert start!72434)

(declare-fun b_free!13619 () Bool)

(declare-fun b_next!13619 () Bool)

(assert (=> start!72434 (= b_free!13619 (not b_next!13619))))

(declare-fun tp!47956 () Bool)

(declare-fun b_and!22705 () Bool)

(assert (=> start!72434 (= tp!47956 b_and!22705)))

(declare-fun mapIsEmpty!24827 () Bool)

(declare-fun mapRes!24827 () Bool)

(assert (=> mapIsEmpty!24827 mapRes!24827))

(declare-fun b!839882 () Bool)

(declare-fun res!571023 () Bool)

(declare-fun e!468685 () Bool)

(assert (=> b!839882 (=> (not res!571023) (not e!468685))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47252 0))(
  ( (array!47253 (arr!22657 (Array (_ BitVec 32) (_ BitVec 64))) (size!23097 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47252)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!839882 (= res!571023 (and (= (select (arr!22657 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23097 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839883 () Bool)

(declare-fun res!571022 () Bool)

(assert (=> b!839883 (=> (not res!571022) (not e!468685))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839883 (= res!571022 (validMask!0 mask!1196))))

(declare-fun b!839885 () Bool)

(declare-fun e!468683 () Bool)

(declare-fun tp_is_empty!15485 () Bool)

(assert (=> b!839885 (= e!468683 tp_is_empty!15485)))

(declare-fun b!839886 () Bool)

(declare-fun res!571024 () Bool)

(assert (=> b!839886 (=> (not res!571024) (not e!468685))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25693 0))(
  ( (V!25694 (val!7790 Int)) )
))
(declare-datatypes ((ValueCell!7303 0))(
  ( (ValueCellFull!7303 (v!10215 V!25693)) (EmptyCell!7303) )
))
(declare-datatypes ((array!47254 0))(
  ( (array!47255 (arr!22658 (Array (_ BitVec 32) ValueCell!7303)) (size!23098 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47254)

(assert (=> b!839886 (= res!571024 (and (= (size!23098 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23097 _keys!868) (size!23098 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839887 () Bool)

(declare-fun res!571019 () Bool)

(assert (=> b!839887 (=> (not res!571019) (not e!468685))))

(assert (=> b!839887 (= res!571019 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23097 _keys!868))))))

(declare-fun mapNonEmpty!24827 () Bool)

(declare-fun tp!47955 () Bool)

(declare-fun e!468687 () Bool)

(assert (=> mapNonEmpty!24827 (= mapRes!24827 (and tp!47955 e!468687))))

(declare-fun mapRest!24827 () (Array (_ BitVec 32) ValueCell!7303))

(declare-fun mapKey!24827 () (_ BitVec 32))

(declare-fun mapValue!24827 () ValueCell!7303)

(assert (=> mapNonEmpty!24827 (= (arr!22658 _values!688) (store mapRest!24827 mapKey!24827 mapValue!24827))))

(declare-fun b!839888 () Bool)

(declare-fun e!468688 () Bool)

(assert (=> b!839888 (= e!468688 (and e!468683 mapRes!24827))))

(declare-fun condMapEmpty!24827 () Bool)

(declare-fun mapDefault!24827 () ValueCell!7303)

