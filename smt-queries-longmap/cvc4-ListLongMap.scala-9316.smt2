; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111336 () Bool)

(assert start!111336)

(declare-fun b!1317465 () Bool)

(declare-fun res!874396 () Bool)

(declare-fun e!751785 () Bool)

(assert (=> b!1317465 (=> (not res!874396) (not e!751785))))

(declare-datatypes ((array!88582 0))(
  ( (array!88583 (arr!42765 (Array (_ BitVec 32) (_ BitVec 64))) (size!43315 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88582)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52853 0))(
  ( (V!52854 (val!17981 Int)) )
))
(declare-datatypes ((ValueCell!17008 0))(
  ( (ValueCellFull!17008 (v!20611 V!52853)) (EmptyCell!17008) )
))
(declare-datatypes ((array!88584 0))(
  ( (array!88585 (arr!42766 (Array (_ BitVec 32) ValueCell!17008)) (size!43316 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88584)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1317465 (= res!874396 (and (= (size!43316 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43315 _keys!1609) (size!43316 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!874397 () Bool)

(assert (=> start!111336 (=> (not res!874397) (not e!751785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111336 (= res!874397 (validMask!0 mask!2019))))

(assert (=> start!111336 e!751785))

(assert (=> start!111336 true))

(declare-fun e!751786 () Bool)

(declare-fun array_inv!32299 (array!88584) Bool)

(assert (=> start!111336 (and (array_inv!32299 _values!1337) e!751786)))

(declare-fun array_inv!32300 (array!88582) Bool)

(assert (=> start!111336 (array_inv!32300 _keys!1609)))

(declare-fun b!1317466 () Bool)

(declare-fun e!751789 () Bool)

(declare-fun mapRes!55367 () Bool)

(assert (=> b!1317466 (= e!751786 (and e!751789 mapRes!55367))))

(declare-fun condMapEmpty!55367 () Bool)

(declare-fun mapDefault!55367 () ValueCell!17008)

