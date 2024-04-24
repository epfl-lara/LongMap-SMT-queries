; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35832 () Bool)

(assert start!35832)

(declare-fun mapNonEmpty!13956 () Bool)

(declare-fun mapRes!13956 () Bool)

(declare-fun tp!28023 () Bool)

(declare-fun e!220588 () Bool)

(assert (=> mapNonEmpty!13956 (= mapRes!13956 (and tp!28023 e!220588))))

(declare-datatypes ((V!12043 0))(
  ( (V!12044 (val!4194 Int)) )
))
(declare-datatypes ((ValueCell!3806 0))(
  ( (ValueCellFull!3806 (v!6389 V!12043)) (EmptyCell!3806) )
))
(declare-fun mapValue!13956 () ValueCell!3806)

(declare-fun mapRest!13956 () (Array (_ BitVec 32) ValueCell!3806))

(declare-datatypes ((array!20128 0))(
  ( (array!20129 (arr!9557 (Array (_ BitVec 32) ValueCell!3806)) (size!9909 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20128)

(declare-fun mapKey!13956 () (_ BitVec 32))

(assert (=> mapNonEmpty!13956 (= (arr!9557 _values!1208) (store mapRest!13956 mapKey!13956 mapValue!13956))))

(declare-fun b!360229 () Bool)

(declare-fun e!220585 () Bool)

(declare-fun tp_is_empty!8299 () Bool)

(assert (=> b!360229 (= e!220585 tp_is_empty!8299)))

(declare-fun b!360230 () Bool)

(declare-fun res!200340 () Bool)

(declare-fun e!220586 () Bool)

(assert (=> b!360230 (=> (not res!200340) (not e!220586))))

(declare-datatypes ((array!20130 0))(
  ( (array!20131 (arr!9558 (Array (_ BitVec 32) (_ BitVec 64))) (size!9910 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20130)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360230 (= res!200340 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13956 () Bool)

(assert (=> mapIsEmpty!13956 mapRes!13956))

(declare-fun b!360231 () Bool)

(assert (=> b!360231 (= e!220586 (not true))))

(assert (=> b!360231 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12043)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((Unit!11067 0))(
  ( (Unit!11068) )
))
(declare-fun lt!166454 () Unit!11067)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12043)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!55 (array!20130 array!20128 (_ BitVec 32) (_ BitVec 32) V!12043 V!12043 (_ BitVec 64) (_ BitVec 32)) Unit!11067)

(assert (=> b!360231 (= lt!166454 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!55 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360232 () Bool)

(declare-fun res!200337 () Bool)

(assert (=> b!360232 (=> (not res!200337) (not e!220586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20130 (_ BitVec 32)) Bool)

(assert (=> b!360232 (= res!200337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360233 () Bool)

(declare-fun res!200339 () Bool)

(assert (=> b!360233 (=> (not res!200339) (not e!220586))))

(assert (=> b!360233 (= res!200339 (and (= (size!9909 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9910 _keys!1456) (size!9909 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!200343 () Bool)

(assert (=> start!35832 (=> (not res!200343) (not e!220586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35832 (= res!200343 (validMask!0 mask!1842))))

(assert (=> start!35832 e!220586))

(assert (=> start!35832 tp_is_empty!8299))

(assert (=> start!35832 true))

(declare-fun array_inv!7068 (array!20130) Bool)

(assert (=> start!35832 (array_inv!7068 _keys!1456)))

(declare-fun e!220584 () Bool)

(declare-fun array_inv!7069 (array!20128) Bool)

(assert (=> start!35832 (and (array_inv!7069 _values!1208) e!220584)))

(declare-fun b!360234 () Bool)

(declare-fun res!200344 () Bool)

(assert (=> b!360234 (=> (not res!200344) (not e!220586))))

(assert (=> b!360234 (= res!200344 (not (= (select (arr!9558 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360235 () Bool)

(assert (=> b!360235 (= e!220588 tp_is_empty!8299)))

(declare-fun b!360236 () Bool)

(declare-fun res!200341 () Bool)

(assert (=> b!360236 (=> (not res!200341) (not e!220586))))

(assert (=> b!360236 (= res!200341 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9910 _keys!1456))))))

(declare-fun b!360237 () Bool)

(declare-fun res!200338 () Bool)

(assert (=> b!360237 (=> (not res!200338) (not e!220586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360237 (= res!200338 (validKeyInArray!0 k0!1077))))

(declare-fun b!360238 () Bool)

(declare-fun res!200342 () Bool)

(assert (=> b!360238 (=> (not res!200342) (not e!220586))))

(declare-datatypes ((List!5398 0))(
  ( (Nil!5395) (Cons!5394 (h!6250 (_ BitVec 64)) (t!10540 List!5398)) )
))
(declare-fun arrayNoDuplicates!0 (array!20130 (_ BitVec 32) List!5398) Bool)

(assert (=> b!360238 (= res!200342 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5395))))

(declare-fun b!360239 () Bool)

(assert (=> b!360239 (= e!220584 (and e!220585 mapRes!13956))))

(declare-fun condMapEmpty!13956 () Bool)

(declare-fun mapDefault!13956 () ValueCell!3806)

(assert (=> b!360239 (= condMapEmpty!13956 (= (arr!9557 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3806)) mapDefault!13956)))))

(assert (= (and start!35832 res!200343) b!360233))

(assert (= (and b!360233 res!200339) b!360232))

(assert (= (and b!360232 res!200337) b!360238))

(assert (= (and b!360238 res!200342) b!360237))

(assert (= (and b!360237 res!200338) b!360236))

(assert (= (and b!360236 res!200341) b!360230))

(assert (= (and b!360230 res!200340) b!360234))

(assert (= (and b!360234 res!200344) b!360231))

(assert (= (and b!360239 condMapEmpty!13956) mapIsEmpty!13956))

(assert (= (and b!360239 (not condMapEmpty!13956)) mapNonEmpty!13956))

(get-info :version)

(assert (= (and mapNonEmpty!13956 ((_ is ValueCellFull!3806) mapValue!13956)) b!360235))

(assert (= (and b!360239 ((_ is ValueCellFull!3806) mapDefault!13956)) b!360229))

(assert (= start!35832 b!360239))

(declare-fun m!357723 () Bool)

(assert (=> b!360232 m!357723))

(declare-fun m!357725 () Bool)

(assert (=> b!360237 m!357725))

(declare-fun m!357727 () Bool)

(assert (=> b!360234 m!357727))

(declare-fun m!357729 () Bool)

(assert (=> start!35832 m!357729))

(declare-fun m!357731 () Bool)

(assert (=> start!35832 m!357731))

(declare-fun m!357733 () Bool)

(assert (=> start!35832 m!357733))

(declare-fun m!357735 () Bool)

(assert (=> b!360238 m!357735))

(declare-fun m!357737 () Bool)

(assert (=> b!360231 m!357737))

(declare-fun m!357739 () Bool)

(assert (=> b!360231 m!357739))

(declare-fun m!357741 () Bool)

(assert (=> b!360230 m!357741))

(declare-fun m!357743 () Bool)

(assert (=> mapNonEmpty!13956 m!357743))

(check-sat (not b!360238) (not mapNonEmpty!13956) (not b!360231) tp_is_empty!8299 (not start!35832) (not b!360230) (not b!360237) (not b!360232))
(check-sat)
