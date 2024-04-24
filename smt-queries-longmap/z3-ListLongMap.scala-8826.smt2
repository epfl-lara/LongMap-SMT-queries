; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107404 () Bool)

(assert start!107404)

(declare-fun mapIsEmpty!50884 () Bool)

(declare-fun mapRes!50884 () Bool)

(assert (=> mapIsEmpty!50884 mapRes!50884))

(declare-fun b!1271949 () Bool)

(declare-fun e!725200 () Bool)

(declare-fun tp_is_empty!32869 () Bool)

(assert (=> b!1271949 (= e!725200 tp_is_empty!32869)))

(declare-fun b!1271950 () Bool)

(declare-fun e!725196 () Bool)

(assert (=> b!1271950 (= e!725196 false)))

(declare-fun lt!575224 () Bool)

(declare-datatypes ((array!83025 0))(
  ( (array!83026 (arr!40045 (Array (_ BitVec 32) (_ BitVec 64))) (size!40582 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83025)

(declare-datatypes ((List!28529 0))(
  ( (Nil!28526) (Cons!28525 (h!29743 (_ BitVec 64)) (t!42050 List!28529)) )
))
(declare-fun arrayNoDuplicates!0 (array!83025 (_ BitVec 32) List!28529) Bool)

(assert (=> b!1271950 (= lt!575224 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28526))))

(declare-fun mapNonEmpty!50884 () Bool)

(declare-fun tp!97225 () Bool)

(declare-fun e!725198 () Bool)

(assert (=> mapNonEmpty!50884 (= mapRes!50884 (and tp!97225 e!725198))))

(declare-datatypes ((V!49019 0))(
  ( (V!49020 (val!16509 Int)) )
))
(declare-datatypes ((ValueCell!15581 0))(
  ( (ValueCellFull!15581 (v!19141 V!49019)) (EmptyCell!15581) )
))
(declare-datatypes ((array!83027 0))(
  ( (array!83028 (arr!40046 (Array (_ BitVec 32) ValueCell!15581)) (size!40583 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83027)

(declare-fun mapValue!50884 () ValueCell!15581)

(declare-fun mapKey!50884 () (_ BitVec 32))

(declare-fun mapRest!50884 () (Array (_ BitVec 32) ValueCell!15581))

(assert (=> mapNonEmpty!50884 (= (arr!40046 _values!1134) (store mapRest!50884 mapKey!50884 mapValue!50884))))

(declare-fun b!1271951 () Bool)

(declare-fun e!725197 () Bool)

(assert (=> b!1271951 (= e!725197 (and e!725200 mapRes!50884))))

(declare-fun condMapEmpty!50884 () Bool)

(declare-fun mapDefault!50884 () ValueCell!15581)

(assert (=> b!1271951 (= condMapEmpty!50884 (= (arr!40046 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15581)) mapDefault!50884)))))

(declare-fun b!1271952 () Bool)

(assert (=> b!1271952 (= e!725198 tp_is_empty!32869)))

(declare-fun b!1271953 () Bool)

(declare-fun res!846035 () Bool)

(assert (=> b!1271953 (=> (not res!846035) (not e!725196))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271953 (= res!846035 (and (= (size!40583 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40582 _keys!1364) (size!40583 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271948 () Bool)

(declare-fun res!846036 () Bool)

(assert (=> b!1271948 (=> (not res!846036) (not e!725196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83025 (_ BitVec 32)) Bool)

(assert (=> b!1271948 (= res!846036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846034 () Bool)

(assert (=> start!107404 (=> (not res!846034) (not e!725196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107404 (= res!846034 (validMask!0 mask!1730))))

(assert (=> start!107404 e!725196))

(declare-fun array_inv!30629 (array!83027) Bool)

(assert (=> start!107404 (and (array_inv!30629 _values!1134) e!725197)))

(assert (=> start!107404 true))

(declare-fun array_inv!30630 (array!83025) Bool)

(assert (=> start!107404 (array_inv!30630 _keys!1364)))

(assert (= (and start!107404 res!846034) b!1271953))

(assert (= (and b!1271953 res!846035) b!1271948))

(assert (= (and b!1271948 res!846036) b!1271950))

(assert (= (and b!1271951 condMapEmpty!50884) mapIsEmpty!50884))

(assert (= (and b!1271951 (not condMapEmpty!50884)) mapNonEmpty!50884))

(get-info :version)

(assert (= (and mapNonEmpty!50884 ((_ is ValueCellFull!15581) mapValue!50884)) b!1271952))

(assert (= (and b!1271951 ((_ is ValueCellFull!15581) mapDefault!50884)) b!1271949))

(assert (= start!107404 b!1271951))

(declare-fun m!1170471 () Bool)

(assert (=> b!1271950 m!1170471))

(declare-fun m!1170473 () Bool)

(assert (=> mapNonEmpty!50884 m!1170473))

(declare-fun m!1170475 () Bool)

(assert (=> b!1271948 m!1170475))

(declare-fun m!1170477 () Bool)

(assert (=> start!107404 m!1170477))

(declare-fun m!1170479 () Bool)

(assert (=> start!107404 m!1170479))

(declare-fun m!1170481 () Bool)

(assert (=> start!107404 m!1170481))

(check-sat (not b!1271950) (not start!107404) (not b!1271948) (not mapNonEmpty!50884) tp_is_empty!32869)
(check-sat)
