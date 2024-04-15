; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107258 () Bool)

(assert start!107258)

(declare-fun b!1271281 () Bool)

(declare-fun e!724908 () Bool)

(assert (=> b!1271281 (= e!724908 false)))

(declare-fun lt!574679 () Bool)

(declare-datatypes ((array!83059 0))(
  ( (array!83060 (arr!40067 (Array (_ BitVec 32) (_ BitVec 64))) (size!40605 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83059)

(declare-datatypes ((List!28601 0))(
  ( (Nil!28598) (Cons!28597 (h!29806 (_ BitVec 64)) (t!42122 List!28601)) )
))
(declare-fun arrayNoDuplicates!0 (array!83059 (_ BitVec 32) List!28601) Bool)

(assert (=> b!1271281 (= lt!574679 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28598))))

(declare-fun b!1271282 () Bool)

(declare-fun e!724909 () Bool)

(declare-fun e!724905 () Bool)

(declare-fun mapRes!51001 () Bool)

(assert (=> b!1271282 (= e!724909 (and e!724905 mapRes!51001))))

(declare-fun condMapEmpty!51001 () Bool)

(declare-datatypes ((V!49123 0))(
  ( (V!49124 (val!16548 Int)) )
))
(declare-datatypes ((ValueCell!15620 0))(
  ( (ValueCellFull!15620 (v!19184 V!49123)) (EmptyCell!15620) )
))
(declare-datatypes ((array!83061 0))(
  ( (array!83062 (arr!40068 (Array (_ BitVec 32) ValueCell!15620)) (size!40606 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83061)

(declare-fun mapDefault!51001 () ValueCell!15620)

(assert (=> b!1271282 (= condMapEmpty!51001 (= (arr!40068 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15620)) mapDefault!51001)))))

(declare-fun b!1271283 () Bool)

(declare-fun e!724907 () Bool)

(declare-fun tp_is_empty!32947 () Bool)

(assert (=> b!1271283 (= e!724907 tp_is_empty!32947)))

(declare-fun mapIsEmpty!51001 () Bool)

(assert (=> mapIsEmpty!51001 mapRes!51001))

(declare-fun res!845839 () Bool)

(assert (=> start!107258 (=> (not res!845839) (not e!724908))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107258 (= res!845839 (validMask!0 mask!1730))))

(assert (=> start!107258 e!724908))

(declare-fun array_inv!30631 (array!83061) Bool)

(assert (=> start!107258 (and (array_inv!30631 _values!1134) e!724909)))

(assert (=> start!107258 true))

(declare-fun array_inv!30632 (array!83059) Bool)

(assert (=> start!107258 (array_inv!30632 _keys!1364)))

(declare-fun b!1271284 () Bool)

(declare-fun res!845840 () Bool)

(assert (=> b!1271284 (=> (not res!845840) (not e!724908))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271284 (= res!845840 (and (= (size!40606 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40605 _keys!1364) (size!40606 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271285 () Bool)

(declare-fun res!845838 () Bool)

(assert (=> b!1271285 (=> (not res!845838) (not e!724908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83059 (_ BitVec 32)) Bool)

(assert (=> b!1271285 (= res!845838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!51001 () Bool)

(declare-fun tp!97343 () Bool)

(assert (=> mapNonEmpty!51001 (= mapRes!51001 (and tp!97343 e!724907))))

(declare-fun mapValue!51001 () ValueCell!15620)

(declare-fun mapRest!51001 () (Array (_ BitVec 32) ValueCell!15620))

(declare-fun mapKey!51001 () (_ BitVec 32))

(assert (=> mapNonEmpty!51001 (= (arr!40068 _values!1134) (store mapRest!51001 mapKey!51001 mapValue!51001))))

(declare-fun b!1271286 () Bool)

(assert (=> b!1271286 (= e!724905 tp_is_empty!32947)))

(assert (= (and start!107258 res!845839) b!1271284))

(assert (= (and b!1271284 res!845840) b!1271285))

(assert (= (and b!1271285 res!845838) b!1271281))

(assert (= (and b!1271282 condMapEmpty!51001) mapIsEmpty!51001))

(assert (= (and b!1271282 (not condMapEmpty!51001)) mapNonEmpty!51001))

(get-info :version)

(assert (= (and mapNonEmpty!51001 ((_ is ValueCellFull!15620) mapValue!51001)) b!1271283))

(assert (= (and b!1271282 ((_ is ValueCellFull!15620) mapDefault!51001)) b!1271286))

(assert (= start!107258 b!1271282))

(declare-fun m!1168827 () Bool)

(assert (=> b!1271281 m!1168827))

(declare-fun m!1168829 () Bool)

(assert (=> start!107258 m!1168829))

(declare-fun m!1168831 () Bool)

(assert (=> start!107258 m!1168831))

(declare-fun m!1168833 () Bool)

(assert (=> start!107258 m!1168833))

(declare-fun m!1168835 () Bool)

(assert (=> b!1271285 m!1168835))

(declare-fun m!1168837 () Bool)

(assert (=> mapNonEmpty!51001 m!1168837))

(check-sat (not start!107258) tp_is_empty!32947 (not b!1271281) (not b!1271285) (not mapNonEmpty!51001))
(check-sat)
