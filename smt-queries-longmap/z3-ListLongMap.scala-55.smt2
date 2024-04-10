; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!844 () Bool)

(assert start!844)

(declare-fun b_free!237 () Bool)

(declare-fun b_next!237 () Bool)

(assert (=> start!844 (= b_free!237 (not b_next!237))))

(declare-fun tp!941 () Bool)

(declare-fun b_and!383 () Bool)

(assert (=> start!844 (= tp!941 b_and!383)))

(declare-fun b!6787 () Bool)

(declare-fun res!7035 () Bool)

(declare-fun e!3754 () Bool)

(assert (=> b!6787 (=> (not res!7035) (not e!3754))))

(declare-datatypes ((array!561 0))(
  ( (array!562 (arr!269 (Array (_ BitVec 32) (_ BitVec 64))) (size!331 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!561)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!561 (_ BitVec 32)) Bool)

(assert (=> b!6787 (= res!7035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6788 () Bool)

(declare-fun res!7039 () Bool)

(declare-fun e!3749 () Bool)

(assert (=> b!6788 (=> res!7039 e!3749)))

(declare-fun lt!1317 () (_ BitVec 32))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!24 0))(
  ( (MissingZero!24 (index!2215 (_ BitVec 32))) (Found!24 (index!2216 (_ BitVec 32))) (Intermediate!24 (undefined!836 Bool) (index!2217 (_ BitVec 32)) (x!2554 (_ BitVec 32))) (Undefined!24) (MissingVacant!24 (index!2218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!561 (_ BitVec 32)) SeekEntryResult!24)

(assert (=> b!6788 (= res!7039 (not (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!24 lt!1317))))))

(declare-fun b!6789 () Bool)

(declare-fun e!3753 () Bool)

(assert (=> b!6789 (= e!3753 e!3749)))

(declare-fun res!7034 () Bool)

(assert (=> b!6789 (=> res!7034 e!3749)))

(assert (=> b!6789 (= res!7034 (not (= (size!331 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(assert (=> b!6789 (arrayForallSeekEntryOrOpenFound!0 lt!1317 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!121 0))(
  ( (Unit!122) )
))
(declare-fun lt!1320 () Unit!121)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!121)

(assert (=> b!6789 (= lt!1320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1317))))

(declare-fun arrayScanForKey!0 (array!561 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6789 (= lt!1317 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6790 () Bool)

(declare-fun e!3755 () Bool)

(declare-fun arrayContainsKey!0 (array!561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6790 (= e!3755 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6791 () Bool)

(declare-fun res!7036 () Bool)

(assert (=> b!6791 (=> (not res!7036) (not e!3754))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((V!597 0))(
  ( (V!598 (val!163 Int)) )
))
(declare-datatypes ((ValueCell!141 0))(
  ( (ValueCellFull!141 (v!1254 V!597)) (EmptyCell!141) )
))
(declare-datatypes ((array!563 0))(
  ( (array!564 (arr!270 (Array (_ BitVec 32) ValueCell!141)) (size!332 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!563)

(declare-fun minValue!1434 () V!597)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!597)

(declare-datatypes ((tuple2!170 0))(
  ( (tuple2!171 (_1!85 (_ BitVec 64)) (_2!85 V!597)) )
))
(declare-datatypes ((List!179 0))(
  ( (Nil!176) (Cons!175 (h!741 tuple2!170) (t!2314 List!179)) )
))
(declare-datatypes ((ListLongMap!175 0))(
  ( (ListLongMap!176 (toList!103 List!179)) )
))
(declare-fun contains!77 (ListLongMap!175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!62 (array!561 array!563 (_ BitVec 32) (_ BitVec 32) V!597 V!597 (_ BitVec 32) Int) ListLongMap!175)

(assert (=> b!6791 (= res!7036 (contains!77 (getCurrentListMap!62 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!6792 () Bool)

(declare-fun res!7042 () Bool)

(assert (=> b!6792 (=> (not res!7042) (not e!3754))))

(declare-datatypes ((List!180 0))(
  ( (Nil!177) (Cons!176 (h!742 (_ BitVec 64)) (t!2315 List!180)) )
))
(declare-fun arrayNoDuplicates!0 (array!561 (_ BitVec 32) List!180) Bool)

(assert (=> b!6792 (= res!7042 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!177))))

(declare-fun res!7038 () Bool)

(assert (=> start!844 (=> (not res!7038) (not e!3754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!844 (= res!7038 (validMask!0 mask!2250))))

(assert (=> start!844 e!3754))

(assert (=> start!844 tp!941))

(assert (=> start!844 true))

(declare-fun e!3752 () Bool)

(declare-fun array_inv!195 (array!563) Bool)

(assert (=> start!844 (and (array_inv!195 _values!1492) e!3752)))

(declare-fun tp_is_empty!315 () Bool)

(assert (=> start!844 tp_is_empty!315))

(declare-fun array_inv!196 (array!561) Bool)

(assert (=> start!844 (array_inv!196 _keys!1806)))

(declare-fun b!6793 () Bool)

(assert (=> b!6793 (= e!3754 (not e!3753))))

(declare-fun res!7037 () Bool)

(assert (=> b!6793 (=> res!7037 e!3753)))

(assert (=> b!6793 (= res!7037 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6793 e!3755))

(declare-fun c!488 () Bool)

(assert (=> b!6793 (= c!488 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1319 () Unit!121)

(declare-fun lemmaKeyInListMapIsInArray!42 (array!561 array!563 (_ BitVec 32) (_ BitVec 32) V!597 V!597 (_ BitVec 64) Int) Unit!121)

(assert (=> b!6793 (= lt!1319 (lemmaKeyInListMapIsInArray!42 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6794 () Bool)

(assert (=> b!6794 (= e!3749 true)))

(declare-fun lt!1318 () SeekEntryResult!24)

(get-info :version)

(assert (=> b!6794 (and ((_ is Found!24) lt!1318) (= (index!2216 lt!1318) lt!1317))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!561 (_ BitVec 32)) SeekEntryResult!24)

(assert (=> b!6794 (= lt!1318 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun lt!1316 () Unit!121)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!561 (_ BitVec 32)) Unit!121)

(assert (=> b!6794 (= lt!1316 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!1317 _keys!1806 mask!2250))))

(declare-fun b!6795 () Bool)

(assert (=> b!6795 (= e!3755 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!443 () Bool)

(declare-fun mapRes!443 () Bool)

(declare-fun tp!940 () Bool)

(declare-fun e!3750 () Bool)

(assert (=> mapNonEmpty!443 (= mapRes!443 (and tp!940 e!3750))))

(declare-fun mapKey!443 () (_ BitVec 32))

(declare-fun mapRest!443 () (Array (_ BitVec 32) ValueCell!141))

(declare-fun mapValue!443 () ValueCell!141)

(assert (=> mapNonEmpty!443 (= (arr!270 _values!1492) (store mapRest!443 mapKey!443 mapValue!443))))

(declare-fun b!6796 () Bool)

(assert (=> b!6796 (= e!3750 tp_is_empty!315)))

(declare-fun b!6797 () Bool)

(declare-fun res!7041 () Bool)

(assert (=> b!6797 (=> (not res!7041) (not e!3754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6797 (= res!7041 (validKeyInArray!0 k0!1278))))

(declare-fun b!6798 () Bool)

(declare-fun e!3751 () Bool)

(assert (=> b!6798 (= e!3752 (and e!3751 mapRes!443))))

(declare-fun condMapEmpty!443 () Bool)

(declare-fun mapDefault!443 () ValueCell!141)

(assert (=> b!6798 (= condMapEmpty!443 (= (arr!270 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!141)) mapDefault!443)))))

(declare-fun b!6799 () Bool)

(declare-fun res!7040 () Bool)

(assert (=> b!6799 (=> (not res!7040) (not e!3754))))

(assert (=> b!6799 (= res!7040 (and (= (size!332 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!331 _keys!1806) (size!332 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!443 () Bool)

(assert (=> mapIsEmpty!443 mapRes!443))

(declare-fun b!6800 () Bool)

(assert (=> b!6800 (= e!3751 tp_is_empty!315)))

(assert (= (and start!844 res!7038) b!6799))

(assert (= (and b!6799 res!7040) b!6787))

(assert (= (and b!6787 res!7035) b!6792))

(assert (= (and b!6792 res!7042) b!6791))

(assert (= (and b!6791 res!7036) b!6797))

(assert (= (and b!6797 res!7041) b!6793))

(assert (= (and b!6793 c!488) b!6790))

(assert (= (and b!6793 (not c!488)) b!6795))

(assert (= (and b!6793 (not res!7037)) b!6789))

(assert (= (and b!6789 (not res!7034)) b!6788))

(assert (= (and b!6788 (not res!7039)) b!6794))

(assert (= (and b!6798 condMapEmpty!443) mapIsEmpty!443))

(assert (= (and b!6798 (not condMapEmpty!443)) mapNonEmpty!443))

(assert (= (and mapNonEmpty!443 ((_ is ValueCellFull!141) mapValue!443)) b!6796))

(assert (= (and b!6798 ((_ is ValueCellFull!141) mapDefault!443)) b!6800))

(assert (= start!844 b!6798))

(declare-fun m!3981 () Bool)

(assert (=> b!6787 m!3981))

(declare-fun m!3983 () Bool)

(assert (=> b!6793 m!3983))

(declare-fun m!3985 () Bool)

(assert (=> b!6793 m!3985))

(declare-fun m!3987 () Bool)

(assert (=> b!6797 m!3987))

(declare-fun m!3989 () Bool)

(assert (=> b!6794 m!3989))

(declare-fun m!3991 () Bool)

(assert (=> b!6794 m!3991))

(declare-fun m!3993 () Bool)

(assert (=> mapNonEmpty!443 m!3993))

(declare-fun m!3995 () Bool)

(assert (=> start!844 m!3995))

(declare-fun m!3997 () Bool)

(assert (=> start!844 m!3997))

(declare-fun m!3999 () Bool)

(assert (=> start!844 m!3999))

(declare-fun m!4001 () Bool)

(assert (=> b!6792 m!4001))

(declare-fun m!4003 () Bool)

(assert (=> b!6788 m!4003))

(assert (=> b!6790 m!3983))

(declare-fun m!4005 () Bool)

(assert (=> b!6789 m!4005))

(declare-fun m!4007 () Bool)

(assert (=> b!6789 m!4007))

(declare-fun m!4009 () Bool)

(assert (=> b!6789 m!4009))

(declare-fun m!4011 () Bool)

(assert (=> b!6791 m!4011))

(assert (=> b!6791 m!4011))

(declare-fun m!4013 () Bool)

(assert (=> b!6791 m!4013))

(check-sat (not b!6793) (not b_next!237) (not b!6791) (not b!6797) tp_is_empty!315 (not b!6792) (not mapNonEmpty!443) (not b!6790) (not b!6788) (not b!6789) (not b!6787) b_and!383 (not b!6794) (not start!844))
(check-sat b_and!383 (not b_next!237))
