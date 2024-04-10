; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43258 () Bool)

(assert start!43258)

(declare-fun b_free!12125 () Bool)

(declare-fun b_next!12125 () Bool)

(assert (=> start!43258 (= b_free!12125 (not b_next!12125))))

(declare-fun tp!42645 () Bool)

(declare-fun b_and!20877 () Bool)

(assert (=> start!43258 (= tp!42645 b_and!20877)))

(declare-fun b!479279 () Bool)

(declare-fun res!285898 () Bool)

(declare-fun e!281952 () Bool)

(assert (=> b!479279 (=> (not res!285898) (not e!281952))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30947 0))(
  ( (array!30948 (arr!14880 (Array (_ BitVec 32) (_ BitVec 64))) (size!15238 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30947)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19253 0))(
  ( (V!19254 (val!6866 Int)) )
))
(declare-datatypes ((ValueCell!6457 0))(
  ( (ValueCellFull!6457 (v!9155 V!19253)) (EmptyCell!6457) )
))
(declare-datatypes ((array!30949 0))(
  ( (array!30950 (arr!14881 (Array (_ BitVec 32) ValueCell!6457)) (size!15239 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30949)

(assert (=> b!479279 (= res!285898 (and (= (size!15239 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15238 _keys!1874) (size!15239 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479280 () Bool)

(declare-fun res!285900 () Bool)

(assert (=> b!479280 (=> (not res!285900) (not e!281952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30947 (_ BitVec 32)) Bool)

(assert (=> b!479280 (= res!285900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479281 () Bool)

(declare-fun e!281951 () Bool)

(declare-fun e!281954 () Bool)

(declare-fun mapRes!22153 () Bool)

(assert (=> b!479281 (= e!281951 (and e!281954 mapRes!22153))))

(declare-fun condMapEmpty!22153 () Bool)

(declare-fun mapDefault!22153 () ValueCell!6457)

