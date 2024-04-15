; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107234 () Bool)

(assert start!107234)

(declare-fun b!1271065 () Bool)

(declare-fun e!724729 () Bool)

(declare-fun tp_is_empty!32923 () Bool)

(assert (=> b!1271065 (= e!724729 tp_is_empty!32923)))

(declare-fun b!1271067 () Bool)

(declare-fun res!845731 () Bool)

(declare-fun e!724728 () Bool)

(assert (=> b!1271067 (=> (not res!845731) (not e!724728))))

(declare-datatypes ((array!83013 0))(
  ( (array!83014 (arr!40044 (Array (_ BitVec 32) (_ BitVec 64))) (size!40582 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83013)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83013 (_ BitVec 32)) Bool)

(assert (=> b!1271067 (= res!845731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271068 () Bool)

(declare-fun e!724725 () Bool)

(assert (=> b!1271068 (= e!724725 tp_is_empty!32923)))

(declare-fun b!1271069 () Bool)

(declare-fun e!724727 () Bool)

(declare-fun mapRes!50965 () Bool)

(assert (=> b!1271069 (= e!724727 (and e!724729 mapRes!50965))))

(declare-fun condMapEmpty!50965 () Bool)

(declare-datatypes ((V!49091 0))(
  ( (V!49092 (val!16536 Int)) )
))
(declare-datatypes ((ValueCell!15608 0))(
  ( (ValueCellFull!15608 (v!19172 V!49091)) (EmptyCell!15608) )
))
(declare-datatypes ((array!83015 0))(
  ( (array!83016 (arr!40045 (Array (_ BitVec 32) ValueCell!15608)) (size!40583 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83015)

(declare-fun mapDefault!50965 () ValueCell!15608)

(assert (=> b!1271069 (= condMapEmpty!50965 (= (arr!40045 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15608)) mapDefault!50965)))))

(declare-fun b!1271070 () Bool)

(assert (=> b!1271070 (= e!724728 false)))

(declare-fun lt!574643 () Bool)

(declare-datatypes ((List!28593 0))(
  ( (Nil!28590) (Cons!28589 (h!29798 (_ BitVec 64)) (t!42114 List!28593)) )
))
(declare-fun arrayNoDuplicates!0 (array!83013 (_ BitVec 32) List!28593) Bool)

(assert (=> b!1271070 (= lt!574643 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28590))))

(declare-fun mapIsEmpty!50965 () Bool)

(assert (=> mapIsEmpty!50965 mapRes!50965))

(declare-fun mapNonEmpty!50965 () Bool)

(declare-fun tp!97307 () Bool)

(assert (=> mapNonEmpty!50965 (= mapRes!50965 (and tp!97307 e!724725))))

(declare-fun mapRest!50965 () (Array (_ BitVec 32) ValueCell!15608))

(declare-fun mapKey!50965 () (_ BitVec 32))

(declare-fun mapValue!50965 () ValueCell!15608)

(assert (=> mapNonEmpty!50965 (= (arr!40045 _values!1134) (store mapRest!50965 mapKey!50965 mapValue!50965))))

(declare-fun res!845732 () Bool)

(assert (=> start!107234 (=> (not res!845732) (not e!724728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107234 (= res!845732 (validMask!0 mask!1730))))

(assert (=> start!107234 e!724728))

(declare-fun array_inv!30615 (array!83015) Bool)

(assert (=> start!107234 (and (array_inv!30615 _values!1134) e!724727)))

(assert (=> start!107234 true))

(declare-fun array_inv!30616 (array!83013) Bool)

(assert (=> start!107234 (array_inv!30616 _keys!1364)))

(declare-fun b!1271066 () Bool)

(declare-fun res!845730 () Bool)

(assert (=> b!1271066 (=> (not res!845730) (not e!724728))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271066 (= res!845730 (and (= (size!40583 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40582 _keys!1364) (size!40583 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107234 res!845732) b!1271066))

(assert (= (and b!1271066 res!845730) b!1271067))

(assert (= (and b!1271067 res!845731) b!1271070))

(assert (= (and b!1271069 condMapEmpty!50965) mapIsEmpty!50965))

(assert (= (and b!1271069 (not condMapEmpty!50965)) mapNonEmpty!50965))

(get-info :version)

(assert (= (and mapNonEmpty!50965 ((_ is ValueCellFull!15608) mapValue!50965)) b!1271068))

(assert (= (and b!1271069 ((_ is ValueCellFull!15608) mapDefault!50965)) b!1271065))

(assert (= start!107234 b!1271069))

(declare-fun m!1168683 () Bool)

(assert (=> b!1271067 m!1168683))

(declare-fun m!1168685 () Bool)

(assert (=> b!1271070 m!1168685))

(declare-fun m!1168687 () Bool)

(assert (=> mapNonEmpty!50965 m!1168687))

(declare-fun m!1168689 () Bool)

(assert (=> start!107234 m!1168689))

(declare-fun m!1168691 () Bool)

(assert (=> start!107234 m!1168691))

(declare-fun m!1168693 () Bool)

(assert (=> start!107234 m!1168693))

(check-sat tp_is_empty!32923 (not start!107234) (not b!1271067) (not mapNonEmpty!50965) (not b!1271070))
(check-sat)
