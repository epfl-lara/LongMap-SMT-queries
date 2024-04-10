; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111356 () Bool)

(assert start!111356)

(declare-fun b_free!30013 () Bool)

(declare-fun b_next!30013 () Bool)

(assert (=> start!111356 (= b_free!30013 (not b_next!30013))))

(declare-fun tp!105515 () Bool)

(declare-fun b_and!48233 () Bool)

(assert (=> start!111356 (= tp!105515 b_and!48233)))

(declare-fun b!1317676 () Bool)

(declare-fun res!874516 () Bool)

(declare-fun e!751936 () Bool)

(assert (=> b!1317676 (=> (not res!874516) (not e!751936))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(declare-datatypes ((array!88618 0))(
  ( (array!88619 (arr!42783 (Array (_ BitVec 32) (_ BitVec 64))) (size!43333 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88618)

(assert (=> b!1317676 (= res!874516 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43333 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!874517 () Bool)

(assert (=> start!111356 (=> (not res!874517) (not e!751936))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111356 (= res!874517 (validMask!0 mask!2019))))

(assert (=> start!111356 e!751936))

(declare-fun array_inv!32313 (array!88618) Bool)

(assert (=> start!111356 (array_inv!32313 _keys!1609)))

(assert (=> start!111356 true))

(declare-fun tp_is_empty!35833 () Bool)

(assert (=> start!111356 tp_is_empty!35833))

(declare-datatypes ((V!52881 0))(
  ( (V!52882 (val!17991 Int)) )
))
(declare-datatypes ((ValueCell!17018 0))(
  ( (ValueCellFull!17018 (v!20621 V!52881)) (EmptyCell!17018) )
))
(declare-datatypes ((array!88620 0))(
  ( (array!88621 (arr!42784 (Array (_ BitVec 32) ValueCell!17018)) (size!43334 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88620)

(declare-fun e!751935 () Bool)

(declare-fun array_inv!32314 (array!88620) Bool)

(assert (=> start!111356 (and (array_inv!32314 _values!1337) e!751935)))

(assert (=> start!111356 tp!105515))

(declare-fun mapNonEmpty!55397 () Bool)

(declare-fun mapRes!55397 () Bool)

(declare-fun tp!105514 () Bool)

(declare-fun e!751938 () Bool)

(assert (=> mapNonEmpty!55397 (= mapRes!55397 (and tp!105514 e!751938))))

(declare-fun mapValue!55397 () ValueCell!17018)

(declare-fun mapRest!55397 () (Array (_ BitVec 32) ValueCell!17018))

(declare-fun mapKey!55397 () (_ BitVec 32))

(assert (=> mapNonEmpty!55397 (= (arr!42784 _values!1337) (store mapRest!55397 mapKey!55397 mapValue!55397))))

(declare-fun b!1317677 () Bool)

(declare-fun e!751939 () Bool)

(assert (=> b!1317677 (= e!751939 tp_is_empty!35833)))

(declare-fun mapIsEmpty!55397 () Bool)

(assert (=> mapIsEmpty!55397 mapRes!55397))

(declare-fun b!1317678 () Bool)

(assert (=> b!1317678 (= e!751938 tp_is_empty!35833)))

(declare-fun b!1317679 () Bool)

(assert (=> b!1317679 (= e!751935 (and e!751939 mapRes!55397))))

(declare-fun condMapEmpty!55397 () Bool)

(declare-fun mapDefault!55397 () ValueCell!17018)

