; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72922 () Bool)

(assert start!72922)

(declare-fun b_free!13837 () Bool)

(declare-fun b_next!13837 () Bool)

(assert (=> start!72922 (= b_free!13837 (not b_next!13837))))

(declare-fun tp!49015 () Bool)

(declare-fun b_and!22923 () Bool)

(assert (=> start!72922 (= tp!49015 b_and!22923)))

(declare-fun mapNonEmpty!25559 () Bool)

(declare-fun mapRes!25559 () Bool)

(declare-fun tp!49014 () Bool)

(declare-fun e!472533 () Bool)

(assert (=> mapNonEmpty!25559 (= mapRes!25559 (and tp!49014 e!472533))))

(declare-datatypes ((V!26345 0))(
  ( (V!26346 (val!8034 Int)) )
))
(declare-datatypes ((ValueCell!7547 0))(
  ( (ValueCellFull!7547 (v!10459 V!26345)) (EmptyCell!7547) )
))
(declare-fun mapValue!25559 () ValueCell!7547)

(declare-fun mapKey!25559 () (_ BitVec 32))

(declare-fun mapRest!25559 () (Array (_ BitVec 32) ValueCell!7547))

(declare-datatypes ((array!48158 0))(
  ( (array!48159 (arr!23110 (Array (_ BitVec 32) ValueCell!7547)) (size!23550 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48158)

(assert (=> mapNonEmpty!25559 (= (arr!23110 _values!688) (store mapRest!25559 mapKey!25559 mapValue!25559))))

(declare-fun mapIsEmpty!25559 () Bool)

(assert (=> mapIsEmpty!25559 mapRes!25559))

(declare-fun b!846695 () Bool)

(declare-fun res!575256 () Bool)

(declare-fun e!472534 () Bool)

(assert (=> b!846695 (=> (not res!575256) (not e!472534))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!48160 0))(
  ( (array!48161 (arr!23111 (Array (_ BitVec 32) (_ BitVec 64))) (size!23551 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48160)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!846695 (= res!575256 (and (= (select (arr!23111 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!846696 () Bool)

(declare-fun res!575254 () Bool)

(assert (=> b!846696 (=> (not res!575254) (not e!472534))))

(declare-datatypes ((List!16353 0))(
  ( (Nil!16350) (Cons!16349 (h!17480 (_ BitVec 64)) (t!22724 List!16353)) )
))
(declare-fun arrayNoDuplicates!0 (array!48160 (_ BitVec 32) List!16353) Bool)

(assert (=> b!846696 (= res!575254 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16350))))

(declare-fun b!846697 () Bool)

(declare-fun tp_is_empty!15973 () Bool)

(assert (=> b!846697 (= e!472533 tp_is_empty!15973)))

(declare-fun b!846698 () Bool)

(declare-fun res!575261 () Bool)

(assert (=> b!846698 (=> (not res!575261) (not e!472534))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48160 (_ BitVec 32)) Bool)

(assert (=> b!846698 (= res!575261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!846699 () Bool)

(declare-fun e!472536 () Bool)

(declare-fun e!472537 () Bool)

(assert (=> b!846699 (= e!472536 (and e!472537 mapRes!25559))))

(declare-fun condMapEmpty!25559 () Bool)

(declare-fun mapDefault!25559 () ValueCell!7547)

