; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7414 () Bool)

(assert start!7414)

(declare-fun res!27710 () Bool)

(declare-fun e!30520 () Bool)

(assert (=> start!7414 (=> (not res!27710) (not e!30520))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7414 (= res!27710 (validMask!0 mask!2458))))

(assert (=> start!7414 e!30520))

(assert (=> start!7414 true))

(declare-datatypes ((array!3165 0))(
  ( (array!3166 (arr!1517 (Array (_ BitVec 32) (_ BitVec 64))) (size!1739 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3165)

(declare-fun array_inv!916 (array!3165) Bool)

(assert (=> start!7414 (array_inv!916 _keys!1940)))

(declare-datatypes ((V!2467 0))(
  ( (V!2468 (val!1064 Int)) )
))
(declare-datatypes ((ValueCell!736 0))(
  ( (ValueCellFull!736 (v!2125 V!2467)) (EmptyCell!736) )
))
(declare-datatypes ((array!3167 0))(
  ( (array!3168 (arr!1518 (Array (_ BitVec 32) ValueCell!736)) (size!1740 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3167)

(declare-fun e!30521 () Bool)

(declare-fun array_inv!917 (array!3167) Bool)

(assert (=> start!7414 (and (array_inv!917 _values!1550) e!30521)))

(declare-fun b!47630 () Bool)

(declare-fun res!27708 () Bool)

(assert (=> b!47630 (=> (not res!27708) (not e!30520))))

(declare-fun k!1421 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47630 (= res!27708 (validKeyInArray!0 k!1421))))

(declare-fun b!47631 () Bool)

(declare-fun e!30519 () Bool)

(declare-fun mapRes!2120 () Bool)

(assert (=> b!47631 (= e!30521 (and e!30519 mapRes!2120))))

(declare-fun condMapEmpty!2120 () Bool)

(declare-fun mapDefault!2120 () ValueCell!736)

