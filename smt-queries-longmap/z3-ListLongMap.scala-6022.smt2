; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78184 () Bool)

(assert start!78184)

(declare-fun b_free!16543 () Bool)

(declare-fun b_next!16543 () Bool)

(assert (=> start!78184 (= b_free!16543 (not b_next!16543))))

(declare-fun tp!57900 () Bool)

(declare-fun b_and!27125 () Bool)

(assert (=> start!78184 (= tp!57900 b_and!27125)))

(declare-fun mapNonEmpty!30163 () Bool)

(declare-fun mapRes!30163 () Bool)

(declare-fun tp!57901 () Bool)

(declare-fun e!511240 () Bool)

(assert (=> mapNonEmpty!30163 (= mapRes!30163 (and tp!57901 e!511240))))

(declare-datatypes ((V!30247 0))(
  ( (V!30248 (val!9531 Int)) )
))
(declare-datatypes ((ValueCell!8999 0))(
  ( (ValueCellFull!8999 (v!12037 V!30247)) (EmptyCell!8999) )
))
(declare-datatypes ((array!53993 0))(
  ( (array!53994 (arr!25948 (Array (_ BitVec 32) ValueCell!8999)) (size!26408 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53993)

(declare-fun mapRest!30163 () (Array (_ BitVec 32) ValueCell!8999))

(declare-fun mapKey!30163 () (_ BitVec 32))

(declare-fun mapValue!30163 () ValueCell!8999)

(assert (=> mapNonEmpty!30163 (= (arr!25948 _values!1152) (store mapRest!30163 mapKey!30163 mapValue!30163))))

(declare-fun b!911619 () Bool)

(declare-fun res!614866 () Bool)

(declare-fun e!511239 () Bool)

(assert (=> b!911619 (=> (not res!614866) (not e!511239))))

(declare-datatypes ((array!53995 0))(
  ( (array!53996 (arr!25949 (Array (_ BitVec 32) (_ BitVec 64))) (size!26409 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53995)

(declare-datatypes ((List!18198 0))(
  ( (Nil!18195) (Cons!18194 (h!19346 (_ BitVec 64)) (t!25775 List!18198)) )
))
(declare-fun arrayNoDuplicates!0 (array!53995 (_ BitVec 32) List!18198) Bool)

(assert (=> b!911619 (= res!614866 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18195))))

(declare-fun b!911620 () Bool)

(declare-fun res!614865 () Bool)

(assert (=> b!911620 (=> (not res!614865) (not e!511239))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!911620 (= res!614865 (and (= (size!26408 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26409 _keys!1386) (size!26408 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!911621 () Bool)

(declare-fun res!614867 () Bool)

(assert (=> b!911621 (=> (not res!614867) (not e!511239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53995 (_ BitVec 32)) Bool)

(assert (=> b!911621 (= res!614867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!614864 () Bool)

(assert (=> start!78184 (=> (not res!614864) (not e!511239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78184 (= res!614864 (validMask!0 mask!1756))))

(assert (=> start!78184 e!511239))

(declare-fun e!511238 () Bool)

(declare-fun array_inv!20358 (array!53993) Bool)

(assert (=> start!78184 (and (array_inv!20358 _values!1152) e!511238)))

(assert (=> start!78184 tp!57900))

(assert (=> start!78184 true))

(declare-fun tp_is_empty!18961 () Bool)

(assert (=> start!78184 tp_is_empty!18961))

(declare-fun array_inv!20359 (array!53995) Bool)

(assert (=> start!78184 (array_inv!20359 _keys!1386)))

(declare-fun b!911622 () Bool)

(assert (=> b!911622 (= e!511240 tp_is_empty!18961)))

(declare-fun b!911623 () Bool)

(assert (=> b!911623 (= e!511239 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30247)

(declare-fun lt!410658 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30247)

(declare-datatypes ((tuple2!12378 0))(
  ( (tuple2!12379 (_1!6200 (_ BitVec 64)) (_2!6200 V!30247)) )
))
(declare-datatypes ((List!18199 0))(
  ( (Nil!18196) (Cons!18195 (h!19347 tuple2!12378) (t!25776 List!18199)) )
))
(declare-datatypes ((ListLongMap!11077 0))(
  ( (ListLongMap!11078 (toList!5554 List!18199)) )
))
(declare-fun contains!4607 (ListLongMap!11077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2815 (array!53995 array!53993 (_ BitVec 32) (_ BitVec 32) V!30247 V!30247 (_ BitVec 32) Int) ListLongMap!11077)

(assert (=> b!911623 (= lt!410658 (contains!4607 (getCurrentListMap!2815 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapIsEmpty!30163 () Bool)

(assert (=> mapIsEmpty!30163 mapRes!30163))

(declare-fun b!911624 () Bool)

(declare-fun e!511242 () Bool)

(assert (=> b!911624 (= e!511242 tp_is_empty!18961)))

(declare-fun b!911625 () Bool)

(assert (=> b!911625 (= e!511238 (and e!511242 mapRes!30163))))

(declare-fun condMapEmpty!30163 () Bool)

(declare-fun mapDefault!30163 () ValueCell!8999)

(assert (=> b!911625 (= condMapEmpty!30163 (= (arr!25948 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8999)) mapDefault!30163)))))

(assert (= (and start!78184 res!614864) b!911620))

(assert (= (and b!911620 res!614865) b!911621))

(assert (= (and b!911621 res!614867) b!911619))

(assert (= (and b!911619 res!614866) b!911623))

(assert (= (and b!911625 condMapEmpty!30163) mapIsEmpty!30163))

(assert (= (and b!911625 (not condMapEmpty!30163)) mapNonEmpty!30163))

(get-info :version)

(assert (= (and mapNonEmpty!30163 ((_ is ValueCellFull!8999) mapValue!30163)) b!911622))

(assert (= (and b!911625 ((_ is ValueCellFull!8999) mapDefault!30163)) b!911624))

(assert (= start!78184 b!911625))

(declare-fun m!846943 () Bool)

(assert (=> b!911623 m!846943))

(assert (=> b!911623 m!846943))

(declare-fun m!846945 () Bool)

(assert (=> b!911623 m!846945))

(declare-fun m!846947 () Bool)

(assert (=> b!911619 m!846947))

(declare-fun m!846949 () Bool)

(assert (=> start!78184 m!846949))

(declare-fun m!846951 () Bool)

(assert (=> start!78184 m!846951))

(declare-fun m!846953 () Bool)

(assert (=> start!78184 m!846953))

(declare-fun m!846955 () Bool)

(assert (=> mapNonEmpty!30163 m!846955))

(declare-fun m!846957 () Bool)

(assert (=> b!911621 m!846957))

(check-sat (not b_next!16543) b_and!27125 tp_is_empty!18961 (not b!911619) (not b!911623) (not mapNonEmpty!30163) (not start!78184) (not b!911621))
(check-sat b_and!27125 (not b_next!16543))
