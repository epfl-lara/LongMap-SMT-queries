; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107236 () Bool)

(assert start!107236)

(declare-fun b!1270112 () Bool)

(declare-fun e!723938 () Bool)

(assert (=> b!1270112 (= e!723938 false)))

(declare-fun lt!574972 () Bool)

(declare-datatypes ((array!82715 0))(
  ( (array!82716 (arr!39890 (Array (_ BitVec 32) (_ BitVec 64))) (size!40427 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82715)

(declare-datatypes ((List!28432 0))(
  ( (Nil!28429) (Cons!28428 (h!29646 (_ BitVec 64)) (t!41953 List!28432)) )
))
(declare-fun arrayNoDuplicates!0 (array!82715 (_ BitVec 32) List!28432) Bool)

(assert (=> b!1270112 (= lt!574972 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28429))))

(declare-fun res!844956 () Bool)

(assert (=> start!107236 (=> (not res!844956) (not e!723938))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107236 (= res!844956 (validMask!0 mask!1730))))

(assert (=> start!107236 e!723938))

(declare-datatypes ((V!48795 0))(
  ( (V!48796 (val!16425 Int)) )
))
(declare-datatypes ((ValueCell!15497 0))(
  ( (ValueCellFull!15497 (v!19057 V!48795)) (EmptyCell!15497) )
))
(declare-datatypes ((array!82717 0))(
  ( (array!82718 (arr!39891 (Array (_ BitVec 32) ValueCell!15497)) (size!40428 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82717)

(declare-fun e!723937 () Bool)

(declare-fun array_inv!30519 (array!82717) Bool)

(assert (=> start!107236 (and (array_inv!30519 _values!1134) e!723937)))

(assert (=> start!107236 true))

(declare-fun array_inv!30520 (array!82715) Bool)

(assert (=> start!107236 (array_inv!30520 _keys!1364)))

(declare-fun mapNonEmpty!50632 () Bool)

(declare-fun mapRes!50632 () Bool)

(declare-fun tp!96811 () Bool)

(declare-fun e!723940 () Bool)

(assert (=> mapNonEmpty!50632 (= mapRes!50632 (and tp!96811 e!723940))))

(declare-fun mapKey!50632 () (_ BitVec 32))

(declare-fun mapValue!50632 () ValueCell!15497)

(declare-fun mapRest!50632 () (Array (_ BitVec 32) ValueCell!15497))

(assert (=> mapNonEmpty!50632 (= (arr!39891 _values!1134) (store mapRest!50632 mapKey!50632 mapValue!50632))))

(declare-fun b!1270113 () Bool)

(declare-fun e!723936 () Bool)

(declare-fun tp_is_empty!32701 () Bool)

(assert (=> b!1270113 (= e!723936 tp_is_empty!32701)))

(declare-fun b!1270114 () Bool)

(declare-fun res!844954 () Bool)

(assert (=> b!1270114 (=> (not res!844954) (not e!723938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82715 (_ BitVec 32)) Bool)

(assert (=> b!1270114 (= res!844954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270115 () Bool)

(assert (=> b!1270115 (= e!723940 tp_is_empty!32701)))

(declare-fun mapIsEmpty!50632 () Bool)

(assert (=> mapIsEmpty!50632 mapRes!50632))

(declare-fun b!1270116 () Bool)

(assert (=> b!1270116 (= e!723937 (and e!723936 mapRes!50632))))

(declare-fun condMapEmpty!50632 () Bool)

(declare-fun mapDefault!50632 () ValueCell!15497)

(assert (=> b!1270116 (= condMapEmpty!50632 (= (arr!39891 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15497)) mapDefault!50632)))))

(declare-fun b!1270117 () Bool)

(declare-fun res!844955 () Bool)

(assert (=> b!1270117 (=> (not res!844955) (not e!723938))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270117 (= res!844955 (and (= (size!40428 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40427 _keys!1364) (size!40428 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107236 res!844956) b!1270117))

(assert (= (and b!1270117 res!844955) b!1270114))

(assert (= (and b!1270114 res!844954) b!1270112))

(assert (= (and b!1270116 condMapEmpty!50632) mapIsEmpty!50632))

(assert (= (and b!1270116 (not condMapEmpty!50632)) mapNonEmpty!50632))

(get-info :version)

(assert (= (and mapNonEmpty!50632 ((_ is ValueCellFull!15497) mapValue!50632)) b!1270115))

(assert (= (and b!1270116 ((_ is ValueCellFull!15497) mapDefault!50632)) b!1270113))

(assert (= start!107236 b!1270116))

(declare-fun m!1169139 () Bool)

(assert (=> b!1270112 m!1169139))

(declare-fun m!1169141 () Bool)

(assert (=> start!107236 m!1169141))

(declare-fun m!1169143 () Bool)

(assert (=> start!107236 m!1169143))

(declare-fun m!1169145 () Bool)

(assert (=> start!107236 m!1169145))

(declare-fun m!1169147 () Bool)

(assert (=> mapNonEmpty!50632 m!1169147))

(declare-fun m!1169149 () Bool)

(assert (=> b!1270114 m!1169149))

(check-sat (not mapNonEmpty!50632) tp_is_empty!32701 (not start!107236) (not b!1270114) (not b!1270112))
(check-sat)
