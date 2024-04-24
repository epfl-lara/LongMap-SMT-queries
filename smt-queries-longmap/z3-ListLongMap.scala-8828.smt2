; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107416 () Bool)

(assert start!107416)

(declare-fun mapIsEmpty!50902 () Bool)

(declare-fun mapRes!50902 () Bool)

(assert (=> mapIsEmpty!50902 mapRes!50902))

(declare-fun b!1272056 () Bool)

(declare-fun res!846090 () Bool)

(declare-fun e!725287 () Bool)

(assert (=> b!1272056 (=> (not res!846090) (not e!725287))))

(declare-datatypes ((array!83047 0))(
  ( (array!83048 (arr!40056 (Array (_ BitVec 32) (_ BitVec 64))) (size!40593 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83047)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83047 (_ BitVec 32)) Bool)

(assert (=> b!1272056 (= res!846090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272057 () Bool)

(declare-fun res!846088 () Bool)

(assert (=> b!1272057 (=> (not res!846088) (not e!725287))))

(declare-datatypes ((V!49035 0))(
  ( (V!49036 (val!16515 Int)) )
))
(declare-datatypes ((ValueCell!15587 0))(
  ( (ValueCellFull!15587 (v!19147 V!49035)) (EmptyCell!15587) )
))
(declare-datatypes ((array!83049 0))(
  ( (array!83050 (arr!40057 (Array (_ BitVec 32) ValueCell!15587)) (size!40594 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83049)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272057 (= res!846088 (and (= (size!40594 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40593 _keys!1364) (size!40594 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272058 () Bool)

(declare-fun e!725289 () Bool)

(declare-fun e!725290 () Bool)

(assert (=> b!1272058 (= e!725289 (and e!725290 mapRes!50902))))

(declare-fun condMapEmpty!50902 () Bool)

(declare-fun mapDefault!50902 () ValueCell!15587)

(assert (=> b!1272058 (= condMapEmpty!50902 (= (arr!40057 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15587)) mapDefault!50902)))))

(declare-fun b!1272059 () Bool)

(assert (=> b!1272059 (= e!725287 false)))

(declare-fun lt!575242 () Bool)

(declare-datatypes ((List!28532 0))(
  ( (Nil!28529) (Cons!28528 (h!29746 (_ BitVec 64)) (t!42053 List!28532)) )
))
(declare-fun arrayNoDuplicates!0 (array!83047 (_ BitVec 32) List!28532) Bool)

(assert (=> b!1272059 (= lt!575242 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28529))))

(declare-fun res!846089 () Bool)

(assert (=> start!107416 (=> (not res!846089) (not e!725287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107416 (= res!846089 (validMask!0 mask!1730))))

(assert (=> start!107416 e!725287))

(declare-fun array_inv!30639 (array!83049) Bool)

(assert (=> start!107416 (and (array_inv!30639 _values!1134) e!725289)))

(assert (=> start!107416 true))

(declare-fun array_inv!30640 (array!83047) Bool)

(assert (=> start!107416 (array_inv!30640 _keys!1364)))

(declare-fun b!1272060 () Bool)

(declare-fun tp_is_empty!32881 () Bool)

(assert (=> b!1272060 (= e!725290 tp_is_empty!32881)))

(declare-fun mapNonEmpty!50902 () Bool)

(declare-fun tp!97243 () Bool)

(declare-fun e!725286 () Bool)

(assert (=> mapNonEmpty!50902 (= mapRes!50902 (and tp!97243 e!725286))))

(declare-fun mapValue!50902 () ValueCell!15587)

(declare-fun mapKey!50902 () (_ BitVec 32))

(declare-fun mapRest!50902 () (Array (_ BitVec 32) ValueCell!15587))

(assert (=> mapNonEmpty!50902 (= (arr!40057 _values!1134) (store mapRest!50902 mapKey!50902 mapValue!50902))))

(declare-fun b!1272061 () Bool)

(assert (=> b!1272061 (= e!725286 tp_is_empty!32881)))

(assert (= (and start!107416 res!846089) b!1272057))

(assert (= (and b!1272057 res!846088) b!1272056))

(assert (= (and b!1272056 res!846090) b!1272059))

(assert (= (and b!1272058 condMapEmpty!50902) mapIsEmpty!50902))

(assert (= (and b!1272058 (not condMapEmpty!50902)) mapNonEmpty!50902))

(get-info :version)

(assert (= (and mapNonEmpty!50902 ((_ is ValueCellFull!15587) mapValue!50902)) b!1272061))

(assert (= (and b!1272058 ((_ is ValueCellFull!15587) mapDefault!50902)) b!1272060))

(assert (= start!107416 b!1272058))

(declare-fun m!1170543 () Bool)

(assert (=> b!1272056 m!1170543))

(declare-fun m!1170545 () Bool)

(assert (=> b!1272059 m!1170545))

(declare-fun m!1170547 () Bool)

(assert (=> start!107416 m!1170547))

(declare-fun m!1170549 () Bool)

(assert (=> start!107416 m!1170549))

(declare-fun m!1170551 () Bool)

(assert (=> start!107416 m!1170551))

(declare-fun m!1170553 () Bool)

(assert (=> mapNonEmpty!50902 m!1170553))

(check-sat (not mapNonEmpty!50902) (not b!1272056) (not start!107416) (not b!1272059) tp_is_empty!32881)
(check-sat)
