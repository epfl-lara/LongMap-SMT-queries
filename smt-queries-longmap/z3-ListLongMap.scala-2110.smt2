; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35830 () Bool)

(assert start!35830)

(declare-fun b!360018 () Bool)

(declare-fun e!220499 () Bool)

(assert (=> b!360018 (= e!220499 (not true))))

(declare-datatypes ((array!20119 0))(
  ( (array!20120 (arr!9553 (Array (_ BitVec 32) (_ BitVec 64))) (size!9905 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20119)

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360018 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((Unit!11066 0))(
  ( (Unit!11067) )
))
(declare-fun lt!166412 () Unit!11066)

(declare-datatypes ((V!12021 0))(
  ( (V!12022 (val!4186 Int)) )
))
(declare-fun minValue!1150 () V!12021)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3798 0))(
  ( (ValueCellFull!3798 (v!6380 V!12021)) (EmptyCell!3798) )
))
(declare-datatypes ((array!20121 0))(
  ( (array!20122 (arr!9554 (Array (_ BitVec 32) ValueCell!3798)) (size!9906 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20121)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12021)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!48 (array!20119 array!20121 (_ BitVec 32) (_ BitVec 32) V!12021 V!12021 (_ BitVec 64) (_ BitVec 32)) Unit!11066)

(assert (=> b!360018 (= lt!166412 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!48 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13932 () Bool)

(declare-fun mapRes!13932 () Bool)

(assert (=> mapIsEmpty!13932 mapRes!13932))

(declare-fun b!360019 () Bool)

(declare-fun res!200154 () Bool)

(assert (=> b!360019 (=> (not res!200154) (not e!220499))))

(assert (=> b!360019 (= res!200154 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360020 () Bool)

(declare-fun res!200153 () Bool)

(assert (=> b!360020 (=> (not res!200153) (not e!220499))))

(declare-datatypes ((List!5482 0))(
  ( (Nil!5479) (Cons!5478 (h!6334 (_ BitVec 64)) (t!10632 List!5482)) )
))
(declare-fun arrayNoDuplicates!0 (array!20119 (_ BitVec 32) List!5482) Bool)

(assert (=> b!360020 (= res!200153 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5479))))

(declare-fun b!360022 () Bool)

(declare-fun res!200151 () Bool)

(assert (=> b!360022 (=> (not res!200151) (not e!220499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20119 (_ BitVec 32)) Bool)

(assert (=> b!360022 (= res!200151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360023 () Bool)

(declare-fun e!220502 () Bool)

(declare-fun tp_is_empty!8283 () Bool)

(assert (=> b!360023 (= e!220502 tp_is_empty!8283)))

(declare-fun b!360024 () Bool)

(declare-fun e!220501 () Bool)

(assert (=> b!360024 (= e!220501 (and e!220502 mapRes!13932))))

(declare-fun condMapEmpty!13932 () Bool)

(declare-fun mapDefault!13932 () ValueCell!3798)

(assert (=> b!360024 (= condMapEmpty!13932 (= (arr!9554 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3798)) mapDefault!13932)))))

(declare-fun b!360025 () Bool)

(declare-fun res!200152 () Bool)

(assert (=> b!360025 (=> (not res!200152) (not e!220499))))

(assert (=> b!360025 (= res!200152 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9905 _keys!1456))))))

(declare-fun mapNonEmpty!13932 () Bool)

(declare-fun tp!27999 () Bool)

(declare-fun e!220498 () Bool)

(assert (=> mapNonEmpty!13932 (= mapRes!13932 (and tp!27999 e!220498))))

(declare-fun mapValue!13932 () ValueCell!3798)

(declare-fun mapKey!13932 () (_ BitVec 32))

(declare-fun mapRest!13932 () (Array (_ BitVec 32) ValueCell!3798))

(assert (=> mapNonEmpty!13932 (= (arr!9554 _values!1208) (store mapRest!13932 mapKey!13932 mapValue!13932))))

(declare-fun b!360026 () Bool)

(declare-fun res!200150 () Bool)

(assert (=> b!360026 (=> (not res!200150) (not e!220499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360026 (= res!200150 (validKeyInArray!0 k0!1077))))

(declare-fun b!360027 () Bool)

(assert (=> b!360027 (= e!220498 tp_is_empty!8283)))

(declare-fun b!360028 () Bool)

(declare-fun res!200155 () Bool)

(assert (=> b!360028 (=> (not res!200155) (not e!220499))))

(assert (=> b!360028 (= res!200155 (not (= (select (arr!9553 _keys!1456) from!1805) k0!1077)))))

(declare-fun res!200149 () Bool)

(assert (=> start!35830 (=> (not res!200149) (not e!220499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35830 (= res!200149 (validMask!0 mask!1842))))

(assert (=> start!35830 e!220499))

(assert (=> start!35830 tp_is_empty!8283))

(assert (=> start!35830 true))

(declare-fun array_inv!7030 (array!20119) Bool)

(assert (=> start!35830 (array_inv!7030 _keys!1456)))

(declare-fun array_inv!7031 (array!20121) Bool)

(assert (=> start!35830 (and (array_inv!7031 _values!1208) e!220501)))

(declare-fun b!360021 () Bool)

(declare-fun res!200148 () Bool)

(assert (=> b!360021 (=> (not res!200148) (not e!220499))))

(assert (=> b!360021 (= res!200148 (and (= (size!9906 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9905 _keys!1456) (size!9906 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35830 res!200149) b!360021))

(assert (= (and b!360021 res!200148) b!360022))

(assert (= (and b!360022 res!200151) b!360020))

(assert (= (and b!360020 res!200153) b!360026))

(assert (= (and b!360026 res!200150) b!360025))

(assert (= (and b!360025 res!200152) b!360019))

(assert (= (and b!360019 res!200154) b!360028))

(assert (= (and b!360028 res!200155) b!360018))

(assert (= (and b!360024 condMapEmpty!13932) mapIsEmpty!13932))

(assert (= (and b!360024 (not condMapEmpty!13932)) mapNonEmpty!13932))

(get-info :version)

(assert (= (and mapNonEmpty!13932 ((_ is ValueCellFull!3798) mapValue!13932)) b!360027))

(assert (= (and b!360024 ((_ is ValueCellFull!3798) mapDefault!13932)) b!360023))

(assert (= start!35830 b!360024))

(declare-fun m!357323 () Bool)

(assert (=> b!360022 m!357323))

(declare-fun m!357325 () Bool)

(assert (=> b!360018 m!357325))

(declare-fun m!357327 () Bool)

(assert (=> b!360018 m!357327))

(declare-fun m!357329 () Bool)

(assert (=> b!360028 m!357329))

(declare-fun m!357331 () Bool)

(assert (=> b!360019 m!357331))

(declare-fun m!357333 () Bool)

(assert (=> mapNonEmpty!13932 m!357333))

(declare-fun m!357335 () Bool)

(assert (=> b!360026 m!357335))

(declare-fun m!357337 () Bool)

(assert (=> b!360020 m!357337))

(declare-fun m!357339 () Bool)

(assert (=> start!35830 m!357339))

(declare-fun m!357341 () Bool)

(assert (=> start!35830 m!357341))

(declare-fun m!357343 () Bool)

(assert (=> start!35830 m!357343))

(check-sat (not b!360018) (not mapNonEmpty!13932) (not b!360022) (not b!360019) (not b!360026) tp_is_empty!8283 (not b!360020) (not start!35830))
(check-sat)
