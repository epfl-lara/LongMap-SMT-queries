; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111218 () Bool)

(assert start!111218)

(declare-fun res!874008 () Bool)

(declare-fun e!751139 () Bool)

(assert (=> start!111218 (=> (not res!874008) (not e!751139))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111218 (= res!874008 (validMask!0 mask!2019))))

(assert (=> start!111218 e!751139))

(assert (=> start!111218 true))

(declare-datatypes ((V!52755 0))(
  ( (V!52756 (val!17944 Int)) )
))
(declare-datatypes ((ValueCell!16971 0))(
  ( (ValueCellFull!16971 (v!20573 V!52755)) (EmptyCell!16971) )
))
(declare-datatypes ((array!88436 0))(
  ( (array!88437 (arr!42697 (Array (_ BitVec 32) ValueCell!16971)) (size!43247 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88436)

(declare-fun e!751135 () Bool)

(declare-fun array_inv!32247 (array!88436) Bool)

(assert (=> start!111218 (and (array_inv!32247 _values!1337) e!751135)))

(declare-datatypes ((array!88438 0))(
  ( (array!88439 (arr!42698 (Array (_ BitVec 32) (_ BitVec 64))) (size!43248 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88438)

(declare-fun array_inv!32248 (array!88438) Bool)

(assert (=> start!111218 (array_inv!32248 _keys!1609)))

(declare-fun mapNonEmpty!55241 () Bool)

(declare-fun mapRes!55241 () Bool)

(declare-fun tp!105347 () Bool)

(declare-fun e!751137 () Bool)

(assert (=> mapNonEmpty!55241 (= mapRes!55241 (and tp!105347 e!751137))))

(declare-fun mapRest!55241 () (Array (_ BitVec 32) ValueCell!16971))

(declare-fun mapValue!55241 () ValueCell!16971)

(declare-fun mapKey!55241 () (_ BitVec 32))

(assert (=> mapNonEmpty!55241 (= (arr!42697 _values!1337) (store mapRest!55241 mapKey!55241 mapValue!55241))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun b!1316681 () Bool)

(assert (=> b!1316681 (= e!751139 (and (= (size!43247 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43248 _keys!1609) (size!43247 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011) (not (= (size!43248 _keys!1609) (bvadd #b00000000000000000000000000000001 mask!2019)))))))

(declare-fun b!1316682 () Bool)

(declare-fun tp_is_empty!35739 () Bool)

(assert (=> b!1316682 (= e!751137 tp_is_empty!35739)))

(declare-fun mapIsEmpty!55241 () Bool)

(assert (=> mapIsEmpty!55241 mapRes!55241))

(declare-fun b!1316683 () Bool)

(declare-fun e!751136 () Bool)

(assert (=> b!1316683 (= e!751135 (and e!751136 mapRes!55241))))

(declare-fun condMapEmpty!55241 () Bool)

(declare-fun mapDefault!55241 () ValueCell!16971)

(assert (=> b!1316683 (= condMapEmpty!55241 (= (arr!42697 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16971)) mapDefault!55241)))))

(declare-fun b!1316684 () Bool)

(assert (=> b!1316684 (= e!751136 tp_is_empty!35739)))

(assert (= (and start!111218 res!874008) b!1316681))

(assert (= (and b!1316683 condMapEmpty!55241) mapIsEmpty!55241))

(assert (= (and b!1316683 (not condMapEmpty!55241)) mapNonEmpty!55241))

(get-info :version)

(assert (= (and mapNonEmpty!55241 ((_ is ValueCellFull!16971) mapValue!55241)) b!1316682))

(assert (= (and b!1316683 ((_ is ValueCellFull!16971) mapDefault!55241)) b!1316684))

(assert (= start!111218 b!1316683))

(declare-fun m!1204819 () Bool)

(assert (=> start!111218 m!1204819))

(declare-fun m!1204821 () Bool)

(assert (=> start!111218 m!1204821))

(declare-fun m!1204823 () Bool)

(assert (=> start!111218 m!1204823))

(declare-fun m!1204825 () Bool)

(assert (=> mapNonEmpty!55241 m!1204825))

(check-sat (not start!111218) (not mapNonEmpty!55241) tp_is_empty!35739)
(check-sat)
