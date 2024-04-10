; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78596 () Bool)

(assert start!78596)

(declare-fun b_free!16809 () Bool)

(declare-fun b_next!16809 () Bool)

(assert (=> start!78596 (= b_free!16809 (not b_next!16809))))

(declare-fun tp!58867 () Bool)

(declare-fun b_and!27431 () Bool)

(assert (=> start!78596 (= tp!58867 b_and!27431)))

(declare-fun b!916201 () Bool)

(declare-fun res!617665 () Bool)

(declare-fun e!514287 () Bool)

(assert (=> b!916201 (=> (not res!617665) (not e!514287))))

(declare-datatypes ((array!54626 0))(
  ( (array!54627 (arr!26258 (Array (_ BitVec 32) (_ BitVec 64))) (size!26717 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54626)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54626 (_ BitVec 32)) Bool)

(assert (=> b!916201 (= res!617665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916202 () Bool)

(declare-fun res!617663 () Bool)

(assert (=> b!916202 (=> (not res!617663) (not e!514287))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916202 (= res!617663 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26717 _keys!1487))))))

(declare-fun mapIsEmpty!30732 () Bool)

(declare-fun mapRes!30732 () Bool)

(assert (=> mapIsEmpty!30732 mapRes!30732))

(declare-fun res!617664 () Bool)

(assert (=> start!78596 (=> (not res!617664) (not e!514287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78596 (= res!617664 (validMask!0 mask!1881))))

(assert (=> start!78596 e!514287))

(assert (=> start!78596 true))

(declare-datatypes ((V!30721 0))(
  ( (V!30722 (val!9709 Int)) )
))
(declare-datatypes ((ValueCell!9177 0))(
  ( (ValueCellFull!9177 (v!12227 V!30721)) (EmptyCell!9177) )
))
(declare-datatypes ((array!54628 0))(
  ( (array!54629 (arr!26259 (Array (_ BitVec 32) ValueCell!9177)) (size!26718 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54628)

(declare-fun e!514291 () Bool)

(declare-fun array_inv!20482 (array!54628) Bool)

(assert (=> start!78596 (and (array_inv!20482 _values!1231) e!514291)))

(assert (=> start!78596 tp!58867))

(declare-fun array_inv!20483 (array!54626) Bool)

(assert (=> start!78596 (array_inv!20483 _keys!1487)))

(declare-fun tp_is_empty!19317 () Bool)

(assert (=> start!78596 tp_is_empty!19317))

(declare-fun b!916203 () Bool)

(declare-fun e!514290 () Bool)

(assert (=> b!916203 (= e!514291 (and e!514290 mapRes!30732))))

(declare-fun condMapEmpty!30732 () Bool)

(declare-fun mapDefault!30732 () ValueCell!9177)

(assert (=> b!916203 (= condMapEmpty!30732 (= (arr!26259 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9177)) mapDefault!30732)))))

(declare-fun b!916204 () Bool)

(assert (=> b!916204 (= e!514290 tp_is_empty!19317)))

(declare-fun b!916205 () Bool)

(declare-fun e!514288 () Bool)

(assert (=> b!916205 (= e!514288 tp_is_empty!19317)))

(declare-fun mapNonEmpty!30732 () Bool)

(declare-fun tp!58868 () Bool)

(assert (=> mapNonEmpty!30732 (= mapRes!30732 (and tp!58868 e!514288))))

(declare-fun mapKey!30732 () (_ BitVec 32))

(declare-fun mapValue!30732 () ValueCell!9177)

(declare-fun mapRest!30732 () (Array (_ BitVec 32) ValueCell!9177))

(assert (=> mapNonEmpty!30732 (= (arr!26259 _values!1231) (store mapRest!30732 mapKey!30732 mapValue!30732))))

(declare-fun b!916206 () Bool)

(declare-fun res!617662 () Bool)

(assert (=> b!916206 (=> (not res!617662) (not e!514287))))

(declare-datatypes ((List!18409 0))(
  ( (Nil!18406) (Cons!18405 (h!19551 (_ BitVec 64)) (t!26022 List!18409)) )
))
(declare-fun arrayNoDuplicates!0 (array!54626 (_ BitVec 32) List!18409) Bool)

(assert (=> b!916206 (= res!617662 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18406))))

(declare-fun b!916207 () Bool)

(assert (=> b!916207 (= e!514287 false)))

(declare-fun lt!411766 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30721)

(declare-fun minValue!1173 () V!30721)

(declare-datatypes ((tuple2!12596 0))(
  ( (tuple2!12597 (_1!6309 (_ BitVec 64)) (_2!6309 V!30721)) )
))
(declare-datatypes ((List!18410 0))(
  ( (Nil!18407) (Cons!18406 (h!19552 tuple2!12596) (t!26023 List!18410)) )
))
(declare-datatypes ((ListLongMap!11293 0))(
  ( (ListLongMap!11294 (toList!5662 List!18410)) )
))
(declare-fun contains!4716 (ListLongMap!11293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2923 (array!54626 array!54628 (_ BitVec 32) (_ BitVec 32) V!30721 V!30721 (_ BitVec 32) Int) ListLongMap!11293)

(assert (=> b!916207 (= lt!411766 (contains!4716 (getCurrentListMap!2923 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!916208 () Bool)

(declare-fun res!617661 () Bool)

(assert (=> b!916208 (=> (not res!617661) (not e!514287))))

(assert (=> b!916208 (= res!617661 (and (= (size!26718 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26717 _keys!1487) (size!26718 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78596 res!617664) b!916208))

(assert (= (and b!916208 res!617661) b!916201))

(assert (= (and b!916201 res!617665) b!916206))

(assert (= (and b!916206 res!617662) b!916202))

(assert (= (and b!916202 res!617663) b!916207))

(assert (= (and b!916203 condMapEmpty!30732) mapIsEmpty!30732))

(assert (= (and b!916203 (not condMapEmpty!30732)) mapNonEmpty!30732))

(get-info :version)

(assert (= (and mapNonEmpty!30732 ((_ is ValueCellFull!9177) mapValue!30732)) b!916205))

(assert (= (and b!916203 ((_ is ValueCellFull!9177) mapDefault!30732)) b!916204))

(assert (= start!78596 b!916203))

(declare-fun m!850315 () Bool)

(assert (=> b!916206 m!850315))

(declare-fun m!850317 () Bool)

(assert (=> start!78596 m!850317))

(declare-fun m!850319 () Bool)

(assert (=> start!78596 m!850319))

(declare-fun m!850321 () Bool)

(assert (=> start!78596 m!850321))

(declare-fun m!850323 () Bool)

(assert (=> b!916201 m!850323))

(declare-fun m!850325 () Bool)

(assert (=> b!916207 m!850325))

(assert (=> b!916207 m!850325))

(declare-fun m!850327 () Bool)

(assert (=> b!916207 m!850327))

(declare-fun m!850329 () Bool)

(assert (=> mapNonEmpty!30732 m!850329))

(check-sat (not b!916201) (not mapNonEmpty!30732) (not b!916206) (not b!916207) (not b_next!16809) b_and!27431 tp_is_empty!19317 (not start!78596))
(check-sat b_and!27431 (not b_next!16809))
