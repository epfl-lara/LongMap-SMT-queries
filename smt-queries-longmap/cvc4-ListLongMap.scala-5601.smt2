; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73394 () Bool)

(assert start!73394)

(declare-fun b_free!14309 () Bool)

(declare-fun b_next!14309 () Bool)

(assert (=> start!73394 (= b_free!14309 (not b_next!14309))))

(declare-fun tp!50430 () Bool)

(declare-fun b_and!23665 () Bool)

(assert (=> start!73394 (= tp!50430 b_and!23665)))

(declare-fun b!856686 () Bool)

(declare-fun res!581886 () Bool)

(declare-fun e!477525 () Bool)

(assert (=> b!856686 (=> (not res!581886) (not e!477525))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49082 0))(
  ( (array!49083 (arr!23572 (Array (_ BitVec 32) (_ BitVec 64))) (size!24012 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49082)

(declare-datatypes ((V!26973 0))(
  ( (V!26974 (val!8270 Int)) )
))
(declare-datatypes ((ValueCell!7783 0))(
  ( (ValueCellFull!7783 (v!10695 V!26973)) (EmptyCell!7783) )
))
(declare-datatypes ((array!49084 0))(
  ( (array!49085 (arr!23573 (Array (_ BitVec 32) ValueCell!7783)) (size!24013 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49084)

(assert (=> b!856686 (= res!581886 (and (= (size!24013 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24012 _keys!868) (size!24013 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856687 () Bool)

(declare-fun res!581882 () Bool)

(assert (=> b!856687 (=> (not res!581882) (not e!477525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49082 (_ BitVec 32)) Bool)

(assert (=> b!856687 (= res!581882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856688 () Bool)

(declare-fun e!477521 () Bool)

(declare-fun e!477524 () Bool)

(declare-fun mapRes!26267 () Bool)

(assert (=> b!856688 (= e!477521 (and e!477524 mapRes!26267))))

(declare-fun condMapEmpty!26267 () Bool)

(declare-fun mapDefault!26267 () ValueCell!7783)

