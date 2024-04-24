; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107248 () Bool)

(assert start!107248)

(declare-fun b!1270220 () Bool)

(declare-fun res!845009 () Bool)

(declare-fun e!724026 () Bool)

(assert (=> b!1270220 (=> (not res!845009) (not e!724026))))

(declare-datatypes ((V!48811 0))(
  ( (V!48812 (val!16431 Int)) )
))
(declare-datatypes ((ValueCell!15503 0))(
  ( (ValueCellFull!15503 (v!19063 V!48811)) (EmptyCell!15503) )
))
(declare-datatypes ((array!82735 0))(
  ( (array!82736 (arr!39900 (Array (_ BitVec 32) ValueCell!15503)) (size!40437 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82735)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82737 0))(
  ( (array!82738 (arr!39901 (Array (_ BitVec 32) (_ BitVec 64))) (size!40438 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82737)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270220 (= res!845009 (and (= (size!40437 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40438 _keys!1364) (size!40437 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270221 () Bool)

(assert (=> b!1270221 (= e!724026 false)))

(declare-fun lt!574990 () Bool)

(declare-datatypes ((List!28436 0))(
  ( (Nil!28433) (Cons!28432 (h!29650 (_ BitVec 64)) (t!41957 List!28436)) )
))
(declare-fun arrayNoDuplicates!0 (array!82737 (_ BitVec 32) List!28436) Bool)

(assert (=> b!1270221 (= lt!574990 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28433))))

(declare-fun mapNonEmpty!50650 () Bool)

(declare-fun mapRes!50650 () Bool)

(declare-fun tp!96829 () Bool)

(declare-fun e!724030 () Bool)

(assert (=> mapNonEmpty!50650 (= mapRes!50650 (and tp!96829 e!724030))))

(declare-fun mapValue!50650 () ValueCell!15503)

(declare-fun mapKey!50650 () (_ BitVec 32))

(declare-fun mapRest!50650 () (Array (_ BitVec 32) ValueCell!15503))

(assert (=> mapNonEmpty!50650 (= (arr!39900 _values!1134) (store mapRest!50650 mapKey!50650 mapValue!50650))))

(declare-fun mapIsEmpty!50650 () Bool)

(assert (=> mapIsEmpty!50650 mapRes!50650))

(declare-fun b!1270222 () Bool)

(declare-fun e!724027 () Bool)

(declare-fun tp_is_empty!32713 () Bool)

(assert (=> b!1270222 (= e!724027 tp_is_empty!32713)))

(declare-fun res!845010 () Bool)

(assert (=> start!107248 (=> (not res!845010) (not e!724026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107248 (= res!845010 (validMask!0 mask!1730))))

(assert (=> start!107248 e!724026))

(declare-fun e!724028 () Bool)

(declare-fun array_inv!30527 (array!82735) Bool)

(assert (=> start!107248 (and (array_inv!30527 _values!1134) e!724028)))

(assert (=> start!107248 true))

(declare-fun array_inv!30528 (array!82737) Bool)

(assert (=> start!107248 (array_inv!30528 _keys!1364)))

(declare-fun b!1270223 () Bool)

(declare-fun res!845008 () Bool)

(assert (=> b!1270223 (=> (not res!845008) (not e!724026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82737 (_ BitVec 32)) Bool)

(assert (=> b!1270223 (= res!845008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270224 () Bool)

(assert (=> b!1270224 (= e!724030 tp_is_empty!32713)))

(declare-fun b!1270225 () Bool)

(assert (=> b!1270225 (= e!724028 (and e!724027 mapRes!50650))))

(declare-fun condMapEmpty!50650 () Bool)

(declare-fun mapDefault!50650 () ValueCell!15503)

(assert (=> b!1270225 (= condMapEmpty!50650 (= (arr!39900 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15503)) mapDefault!50650)))))

(assert (= (and start!107248 res!845010) b!1270220))

(assert (= (and b!1270220 res!845009) b!1270223))

(assert (= (and b!1270223 res!845008) b!1270221))

(assert (= (and b!1270225 condMapEmpty!50650) mapIsEmpty!50650))

(assert (= (and b!1270225 (not condMapEmpty!50650)) mapNonEmpty!50650))

(get-info :version)

(assert (= (and mapNonEmpty!50650 ((_ is ValueCellFull!15503) mapValue!50650)) b!1270224))

(assert (= (and b!1270225 ((_ is ValueCellFull!15503) mapDefault!50650)) b!1270222))

(assert (= start!107248 b!1270225))

(declare-fun m!1169211 () Bool)

(assert (=> b!1270221 m!1169211))

(declare-fun m!1169213 () Bool)

(assert (=> mapNonEmpty!50650 m!1169213))

(declare-fun m!1169215 () Bool)

(assert (=> start!107248 m!1169215))

(declare-fun m!1169217 () Bool)

(assert (=> start!107248 m!1169217))

(declare-fun m!1169219 () Bool)

(assert (=> start!107248 m!1169219))

(declare-fun m!1169221 () Bool)

(assert (=> b!1270223 m!1169221))

(check-sat (not b!1270223) (not mapNonEmpty!50650) (not b!1270221) tp_is_empty!32713 (not start!107248))
(check-sat)
