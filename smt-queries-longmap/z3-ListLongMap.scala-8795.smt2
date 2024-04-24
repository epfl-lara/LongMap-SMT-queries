; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107218 () Bool)

(assert start!107218)

(declare-fun b!1269950 () Bool)

(declare-fun e!723803 () Bool)

(declare-fun e!723804 () Bool)

(declare-fun mapRes!50605 () Bool)

(assert (=> b!1269950 (= e!723803 (and e!723804 mapRes!50605))))

(declare-fun condMapEmpty!50605 () Bool)

(declare-datatypes ((V!48771 0))(
  ( (V!48772 (val!16416 Int)) )
))
(declare-datatypes ((ValueCell!15488 0))(
  ( (ValueCellFull!15488 (v!19048 V!48771)) (EmptyCell!15488) )
))
(declare-datatypes ((array!82679 0))(
  ( (array!82680 (arr!39872 (Array (_ BitVec 32) ValueCell!15488)) (size!40409 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82679)

(declare-fun mapDefault!50605 () ValueCell!15488)

(assert (=> b!1269950 (= condMapEmpty!50605 (= (arr!39872 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15488)) mapDefault!50605)))))

(declare-fun b!1269951 () Bool)

(declare-fun res!844873 () Bool)

(declare-fun e!723802 () Bool)

(assert (=> b!1269951 (=> (not res!844873) (not e!723802))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82681 0))(
  ( (array!82682 (arr!39873 (Array (_ BitVec 32) (_ BitVec 64))) (size!40410 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82681)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(assert (=> b!1269951 (= res!844873 (and (= (size!40409 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40410 _keys!1364) (size!40409 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269952 () Bool)

(declare-fun tp_is_empty!32683 () Bool)

(assert (=> b!1269952 (= e!723804 tp_is_empty!32683)))

(declare-fun mapNonEmpty!50605 () Bool)

(declare-fun tp!96784 () Bool)

(declare-fun e!723801 () Bool)

(assert (=> mapNonEmpty!50605 (= mapRes!50605 (and tp!96784 e!723801))))

(declare-fun mapValue!50605 () ValueCell!15488)

(declare-fun mapKey!50605 () (_ BitVec 32))

(declare-fun mapRest!50605 () (Array (_ BitVec 32) ValueCell!15488))

(assert (=> mapNonEmpty!50605 (= (arr!39872 _values!1134) (store mapRest!50605 mapKey!50605 mapValue!50605))))

(declare-fun mapIsEmpty!50605 () Bool)

(assert (=> mapIsEmpty!50605 mapRes!50605))

(declare-fun b!1269953 () Bool)

(assert (=> b!1269953 (= e!723802 false)))

(declare-fun lt!574945 () Bool)

(declare-datatypes ((List!28423 0))(
  ( (Nil!28420) (Cons!28419 (h!29637 (_ BitVec 64)) (t!41944 List!28423)) )
))
(declare-fun arrayNoDuplicates!0 (array!82681 (_ BitVec 32) List!28423) Bool)

(assert (=> b!1269953 (= lt!574945 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28420))))

(declare-fun b!1269954 () Bool)

(declare-fun res!844875 () Bool)

(assert (=> b!1269954 (=> (not res!844875) (not e!723802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82681 (_ BitVec 32)) Bool)

(assert (=> b!1269954 (= res!844875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!844874 () Bool)

(assert (=> start!107218 (=> (not res!844874) (not e!723802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107218 (= res!844874 (validMask!0 mask!1730))))

(assert (=> start!107218 e!723802))

(declare-fun array_inv!30509 (array!82679) Bool)

(assert (=> start!107218 (and (array_inv!30509 _values!1134) e!723803)))

(assert (=> start!107218 true))

(declare-fun array_inv!30510 (array!82681) Bool)

(assert (=> start!107218 (array_inv!30510 _keys!1364)))

(declare-fun b!1269955 () Bool)

(assert (=> b!1269955 (= e!723801 tp_is_empty!32683)))

(assert (= (and start!107218 res!844874) b!1269951))

(assert (= (and b!1269951 res!844873) b!1269954))

(assert (= (and b!1269954 res!844875) b!1269953))

(assert (= (and b!1269950 condMapEmpty!50605) mapIsEmpty!50605))

(assert (= (and b!1269950 (not condMapEmpty!50605)) mapNonEmpty!50605))

(get-info :version)

(assert (= (and mapNonEmpty!50605 ((_ is ValueCellFull!15488) mapValue!50605)) b!1269955))

(assert (= (and b!1269950 ((_ is ValueCellFull!15488) mapDefault!50605)) b!1269952))

(assert (= start!107218 b!1269950))

(declare-fun m!1169031 () Bool)

(assert (=> mapNonEmpty!50605 m!1169031))

(declare-fun m!1169033 () Bool)

(assert (=> b!1269953 m!1169033))

(declare-fun m!1169035 () Bool)

(assert (=> b!1269954 m!1169035))

(declare-fun m!1169037 () Bool)

(assert (=> start!107218 m!1169037))

(declare-fun m!1169039 () Bool)

(assert (=> start!107218 m!1169039))

(declare-fun m!1169041 () Bool)

(assert (=> start!107218 m!1169041))

(check-sat tp_is_empty!32683 (not start!107218) (not mapNonEmpty!50605) (not b!1269954) (not b!1269953))
(check-sat)
