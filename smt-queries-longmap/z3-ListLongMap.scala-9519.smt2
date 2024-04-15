; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112976 () Bool)

(assert start!112976)

(declare-fun b!1339087 () Bool)

(declare-fun e!762647 () Bool)

(declare-fun tp_is_empty!37027 () Bool)

(assert (=> b!1339087 (= e!762647 tp_is_empty!37027)))

(declare-fun mapIsEmpty!57247 () Bool)

(declare-fun mapRes!57247 () Bool)

(assert (=> mapIsEmpty!57247 mapRes!57247))

(declare-fun b!1339088 () Bool)

(declare-fun e!762650 () Bool)

(declare-fun e!762649 () Bool)

(assert (=> b!1339088 (= e!762650 (and e!762649 mapRes!57247))))

(declare-fun condMapEmpty!57247 () Bool)

(declare-datatypes ((V!54473 0))(
  ( (V!54474 (val!18588 Int)) )
))
(declare-datatypes ((ValueCell!17615 0))(
  ( (ValueCellFull!17615 (v!21235 V!54473)) (EmptyCell!17615) )
))
(declare-datatypes ((array!90861 0))(
  ( (array!90862 (arr!43887 (Array (_ BitVec 32) ValueCell!17615)) (size!44439 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90861)

(declare-fun mapDefault!57247 () ValueCell!17615)

(assert (=> b!1339088 (= condMapEmpty!57247 (= (arr!43887 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17615)) mapDefault!57247)))))

(declare-fun res!888387 () Bool)

(declare-fun e!762646 () Bool)

(assert (=> start!112976 (=> (not res!888387) (not e!762646))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112976 (= res!888387 (validMask!0 mask!1977))))

(assert (=> start!112976 e!762646))

(assert (=> start!112976 true))

(declare-fun array_inv!33283 (array!90861) Bool)

(assert (=> start!112976 (and (array_inv!33283 _values!1303) e!762650)))

(declare-datatypes ((array!90863 0))(
  ( (array!90864 (arr!43888 (Array (_ BitVec 32) (_ BitVec 64))) (size!44440 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90863)

(declare-fun array_inv!33284 (array!90863) Bool)

(assert (=> start!112976 (array_inv!33284 _keys!1571)))

(declare-fun mapNonEmpty!57247 () Bool)

(declare-fun tp!108947 () Bool)

(assert (=> mapNonEmpty!57247 (= mapRes!57247 (and tp!108947 e!762647))))

(declare-fun mapKey!57247 () (_ BitVec 32))

(declare-fun mapRest!57247 () (Array (_ BitVec 32) ValueCell!17615))

(declare-fun mapValue!57247 () ValueCell!17615)

(assert (=> mapNonEmpty!57247 (= (arr!43887 _values!1303) (store mapRest!57247 mapKey!57247 mapValue!57247))))

(declare-fun b!1339089 () Bool)

(assert (=> b!1339089 (= e!762646 false)))

(declare-fun lt!593658 () Bool)

(declare-datatypes ((List!31143 0))(
  ( (Nil!31140) (Cons!31139 (h!32348 (_ BitVec 64)) (t!45467 List!31143)) )
))
(declare-fun arrayNoDuplicates!0 (array!90863 (_ BitVec 32) List!31143) Bool)

(assert (=> b!1339089 (= lt!593658 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31140))))

(declare-fun b!1339090 () Bool)

(declare-fun res!888386 () Bool)

(assert (=> b!1339090 (=> (not res!888386) (not e!762646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90863 (_ BitVec 32)) Bool)

(assert (=> b!1339090 (= res!888386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339091 () Bool)

(declare-fun res!888388 () Bool)

(assert (=> b!1339091 (=> (not res!888388) (not e!762646))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339091 (= res!888388 (and (= (size!44439 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44440 _keys!1571) (size!44439 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339092 () Bool)

(assert (=> b!1339092 (= e!762649 tp_is_empty!37027)))

(assert (= (and start!112976 res!888387) b!1339091))

(assert (= (and b!1339091 res!888388) b!1339090))

(assert (= (and b!1339090 res!888386) b!1339089))

(assert (= (and b!1339088 condMapEmpty!57247) mapIsEmpty!57247))

(assert (= (and b!1339088 (not condMapEmpty!57247)) mapNonEmpty!57247))

(get-info :version)

(assert (= (and mapNonEmpty!57247 ((_ is ValueCellFull!17615) mapValue!57247)) b!1339087))

(assert (= (and b!1339088 ((_ is ValueCellFull!17615) mapDefault!57247)) b!1339092))

(assert (= start!112976 b!1339088))

(declare-fun m!1226797 () Bool)

(assert (=> start!112976 m!1226797))

(declare-fun m!1226799 () Bool)

(assert (=> start!112976 m!1226799))

(declare-fun m!1226801 () Bool)

(assert (=> start!112976 m!1226801))

(declare-fun m!1226803 () Bool)

(assert (=> mapNonEmpty!57247 m!1226803))

(declare-fun m!1226805 () Bool)

(assert (=> b!1339089 m!1226805))

(declare-fun m!1226807 () Bool)

(assert (=> b!1339090 m!1226807))

(check-sat (not start!112976) (not b!1339089) (not b!1339090) (not mapNonEmpty!57247) tp_is_empty!37027)
(check-sat)
