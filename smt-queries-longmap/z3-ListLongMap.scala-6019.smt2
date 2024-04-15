; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77980 () Bool)

(assert start!77980)

(declare-fun b_free!16525 () Bool)

(declare-fun b_next!16525 () Bool)

(assert (=> start!77980 (= b_free!16525 (not b_next!16525))))

(declare-fun tp!57847 () Bool)

(declare-fun b_and!27071 () Bool)

(assert (=> start!77980 (= tp!57847 b_and!27071)))

(declare-fun b!910288 () Bool)

(declare-fun e!510377 () Bool)

(declare-fun e!510376 () Bool)

(declare-fun mapRes!30136 () Bool)

(assert (=> b!910288 (= e!510377 (and e!510376 mapRes!30136))))

(declare-fun condMapEmpty!30136 () Bool)

(declare-datatypes ((V!30223 0))(
  ( (V!30224 (val!9522 Int)) )
))
(declare-datatypes ((ValueCell!8990 0))(
  ( (ValueCellFull!8990 (v!12030 V!30223)) (EmptyCell!8990) )
))
(declare-datatypes ((array!53891 0))(
  ( (array!53892 (arr!25902 (Array (_ BitVec 32) ValueCell!8990)) (size!26363 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53891)

(declare-fun mapDefault!30136 () ValueCell!8990)

(assert (=> b!910288 (= condMapEmpty!30136 (= (arr!25902 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8990)) mapDefault!30136)))))

(declare-fun b!910289 () Bool)

(declare-fun e!510375 () Bool)

(declare-fun tp_is_empty!18943 () Bool)

(assert (=> b!910289 (= e!510375 tp_is_empty!18943)))

(declare-fun res!614304 () Bool)

(declare-fun e!510373 () Bool)

(assert (=> start!77980 (=> (not res!614304) (not e!510373))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77980 (= res!614304 (validMask!0 mask!1756))))

(assert (=> start!77980 e!510373))

(declare-fun array_inv!20310 (array!53891) Bool)

(assert (=> start!77980 (and (array_inv!20310 _values!1152) e!510377)))

(assert (=> start!77980 tp!57847))

(assert (=> start!77980 true))

(assert (=> start!77980 tp_is_empty!18943))

(declare-datatypes ((array!53893 0))(
  ( (array!53894 (arr!25903 (Array (_ BitVec 32) (_ BitVec 64))) (size!26364 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53893)

(declare-fun array_inv!20311 (array!53893) Bool)

(assert (=> start!77980 (array_inv!20311 _keys!1386)))

(declare-fun b!910290 () Bool)

(declare-fun res!614303 () Bool)

(assert (=> b!910290 (=> (not res!614303) (not e!510373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53893 (_ BitVec 32)) Bool)

(assert (=> b!910290 (= res!614303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910291 () Bool)

(assert (=> b!910291 (= e!510376 tp_is_empty!18943)))

(declare-fun mapIsEmpty!30136 () Bool)

(assert (=> mapIsEmpty!30136 mapRes!30136))

(declare-fun b!910292 () Bool)

(assert (=> b!910292 (= e!510373 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30223)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410034 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30223)

(declare-datatypes ((tuple2!12442 0))(
  ( (tuple2!12443 (_1!6232 (_ BitVec 64)) (_2!6232 V!30223)) )
))
(declare-datatypes ((List!18227 0))(
  ( (Nil!18224) (Cons!18223 (h!19369 tuple2!12442) (t!25803 List!18227)) )
))
(declare-datatypes ((ListLongMap!11129 0))(
  ( (ListLongMap!11130 (toList!5580 List!18227)) )
))
(declare-fun contains!4581 (ListLongMap!11129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2782 (array!53893 array!53891 (_ BitVec 32) (_ BitVec 32) V!30223 V!30223 (_ BitVec 32) Int) ListLongMap!11129)

(assert (=> b!910292 (= lt!410034 (contains!4581 (getCurrentListMap!2782 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910293 () Bool)

(declare-fun res!614302 () Bool)

(assert (=> b!910293 (=> (not res!614302) (not e!510373))))

(declare-datatypes ((List!18228 0))(
  ( (Nil!18225) (Cons!18224 (h!19370 (_ BitVec 64)) (t!25804 List!18228)) )
))
(declare-fun arrayNoDuplicates!0 (array!53893 (_ BitVec 32) List!18228) Bool)

(assert (=> b!910293 (= res!614302 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18225))))

(declare-fun mapNonEmpty!30136 () Bool)

(declare-fun tp!57846 () Bool)

(assert (=> mapNonEmpty!30136 (= mapRes!30136 (and tp!57846 e!510375))))

(declare-fun mapKey!30136 () (_ BitVec 32))

(declare-fun mapRest!30136 () (Array (_ BitVec 32) ValueCell!8990))

(declare-fun mapValue!30136 () ValueCell!8990)

(assert (=> mapNonEmpty!30136 (= (arr!25902 _values!1152) (store mapRest!30136 mapKey!30136 mapValue!30136))))

(declare-fun b!910294 () Bool)

(declare-fun res!614305 () Bool)

(assert (=> b!910294 (=> (not res!614305) (not e!510373))))

(assert (=> b!910294 (= res!614305 (and (= (size!26363 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26364 _keys!1386) (size!26363 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77980 res!614304) b!910294))

(assert (= (and b!910294 res!614305) b!910290))

(assert (= (and b!910290 res!614303) b!910293))

(assert (= (and b!910293 res!614302) b!910292))

(assert (= (and b!910288 condMapEmpty!30136) mapIsEmpty!30136))

(assert (= (and b!910288 (not condMapEmpty!30136)) mapNonEmpty!30136))

(get-info :version)

(assert (= (and mapNonEmpty!30136 ((_ is ValueCellFull!8990) mapValue!30136)) b!910289))

(assert (= (and b!910288 ((_ is ValueCellFull!8990) mapDefault!30136)) b!910291))

(assert (= start!77980 b!910288))

(declare-fun m!844747 () Bool)

(assert (=> b!910290 m!844747))

(declare-fun m!844749 () Bool)

(assert (=> b!910292 m!844749))

(assert (=> b!910292 m!844749))

(declare-fun m!844751 () Bool)

(assert (=> b!910292 m!844751))

(declare-fun m!844753 () Bool)

(assert (=> start!77980 m!844753))

(declare-fun m!844755 () Bool)

(assert (=> start!77980 m!844755))

(declare-fun m!844757 () Bool)

(assert (=> start!77980 m!844757))

(declare-fun m!844759 () Bool)

(assert (=> b!910293 m!844759))

(declare-fun m!844761 () Bool)

(assert (=> mapNonEmpty!30136 m!844761))

(check-sat (not start!77980) (not b!910292) (not b!910290) tp_is_empty!18943 (not b!910293) (not b_next!16525) (not mapNonEmpty!30136) b_and!27071)
(check-sat b_and!27071 (not b_next!16525))
