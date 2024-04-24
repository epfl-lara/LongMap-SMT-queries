; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108626 () Bool)

(assert start!108626)

(declare-fun b_free!27949 () Bool)

(declare-fun b_next!27949 () Bool)

(assert (=> start!108626 (= b_free!27949 (not b_next!27949))))

(declare-fun tp!98957 () Bool)

(declare-fun b_and!46011 () Bool)

(assert (=> start!108626 (= tp!98957 b_and!46011)))

(declare-fun b!1280697 () Bool)

(declare-fun res!850401 () Bool)

(declare-fun e!731828 () Bool)

(assert (=> b!1280697 (=> (not res!850401) (not e!731828))))

(declare-datatypes ((array!84293 0))(
  ( (array!84294 (arr!40646 (Array (_ BitVec 32) (_ BitVec 64))) (size!41197 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84293)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84293 (_ BitVec 32)) Bool)

(assert (=> b!1280697 (= res!850401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1280698 () Bool)

(declare-fun res!850400 () Bool)

(assert (=> b!1280698 (=> (not res!850400) (not e!731828))))

(declare-datatypes ((V!49889 0))(
  ( (V!49890 (val!16869 Int)) )
))
(declare-datatypes ((ValueCell!15896 0))(
  ( (ValueCellFull!15896 (v!19464 V!49889)) (EmptyCell!15896) )
))
(declare-datatypes ((array!84295 0))(
  ( (array!84296 (arr!40647 (Array (_ BitVec 32) ValueCell!15896)) (size!41198 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84295)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1280698 (= res!850400 (and (= (size!41198 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41197 _keys!1741) (size!41198 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1280699 () Bool)

(declare-fun e!731831 () Bool)

(declare-fun tp_is_empty!33589 () Bool)

(assert (=> b!1280699 (= e!731831 tp_is_empty!33589)))

(declare-fun b!1280700 () Bool)

(declare-fun res!850398 () Bool)

(assert (=> b!1280700 (=> (not res!850398) (not e!731828))))

(declare-datatypes ((List!28819 0))(
  ( (Nil!28816) (Cons!28815 (h!30033 (_ BitVec 64)) (t!42351 List!28819)) )
))
(declare-fun arrayNoDuplicates!0 (array!84293 (_ BitVec 32) List!28819) Bool)

(assert (=> b!1280700 (= res!850398 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28816))))

(declare-fun b!1280701 () Bool)

(declare-fun res!850399 () Bool)

(assert (=> b!1280701 (=> (not res!850399) (not e!731828))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1280701 (= res!850399 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41197 _keys!1741))))))

(declare-fun b!1280702 () Bool)

(declare-fun e!731830 () Bool)

(declare-fun mapRes!51935 () Bool)

(assert (=> b!1280702 (= e!731830 (and e!731831 mapRes!51935))))

(declare-fun condMapEmpty!51935 () Bool)

(declare-fun mapDefault!51935 () ValueCell!15896)

(assert (=> b!1280702 (= condMapEmpty!51935 (= (arr!40647 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15896)) mapDefault!51935)))))

(declare-fun mapNonEmpty!51935 () Bool)

(declare-fun tp!98956 () Bool)

(declare-fun e!731832 () Bool)

(assert (=> mapNonEmpty!51935 (= mapRes!51935 (and tp!98956 e!731832))))

(declare-fun mapValue!51935 () ValueCell!15896)

(declare-fun mapRest!51935 () (Array (_ BitVec 32) ValueCell!15896))

(declare-fun mapKey!51935 () (_ BitVec 32))

(assert (=> mapNonEmpty!51935 (= (arr!40647 _values!1445) (store mapRest!51935 mapKey!51935 mapValue!51935))))

(declare-fun b!1280703 () Bool)

(assert (=> b!1280703 (= e!731832 tp_is_empty!33589)))

(declare-fun mapIsEmpty!51935 () Bool)

(assert (=> mapIsEmpty!51935 mapRes!51935))

(declare-fun res!850397 () Bool)

(assert (=> start!108626 (=> (not res!850397) (not e!731828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108626 (= res!850397 (validMask!0 mask!2175))))

(assert (=> start!108626 e!731828))

(assert (=> start!108626 tp_is_empty!33589))

(assert (=> start!108626 true))

(declare-fun array_inv!31053 (array!84295) Bool)

(assert (=> start!108626 (and (array_inv!31053 _values!1445) e!731830)))

(declare-fun array_inv!31054 (array!84293) Bool)

(assert (=> start!108626 (array_inv!31054 _keys!1741)))

(assert (=> start!108626 tp!98957))

(declare-fun b!1280704 () Bool)

(assert (=> b!1280704 (= e!731828 false)))

(declare-fun minValue!1387 () V!49889)

(declare-fun zeroValue!1387 () V!49889)

(declare-fun defaultEntry!1448 () Int)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576489 () Bool)

(declare-datatypes ((tuple2!21606 0))(
  ( (tuple2!21607 (_1!10814 (_ BitVec 64)) (_2!10814 V!49889)) )
))
(declare-datatypes ((List!28820 0))(
  ( (Nil!28817) (Cons!28816 (h!30034 tuple2!21606) (t!42352 List!28820)) )
))
(declare-datatypes ((ListLongMap!19271 0))(
  ( (ListLongMap!19272 (toList!9651 List!28820)) )
))
(declare-fun contains!7780 (ListLongMap!19271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4720 (array!84293 array!84295 (_ BitVec 32) (_ BitVec 32) V!49889 V!49889 (_ BitVec 32) Int) ListLongMap!19271)

(assert (=> b!1280704 (= lt!576489 (contains!7780 (getCurrentListMap!4720 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108626 res!850397) b!1280698))

(assert (= (and b!1280698 res!850400) b!1280697))

(assert (= (and b!1280697 res!850401) b!1280700))

(assert (= (and b!1280700 res!850398) b!1280701))

(assert (= (and b!1280701 res!850399) b!1280704))

(assert (= (and b!1280702 condMapEmpty!51935) mapIsEmpty!51935))

(assert (= (and b!1280702 (not condMapEmpty!51935)) mapNonEmpty!51935))

(get-info :version)

(assert (= (and mapNonEmpty!51935 ((_ is ValueCellFull!15896) mapValue!51935)) b!1280703))

(assert (= (and b!1280702 ((_ is ValueCellFull!15896) mapDefault!51935)) b!1280699))

(assert (= start!108626 b!1280702))

(declare-fun m!1175985 () Bool)

(assert (=> b!1280704 m!1175985))

(assert (=> b!1280704 m!1175985))

(declare-fun m!1175987 () Bool)

(assert (=> b!1280704 m!1175987))

(declare-fun m!1175989 () Bool)

(assert (=> start!108626 m!1175989))

(declare-fun m!1175991 () Bool)

(assert (=> start!108626 m!1175991))

(declare-fun m!1175993 () Bool)

(assert (=> start!108626 m!1175993))

(declare-fun m!1175995 () Bool)

(assert (=> mapNonEmpty!51935 m!1175995))

(declare-fun m!1175997 () Bool)

(assert (=> b!1280697 m!1175997))

(declare-fun m!1175999 () Bool)

(assert (=> b!1280700 m!1175999))

(check-sat (not b!1280697) (not b!1280704) (not start!108626) (not b!1280700) b_and!46011 tp_is_empty!33589 (not b_next!27949) (not mapNonEmpty!51935))
(check-sat b_and!46011 (not b_next!27949))
