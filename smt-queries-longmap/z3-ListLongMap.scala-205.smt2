; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3902 () Bool)

(assert start!3902)

(declare-fun b_free!817 () Bool)

(declare-fun b_next!817 () Bool)

(assert (=> start!3902 (= b_free!817 (not b_next!817))))

(declare-fun tp!3870 () Bool)

(declare-fun b_and!1621 () Bool)

(assert (=> start!3902 (= tp!3870 b_and!1621)))

(declare-fun b!27582 () Bool)

(declare-fun e!17932 () Bool)

(assert (=> b!27582 (= e!17932 false)))

(declare-fun lt!10696 () (_ BitVec 32))

(declare-datatypes ((array!1557 0))(
  ( (array!1558 (arr!732 (Array (_ BitVec 32) (_ BitVec 64))) (size!833 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1557)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1557 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27582 (= lt!10696 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1285 () Bool)

(declare-fun mapRes!1285 () Bool)

(declare-fun tp!3871 () Bool)

(declare-fun e!17934 () Bool)

(assert (=> mapNonEmpty!1285 (= mapRes!1285 (and tp!3871 e!17934))))

(declare-datatypes ((V!1387 0))(
  ( (V!1388 (val!612 Int)) )
))
(declare-datatypes ((ValueCell!386 0))(
  ( (ValueCellFull!386 (v!1700 V!1387)) (EmptyCell!386) )
))
(declare-datatypes ((array!1559 0))(
  ( (array!1560 (arr!733 (Array (_ BitVec 32) ValueCell!386)) (size!834 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1559)

(declare-fun mapRest!1285 () (Array (_ BitVec 32) ValueCell!386))

(declare-fun mapValue!1285 () ValueCell!386)

(declare-fun mapKey!1285 () (_ BitVec 32))

(assert (=> mapNonEmpty!1285 (= (arr!733 _values!1501) (store mapRest!1285 mapKey!1285 mapValue!1285))))

(declare-fun b!27583 () Bool)

(declare-fun tp_is_empty!1171 () Bool)

(assert (=> b!27583 (= e!17934 tp_is_empty!1171)))

(declare-fun b!27584 () Bool)

(declare-fun res!16350 () Bool)

(assert (=> b!27584 (=> (not res!16350) (not e!17932))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1557 (_ BitVec 32)) Bool)

(assert (=> b!27584 (= res!16350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27585 () Bool)

(declare-fun res!16349 () Bool)

(assert (=> b!27585 (=> (not res!16349) (not e!17932))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1387)

(declare-fun minValue!1443 () V!1387)

(declare-datatypes ((tuple2!1038 0))(
  ( (tuple2!1039 (_1!530 (_ BitVec 64)) (_2!530 V!1387)) )
))
(declare-datatypes ((List!623 0))(
  ( (Nil!620) (Cons!619 (h!1186 tuple2!1038) (t!3309 List!623)) )
))
(declare-datatypes ((ListLongMap!603 0))(
  ( (ListLongMap!604 (toList!317 List!623)) )
))
(declare-fun contains!258 (ListLongMap!603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!147 (array!1557 array!1559 (_ BitVec 32) (_ BitVec 32) V!1387 V!1387 (_ BitVec 32) Int) ListLongMap!603)

(assert (=> b!27585 (= res!16349 (not (contains!258 (getCurrentListMap!147 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27586 () Bool)

(declare-fun res!16348 () Bool)

(assert (=> b!27586 (=> (not res!16348) (not e!17932))))

(declare-datatypes ((List!624 0))(
  ( (Nil!621) (Cons!620 (h!1187 (_ BitVec 64)) (t!3310 List!624)) )
))
(declare-fun arrayNoDuplicates!0 (array!1557 (_ BitVec 32) List!624) Bool)

(assert (=> b!27586 (= res!16348 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!621))))

(declare-fun res!16346 () Bool)

(assert (=> start!3902 (=> (not res!16346) (not e!17932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3902 (= res!16346 (validMask!0 mask!2294))))

(assert (=> start!3902 e!17932))

(assert (=> start!3902 true))

(assert (=> start!3902 tp!3870))

(declare-fun e!17933 () Bool)

(declare-fun array_inv!523 (array!1559) Bool)

(assert (=> start!3902 (and (array_inv!523 _values!1501) e!17933)))

(declare-fun array_inv!524 (array!1557) Bool)

(assert (=> start!3902 (array_inv!524 _keys!1833)))

(assert (=> start!3902 tp_is_empty!1171))

(declare-fun b!27587 () Bool)

(declare-fun res!16351 () Bool)

(assert (=> b!27587 (=> (not res!16351) (not e!17932))))

(declare-fun arrayContainsKey!0 (array!1557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27587 (= res!16351 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27588 () Bool)

(declare-fun res!16345 () Bool)

(assert (=> b!27588 (=> (not res!16345) (not e!17932))))

(assert (=> b!27588 (= res!16345 (and (= (size!834 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!833 _keys!1833) (size!834 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27589 () Bool)

(declare-fun res!16347 () Bool)

(assert (=> b!27589 (=> (not res!16347) (not e!17932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27589 (= res!16347 (validKeyInArray!0 k0!1304))))

(declare-fun b!27590 () Bool)

(declare-fun e!17931 () Bool)

(assert (=> b!27590 (= e!17931 tp_is_empty!1171)))

(declare-fun mapIsEmpty!1285 () Bool)

(assert (=> mapIsEmpty!1285 mapRes!1285))

(declare-fun b!27591 () Bool)

(assert (=> b!27591 (= e!17933 (and e!17931 mapRes!1285))))

(declare-fun condMapEmpty!1285 () Bool)

(declare-fun mapDefault!1285 () ValueCell!386)

(assert (=> b!27591 (= condMapEmpty!1285 (= (arr!733 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!386)) mapDefault!1285)))))

(assert (= (and start!3902 res!16346) b!27588))

(assert (= (and b!27588 res!16345) b!27584))

(assert (= (and b!27584 res!16350) b!27586))

(assert (= (and b!27586 res!16348) b!27589))

(assert (= (and b!27589 res!16347) b!27585))

(assert (= (and b!27585 res!16349) b!27587))

(assert (= (and b!27587 res!16351) b!27582))

(assert (= (and b!27591 condMapEmpty!1285) mapIsEmpty!1285))

(assert (= (and b!27591 (not condMapEmpty!1285)) mapNonEmpty!1285))

(get-info :version)

(assert (= (and mapNonEmpty!1285 ((_ is ValueCellFull!386) mapValue!1285)) b!27583))

(assert (= (and b!27591 ((_ is ValueCellFull!386) mapDefault!1285)) b!27590))

(assert (= start!3902 b!27591))

(declare-fun m!21969 () Bool)

(assert (=> b!27587 m!21969))

(declare-fun m!21971 () Bool)

(assert (=> b!27584 m!21971))

(declare-fun m!21973 () Bool)

(assert (=> b!27582 m!21973))

(declare-fun m!21975 () Bool)

(assert (=> b!27589 m!21975))

(declare-fun m!21977 () Bool)

(assert (=> mapNonEmpty!1285 m!21977))

(declare-fun m!21979 () Bool)

(assert (=> b!27586 m!21979))

(declare-fun m!21981 () Bool)

(assert (=> start!3902 m!21981))

(declare-fun m!21983 () Bool)

(assert (=> start!3902 m!21983))

(declare-fun m!21985 () Bool)

(assert (=> start!3902 m!21985))

(declare-fun m!21987 () Bool)

(assert (=> b!27585 m!21987))

(assert (=> b!27585 m!21987))

(declare-fun m!21989 () Bool)

(assert (=> b!27585 m!21989))

(check-sat (not mapNonEmpty!1285) (not b!27585) (not b!27584) (not b!27587) (not start!3902) (not b!27586) b_and!1621 tp_is_empty!1171 (not b!27589) (not b_next!817) (not b!27582))
(check-sat b_and!1621 (not b_next!817))
