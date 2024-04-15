; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108104 () Bool)

(assert start!108104)

(declare-fun b_free!27817 () Bool)

(declare-fun b_next!27817 () Bool)

(assert (=> start!108104 (= b_free!27817 (not b_next!27817))))

(declare-fun tp!98406 () Bool)

(declare-fun b_and!45855 () Bool)

(assert (=> start!108104 (= tp!98406 b_and!45855)))

(declare-fun res!848378 () Bool)

(declare-fun e!729004 () Bool)

(assert (=> start!108104 (=> (not res!848378) (not e!729004))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108104 (= res!848378 (validMask!0 mask!1805))))

(assert (=> start!108104 e!729004))

(assert (=> start!108104 true))

(assert (=> start!108104 tp!98406))

(declare-fun tp_is_empty!33367 () Bool)

(assert (=> start!108104 tp_is_empty!33367))

(declare-datatypes ((V!49593 0))(
  ( (V!49594 (val!16758 Int)) )
))
(declare-datatypes ((ValueCell!15785 0))(
  ( (ValueCellFull!15785 (v!19354 V!49593)) (EmptyCell!15785) )
))
(declare-datatypes ((array!83727 0))(
  ( (array!83728 (arr!40375 (Array (_ BitVec 32) ValueCell!15785)) (size!40927 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83727)

(declare-fun e!729003 () Bool)

(declare-fun array_inv!30837 (array!83727) Bool)

(assert (=> start!108104 (and (array_inv!30837 _values!1187) e!729003)))

(declare-datatypes ((array!83729 0))(
  ( (array!83730 (arr!40376 (Array (_ BitVec 32) (_ BitVec 64))) (size!40928 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83729)

(declare-fun array_inv!30838 (array!83729) Bool)

(assert (=> start!108104 (array_inv!30838 _keys!1427)))

(declare-fun b!1276585 () Bool)

(declare-fun res!848376 () Bool)

(assert (=> b!1276585 (=> (not res!848376) (not e!729004))))

(declare-datatypes ((List!28741 0))(
  ( (Nil!28738) (Cons!28737 (h!29946 (_ BitVec 64)) (t!42269 List!28741)) )
))
(declare-fun arrayNoDuplicates!0 (array!83729 (_ BitVec 32) List!28741) Bool)

(assert (=> b!1276585 (= res!848376 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28738))))

(declare-fun mapIsEmpty!51581 () Bool)

(declare-fun mapRes!51581 () Bool)

(assert (=> mapIsEmpty!51581 mapRes!51581))

(declare-fun b!1276586 () Bool)

(declare-fun e!729007 () Bool)

(assert (=> b!1276586 (= e!729007 tp_is_empty!33367)))

(declare-fun b!1276587 () Bool)

(declare-fun res!848379 () Bool)

(assert (=> b!1276587 (=> (not res!848379) (not e!729004))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276587 (= res!848379 (and (= (size!40927 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40928 _keys!1427) (size!40927 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276588 () Bool)

(assert (=> b!1276588 (= e!729004 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49593)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49593)

(declare-fun lt!575340 () Bool)

(declare-datatypes ((tuple2!21572 0))(
  ( (tuple2!21573 (_1!10797 (_ BitVec 64)) (_2!10797 V!49593)) )
))
(declare-datatypes ((List!28742 0))(
  ( (Nil!28739) (Cons!28738 (h!29947 tuple2!21572) (t!42270 List!28742)) )
))
(declare-datatypes ((ListLongMap!19229 0))(
  ( (ListLongMap!19230 (toList!9630 List!28742)) )
))
(declare-fun contains!7670 (ListLongMap!19229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4604 (array!83729 array!83727 (_ BitVec 32) (_ BitVec 32) V!49593 V!49593 (_ BitVec 32) Int) ListLongMap!19229)

(assert (=> b!1276588 (= lt!575340 (contains!7670 (getCurrentListMap!4604 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276589 () Bool)

(declare-fun e!729006 () Bool)

(assert (=> b!1276589 (= e!729006 tp_is_empty!33367)))

(declare-fun b!1276590 () Bool)

(declare-fun res!848377 () Bool)

(assert (=> b!1276590 (=> (not res!848377) (not e!729004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83729 (_ BitVec 32)) Bool)

(assert (=> b!1276590 (= res!848377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276591 () Bool)

(assert (=> b!1276591 (= e!729003 (and e!729007 mapRes!51581))))

(declare-fun condMapEmpty!51581 () Bool)

(declare-fun mapDefault!51581 () ValueCell!15785)

(assert (=> b!1276591 (= condMapEmpty!51581 (= (arr!40375 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15785)) mapDefault!51581)))))

(declare-fun mapNonEmpty!51581 () Bool)

(declare-fun tp!98405 () Bool)

(assert (=> mapNonEmpty!51581 (= mapRes!51581 (and tp!98405 e!729006))))

(declare-fun mapRest!51581 () (Array (_ BitVec 32) ValueCell!15785))

(declare-fun mapKey!51581 () (_ BitVec 32))

(declare-fun mapValue!51581 () ValueCell!15785)

(assert (=> mapNonEmpty!51581 (= (arr!40375 _values!1187) (store mapRest!51581 mapKey!51581 mapValue!51581))))

(assert (= (and start!108104 res!848378) b!1276587))

(assert (= (and b!1276587 res!848379) b!1276590))

(assert (= (and b!1276590 res!848377) b!1276585))

(assert (= (and b!1276585 res!848376) b!1276588))

(assert (= (and b!1276591 condMapEmpty!51581) mapIsEmpty!51581))

(assert (= (and b!1276591 (not condMapEmpty!51581)) mapNonEmpty!51581))

(get-info :version)

(assert (= (and mapNonEmpty!51581 ((_ is ValueCellFull!15785) mapValue!51581)) b!1276589))

(assert (= (and b!1276591 ((_ is ValueCellFull!15785) mapDefault!51581)) b!1276586))

(assert (= start!108104 b!1276591))

(declare-fun m!1172013 () Bool)

(assert (=> b!1276588 m!1172013))

(assert (=> b!1276588 m!1172013))

(declare-fun m!1172015 () Bool)

(assert (=> b!1276588 m!1172015))

(declare-fun m!1172017 () Bool)

(assert (=> mapNonEmpty!51581 m!1172017))

(declare-fun m!1172019 () Bool)

(assert (=> b!1276585 m!1172019))

(declare-fun m!1172021 () Bool)

(assert (=> b!1276590 m!1172021))

(declare-fun m!1172023 () Bool)

(assert (=> start!108104 m!1172023))

(declare-fun m!1172025 () Bool)

(assert (=> start!108104 m!1172025))

(declare-fun m!1172027 () Bool)

(assert (=> start!108104 m!1172027))

(check-sat (not b!1276585) (not mapNonEmpty!51581) (not b_next!27817) tp_is_empty!33367 (not start!108104) (not b!1276588) b_and!45855 (not b!1276590))
(check-sat b_and!45855 (not b_next!27817))
