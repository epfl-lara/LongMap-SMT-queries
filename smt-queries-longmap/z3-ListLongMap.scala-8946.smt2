; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108404 () Bool)

(assert start!108404)

(declare-fun b_free!27951 () Bool)

(declare-fun b_next!27951 () Bool)

(assert (=> start!108404 (= b_free!27951 (not b_next!27951))))

(declare-fun tp!98963 () Bool)

(declare-fun b_and!46011 () Bool)

(assert (=> start!108404 (= tp!98963 b_and!46011)))

(declare-fun mapIsEmpty!51938 () Bool)

(declare-fun mapRes!51938 () Bool)

(assert (=> mapIsEmpty!51938 mapRes!51938))

(declare-fun b!1279416 () Bool)

(declare-fun e!730998 () Bool)

(declare-fun e!730996 () Bool)

(assert (=> b!1279416 (= e!730998 (and e!730996 mapRes!51938))))

(declare-fun condMapEmpty!51938 () Bool)

(declare-datatypes ((V!49891 0))(
  ( (V!49892 (val!16870 Int)) )
))
(declare-datatypes ((ValueCell!15897 0))(
  ( (ValueCellFull!15897 (v!19470 V!49891)) (EmptyCell!15897) )
))
(declare-datatypes ((array!84268 0))(
  ( (array!84269 (arr!40638 (Array (_ BitVec 32) ValueCell!15897)) (size!41188 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84268)

(declare-fun mapDefault!51938 () ValueCell!15897)

(assert (=> b!1279416 (= condMapEmpty!51938 (= (arr!40638 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15897)) mapDefault!51938)))))

(declare-fun res!849893 () Bool)

(declare-fun e!730997 () Bool)

(assert (=> start!108404 (=> (not res!849893) (not e!730997))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108404 (= res!849893 (validMask!0 mask!2175))))

(assert (=> start!108404 e!730997))

(declare-fun tp_is_empty!33591 () Bool)

(assert (=> start!108404 tp_is_empty!33591))

(assert (=> start!108404 true))

(declare-fun array_inv!30853 (array!84268) Bool)

(assert (=> start!108404 (and (array_inv!30853 _values!1445) e!730998)))

(declare-datatypes ((array!84270 0))(
  ( (array!84271 (arr!40639 (Array (_ BitVec 32) (_ BitVec 64))) (size!41189 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84270)

(declare-fun array_inv!30854 (array!84270) Bool)

(assert (=> start!108404 (array_inv!30854 _keys!1741)))

(assert (=> start!108404 tp!98963))

(declare-fun b!1279417 () Bool)

(assert (=> b!1279417 (= e!730996 tp_is_empty!33591)))

(declare-fun b!1279418 () Bool)

(declare-fun e!731000 () Bool)

(assert (=> b!1279418 (= e!731000 tp_is_empty!33591)))

(declare-fun mapNonEmpty!51938 () Bool)

(declare-fun tp!98962 () Bool)

(assert (=> mapNonEmpty!51938 (= mapRes!51938 (and tp!98962 e!731000))))

(declare-fun mapRest!51938 () (Array (_ BitVec 32) ValueCell!15897))

(declare-fun mapKey!51938 () (_ BitVec 32))

(declare-fun mapValue!51938 () ValueCell!15897)

(assert (=> mapNonEmpty!51938 (= (arr!40638 _values!1445) (store mapRest!51938 mapKey!51938 mapValue!51938))))

(declare-fun b!1279419 () Bool)

(declare-fun res!849895 () Bool)

(assert (=> b!1279419 (=> (not res!849895) (not e!730997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84270 (_ BitVec 32)) Bool)

(assert (=> b!1279419 (= res!849895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279420 () Bool)

(assert (=> b!1279420 (= e!730997 false)))

(declare-fun minValue!1387 () V!49891)

(declare-fun zeroValue!1387 () V!49891)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!576008 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21584 0))(
  ( (tuple2!21585 (_1!10803 (_ BitVec 64)) (_2!10803 V!49891)) )
))
(declare-datatypes ((List!28783 0))(
  ( (Nil!28780) (Cons!28779 (h!29988 tuple2!21584) (t!42323 List!28783)) )
))
(declare-datatypes ((ListLongMap!19241 0))(
  ( (ListLongMap!19242 (toList!9636 List!28783)) )
))
(declare-fun contains!7751 (ListLongMap!19241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4720 (array!84270 array!84268 (_ BitVec 32) (_ BitVec 32) V!49891 V!49891 (_ BitVec 32) Int) ListLongMap!19241)

(assert (=> b!1279420 (= lt!576008 (contains!7751 (getCurrentListMap!4720 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279421 () Bool)

(declare-fun res!849896 () Bool)

(assert (=> b!1279421 (=> (not res!849896) (not e!730997))))

(assert (=> b!1279421 (= res!849896 (and (= (size!41188 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41189 _keys!1741) (size!41188 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279422 () Bool)

(declare-fun res!849892 () Bool)

(assert (=> b!1279422 (=> (not res!849892) (not e!730997))))

(assert (=> b!1279422 (= res!849892 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41189 _keys!1741))))))

(declare-fun b!1279423 () Bool)

(declare-fun res!849894 () Bool)

(assert (=> b!1279423 (=> (not res!849894) (not e!730997))))

(declare-datatypes ((List!28784 0))(
  ( (Nil!28781) (Cons!28780 (h!29989 (_ BitVec 64)) (t!42324 List!28784)) )
))
(declare-fun arrayNoDuplicates!0 (array!84270 (_ BitVec 32) List!28784) Bool)

(assert (=> b!1279423 (= res!849894 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28781))))

(assert (= (and start!108404 res!849893) b!1279421))

(assert (= (and b!1279421 res!849896) b!1279419))

(assert (= (and b!1279419 res!849895) b!1279423))

(assert (= (and b!1279423 res!849894) b!1279422))

(assert (= (and b!1279422 res!849892) b!1279420))

(assert (= (and b!1279416 condMapEmpty!51938) mapIsEmpty!51938))

(assert (= (and b!1279416 (not condMapEmpty!51938)) mapNonEmpty!51938))

(get-info :version)

(assert (= (and mapNonEmpty!51938 ((_ is ValueCellFull!15897) mapValue!51938)) b!1279418))

(assert (= (and b!1279416 ((_ is ValueCellFull!15897) mapDefault!51938)) b!1279417))

(assert (= start!108404 b!1279416))

(declare-fun m!1174389 () Bool)

(assert (=> b!1279423 m!1174389))

(declare-fun m!1174391 () Bool)

(assert (=> b!1279419 m!1174391))

(declare-fun m!1174393 () Bool)

(assert (=> start!108404 m!1174393))

(declare-fun m!1174395 () Bool)

(assert (=> start!108404 m!1174395))

(declare-fun m!1174397 () Bool)

(assert (=> start!108404 m!1174397))

(declare-fun m!1174399 () Bool)

(assert (=> b!1279420 m!1174399))

(assert (=> b!1279420 m!1174399))

(declare-fun m!1174401 () Bool)

(assert (=> b!1279420 m!1174401))

(declare-fun m!1174403 () Bool)

(assert (=> mapNonEmpty!51938 m!1174403))

(check-sat (not mapNonEmpty!51938) (not b!1279423) (not start!108404) (not b_next!27951) tp_is_empty!33591 (not b!1279419) (not b!1279420) b_and!46011)
(check-sat b_and!46011 (not b_next!27951))
