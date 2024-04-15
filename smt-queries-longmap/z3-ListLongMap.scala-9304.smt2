; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111216 () Bool)

(assert start!111216)

(declare-fun mapNonEmpty!55238 () Bool)

(declare-fun mapRes!55238 () Bool)

(declare-fun tp!105345 () Bool)

(declare-fun e!751088 () Bool)

(assert (=> mapNonEmpty!55238 (= mapRes!55238 (and tp!105345 e!751088))))

(declare-fun mapKey!55238 () (_ BitVec 32))

(declare-datatypes ((V!52753 0))(
  ( (V!52754 (val!17943 Int)) )
))
(declare-datatypes ((ValueCell!16970 0))(
  ( (ValueCellFull!16970 (v!20571 V!52753)) (EmptyCell!16970) )
))
(declare-datatypes ((array!88343 0))(
  ( (array!88344 (arr!42651 (Array (_ BitVec 32) ValueCell!16970)) (size!43203 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88343)

(declare-fun mapValue!55238 () ValueCell!16970)

(declare-fun mapRest!55238 () (Array (_ BitVec 32) ValueCell!16970))

(assert (=> mapNonEmpty!55238 (= (arr!42651 _values!1337) (store mapRest!55238 mapKey!55238 mapValue!55238))))

(declare-fun b!1316599 () Bool)

(declare-fun e!751087 () Bool)

(declare-fun e!751089 () Bool)

(assert (=> b!1316599 (= e!751087 (and e!751089 mapRes!55238))))

(declare-fun condMapEmpty!55238 () Bool)

(declare-fun mapDefault!55238 () ValueCell!16970)

(assert (=> b!1316599 (= condMapEmpty!55238 (= (arr!42651 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16970)) mapDefault!55238)))))

(declare-fun res!873976 () Bool)

(declare-fun e!751090 () Bool)

(assert (=> start!111216 (=> (not res!873976) (not e!751090))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111216 (= res!873976 (validMask!0 mask!2019))))

(assert (=> start!111216 e!751090))

(assert (=> start!111216 true))

(declare-fun array_inv!32391 (array!88343) Bool)

(assert (=> start!111216 (and (array_inv!32391 _values!1337) e!751087)))

(declare-datatypes ((array!88345 0))(
  ( (array!88346 (arr!42652 (Array (_ BitVec 32) (_ BitVec 64))) (size!43204 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88345)

(declare-fun array_inv!32392 (array!88345) Bool)

(assert (=> start!111216 (array_inv!32392 _keys!1609)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun b!1316600 () Bool)

(assert (=> b!1316600 (= e!751090 (and (= (size!43203 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43204 _keys!1609) (size!43203 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011) (not (= (size!43204 _keys!1609) (bvadd #b00000000000000000000000000000001 mask!2019)))))))

(declare-fun b!1316601 () Bool)

(declare-fun tp_is_empty!35737 () Bool)

(assert (=> b!1316601 (= e!751089 tp_is_empty!35737)))

(declare-fun b!1316602 () Bool)

(assert (=> b!1316602 (= e!751088 tp_is_empty!35737)))

(declare-fun mapIsEmpty!55238 () Bool)

(assert (=> mapIsEmpty!55238 mapRes!55238))

(assert (= (and start!111216 res!873976) b!1316600))

(assert (= (and b!1316599 condMapEmpty!55238) mapIsEmpty!55238))

(assert (= (and b!1316599 (not condMapEmpty!55238)) mapNonEmpty!55238))

(get-info :version)

(assert (= (and mapNonEmpty!55238 ((_ is ValueCellFull!16970) mapValue!55238)) b!1316602))

(assert (= (and b!1316599 ((_ is ValueCellFull!16970) mapDefault!55238)) b!1316601))

(assert (= start!111216 b!1316599))

(declare-fun m!1204295 () Bool)

(assert (=> mapNonEmpty!55238 m!1204295))

(declare-fun m!1204297 () Bool)

(assert (=> start!111216 m!1204297))

(declare-fun m!1204299 () Bool)

(assert (=> start!111216 m!1204299))

(declare-fun m!1204301 () Bool)

(assert (=> start!111216 m!1204301))

(check-sat (not start!111216) (not mapNonEmpty!55238) tp_is_empty!35737)
(check-sat)
