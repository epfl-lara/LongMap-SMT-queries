; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108124 () Bool)

(assert start!108124)

(declare-fun b_free!27837 () Bool)

(declare-fun b_next!27837 () Bool)

(assert (=> start!108124 (= b_free!27837 (not b_next!27837))))

(declare-fun tp!98464 () Bool)

(declare-fun b_and!45893 () Bool)

(assert (=> start!108124 (= tp!98464 b_and!45893)))

(declare-fun b!1276879 () Bool)

(declare-fun e!729190 () Bool)

(declare-fun tp_is_empty!33387 () Bool)

(assert (=> b!1276879 (= e!729190 tp_is_empty!33387)))

(declare-fun b!1276880 () Bool)

(declare-fun res!848534 () Bool)

(declare-fun e!729189 () Bool)

(assert (=> b!1276880 (=> (not res!848534) (not e!729189))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83866 0))(
  ( (array!83867 (arr!40444 (Array (_ BitVec 32) (_ BitVec 64))) (size!40994 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83866)

(declare-datatypes ((V!49619 0))(
  ( (V!49620 (val!16768 Int)) )
))
(declare-datatypes ((ValueCell!15795 0))(
  ( (ValueCellFull!15795 (v!19365 V!49619)) (EmptyCell!15795) )
))
(declare-datatypes ((array!83868 0))(
  ( (array!83869 (arr!40445 (Array (_ BitVec 32) ValueCell!15795)) (size!40995 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83868)

(assert (=> b!1276880 (= res!848534 (and (= (size!40995 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40994 _keys!1427) (size!40995 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276881 () Bool)

(declare-fun e!729191 () Bool)

(declare-fun k0!1053 () (_ BitVec 64))

(assert (=> b!1276881 (= e!729191 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1276882 () Bool)

(declare-fun res!848538 () Bool)

(assert (=> b!1276882 (=> (not res!848538) (not e!729189))))

(assert (=> b!1276882 (= res!848538 (bvslt #b00000000000000000000000000000000 (size!40994 _keys!1427)))))

(declare-fun mapIsEmpty!51611 () Bool)

(declare-fun mapRes!51611 () Bool)

(assert (=> mapIsEmpty!51611 mapRes!51611))

(declare-fun mapNonEmpty!51611 () Bool)

(declare-fun tp!98465 () Bool)

(declare-fun e!729192 () Bool)

(assert (=> mapNonEmpty!51611 (= mapRes!51611 (and tp!98465 e!729192))))

(declare-fun mapKey!51611 () (_ BitVec 32))

(declare-fun mapValue!51611 () ValueCell!15795)

(declare-fun mapRest!51611 () (Array (_ BitVec 32) ValueCell!15795))

(assert (=> mapNonEmpty!51611 (= (arr!40445 _values!1187) (store mapRest!51611 mapKey!51611 mapValue!51611))))

(declare-fun res!848536 () Bool)

(assert (=> start!108124 (=> (not res!848536) (not e!729189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108124 (= res!848536 (validMask!0 mask!1805))))

(assert (=> start!108124 e!729189))

(assert (=> start!108124 true))

(assert (=> start!108124 tp!98464))

(assert (=> start!108124 tp_is_empty!33387))

(declare-fun e!729187 () Bool)

(declare-fun array_inv!30731 (array!83868) Bool)

(assert (=> start!108124 (and (array_inv!30731 _values!1187) e!729187)))

(declare-fun array_inv!30732 (array!83866) Bool)

(assert (=> start!108124 (array_inv!30732 _keys!1427)))

(declare-fun b!1276883 () Bool)

(assert (=> b!1276883 (= e!729189 (not true))))

(assert (=> b!1276883 e!729191))

(declare-fun c!123939 () Bool)

(assert (=> b!1276883 (= c!123939 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49619)

(declare-datatypes ((Unit!42361 0))(
  ( (Unit!42362) )
))
(declare-fun lt!575548 () Unit!42361)

(declare-fun zeroValue!1129 () V!49619)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!623 (array!83866 array!83868 (_ BitVec 32) (_ BitVec 32) V!49619 V!49619 (_ BitVec 64) (_ BitVec 32) Int) Unit!42361)

(assert (=> b!1276883 (= lt!575548 (lemmaListMapContainsThenArrayContainsFrom!623 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1276884 () Bool)

(assert (=> b!1276884 (= e!729192 tp_is_empty!33387)))

(declare-fun b!1276885 () Bool)

(declare-fun res!848535 () Bool)

(assert (=> b!1276885 (=> (not res!848535) (not e!729189))))

(declare-datatypes ((tuple2!21504 0))(
  ( (tuple2!21505 (_1!10763 (_ BitVec 64)) (_2!10763 V!49619)) )
))
(declare-datatypes ((List!28681 0))(
  ( (Nil!28678) (Cons!28677 (h!29886 tuple2!21504) (t!42217 List!28681)) )
))
(declare-datatypes ((ListLongMap!19161 0))(
  ( (ListLongMap!19162 (toList!9596 List!28681)) )
))
(declare-fun contains!7705 (ListLongMap!19161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4680 (array!83866 array!83868 (_ BitVec 32) (_ BitVec 32) V!49619 V!49619 (_ BitVec 32) Int) ListLongMap!19161)

(assert (=> b!1276885 (= res!848535 (contains!7705 (getCurrentListMap!4680 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276886 () Bool)

(declare-fun res!848533 () Bool)

(assert (=> b!1276886 (=> (not res!848533) (not e!729189))))

(declare-datatypes ((List!28682 0))(
  ( (Nil!28679) (Cons!28678 (h!29887 (_ BitVec 64)) (t!42218 List!28682)) )
))
(declare-fun arrayNoDuplicates!0 (array!83866 (_ BitVec 32) List!28682) Bool)

(assert (=> b!1276886 (= res!848533 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28679))))

(declare-fun b!1276887 () Bool)

(declare-fun res!848537 () Bool)

(assert (=> b!1276887 (=> (not res!848537) (not e!729189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83866 (_ BitVec 32)) Bool)

(assert (=> b!1276887 (= res!848537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276888 () Bool)

(assert (=> b!1276888 (= e!729187 (and e!729190 mapRes!51611))))

(declare-fun condMapEmpty!51611 () Bool)

(declare-fun mapDefault!51611 () ValueCell!15795)

(assert (=> b!1276888 (= condMapEmpty!51611 (= (arr!40445 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15795)) mapDefault!51611)))))

(declare-fun b!1276889 () Bool)

(declare-fun arrayContainsKey!0 (array!83866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276889 (= e!729191 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(assert (= (and start!108124 res!848536) b!1276880))

(assert (= (and b!1276880 res!848534) b!1276887))

(assert (= (and b!1276887 res!848537) b!1276886))

(assert (= (and b!1276886 res!848533) b!1276885))

(assert (= (and b!1276885 res!848535) b!1276882))

(assert (= (and b!1276882 res!848538) b!1276883))

(assert (= (and b!1276883 c!123939) b!1276889))

(assert (= (and b!1276883 (not c!123939)) b!1276881))

(assert (= (and b!1276888 condMapEmpty!51611) mapIsEmpty!51611))

(assert (= (and b!1276888 (not condMapEmpty!51611)) mapNonEmpty!51611))

(get-info :version)

(assert (= (and mapNonEmpty!51611 ((_ is ValueCellFull!15795) mapValue!51611)) b!1276884))

(assert (= (and b!1276888 ((_ is ValueCellFull!15795) mapDefault!51611)) b!1276879))

(assert (= start!108124 b!1276888))

(declare-fun m!1172677 () Bool)

(assert (=> mapNonEmpty!51611 m!1172677))

(declare-fun m!1172679 () Bool)

(assert (=> b!1276886 m!1172679))

(declare-fun m!1172681 () Bool)

(assert (=> start!108124 m!1172681))

(declare-fun m!1172683 () Bool)

(assert (=> start!108124 m!1172683))

(declare-fun m!1172685 () Bool)

(assert (=> start!108124 m!1172685))

(declare-fun m!1172687 () Bool)

(assert (=> b!1276889 m!1172687))

(declare-fun m!1172689 () Bool)

(assert (=> b!1276887 m!1172689))

(declare-fun m!1172691 () Bool)

(assert (=> b!1276883 m!1172691))

(declare-fun m!1172693 () Bool)

(assert (=> b!1276885 m!1172693))

(assert (=> b!1276885 m!1172693))

(declare-fun m!1172695 () Bool)

(assert (=> b!1276885 m!1172695))

(check-sat (not b_next!27837) (not b!1276889) (not b!1276883) (not b!1276886) (not b!1276887) (not start!108124) tp_is_empty!33387 b_and!45893 (not b!1276885) (not mapNonEmpty!51611))
(check-sat b_and!45893 (not b_next!27837))
