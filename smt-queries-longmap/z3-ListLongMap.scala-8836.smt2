; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107464 () Bool)

(assert start!107464)

(declare-fun b!1272488 () Bool)

(declare-fun res!846304 () Bool)

(declare-fun e!725649 () Bool)

(assert (=> b!1272488 (=> (not res!846304) (not e!725649))))

(declare-datatypes ((V!49099 0))(
  ( (V!49100 (val!16539 Int)) )
))
(declare-datatypes ((ValueCell!15611 0))(
  ( (ValueCellFull!15611 (v!19171 V!49099)) (EmptyCell!15611) )
))
(declare-datatypes ((array!83139 0))(
  ( (array!83140 (arr!40102 (Array (_ BitVec 32) ValueCell!15611)) (size!40639 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83139)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83141 0))(
  ( (array!83142 (arr!40103 (Array (_ BitVec 32) (_ BitVec 64))) (size!40640 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83141)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272488 (= res!846304 (and (= (size!40639 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40640 _keys!1364) (size!40639 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272489 () Bool)

(declare-fun e!725646 () Bool)

(declare-fun tp_is_empty!32929 () Bool)

(assert (=> b!1272489 (= e!725646 tp_is_empty!32929)))

(declare-fun mapIsEmpty!50974 () Bool)

(declare-fun mapRes!50974 () Bool)

(assert (=> mapIsEmpty!50974 mapRes!50974))

(declare-fun b!1272490 () Bool)

(assert (=> b!1272490 (= e!725649 false)))

(declare-fun lt!575314 () Bool)

(declare-datatypes ((List!28547 0))(
  ( (Nil!28544) (Cons!28543 (h!29761 (_ BitVec 64)) (t!42068 List!28547)) )
))
(declare-fun arrayNoDuplicates!0 (array!83141 (_ BitVec 32) List!28547) Bool)

(assert (=> b!1272490 (= lt!575314 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28544))))

(declare-fun b!1272491 () Bool)

(declare-fun e!725648 () Bool)

(assert (=> b!1272491 (= e!725648 tp_is_empty!32929)))

(declare-fun b!1272492 () Bool)

(declare-fun e!725650 () Bool)

(assert (=> b!1272492 (= e!725650 (and e!725648 mapRes!50974))))

(declare-fun condMapEmpty!50974 () Bool)

(declare-fun mapDefault!50974 () ValueCell!15611)

(assert (=> b!1272492 (= condMapEmpty!50974 (= (arr!40102 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15611)) mapDefault!50974)))))

(declare-fun res!846305 () Bool)

(assert (=> start!107464 (=> (not res!846305) (not e!725649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107464 (= res!846305 (validMask!0 mask!1730))))

(assert (=> start!107464 e!725649))

(declare-fun array_inv!30669 (array!83139) Bool)

(assert (=> start!107464 (and (array_inv!30669 _values!1134) e!725650)))

(assert (=> start!107464 true))

(declare-fun array_inv!30670 (array!83141) Bool)

(assert (=> start!107464 (array_inv!30670 _keys!1364)))

(declare-fun mapNonEmpty!50974 () Bool)

(declare-fun tp!97315 () Bool)

(assert (=> mapNonEmpty!50974 (= mapRes!50974 (and tp!97315 e!725646))))

(declare-fun mapRest!50974 () (Array (_ BitVec 32) ValueCell!15611))

(declare-fun mapKey!50974 () (_ BitVec 32))

(declare-fun mapValue!50974 () ValueCell!15611)

(assert (=> mapNonEmpty!50974 (= (arr!40102 _values!1134) (store mapRest!50974 mapKey!50974 mapValue!50974))))

(declare-fun b!1272493 () Bool)

(declare-fun res!846306 () Bool)

(assert (=> b!1272493 (=> (not res!846306) (not e!725649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83141 (_ BitVec 32)) Bool)

(assert (=> b!1272493 (= res!846306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107464 res!846305) b!1272488))

(assert (= (and b!1272488 res!846304) b!1272493))

(assert (= (and b!1272493 res!846306) b!1272490))

(assert (= (and b!1272492 condMapEmpty!50974) mapIsEmpty!50974))

(assert (= (and b!1272492 (not condMapEmpty!50974)) mapNonEmpty!50974))

(get-info :version)

(assert (= (and mapNonEmpty!50974 ((_ is ValueCellFull!15611) mapValue!50974)) b!1272489))

(assert (= (and b!1272492 ((_ is ValueCellFull!15611) mapDefault!50974)) b!1272491))

(assert (= start!107464 b!1272492))

(declare-fun m!1170831 () Bool)

(assert (=> b!1272490 m!1170831))

(declare-fun m!1170833 () Bool)

(assert (=> start!107464 m!1170833))

(declare-fun m!1170835 () Bool)

(assert (=> start!107464 m!1170835))

(declare-fun m!1170837 () Bool)

(assert (=> start!107464 m!1170837))

(declare-fun m!1170839 () Bool)

(assert (=> mapNonEmpty!50974 m!1170839))

(declare-fun m!1170841 () Bool)

(assert (=> b!1272493 m!1170841))

(check-sat (not start!107464) tp_is_empty!32929 (not b!1272490) (not mapNonEmpty!50974) (not b!1272493))
(check-sat)
