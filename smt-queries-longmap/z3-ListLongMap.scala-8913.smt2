; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108128 () Bool)

(assert start!108128)

(declare-fun b_free!27841 () Bool)

(declare-fun b_next!27841 () Bool)

(assert (=> start!108128 (= b_free!27841 (not b_next!27841))))

(declare-fun tp!98478 () Bool)

(declare-fun b_and!45879 () Bool)

(assert (=> start!108128 (= tp!98478 b_and!45879)))

(declare-fun b!1276881 () Bool)

(declare-fun e!729199 () Bool)

(declare-fun e!729194 () Bool)

(declare-fun mapRes!51617 () Bool)

(assert (=> b!1276881 (= e!729199 (and e!729194 mapRes!51617))))

(declare-fun condMapEmpty!51617 () Bool)

(declare-datatypes ((V!49625 0))(
  ( (V!49626 (val!16770 Int)) )
))
(declare-datatypes ((ValueCell!15797 0))(
  ( (ValueCellFull!15797 (v!19366 V!49625)) (EmptyCell!15797) )
))
(declare-datatypes ((array!83773 0))(
  ( (array!83774 (arr!40398 (Array (_ BitVec 32) ValueCell!15797)) (size!40950 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83773)

(declare-fun mapDefault!51617 () ValueCell!15797)

(assert (=> b!1276881 (= condMapEmpty!51617 (= (arr!40398 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15797)) mapDefault!51617)))))

(declare-fun b!1276882 () Bool)

(declare-fun tp_is_empty!33391 () Bool)

(assert (=> b!1276882 (= e!729194 tp_is_empty!33391)))

(declare-fun b!1276883 () Bool)

(declare-fun res!848547 () Bool)

(declare-fun e!729195 () Bool)

(assert (=> b!1276883 (=> (not res!848547) (not e!729195))))

(declare-datatypes ((array!83775 0))(
  ( (array!83776 (arr!40399 (Array (_ BitVec 32) (_ BitVec 64))) (size!40951 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83775)

(assert (=> b!1276883 (= res!848547 (bvslt #b00000000000000000000000000000000 (size!40951 _keys!1427)))))

(declare-fun res!848544 () Bool)

(assert (=> start!108128 (=> (not res!848544) (not e!729195))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108128 (= res!848544 (validMask!0 mask!1805))))

(assert (=> start!108128 e!729195))

(assert (=> start!108128 true))

(assert (=> start!108128 tp!98478))

(assert (=> start!108128 tp_is_empty!33391))

(declare-fun array_inv!30855 (array!83773) Bool)

(assert (=> start!108128 (and (array_inv!30855 _values!1187) e!729199)))

(declare-fun array_inv!30856 (array!83775) Bool)

(assert (=> start!108128 (array_inv!30856 _keys!1427)))

(declare-fun b!1276884 () Bool)

(declare-fun res!848545 () Bool)

(assert (=> b!1276884 (=> (not res!848545) (not e!729195))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276884 (= res!848545 (and (= (size!40950 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40951 _keys!1427) (size!40950 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276885 () Bool)

(declare-fun e!729196 () Bool)

(assert (=> b!1276885 (= e!729196 tp_is_empty!33391)))

(declare-fun b!1276886 () Bool)

(declare-fun res!848543 () Bool)

(assert (=> b!1276886 (=> (not res!848543) (not e!729195))))

(declare-datatypes ((List!28759 0))(
  ( (Nil!28756) (Cons!28755 (h!29964 (_ BitVec 64)) (t!42287 List!28759)) )
))
(declare-fun arrayNoDuplicates!0 (array!83775 (_ BitVec 32) List!28759) Bool)

(assert (=> b!1276886 (= res!848543 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28756))))

(declare-fun b!1276887 () Bool)

(declare-fun e!729198 () Bool)

(declare-fun k0!1053 () (_ BitVec 64))

(assert (=> b!1276887 (= e!729198 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1276888 () Bool)

(assert (=> b!1276888 (= e!729195 (not true))))

(assert (=> b!1276888 e!729198))

(declare-fun c!123929 () Bool)

(assert (=> b!1276888 (= c!123929 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1129 () V!49625)

(declare-fun zeroValue!1129 () V!49625)

(declare-datatypes ((Unit!42213 0))(
  ( (Unit!42214) )
))
(declare-fun lt!575376 () Unit!42213)

(declare-fun defaultEntry!1195 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!616 (array!83775 array!83773 (_ BitVec 32) (_ BitVec 32) V!49625 V!49625 (_ BitVec 64) (_ BitVec 32) Int) Unit!42213)

(assert (=> b!1276888 (= lt!575376 (lemmaListMapContainsThenArrayContainsFrom!616 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1276889 () Bool)

(declare-fun res!848546 () Bool)

(assert (=> b!1276889 (=> (not res!848546) (not e!729195))))

(declare-datatypes ((tuple2!21590 0))(
  ( (tuple2!21591 (_1!10806 (_ BitVec 64)) (_2!10806 V!49625)) )
))
(declare-datatypes ((List!28760 0))(
  ( (Nil!28757) (Cons!28756 (h!29965 tuple2!21590) (t!42288 List!28760)) )
))
(declare-datatypes ((ListLongMap!19247 0))(
  ( (ListLongMap!19248 (toList!9639 List!28760)) )
))
(declare-fun contains!7679 (ListLongMap!19247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4613 (array!83775 array!83773 (_ BitVec 32) (_ BitVec 32) V!49625 V!49625 (_ BitVec 32) Int) ListLongMap!19247)

(assert (=> b!1276889 (= res!848546 (contains!7679 (getCurrentListMap!4613 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1276890 () Bool)

(declare-fun res!848542 () Bool)

(assert (=> b!1276890 (=> (not res!848542) (not e!729195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83775 (_ BitVec 32)) Bool)

(assert (=> b!1276890 (= res!848542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapNonEmpty!51617 () Bool)

(declare-fun tp!98477 () Bool)

(assert (=> mapNonEmpty!51617 (= mapRes!51617 (and tp!98477 e!729196))))

(declare-fun mapValue!51617 () ValueCell!15797)

(declare-fun mapKey!51617 () (_ BitVec 32))

(declare-fun mapRest!51617 () (Array (_ BitVec 32) ValueCell!15797))

(assert (=> mapNonEmpty!51617 (= (arr!40398 _values!1187) (store mapRest!51617 mapKey!51617 mapValue!51617))))

(declare-fun b!1276891 () Bool)

(declare-fun arrayContainsKey!0 (array!83775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276891 (= e!729198 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!51617 () Bool)

(assert (=> mapIsEmpty!51617 mapRes!51617))

(assert (= (and start!108128 res!848544) b!1276884))

(assert (= (and b!1276884 res!848545) b!1276890))

(assert (= (and b!1276890 res!848542) b!1276886))

(assert (= (and b!1276886 res!848543) b!1276889))

(assert (= (and b!1276889 res!848546) b!1276883))

(assert (= (and b!1276883 res!848547) b!1276888))

(assert (= (and b!1276888 c!123929) b!1276891))

(assert (= (and b!1276888 (not c!123929)) b!1276887))

(assert (= (and b!1276881 condMapEmpty!51617) mapIsEmpty!51617))

(assert (= (and b!1276881 (not condMapEmpty!51617)) mapNonEmpty!51617))

(get-info :version)

(assert (= (and mapNonEmpty!51617 ((_ is ValueCellFull!15797) mapValue!51617)) b!1276885))

(assert (= (and b!1276881 ((_ is ValueCellFull!15797) mapDefault!51617)) b!1276882))

(assert (= start!108128 b!1276881))

(declare-fun m!1172217 () Bool)

(assert (=> b!1276886 m!1172217))

(declare-fun m!1172219 () Bool)

(assert (=> b!1276889 m!1172219))

(assert (=> b!1276889 m!1172219))

(declare-fun m!1172221 () Bool)

(assert (=> b!1276889 m!1172221))

(declare-fun m!1172223 () Bool)

(assert (=> b!1276888 m!1172223))

(declare-fun m!1172225 () Bool)

(assert (=> start!108128 m!1172225))

(declare-fun m!1172227 () Bool)

(assert (=> start!108128 m!1172227))

(declare-fun m!1172229 () Bool)

(assert (=> start!108128 m!1172229))

(declare-fun m!1172231 () Bool)

(assert (=> mapNonEmpty!51617 m!1172231))

(declare-fun m!1172233 () Bool)

(assert (=> b!1276890 m!1172233))

(declare-fun m!1172235 () Bool)

(assert (=> b!1276891 m!1172235))

(check-sat tp_is_empty!33391 (not b!1276890) (not b_next!27841) (not mapNonEmpty!51617) (not b!1276891) (not start!108128) (not b!1276886) b_and!45879 (not b!1276889) (not b!1276888))
(check-sat b_and!45879 (not b_next!27841))
