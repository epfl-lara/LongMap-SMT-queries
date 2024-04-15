; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4178 () Bool)

(assert start!4178)

(declare-fun b_free!1093 () Bool)

(declare-fun b_next!1093 () Bool)

(assert (=> start!4178 (= b_free!1093 (not b_next!1093))))

(declare-fun tp!4698 () Bool)

(declare-fun b_and!1897 () Bool)

(assert (=> start!4178 (= tp!4698 b_and!1897)))

(declare-fun b!31713 () Bool)

(declare-fun res!19237 () Bool)

(declare-fun e!20218 () Bool)

(assert (=> b!31713 (=> (not res!19237) (not e!20218))))

(declare-datatypes ((array!2085 0))(
  ( (array!2086 (arr!996 (Array (_ BitVec 32) (_ BitVec 64))) (size!1097 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2085)

(declare-datatypes ((List!809 0))(
  ( (Nil!806) (Cons!805 (h!1372 (_ BitVec 64)) (t!3495 List!809)) )
))
(declare-fun arrayNoDuplicates!0 (array!2085 (_ BitVec 32) List!809) Bool)

(assert (=> b!31713 (= res!19237 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!806))))

(declare-fun b!31714 () Bool)

(assert (=> b!31714 (= e!20218 false)))

(declare-fun lt!11596 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2085 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31714 (= lt!11596 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31715 () Bool)

(declare-fun res!19236 () Bool)

(assert (=> b!31715 (=> (not res!19236) (not e!20218))))

(declare-fun arrayContainsKey!0 (array!2085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31715 (= res!19236 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1699 () Bool)

(declare-fun mapRes!1699 () Bool)

(declare-fun tp!4699 () Bool)

(declare-fun e!20217 () Bool)

(assert (=> mapNonEmpty!1699 (= mapRes!1699 (and tp!4699 e!20217))))

(declare-datatypes ((V!1755 0))(
  ( (V!1756 (val!750 Int)) )
))
(declare-datatypes ((ValueCell!524 0))(
  ( (ValueCellFull!524 (v!1838 V!1755)) (EmptyCell!524) )
))
(declare-datatypes ((array!2087 0))(
  ( (array!2088 (arr!997 (Array (_ BitVec 32) ValueCell!524)) (size!1098 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2087)

(declare-fun mapKey!1699 () (_ BitVec 32))

(declare-fun mapValue!1699 () ValueCell!524)

(declare-fun mapRest!1699 () (Array (_ BitVec 32) ValueCell!524))

(assert (=> mapNonEmpty!1699 (= (arr!997 _values!1501) (store mapRest!1699 mapKey!1699 mapValue!1699))))

(declare-fun b!31716 () Bool)

(declare-fun res!19238 () Bool)

(assert (=> b!31716 (=> (not res!19238) (not e!20218))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2085 (_ BitVec 32)) Bool)

(assert (=> b!31716 (= res!19238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31717 () Bool)

(declare-fun res!19240 () Bool)

(assert (=> b!31717 (=> (not res!19240) (not e!20218))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31717 (= res!19240 (and (= (size!1098 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1097 _keys!1833) (size!1098 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!19234 () Bool)

(assert (=> start!4178 (=> (not res!19234) (not e!20218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4178 (= res!19234 (validMask!0 mask!2294))))

(assert (=> start!4178 e!20218))

(assert (=> start!4178 true))

(assert (=> start!4178 tp!4698))

(declare-fun e!20221 () Bool)

(declare-fun array_inv!703 (array!2087) Bool)

(assert (=> start!4178 (and (array_inv!703 _values!1501) e!20221)))

(declare-fun array_inv!704 (array!2085) Bool)

(assert (=> start!4178 (array_inv!704 _keys!1833)))

(declare-fun tp_is_empty!1447 () Bool)

(assert (=> start!4178 tp_is_empty!1447))

(declare-fun b!31718 () Bool)

(assert (=> b!31718 (= e!20217 tp_is_empty!1447)))

(declare-fun b!31719 () Bool)

(declare-fun res!19235 () Bool)

(assert (=> b!31719 (=> (not res!19235) (not e!20218))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1755)

(declare-fun minValue!1443 () V!1755)

(declare-datatypes ((tuple2!1226 0))(
  ( (tuple2!1227 (_1!624 (_ BitVec 64)) (_2!624 V!1755)) )
))
(declare-datatypes ((List!810 0))(
  ( (Nil!807) (Cons!806 (h!1373 tuple2!1226) (t!3496 List!810)) )
))
(declare-datatypes ((ListLongMap!791 0))(
  ( (ListLongMap!792 (toList!411 List!810)) )
))
(declare-fun contains!352 (ListLongMap!791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!234 (array!2085 array!2087 (_ BitVec 32) (_ BitVec 32) V!1755 V!1755 (_ BitVec 32) Int) ListLongMap!791)

(assert (=> b!31719 (= res!19235 (not (contains!352 (getCurrentListMap!234 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31720 () Bool)

(declare-fun res!19239 () Bool)

(assert (=> b!31720 (=> (not res!19239) (not e!20218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31720 (= res!19239 (validKeyInArray!0 k0!1304))))

(declare-fun b!31721 () Bool)

(declare-fun e!20219 () Bool)

(assert (=> b!31721 (= e!20219 tp_is_empty!1447)))

(declare-fun mapIsEmpty!1699 () Bool)

(assert (=> mapIsEmpty!1699 mapRes!1699))

(declare-fun b!31722 () Bool)

(assert (=> b!31722 (= e!20221 (and e!20219 mapRes!1699))))

(declare-fun condMapEmpty!1699 () Bool)

(declare-fun mapDefault!1699 () ValueCell!524)

(assert (=> b!31722 (= condMapEmpty!1699 (= (arr!997 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!524)) mapDefault!1699)))))

(assert (= (and start!4178 res!19234) b!31717))

(assert (= (and b!31717 res!19240) b!31716))

(assert (= (and b!31716 res!19238) b!31713))

(assert (= (and b!31713 res!19237) b!31720))

(assert (= (and b!31720 res!19239) b!31719))

(assert (= (and b!31719 res!19235) b!31715))

(assert (= (and b!31715 res!19236) b!31714))

(assert (= (and b!31722 condMapEmpty!1699) mapIsEmpty!1699))

(assert (= (and b!31722 (not condMapEmpty!1699)) mapNonEmpty!1699))

(get-info :version)

(assert (= (and mapNonEmpty!1699 ((_ is ValueCellFull!524) mapValue!1699)) b!31718))

(assert (= (and b!31722 ((_ is ValueCellFull!524) mapDefault!1699)) b!31721))

(assert (= start!4178 b!31722))

(declare-fun m!25389 () Bool)

(assert (=> b!31713 m!25389))

(declare-fun m!25391 () Bool)

(assert (=> b!31716 m!25391))

(declare-fun m!25393 () Bool)

(assert (=> mapNonEmpty!1699 m!25393))

(declare-fun m!25395 () Bool)

(assert (=> start!4178 m!25395))

(declare-fun m!25397 () Bool)

(assert (=> start!4178 m!25397))

(declare-fun m!25399 () Bool)

(assert (=> start!4178 m!25399))

(declare-fun m!25401 () Bool)

(assert (=> b!31714 m!25401))

(declare-fun m!25403 () Bool)

(assert (=> b!31720 m!25403))

(declare-fun m!25405 () Bool)

(assert (=> b!31719 m!25405))

(assert (=> b!31719 m!25405))

(declare-fun m!25407 () Bool)

(assert (=> b!31719 m!25407))

(declare-fun m!25409 () Bool)

(assert (=> b!31715 m!25409))

(check-sat (not start!4178) (not b!31714) (not b!31715) b_and!1897 tp_is_empty!1447 (not b_next!1093) (not b!31720) (not b!31716) (not b!31713) (not b!31719) (not mapNonEmpty!1699))
(check-sat b_and!1897 (not b_next!1093))
