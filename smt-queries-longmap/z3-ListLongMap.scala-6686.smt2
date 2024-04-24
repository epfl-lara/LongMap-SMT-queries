; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84256 () Bool)

(assert start!84256)

(declare-fun b!984187 () Bool)

(declare-fun e!554814 () Bool)

(declare-fun tp_is_empty!22891 () Bool)

(assert (=> b!984187 (= e!554814 tp_is_empty!22891)))

(declare-fun res!658361 () Bool)

(declare-fun e!554813 () Bool)

(assert (=> start!84256 (=> (not res!658361) (not e!554813))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84256 (= res!658361 (validMask!0 mask!1948))))

(assert (=> start!84256 e!554813))

(assert (=> start!84256 true))

(declare-datatypes ((V!35505 0))(
  ( (V!35506 (val!11496 Int)) )
))
(declare-datatypes ((ValueCell!10964 0))(
  ( (ValueCellFull!10964 (v!14055 V!35505)) (EmptyCell!10964) )
))
(declare-datatypes ((array!61808 0))(
  ( (array!61809 (arr!29757 (Array (_ BitVec 32) ValueCell!10964)) (size!30237 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61808)

(declare-fun e!554816 () Bool)

(declare-fun array_inv!23025 (array!61808) Bool)

(assert (=> start!84256 (and (array_inv!23025 _values!1278) e!554816)))

(declare-datatypes ((array!61810 0))(
  ( (array!61811 (arr!29758 (Array (_ BitVec 32) (_ BitVec 64))) (size!30238 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61810)

(declare-fun array_inv!23026 (array!61810) Bool)

(assert (=> start!84256 (array_inv!23026 _keys!1544)))

(declare-fun b!984188 () Bool)

(declare-fun e!554817 () Bool)

(declare-fun mapRes!36365 () Bool)

(assert (=> b!984188 (= e!554816 (and e!554817 mapRes!36365))))

(declare-fun condMapEmpty!36365 () Bool)

(declare-fun mapDefault!36365 () ValueCell!10964)

(assert (=> b!984188 (= condMapEmpty!36365 (= (arr!29757 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10964)) mapDefault!36365)))))

(declare-fun b!984189 () Bool)

(assert (=> b!984189 (= e!554813 false)))

(declare-fun lt!436854 () Bool)

(declare-datatypes ((List!20622 0))(
  ( (Nil!20619) (Cons!20618 (h!21786 (_ BitVec 64)) (t!29405 List!20622)) )
))
(declare-fun arrayNoDuplicates!0 (array!61810 (_ BitVec 32) List!20622) Bool)

(assert (=> b!984189 (= lt!436854 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20619))))

(declare-fun b!984190 () Bool)

(declare-fun res!658362 () Bool)

(assert (=> b!984190 (=> (not res!658362) (not e!554813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61810 (_ BitVec 32)) Bool)

(assert (=> b!984190 (= res!658362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984191 () Bool)

(assert (=> b!984191 (= e!554817 tp_is_empty!22891)))

(declare-fun mapIsEmpty!36365 () Bool)

(assert (=> mapIsEmpty!36365 mapRes!36365))

(declare-fun mapNonEmpty!36365 () Bool)

(declare-fun tp!69050 () Bool)

(assert (=> mapNonEmpty!36365 (= mapRes!36365 (and tp!69050 e!554814))))

(declare-fun mapRest!36365 () (Array (_ BitVec 32) ValueCell!10964))

(declare-fun mapValue!36365 () ValueCell!10964)

(declare-fun mapKey!36365 () (_ BitVec 32))

(assert (=> mapNonEmpty!36365 (= (arr!29757 _values!1278) (store mapRest!36365 mapKey!36365 mapValue!36365))))

(declare-fun b!984192 () Bool)

(declare-fun res!658363 () Bool)

(assert (=> b!984192 (=> (not res!658363) (not e!554813))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984192 (= res!658363 (and (= (size!30237 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30238 _keys!1544) (size!30237 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84256 res!658361) b!984192))

(assert (= (and b!984192 res!658363) b!984190))

(assert (= (and b!984190 res!658362) b!984189))

(assert (= (and b!984188 condMapEmpty!36365) mapIsEmpty!36365))

(assert (= (and b!984188 (not condMapEmpty!36365)) mapNonEmpty!36365))

(get-info :version)

(assert (= (and mapNonEmpty!36365 ((_ is ValueCellFull!10964) mapValue!36365)) b!984187))

(assert (= (and b!984188 ((_ is ValueCellFull!10964) mapDefault!36365)) b!984191))

(assert (= start!84256 b!984188))

(declare-fun m!911903 () Bool)

(assert (=> start!84256 m!911903))

(declare-fun m!911905 () Bool)

(assert (=> start!84256 m!911905))

(declare-fun m!911907 () Bool)

(assert (=> start!84256 m!911907))

(declare-fun m!911909 () Bool)

(assert (=> b!984189 m!911909))

(declare-fun m!911911 () Bool)

(assert (=> b!984190 m!911911))

(declare-fun m!911913 () Bool)

(assert (=> mapNonEmpty!36365 m!911913))

(check-sat (not start!84256) (not b!984189) (not b!984190) (not mapNonEmpty!36365) tp_is_empty!22891)
(check-sat)
