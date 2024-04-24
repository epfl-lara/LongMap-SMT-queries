; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84292 () Bool)

(assert start!84292)

(declare-fun b!984511 () Bool)

(declare-fun res!658523 () Bool)

(declare-fun e!555085 () Bool)

(assert (=> b!984511 (=> (not res!658523) (not e!555085))))

(declare-datatypes ((array!61878 0))(
  ( (array!61879 (arr!29792 (Array (_ BitVec 32) (_ BitVec 64))) (size!30272 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61878)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61878 (_ BitVec 32)) Bool)

(assert (=> b!984511 (= res!658523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!658525 () Bool)

(assert (=> start!84292 (=> (not res!658525) (not e!555085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84292 (= res!658525 (validMask!0 mask!1948))))

(assert (=> start!84292 e!555085))

(assert (=> start!84292 true))

(declare-datatypes ((V!35553 0))(
  ( (V!35554 (val!11514 Int)) )
))
(declare-datatypes ((ValueCell!10982 0))(
  ( (ValueCellFull!10982 (v!14073 V!35553)) (EmptyCell!10982) )
))
(declare-datatypes ((array!61880 0))(
  ( (array!61881 (arr!29793 (Array (_ BitVec 32) ValueCell!10982)) (size!30273 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61880)

(declare-fun e!555086 () Bool)

(declare-fun array_inv!23051 (array!61880) Bool)

(assert (=> start!84292 (and (array_inv!23051 _values!1278) e!555086)))

(declare-fun array_inv!23052 (array!61878) Bool)

(assert (=> start!84292 (array_inv!23052 _keys!1544)))

(declare-fun b!984512 () Bool)

(declare-fun e!555084 () Bool)

(declare-fun tp_is_empty!22927 () Bool)

(assert (=> b!984512 (= e!555084 tp_is_empty!22927)))

(declare-fun b!984513 () Bool)

(declare-fun res!658524 () Bool)

(assert (=> b!984513 (=> (not res!658524) (not e!555085))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984513 (= res!658524 (and (= (size!30273 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30272 _keys!1544) (size!30273 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984514 () Bool)

(declare-fun e!555083 () Bool)

(assert (=> b!984514 (= e!555083 tp_is_empty!22927)))

(declare-fun b!984515 () Bool)

(assert (=> b!984515 (= e!555085 false)))

(declare-fun lt!436908 () Bool)

(declare-datatypes ((List!20633 0))(
  ( (Nil!20630) (Cons!20629 (h!21797 (_ BitVec 64)) (t!29416 List!20633)) )
))
(declare-fun arrayNoDuplicates!0 (array!61878 (_ BitVec 32) List!20633) Bool)

(assert (=> b!984515 (= lt!436908 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20630))))

(declare-fun b!984516 () Bool)

(declare-fun mapRes!36419 () Bool)

(assert (=> b!984516 (= e!555086 (and e!555083 mapRes!36419))))

(declare-fun condMapEmpty!36419 () Bool)

(declare-fun mapDefault!36419 () ValueCell!10982)

(assert (=> b!984516 (= condMapEmpty!36419 (= (arr!29793 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10982)) mapDefault!36419)))))

(declare-fun mapIsEmpty!36419 () Bool)

(assert (=> mapIsEmpty!36419 mapRes!36419))

(declare-fun mapNonEmpty!36419 () Bool)

(declare-fun tp!69104 () Bool)

(assert (=> mapNonEmpty!36419 (= mapRes!36419 (and tp!69104 e!555084))))

(declare-fun mapKey!36419 () (_ BitVec 32))

(declare-fun mapRest!36419 () (Array (_ BitVec 32) ValueCell!10982))

(declare-fun mapValue!36419 () ValueCell!10982)

(assert (=> mapNonEmpty!36419 (= (arr!29793 _values!1278) (store mapRest!36419 mapKey!36419 mapValue!36419))))

(assert (= (and start!84292 res!658525) b!984513))

(assert (= (and b!984513 res!658524) b!984511))

(assert (= (and b!984511 res!658523) b!984515))

(assert (= (and b!984516 condMapEmpty!36419) mapIsEmpty!36419))

(assert (= (and b!984516 (not condMapEmpty!36419)) mapNonEmpty!36419))

(get-info :version)

(assert (= (and mapNonEmpty!36419 ((_ is ValueCellFull!10982) mapValue!36419)) b!984512))

(assert (= (and b!984516 ((_ is ValueCellFull!10982) mapDefault!36419)) b!984514))

(assert (= start!84292 b!984516))

(declare-fun m!912119 () Bool)

(assert (=> b!984511 m!912119))

(declare-fun m!912121 () Bool)

(assert (=> start!84292 m!912121))

(declare-fun m!912123 () Bool)

(assert (=> start!84292 m!912123))

(declare-fun m!912125 () Bool)

(assert (=> start!84292 m!912125))

(declare-fun m!912127 () Bool)

(assert (=> b!984515 m!912127))

(declare-fun m!912129 () Bool)

(assert (=> mapNonEmpty!36419 m!912129))

(check-sat (not start!84292) (not b!984515) (not mapNonEmpty!36419) tp_is_empty!22927 (not b!984511))
(check-sat)
