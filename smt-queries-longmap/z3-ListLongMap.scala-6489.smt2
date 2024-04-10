; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82776 () Bool)

(assert start!82776)

(declare-fun b_free!18909 () Bool)

(declare-fun b_next!18909 () Bool)

(assert (=> start!82776 (= b_free!18909 (not b_next!18909))))

(declare-fun tp!65847 () Bool)

(declare-fun b_and!30397 () Bool)

(assert (=> start!82776 (= tp!65847 b_and!30397)))

(declare-fun b!965516 () Bool)

(declare-fun e!544284 () Bool)

(declare-fun tp_is_empty!21711 () Bool)

(assert (=> b!965516 (= e!544284 tp_is_empty!21711)))

(declare-fun b!965517 () Bool)

(declare-fun res!646293 () Bool)

(declare-fun e!544285 () Bool)

(assert (=> b!965517 (=> (not res!646293) (not e!544285))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33931 0))(
  ( (V!33932 (val!10906 Int)) )
))
(declare-datatypes ((ValueCell!10374 0))(
  ( (ValueCellFull!10374 (v!13464 V!33931)) (EmptyCell!10374) )
))
(declare-datatypes ((array!59507 0))(
  ( (array!59508 (arr!28622 (Array (_ BitVec 32) ValueCell!10374)) (size!29101 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59507)

(declare-datatypes ((array!59509 0))(
  ( (array!59510 (arr!28623 (Array (_ BitVec 32) (_ BitVec 64))) (size!29102 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59509)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!965517 (= res!646293 (and (= (size!29101 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29102 _keys!1686) (size!29101 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965518 () Bool)

(declare-fun res!646290 () Bool)

(assert (=> b!965518 (=> (not res!646290) (not e!544285))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!965518 (= res!646290 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29102 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29102 _keys!1686))))))

(declare-fun mapIsEmpty!34561 () Bool)

(declare-fun mapRes!34561 () Bool)

(assert (=> mapIsEmpty!34561 mapRes!34561))

(declare-fun b!965519 () Bool)

(declare-fun res!646292 () Bool)

(assert (=> b!965519 (=> (not res!646292) (not e!544285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965519 (= res!646292 (validKeyInArray!0 (select (arr!28623 _keys!1686) i!803)))))

(declare-fun res!646291 () Bool)

(assert (=> start!82776 (=> (not res!646291) (not e!544285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82776 (= res!646291 (validMask!0 mask!2110))))

(assert (=> start!82776 e!544285))

(assert (=> start!82776 true))

(declare-fun e!544282 () Bool)

(declare-fun array_inv!22167 (array!59507) Bool)

(assert (=> start!82776 (and (array_inv!22167 _values!1400) e!544282)))

(declare-fun array_inv!22168 (array!59509) Bool)

(assert (=> start!82776 (array_inv!22168 _keys!1686)))

(assert (=> start!82776 tp!65847))

(assert (=> start!82776 tp_is_empty!21711))

(declare-fun b!965520 () Bool)

(assert (=> b!965520 (= e!544285 false)))

(declare-fun minValue!1342 () V!33931)

(declare-fun zeroValue!1342 () V!33931)

(declare-fun lt!431248 () Bool)

(declare-fun defaultEntry!1403 () Int)

(declare-datatypes ((tuple2!14028 0))(
  ( (tuple2!14029 (_1!7025 (_ BitVec 64)) (_2!7025 V!33931)) )
))
(declare-datatypes ((List!19870 0))(
  ( (Nil!19867) (Cons!19866 (h!21028 tuple2!14028) (t!28233 List!19870)) )
))
(declare-datatypes ((ListLongMap!12725 0))(
  ( (ListLongMap!12726 (toList!6378 List!19870)) )
))
(declare-fun contains!5481 (ListLongMap!12725 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3611 (array!59509 array!59507 (_ BitVec 32) (_ BitVec 32) V!33931 V!33931 (_ BitVec 32) Int) ListLongMap!12725)

(assert (=> b!965520 (= lt!431248 (contains!5481 (getCurrentListMap!3611 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28623 _keys!1686) i!803)))))

(declare-fun b!965521 () Bool)

(declare-fun res!646294 () Bool)

(assert (=> b!965521 (=> (not res!646294) (not e!544285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59509 (_ BitVec 32)) Bool)

(assert (=> b!965521 (= res!646294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965522 () Bool)

(declare-fun res!646289 () Bool)

(assert (=> b!965522 (=> (not res!646289) (not e!544285))))

(declare-datatypes ((List!19871 0))(
  ( (Nil!19868) (Cons!19867 (h!21029 (_ BitVec 64)) (t!28234 List!19871)) )
))
(declare-fun arrayNoDuplicates!0 (array!59509 (_ BitVec 32) List!19871) Bool)

(assert (=> b!965522 (= res!646289 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19868))))

(declare-fun mapNonEmpty!34561 () Bool)

(declare-fun tp!65846 () Bool)

(assert (=> mapNonEmpty!34561 (= mapRes!34561 (and tp!65846 e!544284))))

(declare-fun mapKey!34561 () (_ BitVec 32))

(declare-fun mapRest!34561 () (Array (_ BitVec 32) ValueCell!10374))

(declare-fun mapValue!34561 () ValueCell!10374)

(assert (=> mapNonEmpty!34561 (= (arr!28622 _values!1400) (store mapRest!34561 mapKey!34561 mapValue!34561))))

(declare-fun b!965523 () Bool)

(declare-fun e!544283 () Bool)

(assert (=> b!965523 (= e!544282 (and e!544283 mapRes!34561))))

(declare-fun condMapEmpty!34561 () Bool)

(declare-fun mapDefault!34561 () ValueCell!10374)

(assert (=> b!965523 (= condMapEmpty!34561 (= (arr!28622 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10374)) mapDefault!34561)))))

(declare-fun b!965524 () Bool)

(assert (=> b!965524 (= e!544283 tp_is_empty!21711)))

(assert (= (and start!82776 res!646291) b!965517))

(assert (= (and b!965517 res!646293) b!965521))

(assert (= (and b!965521 res!646294) b!965522))

(assert (= (and b!965522 res!646289) b!965518))

(assert (= (and b!965518 res!646290) b!965519))

(assert (= (and b!965519 res!646292) b!965520))

(assert (= (and b!965523 condMapEmpty!34561) mapIsEmpty!34561))

(assert (= (and b!965523 (not condMapEmpty!34561)) mapNonEmpty!34561))

(get-info :version)

(assert (= (and mapNonEmpty!34561 ((_ is ValueCellFull!10374) mapValue!34561)) b!965516))

(assert (= (and b!965523 ((_ is ValueCellFull!10374) mapDefault!34561)) b!965524))

(assert (= start!82776 b!965523))

(declare-fun m!894569 () Bool)

(assert (=> start!82776 m!894569))

(declare-fun m!894571 () Bool)

(assert (=> start!82776 m!894571))

(declare-fun m!894573 () Bool)

(assert (=> start!82776 m!894573))

(declare-fun m!894575 () Bool)

(assert (=> b!965521 m!894575))

(declare-fun m!894577 () Bool)

(assert (=> b!965520 m!894577))

(declare-fun m!894579 () Bool)

(assert (=> b!965520 m!894579))

(assert (=> b!965520 m!894577))

(assert (=> b!965520 m!894579))

(declare-fun m!894581 () Bool)

(assert (=> b!965520 m!894581))

(assert (=> b!965519 m!894579))

(assert (=> b!965519 m!894579))

(declare-fun m!894583 () Bool)

(assert (=> b!965519 m!894583))

(declare-fun m!894585 () Bool)

(assert (=> mapNonEmpty!34561 m!894585))

(declare-fun m!894587 () Bool)

(assert (=> b!965522 m!894587))

(check-sat (not start!82776) (not b_next!18909) (not b!965519) b_and!30397 (not b!965521) (not mapNonEmpty!34561) tp_is_empty!21711 (not b!965520) (not b!965522))
(check-sat b_and!30397 (not b_next!18909))
