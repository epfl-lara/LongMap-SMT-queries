; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3938 () Bool)

(assert start!3938)

(declare-fun b_free!853 () Bool)

(declare-fun b_next!853 () Bool)

(assert (=> start!3938 (= b_free!853 (not b_next!853))))

(declare-fun tp!3978 () Bool)

(declare-fun b_and!1657 () Bool)

(assert (=> start!3938 (= tp!3978 b_and!1657)))

(declare-fun b!28122 () Bool)

(declare-fun e!18203 () Bool)

(declare-fun e!18205 () Bool)

(declare-fun mapRes!1339 () Bool)

(assert (=> b!28122 (= e!18203 (and e!18205 mapRes!1339))))

(declare-fun condMapEmpty!1339 () Bool)

(declare-datatypes ((V!1435 0))(
  ( (V!1436 (val!630 Int)) )
))
(declare-datatypes ((ValueCell!404 0))(
  ( (ValueCellFull!404 (v!1718 V!1435)) (EmptyCell!404) )
))
(declare-datatypes ((array!1627 0))(
  ( (array!1628 (arr!767 (Array (_ BitVec 32) ValueCell!404)) (size!868 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1627)

(declare-fun mapDefault!1339 () ValueCell!404)

(assert (=> b!28122 (= condMapEmpty!1339 (= (arr!767 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!404)) mapDefault!1339)))))

(declare-fun b!28123 () Bool)

(declare-fun tp_is_empty!1207 () Bool)

(assert (=> b!28123 (= e!18205 tp_is_empty!1207)))

(declare-fun b!28124 () Bool)

(declare-fun e!18201 () Bool)

(assert (=> b!28124 (= e!18201 false)))

(declare-fun lt!10750 () (_ BitVec 32))

(declare-datatypes ((array!1629 0))(
  ( (array!1630 (arr!768 (Array (_ BitVec 32) (_ BitVec 64))) (size!869 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1629)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1629 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28124 (= lt!10750 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28125 () Bool)

(declare-fun res!16724 () Bool)

(assert (=> b!28125 (=> (not res!16724) (not e!18201))))

(declare-fun arrayContainsKey!0 (array!1629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28125 (= res!16724 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28126 () Bool)

(declare-fun res!16723 () Bool)

(assert (=> b!28126 (=> (not res!16723) (not e!18201))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1435)

(declare-fun minValue!1443 () V!1435)

(declare-datatypes ((tuple2!1060 0))(
  ( (tuple2!1061 (_1!541 (_ BitVec 64)) (_2!541 V!1435)) )
))
(declare-datatypes ((List!649 0))(
  ( (Nil!646) (Cons!645 (h!1212 tuple2!1060) (t!3335 List!649)) )
))
(declare-datatypes ((ListLongMap!625 0))(
  ( (ListLongMap!626 (toList!328 List!649)) )
))
(declare-fun contains!269 (ListLongMap!625 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!158 (array!1629 array!1627 (_ BitVec 32) (_ BitVec 32) V!1435 V!1435 (_ BitVec 32) Int) ListLongMap!625)

(assert (=> b!28126 (= res!16723 (not (contains!269 (getCurrentListMap!158 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapIsEmpty!1339 () Bool)

(assert (=> mapIsEmpty!1339 mapRes!1339))

(declare-fun b!28127 () Bool)

(declare-fun res!16725 () Bool)

(assert (=> b!28127 (=> (not res!16725) (not e!18201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1629 (_ BitVec 32)) Bool)

(assert (=> b!28127 (= res!16725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1339 () Bool)

(declare-fun tp!3979 () Bool)

(declare-fun e!18204 () Bool)

(assert (=> mapNonEmpty!1339 (= mapRes!1339 (and tp!3979 e!18204))))

(declare-fun mapKey!1339 () (_ BitVec 32))

(declare-fun mapValue!1339 () ValueCell!404)

(declare-fun mapRest!1339 () (Array (_ BitVec 32) ValueCell!404))

(assert (=> mapNonEmpty!1339 (= (arr!767 _values!1501) (store mapRest!1339 mapKey!1339 mapValue!1339))))

(declare-fun res!16728 () Bool)

(assert (=> start!3938 (=> (not res!16728) (not e!18201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3938 (= res!16728 (validMask!0 mask!2294))))

(assert (=> start!3938 e!18201))

(assert (=> start!3938 true))

(assert (=> start!3938 tp!3978))

(declare-fun array_inv!539 (array!1627) Bool)

(assert (=> start!3938 (and (array_inv!539 _values!1501) e!18203)))

(declare-fun array_inv!540 (array!1629) Bool)

(assert (=> start!3938 (array_inv!540 _keys!1833)))

(assert (=> start!3938 tp_is_empty!1207))

(declare-fun b!28128 () Bool)

(declare-fun res!16727 () Bool)

(assert (=> b!28128 (=> (not res!16727) (not e!18201))))

(assert (=> b!28128 (= res!16727 (and (= (size!868 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!869 _keys!1833) (size!868 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28129 () Bool)

(declare-fun res!16726 () Bool)

(assert (=> b!28129 (=> (not res!16726) (not e!18201))))

(declare-datatypes ((List!650 0))(
  ( (Nil!647) (Cons!646 (h!1213 (_ BitVec 64)) (t!3336 List!650)) )
))
(declare-fun arrayNoDuplicates!0 (array!1629 (_ BitVec 32) List!650) Bool)

(assert (=> b!28129 (= res!16726 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!647))))

(declare-fun b!28130 () Bool)

(assert (=> b!28130 (= e!18204 tp_is_empty!1207)))

(declare-fun b!28131 () Bool)

(declare-fun res!16729 () Bool)

(assert (=> b!28131 (=> (not res!16729) (not e!18201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28131 (= res!16729 (validKeyInArray!0 k0!1304))))

(assert (= (and start!3938 res!16728) b!28128))

(assert (= (and b!28128 res!16727) b!28127))

(assert (= (and b!28127 res!16725) b!28129))

(assert (= (and b!28129 res!16726) b!28131))

(assert (= (and b!28131 res!16729) b!28126))

(assert (= (and b!28126 res!16723) b!28125))

(assert (= (and b!28125 res!16724) b!28124))

(assert (= (and b!28122 condMapEmpty!1339) mapIsEmpty!1339))

(assert (= (and b!28122 (not condMapEmpty!1339)) mapNonEmpty!1339))

(get-info :version)

(assert (= (and mapNonEmpty!1339 ((_ is ValueCellFull!404) mapValue!1339)) b!28130))

(assert (= (and b!28122 ((_ is ValueCellFull!404) mapDefault!1339)) b!28123))

(assert (= start!3938 b!28122))

(declare-fun m!22365 () Bool)

(assert (=> start!3938 m!22365))

(declare-fun m!22367 () Bool)

(assert (=> start!3938 m!22367))

(declare-fun m!22369 () Bool)

(assert (=> start!3938 m!22369))

(declare-fun m!22371 () Bool)

(assert (=> b!28131 m!22371))

(declare-fun m!22373 () Bool)

(assert (=> b!28124 m!22373))

(declare-fun m!22375 () Bool)

(assert (=> mapNonEmpty!1339 m!22375))

(declare-fun m!22377 () Bool)

(assert (=> b!28126 m!22377))

(assert (=> b!28126 m!22377))

(declare-fun m!22379 () Bool)

(assert (=> b!28126 m!22379))

(declare-fun m!22381 () Bool)

(assert (=> b!28125 m!22381))

(declare-fun m!22383 () Bool)

(assert (=> b!28129 m!22383))

(declare-fun m!22385 () Bool)

(assert (=> b!28127 m!22385))

(check-sat (not b!28127) (not b!28129) (not start!3938) (not b!28131) (not b!28126) (not mapNonEmpty!1339) (not b!28124) tp_is_empty!1207 (not b_next!853) (not b!28125) b_and!1657)
(check-sat b_and!1657 (not b_next!853))
