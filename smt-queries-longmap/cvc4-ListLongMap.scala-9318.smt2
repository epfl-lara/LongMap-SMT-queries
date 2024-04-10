; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111348 () Bool)

(assert start!111348)

(declare-fun b!1317581 () Bool)

(declare-fun res!874457 () Bool)

(declare-fun e!751875 () Bool)

(assert (=> b!1317581 (=> (not res!874457) (not e!751875))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52869 0))(
  ( (V!52870 (val!17987 Int)) )
))
(declare-datatypes ((ValueCell!17014 0))(
  ( (ValueCellFull!17014 (v!20617 V!52869)) (EmptyCell!17014) )
))
(declare-datatypes ((array!88604 0))(
  ( (array!88605 (arr!42776 (Array (_ BitVec 32) ValueCell!17014)) (size!43326 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88604)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!88606 0))(
  ( (array!88607 (arr!42777 (Array (_ BitVec 32) (_ BitVec 64))) (size!43327 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88606)

(assert (=> b!1317581 (= res!874457 (and (= (size!43326 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43327 _keys!1609) (size!43326 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55385 () Bool)

(declare-fun mapRes!55385 () Bool)

(assert (=> mapIsEmpty!55385 mapRes!55385))

(declare-fun b!1317582 () Bool)

(declare-fun e!751879 () Bool)

(declare-fun tp_is_empty!35825 () Bool)

(assert (=> b!1317582 (= e!751879 tp_is_empty!35825)))

(declare-fun b!1317583 () Bool)

(declare-fun res!874458 () Bool)

(assert (=> b!1317583 (=> (not res!874458) (not e!751875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88606 (_ BitVec 32)) Bool)

(assert (=> b!1317583 (= res!874458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317584 () Bool)

(declare-fun e!751877 () Bool)

(assert (=> b!1317584 (= e!751877 (and e!751879 mapRes!55385))))

(declare-fun condMapEmpty!55385 () Bool)

(declare-fun mapDefault!55385 () ValueCell!17014)

