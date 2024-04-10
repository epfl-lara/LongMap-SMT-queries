; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77510 () Bool)

(assert start!77510)

(declare-fun b_free!16095 () Bool)

(declare-fun b_next!16095 () Bool)

(assert (=> start!77510 (= b_free!16095 (not b_next!16095))))

(declare-fun tp!56546 () Bool)

(declare-fun b_and!26461 () Bool)

(assert (=> start!77510 (= tp!56546 b_and!26461)))

(declare-fun b!903131 () Bool)

(declare-fun e!505965 () Bool)

(declare-fun tp_is_empty!18513 () Bool)

(assert (=> b!903131 (= e!505965 tp_is_empty!18513)))

(declare-fun b!903132 () Bool)

(declare-fun e!505962 () Bool)

(declare-fun mapRes!29482 () Bool)

(assert (=> b!903132 (= e!505962 (and e!505965 mapRes!29482))))

(declare-fun condMapEmpty!29482 () Bool)

(declare-datatypes ((V!29649 0))(
  ( (V!29650 (val!9307 Int)) )
))
(declare-datatypes ((ValueCell!8775 0))(
  ( (ValueCellFull!8775 (v!11812 V!29649)) (EmptyCell!8775) )
))
(declare-datatypes ((array!53086 0))(
  ( (array!53087 (arr!25502 (Array (_ BitVec 32) ValueCell!8775)) (size!25961 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53086)

(declare-fun mapDefault!29482 () ValueCell!8775)

(assert (=> b!903132 (= condMapEmpty!29482 (= (arr!25502 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8775)) mapDefault!29482)))))

(declare-fun mapNonEmpty!29482 () Bool)

(declare-fun tp!56547 () Bool)

(declare-fun e!505964 () Bool)

(assert (=> mapNonEmpty!29482 (= mapRes!29482 (and tp!56547 e!505964))))

(declare-fun mapRest!29482 () (Array (_ BitVec 32) ValueCell!8775))

(declare-fun mapValue!29482 () ValueCell!8775)

(declare-fun mapKey!29482 () (_ BitVec 32))

(assert (=> mapNonEmpty!29482 (= (arr!25502 _values!1152) (store mapRest!29482 mapKey!29482 mapValue!29482))))

(declare-fun b!903133 () Bool)

(assert (=> b!903133 (= e!505964 tp_is_empty!18513)))

(declare-fun b!903134 () Bool)

(declare-fun res!609366 () Bool)

(declare-fun e!505961 () Bool)

(assert (=> b!903134 (=> (not res!609366) (not e!505961))))

(declare-datatypes ((array!53088 0))(
  ( (array!53089 (arr!25503 (Array (_ BitVec 32) (_ BitVec 64))) (size!25962 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53088)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53088 (_ BitVec 32)) Bool)

(assert (=> b!903134 (= res!609366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903135 () Bool)

(declare-fun res!609367 () Bool)

(assert (=> b!903135 (=> (not res!609367) (not e!505961))))

(declare-datatypes ((List!17905 0))(
  ( (Nil!17902) (Cons!17901 (h!19047 (_ BitVec 64)) (t!25288 List!17905)) )
))
(declare-fun arrayNoDuplicates!0 (array!53088 (_ BitVec 32) List!17905) Bool)

(assert (=> b!903135 (= res!609367 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17902))))

(declare-fun b!903136 () Bool)

(declare-fun res!609368 () Bool)

(assert (=> b!903136 (=> (not res!609368) (not e!505961))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!903136 (= res!609368 (and (= (size!25961 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25962 _keys!1386) (size!25961 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609365 () Bool)

(assert (=> start!77510 (=> (not res!609365) (not e!505961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77510 (= res!609365 (validMask!0 mask!1756))))

(assert (=> start!77510 e!505961))

(declare-fun array_inv!19992 (array!53086) Bool)

(assert (=> start!77510 (and (array_inv!19992 _values!1152) e!505962)))

(assert (=> start!77510 tp!56546))

(assert (=> start!77510 true))

(assert (=> start!77510 tp_is_empty!18513))

(declare-fun array_inv!19993 (array!53088) Bool)

(assert (=> start!77510 (array_inv!19993 _keys!1386)))

(declare-fun b!903137 () Bool)

(assert (=> b!903137 (= e!505961 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29649)

(declare-fun lt!407964 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29649)

(declare-datatypes ((tuple2!12084 0))(
  ( (tuple2!12085 (_1!6053 (_ BitVec 64)) (_2!6053 V!29649)) )
))
(declare-datatypes ((List!17906 0))(
  ( (Nil!17903) (Cons!17902 (h!19048 tuple2!12084) (t!25289 List!17906)) )
))
(declare-datatypes ((ListLongMap!10781 0))(
  ( (ListLongMap!10782 (toList!5406 List!17906)) )
))
(declare-fun contains!4454 (ListLongMap!10781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2675 (array!53088 array!53086 (_ BitVec 32) (_ BitVec 32) V!29649 V!29649 (_ BitVec 32) Int) ListLongMap!10781)

(assert (=> b!903137 (= lt!407964 (contains!4454 (getCurrentListMap!2675 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!29482 () Bool)

(assert (=> mapIsEmpty!29482 mapRes!29482))

(assert (= (and start!77510 res!609365) b!903136))

(assert (= (and b!903136 res!609368) b!903134))

(assert (= (and b!903134 res!609366) b!903135))

(assert (= (and b!903135 res!609367) b!903137))

(assert (= (and b!903132 condMapEmpty!29482) mapIsEmpty!29482))

(assert (= (and b!903132 (not condMapEmpty!29482)) mapNonEmpty!29482))

(get-info :version)

(assert (= (and mapNonEmpty!29482 ((_ is ValueCellFull!8775) mapValue!29482)) b!903133))

(assert (= (and b!903132 ((_ is ValueCellFull!8775) mapDefault!29482)) b!903131))

(assert (= start!77510 b!903132))

(declare-fun m!838889 () Bool)

(assert (=> b!903137 m!838889))

(assert (=> b!903137 m!838889))

(declare-fun m!838891 () Bool)

(assert (=> b!903137 m!838891))

(declare-fun m!838893 () Bool)

(assert (=> b!903135 m!838893))

(declare-fun m!838895 () Bool)

(assert (=> b!903134 m!838895))

(declare-fun m!838897 () Bool)

(assert (=> start!77510 m!838897))

(declare-fun m!838899 () Bool)

(assert (=> start!77510 m!838899))

(declare-fun m!838901 () Bool)

(assert (=> start!77510 m!838901))

(declare-fun m!838903 () Bool)

(assert (=> mapNonEmpty!29482 m!838903))

(check-sat (not b_next!16095) b_and!26461 (not b!903137) (not start!77510) tp_is_empty!18513 (not mapNonEmpty!29482) (not b!903135) (not b!903134))
(check-sat b_and!26461 (not b_next!16095))
