; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82026 () Bool)

(assert start!82026)

(declare-fun b_free!18451 () Bool)

(declare-fun b_next!18451 () Bool)

(assert (=> start!82026 (= b_free!18451 (not b_next!18451))))

(declare-fun tp!64165 () Bool)

(declare-fun b_and!29913 () Bool)

(assert (=> start!82026 (= tp!64165 b_and!29913)))

(declare-fun b!956576 () Bool)

(declare-fun res!640509 () Bool)

(declare-fun e!539034 () Bool)

(assert (=> b!956576 (=> (not res!640509) (not e!539034))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58178 0))(
  ( (array!58179 (arr!27968 (Array (_ BitVec 32) (_ BitVec 64))) (size!28449 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58178)

(declare-datatypes ((V!33073 0))(
  ( (V!33074 (val!10584 Int)) )
))
(declare-datatypes ((ValueCell!10052 0))(
  ( (ValueCellFull!10052 (v!13139 V!33073)) (EmptyCell!10052) )
))
(declare-datatypes ((array!58180 0))(
  ( (array!58181 (arr!27969 (Array (_ BitVec 32) ValueCell!10052)) (size!28450 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58180)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!956576 (= res!640509 (and (= (size!28450 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28449 _keys!1441) (size!28450 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956577 () Bool)

(declare-fun res!640507 () Bool)

(assert (=> b!956577 (=> (not res!640507) (not e!539034))))

(declare-datatypes ((List!19506 0))(
  ( (Nil!19503) (Cons!19502 (h!20664 (_ BitVec 64)) (t!27860 List!19506)) )
))
(declare-fun arrayNoDuplicates!0 (array!58178 (_ BitVec 32) List!19506) Bool)

(assert (=> b!956577 (= res!640507 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19503))))

(declare-fun b!956578 () Bool)

(declare-fun res!640504 () Bool)

(assert (=> b!956578 (=> (not res!640504) (not e!539034))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!956578 (= res!640504 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28449 _keys!1441))))))

(declare-fun res!640505 () Bool)

(assert (=> start!82026 (=> (not res!640505) (not e!539034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82026 (= res!640505 (validMask!0 mask!1823))))

(assert (=> start!82026 e!539034))

(assert (=> start!82026 true))

(declare-fun tp_is_empty!21067 () Bool)

(assert (=> start!82026 tp_is_empty!21067))

(declare-fun array_inv!21759 (array!58178) Bool)

(assert (=> start!82026 (array_inv!21759 _keys!1441)))

(declare-fun e!539033 () Bool)

(declare-fun array_inv!21760 (array!58180) Bool)

(assert (=> start!82026 (and (array_inv!21760 _values!1197) e!539033)))

(assert (=> start!82026 tp!64165))

(declare-fun mapIsEmpty!33565 () Bool)

(declare-fun mapRes!33565 () Bool)

(assert (=> mapIsEmpty!33565 mapRes!33565))

(declare-fun b!956579 () Bool)

(declare-fun res!640510 () Bool)

(assert (=> b!956579 (=> (not res!640510) (not e!539034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58178 (_ BitVec 32)) Bool)

(assert (=> b!956579 (= res!640510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33565 () Bool)

(declare-fun tp!64164 () Bool)

(declare-fun e!539036 () Bool)

(assert (=> mapNonEmpty!33565 (= mapRes!33565 (and tp!64164 e!539036))))

(declare-fun mapRest!33565 () (Array (_ BitVec 32) ValueCell!10052))

(declare-fun mapKey!33565 () (_ BitVec 32))

(declare-fun mapValue!33565 () ValueCell!10052)

(assert (=> mapNonEmpty!33565 (= (arr!27969 _values!1197) (store mapRest!33565 mapKey!33565 mapValue!33565))))

(declare-fun b!956580 () Bool)

(declare-fun e!539037 () Bool)

(assert (=> b!956580 (= e!539037 tp_is_empty!21067)))

(declare-fun b!956581 () Bool)

(assert (=> b!956581 (= e!539034 (not true))))

(declare-fun zeroValue!1139 () V!33073)

(declare-fun minValue!1139 () V!33073)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13748 0))(
  ( (tuple2!13749 (_1!6885 (_ BitVec 64)) (_2!6885 V!33073)) )
))
(declare-datatypes ((List!19507 0))(
  ( (Nil!19504) (Cons!19503 (h!20665 tuple2!13748) (t!27861 List!19507)) )
))
(declare-datatypes ((ListLongMap!12435 0))(
  ( (ListLongMap!12436 (toList!6233 List!19507)) )
))
(declare-fun contains!5275 (ListLongMap!12435 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3395 (array!58178 array!58180 (_ BitVec 32) (_ BitVec 32) V!33073 V!33073 (_ BitVec 32) Int) ListLongMap!12435)

(assert (=> b!956581 (contains!5275 (getCurrentListMap!3395 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27968 _keys!1441) i!735))))

(declare-datatypes ((Unit!32008 0))(
  ( (Unit!32009) )
))
(declare-fun lt!430020 () Unit!32008)

(declare-fun lemmaInListMapFromThenFromZero!21 (array!58178 array!58180 (_ BitVec 32) (_ BitVec 32) V!33073 V!33073 (_ BitVec 32) (_ BitVec 32) Int) Unit!32008)

(assert (=> b!956581 (= lt!430020 (lemmaInListMapFromThenFromZero!21 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956582 () Bool)

(assert (=> b!956582 (= e!539036 tp_is_empty!21067)))

(declare-fun b!956583 () Bool)

(declare-fun res!640508 () Bool)

(assert (=> b!956583 (=> (not res!640508) (not e!539034))))

(assert (=> b!956583 (= res!640508 (contains!5275 (getCurrentListMap!3395 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27968 _keys!1441) i!735)))))

(declare-fun b!956584 () Bool)

(declare-fun res!640506 () Bool)

(assert (=> b!956584 (=> (not res!640506) (not e!539034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956584 (= res!640506 (validKeyInArray!0 (select (arr!27968 _keys!1441) i!735)))))

(declare-fun b!956585 () Bool)

(assert (=> b!956585 (= e!539033 (and e!539037 mapRes!33565))))

(declare-fun condMapEmpty!33565 () Bool)

(declare-fun mapDefault!33565 () ValueCell!10052)

(assert (=> b!956585 (= condMapEmpty!33565 (= (arr!27969 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10052)) mapDefault!33565)))))

(assert (= (and start!82026 res!640505) b!956576))

(assert (= (and b!956576 res!640509) b!956579))

(assert (= (and b!956579 res!640510) b!956577))

(assert (= (and b!956577 res!640507) b!956578))

(assert (= (and b!956578 res!640504) b!956584))

(assert (= (and b!956584 res!640506) b!956583))

(assert (= (and b!956583 res!640508) b!956581))

(assert (= (and b!956585 condMapEmpty!33565) mapIsEmpty!33565))

(assert (= (and b!956585 (not condMapEmpty!33565)) mapNonEmpty!33565))

(get-info :version)

(assert (= (and mapNonEmpty!33565 ((_ is ValueCellFull!10052) mapValue!33565)) b!956582))

(assert (= (and b!956585 ((_ is ValueCellFull!10052) mapDefault!33565)) b!956580))

(assert (= start!82026 b!956585))

(declare-fun m!887237 () Bool)

(assert (=> mapNonEmpty!33565 m!887237))

(declare-fun m!887239 () Bool)

(assert (=> b!956583 m!887239))

(declare-fun m!887241 () Bool)

(assert (=> b!956583 m!887241))

(assert (=> b!956583 m!887239))

(assert (=> b!956583 m!887241))

(declare-fun m!887243 () Bool)

(assert (=> b!956583 m!887243))

(declare-fun m!887245 () Bool)

(assert (=> b!956577 m!887245))

(declare-fun m!887247 () Bool)

(assert (=> b!956581 m!887247))

(assert (=> b!956581 m!887241))

(assert (=> b!956581 m!887247))

(assert (=> b!956581 m!887241))

(declare-fun m!887249 () Bool)

(assert (=> b!956581 m!887249))

(declare-fun m!887251 () Bool)

(assert (=> b!956581 m!887251))

(assert (=> b!956584 m!887241))

(assert (=> b!956584 m!887241))

(declare-fun m!887253 () Bool)

(assert (=> b!956584 m!887253))

(declare-fun m!887255 () Bool)

(assert (=> start!82026 m!887255))

(declare-fun m!887257 () Bool)

(assert (=> start!82026 m!887257))

(declare-fun m!887259 () Bool)

(assert (=> start!82026 m!887259))

(declare-fun m!887261 () Bool)

(assert (=> b!956579 m!887261))

(check-sat (not b!956583) (not b!956577) (not b!956581) (not b_next!18451) (not b!956584) (not b!956579) tp_is_empty!21067 (not start!82026) b_and!29913 (not mapNonEmpty!33565))
(check-sat b_and!29913 (not b_next!18451))
