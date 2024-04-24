; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3908 () Bool)

(assert start!3908)

(declare-fun b_free!817 () Bool)

(declare-fun b_next!817 () Bool)

(assert (=> start!3908 (= b_free!817 (not b_next!817))))

(declare-fun tp!3871 () Bool)

(declare-fun b_and!1617 () Bool)

(assert (=> start!3908 (= tp!3871 b_and!1617)))

(declare-fun b!27564 () Bool)

(declare-fun res!16341 () Bool)

(declare-fun e!17926 () Bool)

(assert (=> b!27564 (=> (not res!16341) (not e!17926))))

(declare-datatypes ((V!1387 0))(
  ( (V!1388 (val!612 Int)) )
))
(declare-datatypes ((ValueCell!386 0))(
  ( (ValueCellFull!386 (v!1701 V!1387)) (EmptyCell!386) )
))
(declare-datatypes ((array!1565 0))(
  ( (array!1566 (arr!736 (Array (_ BitVec 32) ValueCell!386)) (size!837 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1565)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1567 0))(
  ( (array!1568 (arr!737 (Array (_ BitVec 32) (_ BitVec 64))) (size!838 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1567)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!27564 (= res!16341 (and (= (size!837 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!838 _keys!1833) (size!837 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27565 () Bool)

(declare-fun res!16342 () Bool)

(assert (=> b!27565 (=> (not res!16342) (not e!17926))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27565 (= res!16342 (validKeyInArray!0 k0!1304))))

(declare-fun b!27566 () Bool)

(declare-fun res!16339 () Bool)

(assert (=> b!27566 (=> (not res!16339) (not e!17926))))

(declare-datatypes ((List!618 0))(
  ( (Nil!615) (Cons!614 (h!1181 (_ BitVec 64)) (t!3305 List!618)) )
))
(declare-fun arrayNoDuplicates!0 (array!1567 (_ BitVec 32) List!618) Bool)

(assert (=> b!27566 (= res!16339 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!615))))

(declare-fun b!27567 () Bool)

(declare-fun e!17922 () Bool)

(declare-fun tp_is_empty!1171 () Bool)

(assert (=> b!27567 (= e!17922 tp_is_empty!1171)))

(declare-fun b!27568 () Bool)

(declare-fun res!16338 () Bool)

(assert (=> b!27568 (=> (not res!16338) (not e!17926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1567 (_ BitVec 32)) Bool)

(assert (=> b!27568 (= res!16338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1285 () Bool)

(declare-fun mapRes!1285 () Bool)

(declare-fun tp!3870 () Bool)

(assert (=> mapNonEmpty!1285 (= mapRes!1285 (and tp!3870 e!17922))))

(declare-fun mapValue!1285 () ValueCell!386)

(declare-fun mapRest!1285 () (Array (_ BitVec 32) ValueCell!386))

(declare-fun mapKey!1285 () (_ BitVec 32))

(assert (=> mapNonEmpty!1285 (= (arr!736 _values!1501) (store mapRest!1285 mapKey!1285 mapValue!1285))))

(declare-fun b!27569 () Bool)

(assert (=> b!27569 (= e!17926 false)))

(declare-fun lt!10656 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1567 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27569 (= lt!10656 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27570 () Bool)

(declare-fun e!17925 () Bool)

(assert (=> b!27570 (= e!17925 tp_is_empty!1171)))

(declare-fun mapIsEmpty!1285 () Bool)

(assert (=> mapIsEmpty!1285 mapRes!1285))

(declare-fun b!27571 () Bool)

(declare-fun res!16343 () Bool)

(assert (=> b!27571 (=> (not res!16343) (not e!17926))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1387)

(declare-fun minValue!1443 () V!1387)

(declare-datatypes ((tuple2!1024 0))(
  ( (tuple2!1025 (_1!523 (_ BitVec 64)) (_2!523 V!1387)) )
))
(declare-datatypes ((List!619 0))(
  ( (Nil!616) (Cons!615 (h!1182 tuple2!1024) (t!3306 List!619)) )
))
(declare-datatypes ((ListLongMap!595 0))(
  ( (ListLongMap!596 (toList!313 List!619)) )
))
(declare-fun contains!255 (ListLongMap!595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!143 (array!1567 array!1565 (_ BitVec 32) (_ BitVec 32) V!1387 V!1387 (_ BitVec 32) Int) ListLongMap!595)

(assert (=> b!27571 (= res!16343 (not (contains!255 (getCurrentListMap!143 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun res!16337 () Bool)

(assert (=> start!3908 (=> (not res!16337) (not e!17926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3908 (= res!16337 (validMask!0 mask!2294))))

(assert (=> start!3908 e!17926))

(assert (=> start!3908 true))

(assert (=> start!3908 tp!3871))

(declare-fun e!17924 () Bool)

(declare-fun array_inv!515 (array!1565) Bool)

(assert (=> start!3908 (and (array_inv!515 _values!1501) e!17924)))

(declare-fun array_inv!516 (array!1567) Bool)

(assert (=> start!3908 (array_inv!516 _keys!1833)))

(assert (=> start!3908 tp_is_empty!1171))

(declare-fun b!27572 () Bool)

(assert (=> b!27572 (= e!17924 (and e!17925 mapRes!1285))))

(declare-fun condMapEmpty!1285 () Bool)

(declare-fun mapDefault!1285 () ValueCell!386)

(assert (=> b!27572 (= condMapEmpty!1285 (= (arr!736 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!386)) mapDefault!1285)))))

(declare-fun b!27573 () Bool)

(declare-fun res!16340 () Bool)

(assert (=> b!27573 (=> (not res!16340) (not e!17926))))

(declare-fun arrayContainsKey!0 (array!1567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27573 (= res!16340 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3908 res!16337) b!27564))

(assert (= (and b!27564 res!16341) b!27568))

(assert (= (and b!27568 res!16338) b!27566))

(assert (= (and b!27566 res!16339) b!27565))

(assert (= (and b!27565 res!16342) b!27571))

(assert (= (and b!27571 res!16343) b!27573))

(assert (= (and b!27573 res!16340) b!27569))

(assert (= (and b!27572 condMapEmpty!1285) mapIsEmpty!1285))

(assert (= (and b!27572 (not condMapEmpty!1285)) mapNonEmpty!1285))

(get-info :version)

(assert (= (and mapNonEmpty!1285 ((_ is ValueCellFull!386) mapValue!1285)) b!27567))

(assert (= (and b!27572 ((_ is ValueCellFull!386) mapDefault!1285)) b!27570))

(assert (= start!3908 b!27572))

(declare-fun m!21887 () Bool)

(assert (=> b!27571 m!21887))

(assert (=> b!27571 m!21887))

(declare-fun m!21889 () Bool)

(assert (=> b!27571 m!21889))

(declare-fun m!21891 () Bool)

(assert (=> b!27569 m!21891))

(declare-fun m!21893 () Bool)

(assert (=> start!3908 m!21893))

(declare-fun m!21895 () Bool)

(assert (=> start!3908 m!21895))

(declare-fun m!21897 () Bool)

(assert (=> start!3908 m!21897))

(declare-fun m!21899 () Bool)

(assert (=> mapNonEmpty!1285 m!21899))

(declare-fun m!21901 () Bool)

(assert (=> b!27566 m!21901))

(declare-fun m!21903 () Bool)

(assert (=> b!27568 m!21903))

(declare-fun m!21905 () Bool)

(assert (=> b!27573 m!21905))

(declare-fun m!21907 () Bool)

(assert (=> b!27565 m!21907))

(check-sat (not b_next!817) (not b!27566) (not b!27571) (not start!3908) (not b!27569) (not mapNonEmpty!1285) (not b!27565) (not b!27568) (not b!27573) tp_is_empty!1171 b_and!1617)
(check-sat b_and!1617 (not b_next!817))
