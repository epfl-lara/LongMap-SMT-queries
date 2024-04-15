; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107150 () Bool)

(assert start!107150)

(declare-fun res!845353 () Bool)

(declare-fun e!724095 () Bool)

(assert (=> start!107150 (=> (not res!845353) (not e!724095))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107150 (= res!845353 (validMask!0 mask!1730))))

(assert (=> start!107150 e!724095))

(declare-datatypes ((V!48979 0))(
  ( (V!48980 (val!16494 Int)) )
))
(declare-datatypes ((ValueCell!15566 0))(
  ( (ValueCellFull!15566 (v!19130 V!48979)) (EmptyCell!15566) )
))
(declare-datatypes ((array!82851 0))(
  ( (array!82852 (arr!39963 (Array (_ BitVec 32) ValueCell!15566)) (size!40501 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82851)

(declare-fun e!724097 () Bool)

(declare-fun array_inv!30561 (array!82851) Bool)

(assert (=> start!107150 (and (array_inv!30561 _values!1134) e!724097)))

(assert (=> start!107150 true))

(declare-datatypes ((array!82853 0))(
  ( (array!82854 (arr!39964 (Array (_ BitVec 32) (_ BitVec 64))) (size!40502 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82853)

(declare-fun array_inv!30562 (array!82853) Bool)

(assert (=> start!107150 (array_inv!30562 _keys!1364)))

(declare-fun b!1270309 () Bool)

(declare-fun e!724099 () Bool)

(declare-fun tp_is_empty!32839 () Bool)

(assert (=> b!1270309 (= e!724099 tp_is_empty!32839)))

(declare-fun mapIsEmpty!50839 () Bool)

(declare-fun mapRes!50839 () Bool)

(assert (=> mapIsEmpty!50839 mapRes!50839))

(declare-fun b!1270310 () Bool)

(assert (=> b!1270310 (= e!724095 false)))

(declare-fun lt!574517 () Bool)

(declare-datatypes ((List!28560 0))(
  ( (Nil!28557) (Cons!28556 (h!29765 (_ BitVec 64)) (t!42081 List!28560)) )
))
(declare-fun arrayNoDuplicates!0 (array!82853 (_ BitVec 32) List!28560) Bool)

(assert (=> b!1270310 (= lt!574517 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28557))))

(declare-fun b!1270311 () Bool)

(declare-fun e!724098 () Bool)

(assert (=> b!1270311 (= e!724097 (and e!724098 mapRes!50839))))

(declare-fun condMapEmpty!50839 () Bool)

(declare-fun mapDefault!50839 () ValueCell!15566)

(assert (=> b!1270311 (= condMapEmpty!50839 (= (arr!39963 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15566)) mapDefault!50839)))))

(declare-fun b!1270312 () Bool)

(declare-fun res!845354 () Bool)

(assert (=> b!1270312 (=> (not res!845354) (not e!724095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82853 (_ BitVec 32)) Bool)

(assert (=> b!1270312 (= res!845354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270313 () Bool)

(assert (=> b!1270313 (= e!724098 tp_is_empty!32839)))

(declare-fun b!1270314 () Bool)

(declare-fun res!845352 () Bool)

(assert (=> b!1270314 (=> (not res!845352) (not e!724095))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270314 (= res!845352 (and (= (size!40501 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40502 _keys!1364) (size!40501 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50839 () Bool)

(declare-fun tp!97181 () Bool)

(assert (=> mapNonEmpty!50839 (= mapRes!50839 (and tp!97181 e!724099))))

(declare-fun mapKey!50839 () (_ BitVec 32))

(declare-fun mapRest!50839 () (Array (_ BitVec 32) ValueCell!15566))

(declare-fun mapValue!50839 () ValueCell!15566)

(assert (=> mapNonEmpty!50839 (= (arr!39963 _values!1134) (store mapRest!50839 mapKey!50839 mapValue!50839))))

(assert (= (and start!107150 res!845353) b!1270314))

(assert (= (and b!1270314 res!845352) b!1270312))

(assert (= (and b!1270312 res!845354) b!1270310))

(assert (= (and b!1270311 condMapEmpty!50839) mapIsEmpty!50839))

(assert (= (and b!1270311 (not condMapEmpty!50839)) mapNonEmpty!50839))

(get-info :version)

(assert (= (and mapNonEmpty!50839 ((_ is ValueCellFull!15566) mapValue!50839)) b!1270309))

(assert (= (and b!1270311 ((_ is ValueCellFull!15566) mapDefault!50839)) b!1270313))

(assert (= start!107150 b!1270311))

(declare-fun m!1168179 () Bool)

(assert (=> start!107150 m!1168179))

(declare-fun m!1168181 () Bool)

(assert (=> start!107150 m!1168181))

(declare-fun m!1168183 () Bool)

(assert (=> start!107150 m!1168183))

(declare-fun m!1168185 () Bool)

(assert (=> b!1270310 m!1168185))

(declare-fun m!1168187 () Bool)

(assert (=> b!1270312 m!1168187))

(declare-fun m!1168189 () Bool)

(assert (=> mapNonEmpty!50839 m!1168189))

(check-sat (not b!1270312) tp_is_empty!32839 (not mapNonEmpty!50839) (not start!107150) (not b!1270310))
(check-sat)
