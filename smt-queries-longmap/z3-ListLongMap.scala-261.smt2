; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4278 () Bool)

(assert start!4278)

(declare-fun b_free!1153 () Bool)

(declare-fun b_next!1153 () Bool)

(assert (=> start!4278 (= b_free!1153 (not b_next!1153))))

(declare-fun tp!4884 () Bool)

(declare-fun b_and!1961 () Bool)

(assert (=> start!4278 (= tp!4884 b_and!1961)))

(declare-fun b!32864 () Bool)

(declare-fun e!20867 () Bool)

(assert (=> b!32864 (= e!20867 (not true))))

(declare-datatypes ((V!1835 0))(
  ( (V!1836 (val!780 Int)) )
))
(declare-datatypes ((tuple2!1268 0))(
  ( (tuple2!1269 (_1!645 (_ BitVec 64)) (_2!645 V!1835)) )
))
(declare-datatypes ((List!850 0))(
  ( (Nil!847) (Cons!846 (h!1413 tuple2!1268) (t!3540 List!850)) )
))
(declare-datatypes ((ListLongMap!833 0))(
  ( (ListLongMap!834 (toList!432 List!850)) )
))
(declare-fun lt!11925 () ListLongMap!833)

(declare-datatypes ((array!2199 0))(
  ( (array!2200 (arr!1051 (Array (_ BitVec 32) (_ BitVec 64))) (size!1152 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2199)

(declare-fun lt!11924 () (_ BitVec 32))

(declare-fun contains!375 (ListLongMap!833 (_ BitVec 64)) Bool)

(assert (=> b!32864 (contains!375 lt!11925 (select (arr!1051 _keys!1833) lt!11924))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!554 0))(
  ( (ValueCellFull!554 (v!1870 V!1835)) (EmptyCell!554) )
))
(declare-datatypes ((array!2201 0))(
  ( (array!2202 (arr!1052 (Array (_ BitVec 32) ValueCell!554)) (size!1153 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2201)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!726 0))(
  ( (Unit!727) )
))
(declare-fun lt!11926 () Unit!726)

(declare-fun zeroValue!1443 () V!1835)

(declare-fun minValue!1443 () V!1835)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun lemmaValidKeyInArrayIsInListMap!49 (array!2199 array!2201 (_ BitVec 32) (_ BitVec 32) V!1835 V!1835 (_ BitVec 32) Int) Unit!726)

(assert (=> b!32864 (= lt!11926 (lemmaValidKeyInArrayIsInListMap!49 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11924 defaultEntry!1504))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2199 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32864 (= lt!11924 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32865 () Bool)

(declare-fun res!19975 () Bool)

(assert (=> b!32865 (=> (not res!19975) (not e!20867))))

(declare-fun arrayContainsKey!0 (array!2199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32865 (= res!19975 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32866 () Bool)

(declare-fun e!20869 () Bool)

(declare-fun tp_is_empty!1507 () Bool)

(assert (=> b!32866 (= e!20869 tp_is_empty!1507)))

(declare-fun b!32867 () Bool)

(declare-fun e!20872 () Bool)

(declare-fun mapRes!1795 () Bool)

(assert (=> b!32867 (= e!20872 (and e!20869 mapRes!1795))))

(declare-fun condMapEmpty!1795 () Bool)

(declare-fun mapDefault!1795 () ValueCell!554)

(assert (=> b!32867 (= condMapEmpty!1795 (= (arr!1052 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!554)) mapDefault!1795)))))

(declare-fun b!32868 () Bool)

(declare-fun res!19977 () Bool)

(declare-fun e!20870 () Bool)

(assert (=> b!32868 (=> (not res!19977) (not e!20870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32868 (= res!19977 (validKeyInArray!0 k0!1304))))

(declare-fun b!32869 () Bool)

(assert (=> b!32869 (= e!20870 e!20867)))

(declare-fun res!19980 () Bool)

(assert (=> b!32869 (=> (not res!19980) (not e!20867))))

(assert (=> b!32869 (= res!19980 (not (contains!375 lt!11925 k0!1304)))))

(declare-fun getCurrentListMap!254 (array!2199 array!2201 (_ BitVec 32) (_ BitVec 32) V!1835 V!1835 (_ BitVec 32) Int) ListLongMap!833)

(assert (=> b!32869 (= lt!11925 (getCurrentListMap!254 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32870 () Bool)

(declare-fun res!19981 () Bool)

(assert (=> b!32870 (=> (not res!19981) (not e!20870))))

(assert (=> b!32870 (= res!19981 (and (= (size!1153 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1152 _keys!1833) (size!1153 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32871 () Bool)

(declare-fun res!19978 () Bool)

(assert (=> b!32871 (=> (not res!19978) (not e!20870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2199 (_ BitVec 32)) Bool)

(assert (=> b!32871 (= res!19978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32873 () Bool)

(declare-fun res!19976 () Bool)

(assert (=> b!32873 (=> (not res!19976) (not e!20870))))

(declare-datatypes ((List!851 0))(
  ( (Nil!848) (Cons!847 (h!1414 (_ BitVec 64)) (t!3541 List!851)) )
))
(declare-fun arrayNoDuplicates!0 (array!2199 (_ BitVec 32) List!851) Bool)

(assert (=> b!32873 (= res!19976 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!848))))

(declare-fun mapIsEmpty!1795 () Bool)

(assert (=> mapIsEmpty!1795 mapRes!1795))

(declare-fun mapNonEmpty!1795 () Bool)

(declare-fun tp!4885 () Bool)

(declare-fun e!20871 () Bool)

(assert (=> mapNonEmpty!1795 (= mapRes!1795 (and tp!4885 e!20871))))

(declare-fun mapValue!1795 () ValueCell!554)

(declare-fun mapKey!1795 () (_ BitVec 32))

(declare-fun mapRest!1795 () (Array (_ BitVec 32) ValueCell!554))

(assert (=> mapNonEmpty!1795 (= (arr!1052 _values!1501) (store mapRest!1795 mapKey!1795 mapValue!1795))))

(declare-fun res!19979 () Bool)

(assert (=> start!4278 (=> (not res!19979) (not e!20870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4278 (= res!19979 (validMask!0 mask!2294))))

(assert (=> start!4278 e!20870))

(assert (=> start!4278 true))

(assert (=> start!4278 tp!4884))

(declare-fun array_inv!743 (array!2201) Bool)

(assert (=> start!4278 (and (array_inv!743 _values!1501) e!20872)))

(declare-fun array_inv!744 (array!2199) Bool)

(assert (=> start!4278 (array_inv!744 _keys!1833)))

(assert (=> start!4278 tp_is_empty!1507))

(declare-fun b!32872 () Bool)

(assert (=> b!32872 (= e!20871 tp_is_empty!1507)))

(assert (= (and start!4278 res!19979) b!32870))

(assert (= (and b!32870 res!19981) b!32871))

(assert (= (and b!32871 res!19978) b!32873))

(assert (= (and b!32873 res!19976) b!32868))

(assert (= (and b!32868 res!19977) b!32869))

(assert (= (and b!32869 res!19980) b!32865))

(assert (= (and b!32865 res!19975) b!32864))

(assert (= (and b!32867 condMapEmpty!1795) mapIsEmpty!1795))

(assert (= (and b!32867 (not condMapEmpty!1795)) mapNonEmpty!1795))

(get-info :version)

(assert (= (and mapNonEmpty!1795 ((_ is ValueCellFull!554) mapValue!1795)) b!32872))

(assert (= (and b!32867 ((_ is ValueCellFull!554) mapDefault!1795)) b!32866))

(assert (= start!4278 b!32867))

(declare-fun m!26287 () Bool)

(assert (=> b!32868 m!26287))

(declare-fun m!26289 () Bool)

(assert (=> start!4278 m!26289))

(declare-fun m!26291 () Bool)

(assert (=> start!4278 m!26291))

(declare-fun m!26293 () Bool)

(assert (=> start!4278 m!26293))

(declare-fun m!26295 () Bool)

(assert (=> b!32869 m!26295))

(declare-fun m!26297 () Bool)

(assert (=> b!32869 m!26297))

(declare-fun m!26299 () Bool)

(assert (=> b!32865 m!26299))

(declare-fun m!26301 () Bool)

(assert (=> mapNonEmpty!1795 m!26301))

(declare-fun m!26303 () Bool)

(assert (=> b!32864 m!26303))

(assert (=> b!32864 m!26303))

(declare-fun m!26305 () Bool)

(assert (=> b!32864 m!26305))

(declare-fun m!26307 () Bool)

(assert (=> b!32864 m!26307))

(declare-fun m!26309 () Bool)

(assert (=> b!32864 m!26309))

(declare-fun m!26311 () Bool)

(assert (=> b!32873 m!26311))

(declare-fun m!26313 () Bool)

(assert (=> b!32871 m!26313))

(check-sat (not b!32869) (not start!4278) (not b!32871) (not b!32865) b_and!1961 (not b_next!1153) (not b!32864) (not b!32873) (not mapNonEmpty!1795) tp_is_empty!1507 (not b!32868))
(check-sat b_and!1961 (not b_next!1153))
