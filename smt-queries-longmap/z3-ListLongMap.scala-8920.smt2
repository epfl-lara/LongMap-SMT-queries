; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108190 () Bool)

(assert start!108190)

(declare-fun b_free!27885 () Bool)

(declare-fun b_next!27885 () Bool)

(assert (=> start!108190 (= b_free!27885 (not b_next!27885))))

(declare-fun tp!98611 () Bool)

(declare-fun b_and!45943 () Bool)

(assert (=> start!108190 (= tp!98611 b_and!45943)))

(declare-fun b!1277592 () Bool)

(declare-fun res!848917 () Bool)

(declare-fun e!729654 () Bool)

(assert (=> b!1277592 (=> (not res!848917) (not e!729654))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83964 0))(
  ( (array!83965 (arr!40492 (Array (_ BitVec 32) (_ BitVec 64))) (size!41042 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83964)

(declare-datatypes ((V!49683 0))(
  ( (V!49684 (val!16792 Int)) )
))
(declare-datatypes ((ValueCell!15819 0))(
  ( (ValueCellFull!15819 (v!19390 V!49683)) (EmptyCell!15819) )
))
(declare-datatypes ((array!83966 0))(
  ( (array!83967 (arr!40493 (Array (_ BitVec 32) ValueCell!15819)) (size!41043 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83966)

(assert (=> b!1277592 (= res!848917 (and (= (size!41043 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41042 _keys!1427) (size!41043 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!848919 () Bool)

(assert (=> start!108190 (=> (not res!848919) (not e!729654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108190 (= res!848919 (validMask!0 mask!1805))))

(assert (=> start!108190 e!729654))

(assert (=> start!108190 true))

(assert (=> start!108190 tp!98611))

(declare-fun tp_is_empty!33435 () Bool)

(assert (=> start!108190 tp_is_empty!33435))

(declare-fun e!729651 () Bool)

(declare-fun array_inv!30763 (array!83966) Bool)

(assert (=> start!108190 (and (array_inv!30763 _values!1187) e!729651)))

(declare-fun array_inv!30764 (array!83964) Bool)

(assert (=> start!108190 (array_inv!30764 _keys!1427)))

(declare-fun b!1277593 () Bool)

(assert (=> b!1277593 (= e!729654 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49683)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun lt!575719 () Bool)

(declare-fun zeroValue!1129 () V!49683)

(declare-datatypes ((tuple2!21538 0))(
  ( (tuple2!21539 (_1!10780 (_ BitVec 64)) (_2!10780 V!49683)) )
))
(declare-datatypes ((List!28715 0))(
  ( (Nil!28712) (Cons!28711 (h!29920 tuple2!21538) (t!42253 List!28715)) )
))
(declare-datatypes ((ListLongMap!19195 0))(
  ( (ListLongMap!19196 (toList!9613 List!28715)) )
))
(declare-fun contains!7723 (ListLongMap!19195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4697 (array!83964 array!83966 (_ BitVec 32) (_ BitVec 32) V!49683 V!49683 (_ BitVec 32) Int) ListLongMap!19195)

(assert (=> b!1277593 (= lt!575719 (contains!7723 (getCurrentListMap!4697 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun mapNonEmpty!51686 () Bool)

(declare-fun mapRes!51686 () Bool)

(declare-fun tp!98612 () Bool)

(declare-fun e!729650 () Bool)

(assert (=> mapNonEmpty!51686 (= mapRes!51686 (and tp!98612 e!729650))))

(declare-fun mapValue!51686 () ValueCell!15819)

(declare-fun mapRest!51686 () (Array (_ BitVec 32) ValueCell!15819))

(declare-fun mapKey!51686 () (_ BitVec 32))

(assert (=> mapNonEmpty!51686 (= (arr!40493 _values!1187) (store mapRest!51686 mapKey!51686 mapValue!51686))))

(declare-fun b!1277594 () Bool)

(assert (=> b!1277594 (= e!729650 tp_is_empty!33435)))

(declare-fun b!1277595 () Bool)

(declare-fun e!729652 () Bool)

(assert (=> b!1277595 (= e!729651 (and e!729652 mapRes!51686))))

(declare-fun condMapEmpty!51686 () Bool)

(declare-fun mapDefault!51686 () ValueCell!15819)

(assert (=> b!1277595 (= condMapEmpty!51686 (= (arr!40493 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15819)) mapDefault!51686)))))

(declare-fun b!1277596 () Bool)

(assert (=> b!1277596 (= e!729652 tp_is_empty!33435)))

(declare-fun mapIsEmpty!51686 () Bool)

(assert (=> mapIsEmpty!51686 mapRes!51686))

(declare-fun b!1277597 () Bool)

(declare-fun res!848918 () Bool)

(assert (=> b!1277597 (=> (not res!848918) (not e!729654))))

(declare-datatypes ((List!28716 0))(
  ( (Nil!28713) (Cons!28712 (h!29921 (_ BitVec 64)) (t!42254 List!28716)) )
))
(declare-fun arrayNoDuplicates!0 (array!83964 (_ BitVec 32) List!28716) Bool)

(assert (=> b!1277597 (= res!848918 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28713))))

(declare-fun b!1277598 () Bool)

(declare-fun res!848916 () Bool)

(assert (=> b!1277598 (=> (not res!848916) (not e!729654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83964 (_ BitVec 32)) Bool)

(assert (=> b!1277598 (= res!848916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(assert (= (and start!108190 res!848919) b!1277592))

(assert (= (and b!1277592 res!848917) b!1277598))

(assert (= (and b!1277598 res!848916) b!1277597))

(assert (= (and b!1277597 res!848918) b!1277593))

(assert (= (and b!1277595 condMapEmpty!51686) mapIsEmpty!51686))

(assert (= (and b!1277595 (not condMapEmpty!51686)) mapNonEmpty!51686))

(get-info :version)

(assert (= (and mapNonEmpty!51686 ((_ is ValueCellFull!15819) mapValue!51686)) b!1277594))

(assert (= (and b!1277595 ((_ is ValueCellFull!15819) mapDefault!51686)) b!1277596))

(assert (= start!108190 b!1277595))

(declare-fun m!1173177 () Bool)

(assert (=> b!1277593 m!1173177))

(assert (=> b!1277593 m!1173177))

(declare-fun m!1173179 () Bool)

(assert (=> b!1277593 m!1173179))

(declare-fun m!1173181 () Bool)

(assert (=> b!1277598 m!1173181))

(declare-fun m!1173183 () Bool)

(assert (=> b!1277597 m!1173183))

(declare-fun m!1173185 () Bool)

(assert (=> mapNonEmpty!51686 m!1173185))

(declare-fun m!1173187 () Bool)

(assert (=> start!108190 m!1173187))

(declare-fun m!1173189 () Bool)

(assert (=> start!108190 m!1173189))

(declare-fun m!1173191 () Bool)

(assert (=> start!108190 m!1173191))

(check-sat (not b_next!27885) (not mapNonEmpty!51686) (not b!1277597) b_and!45943 (not b!1277598) (not b!1277593) (not start!108190) tp_is_empty!33435)
(check-sat b_and!45943 (not b_next!27885))
