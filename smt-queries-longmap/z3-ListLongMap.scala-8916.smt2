; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108166 () Bool)

(assert start!108166)

(declare-fun b_free!27861 () Bool)

(declare-fun b_next!27861 () Bool)

(assert (=> start!108166 (= b_free!27861 (not b_next!27861))))

(declare-fun tp!98540 () Bool)

(declare-fun b_and!45919 () Bool)

(assert (=> start!108166 (= tp!98540 b_and!45919)))

(declare-fun res!848774 () Bool)

(declare-fun e!729470 () Bool)

(assert (=> start!108166 (=> (not res!848774) (not e!729470))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108166 (= res!848774 (validMask!0 mask!1805))))

(assert (=> start!108166 e!729470))

(assert (=> start!108166 true))

(assert (=> start!108166 tp!98540))

(declare-fun tp_is_empty!33411 () Bool)

(assert (=> start!108166 tp_is_empty!33411))

(declare-datatypes ((V!49651 0))(
  ( (V!49652 (val!16780 Int)) )
))
(declare-datatypes ((ValueCell!15807 0))(
  ( (ValueCellFull!15807 (v!19378 V!49651)) (EmptyCell!15807) )
))
(declare-datatypes ((array!83916 0))(
  ( (array!83917 (arr!40468 (Array (_ BitVec 32) ValueCell!15807)) (size!41018 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83916)

(declare-fun e!729474 () Bool)

(declare-fun array_inv!30747 (array!83916) Bool)

(assert (=> start!108166 (and (array_inv!30747 _values!1187) e!729474)))

(declare-datatypes ((array!83918 0))(
  ( (array!83919 (arr!40469 (Array (_ BitVec 32) (_ BitVec 64))) (size!41019 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83918)

(declare-fun array_inv!30748 (array!83918) Bool)

(assert (=> start!108166 (array_inv!30748 _keys!1427)))

(declare-fun b!1277340 () Bool)

(declare-fun e!729471 () Bool)

(declare-fun mapRes!51650 () Bool)

(assert (=> b!1277340 (= e!729474 (and e!729471 mapRes!51650))))

(declare-fun condMapEmpty!51650 () Bool)

(declare-fun mapDefault!51650 () ValueCell!15807)

(assert (=> b!1277340 (= condMapEmpty!51650 (= (arr!40468 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15807)) mapDefault!51650)))))

(declare-fun mapIsEmpty!51650 () Bool)

(assert (=> mapIsEmpty!51650 mapRes!51650))

(declare-fun b!1277341 () Bool)

(declare-fun e!729473 () Bool)

(assert (=> b!1277341 (= e!729473 tp_is_empty!33411)))

(declare-fun b!1277342 () Bool)

(declare-fun res!848773 () Bool)

(assert (=> b!1277342 (=> (not res!848773) (not e!729470))))

(declare-datatypes ((List!28700 0))(
  ( (Nil!28697) (Cons!28696 (h!29905 (_ BitVec 64)) (t!42238 List!28700)) )
))
(declare-fun arrayNoDuplicates!0 (array!83918 (_ BitVec 32) List!28700) Bool)

(assert (=> b!1277342 (= res!848773 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28697))))

(declare-fun b!1277343 () Bool)

(declare-fun res!848772 () Bool)

(assert (=> b!1277343 (=> (not res!848772) (not e!729470))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1277343 (= res!848772 (and (= (size!41018 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41019 _keys!1427) (size!41018 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51650 () Bool)

(declare-fun tp!98539 () Bool)

(assert (=> mapNonEmpty!51650 (= mapRes!51650 (and tp!98539 e!729473))))

(declare-fun mapValue!51650 () ValueCell!15807)

(declare-fun mapKey!51650 () (_ BitVec 32))

(declare-fun mapRest!51650 () (Array (_ BitVec 32) ValueCell!15807))

(assert (=> mapNonEmpty!51650 (= (arr!40468 _values!1187) (store mapRest!51650 mapKey!51650 mapValue!51650))))

(declare-fun b!1277344 () Bool)

(assert (=> b!1277344 (= e!729470 false)))

(declare-fun lt!575683 () Bool)

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49651)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49651)

(declare-datatypes ((tuple2!21524 0))(
  ( (tuple2!21525 (_1!10773 (_ BitVec 64)) (_2!10773 V!49651)) )
))
(declare-datatypes ((List!28701 0))(
  ( (Nil!28698) (Cons!28697 (h!29906 tuple2!21524) (t!42239 List!28701)) )
))
(declare-datatypes ((ListLongMap!19181 0))(
  ( (ListLongMap!19182 (toList!9606 List!28701)) )
))
(declare-fun contains!7716 (ListLongMap!19181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4690 (array!83918 array!83916 (_ BitVec 32) (_ BitVec 32) V!49651 V!49651 (_ BitVec 32) Int) ListLongMap!19181)

(assert (=> b!1277344 (= lt!575683 (contains!7716 (getCurrentListMap!4690 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277345 () Bool)

(declare-fun res!848775 () Bool)

(assert (=> b!1277345 (=> (not res!848775) (not e!729470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83918 (_ BitVec 32)) Bool)

(assert (=> b!1277345 (= res!848775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277346 () Bool)

(assert (=> b!1277346 (= e!729471 tp_is_empty!33411)))

(assert (= (and start!108166 res!848774) b!1277343))

(assert (= (and b!1277343 res!848772) b!1277345))

(assert (= (and b!1277345 res!848775) b!1277342))

(assert (= (and b!1277342 res!848773) b!1277344))

(assert (= (and b!1277340 condMapEmpty!51650) mapIsEmpty!51650))

(assert (= (and b!1277340 (not condMapEmpty!51650)) mapNonEmpty!51650))

(get-info :version)

(assert (= (and mapNonEmpty!51650 ((_ is ValueCellFull!15807) mapValue!51650)) b!1277341))

(assert (= (and b!1277340 ((_ is ValueCellFull!15807) mapDefault!51650)) b!1277346))

(assert (= start!108166 b!1277340))

(declare-fun m!1172985 () Bool)

(assert (=> start!108166 m!1172985))

(declare-fun m!1172987 () Bool)

(assert (=> start!108166 m!1172987))

(declare-fun m!1172989 () Bool)

(assert (=> start!108166 m!1172989))

(declare-fun m!1172991 () Bool)

(assert (=> b!1277345 m!1172991))

(declare-fun m!1172993 () Bool)

(assert (=> mapNonEmpty!51650 m!1172993))

(declare-fun m!1172995 () Bool)

(assert (=> b!1277344 m!1172995))

(assert (=> b!1277344 m!1172995))

(declare-fun m!1172997 () Bool)

(assert (=> b!1277344 m!1172997))

(declare-fun m!1172999 () Bool)

(assert (=> b!1277342 m!1172999))

(check-sat tp_is_empty!33411 (not b!1277342) (not b!1277345) b_and!45919 (not b_next!27861) (not start!108166) (not b!1277344) (not mapNonEmpty!51650))
(check-sat b_and!45919 (not b_next!27861))
