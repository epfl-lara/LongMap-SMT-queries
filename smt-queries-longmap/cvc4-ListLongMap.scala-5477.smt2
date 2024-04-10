; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72650 () Bool)

(assert start!72650)

(declare-fun b!843290 () Bool)

(declare-fun res!573074 () Bool)

(declare-fun e!470497 () Bool)

(assert (=> b!843290 (=> (not res!573074) (not e!470497))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47658 0))(
  ( (array!47659 (arr!22860 (Array (_ BitVec 32) (_ BitVec 64))) (size!23300 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47658)

(declare-datatypes ((V!25981 0))(
  ( (V!25982 (val!7898 Int)) )
))
(declare-datatypes ((ValueCell!7411 0))(
  ( (ValueCellFull!7411 (v!10323 V!25981)) (EmptyCell!7411) )
))
(declare-datatypes ((array!47660 0))(
  ( (array!47661 (arr!22861 (Array (_ BitVec 32) ValueCell!7411)) (size!23301 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47660)

(assert (=> b!843290 (= res!573074 (and (= (size!23301 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23300 _keys!868) (size!23301 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25151 () Bool)

(declare-fun mapRes!25151 () Bool)

(assert (=> mapIsEmpty!25151 mapRes!25151))

(declare-fun b!843291 () Bool)

(declare-fun res!573077 () Bool)

(assert (=> b!843291 (=> (not res!573077) (not e!470497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843291 (= res!573077 (validMask!0 mask!1196))))

(declare-fun b!843292 () Bool)

(declare-fun e!470493 () Bool)

(declare-fun e!470495 () Bool)

(assert (=> b!843292 (= e!470493 (and e!470495 mapRes!25151))))

(declare-fun condMapEmpty!25151 () Bool)

(declare-fun mapDefault!25151 () ValueCell!7411)

