; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107494 () Bool)

(assert start!107494)

(declare-fun b!1272758 () Bool)

(declare-fun e!725872 () Bool)

(declare-fun tp_is_empty!32959 () Bool)

(assert (=> b!1272758 (= e!725872 tp_is_empty!32959)))

(declare-fun b!1272759 () Bool)

(declare-fun e!725871 () Bool)

(assert (=> b!1272759 (= e!725871 tp_is_empty!32959)))

(declare-fun b!1272760 () Bool)

(declare-fun e!725875 () Bool)

(assert (=> b!1272760 (= e!725875 false)))

(declare-fun lt!575359 () Bool)

(declare-datatypes ((array!83193 0))(
  ( (array!83194 (arr!40129 (Array (_ BitVec 32) (_ BitVec 64))) (size!40666 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83193)

(declare-datatypes ((List!28555 0))(
  ( (Nil!28552) (Cons!28551 (h!29769 (_ BitVec 64)) (t!42076 List!28555)) )
))
(declare-fun arrayNoDuplicates!0 (array!83193 (_ BitVec 32) List!28555) Bool)

(assert (=> b!1272760 (= lt!575359 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28552))))

(declare-fun mapIsEmpty!51019 () Bool)

(declare-fun mapRes!51019 () Bool)

(assert (=> mapIsEmpty!51019 mapRes!51019))

(declare-fun b!1272761 () Bool)

(declare-fun e!725874 () Bool)

(assert (=> b!1272761 (= e!725874 (and e!725872 mapRes!51019))))

(declare-fun condMapEmpty!51019 () Bool)

(declare-datatypes ((V!49139 0))(
  ( (V!49140 (val!16554 Int)) )
))
(declare-datatypes ((ValueCell!15626 0))(
  ( (ValueCellFull!15626 (v!19186 V!49139)) (EmptyCell!15626) )
))
(declare-datatypes ((array!83195 0))(
  ( (array!83196 (arr!40130 (Array (_ BitVec 32) ValueCell!15626)) (size!40667 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83195)

(declare-fun mapDefault!51019 () ValueCell!15626)

(assert (=> b!1272761 (= condMapEmpty!51019 (= (arr!40130 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15626)) mapDefault!51019)))))

(declare-fun b!1272762 () Bool)

(declare-fun res!846440 () Bool)

(assert (=> b!1272762 (=> (not res!846440) (not e!725875))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272762 (= res!846440 (and (= (size!40667 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40666 _keys!1364) (size!40667 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272763 () Bool)

(declare-fun res!846441 () Bool)

(assert (=> b!1272763 (=> (not res!846441) (not e!725875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83193 (_ BitVec 32)) Bool)

(assert (=> b!1272763 (= res!846441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846439 () Bool)

(assert (=> start!107494 (=> (not res!846439) (not e!725875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107494 (= res!846439 (validMask!0 mask!1730))))

(assert (=> start!107494 e!725875))

(declare-fun array_inv!30685 (array!83195) Bool)

(assert (=> start!107494 (and (array_inv!30685 _values!1134) e!725874)))

(assert (=> start!107494 true))

(declare-fun array_inv!30686 (array!83193) Bool)

(assert (=> start!107494 (array_inv!30686 _keys!1364)))

(declare-fun mapNonEmpty!51019 () Bool)

(declare-fun tp!97360 () Bool)

(assert (=> mapNonEmpty!51019 (= mapRes!51019 (and tp!97360 e!725871))))

(declare-fun mapValue!51019 () ValueCell!15626)

(declare-fun mapKey!51019 () (_ BitVec 32))

(declare-fun mapRest!51019 () (Array (_ BitVec 32) ValueCell!15626))

(assert (=> mapNonEmpty!51019 (= (arr!40130 _values!1134) (store mapRest!51019 mapKey!51019 mapValue!51019))))

(assert (= (and start!107494 res!846439) b!1272762))

(assert (= (and b!1272762 res!846440) b!1272763))

(assert (= (and b!1272763 res!846441) b!1272760))

(assert (= (and b!1272761 condMapEmpty!51019) mapIsEmpty!51019))

(assert (= (and b!1272761 (not condMapEmpty!51019)) mapNonEmpty!51019))

(get-info :version)

(assert (= (and mapNonEmpty!51019 ((_ is ValueCellFull!15626) mapValue!51019)) b!1272759))

(assert (= (and b!1272761 ((_ is ValueCellFull!15626) mapDefault!51019)) b!1272758))

(assert (= start!107494 b!1272761))

(declare-fun m!1171011 () Bool)

(assert (=> b!1272760 m!1171011))

(declare-fun m!1171013 () Bool)

(assert (=> b!1272763 m!1171013))

(declare-fun m!1171015 () Bool)

(assert (=> start!107494 m!1171015))

(declare-fun m!1171017 () Bool)

(assert (=> start!107494 m!1171017))

(declare-fun m!1171019 () Bool)

(assert (=> start!107494 m!1171019))

(declare-fun m!1171021 () Bool)

(assert (=> mapNonEmpty!51019 m!1171021))

(check-sat tp_is_empty!32959 (not start!107494) (not b!1272760) (not b!1272763) (not mapNonEmpty!51019))
(check-sat)
