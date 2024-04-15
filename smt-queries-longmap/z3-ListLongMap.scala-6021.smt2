; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77992 () Bool)

(assert start!77992)

(declare-fun b_free!16537 () Bool)

(declare-fun b_next!16537 () Bool)

(assert (=> start!77992 (= b_free!16537 (not b_next!16537))))

(declare-fun tp!57883 () Bool)

(declare-fun b_and!27083 () Bool)

(assert (=> start!77992 (= tp!57883 b_and!27083)))

(declare-fun mapNonEmpty!30154 () Bool)

(declare-fun mapRes!30154 () Bool)

(declare-fun tp!57882 () Bool)

(declare-fun e!510466 () Bool)

(assert (=> mapNonEmpty!30154 (= mapRes!30154 (and tp!57882 e!510466))))

(declare-datatypes ((V!30239 0))(
  ( (V!30240 (val!9528 Int)) )
))
(declare-datatypes ((ValueCell!8996 0))(
  ( (ValueCellFull!8996 (v!12036 V!30239)) (EmptyCell!8996) )
))
(declare-datatypes ((array!53915 0))(
  ( (array!53916 (arr!25914 (Array (_ BitVec 32) ValueCell!8996)) (size!26375 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53915)

(declare-fun mapRest!30154 () (Array (_ BitVec 32) ValueCell!8996))

(declare-fun mapValue!30154 () ValueCell!8996)

(declare-fun mapKey!30154 () (_ BitVec 32))

(assert (=> mapNonEmpty!30154 (= (arr!25914 _values!1152) (store mapRest!30154 mapKey!30154 mapValue!30154))))

(declare-fun b!910414 () Bool)

(declare-fun e!510465 () Bool)

(declare-fun e!510467 () Bool)

(assert (=> b!910414 (= e!510465 (and e!510467 mapRes!30154))))

(declare-fun condMapEmpty!30154 () Bool)

(declare-fun mapDefault!30154 () ValueCell!8996)

(assert (=> b!910414 (= condMapEmpty!30154 (= (arr!25914 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8996)) mapDefault!30154)))))

(declare-fun b!910415 () Bool)

(declare-fun e!510464 () Bool)

(assert (=> b!910415 (= e!510464 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30239)

(declare-datatypes ((array!53917 0))(
  ( (array!53918 (arr!25915 (Array (_ BitVec 32) (_ BitVec 64))) (size!26376 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53917)

(declare-fun lt!410052 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30239)

(declare-datatypes ((tuple2!12448 0))(
  ( (tuple2!12449 (_1!6235 (_ BitVec 64)) (_2!6235 V!30239)) )
))
(declare-datatypes ((List!18233 0))(
  ( (Nil!18230) (Cons!18229 (h!19375 tuple2!12448) (t!25809 List!18233)) )
))
(declare-datatypes ((ListLongMap!11135 0))(
  ( (ListLongMap!11136 (toList!5583 List!18233)) )
))
(declare-fun contains!4584 (ListLongMap!11135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2785 (array!53917 array!53915 (_ BitVec 32) (_ BitVec 32) V!30239 V!30239 (_ BitVec 32) Int) ListLongMap!11135)

(assert (=> b!910415 (= lt!410052 (contains!4584 (getCurrentListMap!2785 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910416 () Bool)

(declare-fun tp_is_empty!18955 () Bool)

(assert (=> b!910416 (= e!510467 tp_is_empty!18955)))

(declare-fun b!910417 () Bool)

(declare-fun res!614374 () Bool)

(assert (=> b!910417 (=> (not res!614374) (not e!510464))))

(assert (=> b!910417 (= res!614374 (and (= (size!26375 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26376 _keys!1386) (size!26375 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910418 () Bool)

(assert (=> b!910418 (= e!510466 tp_is_empty!18955)))

(declare-fun mapIsEmpty!30154 () Bool)

(assert (=> mapIsEmpty!30154 mapRes!30154))

(declare-fun res!614375 () Bool)

(assert (=> start!77992 (=> (not res!614375) (not e!510464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77992 (= res!614375 (validMask!0 mask!1756))))

(assert (=> start!77992 e!510464))

(declare-fun array_inv!20316 (array!53915) Bool)

(assert (=> start!77992 (and (array_inv!20316 _values!1152) e!510465)))

(assert (=> start!77992 tp!57883))

(assert (=> start!77992 true))

(assert (=> start!77992 tp_is_empty!18955))

(declare-fun array_inv!20317 (array!53917) Bool)

(assert (=> start!77992 (array_inv!20317 _keys!1386)))

(declare-fun b!910419 () Bool)

(declare-fun res!614376 () Bool)

(assert (=> b!910419 (=> (not res!614376) (not e!510464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53917 (_ BitVec 32)) Bool)

(assert (=> b!910419 (= res!614376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910420 () Bool)

(declare-fun res!614377 () Bool)

(assert (=> b!910420 (=> (not res!614377) (not e!510464))))

(declare-datatypes ((List!18234 0))(
  ( (Nil!18231) (Cons!18230 (h!19376 (_ BitVec 64)) (t!25810 List!18234)) )
))
(declare-fun arrayNoDuplicates!0 (array!53917 (_ BitVec 32) List!18234) Bool)

(assert (=> b!910420 (= res!614377 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18231))))

(assert (= (and start!77992 res!614375) b!910417))

(assert (= (and b!910417 res!614374) b!910419))

(assert (= (and b!910419 res!614376) b!910420))

(assert (= (and b!910420 res!614377) b!910415))

(assert (= (and b!910414 condMapEmpty!30154) mapIsEmpty!30154))

(assert (= (and b!910414 (not condMapEmpty!30154)) mapNonEmpty!30154))

(get-info :version)

(assert (= (and mapNonEmpty!30154 ((_ is ValueCellFull!8996) mapValue!30154)) b!910418))

(assert (= (and b!910414 ((_ is ValueCellFull!8996) mapDefault!30154)) b!910416))

(assert (= start!77992 b!910414))

(declare-fun m!844843 () Bool)

(assert (=> start!77992 m!844843))

(declare-fun m!844845 () Bool)

(assert (=> start!77992 m!844845))

(declare-fun m!844847 () Bool)

(assert (=> start!77992 m!844847))

(declare-fun m!844849 () Bool)

(assert (=> b!910419 m!844849))

(declare-fun m!844851 () Bool)

(assert (=> mapNonEmpty!30154 m!844851))

(declare-fun m!844853 () Bool)

(assert (=> b!910415 m!844853))

(assert (=> b!910415 m!844853))

(declare-fun m!844855 () Bool)

(assert (=> b!910415 m!844855))

(declare-fun m!844857 () Bool)

(assert (=> b!910420 m!844857))

(check-sat (not b!910415) (not b!910419) (not mapNonEmpty!30154) (not b_next!16537) b_and!27083 (not start!77992) tp_is_empty!18955 (not b!910420))
(check-sat b_and!27083 (not b_next!16537))
