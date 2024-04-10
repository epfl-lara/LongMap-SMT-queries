; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110466 () Bool)

(assert start!110466)

(declare-fun b!1306804 () Bool)

(declare-fun res!867495 () Bool)

(declare-fun e!745619 () Bool)

(assert (=> b!1306804 (=> (not res!867495) (not e!745619))))

(declare-datatypes ((array!87072 0))(
  ( (array!87073 (arr!42016 (Array (_ BitVec 32) (_ BitVec 64))) (size!42566 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87072)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87072 (_ BitVec 32)) Bool)

(assert (=> b!1306804 (= res!867495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306805 () Bool)

(declare-fun e!745618 () Bool)

(declare-fun tp_is_empty!35031 () Bool)

(assert (=> b!1306805 (= e!745618 tp_is_empty!35031)))

(declare-fun b!1306806 () Bool)

(declare-fun e!745621 () Bool)

(declare-fun e!745622 () Bool)

(declare-fun mapRes!54175 () Bool)

(assert (=> b!1306806 (= e!745621 (and e!745622 mapRes!54175))))

(declare-fun condMapEmpty!54175 () Bool)

(declare-datatypes ((V!51811 0))(
  ( (V!51812 (val!17590 Int)) )
))
(declare-datatypes ((ValueCell!16617 0))(
  ( (ValueCellFull!16617 (v!20217 V!51811)) (EmptyCell!16617) )
))
(declare-datatypes ((array!87074 0))(
  ( (array!87075 (arr!42017 (Array (_ BitVec 32) ValueCell!16617)) (size!42567 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87074)

(declare-fun mapDefault!54175 () ValueCell!16617)

(assert (=> b!1306806 (= condMapEmpty!54175 (= (arr!42017 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16617)) mapDefault!54175)))))

(declare-fun b!1306807 () Bool)

(declare-fun res!867494 () Bool)

(assert (=> b!1306807 (=> (not res!867494) (not e!745619))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306807 (= res!867494 (and (= (size!42567 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42566 _keys!1628) (size!42567 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!867493 () Bool)

(assert (=> start!110466 (=> (not res!867493) (not e!745619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110466 (= res!867493 (validMask!0 mask!2040))))

(assert (=> start!110466 e!745619))

(assert (=> start!110466 true))

(declare-fun array_inv!31765 (array!87074) Bool)

(assert (=> start!110466 (and (array_inv!31765 _values!1354) e!745621)))

(declare-fun array_inv!31766 (array!87072) Bool)

(assert (=> start!110466 (array_inv!31766 _keys!1628)))

(declare-fun b!1306808 () Bool)

(assert (=> b!1306808 (= e!745619 false)))

(declare-fun lt!584979 () Bool)

(declare-datatypes ((List!29799 0))(
  ( (Nil!29796) (Cons!29795 (h!31004 (_ BitVec 64)) (t!43405 List!29799)) )
))
(declare-fun arrayNoDuplicates!0 (array!87072 (_ BitVec 32) List!29799) Bool)

(assert (=> b!1306808 (= lt!584979 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29796))))

(declare-fun mapIsEmpty!54175 () Bool)

(assert (=> mapIsEmpty!54175 mapRes!54175))

(declare-fun mapNonEmpty!54175 () Bool)

(declare-fun tp!103255 () Bool)

(assert (=> mapNonEmpty!54175 (= mapRes!54175 (and tp!103255 e!745618))))

(declare-fun mapKey!54175 () (_ BitVec 32))

(declare-fun mapRest!54175 () (Array (_ BitVec 32) ValueCell!16617))

(declare-fun mapValue!54175 () ValueCell!16617)

(assert (=> mapNonEmpty!54175 (= (arr!42017 _values!1354) (store mapRest!54175 mapKey!54175 mapValue!54175))))

(declare-fun b!1306809 () Bool)

(assert (=> b!1306809 (= e!745622 tp_is_empty!35031)))

(assert (= (and start!110466 res!867493) b!1306807))

(assert (= (and b!1306807 res!867494) b!1306804))

(assert (= (and b!1306804 res!867495) b!1306808))

(assert (= (and b!1306806 condMapEmpty!54175) mapIsEmpty!54175))

(assert (= (and b!1306806 (not condMapEmpty!54175)) mapNonEmpty!54175))

(get-info :version)

(assert (= (and mapNonEmpty!54175 ((_ is ValueCellFull!16617) mapValue!54175)) b!1306805))

(assert (= (and b!1306806 ((_ is ValueCellFull!16617) mapDefault!54175)) b!1306809))

(assert (= start!110466 b!1306806))

(declare-fun m!1197717 () Bool)

(assert (=> b!1306804 m!1197717))

(declare-fun m!1197719 () Bool)

(assert (=> start!110466 m!1197719))

(declare-fun m!1197721 () Bool)

(assert (=> start!110466 m!1197721))

(declare-fun m!1197723 () Bool)

(assert (=> start!110466 m!1197723))

(declare-fun m!1197725 () Bool)

(assert (=> b!1306808 m!1197725))

(declare-fun m!1197727 () Bool)

(assert (=> mapNonEmpty!54175 m!1197727))

(check-sat (not b!1306808) (not b!1306804) (not mapNonEmpty!54175) tp_is_empty!35031 (not start!110466))
(check-sat)
