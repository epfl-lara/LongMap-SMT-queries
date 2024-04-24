; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107536 () Bool)

(assert start!107536)

(declare-fun b!1273136 () Bool)

(declare-fun e!726187 () Bool)

(assert (=> b!1273136 (= e!726187 false)))

(declare-fun lt!575422 () Bool)

(declare-datatypes ((array!83267 0))(
  ( (array!83268 (arr!40166 (Array (_ BitVec 32) (_ BitVec 64))) (size!40703 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83267)

(declare-datatypes ((List!28567 0))(
  ( (Nil!28564) (Cons!28563 (h!29781 (_ BitVec 64)) (t!42088 List!28567)) )
))
(declare-fun arrayNoDuplicates!0 (array!83267 (_ BitVec 32) List!28567) Bool)

(assert (=> b!1273136 (= lt!575422 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28564))))

(declare-fun b!1273137 () Bool)

(declare-fun res!846629 () Bool)

(assert (=> b!1273137 (=> (not res!846629) (not e!726187))))

(declare-datatypes ((V!49195 0))(
  ( (V!49196 (val!16575 Int)) )
))
(declare-datatypes ((ValueCell!15647 0))(
  ( (ValueCellFull!15647 (v!19207 V!49195)) (EmptyCell!15647) )
))
(declare-datatypes ((array!83269 0))(
  ( (array!83270 (arr!40167 (Array (_ BitVec 32) ValueCell!15647)) (size!40704 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83269)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1273137 (= res!846629 (and (= (size!40704 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40703 _keys!1364) (size!40704 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1273138 () Bool)

(declare-fun e!726188 () Bool)

(declare-fun tp_is_empty!33001 () Bool)

(assert (=> b!1273138 (= e!726188 tp_is_empty!33001)))

(declare-fun b!1273139 () Bool)

(declare-fun e!726189 () Bool)

(declare-fun e!726186 () Bool)

(declare-fun mapRes!51082 () Bool)

(assert (=> b!1273139 (= e!726189 (and e!726186 mapRes!51082))))

(declare-fun condMapEmpty!51082 () Bool)

(declare-fun mapDefault!51082 () ValueCell!15647)

(assert (=> b!1273139 (= condMapEmpty!51082 (= (arr!40167 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15647)) mapDefault!51082)))))

(declare-fun mapNonEmpty!51082 () Bool)

(declare-fun tp!97423 () Bool)

(assert (=> mapNonEmpty!51082 (= mapRes!51082 (and tp!97423 e!726188))))

(declare-fun mapValue!51082 () ValueCell!15647)

(declare-fun mapKey!51082 () (_ BitVec 32))

(declare-fun mapRest!51082 () (Array (_ BitVec 32) ValueCell!15647))

(assert (=> mapNonEmpty!51082 (= (arr!40167 _values!1134) (store mapRest!51082 mapKey!51082 mapValue!51082))))

(declare-fun b!1273140 () Bool)

(assert (=> b!1273140 (= e!726186 tp_is_empty!33001)))

(declare-fun b!1273141 () Bool)

(declare-fun res!846628 () Bool)

(assert (=> b!1273141 (=> (not res!846628) (not e!726187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83267 (_ BitVec 32)) Bool)

(assert (=> b!1273141 (= res!846628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!51082 () Bool)

(assert (=> mapIsEmpty!51082 mapRes!51082))

(declare-fun res!846630 () Bool)

(assert (=> start!107536 (=> (not res!846630) (not e!726187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107536 (= res!846630 (validMask!0 mask!1730))))

(assert (=> start!107536 e!726187))

(declare-fun array_inv!30713 (array!83269) Bool)

(assert (=> start!107536 (and (array_inv!30713 _values!1134) e!726189)))

(assert (=> start!107536 true))

(declare-fun array_inv!30714 (array!83267) Bool)

(assert (=> start!107536 (array_inv!30714 _keys!1364)))

(assert (= (and start!107536 res!846630) b!1273137))

(assert (= (and b!1273137 res!846629) b!1273141))

(assert (= (and b!1273141 res!846628) b!1273136))

(assert (= (and b!1273139 condMapEmpty!51082) mapIsEmpty!51082))

(assert (= (and b!1273139 (not condMapEmpty!51082)) mapNonEmpty!51082))

(get-info :version)

(assert (= (and mapNonEmpty!51082 ((_ is ValueCellFull!15647) mapValue!51082)) b!1273138))

(assert (= (and b!1273139 ((_ is ValueCellFull!15647) mapDefault!51082)) b!1273140))

(assert (= start!107536 b!1273139))

(declare-fun m!1171263 () Bool)

(assert (=> b!1273136 m!1171263))

(declare-fun m!1171265 () Bool)

(assert (=> mapNonEmpty!51082 m!1171265))

(declare-fun m!1171267 () Bool)

(assert (=> b!1273141 m!1171267))

(declare-fun m!1171269 () Bool)

(assert (=> start!107536 m!1171269))

(declare-fun m!1171271 () Bool)

(assert (=> start!107536 m!1171271))

(declare-fun m!1171273 () Bool)

(assert (=> start!107536 m!1171273))

(check-sat (not mapNonEmpty!51082) tp_is_empty!33001 (not start!107536) (not b!1273141) (not b!1273136))
(check-sat)
