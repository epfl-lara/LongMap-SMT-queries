; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!848 () Bool)

(assert start!848)

(declare-fun b_free!241 () Bool)

(declare-fun b_next!241 () Bool)

(assert (=> start!848 (= b_free!241 (not b_next!241))))

(declare-fun tp!953 () Bool)

(declare-fun b_and!387 () Bool)

(assert (=> start!848 (= tp!953 b_and!387)))

(declare-fun b!6871 () Bool)

(declare-fun res!7090 () Bool)

(declare-fun e!3796 () Bool)

(assert (=> b!6871 (=> (not res!7090) (not e!3796))))

(declare-datatypes ((array!561 0))(
  ( (array!562 (arr!269 (Array (_ BitVec 32) (_ BitVec 64))) (size!331 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!561)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!561 (_ BitVec 32)) Bool)

(assert (=> b!6871 (= res!7090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6872 () Bool)

(declare-fun e!3799 () Bool)

(assert (=> b!6872 (= e!3799 true)))

(declare-datatypes ((SeekEntryResult!26 0))(
  ( (MissingZero!26 (index!2223 (_ BitVec 32))) (Found!26 (index!2224 (_ BitVec 32))) (Intermediate!26 (undefined!838 Bool) (index!2225 (_ BitVec 32)) (x!2564 (_ BitVec 32))) (Undefined!26) (MissingVacant!26 (index!2226 (_ BitVec 32))) )
))
(declare-fun lt!1349 () SeekEntryResult!26)

(declare-fun lt!1348 () (_ BitVec 32))

(get-info :version)

(assert (=> b!6872 (and ((_ is Found!26) lt!1349) (= (index!2224 lt!1349) lt!1348))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!561 (_ BitVec 32)) SeekEntryResult!26)

(assert (=> b!6872 (= lt!1349 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-datatypes ((Unit!123 0))(
  ( (Unit!124) )
))
(declare-fun lt!1347 () Unit!123)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!561 (_ BitVec 32)) Unit!123)

(assert (=> b!6872 (= lt!1347 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!1348 _keys!1806 mask!2250))))

(declare-fun b!6873 () Bool)

(declare-fun res!7088 () Bool)

(assert (=> b!6873 (=> (not res!7088) (not e!3796))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((V!603 0))(
  ( (V!604 (val!165 Int)) )
))
(declare-datatypes ((ValueCell!143 0))(
  ( (ValueCellFull!143 (v!1256 V!603)) (EmptyCell!143) )
))
(declare-datatypes ((array!563 0))(
  ( (array!564 (arr!270 (Array (_ BitVec 32) ValueCell!143)) (size!332 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!563)

(declare-fun minValue!1434 () V!603)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!603)

(declare-datatypes ((tuple2!170 0))(
  ( (tuple2!171 (_1!85 (_ BitVec 64)) (_2!85 V!603)) )
))
(declare-datatypes ((List!180 0))(
  ( (Nil!177) (Cons!176 (h!742 tuple2!170) (t!2315 List!180)) )
))
(declare-datatypes ((ListLongMap!175 0))(
  ( (ListLongMap!176 (toList!103 List!180)) )
))
(declare-fun contains!77 (ListLongMap!175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!62 (array!561 array!563 (_ BitVec 32) (_ BitVec 32) V!603 V!603 (_ BitVec 32) Int) ListLongMap!175)

(assert (=> b!6873 (= res!7088 (contains!77 (getCurrentListMap!62 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun res!7089 () Bool)

(assert (=> start!848 (=> (not res!7089) (not e!3796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!848 (= res!7089 (validMask!0 mask!2250))))

(assert (=> start!848 e!3796))

(assert (=> start!848 tp!953))

(assert (=> start!848 true))

(declare-fun e!3800 () Bool)

(declare-fun array_inv!191 (array!563) Bool)

(assert (=> start!848 (and (array_inv!191 _values!1492) e!3800)))

(declare-fun tp_is_empty!319 () Bool)

(assert (=> start!848 tp_is_empty!319))

(declare-fun array_inv!192 (array!561) Bool)

(assert (=> start!848 (array_inv!192 _keys!1806)))

(declare-fun b!6874 () Bool)

(declare-fun e!3797 () Bool)

(assert (=> b!6874 (= e!3796 (not e!3797))))

(declare-fun res!7093 () Bool)

(assert (=> b!6874 (=> res!7093 e!3797)))

(declare-fun arrayContainsKey!0 (array!561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6874 (= res!7093 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!3801 () Bool)

(assert (=> b!6874 e!3801))

(declare-fun c!494 () Bool)

(assert (=> b!6874 (= c!494 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1346 () Unit!123)

(declare-fun lemmaKeyInListMapIsInArray!45 (array!561 array!563 (_ BitVec 32) (_ BitVec 32) V!603 V!603 (_ BitVec 64) Int) Unit!123)

(assert (=> b!6874 (= lt!1346 (lemmaKeyInListMapIsInArray!45 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6875 () Bool)

(declare-fun res!7091 () Bool)

(assert (=> b!6875 (=> (not res!7091) (not e!3796))))

(declare-datatypes ((List!181 0))(
  ( (Nil!178) (Cons!177 (h!743 (_ BitVec 64)) (t!2316 List!181)) )
))
(declare-fun arrayNoDuplicates!0 (array!561 (_ BitVec 32) List!181) Bool)

(assert (=> b!6875 (= res!7091 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!178))))

(declare-fun b!6876 () Bool)

(declare-fun res!7094 () Bool)

(assert (=> b!6876 (=> (not res!7094) (not e!3796))))

(assert (=> b!6876 (= res!7094 (and (= (size!332 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!331 _keys!1806) (size!332 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6877 () Bool)

(assert (=> b!6877 (= e!3801 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6878 () Bool)

(declare-fun e!3803 () Bool)

(assert (=> b!6878 (= e!3803 tp_is_empty!319)))

(declare-fun mapNonEmpty!449 () Bool)

(declare-fun mapRes!449 () Bool)

(declare-fun tp!952 () Bool)

(declare-fun e!3802 () Bool)

(assert (=> mapNonEmpty!449 (= mapRes!449 (and tp!952 e!3802))))

(declare-fun mapKey!449 () (_ BitVec 32))

(declare-fun mapValue!449 () ValueCell!143)

(declare-fun mapRest!449 () (Array (_ BitVec 32) ValueCell!143))

(assert (=> mapNonEmpty!449 (= (arr!270 _values!1492) (store mapRest!449 mapKey!449 mapValue!449))))

(declare-fun b!6879 () Bool)

(declare-fun res!7096 () Bool)

(assert (=> b!6879 (=> (not res!7096) (not e!3796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6879 (= res!7096 (validKeyInArray!0 k0!1278))))

(declare-fun b!6880 () Bool)

(assert (=> b!6880 (= e!3797 e!3799)))

(declare-fun res!7095 () Bool)

(assert (=> b!6880 (=> res!7095 e!3799)))

(assert (=> b!6880 (= res!7095 (not (= (size!331 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(assert (=> b!6880 (arrayForallSeekEntryOrOpenFound!0 lt!1348 _keys!1806 mask!2250)))

(declare-fun lt!1350 () Unit!123)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!123)

(assert (=> b!6880 (= lt!1350 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1348))))

(declare-fun arrayScanForKey!0 (array!561 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6880 (= lt!1348 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6881 () Bool)

(assert (=> b!6881 (= e!3800 (and e!3803 mapRes!449))))

(declare-fun condMapEmpty!449 () Bool)

(declare-fun mapDefault!449 () ValueCell!143)

(assert (=> b!6881 (= condMapEmpty!449 (= (arr!270 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!143)) mapDefault!449)))))

(declare-fun b!6882 () Bool)

(declare-fun res!7092 () Bool)

(assert (=> b!6882 (=> res!7092 e!3799)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!561 (_ BitVec 32)) SeekEntryResult!26)

(assert (=> b!6882 (= res!7092 (not (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!26 lt!1348))))))

(declare-fun b!6883 () Bool)

(assert (=> b!6883 (= e!3802 tp_is_empty!319)))

(declare-fun mapIsEmpty!449 () Bool)

(assert (=> mapIsEmpty!449 mapRes!449))

(declare-fun b!6884 () Bool)

(assert (=> b!6884 (= e!3801 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!848 res!7089) b!6876))

(assert (= (and b!6876 res!7094) b!6871))

(assert (= (and b!6871 res!7090) b!6875))

(assert (= (and b!6875 res!7091) b!6873))

(assert (= (and b!6873 res!7088) b!6879))

(assert (= (and b!6879 res!7096) b!6874))

(assert (= (and b!6874 c!494) b!6877))

(assert (= (and b!6874 (not c!494)) b!6884))

(assert (= (and b!6874 (not res!7093)) b!6880))

(assert (= (and b!6880 (not res!7095)) b!6882))

(assert (= (and b!6882 (not res!7092)) b!6872))

(assert (= (and b!6881 condMapEmpty!449) mapIsEmpty!449))

(assert (= (and b!6881 (not condMapEmpty!449)) mapNonEmpty!449))

(assert (= (and mapNonEmpty!449 ((_ is ValueCellFull!143) mapValue!449)) b!6883))

(assert (= (and b!6881 ((_ is ValueCellFull!143) mapDefault!449)) b!6878))

(assert (= start!848 b!6881))

(declare-fun m!4049 () Bool)

(assert (=> b!6872 m!4049))

(declare-fun m!4051 () Bool)

(assert (=> b!6872 m!4051))

(declare-fun m!4053 () Bool)

(assert (=> mapNonEmpty!449 m!4053))

(declare-fun m!4055 () Bool)

(assert (=> b!6879 m!4055))

(declare-fun m!4057 () Bool)

(assert (=> b!6874 m!4057))

(declare-fun m!4059 () Bool)

(assert (=> b!6874 m!4059))

(declare-fun m!4061 () Bool)

(assert (=> b!6873 m!4061))

(assert (=> b!6873 m!4061))

(declare-fun m!4063 () Bool)

(assert (=> b!6873 m!4063))

(declare-fun m!4065 () Bool)

(assert (=> start!848 m!4065))

(declare-fun m!4067 () Bool)

(assert (=> start!848 m!4067))

(declare-fun m!4069 () Bool)

(assert (=> start!848 m!4069))

(declare-fun m!4071 () Bool)

(assert (=> b!6880 m!4071))

(declare-fun m!4073 () Bool)

(assert (=> b!6880 m!4073))

(declare-fun m!4075 () Bool)

(assert (=> b!6880 m!4075))

(declare-fun m!4077 () Bool)

(assert (=> b!6875 m!4077))

(assert (=> b!6877 m!4057))

(declare-fun m!4079 () Bool)

(assert (=> b!6871 m!4079))

(declare-fun m!4081 () Bool)

(assert (=> b!6882 m!4081))

(check-sat b_and!387 (not b!6879) (not b!6874) (not b!6871) (not b_next!241) (not b!6872) (not b!6880) (not b!6882) (not mapNonEmpty!449) (not b!6877) (not b!6873) tp_is_empty!319 (not start!848) (not b!6875))
(check-sat b_and!387 (not b_next!241))
