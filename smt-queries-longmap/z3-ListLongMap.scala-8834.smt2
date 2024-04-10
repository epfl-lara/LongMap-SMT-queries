; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107230 () Bool)

(assert start!107230)

(declare-fun mapIsEmpty!50959 () Bool)

(declare-fun mapRes!50959 () Bool)

(assert (=> mapIsEmpty!50959 mapRes!50959))

(declare-fun b!1271093 () Bool)

(declare-fun e!724725 () Bool)

(declare-fun e!724726 () Bool)

(assert (=> b!1271093 (= e!724725 (and e!724726 mapRes!50959))))

(declare-fun condMapEmpty!50959 () Bool)

(declare-datatypes ((V!49085 0))(
  ( (V!49086 (val!16534 Int)) )
))
(declare-datatypes ((ValueCell!15606 0))(
  ( (ValueCellFull!15606 (v!19171 V!49085)) (EmptyCell!15606) )
))
(declare-datatypes ((array!83094 0))(
  ( (array!83095 (arr!40084 (Array (_ BitVec 32) ValueCell!15606)) (size!40620 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83094)

(declare-fun mapDefault!50959 () ValueCell!15606)

(assert (=> b!1271093 (= condMapEmpty!50959 (= (arr!40084 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15606)) mapDefault!50959)))))

(declare-fun b!1271094 () Bool)

(declare-fun res!845740 () Bool)

(declare-fun e!724728 () Bool)

(assert (=> b!1271094 (=> (not res!845740) (not e!724728))))

(declare-datatypes ((array!83096 0))(
  ( (array!83097 (arr!40085 (Array (_ BitVec 32) (_ BitVec 64))) (size!40621 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83096)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83096 (_ BitVec 32)) Bool)

(assert (=> b!1271094 (= res!845740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271095 () Bool)

(assert (=> b!1271095 (= e!724728 false)))

(declare-fun lt!574815 () Bool)

(declare-datatypes ((List!28512 0))(
  ( (Nil!28509) (Cons!28508 (h!29717 (_ BitVec 64)) (t!42041 List!28512)) )
))
(declare-fun arrayNoDuplicates!0 (array!83096 (_ BitVec 32) List!28512) Bool)

(assert (=> b!1271095 (= lt!574815 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28509))))

(declare-fun res!845739 () Bool)

(assert (=> start!107230 (=> (not res!845739) (not e!724728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107230 (= res!845739 (validMask!0 mask!1730))))

(assert (=> start!107230 e!724728))

(declare-fun array_inv!30489 (array!83094) Bool)

(assert (=> start!107230 (and (array_inv!30489 _values!1134) e!724725)))

(assert (=> start!107230 true))

(declare-fun array_inv!30490 (array!83096) Bool)

(assert (=> start!107230 (array_inv!30490 _keys!1364)))

(declare-fun mapNonEmpty!50959 () Bool)

(declare-fun tp!97300 () Bool)

(declare-fun e!724724 () Bool)

(assert (=> mapNonEmpty!50959 (= mapRes!50959 (and tp!97300 e!724724))))

(declare-fun mapKey!50959 () (_ BitVec 32))

(declare-fun mapValue!50959 () ValueCell!15606)

(declare-fun mapRest!50959 () (Array (_ BitVec 32) ValueCell!15606))

(assert (=> mapNonEmpty!50959 (= (arr!40084 _values!1134) (store mapRest!50959 mapKey!50959 mapValue!50959))))

(declare-fun b!1271096 () Bool)

(declare-fun res!845741 () Bool)

(assert (=> b!1271096 (=> (not res!845741) (not e!724728))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271096 (= res!845741 (and (= (size!40620 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40621 _keys!1364) (size!40620 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271097 () Bool)

(declare-fun tp_is_empty!32919 () Bool)

(assert (=> b!1271097 (= e!724724 tp_is_empty!32919)))

(declare-fun b!1271098 () Bool)

(assert (=> b!1271098 (= e!724726 tp_is_empty!32919)))

(assert (= (and start!107230 res!845739) b!1271096))

(assert (= (and b!1271096 res!845741) b!1271094))

(assert (= (and b!1271094 res!845740) b!1271095))

(assert (= (and b!1271093 condMapEmpty!50959) mapIsEmpty!50959))

(assert (= (and b!1271093 (not condMapEmpty!50959)) mapNonEmpty!50959))

(get-info :version)

(assert (= (and mapNonEmpty!50959 ((_ is ValueCellFull!15606) mapValue!50959)) b!1271097))

(assert (= (and b!1271093 ((_ is ValueCellFull!15606) mapDefault!50959)) b!1271098))

(assert (= start!107230 b!1271093))

(declare-fun m!1169159 () Bool)

(assert (=> b!1271094 m!1169159))

(declare-fun m!1169161 () Bool)

(assert (=> b!1271095 m!1169161))

(declare-fun m!1169163 () Bool)

(assert (=> start!107230 m!1169163))

(declare-fun m!1169165 () Bool)

(assert (=> start!107230 m!1169165))

(declare-fun m!1169167 () Bool)

(assert (=> start!107230 m!1169167))

(declare-fun m!1169169 () Bool)

(assert (=> mapNonEmpty!50959 m!1169169))

(check-sat (not mapNonEmpty!50959) tp_is_empty!32919 (not start!107230) (not b!1271095) (not b!1271094))
(check-sat)
