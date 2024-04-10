; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74636 () Bool)

(assert start!74636)

(declare-fun b_free!15305 () Bool)

(declare-fun b_next!15305 () Bool)

(assert (=> start!74636 (= b_free!15305 (not b_next!15305))))

(declare-fun tp!53599 () Bool)

(declare-fun b_and!25213 () Bool)

(assert (=> start!74636 (= tp!53599 b_and!25213)))

(declare-fun b!879629 () Bool)

(declare-fun res!597628 () Bool)

(declare-fun e!489518 () Bool)

(assert (=> b!879629 (=> (not res!597628) (not e!489518))))

(declare-datatypes ((array!51226 0))(
  ( (array!51227 (arr!24638 (Array (_ BitVec 32) (_ BitVec 64))) (size!25078 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51226)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51226 (_ BitVec 32)) Bool)

(assert (=> b!879629 (= res!597628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879630 () Bool)

(declare-fun res!597624 () Bool)

(assert (=> b!879630 (=> (not res!597624) (not e!489518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879630 (= res!597624 (validMask!0 mask!1196))))

(declare-fun b!879631 () Bool)

(declare-fun res!597622 () Bool)

(assert (=> b!879631 (=> (not res!597622) (not e!489518))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28445 0))(
  ( (V!28446 (val!8822 Int)) )
))
(declare-datatypes ((ValueCell!8335 0))(
  ( (ValueCellFull!8335 (v!11266 V!28445)) (EmptyCell!8335) )
))
(declare-datatypes ((array!51228 0))(
  ( (array!51229 (arr!24639 (Array (_ BitVec 32) ValueCell!8335)) (size!25079 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51228)

(assert (=> b!879631 (= res!597622 (and (= (size!25079 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25078 _keys!868) (size!25079 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879632 () Bool)

(declare-fun e!489521 () Bool)

(declare-fun e!489520 () Bool)

(declare-fun mapRes!27942 () Bool)

(assert (=> b!879632 (= e!489521 (and e!489520 mapRes!27942))))

(declare-fun condMapEmpty!27942 () Bool)

(declare-fun mapDefault!27942 () ValueCell!8335)

