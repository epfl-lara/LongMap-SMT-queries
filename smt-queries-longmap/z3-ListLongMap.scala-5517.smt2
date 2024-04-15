; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72868 () Bool)

(assert start!72868)

(declare-fun b_free!13801 () Bool)

(declare-fun b_next!13801 () Bool)

(assert (=> start!72868 (= b_free!13801 (not b_next!13801))))

(declare-fun tp!48908 () Bool)

(declare-fun b_and!22861 () Bool)

(assert (=> start!72868 (= tp!48908 b_and!22861)))

(declare-fun b!845861 () Bool)

(declare-fun res!574719 () Bool)

(declare-fun e!472116 () Bool)

(assert (=> b!845861 (=> (not res!574719) (not e!472116))))

(declare-datatypes ((array!48091 0))(
  ( (array!48092 (arr!23077 (Array (_ BitVec 32) (_ BitVec 64))) (size!23519 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48091)

(declare-datatypes ((List!16355 0))(
  ( (Nil!16352) (Cons!16351 (h!17482 (_ BitVec 64)) (t!22717 List!16355)) )
))
(declare-fun arrayNoDuplicates!0 (array!48091 (_ BitVec 32) List!16355) Bool)

(assert (=> b!845861 (= res!574719 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16352))))

(declare-fun b!845862 () Bool)

(declare-fun res!574715 () Bool)

(assert (=> b!845862 (=> (not res!574715) (not e!472116))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845862 (= res!574715 (validKeyInArray!0 k0!854))))

(declare-fun b!845863 () Bool)

(declare-fun res!574716 () Bool)

(assert (=> b!845863 (=> (not res!574716) (not e!472116))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26297 0))(
  ( (V!26298 (val!8016 Int)) )
))
(declare-datatypes ((ValueCell!7529 0))(
  ( (ValueCellFull!7529 (v!10435 V!26297)) (EmptyCell!7529) )
))
(declare-datatypes ((array!48093 0))(
  ( (array!48094 (arr!23078 (Array (_ BitVec 32) ValueCell!7529)) (size!23520 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48093)

(assert (=> b!845863 (= res!574716 (and (= (size!23520 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23519 _keys!868) (size!23520 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845864 () Bool)

(declare-fun res!574717 () Bool)

(assert (=> b!845864 (=> (not res!574717) (not e!472116))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!845864 (= res!574717 (and (= (select (arr!23077 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!25505 () Bool)

(declare-fun mapRes!25505 () Bool)

(declare-fun tp!48907 () Bool)

(declare-fun e!472117 () Bool)

(assert (=> mapNonEmpty!25505 (= mapRes!25505 (and tp!48907 e!472117))))

(declare-fun mapValue!25505 () ValueCell!7529)

(declare-fun mapKey!25505 () (_ BitVec 32))

(declare-fun mapRest!25505 () (Array (_ BitVec 32) ValueCell!7529))

(assert (=> mapNonEmpty!25505 (= (arr!23078 _values!688) (store mapRest!25505 mapKey!25505 mapValue!25505))))

(declare-fun b!845865 () Bool)

(declare-fun res!574714 () Bool)

(assert (=> b!845865 (=> (not res!574714) (not e!472116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48091 (_ BitVec 32)) Bool)

(assert (=> b!845865 (= res!574714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845867 () Bool)

(assert (=> b!845867 (= e!472116 false)))

(declare-fun v!557 () V!26297)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10496 0))(
  ( (tuple2!10497 (_1!5259 (_ BitVec 64)) (_2!5259 V!26297)) )
))
(declare-datatypes ((List!16356 0))(
  ( (Nil!16353) (Cons!16352 (h!17483 tuple2!10496) (t!22718 List!16356)) )
))
(declare-datatypes ((ListLongMap!9255 0))(
  ( (ListLongMap!9256 (toList!4643 List!16356)) )
))
(declare-fun lt!381238 () ListLongMap!9255)

(declare-fun minValue!654 () V!26297)

(declare-fun zeroValue!654 () V!26297)

(declare-fun getCurrentListMapNoExtraKeys!2657 (array!48091 array!48093 (_ BitVec 32) (_ BitVec 32) V!26297 V!26297 (_ BitVec 32) Int) ListLongMap!9255)

(assert (=> b!845867 (= lt!381238 (getCurrentListMapNoExtraKeys!2657 _keys!868 (array!48094 (store (arr!23078 _values!688) i!612 (ValueCellFull!7529 v!557)) (size!23520 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!381239 () ListLongMap!9255)

(assert (=> b!845867 (= lt!381239 (getCurrentListMapNoExtraKeys!2657 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845868 () Bool)

(declare-fun e!472118 () Bool)

(declare-fun tp_is_empty!15937 () Bool)

(assert (=> b!845868 (= e!472118 tp_is_empty!15937)))

(declare-fun b!845869 () Bool)

(declare-fun res!574712 () Bool)

(assert (=> b!845869 (=> (not res!574712) (not e!472116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845869 (= res!574712 (validMask!0 mask!1196))))

(declare-fun b!845870 () Bool)

(assert (=> b!845870 (= e!472117 tp_is_empty!15937)))

(declare-fun b!845871 () Bool)

(declare-fun res!574713 () Bool)

(assert (=> b!845871 (=> (not res!574713) (not e!472116))))

(assert (=> b!845871 (= res!574713 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23519 _keys!868))))))

(declare-fun mapIsEmpty!25505 () Bool)

(assert (=> mapIsEmpty!25505 mapRes!25505))

(declare-fun res!574718 () Bool)

(assert (=> start!72868 (=> (not res!574718) (not e!472116))))

(assert (=> start!72868 (= res!574718 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23519 _keys!868))))))

(assert (=> start!72868 e!472116))

(assert (=> start!72868 tp_is_empty!15937))

(assert (=> start!72868 true))

(assert (=> start!72868 tp!48908))

(declare-fun array_inv!18410 (array!48091) Bool)

(assert (=> start!72868 (array_inv!18410 _keys!868)))

(declare-fun e!472115 () Bool)

(declare-fun array_inv!18411 (array!48093) Bool)

(assert (=> start!72868 (and (array_inv!18411 _values!688) e!472115)))

(declare-fun b!845866 () Bool)

(assert (=> b!845866 (= e!472115 (and e!472118 mapRes!25505))))

(declare-fun condMapEmpty!25505 () Bool)

(declare-fun mapDefault!25505 () ValueCell!7529)

(assert (=> b!845866 (= condMapEmpty!25505 (= (arr!23078 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7529)) mapDefault!25505)))))

(assert (= (and start!72868 res!574718) b!845869))

(assert (= (and b!845869 res!574712) b!845863))

(assert (= (and b!845863 res!574716) b!845865))

(assert (= (and b!845865 res!574714) b!845861))

(assert (= (and b!845861 res!574719) b!845871))

(assert (= (and b!845871 res!574713) b!845862))

(assert (= (and b!845862 res!574715) b!845864))

(assert (= (and b!845864 res!574717) b!845867))

(assert (= (and b!845866 condMapEmpty!25505) mapIsEmpty!25505))

(assert (= (and b!845866 (not condMapEmpty!25505)) mapNonEmpty!25505))

(get-info :version)

(assert (= (and mapNonEmpty!25505 ((_ is ValueCellFull!7529) mapValue!25505)) b!845870))

(assert (= (and b!845866 ((_ is ValueCellFull!7529) mapDefault!25505)) b!845868))

(assert (= start!72868 b!845866))

(declare-fun m!786857 () Bool)

(assert (=> b!845864 m!786857))

(declare-fun m!786859 () Bool)

(assert (=> b!845862 m!786859))

(declare-fun m!786861 () Bool)

(assert (=> b!845867 m!786861))

(declare-fun m!786863 () Bool)

(assert (=> b!845867 m!786863))

(declare-fun m!786865 () Bool)

(assert (=> b!845867 m!786865))

(declare-fun m!786867 () Bool)

(assert (=> b!845865 m!786867))

(declare-fun m!786869 () Bool)

(assert (=> start!72868 m!786869))

(declare-fun m!786871 () Bool)

(assert (=> start!72868 m!786871))

(declare-fun m!786873 () Bool)

(assert (=> mapNonEmpty!25505 m!786873))

(declare-fun m!786875 () Bool)

(assert (=> b!845869 m!786875))

(declare-fun m!786877 () Bool)

(assert (=> b!845861 m!786877))

(check-sat (not mapNonEmpty!25505) (not b!845861) tp_is_empty!15937 b_and!22861 (not start!72868) (not b!845865) (not b!845862) (not b!845867) (not b_next!13801) (not b!845869))
(check-sat b_and!22861 (not b_next!13801))
