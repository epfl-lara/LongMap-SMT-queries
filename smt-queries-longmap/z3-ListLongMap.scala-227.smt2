; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4046 () Bool)

(assert start!4046)

(declare-fun b_free!951 () Bool)

(declare-fun b_next!951 () Bool)

(assert (=> start!4046 (= b_free!951 (not b_next!951))))

(declare-fun tp!4272 () Bool)

(declare-fun b_and!1761 () Bool)

(assert (=> start!4046 (= tp!4272 b_and!1761)))

(declare-fun b!29673 () Bool)

(declare-fun res!17814 () Bool)

(declare-fun e!19144 () Bool)

(assert (=> b!29673 (=> (not res!17814) (not e!19144))))

(declare-datatypes ((array!1841 0))(
  ( (array!1842 (arr!874 (Array (_ BitVec 32) (_ BitVec 64))) (size!975 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1841)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1841 (_ BitVec 32)) Bool)

(assert (=> b!29673 (= res!17814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29674 () Bool)

(declare-fun res!17812 () Bool)

(assert (=> b!29674 (=> (not res!17812) (not e!19144))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29674 (= res!17812 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29675 () Bool)

(declare-fun res!17811 () Bool)

(assert (=> b!29675 (=> (not res!17811) (not e!19144))))

(declare-datatypes ((List!724 0))(
  ( (Nil!721) (Cons!720 (h!1287 (_ BitVec 64)) (t!3417 List!724)) )
))
(declare-fun arrayNoDuplicates!0 (array!1841 (_ BitVec 32) List!724) Bool)

(assert (=> b!29675 (= res!17811 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!721))))

(declare-fun b!29676 () Bool)

(declare-fun res!17816 () Bool)

(assert (=> b!29676 (=> (not res!17816) (not e!19144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29676 (= res!17816 (validKeyInArray!0 k0!1304))))

(declare-fun b!29677 () Bool)

(declare-fun e!19142 () Bool)

(declare-fun e!19145 () Bool)

(declare-fun mapRes!1486 () Bool)

(assert (=> b!29677 (= e!19142 (and e!19145 mapRes!1486))))

(declare-fun condMapEmpty!1486 () Bool)

(declare-datatypes ((V!1565 0))(
  ( (V!1566 (val!679 Int)) )
))
(declare-datatypes ((ValueCell!453 0))(
  ( (ValueCellFull!453 (v!1768 V!1565)) (EmptyCell!453) )
))
(declare-datatypes ((array!1843 0))(
  ( (array!1844 (arr!875 (Array (_ BitVec 32) ValueCell!453)) (size!976 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1843)

(declare-fun mapDefault!1486 () ValueCell!453)

(assert (=> b!29677 (= condMapEmpty!1486 (= (arr!875 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!453)) mapDefault!1486)))))

(declare-fun res!17817 () Bool)

(assert (=> start!4046 (=> (not res!17817) (not e!19144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4046 (= res!17817 (validMask!0 mask!2294))))

(assert (=> start!4046 e!19144))

(assert (=> start!4046 true))

(assert (=> start!4046 tp!4272))

(declare-fun array_inv!609 (array!1843) Bool)

(assert (=> start!4046 (and (array_inv!609 _values!1501) e!19142)))

(declare-fun array_inv!610 (array!1841) Bool)

(assert (=> start!4046 (array_inv!610 _keys!1833)))

(declare-fun tp_is_empty!1305 () Bool)

(assert (=> start!4046 tp_is_empty!1305))

(declare-fun mapIsEmpty!1486 () Bool)

(assert (=> mapIsEmpty!1486 mapRes!1486))

(declare-fun mapNonEmpty!1486 () Bool)

(declare-fun tp!4273 () Bool)

(declare-fun e!19141 () Bool)

(assert (=> mapNonEmpty!1486 (= mapRes!1486 (and tp!4273 e!19141))))

(declare-fun mapKey!1486 () (_ BitVec 32))

(declare-fun mapValue!1486 () ValueCell!453)

(declare-fun mapRest!1486 () (Array (_ BitVec 32) ValueCell!453))

(assert (=> mapNonEmpty!1486 (= (arr!875 _values!1501) (store mapRest!1486 mapKey!1486 mapValue!1486))))

(declare-fun b!29678 () Bool)

(declare-fun res!17815 () Bool)

(assert (=> b!29678 (=> (not res!17815) (not e!19144))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!29678 (= res!17815 (and (= (size!976 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!975 _keys!1833) (size!976 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29679 () Bool)

(assert (=> b!29679 (= e!19141 tp_is_empty!1305)))

(declare-fun b!29680 () Bool)

(assert (=> b!29680 (= e!19144 (not (= (size!975 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun b!29681 () Bool)

(assert (=> b!29681 (= e!19145 tp_is_empty!1305)))

(declare-fun b!29682 () Bool)

(declare-fun res!17813 () Bool)

(assert (=> b!29682 (=> (not res!17813) (not e!19144))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1565)

(declare-fun minValue!1443 () V!1565)

(declare-datatypes ((tuple2!1124 0))(
  ( (tuple2!1125 (_1!573 (_ BitVec 64)) (_2!573 V!1565)) )
))
(declare-datatypes ((List!725 0))(
  ( (Nil!722) (Cons!721 (h!1288 tuple2!1124) (t!3418 List!725)) )
))
(declare-datatypes ((ListLongMap!701 0))(
  ( (ListLongMap!702 (toList!366 List!725)) )
))
(declare-fun contains!306 (ListLongMap!701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!194 (array!1841 array!1843 (_ BitVec 32) (_ BitVec 32) V!1565 V!1565 (_ BitVec 32) Int) ListLongMap!701)

(assert (=> b!29682 (= res!17813 (not (contains!306 (getCurrentListMap!194 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(assert (= (and start!4046 res!17817) b!29678))

(assert (= (and b!29678 res!17815) b!29673))

(assert (= (and b!29673 res!17814) b!29675))

(assert (= (and b!29675 res!17811) b!29676))

(assert (= (and b!29676 res!17816) b!29682))

(assert (= (and b!29682 res!17813) b!29674))

(assert (= (and b!29674 res!17812) b!29680))

(assert (= (and b!29677 condMapEmpty!1486) mapIsEmpty!1486))

(assert (= (and b!29677 (not condMapEmpty!1486)) mapNonEmpty!1486))

(get-info :version)

(assert (= (and mapNonEmpty!1486 ((_ is ValueCellFull!453) mapValue!1486)) b!29679))

(assert (= (and b!29677 ((_ is ValueCellFull!453) mapDefault!1486)) b!29681))

(assert (= start!4046 b!29677))

(declare-fun m!23895 () Bool)

(assert (=> start!4046 m!23895))

(declare-fun m!23897 () Bool)

(assert (=> start!4046 m!23897))

(declare-fun m!23899 () Bool)

(assert (=> start!4046 m!23899))

(declare-fun m!23901 () Bool)

(assert (=> b!29674 m!23901))

(declare-fun m!23903 () Bool)

(assert (=> mapNonEmpty!1486 m!23903))

(declare-fun m!23905 () Bool)

(assert (=> b!29676 m!23905))

(declare-fun m!23907 () Bool)

(assert (=> b!29682 m!23907))

(assert (=> b!29682 m!23907))

(declare-fun m!23909 () Bool)

(assert (=> b!29682 m!23909))

(declare-fun m!23911 () Bool)

(assert (=> b!29675 m!23911))

(declare-fun m!23913 () Bool)

(assert (=> b!29673 m!23913))

(check-sat (not b!29682) (not b!29674) (not start!4046) (not mapNonEmpty!1486) (not b!29676) (not b!29673) tp_is_empty!1305 (not b_next!951) b_and!1761 (not b!29675))
(check-sat b_and!1761 (not b_next!951))
