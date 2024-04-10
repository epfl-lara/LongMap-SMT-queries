; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111220 () Bool)

(assert start!111220)

(declare-fun mapNonEmpty!55244 () Bool)

(declare-fun mapRes!55244 () Bool)

(declare-fun tp!105350 () Bool)

(declare-fun e!751151 () Bool)

(assert (=> mapNonEmpty!55244 (= mapRes!55244 (and tp!105350 e!751151))))

(declare-datatypes ((V!52757 0))(
  ( (V!52758 (val!17945 Int)) )
))
(declare-datatypes ((ValueCell!16972 0))(
  ( (ValueCellFull!16972 (v!20574 V!52757)) (EmptyCell!16972) )
))
(declare-fun mapRest!55244 () (Array (_ BitVec 32) ValueCell!16972))

(declare-datatypes ((array!88440 0))(
  ( (array!88441 (arr!42699 (Array (_ BitVec 32) ValueCell!16972)) (size!43249 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88440)

(declare-fun mapKey!55244 () (_ BitVec 32))

(declare-fun mapValue!55244 () ValueCell!16972)

(assert (=> mapNonEmpty!55244 (= (arr!42699 _values!1337) (store mapRest!55244 mapKey!55244 mapValue!55244))))

(declare-fun res!874011 () Bool)

(declare-fun e!751153 () Bool)

(assert (=> start!111220 (=> (not res!874011) (not e!751153))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111220 (= res!874011 (validMask!0 mask!2019))))

(assert (=> start!111220 e!751153))

(assert (=> start!111220 true))

(declare-fun e!751154 () Bool)

(declare-fun array_inv!32249 (array!88440) Bool)

(assert (=> start!111220 (and (array_inv!32249 _values!1337) e!751154)))

(declare-datatypes ((array!88442 0))(
  ( (array!88443 (arr!42700 (Array (_ BitVec 32) (_ BitVec 64))) (size!43250 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88442)

(declare-fun array_inv!32250 (array!88442) Bool)

(assert (=> start!111220 (array_inv!32250 _keys!1609)))

(declare-fun b!1316693 () Bool)

(declare-fun e!751150 () Bool)

(declare-fun tp_is_empty!35741 () Bool)

(assert (=> b!1316693 (= e!751150 tp_is_empty!35741)))

(declare-fun b!1316694 () Bool)

(assert (=> b!1316694 (= e!751151 tp_is_empty!35741)))

(declare-fun mapIsEmpty!55244 () Bool)

(assert (=> mapIsEmpty!55244 mapRes!55244))

(declare-fun b!1316695 () Bool)

(assert (=> b!1316695 (= e!751154 (and e!751150 mapRes!55244))))

(declare-fun condMapEmpty!55244 () Bool)

(declare-fun mapDefault!55244 () ValueCell!16972)

