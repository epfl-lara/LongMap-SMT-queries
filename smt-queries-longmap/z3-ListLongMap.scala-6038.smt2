; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78296 () Bool)

(assert start!78296)

(declare-fun b_free!16639 () Bool)

(declare-fun b_next!16639 () Bool)

(assert (=> start!78296 (= b_free!16639 (not b_next!16639))))

(declare-fun tp!58191 () Bool)

(declare-fun b_and!27223 () Bool)

(assert (=> start!78296 (= tp!58191 b_and!27223)))

(declare-fun mapNonEmpty!30310 () Bool)

(declare-fun mapRes!30310 () Bool)

(declare-fun tp!58192 () Bool)

(declare-fun e!512033 () Bool)

(assert (=> mapNonEmpty!30310 (= mapRes!30310 (and tp!58192 e!512033))))

(declare-datatypes ((V!30375 0))(
  ( (V!30376 (val!9579 Int)) )
))
(declare-datatypes ((ValueCell!9047 0))(
  ( (ValueCellFull!9047 (v!12086 V!30375)) (EmptyCell!9047) )
))
(declare-datatypes ((array!54175 0))(
  ( (array!54176 (arr!26038 (Array (_ BitVec 32) ValueCell!9047)) (size!26498 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54175)

(declare-fun mapRest!30310 () (Array (_ BitVec 32) ValueCell!9047))

(declare-fun mapKey!30310 () (_ BitVec 32))

(declare-fun mapValue!30310 () ValueCell!9047)

(assert (=> mapNonEmpty!30310 (= (arr!26038 _values!1152) (store mapRest!30310 mapKey!30310 mapValue!30310))))

(declare-fun b!912754 () Bool)

(declare-fun res!615503 () Bool)

(declare-fun e!512032 () Bool)

(assert (=> b!912754 (=> (not res!615503) (not e!512032))))

(declare-datatypes ((array!54177 0))(
  ( (array!54178 (arr!26039 (Array (_ BitVec 32) (_ BitVec 64))) (size!26499 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54177)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54177 (_ BitVec 32)) Bool)

(assert (=> b!912754 (= res!615503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912755 () Bool)

(declare-fun e!512030 () Bool)

(declare-fun tp_is_empty!19057 () Bool)

(assert (=> b!912755 (= e!512030 tp_is_empty!19057)))

(declare-fun res!615505 () Bool)

(assert (=> start!78296 (=> (not res!615505) (not e!512032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78296 (= res!615505 (validMask!0 mask!1756))))

(assert (=> start!78296 e!512032))

(declare-fun e!512031 () Bool)

(declare-fun array_inv!20432 (array!54175) Bool)

(assert (=> start!78296 (and (array_inv!20432 _values!1152) e!512031)))

(assert (=> start!78296 tp!58191))

(assert (=> start!78296 true))

(assert (=> start!78296 tp_is_empty!19057))

(declare-fun array_inv!20433 (array!54177) Bool)

(assert (=> start!78296 (array_inv!20433 _keys!1386)))

(declare-fun b!912756 () Bool)

(assert (=> b!912756 (= e!512033 tp_is_empty!19057)))

(declare-fun mapIsEmpty!30310 () Bool)

(assert (=> mapIsEmpty!30310 mapRes!30310))

(declare-fun b!912757 () Bool)

(assert (=> b!912757 (= e!512032 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30375)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410880 () Bool)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30375)

(declare-datatypes ((tuple2!12442 0))(
  ( (tuple2!12443 (_1!6232 (_ BitVec 64)) (_2!6232 V!30375)) )
))
(declare-datatypes ((List!18262 0))(
  ( (Nil!18259) (Cons!18258 (h!19410 tuple2!12442) (t!25841 List!18262)) )
))
(declare-datatypes ((ListLongMap!11141 0))(
  ( (ListLongMap!11142 (toList!5586 List!18262)) )
))
(declare-fun contains!4640 (ListLongMap!11141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2847 (array!54177 array!54175 (_ BitVec 32) (_ BitVec 32) V!30375 V!30375 (_ BitVec 32) Int) ListLongMap!11141)

(assert (=> b!912757 (= lt!410880 (contains!4640 (getCurrentListMap!2847 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912758 () Bool)

(declare-fun res!615504 () Bool)

(assert (=> b!912758 (=> (not res!615504) (not e!512032))))

(assert (=> b!912758 (= res!615504 (and (= (size!26498 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26499 _keys!1386) (size!26498 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912759 () Bool)

(declare-fun res!615506 () Bool)

(assert (=> b!912759 (=> (not res!615506) (not e!512032))))

(declare-datatypes ((List!18263 0))(
  ( (Nil!18260) (Cons!18259 (h!19411 (_ BitVec 64)) (t!25842 List!18263)) )
))
(declare-fun arrayNoDuplicates!0 (array!54177 (_ BitVec 32) List!18263) Bool)

(assert (=> b!912759 (= res!615506 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18260))))

(declare-fun b!912760 () Bool)

(assert (=> b!912760 (= e!512031 (and e!512030 mapRes!30310))))

(declare-fun condMapEmpty!30310 () Bool)

(declare-fun mapDefault!30310 () ValueCell!9047)

(assert (=> b!912760 (= condMapEmpty!30310 (= (arr!26038 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9047)) mapDefault!30310)))))

(assert (= (and start!78296 res!615505) b!912758))

(assert (= (and b!912758 res!615504) b!912754))

(assert (= (and b!912754 res!615503) b!912759))

(assert (= (and b!912759 res!615506) b!912757))

(assert (= (and b!912760 condMapEmpty!30310) mapIsEmpty!30310))

(assert (= (and b!912760 (not condMapEmpty!30310)) mapNonEmpty!30310))

(get-info :version)

(assert (= (and mapNonEmpty!30310 ((_ is ValueCellFull!9047) mapValue!30310)) b!912756))

(assert (= (and b!912760 ((_ is ValueCellFull!9047) mapDefault!30310)) b!912755))

(assert (= start!78296 b!912760))

(declare-fun m!847797 () Bool)

(assert (=> b!912757 m!847797))

(assert (=> b!912757 m!847797))

(declare-fun m!847799 () Bool)

(assert (=> b!912757 m!847799))

(declare-fun m!847801 () Bool)

(assert (=> start!78296 m!847801))

(declare-fun m!847803 () Bool)

(assert (=> start!78296 m!847803))

(declare-fun m!847805 () Bool)

(assert (=> start!78296 m!847805))

(declare-fun m!847807 () Bool)

(assert (=> mapNonEmpty!30310 m!847807))

(declare-fun m!847809 () Bool)

(assert (=> b!912754 m!847809))

(declare-fun m!847811 () Bool)

(assert (=> b!912759 m!847811))

(check-sat tp_is_empty!19057 (not b_next!16639) b_and!27223 (not mapNonEmpty!30310) (not b!912757) (not b!912759) (not start!78296) (not b!912754))
(check-sat b_and!27223 (not b_next!16639))
