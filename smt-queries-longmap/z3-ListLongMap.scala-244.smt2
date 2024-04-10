; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4148 () Bool)

(assert start!4148)

(declare-fun b_free!1053 () Bool)

(declare-fun b_next!1053 () Bool)

(assert (=> start!4148 (= b_free!1053 (not b_next!1053))))

(declare-fun tp!4579 () Bool)

(declare-fun b_and!1863 () Bool)

(assert (=> start!4148 (= tp!4579 b_and!1863)))

(declare-fun b!31221 () Bool)

(declare-fun res!18901 () Bool)

(declare-fun e!19964 () Bool)

(assert (=> b!31221 (=> (not res!18901) (not e!19964))))

(declare-datatypes ((array!2037 0))(
  ( (array!2038 (arr!972 (Array (_ BitVec 32) (_ BitVec 64))) (size!1073 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2037)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2037 (_ BitVec 32)) Bool)

(assert (=> b!31221 (= res!18901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31222 () Bool)

(declare-fun res!18905 () Bool)

(assert (=> b!31222 (=> (not res!18905) (not e!19964))))

(declare-datatypes ((List!789 0))(
  ( (Nil!786) (Cons!785 (h!1352 (_ BitVec 64)) (t!3482 List!789)) )
))
(declare-fun arrayNoDuplicates!0 (array!2037 (_ BitVec 32) List!789) Bool)

(assert (=> b!31222 (= res!18905 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!786))))

(declare-fun mapNonEmpty!1639 () Bool)

(declare-fun mapRes!1639 () Bool)

(declare-fun tp!4578 () Bool)

(declare-fun e!19962 () Bool)

(assert (=> mapNonEmpty!1639 (= mapRes!1639 (and tp!4578 e!19962))))

(declare-datatypes ((V!1701 0))(
  ( (V!1702 (val!730 Int)) )
))
(declare-datatypes ((ValueCell!504 0))(
  ( (ValueCellFull!504 (v!1819 V!1701)) (EmptyCell!504) )
))
(declare-datatypes ((array!2039 0))(
  ( (array!2040 (arr!973 (Array (_ BitVec 32) ValueCell!504)) (size!1074 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2039)

(declare-fun mapRest!1639 () (Array (_ BitVec 32) ValueCell!504))

(declare-fun mapValue!1639 () ValueCell!504)

(declare-fun mapKey!1639 () (_ BitVec 32))

(assert (=> mapNonEmpty!1639 (= (arr!973 _values!1501) (store mapRest!1639 mapKey!1639 mapValue!1639))))

(declare-fun b!31223 () Bool)

(declare-fun e!19961 () Bool)

(declare-fun tp_is_empty!1407 () Bool)

(assert (=> b!31223 (= e!19961 tp_is_empty!1407)))

(declare-fun b!31224 () Bool)

(declare-fun res!18904 () Bool)

(assert (=> b!31224 (=> (not res!18904) (not e!19964))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1701)

(declare-fun minValue!1443 () V!1701)

(declare-datatypes ((tuple2!1196 0))(
  ( (tuple2!1197 (_1!609 (_ BitVec 64)) (_2!609 V!1701)) )
))
(declare-datatypes ((List!790 0))(
  ( (Nil!787) (Cons!786 (h!1353 tuple2!1196) (t!3483 List!790)) )
))
(declare-datatypes ((ListLongMap!773 0))(
  ( (ListLongMap!774 (toList!402 List!790)) )
))
(declare-fun contains!342 (ListLongMap!773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!230 (array!2037 array!2039 (_ BitVec 32) (_ BitVec 32) V!1701 V!1701 (_ BitVec 32) Int) ListLongMap!773)

(assert (=> b!31224 (= res!18904 (not (contains!342 (getCurrentListMap!230 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31225 () Bool)

(declare-fun res!18900 () Bool)

(assert (=> b!31225 (=> (not res!18900) (not e!19964))))

(assert (=> b!31225 (= res!18900 (and (= (size!1074 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1073 _keys!1833) (size!1074 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!18902 () Bool)

(assert (=> start!4148 (=> (not res!18902) (not e!19964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4148 (= res!18902 (validMask!0 mask!2294))))

(assert (=> start!4148 e!19964))

(assert (=> start!4148 true))

(assert (=> start!4148 tp!4579))

(declare-fun e!19960 () Bool)

(declare-fun array_inv!679 (array!2039) Bool)

(assert (=> start!4148 (and (array_inv!679 _values!1501) e!19960)))

(declare-fun array_inv!680 (array!2037) Bool)

(assert (=> start!4148 (array_inv!680 _keys!1833)))

(assert (=> start!4148 tp_is_empty!1407))

(declare-fun mapIsEmpty!1639 () Bool)

(assert (=> mapIsEmpty!1639 mapRes!1639))

(declare-fun b!31226 () Bool)

(assert (=> b!31226 (= e!19962 tp_is_empty!1407)))

(declare-fun b!31227 () Bool)

(assert (=> b!31227 (= e!19960 (and e!19961 mapRes!1639))))

(declare-fun condMapEmpty!1639 () Bool)

(declare-fun mapDefault!1639 () ValueCell!504)

(assert (=> b!31227 (= condMapEmpty!1639 (= (arr!973 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!504)) mapDefault!1639)))))

(declare-fun b!31228 () Bool)

(declare-fun res!18903 () Bool)

(assert (=> b!31228 (=> (not res!18903) (not e!19964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31228 (= res!18903 (validKeyInArray!0 k0!1304))))

(declare-fun b!31229 () Bool)

(assert (=> b!31229 (= e!19964 false)))

(declare-datatypes ((SeekEntryResult!120 0))(
  ( (MissingZero!120 (index!2602 (_ BitVec 32))) (Found!120 (index!2603 (_ BitVec 32))) (Intermediate!120 (undefined!932 Bool) (index!2604 (_ BitVec 32)) (x!6614 (_ BitVec 32))) (Undefined!120) (MissingVacant!120 (index!2605 (_ BitVec 32))) )
))
(declare-fun lt!11540 () SeekEntryResult!120)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2037 (_ BitVec 32)) SeekEntryResult!120)

(assert (=> b!31229 (= lt!11540 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!31230 () Bool)

(declare-fun res!18906 () Bool)

(assert (=> b!31230 (=> (not res!18906) (not e!19964))))

(declare-fun arrayContainsKey!0 (array!2037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31230 (= res!18906 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(assert (= (and start!4148 res!18902) b!31225))

(assert (= (and b!31225 res!18900) b!31221))

(assert (= (and b!31221 res!18901) b!31222))

(assert (= (and b!31222 res!18905) b!31228))

(assert (= (and b!31228 res!18903) b!31224))

(assert (= (and b!31224 res!18904) b!31230))

(assert (= (and b!31230 res!18906) b!31229))

(assert (= (and b!31227 condMapEmpty!1639) mapIsEmpty!1639))

(assert (= (and b!31227 (not condMapEmpty!1639)) mapNonEmpty!1639))

(get-info :version)

(assert (= (and mapNonEmpty!1639 ((_ is ValueCellFull!504) mapValue!1639)) b!31226))

(assert (= (and b!31227 ((_ is ValueCellFull!504) mapDefault!1639)) b!31223))

(assert (= start!4148 b!31227))

(declare-fun m!25055 () Bool)

(assert (=> b!31221 m!25055))

(declare-fun m!25057 () Bool)

(assert (=> start!4148 m!25057))

(declare-fun m!25059 () Bool)

(assert (=> start!4148 m!25059))

(declare-fun m!25061 () Bool)

(assert (=> start!4148 m!25061))

(declare-fun m!25063 () Bool)

(assert (=> b!31222 m!25063))

(declare-fun m!25065 () Bool)

(assert (=> b!31230 m!25065))

(declare-fun m!25067 () Bool)

(assert (=> b!31229 m!25067))

(declare-fun m!25069 () Bool)

(assert (=> b!31228 m!25069))

(declare-fun m!25071 () Bool)

(assert (=> mapNonEmpty!1639 m!25071))

(declare-fun m!25073 () Bool)

(assert (=> b!31224 m!25073))

(assert (=> b!31224 m!25073))

(declare-fun m!25075 () Bool)

(assert (=> b!31224 m!25075))

(check-sat (not b!31229) (not b!31224) (not mapNonEmpty!1639) (not b!31221) (not b_next!1053) (not b!31230) tp_is_empty!1407 (not b!31228) (not b!31222) (not start!4148) b_and!1863)
(check-sat b_and!1863 (not b_next!1053))
