; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111520 () Bool)

(assert start!111520)

(declare-fun b!1318404 () Bool)

(declare-fun e!752330 () Bool)

(assert (=> b!1318404 (= e!752330 false)))

(declare-fun lt!586790 () Bool)

(declare-datatypes ((array!88569 0))(
  ( (array!88570 (arr!42754 (Array (_ BitVec 32) (_ BitVec 64))) (size!43305 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88569)

(declare-datatypes ((List!30326 0))(
  ( (Nil!30323) (Cons!30322 (h!31540 (_ BitVec 64)) (t!43926 List!30326)) )
))
(declare-fun arrayNoDuplicates!0 (array!88569 (_ BitVec 32) List!30326) Bool)

(assert (=> b!1318404 (= lt!586790 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30323))))

(declare-fun b!1318405 () Bool)

(declare-fun e!752331 () Bool)

(declare-fun tp_is_empty!35773 () Bool)

(assert (=> b!1318405 (= e!752331 tp_is_empty!35773)))

(declare-fun mapNonEmpty!55307 () Bool)

(declare-fun mapRes!55307 () Bool)

(declare-fun tp!105413 () Bool)

(assert (=> mapNonEmpty!55307 (= mapRes!55307 (and tp!105413 e!752331))))

(declare-datatypes ((V!52801 0))(
  ( (V!52802 (val!17961 Int)) )
))
(declare-datatypes ((ValueCell!16988 0))(
  ( (ValueCellFull!16988 (v!20586 V!52801)) (EmptyCell!16988) )
))
(declare-fun mapValue!55307 () ValueCell!16988)

(declare-fun mapKey!55307 () (_ BitVec 32))

(declare-datatypes ((array!88571 0))(
  ( (array!88572 (arr!42755 (Array (_ BitVec 32) ValueCell!16988)) (size!43306 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88571)

(declare-fun mapRest!55307 () (Array (_ BitVec 32) ValueCell!16988))

(assert (=> mapNonEmpty!55307 (= (arr!42755 _values!1337) (store mapRest!55307 mapKey!55307 mapValue!55307))))

(declare-fun res!874735 () Bool)

(assert (=> start!111520 (=> (not res!874735) (not e!752330))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111520 (= res!874735 (validMask!0 mask!2019))))

(assert (=> start!111520 e!752330))

(assert (=> start!111520 true))

(declare-fun e!752328 () Bool)

(declare-fun array_inv!32561 (array!88571) Bool)

(assert (=> start!111520 (and (array_inv!32561 _values!1337) e!752328)))

(declare-fun array_inv!32562 (array!88569) Bool)

(assert (=> start!111520 (array_inv!32562 _keys!1609)))

(declare-fun b!1318406 () Bool)

(declare-fun e!752332 () Bool)

(assert (=> b!1318406 (= e!752332 tp_is_empty!35773)))

(declare-fun b!1318407 () Bool)

(declare-fun res!874734 () Bool)

(assert (=> b!1318407 (=> (not res!874734) (not e!752330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88569 (_ BitVec 32)) Bool)

(assert (=> b!1318407 (= res!874734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318408 () Bool)

(declare-fun res!874733 () Bool)

(assert (=> b!1318408 (=> (not res!874733) (not e!752330))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318408 (= res!874733 (and (= (size!43306 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43305 _keys!1609) (size!43306 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318409 () Bool)

(assert (=> b!1318409 (= e!752328 (and e!752332 mapRes!55307))))

(declare-fun condMapEmpty!55307 () Bool)

(declare-fun mapDefault!55307 () ValueCell!16988)

(assert (=> b!1318409 (= condMapEmpty!55307 (= (arr!42755 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16988)) mapDefault!55307)))))

(declare-fun mapIsEmpty!55307 () Bool)

(assert (=> mapIsEmpty!55307 mapRes!55307))

(assert (= (and start!111520 res!874735) b!1318408))

(assert (= (and b!1318408 res!874733) b!1318407))

(assert (= (and b!1318407 res!874734) b!1318404))

(assert (= (and b!1318409 condMapEmpty!55307) mapIsEmpty!55307))

(assert (= (and b!1318409 (not condMapEmpty!55307)) mapNonEmpty!55307))

(get-info :version)

(assert (= (and mapNonEmpty!55307 ((_ is ValueCellFull!16988) mapValue!55307)) b!1318405))

(assert (= (and b!1318409 ((_ is ValueCellFull!16988) mapDefault!55307)) b!1318406))

(assert (= start!111520 b!1318409))

(declare-fun m!1206677 () Bool)

(assert (=> b!1318404 m!1206677))

(declare-fun m!1206679 () Bool)

(assert (=> mapNonEmpty!55307 m!1206679))

(declare-fun m!1206681 () Bool)

(assert (=> start!111520 m!1206681))

(declare-fun m!1206683 () Bool)

(assert (=> start!111520 m!1206683))

(declare-fun m!1206685 () Bool)

(assert (=> start!111520 m!1206685))

(declare-fun m!1206687 () Bool)

(assert (=> b!1318407 m!1206687))

(check-sat (not mapNonEmpty!55307) (not b!1318407) tp_is_empty!35773 (not start!111520) (not b!1318404))
(check-sat)
