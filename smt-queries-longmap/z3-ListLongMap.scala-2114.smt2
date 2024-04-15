; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35838 () Bool)

(assert start!35838)

(declare-fun b!360106 () Bool)

(declare-fun res!200287 () Bool)

(declare-fun e!220487 () Bool)

(assert (=> b!360106 (=> (not res!200287) (not e!220487))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360106 (= res!200287 (validKeyInArray!0 k0!1077))))

(declare-fun b!360107 () Bool)

(declare-fun e!220491 () Bool)

(declare-fun e!220489 () Bool)

(declare-fun mapRes!13965 () Bool)

(assert (=> b!360107 (= e!220491 (and e!220489 mapRes!13965))))

(declare-fun condMapEmpty!13965 () Bool)

(declare-datatypes ((V!12051 0))(
  ( (V!12052 (val!4197 Int)) )
))
(declare-datatypes ((ValueCell!3809 0))(
  ( (ValueCellFull!3809 (v!6385 V!12051)) (EmptyCell!3809) )
))
(declare-datatypes ((array!20135 0))(
  ( (array!20136 (arr!9561 (Array (_ BitVec 32) ValueCell!3809)) (size!9914 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20135)

(declare-fun mapDefault!13965 () ValueCell!3809)

(assert (=> b!360107 (= condMapEmpty!13965 (= (arr!9561 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3809)) mapDefault!13965)))))

(declare-fun b!360108 () Bool)

(declare-fun res!200286 () Bool)

(assert (=> b!360108 (=> (not res!200286) (not e!220487))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!20137 0))(
  ( (array!20138 (arr!9562 (Array (_ BitVec 32) (_ BitVec 64))) (size!9915 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20137)

(assert (=> b!360108 (= res!200286 (and (= (size!9914 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9915 _keys!1456) (size!9914 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360109 () Bool)

(declare-fun res!200283 () Bool)

(assert (=> b!360109 (=> (not res!200283) (not e!220487))))

(declare-datatypes ((List!5456 0))(
  ( (Nil!5453) (Cons!5452 (h!6308 (_ BitVec 64)) (t!10597 List!5456)) )
))
(declare-fun arrayNoDuplicates!0 (array!20137 (_ BitVec 32) List!5456) Bool)

(assert (=> b!360109 (= res!200283 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5453))))

(declare-fun b!360110 () Bool)

(declare-fun res!200288 () Bool)

(assert (=> b!360110 (=> (not res!200288) (not e!220487))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!360110 (= res!200288 (not (= (select (arr!9562 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!360111 () Bool)

(declare-fun res!200290 () Bool)

(assert (=> b!360111 (=> (not res!200290) (not e!220487))))

(assert (=> b!360111 (= res!200290 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9915 _keys!1456))))))

(declare-fun mapNonEmpty!13965 () Bool)

(declare-fun tp!28032 () Bool)

(declare-fun e!220488 () Bool)

(assert (=> mapNonEmpty!13965 (= mapRes!13965 (and tp!28032 e!220488))))

(declare-fun mapRest!13965 () (Array (_ BitVec 32) ValueCell!3809))

(declare-fun mapValue!13965 () ValueCell!3809)

(declare-fun mapKey!13965 () (_ BitVec 32))

(assert (=> mapNonEmpty!13965 (= (arr!9561 _values!1208) (store mapRest!13965 mapKey!13965 mapValue!13965))))

(declare-fun b!360113 () Bool)

(assert (=> b!360113 (= e!220487 (not true))))

(declare-fun arrayContainsKey!0 (array!20137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360113 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!12051)

(declare-datatypes ((Unit!11068 0))(
  ( (Unit!11069) )
))
(declare-fun lt!166210 () Unit!11068)

(declare-fun zeroValue!1150 () V!12051)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!57 (array!20137 array!20135 (_ BitVec 32) (_ BitVec 32) V!12051 V!12051 (_ BitVec 64) (_ BitVec 32)) Unit!11068)

(assert (=> b!360113 (= lt!166210 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!57 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun mapIsEmpty!13965 () Bool)

(assert (=> mapIsEmpty!13965 mapRes!13965))

(declare-fun b!360114 () Bool)

(declare-fun res!200284 () Bool)

(assert (=> b!360114 (=> (not res!200284) (not e!220487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20137 (_ BitVec 32)) Bool)

(assert (=> b!360114 (= res!200284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!360115 () Bool)

(declare-fun res!200289 () Bool)

(assert (=> b!360115 (=> (not res!200289) (not e!220487))))

(assert (=> b!360115 (= res!200289 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!360116 () Bool)

(declare-fun tp_is_empty!8305 () Bool)

(assert (=> b!360116 (= e!220489 tp_is_empty!8305)))

(declare-fun res!200285 () Bool)

(assert (=> start!35838 (=> (not res!200285) (not e!220487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35838 (= res!200285 (validMask!0 mask!1842))))

(assert (=> start!35838 e!220487))

(assert (=> start!35838 tp_is_empty!8305))

(assert (=> start!35838 true))

(declare-fun array_inv!7048 (array!20137) Bool)

(assert (=> start!35838 (array_inv!7048 _keys!1456)))

(declare-fun array_inv!7049 (array!20135) Bool)

(assert (=> start!35838 (and (array_inv!7049 _values!1208) e!220491)))

(declare-fun b!360112 () Bool)

(assert (=> b!360112 (= e!220488 tp_is_empty!8305)))

(assert (= (and start!35838 res!200285) b!360108))

(assert (= (and b!360108 res!200286) b!360114))

(assert (= (and b!360114 res!200284) b!360109))

(assert (= (and b!360109 res!200283) b!360106))

(assert (= (and b!360106 res!200287) b!360111))

(assert (= (and b!360111 res!200290) b!360115))

(assert (= (and b!360115 res!200289) b!360110))

(assert (= (and b!360110 res!200288) b!360113))

(assert (= (and b!360107 condMapEmpty!13965) mapIsEmpty!13965))

(assert (= (and b!360107 (not condMapEmpty!13965)) mapNonEmpty!13965))

(get-info :version)

(assert (= (and mapNonEmpty!13965 ((_ is ValueCellFull!3809) mapValue!13965)) b!360112))

(assert (= (and b!360107 ((_ is ValueCellFull!3809) mapDefault!13965)) b!360116))

(assert (= start!35838 b!360107))

(declare-fun m!356835 () Bool)

(assert (=> start!35838 m!356835))

(declare-fun m!356837 () Bool)

(assert (=> start!35838 m!356837))

(declare-fun m!356839 () Bool)

(assert (=> start!35838 m!356839))

(declare-fun m!356841 () Bool)

(assert (=> b!360106 m!356841))

(declare-fun m!356843 () Bool)

(assert (=> b!360109 m!356843))

(declare-fun m!356845 () Bool)

(assert (=> b!360113 m!356845))

(declare-fun m!356847 () Bool)

(assert (=> b!360113 m!356847))

(declare-fun m!356849 () Bool)

(assert (=> b!360114 m!356849))

(declare-fun m!356851 () Bool)

(assert (=> b!360110 m!356851))

(declare-fun m!356853 () Bool)

(assert (=> mapNonEmpty!13965 m!356853))

(declare-fun m!356855 () Bool)

(assert (=> b!360115 m!356855))

(check-sat (not start!35838) (not b!360109) (not mapNonEmpty!13965) (not b!360113) (not b!360114) (not b!360106) (not b!360115) tp_is_empty!8305)
(check-sat)
