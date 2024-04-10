; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77872 () Bool)

(assert start!77872)

(declare-fun b_free!16431 () Bool)

(declare-fun b_next!16431 () Bool)

(assert (=> start!77872 (= b_free!16431 (not b_next!16431))))

(declare-fun tp!57557 () Bool)

(declare-fun b_and!26999 () Bool)

(assert (=> start!77872 (= tp!57557 b_and!26999)))

(declare-fun b!909286 () Bool)

(declare-fun res!613725 () Bool)

(declare-fun e!509672 () Bool)

(assert (=> b!909286 (=> (not res!613725) (not e!509672))))

(declare-datatypes ((array!53726 0))(
  ( (array!53727 (arr!25821 (Array (_ BitVec 32) (_ BitVec 64))) (size!26280 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53726)

(declare-datatypes ((List!18143 0))(
  ( (Nil!18140) (Cons!18139 (h!19285 (_ BitVec 64)) (t!25724 List!18143)) )
))
(declare-fun arrayNoDuplicates!0 (array!53726 (_ BitVec 32) List!18143) Bool)

(assert (=> b!909286 (= res!613725 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18140))))

(declare-fun mapIsEmpty!29989 () Bool)

(declare-fun mapRes!29989 () Bool)

(assert (=> mapIsEmpty!29989 mapRes!29989))

(declare-fun b!909287 () Bool)

(declare-fun res!613723 () Bool)

(assert (=> b!909287 (=> (not res!613723) (not e!509672))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53726 (_ BitVec 32)) Bool)

(assert (=> b!909287 (= res!613723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29989 () Bool)

(declare-fun tp!57558 () Bool)

(declare-fun e!509676 () Bool)

(assert (=> mapNonEmpty!29989 (= mapRes!29989 (and tp!57558 e!509676))))

(declare-datatypes ((V!30097 0))(
  ( (V!30098 (val!9475 Int)) )
))
(declare-datatypes ((ValueCell!8943 0))(
  ( (ValueCellFull!8943 (v!11982 V!30097)) (EmptyCell!8943) )
))
(declare-datatypes ((array!53728 0))(
  ( (array!53729 (arr!25822 (Array (_ BitVec 32) ValueCell!8943)) (size!26281 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53728)

(declare-fun mapValue!29989 () ValueCell!8943)

(declare-fun mapKey!29989 () (_ BitVec 32))

(declare-fun mapRest!29989 () (Array (_ BitVec 32) ValueCell!8943))

(assert (=> mapNonEmpty!29989 (= (arr!25822 _values!1152) (store mapRest!29989 mapKey!29989 mapValue!29989))))

(declare-fun b!909288 () Bool)

(declare-fun tp_is_empty!18849 () Bool)

(assert (=> b!909288 (= e!509676 tp_is_empty!18849)))

(declare-fun res!613724 () Bool)

(assert (=> start!77872 (=> (not res!613724) (not e!509672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77872 (= res!613724 (validMask!0 mask!1756))))

(assert (=> start!77872 e!509672))

(declare-fun e!509673 () Bool)

(declare-fun array_inv!20204 (array!53728) Bool)

(assert (=> start!77872 (and (array_inv!20204 _values!1152) e!509673)))

(assert (=> start!77872 tp!57557))

(assert (=> start!77872 true))

(assert (=> start!77872 tp_is_empty!18849))

(declare-fun array_inv!20205 (array!53726) Bool)

(assert (=> start!77872 (array_inv!20205 _keys!1386)))

(declare-fun b!909289 () Bool)

(declare-fun e!509674 () Bool)

(assert (=> b!909289 (= e!509674 tp_is_empty!18849)))

(declare-fun b!909290 () Bool)

(assert (=> b!909290 (= e!509672 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30097)

(declare-fun lt!409973 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30097)

(declare-datatypes ((tuple2!12352 0))(
  ( (tuple2!12353 (_1!6187 (_ BitVec 64)) (_2!6187 V!30097)) )
))
(declare-datatypes ((List!18144 0))(
  ( (Nil!18141) (Cons!18140 (h!19286 tuple2!12352) (t!25725 List!18144)) )
))
(declare-datatypes ((ListLongMap!11049 0))(
  ( (ListLongMap!11050 (toList!5540 List!18144)) )
))
(declare-fun contains!4582 (ListLongMap!11049 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2802 (array!53726 array!53728 (_ BitVec 32) (_ BitVec 32) V!30097 V!30097 (_ BitVec 32) Int) ListLongMap!11049)

(assert (=> b!909290 (= lt!409973 (contains!4582 (getCurrentListMap!2802 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909291 () Bool)

(declare-fun res!613722 () Bool)

(assert (=> b!909291 (=> (not res!613722) (not e!509672))))

(assert (=> b!909291 (= res!613722 (and (= (size!26281 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26280 _keys!1386) (size!26281 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909292 () Bool)

(assert (=> b!909292 (= e!509673 (and e!509674 mapRes!29989))))

(declare-fun condMapEmpty!29989 () Bool)

(declare-fun mapDefault!29989 () ValueCell!8943)

(assert (=> b!909292 (= condMapEmpty!29989 (= (arr!25822 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8943)) mapDefault!29989)))))

(assert (= (and start!77872 res!613724) b!909291))

(assert (= (and b!909291 res!613722) b!909287))

(assert (= (and b!909287 res!613723) b!909286))

(assert (= (and b!909286 res!613725) b!909290))

(assert (= (and b!909292 condMapEmpty!29989) mapIsEmpty!29989))

(assert (= (and b!909292 (not condMapEmpty!29989)) mapNonEmpty!29989))

(get-info :version)

(assert (= (and mapNonEmpty!29989 ((_ is ValueCellFull!8943) mapValue!29989)) b!909288))

(assert (= (and b!909292 ((_ is ValueCellFull!8943) mapDefault!29989)) b!909289))

(assert (= start!77872 b!909292))

(declare-fun m!844569 () Bool)

(assert (=> b!909290 m!844569))

(assert (=> b!909290 m!844569))

(declare-fun m!844571 () Bool)

(assert (=> b!909290 m!844571))

(declare-fun m!844573 () Bool)

(assert (=> mapNonEmpty!29989 m!844573))

(declare-fun m!844575 () Bool)

(assert (=> start!77872 m!844575))

(declare-fun m!844577 () Bool)

(assert (=> start!77872 m!844577))

(declare-fun m!844579 () Bool)

(assert (=> start!77872 m!844579))

(declare-fun m!844581 () Bool)

(assert (=> b!909286 m!844581))

(declare-fun m!844583 () Bool)

(assert (=> b!909287 m!844583))

(check-sat (not mapNonEmpty!29989) (not start!77872) (not b_next!16431) b_and!26999 tp_is_empty!18849 (not b!909287) (not b!909286) (not b!909290))
(check-sat b_and!26999 (not b_next!16431))
