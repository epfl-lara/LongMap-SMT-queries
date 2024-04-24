; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111440 () Bool)

(assert start!111440)

(declare-fun mapIsEmpty!55238 () Bool)

(declare-fun mapRes!55238 () Bool)

(assert (=> mapIsEmpty!55238 mapRes!55238))

(declare-fun b!1317968 () Bool)

(declare-fun e!751963 () Bool)

(declare-fun tp_is_empty!35737 () Bool)

(assert (=> b!1317968 (= e!751963 tp_is_empty!35737)))

(declare-fun b!1317969 () Bool)

(declare-fun e!751965 () Bool)

(assert (=> b!1317969 (= e!751965 tp_is_empty!35737)))

(declare-fun mapNonEmpty!55238 () Bool)

(declare-fun tp!105344 () Bool)

(assert (=> mapNonEmpty!55238 (= mapRes!55238 (and tp!105344 e!751963))))

(declare-fun mapKey!55238 () (_ BitVec 32))

(declare-datatypes ((V!52753 0))(
  ( (V!52754 (val!17943 Int)) )
))
(declare-datatypes ((ValueCell!16970 0))(
  ( (ValueCellFull!16970 (v!20567 V!52753)) (EmptyCell!16970) )
))
(declare-fun mapValue!55238 () ValueCell!16970)

(declare-fun mapRest!55238 () (Array (_ BitVec 32) ValueCell!16970))

(declare-datatypes ((array!88491 0))(
  ( (array!88492 (arr!42720 (Array (_ BitVec 32) ValueCell!16970)) (size!43271 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88491)

(assert (=> mapNonEmpty!55238 (= (arr!42720 _values!1337) (store mapRest!55238 mapKey!55238 mapValue!55238))))

(declare-fun b!1317970 () Bool)

(declare-fun e!751964 () Bool)

(assert (=> b!1317970 (= e!751964 (and e!751965 mapRes!55238))))

(declare-fun condMapEmpty!55238 () Bool)

(declare-fun mapDefault!55238 () ValueCell!16970)

(assert (=> b!1317970 (= condMapEmpty!55238 (= (arr!42720 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16970)) mapDefault!55238)))))

(declare-fun res!874523 () Bool)

(declare-fun e!751966 () Bool)

(assert (=> start!111440 (=> (not res!874523) (not e!751966))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111440 (= res!874523 (validMask!0 mask!2019))))

(assert (=> start!111440 e!751966))

(assert (=> start!111440 true))

(declare-fun array_inv!32531 (array!88491) Bool)

(assert (=> start!111440 (and (array_inv!32531 _values!1337) e!751964)))

(declare-datatypes ((array!88493 0))(
  ( (array!88494 (arr!42721 (Array (_ BitVec 32) (_ BitVec 64))) (size!43272 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88493)

(declare-fun array_inv!32532 (array!88493) Bool)

(assert (=> start!111440 (array_inv!32532 _keys!1609)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun b!1317971 () Bool)

(assert (=> b!1317971 (= e!751966 (and (= (size!43271 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43272 _keys!1609) (size!43271 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011) (not (= (size!43272 _keys!1609) (bvadd #b00000000000000000000000000000001 mask!2019)))))))

(assert (= (and start!111440 res!874523) b!1317971))

(assert (= (and b!1317970 condMapEmpty!55238) mapIsEmpty!55238))

(assert (= (and b!1317970 (not condMapEmpty!55238)) mapNonEmpty!55238))

(get-info :version)

(assert (= (and mapNonEmpty!55238 ((_ is ValueCellFull!16970) mapValue!55238)) b!1317968))

(assert (= (and b!1317970 ((_ is ValueCellFull!16970) mapDefault!55238)) b!1317969))

(assert (= start!111440 b!1317970))

(declare-fun m!1206409 () Bool)

(assert (=> mapNonEmpty!55238 m!1206409))

(declare-fun m!1206411 () Bool)

(assert (=> start!111440 m!1206411))

(declare-fun m!1206413 () Bool)

(assert (=> start!111440 m!1206413))

(declare-fun m!1206415 () Bool)

(assert (=> start!111440 m!1206415))

(check-sat (not start!111440) (not mapNonEmpty!55238) tp_is_empty!35737)
(check-sat)
