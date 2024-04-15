; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3992 () Bool)

(assert start!3992)

(declare-fun b_free!907 () Bool)

(declare-fun b_next!907 () Bool)

(assert (=> start!3992 (= b_free!907 (not b_next!907))))

(declare-fun tp!4140 () Bool)

(declare-fun b_and!1711 () Bool)

(assert (=> start!3992 (= tp!4140 b_and!1711)))

(declare-fun b!28977 () Bool)

(declare-fun res!17338 () Bool)

(declare-fun e!18716 () Bool)

(assert (=> b!28977 (=> (not res!17338) (not e!18716))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28977 (= res!17338 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1420 () Bool)

(declare-fun mapRes!1420 () Bool)

(assert (=> mapIsEmpty!1420 mapRes!1420))

(declare-fun b!28978 () Bool)

(declare-fun res!17341 () Bool)

(assert (=> b!28978 (=> (not res!17341) (not e!18716))))

(declare-datatypes ((array!1731 0))(
  ( (array!1732 (arr!819 (Array (_ BitVec 32) (_ BitVec 64))) (size!920 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1731)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1731 (_ BitVec 32)) Bool)

(assert (=> b!28978 (= res!17341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28979 () Bool)

(declare-fun res!17336 () Bool)

(declare-fun e!18721 () Bool)

(assert (=> b!28979 (=> (not res!17336) (not e!18721))))

(declare-fun arrayContainsKey!0 (array!1731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28979 (= res!17336 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28981 () Bool)

(declare-fun res!17340 () Bool)

(assert (=> b!28981 (=> (not res!17340) (not e!18716))))

(declare-datatypes ((V!1507 0))(
  ( (V!1508 (val!657 Int)) )
))
(declare-datatypes ((ValueCell!431 0))(
  ( (ValueCellFull!431 (v!1745 V!1507)) (EmptyCell!431) )
))
(declare-datatypes ((array!1733 0))(
  ( (array!1734 (arr!820 (Array (_ BitVec 32) ValueCell!431)) (size!921 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1733)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28981 (= res!17340 (and (= (size!921 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!920 _keys!1833) (size!921 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1420 () Bool)

(declare-fun tp!4141 () Bool)

(declare-fun e!18719 () Bool)

(assert (=> mapNonEmpty!1420 (= mapRes!1420 (and tp!4141 e!18719))))

(declare-fun mapValue!1420 () ValueCell!431)

(declare-fun mapRest!1420 () (Array (_ BitVec 32) ValueCell!431))

(declare-fun mapKey!1420 () (_ BitVec 32))

(assert (=> mapNonEmpty!1420 (= (arr!820 _values!1501) (store mapRest!1420 mapKey!1420 mapValue!1420))))

(declare-fun b!28982 () Bool)

(declare-fun e!18720 () Bool)

(declare-fun tp_is_empty!1261 () Bool)

(assert (=> b!28982 (= e!18720 tp_is_empty!1261)))

(declare-fun b!28983 () Bool)

(assert (=> b!28983 (= e!18719 tp_is_empty!1261)))

(declare-fun b!28984 () Bool)

(assert (=> b!28984 (= e!18721 (not true))))

(declare-datatypes ((SeekEntryResult!80 0))(
  ( (MissingZero!80 (index!2442 (_ BitVec 32))) (Found!80 (index!2443 (_ BitVec 32))) (Intermediate!80 (undefined!892 Bool) (index!2444 (_ BitVec 32)) (x!6382 (_ BitVec 32))) (Undefined!80) (MissingVacant!80 (index!2445 (_ BitVec 32))) )
))
(declare-fun lt!11050 () SeekEntryResult!80)

(declare-fun lt!11049 () (_ BitVec 32))

(get-info :version)

(assert (=> b!28984 (and ((_ is Found!80) lt!11050) (= (index!2443 lt!11050) lt!11049))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1731 (_ BitVec 32)) SeekEntryResult!80)

(assert (=> b!28984 (= lt!11050 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!670 0))(
  ( (Unit!671) )
))
(declare-fun lt!11048 () Unit!670)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1731 (_ BitVec 32)) Unit!670)

(assert (=> b!28984 (= lt!11048 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11049 _keys!1833 mask!2294))))

(declare-datatypes ((tuple2!1100 0))(
  ( (tuple2!1101 (_1!561 (_ BitVec 64)) (_2!561 V!1507)) )
))
(declare-datatypes ((List!684 0))(
  ( (Nil!681) (Cons!680 (h!1247 tuple2!1100) (t!3370 List!684)) )
))
(declare-datatypes ((ListLongMap!665 0))(
  ( (ListLongMap!666 (toList!348 List!684)) )
))
(declare-fun lt!11047 () ListLongMap!665)

(declare-fun contains!289 (ListLongMap!665 (_ BitVec 64)) Bool)

(assert (=> b!28984 (contains!289 lt!11047 (select (arr!819 _keys!1833) lt!11049))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun lt!11046 () Unit!670)

(declare-fun zeroValue!1443 () V!1507)

(declare-fun minValue!1443 () V!1507)

(declare-fun lemmaValidKeyInArrayIsInListMap!25 (array!1731 array!1733 (_ BitVec 32) (_ BitVec 32) V!1507 V!1507 (_ BitVec 32) Int) Unit!670)

(assert (=> b!28984 (= lt!11046 (lemmaValidKeyInArrayIsInListMap!25 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11049 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1731 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28984 (= lt!11049 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28980 () Bool)

(declare-fun res!17335 () Bool)

(assert (=> b!28980 (=> (not res!17335) (not e!18716))))

(declare-datatypes ((List!685 0))(
  ( (Nil!682) (Cons!681 (h!1248 (_ BitVec 64)) (t!3371 List!685)) )
))
(declare-fun arrayNoDuplicates!0 (array!1731 (_ BitVec 32) List!685) Bool)

(assert (=> b!28980 (= res!17335 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!682))))

(declare-fun res!17337 () Bool)

(assert (=> start!3992 (=> (not res!17337) (not e!18716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3992 (= res!17337 (validMask!0 mask!2294))))

(assert (=> start!3992 e!18716))

(assert (=> start!3992 true))

(assert (=> start!3992 tp!4140))

(declare-fun e!18717 () Bool)

(declare-fun array_inv!571 (array!1733) Bool)

(assert (=> start!3992 (and (array_inv!571 _values!1501) e!18717)))

(declare-fun array_inv!572 (array!1731) Bool)

(assert (=> start!3992 (array_inv!572 _keys!1833)))

(assert (=> start!3992 tp_is_empty!1261))

(declare-fun b!28985 () Bool)

(assert (=> b!28985 (= e!18717 (and e!18720 mapRes!1420))))

(declare-fun condMapEmpty!1420 () Bool)

(declare-fun mapDefault!1420 () ValueCell!431)

(assert (=> b!28985 (= condMapEmpty!1420 (= (arr!820 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!431)) mapDefault!1420)))))

(declare-fun b!28986 () Bool)

(assert (=> b!28986 (= e!18716 e!18721)))

(declare-fun res!17339 () Bool)

(assert (=> b!28986 (=> (not res!17339) (not e!18721))))

(assert (=> b!28986 (= res!17339 (not (contains!289 lt!11047 k0!1304)))))

(declare-fun getCurrentListMap!176 (array!1731 array!1733 (_ BitVec 32) (_ BitVec 32) V!1507 V!1507 (_ BitVec 32) Int) ListLongMap!665)

(assert (=> b!28986 (= lt!11047 (getCurrentListMap!176 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(assert (= (and start!3992 res!17337) b!28981))

(assert (= (and b!28981 res!17340) b!28978))

(assert (= (and b!28978 res!17341) b!28980))

(assert (= (and b!28980 res!17335) b!28977))

(assert (= (and b!28977 res!17338) b!28986))

(assert (= (and b!28986 res!17339) b!28979))

(assert (= (and b!28979 res!17336) b!28984))

(assert (= (and b!28985 condMapEmpty!1420) mapIsEmpty!1420))

(assert (= (and b!28985 (not condMapEmpty!1420)) mapNonEmpty!1420))

(assert (= (and mapNonEmpty!1420 ((_ is ValueCellFull!431) mapValue!1420)) b!28983))

(assert (= (and b!28985 ((_ is ValueCellFull!431) mapDefault!1420)) b!28982))

(assert (= start!3992 b!28985))

(declare-fun m!23139 () Bool)

(assert (=> b!28984 m!23139))

(declare-fun m!23141 () Bool)

(assert (=> b!28984 m!23141))

(declare-fun m!23143 () Bool)

(assert (=> b!28984 m!23143))

(declare-fun m!23145 () Bool)

(assert (=> b!28984 m!23145))

(declare-fun m!23147 () Bool)

(assert (=> b!28984 m!23147))

(assert (=> b!28984 m!23145))

(declare-fun m!23149 () Bool)

(assert (=> b!28984 m!23149))

(declare-fun m!23151 () Bool)

(assert (=> b!28978 m!23151))

(declare-fun m!23153 () Bool)

(assert (=> start!3992 m!23153))

(declare-fun m!23155 () Bool)

(assert (=> start!3992 m!23155))

(declare-fun m!23157 () Bool)

(assert (=> start!3992 m!23157))

(declare-fun m!23159 () Bool)

(assert (=> b!28977 m!23159))

(declare-fun m!23161 () Bool)

(assert (=> b!28986 m!23161))

(declare-fun m!23163 () Bool)

(assert (=> b!28986 m!23163))

(declare-fun m!23165 () Bool)

(assert (=> b!28980 m!23165))

(declare-fun m!23167 () Bool)

(assert (=> mapNonEmpty!1420 m!23167))

(declare-fun m!23169 () Bool)

(assert (=> b!28979 m!23169))

(check-sat (not b!28979) b_and!1711 (not start!3992) (not mapNonEmpty!1420) (not b!28984) (not b!28980) (not b!28978) (not b!28986) (not b!28977) (not b_next!907) tp_is_empty!1261)
(check-sat b_and!1711 (not b_next!907))
