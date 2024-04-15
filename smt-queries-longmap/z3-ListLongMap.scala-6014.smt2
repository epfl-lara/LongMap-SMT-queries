; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77934 () Bool)

(assert start!77934)

(declare-fun b_free!16495 () Bool)

(declare-fun b_next!16495 () Bool)

(assert (=> start!77934 (= b_free!16495 (not b_next!16495))))

(declare-fun tp!57754 () Bool)

(declare-fun b_and!27039 () Bool)

(assert (=> start!77934 (= tp!57754 b_and!27039)))

(declare-fun mapIsEmpty!30088 () Bool)

(declare-fun mapRes!30088 () Bool)

(assert (=> mapIsEmpty!30088 mapRes!30088))

(declare-fun res!614061 () Bool)

(declare-fun e!510076 () Bool)

(assert (=> start!77934 (=> (not res!614061) (not e!510076))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77934 (= res!614061 (validMask!0 mask!1756))))

(assert (=> start!77934 e!510076))

(declare-datatypes ((V!30183 0))(
  ( (V!30184 (val!9507 Int)) )
))
(declare-datatypes ((ValueCell!8975 0))(
  ( (ValueCellFull!8975 (v!12014 V!30183)) (EmptyCell!8975) )
))
(declare-datatypes ((array!53829 0))(
  ( (array!53830 (arr!25872 (Array (_ BitVec 32) ValueCell!8975)) (size!26333 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53829)

(declare-fun e!510077 () Bool)

(declare-fun array_inv!20282 (array!53829) Bool)

(assert (=> start!77934 (and (array_inv!20282 _values!1152) e!510077)))

(assert (=> start!77934 tp!57754))

(assert (=> start!77934 true))

(declare-fun tp_is_empty!18913 () Bool)

(assert (=> start!77934 tp_is_empty!18913))

(declare-datatypes ((array!53831 0))(
  ( (array!53832 (arr!25873 (Array (_ BitVec 32) (_ BitVec 64))) (size!26334 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53831)

(declare-fun array_inv!20283 (array!53831) Bool)

(assert (=> start!77934 (array_inv!20283 _keys!1386)))

(declare-fun b!909846 () Bool)

(assert (=> b!909846 (= e!510076 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30183)

(declare-fun lt!409911 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30183)

(declare-datatypes ((tuple2!12416 0))(
  ( (tuple2!12417 (_1!6219 (_ BitVec 64)) (_2!6219 V!30183)) )
))
(declare-datatypes ((List!18201 0))(
  ( (Nil!18198) (Cons!18197 (h!19343 tuple2!12416) (t!25775 List!18201)) )
))
(declare-datatypes ((ListLongMap!11103 0))(
  ( (ListLongMap!11104 (toList!5567 List!18201)) )
))
(declare-fun contains!4567 (ListLongMap!11103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2769 (array!53831 array!53829 (_ BitVec 32) (_ BitVec 32) V!30183 V!30183 (_ BitVec 32) Int) ListLongMap!11103)

(assert (=> b!909846 (= lt!409911 (contains!4567 (getCurrentListMap!2769 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909847 () Bool)

(declare-fun e!510078 () Bool)

(assert (=> b!909847 (= e!510077 (and e!510078 mapRes!30088))))

(declare-fun condMapEmpty!30088 () Bool)

(declare-fun mapDefault!30088 () ValueCell!8975)

(assert (=> b!909847 (= condMapEmpty!30088 (= (arr!25872 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8975)) mapDefault!30088)))))

(declare-fun mapNonEmpty!30088 () Bool)

(declare-fun tp!57753 () Bool)

(declare-fun e!510079 () Bool)

(assert (=> mapNonEmpty!30088 (= mapRes!30088 (and tp!57753 e!510079))))

(declare-fun mapValue!30088 () ValueCell!8975)

(declare-fun mapRest!30088 () (Array (_ BitVec 32) ValueCell!8975))

(declare-fun mapKey!30088 () (_ BitVec 32))

(assert (=> mapNonEmpty!30088 (= (arr!25872 _values!1152) (store mapRest!30088 mapKey!30088 mapValue!30088))))

(declare-fun b!909848 () Bool)

(declare-fun res!614062 () Bool)

(assert (=> b!909848 (=> (not res!614062) (not e!510076))))

(assert (=> b!909848 (= res!614062 (and (= (size!26333 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26334 _keys!1386) (size!26333 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909849 () Bool)

(assert (=> b!909849 (= e!510078 tp_is_empty!18913)))

(declare-fun b!909850 () Bool)

(declare-fun res!614059 () Bool)

(assert (=> b!909850 (=> (not res!614059) (not e!510076))))

(declare-datatypes ((List!18202 0))(
  ( (Nil!18199) (Cons!18198 (h!19344 (_ BitVec 64)) (t!25776 List!18202)) )
))
(declare-fun arrayNoDuplicates!0 (array!53831 (_ BitVec 32) List!18202) Bool)

(assert (=> b!909850 (= res!614059 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18199))))

(declare-fun b!909851 () Bool)

(assert (=> b!909851 (= e!510079 tp_is_empty!18913)))

(declare-fun b!909852 () Bool)

(declare-fun res!614060 () Bool)

(assert (=> b!909852 (=> (not res!614060) (not e!510076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53831 (_ BitVec 32)) Bool)

(assert (=> b!909852 (= res!614060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77934 res!614061) b!909848))

(assert (= (and b!909848 res!614062) b!909852))

(assert (= (and b!909852 res!614060) b!909850))

(assert (= (and b!909850 res!614059) b!909846))

(assert (= (and b!909847 condMapEmpty!30088) mapIsEmpty!30088))

(assert (= (and b!909847 (not condMapEmpty!30088)) mapNonEmpty!30088))

(get-info :version)

(assert (= (and mapNonEmpty!30088 ((_ is ValueCellFull!8975) mapValue!30088)) b!909851))

(assert (= (and b!909847 ((_ is ValueCellFull!8975) mapDefault!30088)) b!909849))

(assert (= start!77934 b!909847))

(declare-fun m!844415 () Bool)

(assert (=> b!909846 m!844415))

(assert (=> b!909846 m!844415))

(declare-fun m!844417 () Bool)

(assert (=> b!909846 m!844417))

(declare-fun m!844419 () Bool)

(assert (=> b!909850 m!844419))

(declare-fun m!844421 () Bool)

(assert (=> mapNonEmpty!30088 m!844421))

(declare-fun m!844423 () Bool)

(assert (=> b!909852 m!844423))

(declare-fun m!844425 () Bool)

(assert (=> start!77934 m!844425))

(declare-fun m!844427 () Bool)

(assert (=> start!77934 m!844427))

(declare-fun m!844429 () Bool)

(assert (=> start!77934 m!844429))

(check-sat (not start!77934) (not b!909846) (not b!909852) (not b!909850) (not mapNonEmpty!30088) b_and!27039 tp_is_empty!18913 (not b_next!16495))
(check-sat b_and!27039 (not b_next!16495))
