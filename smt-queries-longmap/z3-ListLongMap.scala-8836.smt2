; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107240 () Bool)

(assert start!107240)

(declare-fun b!1271119 () Bool)

(declare-fun res!845759 () Bool)

(declare-fun e!724771 () Bool)

(assert (=> b!1271119 (=> (not res!845759) (not e!724771))))

(declare-datatypes ((V!49099 0))(
  ( (V!49100 (val!16539 Int)) )
))
(declare-datatypes ((ValueCell!15611 0))(
  ( (ValueCellFull!15611 (v!19175 V!49099)) (EmptyCell!15611) )
))
(declare-datatypes ((array!83025 0))(
  ( (array!83026 (arr!40050 (Array (_ BitVec 32) ValueCell!15611)) (size!40588 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83025)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83027 0))(
  ( (array!83028 (arr!40051 (Array (_ BitVec 32) (_ BitVec 64))) (size!40589 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83027)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271119 (= res!845759 (and (= (size!40588 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40589 _keys!1364) (size!40588 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271120 () Bool)

(declare-fun e!724770 () Bool)

(declare-fun tp_is_empty!32929 () Bool)

(assert (=> b!1271120 (= e!724770 tp_is_empty!32929)))

(declare-fun mapIsEmpty!50974 () Bool)

(declare-fun mapRes!50974 () Bool)

(assert (=> mapIsEmpty!50974 mapRes!50974))

(declare-fun b!1271121 () Bool)

(declare-fun res!845757 () Bool)

(assert (=> b!1271121 (=> (not res!845757) (not e!724771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83027 (_ BitVec 32)) Bool)

(assert (=> b!1271121 (= res!845757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271122 () Bool)

(declare-fun e!724772 () Bool)

(assert (=> b!1271122 (= e!724772 tp_is_empty!32929)))

(declare-fun res!845758 () Bool)

(assert (=> start!107240 (=> (not res!845758) (not e!724771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107240 (= res!845758 (validMask!0 mask!1730))))

(assert (=> start!107240 e!724771))

(declare-fun e!724773 () Bool)

(declare-fun array_inv!30621 (array!83025) Bool)

(assert (=> start!107240 (and (array_inv!30621 _values!1134) e!724773)))

(assert (=> start!107240 true))

(declare-fun array_inv!30622 (array!83027) Bool)

(assert (=> start!107240 (array_inv!30622 _keys!1364)))

(declare-fun mapNonEmpty!50974 () Bool)

(declare-fun tp!97316 () Bool)

(assert (=> mapNonEmpty!50974 (= mapRes!50974 (and tp!97316 e!724770))))

(declare-fun mapRest!50974 () (Array (_ BitVec 32) ValueCell!15611))

(declare-fun mapValue!50974 () ValueCell!15611)

(declare-fun mapKey!50974 () (_ BitVec 32))

(assert (=> mapNonEmpty!50974 (= (arr!40050 _values!1134) (store mapRest!50974 mapKey!50974 mapValue!50974))))

(declare-fun b!1271123 () Bool)

(assert (=> b!1271123 (= e!724773 (and e!724772 mapRes!50974))))

(declare-fun condMapEmpty!50974 () Bool)

(declare-fun mapDefault!50974 () ValueCell!15611)

(assert (=> b!1271123 (= condMapEmpty!50974 (= (arr!40050 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15611)) mapDefault!50974)))))

(declare-fun b!1271124 () Bool)

(assert (=> b!1271124 (= e!724771 false)))

(declare-fun lt!574652 () Bool)

(declare-datatypes ((List!28594 0))(
  ( (Nil!28591) (Cons!28590 (h!29799 (_ BitVec 64)) (t!42115 List!28594)) )
))
(declare-fun arrayNoDuplicates!0 (array!83027 (_ BitVec 32) List!28594) Bool)

(assert (=> b!1271124 (= lt!574652 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28591))))

(assert (= (and start!107240 res!845758) b!1271119))

(assert (= (and b!1271119 res!845759) b!1271121))

(assert (= (and b!1271121 res!845757) b!1271124))

(assert (= (and b!1271123 condMapEmpty!50974) mapIsEmpty!50974))

(assert (= (and b!1271123 (not condMapEmpty!50974)) mapNonEmpty!50974))

(get-info :version)

(assert (= (and mapNonEmpty!50974 ((_ is ValueCellFull!15611) mapValue!50974)) b!1271120))

(assert (= (and b!1271123 ((_ is ValueCellFull!15611) mapDefault!50974)) b!1271122))

(assert (= start!107240 b!1271123))

(declare-fun m!1168719 () Bool)

(assert (=> b!1271121 m!1168719))

(declare-fun m!1168721 () Bool)

(assert (=> start!107240 m!1168721))

(declare-fun m!1168723 () Bool)

(assert (=> start!107240 m!1168723))

(declare-fun m!1168725 () Bool)

(assert (=> start!107240 m!1168725))

(declare-fun m!1168727 () Bool)

(assert (=> mapNonEmpty!50974 m!1168727))

(declare-fun m!1168729 () Bool)

(assert (=> b!1271124 m!1168729))

(check-sat (not b!1271121) (not b!1271124) tp_is_empty!32929 (not start!107240) (not mapNonEmpty!50974))
(check-sat)
