; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3998 () Bool)

(assert start!3998)

(declare-fun b_free!907 () Bool)

(declare-fun b_next!907 () Bool)

(assert (=> start!3998 (= b_free!907 (not b_next!907))))

(declare-fun tp!4141 () Bool)

(declare-fun b_and!1707 () Bool)

(assert (=> start!3998 (= tp!4141 b_and!1707)))

(declare-fun b!28959 () Bool)

(declare-fun res!17331 () Bool)

(declare-fun e!18710 () Bool)

(assert (=> b!28959 (=> (not res!17331) (not e!18710))))

(declare-datatypes ((array!1735 0))(
  ( (array!1736 (arr!821 (Array (_ BitVec 32) (_ BitVec 64))) (size!922 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1735)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28959 (= res!17331 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28960 () Bool)

(declare-fun e!18708 () Bool)

(declare-fun tp_is_empty!1261 () Bool)

(assert (=> b!28960 (= e!18708 tp_is_empty!1261)))

(declare-fun res!17328 () Bool)

(declare-fun e!18709 () Bool)

(assert (=> start!3998 (=> (not res!17328) (not e!18709))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3998 (= res!17328 (validMask!0 mask!2294))))

(assert (=> start!3998 e!18709))

(assert (=> start!3998 true))

(assert (=> start!3998 tp!4141))

(declare-datatypes ((V!1507 0))(
  ( (V!1508 (val!657 Int)) )
))
(declare-datatypes ((ValueCell!431 0))(
  ( (ValueCellFull!431 (v!1746 V!1507)) (EmptyCell!431) )
))
(declare-datatypes ((array!1737 0))(
  ( (array!1738 (arr!822 (Array (_ BitVec 32) ValueCell!431)) (size!923 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1737)

(declare-fun e!18712 () Bool)

(declare-fun array_inv!569 (array!1737) Bool)

(assert (=> start!3998 (and (array_inv!569 _values!1501) e!18712)))

(declare-fun array_inv!570 (array!1735) Bool)

(assert (=> start!3998 (array_inv!570 _keys!1833)))

(assert (=> start!3998 tp_is_empty!1261))

(declare-fun b!28961 () Bool)

(declare-fun res!17327 () Bool)

(assert (=> b!28961 (=> (not res!17327) (not e!18709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1735 (_ BitVec 32)) Bool)

(assert (=> b!28961 (= res!17327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28962 () Bool)

(declare-fun res!17333 () Bool)

(assert (=> b!28962 (=> (not res!17333) (not e!18709))))

(declare-datatypes ((List!678 0))(
  ( (Nil!675) (Cons!674 (h!1241 (_ BitVec 64)) (t!3365 List!678)) )
))
(declare-fun arrayNoDuplicates!0 (array!1735 (_ BitVec 32) List!678) Bool)

(assert (=> b!28962 (= res!17333 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!675))))

(declare-fun b!28963 () Bool)

(declare-fun res!17330 () Bool)

(assert (=> b!28963 (=> (not res!17330) (not e!18709))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28963 (= res!17330 (and (= (size!923 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!922 _keys!1833) (size!923 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28964 () Bool)

(assert (=> b!28964 (= e!18709 e!18710)))

(declare-fun res!17332 () Bool)

(assert (=> b!28964 (=> (not res!17332) (not e!18710))))

(declare-datatypes ((tuple2!1088 0))(
  ( (tuple2!1089 (_1!555 (_ BitVec 64)) (_2!555 V!1507)) )
))
(declare-datatypes ((List!679 0))(
  ( (Nil!676) (Cons!675 (h!1242 tuple2!1088) (t!3366 List!679)) )
))
(declare-datatypes ((ListLongMap!659 0))(
  ( (ListLongMap!660 (toList!345 List!679)) )
))
(declare-fun lt!11008 () ListLongMap!659)

(declare-fun contains!287 (ListLongMap!659 (_ BitVec 64)) Bool)

(assert (=> b!28964 (= res!17332 (not (contains!287 lt!11008 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1507)

(declare-fun minValue!1443 () V!1507)

(declare-fun getCurrentListMap!171 (array!1735 array!1737 (_ BitVec 32) (_ BitVec 32) V!1507 V!1507 (_ BitVec 32) Int) ListLongMap!659)

(assert (=> b!28964 (= lt!11008 (getCurrentListMap!171 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28965 () Bool)

(assert (=> b!28965 (= e!18710 (not true))))

(declare-datatypes ((SeekEntryResult!79 0))(
  ( (MissingZero!79 (index!2438 (_ BitVec 32))) (Found!79 (index!2439 (_ BitVec 32))) (Intermediate!79 (undefined!891 Bool) (index!2440 (_ BitVec 32)) (x!6381 (_ BitVec 32))) (Undefined!79) (MissingVacant!79 (index!2441 (_ BitVec 32))) )
))
(declare-fun lt!11010 () SeekEntryResult!79)

(declare-fun lt!11006 () (_ BitVec 32))

(get-info :version)

(assert (=> b!28965 (and ((_ is Found!79) lt!11010) (= (index!2439 lt!11010) lt!11006))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1735 (_ BitVec 32)) SeekEntryResult!79)

(assert (=> b!28965 (= lt!11010 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!681 0))(
  ( (Unit!682) )
))
(declare-fun lt!11009 () Unit!681)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1735 (_ BitVec 32)) Unit!681)

(assert (=> b!28965 (= lt!11009 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11006 _keys!1833 mask!2294))))

(assert (=> b!28965 (contains!287 lt!11008 (select (arr!821 _keys!1833) lt!11006))))

(declare-fun lt!11007 () Unit!681)

(declare-fun lemmaValidKeyInArrayIsInListMap!30 (array!1735 array!1737 (_ BitVec 32) (_ BitVec 32) V!1507 V!1507 (_ BitVec 32) Int) Unit!681)

(assert (=> b!28965 (= lt!11007 (lemmaValidKeyInArrayIsInListMap!30 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11006 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1735 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28965 (= lt!11006 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28966 () Bool)

(declare-fun e!18707 () Bool)

(assert (=> b!28966 (= e!18707 tp_is_empty!1261)))

(declare-fun mapNonEmpty!1420 () Bool)

(declare-fun mapRes!1420 () Bool)

(declare-fun tp!4140 () Bool)

(assert (=> mapNonEmpty!1420 (= mapRes!1420 (and tp!4140 e!18708))))

(declare-fun mapKey!1420 () (_ BitVec 32))

(declare-fun mapValue!1420 () ValueCell!431)

(declare-fun mapRest!1420 () (Array (_ BitVec 32) ValueCell!431))

(assert (=> mapNonEmpty!1420 (= (arr!822 _values!1501) (store mapRest!1420 mapKey!1420 mapValue!1420))))

(declare-fun b!28967 () Bool)

(assert (=> b!28967 (= e!18712 (and e!18707 mapRes!1420))))

(declare-fun condMapEmpty!1420 () Bool)

(declare-fun mapDefault!1420 () ValueCell!431)

(assert (=> b!28967 (= condMapEmpty!1420 (= (arr!822 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!431)) mapDefault!1420)))))

(declare-fun mapIsEmpty!1420 () Bool)

(assert (=> mapIsEmpty!1420 mapRes!1420))

(declare-fun b!28968 () Bool)

(declare-fun res!17329 () Bool)

(assert (=> b!28968 (=> (not res!17329) (not e!18709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28968 (= res!17329 (validKeyInArray!0 k0!1304))))

(assert (= (and start!3998 res!17328) b!28963))

(assert (= (and b!28963 res!17330) b!28961))

(assert (= (and b!28961 res!17327) b!28962))

(assert (= (and b!28962 res!17333) b!28968))

(assert (= (and b!28968 res!17329) b!28964))

(assert (= (and b!28964 res!17332) b!28959))

(assert (= (and b!28959 res!17331) b!28965))

(assert (= (and b!28967 condMapEmpty!1420) mapIsEmpty!1420))

(assert (= (and b!28967 (not condMapEmpty!1420)) mapNonEmpty!1420))

(assert (= (and mapNonEmpty!1420 ((_ is ValueCellFull!431) mapValue!1420)) b!28960))

(assert (= (and b!28967 ((_ is ValueCellFull!431) mapDefault!1420)) b!28966))

(assert (= start!3998 b!28967))

(declare-fun m!23057 () Bool)

(assert (=> b!28964 m!23057))

(declare-fun m!23059 () Bool)

(assert (=> b!28964 m!23059))

(declare-fun m!23061 () Bool)

(assert (=> mapNonEmpty!1420 m!23061))

(declare-fun m!23063 () Bool)

(assert (=> b!28962 m!23063))

(declare-fun m!23065 () Bool)

(assert (=> start!3998 m!23065))

(declare-fun m!23067 () Bool)

(assert (=> start!3998 m!23067))

(declare-fun m!23069 () Bool)

(assert (=> start!3998 m!23069))

(declare-fun m!23071 () Bool)

(assert (=> b!28968 m!23071))

(declare-fun m!23073 () Bool)

(assert (=> b!28959 m!23073))

(declare-fun m!23075 () Bool)

(assert (=> b!28965 m!23075))

(declare-fun m!23077 () Bool)

(assert (=> b!28965 m!23077))

(declare-fun m!23079 () Bool)

(assert (=> b!28965 m!23079))

(declare-fun m!23081 () Bool)

(assert (=> b!28965 m!23081))

(declare-fun m!23083 () Bool)

(assert (=> b!28965 m!23083))

(assert (=> b!28965 m!23079))

(declare-fun m!23085 () Bool)

(assert (=> b!28965 m!23085))

(declare-fun m!23087 () Bool)

(assert (=> b!28961 m!23087))

(check-sat (not b_next!907) tp_is_empty!1261 (not b!28959) (not b!28965) (not b!28964) (not mapNonEmpty!1420) (not start!3998) b_and!1707 (not b!28962) (not b!28961) (not b!28968))
(check-sat b_and!1707 (not b_next!907))
