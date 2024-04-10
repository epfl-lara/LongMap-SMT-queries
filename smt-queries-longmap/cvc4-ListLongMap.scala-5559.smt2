; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73142 () Bool)

(assert start!73142)

(declare-fun b_free!14057 () Bool)

(declare-fun b_next!14057 () Bool)

(assert (=> start!73142 (= b_free!14057 (not b_next!14057))))

(declare-fun tp!49674 () Bool)

(declare-fun b_and!23273 () Bool)

(assert (=> start!73142 (= tp!49674 b_and!23273)))

(declare-fun b!851494 () Bool)

(declare-fun res!578380 () Bool)

(declare-fun e!474949 () Bool)

(assert (=> b!851494 (=> (not res!578380) (not e!474949))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48586 0))(
  ( (array!48587 (arr!23324 (Array (_ BitVec 32) (_ BitVec 64))) (size!23764 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48586)

(declare-datatypes ((V!26637 0))(
  ( (V!26638 (val!8144 Int)) )
))
(declare-datatypes ((ValueCell!7657 0))(
  ( (ValueCellFull!7657 (v!10569 V!26637)) (EmptyCell!7657) )
))
(declare-datatypes ((array!48588 0))(
  ( (array!48589 (arr!23325 (Array (_ BitVec 32) ValueCell!7657)) (size!23765 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48588)

(assert (=> b!851494 (= res!578380 (and (= (size!23765 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23764 _keys!868) (size!23765 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851495 () Bool)

(declare-fun res!578382 () Bool)

(assert (=> b!851495 (=> (not res!578382) (not e!474949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851495 (= res!578382 (validMask!0 mask!1196))))

(declare-fun b!851496 () Bool)

(declare-fun e!474952 () Bool)

(declare-fun e!474950 () Bool)

(declare-fun mapRes!25889 () Bool)

(assert (=> b!851496 (= e!474952 (and e!474950 mapRes!25889))))

(declare-fun condMapEmpty!25889 () Bool)

(declare-fun mapDefault!25889 () ValueCell!7657)

