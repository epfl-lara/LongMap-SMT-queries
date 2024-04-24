; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107422 () Bool)

(assert start!107422)

(declare-fun b!1272110 () Bool)

(declare-fun res!846115 () Bool)

(declare-fun e!725333 () Bool)

(assert (=> b!1272110 (=> (not res!846115) (not e!725333))))

(declare-datatypes ((V!49043 0))(
  ( (V!49044 (val!16518 Int)) )
))
(declare-datatypes ((ValueCell!15590 0))(
  ( (ValueCellFull!15590 (v!19150 V!49043)) (EmptyCell!15590) )
))
(declare-datatypes ((array!83059 0))(
  ( (array!83060 (arr!40062 (Array (_ BitVec 32) ValueCell!15590)) (size!40599 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83059)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83061 0))(
  ( (array!83062 (arr!40063 (Array (_ BitVec 32) (_ BitVec 64))) (size!40600 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83061)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272110 (= res!846115 (and (= (size!40599 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40600 _keys!1364) (size!40599 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50911 () Bool)

(declare-fun mapRes!50911 () Bool)

(assert (=> mapIsEmpty!50911 mapRes!50911))

(declare-fun b!1272111 () Bool)

(assert (=> b!1272111 (= e!725333 false)))

(declare-fun lt!575251 () Bool)

(declare-datatypes ((List!28533 0))(
  ( (Nil!28530) (Cons!28529 (h!29747 (_ BitVec 64)) (t!42054 List!28533)) )
))
(declare-fun arrayNoDuplicates!0 (array!83061 (_ BitVec 32) List!28533) Bool)

(assert (=> b!1272111 (= lt!575251 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28530))))

(declare-fun b!1272112 () Bool)

(declare-fun e!725332 () Bool)

(declare-fun tp_is_empty!32887 () Bool)

(assert (=> b!1272112 (= e!725332 tp_is_empty!32887)))

(declare-fun b!1272113 () Bool)

(declare-fun e!725334 () Bool)

(assert (=> b!1272113 (= e!725334 (and e!725332 mapRes!50911))))

(declare-fun condMapEmpty!50911 () Bool)

(declare-fun mapDefault!50911 () ValueCell!15590)

(assert (=> b!1272113 (= condMapEmpty!50911 (= (arr!40062 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15590)) mapDefault!50911)))))

(declare-fun b!1272114 () Bool)

(declare-fun res!846116 () Bool)

(assert (=> b!1272114 (=> (not res!846116) (not e!725333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83061 (_ BitVec 32)) Bool)

(assert (=> b!1272114 (= res!846116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272115 () Bool)

(declare-fun e!725335 () Bool)

(assert (=> b!1272115 (= e!725335 tp_is_empty!32887)))

(declare-fun mapNonEmpty!50911 () Bool)

(declare-fun tp!97252 () Bool)

(assert (=> mapNonEmpty!50911 (= mapRes!50911 (and tp!97252 e!725335))))

(declare-fun mapRest!50911 () (Array (_ BitVec 32) ValueCell!15590))

(declare-fun mapKey!50911 () (_ BitVec 32))

(declare-fun mapValue!50911 () ValueCell!15590)

(assert (=> mapNonEmpty!50911 (= (arr!40062 _values!1134) (store mapRest!50911 mapKey!50911 mapValue!50911))))

(declare-fun res!846117 () Bool)

(assert (=> start!107422 (=> (not res!846117) (not e!725333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107422 (= res!846117 (validMask!0 mask!1730))))

(assert (=> start!107422 e!725333))

(declare-fun array_inv!30645 (array!83059) Bool)

(assert (=> start!107422 (and (array_inv!30645 _values!1134) e!725334)))

(assert (=> start!107422 true))

(declare-fun array_inv!30646 (array!83061) Bool)

(assert (=> start!107422 (array_inv!30646 _keys!1364)))

(assert (= (and start!107422 res!846117) b!1272110))

(assert (= (and b!1272110 res!846115) b!1272114))

(assert (= (and b!1272114 res!846116) b!1272111))

(assert (= (and b!1272113 condMapEmpty!50911) mapIsEmpty!50911))

(assert (= (and b!1272113 (not condMapEmpty!50911)) mapNonEmpty!50911))

(get-info :version)

(assert (= (and mapNonEmpty!50911 ((_ is ValueCellFull!15590) mapValue!50911)) b!1272115))

(assert (= (and b!1272113 ((_ is ValueCellFull!15590) mapDefault!50911)) b!1272112))

(assert (= start!107422 b!1272113))

(declare-fun m!1170579 () Bool)

(assert (=> b!1272111 m!1170579))

(declare-fun m!1170581 () Bool)

(assert (=> b!1272114 m!1170581))

(declare-fun m!1170583 () Bool)

(assert (=> mapNonEmpty!50911 m!1170583))

(declare-fun m!1170585 () Bool)

(assert (=> start!107422 m!1170585))

(declare-fun m!1170587 () Bool)

(assert (=> start!107422 m!1170587))

(declare-fun m!1170589 () Bool)

(assert (=> start!107422 m!1170589))

(check-sat tp_is_empty!32887 (not b!1272114) (not b!1272111) (not mapNonEmpty!50911) (not start!107422))
(check-sat)
