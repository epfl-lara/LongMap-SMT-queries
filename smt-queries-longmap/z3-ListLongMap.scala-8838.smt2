; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107476 () Bool)

(assert start!107476)

(declare-fun mapIsEmpty!50992 () Bool)

(declare-fun mapRes!50992 () Bool)

(assert (=> mapIsEmpty!50992 mapRes!50992))

(declare-fun res!846358 () Bool)

(declare-fun e!725740 () Bool)

(assert (=> start!107476 (=> (not res!846358) (not e!725740))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107476 (= res!846358 (validMask!0 mask!1730))))

(assert (=> start!107476 e!725740))

(declare-datatypes ((V!49115 0))(
  ( (V!49116 (val!16545 Int)) )
))
(declare-datatypes ((ValueCell!15617 0))(
  ( (ValueCellFull!15617 (v!19177 V!49115)) (EmptyCell!15617) )
))
(declare-datatypes ((array!83159 0))(
  ( (array!83160 (arr!40112 (Array (_ BitVec 32) ValueCell!15617)) (size!40649 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83159)

(declare-fun e!725736 () Bool)

(declare-fun array_inv!30675 (array!83159) Bool)

(assert (=> start!107476 (and (array_inv!30675 _values!1134) e!725736)))

(assert (=> start!107476 true))

(declare-datatypes ((array!83161 0))(
  ( (array!83162 (arr!40113 (Array (_ BitVec 32) (_ BitVec 64))) (size!40650 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83161)

(declare-fun array_inv!30676 (array!83161) Bool)

(assert (=> start!107476 (array_inv!30676 _keys!1364)))

(declare-fun b!1272596 () Bool)

(declare-fun e!725739 () Bool)

(assert (=> b!1272596 (= e!725736 (and e!725739 mapRes!50992))))

(declare-fun condMapEmpty!50992 () Bool)

(declare-fun mapDefault!50992 () ValueCell!15617)

(assert (=> b!1272596 (= condMapEmpty!50992 (= (arr!40112 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15617)) mapDefault!50992)))))

(declare-fun b!1272597 () Bool)

(declare-fun e!725738 () Bool)

(declare-fun tp_is_empty!32941 () Bool)

(assert (=> b!1272597 (= e!725738 tp_is_empty!32941)))

(declare-fun b!1272598 () Bool)

(declare-fun res!846359 () Bool)

(assert (=> b!1272598 (=> (not res!846359) (not e!725740))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272598 (= res!846359 (and (= (size!40649 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40650 _keys!1364) (size!40649 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50992 () Bool)

(declare-fun tp!97333 () Bool)

(assert (=> mapNonEmpty!50992 (= mapRes!50992 (and tp!97333 e!725738))))

(declare-fun mapValue!50992 () ValueCell!15617)

(declare-fun mapRest!50992 () (Array (_ BitVec 32) ValueCell!15617))

(declare-fun mapKey!50992 () (_ BitVec 32))

(assert (=> mapNonEmpty!50992 (= (arr!40112 _values!1134) (store mapRest!50992 mapKey!50992 mapValue!50992))))

(declare-fun b!1272599 () Bool)

(assert (=> b!1272599 (= e!725740 false)))

(declare-fun lt!575332 () Bool)

(declare-datatypes ((List!28549 0))(
  ( (Nil!28546) (Cons!28545 (h!29763 (_ BitVec 64)) (t!42070 List!28549)) )
))
(declare-fun arrayNoDuplicates!0 (array!83161 (_ BitVec 32) List!28549) Bool)

(assert (=> b!1272599 (= lt!575332 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28546))))

(declare-fun b!1272600 () Bool)

(declare-fun res!846360 () Bool)

(assert (=> b!1272600 (=> (not res!846360) (not e!725740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83161 (_ BitVec 32)) Bool)

(assert (=> b!1272600 (= res!846360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272601 () Bool)

(assert (=> b!1272601 (= e!725739 tp_is_empty!32941)))

(assert (= (and start!107476 res!846358) b!1272598))

(assert (= (and b!1272598 res!846359) b!1272600))

(assert (= (and b!1272600 res!846360) b!1272599))

(assert (= (and b!1272596 condMapEmpty!50992) mapIsEmpty!50992))

(assert (= (and b!1272596 (not condMapEmpty!50992)) mapNonEmpty!50992))

(get-info :version)

(assert (= (and mapNonEmpty!50992 ((_ is ValueCellFull!15617) mapValue!50992)) b!1272597))

(assert (= (and b!1272596 ((_ is ValueCellFull!15617) mapDefault!50992)) b!1272601))

(assert (= start!107476 b!1272596))

(declare-fun m!1170903 () Bool)

(assert (=> start!107476 m!1170903))

(declare-fun m!1170905 () Bool)

(assert (=> start!107476 m!1170905))

(declare-fun m!1170907 () Bool)

(assert (=> start!107476 m!1170907))

(declare-fun m!1170909 () Bool)

(assert (=> mapNonEmpty!50992 m!1170909))

(declare-fun m!1170911 () Bool)

(assert (=> b!1272599 m!1170911))

(declare-fun m!1170913 () Bool)

(assert (=> b!1272600 m!1170913))

(check-sat tp_is_empty!32941 (not b!1272599) (not b!1272600) (not mapNonEmpty!50992) (not start!107476))
(check-sat)
