; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78138 () Bool)

(assert start!78138)

(declare-fun b_free!16513 () Bool)

(declare-fun b_next!16513 () Bool)

(assert (=> start!78138 (= b_free!16513 (not b_next!16513))))

(declare-fun tp!57807 () Bool)

(declare-fun b_and!27093 () Bool)

(assert (=> start!78138 (= tp!57807 b_and!27093)))

(declare-fun b!911177 () Bool)

(declare-fun res!614621 () Bool)

(declare-fun e!510942 () Bool)

(assert (=> b!911177 (=> (not res!614621) (not e!510942))))

(declare-datatypes ((array!53931 0))(
  ( (array!53932 (arr!25918 (Array (_ BitVec 32) (_ BitVec 64))) (size!26378 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53931)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53931 (_ BitVec 32)) Bool)

(assert (=> b!911177 (= res!614621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!911178 () Bool)

(declare-fun e!510945 () Bool)

(declare-fun tp_is_empty!18931 () Bool)

(assert (=> b!911178 (= e!510945 tp_is_empty!18931)))

(declare-fun mapIsEmpty!30115 () Bool)

(declare-fun mapRes!30115 () Bool)

(assert (=> mapIsEmpty!30115 mapRes!30115))

(declare-fun b!911179 () Bool)

(declare-fun res!614623 () Bool)

(assert (=> b!911179 (=> (not res!614623) (not e!510942))))

(declare-datatypes ((List!18176 0))(
  ( (Nil!18173) (Cons!18172 (h!19324 (_ BitVec 64)) (t!25751 List!18176)) )
))
(declare-fun arrayNoDuplicates!0 (array!53931 (_ BitVec 32) List!18176) Bool)

(assert (=> b!911179 (= res!614623 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18173))))

(declare-fun res!614624 () Bool)

(assert (=> start!78138 (=> (not res!614624) (not e!510942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78138 (= res!614624 (validMask!0 mask!1756))))

(assert (=> start!78138 e!510942))

(declare-datatypes ((V!30207 0))(
  ( (V!30208 (val!9516 Int)) )
))
(declare-datatypes ((ValueCell!8984 0))(
  ( (ValueCellFull!8984 (v!12021 V!30207)) (EmptyCell!8984) )
))
(declare-datatypes ((array!53933 0))(
  ( (array!53934 (arr!25919 (Array (_ BitVec 32) ValueCell!8984)) (size!26379 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53933)

(declare-fun e!510944 () Bool)

(declare-fun array_inv!20338 (array!53933) Bool)

(assert (=> start!78138 (and (array_inv!20338 _values!1152) e!510944)))

(assert (=> start!78138 tp!57807))

(assert (=> start!78138 true))

(assert (=> start!78138 tp_is_empty!18931))

(declare-fun array_inv!20339 (array!53931) Bool)

(assert (=> start!78138 (array_inv!20339 _keys!1386)))

(declare-fun b!911180 () Bool)

(declare-fun res!614622 () Bool)

(assert (=> b!911180 (=> (not res!614622) (not e!510942))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!911180 (= res!614622 (and (= (size!26379 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26378 _keys!1386) (size!26379 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911181 () Bool)

(assert (=> b!911181 (= e!510942 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30207)

(declare-fun lt!410535 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30207)

(declare-datatypes ((tuple2!12358 0))(
  ( (tuple2!12359 (_1!6190 (_ BitVec 64)) (_2!6190 V!30207)) )
))
(declare-datatypes ((List!18177 0))(
  ( (Nil!18174) (Cons!18173 (h!19325 tuple2!12358) (t!25752 List!18177)) )
))
(declare-datatypes ((ListLongMap!11057 0))(
  ( (ListLongMap!11058 (toList!5544 List!18177)) )
))
(declare-fun contains!4596 (ListLongMap!11057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2805 (array!53931 array!53933 (_ BitVec 32) (_ BitVec 32) V!30207 V!30207 (_ BitVec 32) Int) ListLongMap!11057)

(assert (=> b!911181 (= lt!410535 (contains!4596 (getCurrentListMap!2805 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911182 () Bool)

(declare-fun e!510943 () Bool)

(assert (=> b!911182 (= e!510944 (and e!510943 mapRes!30115))))

(declare-fun condMapEmpty!30115 () Bool)

(declare-fun mapDefault!30115 () ValueCell!8984)

(assert (=> b!911182 (= condMapEmpty!30115 (= (arr!25919 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8984)) mapDefault!30115)))))

(declare-fun mapNonEmpty!30115 () Bool)

(declare-fun tp!57808 () Bool)

(assert (=> mapNonEmpty!30115 (= mapRes!30115 (and tp!57808 e!510945))))

(declare-fun mapValue!30115 () ValueCell!8984)

(declare-fun mapKey!30115 () (_ BitVec 32))

(declare-fun mapRest!30115 () (Array (_ BitVec 32) ValueCell!8984))

(assert (=> mapNonEmpty!30115 (= (arr!25919 _values!1152) (store mapRest!30115 mapKey!30115 mapValue!30115))))

(declare-fun b!911183 () Bool)

(assert (=> b!911183 (= e!510943 tp_is_empty!18931)))

(assert (= (and start!78138 res!614624) b!911180))

(assert (= (and b!911180 res!614622) b!911177))

(assert (= (and b!911177 res!614621) b!911179))

(assert (= (and b!911179 res!614623) b!911181))

(assert (= (and b!911182 condMapEmpty!30115) mapIsEmpty!30115))

(assert (= (and b!911182 (not condMapEmpty!30115)) mapNonEmpty!30115))

(get-info :version)

(assert (= (and mapNonEmpty!30115 ((_ is ValueCellFull!8984) mapValue!30115)) b!911178))

(assert (= (and b!911182 ((_ is ValueCellFull!8984) mapDefault!30115)) b!911183))

(assert (= start!78138 b!911182))

(declare-fun m!846611 () Bool)

(assert (=> start!78138 m!846611))

(declare-fun m!846613 () Bool)

(assert (=> start!78138 m!846613))

(declare-fun m!846615 () Bool)

(assert (=> start!78138 m!846615))

(declare-fun m!846617 () Bool)

(assert (=> b!911181 m!846617))

(assert (=> b!911181 m!846617))

(declare-fun m!846619 () Bool)

(assert (=> b!911181 m!846619))

(declare-fun m!846621 () Bool)

(assert (=> b!911177 m!846621))

(declare-fun m!846623 () Bool)

(assert (=> b!911179 m!846623))

(declare-fun m!846625 () Bool)

(assert (=> mapNonEmpty!30115 m!846625))

(check-sat (not b!911177) (not start!78138) tp_is_empty!18931 b_and!27093 (not b!911181) (not mapNonEmpty!30115) (not b_next!16513) (not b!911179))
(check-sat b_and!27093 (not b_next!16513))
