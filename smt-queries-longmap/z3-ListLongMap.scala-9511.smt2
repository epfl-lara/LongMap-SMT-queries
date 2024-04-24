; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113108 () Bool)

(assert start!113108)

(declare-fun b!1339912 () Bool)

(declare-fun e!763069 () Bool)

(declare-fun tp_is_empty!36979 () Bool)

(assert (=> b!1339912 (= e!763069 tp_is_empty!36979)))

(declare-fun res!888669 () Bool)

(declare-fun e!763070 () Bool)

(assert (=> start!113108 (=> (not res!888669) (not e!763070))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113108 (= res!888669 (validMask!0 mask!1977))))

(assert (=> start!113108 e!763070))

(assert (=> start!113108 true))

(declare-datatypes ((V!54409 0))(
  ( (V!54410 (val!18564 Int)) )
))
(declare-datatypes ((ValueCell!17591 0))(
  ( (ValueCellFull!17591 (v!21206 V!54409)) (EmptyCell!17591) )
))
(declare-datatypes ((array!90939 0))(
  ( (array!90940 (arr!43926 (Array (_ BitVec 32) ValueCell!17591)) (size!44477 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90939)

(declare-fun e!763071 () Bool)

(declare-fun array_inv!33391 (array!90939) Bool)

(assert (=> start!113108 (and (array_inv!33391 _values!1303) e!763071)))

(declare-datatypes ((array!90941 0))(
  ( (array!90942 (arr!43927 (Array (_ BitVec 32) (_ BitVec 64))) (size!44478 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90941)

(declare-fun array_inv!33392 (array!90941) Bool)

(assert (=> start!113108 (array_inv!33392 _keys!1571)))

(declare-fun b!1339913 () Bool)

(declare-fun e!763067 () Bool)

(assert (=> b!1339913 (= e!763067 tp_is_empty!36979)))

(declare-fun mapIsEmpty!57160 () Bool)

(declare-fun mapRes!57160 () Bool)

(assert (=> mapIsEmpty!57160 mapRes!57160))

(declare-fun b!1339914 () Bool)

(assert (=> b!1339914 (= e!763071 (and e!763069 mapRes!57160))))

(declare-fun condMapEmpty!57160 () Bool)

(declare-fun mapDefault!57160 () ValueCell!17591)

(assert (=> b!1339914 (= condMapEmpty!57160 (= (arr!43926 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17591)) mapDefault!57160)))))

(declare-fun mapNonEmpty!57160 () Bool)

(declare-fun tp!108859 () Bool)

(assert (=> mapNonEmpty!57160 (= mapRes!57160 (and tp!108859 e!763067))))

(declare-fun mapRest!57160 () (Array (_ BitVec 32) ValueCell!17591))

(declare-fun mapKey!57160 () (_ BitVec 32))

(declare-fun mapValue!57160 () ValueCell!17591)

(assert (=> mapNonEmpty!57160 (= (arr!43926 _values!1303) (store mapRest!57160 mapKey!57160 mapValue!57160))))

(declare-fun b!1339915 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339915 (= e!763070 (and (= (size!44477 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44478 _keys!1571) (size!44477 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011) (not (= (size!44478 _keys!1571) (bvadd #b00000000000000000000000000000001 mask!1977)))))))

(assert (= (and start!113108 res!888669) b!1339915))

(assert (= (and b!1339914 condMapEmpty!57160) mapIsEmpty!57160))

(assert (= (and b!1339914 (not condMapEmpty!57160)) mapNonEmpty!57160))

(get-info :version)

(assert (= (and mapNonEmpty!57160 ((_ is ValueCellFull!17591) mapValue!57160)) b!1339913))

(assert (= (and b!1339914 ((_ is ValueCellFull!17591) mapDefault!57160)) b!1339912))

(assert (= start!113108 b!1339914))

(declare-fun m!1228571 () Bool)

(assert (=> start!113108 m!1228571))

(declare-fun m!1228573 () Bool)

(assert (=> start!113108 m!1228573))

(declare-fun m!1228575 () Bool)

(assert (=> start!113108 m!1228575))

(declare-fun m!1228577 () Bool)

(assert (=> mapNonEmpty!57160 m!1228577))

(check-sat (not start!113108) (not mapNonEmpty!57160) tp_is_empty!36979)
(check-sat)
