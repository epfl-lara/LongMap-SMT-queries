; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110588 () Bool)

(assert start!110588)

(declare-fun b_free!29423 () Bool)

(declare-fun b_next!29423 () Bool)

(assert (=> start!110588 (= b_free!29423 (not b_next!29423))))

(declare-fun tp!103591 () Bool)

(declare-fun b_and!47631 () Bool)

(assert (=> start!110588 (= tp!103591 b_and!47631)))

(declare-fun res!868531 () Bool)

(declare-fun e!746533 () Bool)

(assert (=> start!110588 (=> (not res!868531) (not e!746533))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110588 (= res!868531 (validMask!0 mask!2040))))

(assert (=> start!110588 e!746533))

(assert (=> start!110588 tp!103591))

(declare-datatypes ((array!87304 0))(
  ( (array!87305 (arr!42132 (Array (_ BitVec 32) (_ BitVec 64))) (size!42682 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87304)

(declare-fun array_inv!31843 (array!87304) Bool)

(assert (=> start!110588 (array_inv!31843 _keys!1628)))

(assert (=> start!110588 true))

(declare-fun tp_is_empty!35153 () Bool)

(assert (=> start!110588 tp_is_empty!35153))

(declare-datatypes ((V!51973 0))(
  ( (V!51974 (val!17651 Int)) )
))
(declare-datatypes ((ValueCell!16678 0))(
  ( (ValueCellFull!16678 (v!20278 V!51973)) (EmptyCell!16678) )
))
(declare-datatypes ((array!87306 0))(
  ( (array!87307 (arr!42133 (Array (_ BitVec 32) ValueCell!16678)) (size!42683 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87306)

(declare-fun e!746534 () Bool)

(declare-fun array_inv!31844 (array!87306) Bool)

(assert (=> start!110588 (and (array_inv!31844 _values!1354) e!746534)))

(declare-fun b!1308391 () Bool)

(declare-fun res!868535 () Bool)

(assert (=> b!1308391 (=> (not res!868535) (not e!746533))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308391 (= res!868535 (not (= (select (arr!42132 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1308392 () Bool)

(declare-fun e!746536 () Bool)

(declare-fun mapRes!54358 () Bool)

(assert (=> b!1308392 (= e!746534 (and e!746536 mapRes!54358))))

(declare-fun condMapEmpty!54358 () Bool)

(declare-fun mapDefault!54358 () ValueCell!16678)

