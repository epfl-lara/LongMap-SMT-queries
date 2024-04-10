; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82668 () Bool)

(assert start!82668)

(declare-fun b_free!18801 () Bool)

(declare-fun b_next!18801 () Bool)

(assert (=> start!82668 (= b_free!18801 (not b_next!18801))))

(declare-fun tp!65522 () Bool)

(declare-fun b_and!30289 () Bool)

(assert (=> start!82668 (= tp!65522 b_and!30289)))

(declare-fun b!963789 () Bool)

(declare-fun res!645049 () Bool)

(declare-fun e!543395 () Bool)

(assert (=> b!963789 (=> (not res!645049) (not e!543395))))

(declare-datatypes ((array!59297 0))(
  ( (array!59298 (arr!28517 (Array (_ BitVec 32) (_ BitVec 64))) (size!28996 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59297)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963789 (= res!645049 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28996 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28996 _keys!1686))))))

(declare-fun b!963790 () Bool)

(assert (=> b!963790 (= e!543395 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33787 0))(
  ( (V!33788 (val!10852 Int)) )
))
(declare-datatypes ((ValueCell!10320 0))(
  ( (ValueCellFull!10320 (v!13410 V!33787)) (EmptyCell!10320) )
))
(declare-datatypes ((array!59299 0))(
  ( (array!59300 (arr!28518 (Array (_ BitVec 32) ValueCell!10320)) (size!28997 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59299)

(declare-fun minValue!1342 () V!33787)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33787)

(declare-datatypes ((tuple2!13942 0))(
  ( (tuple2!13943 (_1!6982 (_ BitVec 64)) (_2!6982 V!33787)) )
))
(declare-datatypes ((List!19791 0))(
  ( (Nil!19788) (Cons!19787 (h!20949 tuple2!13942) (t!28154 List!19791)) )
))
(declare-datatypes ((ListLongMap!12639 0))(
  ( (ListLongMap!12640 (toList!6335 List!19791)) )
))
(declare-fun contains!5438 (ListLongMap!12639 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3568 (array!59297 array!59299 (_ BitVec 32) (_ BitVec 32) V!33787 V!33787 (_ BitVec 32) Int) ListLongMap!12639)

(assert (=> b!963790 (contains!5438 (getCurrentListMap!3568 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28517 _keys!1686) i!803))))

(declare-datatypes ((Unit!32253 0))(
  ( (Unit!32254) )
))
(declare-fun lt!431005 () Unit!32253)

(declare-fun lemmaInListMapFromThenInFromMinusOne!21 (array!59297 array!59299 (_ BitVec 32) (_ BitVec 32) V!33787 V!33787 (_ BitVec 32) (_ BitVec 32) Int) Unit!32253)

(assert (=> b!963790 (= lt!431005 (lemmaInListMapFromThenInFromMinusOne!21 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963791 () Bool)

(declare-fun res!645055 () Bool)

(assert (=> b!963791 (=> (not res!645055) (not e!543395))))

(assert (=> b!963791 (= res!645055 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963792 () Bool)

(declare-fun e!543393 () Bool)

(declare-fun tp_is_empty!21603 () Bool)

(assert (=> b!963792 (= e!543393 tp_is_empty!21603)))

(declare-fun mapIsEmpty!34399 () Bool)

(declare-fun mapRes!34399 () Bool)

(assert (=> mapIsEmpty!34399 mapRes!34399))

(declare-fun b!963793 () Bool)

(declare-fun res!645052 () Bool)

(assert (=> b!963793 (=> (not res!645052) (not e!543395))))

(assert (=> b!963793 (= res!645052 (contains!5438 (getCurrentListMap!3568 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28517 _keys!1686) i!803)))))

(declare-fun b!963794 () Bool)

(declare-fun res!645050 () Bool)

(assert (=> b!963794 (=> (not res!645050) (not e!543395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963794 (= res!645050 (validKeyInArray!0 (select (arr!28517 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34399 () Bool)

(declare-fun tp!65523 () Bool)

(assert (=> mapNonEmpty!34399 (= mapRes!34399 (and tp!65523 e!543393))))

(declare-fun mapKey!34399 () (_ BitVec 32))

(declare-fun mapRest!34399 () (Array (_ BitVec 32) ValueCell!10320))

(declare-fun mapValue!34399 () ValueCell!10320)

(assert (=> mapNonEmpty!34399 (= (arr!28518 _values!1400) (store mapRest!34399 mapKey!34399 mapValue!34399))))

(declare-fun b!963796 () Bool)

(declare-fun res!645054 () Bool)

(assert (=> b!963796 (=> (not res!645054) (not e!543395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59297 (_ BitVec 32)) Bool)

(assert (=> b!963796 (= res!645054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963797 () Bool)

(declare-fun e!543394 () Bool)

(assert (=> b!963797 (= e!543394 tp_is_empty!21603)))

(declare-fun b!963798 () Bool)

(declare-fun res!645053 () Bool)

(assert (=> b!963798 (=> (not res!645053) (not e!543395))))

(declare-datatypes ((List!19792 0))(
  ( (Nil!19789) (Cons!19788 (h!20950 (_ BitVec 64)) (t!28155 List!19792)) )
))
(declare-fun arrayNoDuplicates!0 (array!59297 (_ BitVec 32) List!19792) Bool)

(assert (=> b!963798 (= res!645053 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19789))))

(declare-fun b!963799 () Bool)

(declare-fun e!543391 () Bool)

(assert (=> b!963799 (= e!543391 (and e!543394 mapRes!34399))))

(declare-fun condMapEmpty!34399 () Bool)

(declare-fun mapDefault!34399 () ValueCell!10320)

(assert (=> b!963799 (= condMapEmpty!34399 (= (arr!28518 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10320)) mapDefault!34399)))))

(declare-fun res!645048 () Bool)

(assert (=> start!82668 (=> (not res!645048) (not e!543395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82668 (= res!645048 (validMask!0 mask!2110))))

(assert (=> start!82668 e!543395))

(assert (=> start!82668 true))

(declare-fun array_inv!22089 (array!59299) Bool)

(assert (=> start!82668 (and (array_inv!22089 _values!1400) e!543391)))

(declare-fun array_inv!22090 (array!59297) Bool)

(assert (=> start!82668 (array_inv!22090 _keys!1686)))

(assert (=> start!82668 tp!65522))

(assert (=> start!82668 tp_is_empty!21603))

(declare-fun b!963795 () Bool)

(declare-fun res!645051 () Bool)

(assert (=> b!963795 (=> (not res!645051) (not e!543395))))

(assert (=> b!963795 (= res!645051 (and (= (size!28997 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28996 _keys!1686) (size!28997 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82668 res!645048) b!963795))

(assert (= (and b!963795 res!645051) b!963796))

(assert (= (and b!963796 res!645054) b!963798))

(assert (= (and b!963798 res!645053) b!963789))

(assert (= (and b!963789 res!645049) b!963794))

(assert (= (and b!963794 res!645050) b!963793))

(assert (= (and b!963793 res!645052) b!963791))

(assert (= (and b!963791 res!645055) b!963790))

(assert (= (and b!963799 condMapEmpty!34399) mapIsEmpty!34399))

(assert (= (and b!963799 (not condMapEmpty!34399)) mapNonEmpty!34399))

(get-info :version)

(assert (= (and mapNonEmpty!34399 ((_ is ValueCellFull!10320) mapValue!34399)) b!963792))

(assert (= (and b!963799 ((_ is ValueCellFull!10320) mapDefault!34399)) b!963797))

(assert (= start!82668 b!963799))

(declare-fun m!893135 () Bool)

(assert (=> b!963790 m!893135))

(declare-fun m!893137 () Bool)

(assert (=> b!963790 m!893137))

(assert (=> b!963790 m!893135))

(assert (=> b!963790 m!893137))

(declare-fun m!893139 () Bool)

(assert (=> b!963790 m!893139))

(declare-fun m!893141 () Bool)

(assert (=> b!963790 m!893141))

(declare-fun m!893143 () Bool)

(assert (=> mapNonEmpty!34399 m!893143))

(declare-fun m!893145 () Bool)

(assert (=> b!963798 m!893145))

(declare-fun m!893147 () Bool)

(assert (=> b!963793 m!893147))

(assert (=> b!963793 m!893137))

(assert (=> b!963793 m!893147))

(assert (=> b!963793 m!893137))

(declare-fun m!893149 () Bool)

(assert (=> b!963793 m!893149))

(declare-fun m!893151 () Bool)

(assert (=> start!82668 m!893151))

(declare-fun m!893153 () Bool)

(assert (=> start!82668 m!893153))

(declare-fun m!893155 () Bool)

(assert (=> start!82668 m!893155))

(assert (=> b!963794 m!893137))

(assert (=> b!963794 m!893137))

(declare-fun m!893157 () Bool)

(assert (=> b!963794 m!893157))

(declare-fun m!893159 () Bool)

(assert (=> b!963796 m!893159))

(check-sat (not b_next!18801) tp_is_empty!21603 b_and!30289 (not mapNonEmpty!34399) (not start!82668) (not b!963796) (not b!963794) (not b!963793) (not b!963790) (not b!963798))
(check-sat b_and!30289 (not b_next!18801))
