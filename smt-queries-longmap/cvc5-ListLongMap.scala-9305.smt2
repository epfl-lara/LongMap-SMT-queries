; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111222 () Bool)

(assert start!111222)

(declare-datatypes ((array!88444 0))(
  ( (array!88445 (arr!42701 (Array (_ BitVec 32) (_ BitVec 64))) (size!43251 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88444)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun e!751165 () Bool)

(declare-datatypes ((V!52761 0))(
  ( (V!52762 (val!17946 Int)) )
))
(declare-datatypes ((ValueCell!16973 0))(
  ( (ValueCellFull!16973 (v!20575 V!52761)) (EmptyCell!16973) )
))
(declare-datatypes ((array!88446 0))(
  ( (array!88447 (arr!42702 (Array (_ BitVec 32) ValueCell!16973)) (size!43252 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88446)

(declare-fun b!1316705 () Bool)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1316705 (= e!751165 (and (= (size!43252 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43251 _keys!1609) (size!43252 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011) (= (size!43251 _keys!1609) (bvadd #b00000000000000000000000000000001 mask!2019)) (bvsgt #b00000000000000000000000000000000 (size!43251 _keys!1609))))))

(declare-fun b!1316706 () Bool)

(declare-fun e!751167 () Bool)

(declare-fun tp_is_empty!35743 () Bool)

(assert (=> b!1316706 (= e!751167 tp_is_empty!35743)))

(declare-fun mapNonEmpty!55247 () Bool)

(declare-fun mapRes!55247 () Bool)

(declare-fun tp!105353 () Bool)

(declare-fun e!751166 () Bool)

(assert (=> mapNonEmpty!55247 (= mapRes!55247 (and tp!105353 e!751166))))

(declare-fun mapValue!55247 () ValueCell!16973)

(declare-fun mapKey!55247 () (_ BitVec 32))

(declare-fun mapRest!55247 () (Array (_ BitVec 32) ValueCell!16973))

(assert (=> mapNonEmpty!55247 (= (arr!42702 _values!1337) (store mapRest!55247 mapKey!55247 mapValue!55247))))

(declare-fun res!874014 () Bool)

(assert (=> start!111222 (=> (not res!874014) (not e!751165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111222 (= res!874014 (validMask!0 mask!2019))))

(assert (=> start!111222 e!751165))

(assert (=> start!111222 true))

(declare-fun e!751168 () Bool)

(declare-fun array_inv!32251 (array!88446) Bool)

(assert (=> start!111222 (and (array_inv!32251 _values!1337) e!751168)))

(declare-fun array_inv!32252 (array!88444) Bool)

(assert (=> start!111222 (array_inv!32252 _keys!1609)))

(declare-fun mapIsEmpty!55247 () Bool)

(assert (=> mapIsEmpty!55247 mapRes!55247))

(declare-fun b!1316707 () Bool)

(assert (=> b!1316707 (= e!751166 tp_is_empty!35743)))

(declare-fun b!1316708 () Bool)

(assert (=> b!1316708 (= e!751168 (and e!751167 mapRes!55247))))

(declare-fun condMapEmpty!55247 () Bool)

(declare-fun mapDefault!55247 () ValueCell!16973)

