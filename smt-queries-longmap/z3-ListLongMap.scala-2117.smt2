; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35872 () Bool)

(assert start!35872)

(declare-fun b!360446 () Bool)

(declare-fun res!200524 () Bool)

(declare-fun e!220657 () Bool)

(assert (=> b!360446 (=> (not res!200524) (not e!220657))))

(declare-datatypes ((array!20173 0))(
  ( (array!20174 (arr!9579 (Array (_ BitVec 32) (_ BitVec 64))) (size!9932 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20173)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360446 (= res!200524 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360447 () Bool)

(declare-fun res!200526 () Bool)

(assert (=> b!360447 (=> (not res!200526) (not e!220657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360447 (= res!200526 (validKeyInArray!0 k0!1077))))

(declare-fun b!360448 () Bool)

(declare-fun res!200525 () Bool)

(assert (=> b!360448 (=> (not res!200525) (not e!220657))))

(assert (=> b!360448 (= res!200525 (not (= (select (arr!9579 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360449 () Bool)

(declare-fun res!200529 () Bool)

(assert (=> b!360449 (=> (not res!200529) (not e!220657))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20173 (_ BitVec 32)) Bool)

(assert (=> b!360449 (= res!200529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360450 () Bool)

(declare-fun e!220660 () Bool)

(declare-fun tp_is_empty!8323 () Bool)

(assert (=> b!360450 (= e!220660 tp_is_empty!8323)))

(declare-fun b!360451 () Bool)

(declare-fun e!220661 () Bool)

(declare-fun e!220659 () Bool)

(declare-fun mapRes!13995 () Bool)

(assert (=> b!360451 (= e!220661 (and e!220659 mapRes!13995))))

(declare-fun condMapEmpty!13995 () Bool)

(declare-datatypes ((V!12075 0))(
  ( (V!12076 (val!4206 Int)) )
))
(declare-datatypes ((ValueCell!3818 0))(
  ( (ValueCellFull!3818 (v!6394 V!12075)) (EmptyCell!3818) )
))
(declare-datatypes ((array!20175 0))(
  ( (array!20176 (arr!9580 (Array (_ BitVec 32) ValueCell!3818)) (size!9933 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20175)

(declare-fun mapDefault!13995 () ValueCell!3818)

(assert (=> b!360451 (= condMapEmpty!13995 (= (arr!9580 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3818)) mapDefault!13995)))))

(declare-fun b!360452 () Bool)

(declare-fun res!200528 () Bool)

(assert (=> b!360452 (=> (not res!200528) (not e!220657))))

(declare-datatypes ((List!5460 0))(
  ( (Nil!5457) (Cons!5456 (h!6312 (_ BitVec 64)) (t!10601 List!5460)) )
))
(declare-fun arrayNoDuplicates!0 (array!20173 (_ BitVec 32) List!5460) Bool)

(assert (=> b!360452 (= res!200528 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5457))))

(declare-fun b!360453 () Bool)

(declare-fun res!200527 () Bool)

(assert (=> b!360453 (=> (not res!200527) (not e!220657))))

(assert (=> b!360453 (= res!200527 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9932 _keys!1456))))))

(declare-fun res!200523 () Bool)

(assert (=> start!35872 (=> (not res!200523) (not e!220657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35872 (= res!200523 (validMask!0 mask!1842))))

(assert (=> start!35872 e!220657))

(assert (=> start!35872 tp_is_empty!8323))

(assert (=> start!35872 true))

(declare-fun array_inv!7058 (array!20173) Bool)

(assert (=> start!35872 (array_inv!7058 _keys!1456)))

(declare-fun array_inv!7059 (array!20175) Bool)

(assert (=> start!35872 (and (array_inv!7059 _values!1208) e!220661)))

(declare-fun mapIsEmpty!13995 () Bool)

(assert (=> mapIsEmpty!13995 mapRes!13995))

(declare-fun b!360454 () Bool)

(assert (=> b!360454 (= e!220657 (not true))))

(assert (=> b!360454 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12075)

(declare-datatypes ((Unit!11078 0))(
  ( (Unit!11079) )
))
(declare-fun lt!166249 () Unit!11078)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12075)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!62 (array!20173 array!20175 (_ BitVec 32) (_ BitVec 32) V!12075 V!12075 (_ BitVec 64) (_ BitVec 32)) Unit!11078)

(assert (=> b!360454 (= lt!166249 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!62 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!360455 () Bool)

(declare-fun res!200522 () Bool)

(assert (=> b!360455 (=> (not res!200522) (not e!220657))))

(assert (=> b!360455 (= res!200522 (and (= (size!9933 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9932 _keys!1456) (size!9933 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360456 () Bool)

(assert (=> b!360456 (= e!220659 tp_is_empty!8323)))

(declare-fun mapNonEmpty!13995 () Bool)

(declare-fun tp!28062 () Bool)

(assert (=> mapNonEmpty!13995 (= mapRes!13995 (and tp!28062 e!220660))))

(declare-fun mapKey!13995 () (_ BitVec 32))

(declare-fun mapValue!13995 () ValueCell!3818)

(declare-fun mapRest!13995 () (Array (_ BitVec 32) ValueCell!3818))

(assert (=> mapNonEmpty!13995 (= (arr!9580 _values!1208) (store mapRest!13995 mapKey!13995 mapValue!13995))))

(assert (= (and start!35872 res!200523) b!360455))

(assert (= (and b!360455 res!200522) b!360449))

(assert (= (and b!360449 res!200529) b!360452))

(assert (= (and b!360452 res!200528) b!360447))

(assert (= (and b!360447 res!200526) b!360453))

(assert (= (and b!360453 res!200527) b!360446))

(assert (= (and b!360446 res!200524) b!360448))

(assert (= (and b!360448 res!200525) b!360454))

(assert (= (and b!360451 condMapEmpty!13995) mapIsEmpty!13995))

(assert (= (and b!360451 (not condMapEmpty!13995)) mapNonEmpty!13995))

(get-info :version)

(assert (= (and mapNonEmpty!13995 ((_ is ValueCellFull!3818) mapValue!13995)) b!360450))

(assert (= (and b!360451 ((_ is ValueCellFull!3818) mapDefault!13995)) b!360456))

(assert (= start!35872 b!360451))

(declare-fun m!357059 () Bool)

(assert (=> b!360446 m!357059))

(declare-fun m!357061 () Bool)

(assert (=> b!360448 m!357061))

(declare-fun m!357063 () Bool)

(assert (=> mapNonEmpty!13995 m!357063))

(declare-fun m!357065 () Bool)

(assert (=> b!360447 m!357065))

(declare-fun m!357067 () Bool)

(assert (=> b!360452 m!357067))

(declare-fun m!357069 () Bool)

(assert (=> b!360454 m!357069))

(declare-fun m!357071 () Bool)

(assert (=> b!360454 m!357071))

(declare-fun m!357073 () Bool)

(assert (=> b!360449 m!357073))

(declare-fun m!357075 () Bool)

(assert (=> start!35872 m!357075))

(declare-fun m!357077 () Bool)

(assert (=> start!35872 m!357077))

(declare-fun m!357079 () Bool)

(assert (=> start!35872 m!357079))

(check-sat (not b!360452) (not b!360454) tp_is_empty!8323 (not b!360446) (not start!35872) (not b!360449) (not b!360447) (not mapNonEmpty!13995))
(check-sat)
