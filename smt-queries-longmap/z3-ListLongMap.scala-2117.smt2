; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35872 () Bool)

(assert start!35872)

(declare-fun b!360669 () Bool)

(declare-fun e!220801 () Bool)

(declare-fun tp_is_empty!8323 () Bool)

(assert (=> b!360669 (= e!220801 tp_is_empty!8323)))

(declare-fun b!360670 () Bool)

(declare-fun res!200652 () Bool)

(declare-fun e!220802 () Bool)

(assert (=> b!360670 (=> (not res!200652) (not e!220802))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20178 0))(
  ( (array!20179 (arr!9581 (Array (_ BitVec 32) (_ BitVec 64))) (size!9933 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20178)

(declare-datatypes ((V!12075 0))(
  ( (V!12076 (val!4206 Int)) )
))
(declare-datatypes ((ValueCell!3818 0))(
  ( (ValueCellFull!3818 (v!6401 V!12075)) (EmptyCell!3818) )
))
(declare-datatypes ((array!20180 0))(
  ( (array!20181 (arr!9582 (Array (_ BitVec 32) ValueCell!3818)) (size!9934 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20180)

(assert (=> b!360670 (= res!200652 (and (= (size!9934 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9933 _keys!1456) (size!9934 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360671 () Bool)

(declare-fun res!200649 () Bool)

(assert (=> b!360671 (=> (not res!200649) (not e!220802))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k0!1077 () (_ BitVec 64))

(assert (=> b!360671 (= res!200649 (not (= (select (arr!9581 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360672 () Bool)

(declare-fun res!200655 () Bool)

(assert (=> b!360672 (=> (not res!200655) (not e!220802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20178 (_ BitVec 32)) Bool)

(assert (=> b!360672 (= res!200655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13995 () Bool)

(declare-fun mapRes!13995 () Bool)

(declare-fun tp!28062 () Bool)

(assert (=> mapNonEmpty!13995 (= mapRes!13995 (and tp!28062 e!220801))))

(declare-fun mapValue!13995 () ValueCell!3818)

(declare-fun mapKey!13995 () (_ BitVec 32))

(declare-fun mapRest!13995 () (Array (_ BitVec 32) ValueCell!3818))

(assert (=> mapNonEmpty!13995 (= (arr!9582 _values!1208) (store mapRest!13995 mapKey!13995 mapValue!13995))))

(declare-fun b!360673 () Bool)

(declare-fun res!200653 () Bool)

(assert (=> b!360673 (=> (not res!200653) (not e!220802))))

(declare-fun arrayContainsKey!0 (array!20178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360673 (= res!200653 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360674 () Bool)

(declare-fun e!220799 () Bool)

(declare-fun e!220800 () Bool)

(assert (=> b!360674 (= e!220799 (and e!220800 mapRes!13995))))

(declare-fun condMapEmpty!13995 () Bool)

(declare-fun mapDefault!13995 () ValueCell!3818)

(assert (=> b!360674 (= condMapEmpty!13995 (= (arr!9582 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3818)) mapDefault!13995)))))

(declare-fun b!360675 () Bool)

(assert (=> b!360675 (= e!220800 tp_is_empty!8323)))

(declare-fun b!360676 () Bool)

(declare-fun res!200654 () Bool)

(assert (=> b!360676 (=> (not res!200654) (not e!220802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360676 (= res!200654 (validKeyInArray!0 k0!1077))))

(declare-fun b!360668 () Bool)

(assert (=> b!360668 (= e!220802 (not true))))

(assert (=> b!360668 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((Unit!11083 0))(
  ( (Unit!11084) )
))
(declare-fun lt!166502 () Unit!11083)

(declare-fun minValue!1150 () V!12075)

(declare-fun zeroValue!1150 () V!12075)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!63 (array!20178 array!20180 (_ BitVec 32) (_ BitVec 32) V!12075 V!12075 (_ BitVec 64) (_ BitVec 32)) Unit!11083)

(assert (=> b!360668 (= lt!166502 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!63 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun res!200650 () Bool)

(assert (=> start!35872 (=> (not res!200650) (not e!220802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35872 (= res!200650 (validMask!0 mask!1842))))

(assert (=> start!35872 e!220802))

(assert (=> start!35872 tp_is_empty!8323))

(assert (=> start!35872 true))

(declare-fun array_inv!7082 (array!20178) Bool)

(assert (=> start!35872 (array_inv!7082 _keys!1456)))

(declare-fun array_inv!7083 (array!20180) Bool)

(assert (=> start!35872 (and (array_inv!7083 _values!1208) e!220799)))

(declare-fun mapIsEmpty!13995 () Bool)

(assert (=> mapIsEmpty!13995 mapRes!13995))

(declare-fun b!360677 () Bool)

(declare-fun res!200651 () Bool)

(assert (=> b!360677 (=> (not res!200651) (not e!220802))))

(assert (=> b!360677 (= res!200651 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9933 _keys!1456))))))

(declare-fun b!360678 () Bool)

(declare-fun res!200648 () Bool)

(assert (=> b!360678 (=> (not res!200648) (not e!220802))))

(declare-datatypes ((List!5406 0))(
  ( (Nil!5403) (Cons!5402 (h!6258 (_ BitVec 64)) (t!10548 List!5406)) )
))
(declare-fun arrayNoDuplicates!0 (array!20178 (_ BitVec 32) List!5406) Bool)

(assert (=> b!360678 (= res!200648 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5403))))

(assert (= (and start!35872 res!200650) b!360670))

(assert (= (and b!360670 res!200652) b!360672))

(assert (= (and b!360672 res!200655) b!360678))

(assert (= (and b!360678 res!200648) b!360676))

(assert (= (and b!360676 res!200654) b!360677))

(assert (= (and b!360677 res!200651) b!360673))

(assert (= (and b!360673 res!200653) b!360671))

(assert (= (and b!360671 res!200649) b!360668))

(assert (= (and b!360674 condMapEmpty!13995) mapIsEmpty!13995))

(assert (= (and b!360674 (not condMapEmpty!13995)) mapNonEmpty!13995))

(get-info :version)

(assert (= (and mapNonEmpty!13995 ((_ is ValueCellFull!3818) mapValue!13995)) b!360669))

(assert (= (and b!360674 ((_ is ValueCellFull!3818) mapDefault!13995)) b!360675))

(assert (= start!35872 b!360674))

(declare-fun m!358013 () Bool)

(assert (=> b!360676 m!358013))

(declare-fun m!358015 () Bool)

(assert (=> b!360671 m!358015))

(declare-fun m!358017 () Bool)

(assert (=> b!360672 m!358017))

(declare-fun m!358019 () Bool)

(assert (=> b!360668 m!358019))

(declare-fun m!358021 () Bool)

(assert (=> b!360668 m!358021))

(declare-fun m!358023 () Bool)

(assert (=> mapNonEmpty!13995 m!358023))

(declare-fun m!358025 () Bool)

(assert (=> b!360673 m!358025))

(declare-fun m!358027 () Bool)

(assert (=> b!360678 m!358027))

(declare-fun m!358029 () Bool)

(assert (=> start!35872 m!358029))

(declare-fun m!358031 () Bool)

(assert (=> start!35872 m!358031))

(declare-fun m!358033 () Bool)

(assert (=> start!35872 m!358033))

(check-sat (not mapNonEmpty!13995) (not b!360676) (not b!360678) (not b!360672) tp_is_empty!8323 (not b!360668) (not b!360673) (not start!35872))
(check-sat)
