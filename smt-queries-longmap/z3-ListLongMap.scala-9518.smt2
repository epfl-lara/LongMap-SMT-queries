; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112972 () Bool)

(assert start!112972)

(declare-fun mapNonEmpty!57241 () Bool)

(declare-fun mapRes!57241 () Bool)

(declare-fun tp!108940 () Bool)

(declare-fun e!762653 () Bool)

(assert (=> mapNonEmpty!57241 (= mapRes!57241 (and tp!108940 e!762653))))

(declare-datatypes ((V!54467 0))(
  ( (V!54468 (val!18586 Int)) )
))
(declare-datatypes ((ValueCell!17613 0))(
  ( (ValueCellFull!17613 (v!21234 V!54467)) (EmptyCell!17613) )
))
(declare-fun mapRest!57241 () (Array (_ BitVec 32) ValueCell!17613))

(declare-fun mapKey!57241 () (_ BitVec 32))

(declare-fun mapValue!57241 () ValueCell!17613)

(declare-datatypes ((array!90910 0))(
  ( (array!90911 (arr!43911 (Array (_ BitVec 32) ValueCell!17613)) (size!44461 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90910)

(assert (=> mapNonEmpty!57241 (= (arr!43911 _values!1303) (store mapRest!57241 mapKey!57241 mapValue!57241))))

(declare-fun b!1339121 () Bool)

(declare-fun res!888397 () Bool)

(declare-fun e!762649 () Bool)

(assert (=> b!1339121 (=> (not res!888397) (not e!762649))))

(declare-datatypes ((array!90912 0))(
  ( (array!90913 (arr!43912 (Array (_ BitVec 32) (_ BitVec 64))) (size!44462 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90912)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90912 (_ BitVec 32)) Bool)

(assert (=> b!1339121 (= res!888397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339122 () Bool)

(declare-fun e!762651 () Bool)

(declare-fun e!762650 () Bool)

(assert (=> b!1339122 (= e!762651 (and e!762650 mapRes!57241))))

(declare-fun condMapEmpty!57241 () Bool)

(declare-fun mapDefault!57241 () ValueCell!17613)

(assert (=> b!1339122 (= condMapEmpty!57241 (= (arr!43911 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17613)) mapDefault!57241)))))

(declare-fun res!888398 () Bool)

(assert (=> start!112972 (=> (not res!888398) (not e!762649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112972 (= res!888398 (validMask!0 mask!1977))))

(assert (=> start!112972 e!762649))

(assert (=> start!112972 true))

(declare-fun array_inv!33111 (array!90910) Bool)

(assert (=> start!112972 (and (array_inv!33111 _values!1303) e!762651)))

(declare-fun array_inv!33112 (array!90912) Bool)

(assert (=> start!112972 (array_inv!33112 _keys!1571)))

(declare-fun b!1339123 () Bool)

(assert (=> b!1339123 (= e!762649 false)))

(declare-fun lt!593838 () Bool)

(declare-datatypes ((List!31098 0))(
  ( (Nil!31095) (Cons!31094 (h!32303 (_ BitVec 64)) (t!45430 List!31098)) )
))
(declare-fun arrayNoDuplicates!0 (array!90912 (_ BitVec 32) List!31098) Bool)

(assert (=> b!1339123 (= lt!593838 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31095))))

(declare-fun mapIsEmpty!57241 () Bool)

(assert (=> mapIsEmpty!57241 mapRes!57241))

(declare-fun b!1339124 () Bool)

(declare-fun res!888399 () Bool)

(assert (=> b!1339124 (=> (not res!888399) (not e!762649))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339124 (= res!888399 (and (= (size!44461 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44462 _keys!1571) (size!44461 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339125 () Bool)

(declare-fun tp_is_empty!37023 () Bool)

(assert (=> b!1339125 (= e!762650 tp_is_empty!37023)))

(declare-fun b!1339126 () Bool)

(assert (=> b!1339126 (= e!762653 tp_is_empty!37023)))

(assert (= (and start!112972 res!888398) b!1339124))

(assert (= (and b!1339124 res!888399) b!1339121))

(assert (= (and b!1339121 res!888397) b!1339123))

(assert (= (and b!1339122 condMapEmpty!57241) mapIsEmpty!57241))

(assert (= (and b!1339122 (not condMapEmpty!57241)) mapNonEmpty!57241))

(get-info :version)

(assert (= (and mapNonEmpty!57241 ((_ is ValueCellFull!17613) mapValue!57241)) b!1339126))

(assert (= (and b!1339122 ((_ is ValueCellFull!17613) mapDefault!57241)) b!1339125))

(assert (= start!112972 b!1339122))

(declare-fun m!1227289 () Bool)

(assert (=> mapNonEmpty!57241 m!1227289))

(declare-fun m!1227291 () Bool)

(assert (=> b!1339121 m!1227291))

(declare-fun m!1227293 () Bool)

(assert (=> start!112972 m!1227293))

(declare-fun m!1227295 () Bool)

(assert (=> start!112972 m!1227295))

(declare-fun m!1227297 () Bool)

(assert (=> start!112972 m!1227297))

(declare-fun m!1227299 () Bool)

(assert (=> b!1339123 m!1227299))

(check-sat (not mapNonEmpty!57241) (not start!112972) (not b!1339121) (not b!1339123) tp_is_empty!37023)
(check-sat)
