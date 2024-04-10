; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111374 () Bool)

(assert start!111374)

(declare-fun b_free!30031 () Bool)

(declare-fun b_next!30031 () Bool)

(assert (=> start!111374 (= b_free!30031 (not b_next!30031))))

(declare-fun tp!105568 () Bool)

(declare-fun b_and!48251 () Bool)

(assert (=> start!111374 (= tp!105568 b_and!48251)))

(declare-fun b!1317892 () Bool)

(declare-fun e!752072 () Bool)

(declare-fun tp_is_empty!35851 () Bool)

(assert (=> b!1317892 (= e!752072 tp_is_empty!35851)))

(declare-fun res!874655 () Bool)

(declare-fun e!752071 () Bool)

(assert (=> start!111374 (=> (not res!874655) (not e!752071))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111374 (= res!874655 (validMask!0 mask!2019))))

(assert (=> start!111374 e!752071))

(declare-datatypes ((array!88654 0))(
  ( (array!88655 (arr!42801 (Array (_ BitVec 32) (_ BitVec 64))) (size!43351 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88654)

(declare-fun array_inv!32325 (array!88654) Bool)

(assert (=> start!111374 (array_inv!32325 _keys!1609)))

(assert (=> start!111374 true))

(assert (=> start!111374 tp_is_empty!35851))

(declare-datatypes ((V!52905 0))(
  ( (V!52906 (val!18000 Int)) )
))
(declare-datatypes ((ValueCell!17027 0))(
  ( (ValueCellFull!17027 (v!20630 V!52905)) (EmptyCell!17027) )
))
(declare-datatypes ((array!88656 0))(
  ( (array!88657 (arr!42802 (Array (_ BitVec 32) ValueCell!17027)) (size!43352 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88656)

(declare-fun e!752073 () Bool)

(declare-fun array_inv!32326 (array!88656) Bool)

(assert (=> start!111374 (and (array_inv!32326 _values!1337) e!752073)))

(assert (=> start!111374 tp!105568))

(declare-fun b!1317893 () Bool)

(declare-fun e!752070 () Bool)

(declare-fun mapRes!55424 () Bool)

(assert (=> b!1317893 (= e!752073 (and e!752070 mapRes!55424))))

(declare-fun condMapEmpty!55424 () Bool)

(declare-fun mapDefault!55424 () ValueCell!17027)

