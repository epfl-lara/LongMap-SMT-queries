; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107212 () Bool)

(assert start!107212)

(declare-fun b!1270931 () Bool)

(declare-fun e!724593 () Bool)

(assert (=> b!1270931 (= e!724593 false)))

(declare-fun lt!574788 () Bool)

(declare-datatypes ((array!83058 0))(
  ( (array!83059 (arr!40066 (Array (_ BitVec 32) (_ BitVec 64))) (size!40602 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83058)

(declare-datatypes ((List!28506 0))(
  ( (Nil!28503) (Cons!28502 (h!29711 (_ BitVec 64)) (t!42035 List!28506)) )
))
(declare-fun arrayNoDuplicates!0 (array!83058 (_ BitVec 32) List!28506) Bool)

(assert (=> b!1270931 (= lt!574788 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28503))))

(declare-fun b!1270932 () Bool)

(declare-fun e!724591 () Bool)

(declare-fun e!724590 () Bool)

(declare-fun mapRes!50932 () Bool)

(assert (=> b!1270932 (= e!724591 (and e!724590 mapRes!50932))))

(declare-fun condMapEmpty!50932 () Bool)

(declare-datatypes ((V!49061 0))(
  ( (V!49062 (val!16525 Int)) )
))
(declare-datatypes ((ValueCell!15597 0))(
  ( (ValueCellFull!15597 (v!19162 V!49061)) (EmptyCell!15597) )
))
(declare-datatypes ((array!83060 0))(
  ( (array!83061 (arr!40067 (Array (_ BitVec 32) ValueCell!15597)) (size!40603 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83060)

(declare-fun mapDefault!50932 () ValueCell!15597)

(assert (=> b!1270932 (= condMapEmpty!50932 (= (arr!40067 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15597)) mapDefault!50932)))))

(declare-fun b!1270933 () Bool)

(declare-fun tp_is_empty!32901 () Bool)

(assert (=> b!1270933 (= e!724590 tp_is_empty!32901)))

(declare-fun mapNonEmpty!50932 () Bool)

(declare-fun tp!97273 () Bool)

(declare-fun e!724589 () Bool)

(assert (=> mapNonEmpty!50932 (= mapRes!50932 (and tp!97273 e!724589))))

(declare-fun mapValue!50932 () ValueCell!15597)

(declare-fun mapKey!50932 () (_ BitVec 32))

(declare-fun mapRest!50932 () (Array (_ BitVec 32) ValueCell!15597))

(assert (=> mapNonEmpty!50932 (= (arr!40067 _values!1134) (store mapRest!50932 mapKey!50932 mapValue!50932))))

(declare-fun mapIsEmpty!50932 () Bool)

(assert (=> mapIsEmpty!50932 mapRes!50932))

(declare-fun b!1270935 () Bool)

(assert (=> b!1270935 (= e!724589 tp_is_empty!32901)))

(declare-fun b!1270936 () Bool)

(declare-fun res!845659 () Bool)

(assert (=> b!1270936 (=> (not res!845659) (not e!724593))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270936 (= res!845659 (and (= (size!40603 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40602 _keys!1364) (size!40603 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270934 () Bool)

(declare-fun res!845658 () Bool)

(assert (=> b!1270934 (=> (not res!845658) (not e!724593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83058 (_ BitVec 32)) Bool)

(assert (=> b!1270934 (= res!845658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!845660 () Bool)

(assert (=> start!107212 (=> (not res!845660) (not e!724593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107212 (= res!845660 (validMask!0 mask!1730))))

(assert (=> start!107212 e!724593))

(declare-fun array_inv!30473 (array!83060) Bool)

(assert (=> start!107212 (and (array_inv!30473 _values!1134) e!724591)))

(assert (=> start!107212 true))

(declare-fun array_inv!30474 (array!83058) Bool)

(assert (=> start!107212 (array_inv!30474 _keys!1364)))

(assert (= (and start!107212 res!845660) b!1270936))

(assert (= (and b!1270936 res!845659) b!1270934))

(assert (= (and b!1270934 res!845658) b!1270931))

(assert (= (and b!1270932 condMapEmpty!50932) mapIsEmpty!50932))

(assert (= (and b!1270932 (not condMapEmpty!50932)) mapNonEmpty!50932))

(get-info :version)

(assert (= (and mapNonEmpty!50932 ((_ is ValueCellFull!15597) mapValue!50932)) b!1270935))

(assert (= (and b!1270932 ((_ is ValueCellFull!15597) mapDefault!50932)) b!1270933))

(assert (= start!107212 b!1270932))

(declare-fun m!1169051 () Bool)

(assert (=> b!1270931 m!1169051))

(declare-fun m!1169053 () Bool)

(assert (=> mapNonEmpty!50932 m!1169053))

(declare-fun m!1169055 () Bool)

(assert (=> b!1270934 m!1169055))

(declare-fun m!1169057 () Bool)

(assert (=> start!107212 m!1169057))

(declare-fun m!1169059 () Bool)

(assert (=> start!107212 m!1169059))

(declare-fun m!1169061 () Bool)

(assert (=> start!107212 m!1169061))

(check-sat tp_is_empty!32901 (not b!1270934) (not b!1270931) (not mapNonEmpty!50932) (not start!107212))
(check-sat)
