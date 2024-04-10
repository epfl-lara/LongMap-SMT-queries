; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108338 () Bool)

(assert start!108338)

(declare-fun b!1278713 () Bool)

(declare-fun e!730503 () Bool)

(declare-fun e!730502 () Bool)

(declare-fun mapRes!51839 () Bool)

(assert (=> b!1278713 (= e!730503 (and e!730502 mapRes!51839))))

(declare-fun condMapEmpty!51839 () Bool)

(declare-datatypes ((V!49803 0))(
  ( (V!49804 (val!16837 Int)) )
))
(declare-datatypes ((ValueCell!15864 0))(
  ( (ValueCellFull!15864 (v!19437 V!49803)) (EmptyCell!15864) )
))
(declare-datatypes ((array!84142 0))(
  ( (array!84143 (arr!40575 (Array (_ BitVec 32) ValueCell!15864)) (size!41125 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84142)

(declare-fun mapDefault!51839 () ValueCell!15864)

(assert (=> b!1278713 (= condMapEmpty!51839 (= (arr!40575 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15864)) mapDefault!51839)))))

(declare-fun b!1278714 () Bool)

(declare-fun tp_is_empty!33525 () Bool)

(assert (=> b!1278714 (= e!730502 tp_is_empty!33525)))

(declare-fun b!1278715 () Bool)

(declare-fun res!849488 () Bool)

(declare-fun e!730501 () Bool)

(assert (=> b!1278715 (=> (not res!849488) (not e!730501))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84144 0))(
  ( (array!84145 (arr!40576 (Array (_ BitVec 32) (_ BitVec 64))) (size!41126 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84144)

(assert (=> b!1278715 (= res!849488 (and (= (size!41125 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41126 _keys!1741) (size!41125 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51839 () Bool)

(assert (=> mapIsEmpty!51839 mapRes!51839))

(declare-fun res!849486 () Bool)

(assert (=> start!108338 (=> (not res!849486) (not e!730501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108338 (= res!849486 (validMask!0 mask!2175))))

(assert (=> start!108338 e!730501))

(assert (=> start!108338 true))

(declare-fun array_inv!30817 (array!84142) Bool)

(assert (=> start!108338 (and (array_inv!30817 _values!1445) e!730503)))

(declare-fun array_inv!30818 (array!84144) Bool)

(assert (=> start!108338 (array_inv!30818 _keys!1741)))

(declare-fun b!1278716 () Bool)

(declare-fun e!730504 () Bool)

(assert (=> b!1278716 (= e!730504 tp_is_empty!33525)))

(declare-fun b!1278717 () Bool)

(declare-fun res!849487 () Bool)

(assert (=> b!1278717 (=> (not res!849487) (not e!730501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84144 (_ BitVec 32)) Bool)

(assert (=> b!1278717 (= res!849487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!51839 () Bool)

(declare-fun tp!98813 () Bool)

(assert (=> mapNonEmpty!51839 (= mapRes!51839 (and tp!98813 e!730504))))

(declare-fun mapValue!51839 () ValueCell!15864)

(declare-fun mapKey!51839 () (_ BitVec 32))

(declare-fun mapRest!51839 () (Array (_ BitVec 32) ValueCell!15864))

(assert (=> mapNonEmpty!51839 (= (arr!40575 _values!1445) (store mapRest!51839 mapKey!51839 mapValue!51839))))

(declare-fun b!1278718 () Bool)

(assert (=> b!1278718 (= e!730501 false)))

(declare-fun lt!575918 () Bool)

(declare-datatypes ((List!28747 0))(
  ( (Nil!28744) (Cons!28743 (h!29952 (_ BitVec 64)) (t!42287 List!28747)) )
))
(declare-fun arrayNoDuplicates!0 (array!84144 (_ BitVec 32) List!28747) Bool)

(assert (=> b!1278718 (= lt!575918 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28744))))

(assert (= (and start!108338 res!849486) b!1278715))

(assert (= (and b!1278715 res!849488) b!1278717))

(assert (= (and b!1278717 res!849487) b!1278718))

(assert (= (and b!1278713 condMapEmpty!51839) mapIsEmpty!51839))

(assert (= (and b!1278713 (not condMapEmpty!51839)) mapNonEmpty!51839))

(get-info :version)

(assert (= (and mapNonEmpty!51839 ((_ is ValueCellFull!15864) mapValue!51839)) b!1278716))

(assert (= (and b!1278713 ((_ is ValueCellFull!15864) mapDefault!51839)) b!1278714))

(assert (= start!108338 b!1278713))

(declare-fun m!1173929 () Bool)

(assert (=> start!108338 m!1173929))

(declare-fun m!1173931 () Bool)

(assert (=> start!108338 m!1173931))

(declare-fun m!1173933 () Bool)

(assert (=> start!108338 m!1173933))

(declare-fun m!1173935 () Bool)

(assert (=> b!1278717 m!1173935))

(declare-fun m!1173937 () Bool)

(assert (=> mapNonEmpty!51839 m!1173937))

(declare-fun m!1173939 () Bool)

(assert (=> b!1278718 m!1173939))

(check-sat tp_is_empty!33525 (not b!1278718) (not start!108338) (not b!1278717) (not mapNonEmpty!51839))
(check-sat)
