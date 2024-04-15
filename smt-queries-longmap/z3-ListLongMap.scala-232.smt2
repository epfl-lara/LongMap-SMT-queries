; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4064 () Bool)

(assert start!4064)

(declare-fun b_free!979 () Bool)

(declare-fun b_next!979 () Bool)

(assert (=> start!4064 (= b_free!979 (not b_next!979))))

(declare-fun tp!4356 () Bool)

(declare-fun b_and!1783 () Bool)

(assert (=> start!4064 (= tp!4356 b_and!1783)))

(declare-fun mapIsEmpty!1528 () Bool)

(declare-fun mapRes!1528 () Bool)

(assert (=> mapIsEmpty!1528 mapRes!1528))

(declare-fun b!30021 () Bool)

(declare-fun res!18060 () Bool)

(declare-fun e!19311 () Bool)

(assert (=> b!30021 (=> (not res!18060) (not e!19311))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1603 0))(
  ( (V!1604 (val!693 Int)) )
))
(declare-datatypes ((ValueCell!467 0))(
  ( (ValueCellFull!467 (v!1781 V!1603)) (EmptyCell!467) )
))
(declare-datatypes ((array!1869 0))(
  ( (array!1870 (arr!888 (Array (_ BitVec 32) ValueCell!467)) (size!989 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1869)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1871 0))(
  ( (array!1872 (arr!889 (Array (_ BitVec 32) (_ BitVec 64))) (size!990 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1871)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1603)

(declare-fun minValue!1443 () V!1603)

(declare-datatypes ((tuple2!1152 0))(
  ( (tuple2!1153 (_1!587 (_ BitVec 64)) (_2!587 V!1603)) )
))
(declare-datatypes ((List!735 0))(
  ( (Nil!732) (Cons!731 (h!1298 tuple2!1152) (t!3421 List!735)) )
))
(declare-datatypes ((ListLongMap!717 0))(
  ( (ListLongMap!718 (toList!374 List!735)) )
))
(declare-fun contains!315 (ListLongMap!717 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!198 (array!1871 array!1869 (_ BitVec 32) (_ BitVec 32) V!1603 V!1603 (_ BitVec 32) Int) ListLongMap!717)

(assert (=> b!30021 (= res!18060 (not (contains!315 (getCurrentListMap!198 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30022 () Bool)

(declare-fun res!18057 () Bool)

(assert (=> b!30022 (=> (not res!18057) (not e!19311))))

(declare-datatypes ((List!736 0))(
  ( (Nil!733) (Cons!732 (h!1299 (_ BitVec 64)) (t!3422 List!736)) )
))
(declare-fun arrayNoDuplicates!0 (array!1871 (_ BitVec 32) List!736) Bool)

(assert (=> b!30022 (= res!18057 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!733))))

(declare-fun res!18059 () Bool)

(assert (=> start!4064 (=> (not res!18059) (not e!19311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4064 (= res!18059 (validMask!0 mask!2294))))

(assert (=> start!4064 e!19311))

(assert (=> start!4064 true))

(assert (=> start!4064 tp!4356))

(declare-fun e!19309 () Bool)

(declare-fun array_inv!623 (array!1869) Bool)

(assert (=> start!4064 (and (array_inv!623 _values!1501) e!19309)))

(declare-fun array_inv!624 (array!1871) Bool)

(assert (=> start!4064 (array_inv!624 _keys!1833)))

(declare-fun tp_is_empty!1333 () Bool)

(assert (=> start!4064 tp_is_empty!1333))

(declare-fun b!30023 () Bool)

(declare-fun e!19312 () Bool)

(assert (=> b!30023 (= e!19312 tp_is_empty!1333)))

(declare-fun b!30024 () Bool)

(assert (=> b!30024 (= e!19311 false)))

(declare-datatypes ((SeekEntryResult!100 0))(
  ( (MissingZero!100 (index!2522 (_ BitVec 32))) (Found!100 (index!2523 (_ BitVec 32))) (Intermediate!100 (undefined!912 Bool) (index!2524 (_ BitVec 32)) (x!6498 (_ BitVec 32))) (Undefined!100) (MissingVacant!100 (index!2525 (_ BitVec 32))) )
))
(declare-fun lt!11380 () SeekEntryResult!100)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1871 (_ BitVec 32)) SeekEntryResult!100)

(assert (=> b!30024 (= lt!11380 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30025 () Bool)

(declare-fun e!19308 () Bool)

(assert (=> b!30025 (= e!19308 tp_is_empty!1333)))

(declare-fun b!30026 () Bool)

(declare-fun res!18055 () Bool)

(assert (=> b!30026 (=> (not res!18055) (not e!19311))))

(declare-fun arrayContainsKey!0 (array!1871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30026 (= res!18055 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30027 () Bool)

(declare-fun res!18061 () Bool)

(assert (=> b!30027 (=> (not res!18061) (not e!19311))))

(assert (=> b!30027 (= res!18061 (and (= (size!989 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!990 _keys!1833) (size!989 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1528 () Bool)

(declare-fun tp!4357 () Bool)

(assert (=> mapNonEmpty!1528 (= mapRes!1528 (and tp!4357 e!19308))))

(declare-fun mapRest!1528 () (Array (_ BitVec 32) ValueCell!467))

(declare-fun mapValue!1528 () ValueCell!467)

(declare-fun mapKey!1528 () (_ BitVec 32))

(assert (=> mapNonEmpty!1528 (= (arr!888 _values!1501) (store mapRest!1528 mapKey!1528 mapValue!1528))))

(declare-fun b!30028 () Bool)

(declare-fun res!18058 () Bool)

(assert (=> b!30028 (=> (not res!18058) (not e!19311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1871 (_ BitVec 32)) Bool)

(assert (=> b!30028 (= res!18058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30029 () Bool)

(declare-fun res!18056 () Bool)

(assert (=> b!30029 (=> (not res!18056) (not e!19311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30029 (= res!18056 (validKeyInArray!0 k0!1304))))

(declare-fun b!30030 () Bool)

(assert (=> b!30030 (= e!19309 (and e!19312 mapRes!1528))))

(declare-fun condMapEmpty!1528 () Bool)

(declare-fun mapDefault!1528 () ValueCell!467)

(assert (=> b!30030 (= condMapEmpty!1528 (= (arr!888 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!467)) mapDefault!1528)))))

(assert (= (and start!4064 res!18059) b!30027))

(assert (= (and b!30027 res!18061) b!30028))

(assert (= (and b!30028 res!18058) b!30022))

(assert (= (and b!30022 res!18057) b!30029))

(assert (= (and b!30029 res!18056) b!30021))

(assert (= (and b!30021 res!18060) b!30026))

(assert (= (and b!30026 res!18055) b!30024))

(assert (= (and b!30030 condMapEmpty!1528) mapIsEmpty!1528))

(assert (= (and b!30030 (not condMapEmpty!1528)) mapNonEmpty!1528))

(get-info :version)

(assert (= (and mapNonEmpty!1528 ((_ is ValueCellFull!467) mapValue!1528)) b!30025))

(assert (= (and b!30030 ((_ is ValueCellFull!467) mapDefault!1528)) b!30023))

(assert (= start!4064 b!30030))

(declare-fun m!24117 () Bool)

(assert (=> b!30028 m!24117))

(declare-fun m!24119 () Bool)

(assert (=> b!30026 m!24119))

(declare-fun m!24121 () Bool)

(assert (=> start!4064 m!24121))

(declare-fun m!24123 () Bool)

(assert (=> start!4064 m!24123))

(declare-fun m!24125 () Bool)

(assert (=> start!4064 m!24125))

(declare-fun m!24127 () Bool)

(assert (=> b!30022 m!24127))

(declare-fun m!24129 () Bool)

(assert (=> b!30021 m!24129))

(assert (=> b!30021 m!24129))

(declare-fun m!24131 () Bool)

(assert (=> b!30021 m!24131))

(declare-fun m!24133 () Bool)

(assert (=> mapNonEmpty!1528 m!24133))

(declare-fun m!24135 () Bool)

(assert (=> b!30024 m!24135))

(declare-fun m!24137 () Bool)

(assert (=> b!30029 m!24137))

(check-sat (not mapNonEmpty!1528) (not start!4064) (not b!30028) (not b!30024) (not b_next!979) b_and!1783 (not b!30022) (not b!30029) (not b!30026) tp_is_empty!1333 (not b!30021))
(check-sat b_and!1783 (not b_next!979))
