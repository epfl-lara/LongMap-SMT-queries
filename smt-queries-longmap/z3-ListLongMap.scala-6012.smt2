; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77942 () Bool)

(assert start!77942)

(declare-fun b_free!16485 () Bool)

(declare-fun b_next!16485 () Bool)

(assert (=> start!77942 (= b_free!16485 (not b_next!16485))))

(declare-fun tp!57722 () Bool)

(declare-fun b_and!27055 () Bool)

(assert (=> start!77942 (= tp!57722 b_and!27055)))

(declare-fun res!614112 () Bool)

(declare-fun e!510150 () Bool)

(assert (=> start!77942 (=> (not res!614112) (not e!510150))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77942 (= res!614112 (validMask!0 mask!1756))))

(assert (=> start!77942 e!510150))

(declare-datatypes ((V!30169 0))(
  ( (V!30170 (val!9502 Int)) )
))
(declare-datatypes ((ValueCell!8970 0))(
  ( (ValueCellFull!8970 (v!12010 V!30169)) (EmptyCell!8970) )
))
(declare-datatypes ((array!53828 0))(
  ( (array!53829 (arr!25871 (Array (_ BitVec 32) ValueCell!8970)) (size!26330 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53828)

(declare-fun e!510151 () Bool)

(declare-fun array_inv!20234 (array!53828) Bool)

(assert (=> start!77942 (and (array_inv!20234 _values!1152) e!510151)))

(assert (=> start!77942 tp!57722))

(assert (=> start!77942 true))

(declare-fun tp_is_empty!18903 () Bool)

(assert (=> start!77942 tp_is_empty!18903))

(declare-datatypes ((array!53830 0))(
  ( (array!53831 (arr!25872 (Array (_ BitVec 32) (_ BitVec 64))) (size!26331 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53830)

(declare-fun array_inv!20235 (array!53830) Bool)

(assert (=> start!77942 (array_inv!20235 _keys!1386)))

(declare-fun b!909980 () Bool)

(declare-fun e!510149 () Bool)

(declare-fun mapRes!30073 () Bool)

(assert (=> b!909980 (= e!510151 (and e!510149 mapRes!30073))))

(declare-fun condMapEmpty!30073 () Bool)

(declare-fun mapDefault!30073 () ValueCell!8970)

(assert (=> b!909980 (= condMapEmpty!30073 (= (arr!25871 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8970)) mapDefault!30073)))))

(declare-fun b!909981 () Bool)

(assert (=> b!909981 (= e!510150 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410132 () Bool)

(declare-fun zeroValue!1094 () V!30169)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30169)

(declare-datatypes ((tuple2!12386 0))(
  ( (tuple2!12387 (_1!6204 (_ BitVec 64)) (_2!6204 V!30169)) )
))
(declare-datatypes ((List!18176 0))(
  ( (Nil!18173) (Cons!18172 (h!19318 tuple2!12386) (t!25759 List!18176)) )
))
(declare-datatypes ((ListLongMap!11083 0))(
  ( (ListLongMap!11084 (toList!5557 List!18176)) )
))
(declare-fun contains!4600 (ListLongMap!11083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2819 (array!53830 array!53828 (_ BitVec 32) (_ BitVec 32) V!30169 V!30169 (_ BitVec 32) Int) ListLongMap!11083)

(assert (=> b!909981 (= lt!410132 (contains!4600 (getCurrentListMap!2819 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30073 () Bool)

(declare-fun tp!57723 () Bool)

(declare-fun e!510152 () Bool)

(assert (=> mapNonEmpty!30073 (= mapRes!30073 (and tp!57723 e!510152))))

(declare-fun mapKey!30073 () (_ BitVec 32))

(declare-fun mapValue!30073 () ValueCell!8970)

(declare-fun mapRest!30073 () (Array (_ BitVec 32) ValueCell!8970))

(assert (=> mapNonEmpty!30073 (= (arr!25871 _values!1152) (store mapRest!30073 mapKey!30073 mapValue!30073))))

(declare-fun mapIsEmpty!30073 () Bool)

(assert (=> mapIsEmpty!30073 mapRes!30073))

(declare-fun b!909982 () Bool)

(declare-fun res!614110 () Bool)

(assert (=> b!909982 (=> (not res!614110) (not e!510150))))

(assert (=> b!909982 (= res!614110 (and (= (size!26330 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26331 _keys!1386) (size!26330 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909983 () Bool)

(declare-fun res!614109 () Bool)

(assert (=> b!909983 (=> (not res!614109) (not e!510150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53830 (_ BitVec 32)) Bool)

(assert (=> b!909983 (= res!614109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909984 () Bool)

(assert (=> b!909984 (= e!510149 tp_is_empty!18903)))

(declare-fun b!909985 () Bool)

(assert (=> b!909985 (= e!510152 tp_is_empty!18903)))

(declare-fun b!909986 () Bool)

(declare-fun res!614111 () Bool)

(assert (=> b!909986 (=> (not res!614111) (not e!510150))))

(declare-datatypes ((List!18177 0))(
  ( (Nil!18174) (Cons!18173 (h!19319 (_ BitVec 64)) (t!25760 List!18177)) )
))
(declare-fun arrayNoDuplicates!0 (array!53830 (_ BitVec 32) List!18177) Bool)

(assert (=> b!909986 (= res!614111 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18174))))

(assert (= (and start!77942 res!614112) b!909982))

(assert (= (and b!909982 res!614110) b!909983))

(assert (= (and b!909983 res!614109) b!909986))

(assert (= (and b!909986 res!614111) b!909981))

(assert (= (and b!909980 condMapEmpty!30073) mapIsEmpty!30073))

(assert (= (and b!909980 (not condMapEmpty!30073)) mapNonEmpty!30073))

(get-info :version)

(assert (= (and mapNonEmpty!30073 ((_ is ValueCellFull!8970) mapValue!30073)) b!909985))

(assert (= (and b!909980 ((_ is ValueCellFull!8970) mapDefault!30073)) b!909984))

(assert (= start!77942 b!909980))

(declare-fun m!845093 () Bool)

(assert (=> b!909981 m!845093))

(assert (=> b!909981 m!845093))

(declare-fun m!845095 () Bool)

(assert (=> b!909981 m!845095))

(declare-fun m!845097 () Bool)

(assert (=> start!77942 m!845097))

(declare-fun m!845099 () Bool)

(assert (=> start!77942 m!845099))

(declare-fun m!845101 () Bool)

(assert (=> start!77942 m!845101))

(declare-fun m!845103 () Bool)

(assert (=> b!909983 m!845103))

(declare-fun m!845105 () Bool)

(assert (=> mapNonEmpty!30073 m!845105))

(declare-fun m!845107 () Bool)

(assert (=> b!909986 m!845107))

(check-sat (not start!77942) b_and!27055 (not b!909981) (not b_next!16485) (not b!909986) tp_is_empty!18903 (not b!909983) (not mapNonEmpty!30073))
(check-sat b_and!27055 (not b_next!16485))
