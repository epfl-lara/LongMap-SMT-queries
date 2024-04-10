; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43362 () Bool)

(assert start!43362)

(declare-fun b_free!12189 () Bool)

(declare-fun b_next!12189 () Bool)

(assert (=> start!43362 (= b_free!12189 (not b_next!12189))))

(declare-fun tp!42844 () Bool)

(declare-fun b_and!20945 () Bool)

(assert (=> start!43362 (= tp!42844 b_and!20945)))

(declare-fun b!480330 () Bool)

(declare-fun res!286457 () Bool)

(declare-fun e!282639 () Bool)

(assert (=> b!480330 (=> (not res!286457) (not e!282639))))

(declare-datatypes ((array!31071 0))(
  ( (array!31072 (arr!14940 (Array (_ BitVec 32) (_ BitVec 64))) (size!15298 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31071)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31071 (_ BitVec 32)) Bool)

(assert (=> b!480330 (= res!286457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!480331 () Bool)

(declare-fun e!282635 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480331 (= e!282635 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!480332 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!480332 (= e!282635 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480333 () Bool)

(assert (=> b!480333 (= e!282639 (not true))))

(declare-fun lt!218131 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31071 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480333 (= lt!218131 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!480333 e!282635))

(declare-fun c!57769 () Bool)

(assert (=> b!480333 (= c!57769 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14082 0))(
  ( (Unit!14083) )
))
(declare-fun lt!218130 () Unit!14082)

(declare-datatypes ((V!19339 0))(
  ( (V!19340 (val!6898 Int)) )
))
(declare-fun minValue!1458 () V!19339)

(declare-fun zeroValue!1458 () V!19339)

(declare-datatypes ((ValueCell!6489 0))(
  ( (ValueCellFull!6489 (v!9189 V!19339)) (EmptyCell!6489) )
))
(declare-datatypes ((array!31073 0))(
  ( (array!31074 (arr!14941 (Array (_ BitVec 32) ValueCell!6489)) (size!15299 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31073)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!114 (array!31071 array!31073 (_ BitVec 32) (_ BitVec 32) V!19339 V!19339 (_ BitVec 64) Int) Unit!14082)

(assert (=> b!480333 (= lt!218130 (lemmaKeyInListMapIsInArray!114 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480334 () Bool)

(declare-fun res!286456 () Bool)

(assert (=> b!480334 (=> (not res!286456) (not e!282639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480334 (= res!286456 (validKeyInArray!0 k0!1332))))

(declare-fun b!480335 () Bool)

(declare-fun e!282636 () Bool)

(declare-fun e!282634 () Bool)

(declare-fun mapRes!22255 () Bool)

(assert (=> b!480335 (= e!282636 (and e!282634 mapRes!22255))))

(declare-fun condMapEmpty!22255 () Bool)

(declare-fun mapDefault!22255 () ValueCell!6489)

(assert (=> b!480335 (= condMapEmpty!22255 (= (arr!14941 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6489)) mapDefault!22255)))))

(declare-fun b!480336 () Bool)

(declare-fun res!286458 () Bool)

(assert (=> b!480336 (=> (not res!286458) (not e!282639))))

(declare-datatypes ((tuple2!9054 0))(
  ( (tuple2!9055 (_1!4538 (_ BitVec 64)) (_2!4538 V!19339)) )
))
(declare-datatypes ((List!9132 0))(
  ( (Nil!9129) (Cons!9128 (h!9984 tuple2!9054) (t!15342 List!9132)) )
))
(declare-datatypes ((ListLongMap!7967 0))(
  ( (ListLongMap!7968 (toList!3999 List!9132)) )
))
(declare-fun contains!2611 (ListLongMap!7967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2318 (array!31071 array!31073 (_ BitVec 32) (_ BitVec 32) V!19339 V!19339 (_ BitVec 32) Int) ListLongMap!7967)

(assert (=> b!480336 (= res!286458 (contains!2611 (getCurrentListMap!2318 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480337 () Bool)

(declare-fun res!286459 () Bool)

(assert (=> b!480337 (=> (not res!286459) (not e!282639))))

(assert (=> b!480337 (= res!286459 (and (= (size!15299 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15298 _keys!1874) (size!15299 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!286461 () Bool)

(assert (=> start!43362 (=> (not res!286461) (not e!282639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43362 (= res!286461 (validMask!0 mask!2352))))

(assert (=> start!43362 e!282639))

(assert (=> start!43362 true))

(declare-fun tp_is_empty!13701 () Bool)

(assert (=> start!43362 tp_is_empty!13701))

(declare-fun array_inv!10774 (array!31073) Bool)

(assert (=> start!43362 (and (array_inv!10774 _values!1516) e!282636)))

(assert (=> start!43362 tp!42844))

(declare-fun array_inv!10775 (array!31071) Bool)

(assert (=> start!43362 (array_inv!10775 _keys!1874)))

(declare-fun b!480338 () Bool)

(assert (=> b!480338 (= e!282634 tp_is_empty!13701)))

(declare-fun mapNonEmpty!22255 () Bool)

(declare-fun tp!42843 () Bool)

(declare-fun e!282638 () Bool)

(assert (=> mapNonEmpty!22255 (= mapRes!22255 (and tp!42843 e!282638))))

(declare-fun mapKey!22255 () (_ BitVec 32))

(declare-fun mapValue!22255 () ValueCell!6489)

(declare-fun mapRest!22255 () (Array (_ BitVec 32) ValueCell!6489))

(assert (=> mapNonEmpty!22255 (= (arr!14941 _values!1516) (store mapRest!22255 mapKey!22255 mapValue!22255))))

(declare-fun b!480339 () Bool)

(declare-fun res!286460 () Bool)

(assert (=> b!480339 (=> (not res!286460) (not e!282639))))

(declare-datatypes ((List!9133 0))(
  ( (Nil!9130) (Cons!9129 (h!9985 (_ BitVec 64)) (t!15343 List!9133)) )
))
(declare-fun arrayNoDuplicates!0 (array!31071 (_ BitVec 32) List!9133) Bool)

(assert (=> b!480339 (= res!286460 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9130))))

(declare-fun mapIsEmpty!22255 () Bool)

(assert (=> mapIsEmpty!22255 mapRes!22255))

(declare-fun b!480340 () Bool)

(assert (=> b!480340 (= e!282638 tp_is_empty!13701)))

(assert (= (and start!43362 res!286461) b!480337))

(assert (= (and b!480337 res!286459) b!480330))

(assert (= (and b!480330 res!286457) b!480339))

(assert (= (and b!480339 res!286460) b!480336))

(assert (= (and b!480336 res!286458) b!480334))

(assert (= (and b!480334 res!286456) b!480333))

(assert (= (and b!480333 c!57769) b!480331))

(assert (= (and b!480333 (not c!57769)) b!480332))

(assert (= (and b!480335 condMapEmpty!22255) mapIsEmpty!22255))

(assert (= (and b!480335 (not condMapEmpty!22255)) mapNonEmpty!22255))

(get-info :version)

(assert (= (and mapNonEmpty!22255 ((_ is ValueCellFull!6489) mapValue!22255)) b!480340))

(assert (= (and b!480335 ((_ is ValueCellFull!6489) mapDefault!22255)) b!480338))

(assert (= start!43362 b!480335))

(declare-fun m!462011 () Bool)

(assert (=> b!480334 m!462011))

(declare-fun m!462013 () Bool)

(assert (=> start!43362 m!462013))

(declare-fun m!462015 () Bool)

(assert (=> start!43362 m!462015))

(declare-fun m!462017 () Bool)

(assert (=> start!43362 m!462017))

(declare-fun m!462019 () Bool)

(assert (=> b!480331 m!462019))

(declare-fun m!462021 () Bool)

(assert (=> b!480330 m!462021))

(declare-fun m!462023 () Bool)

(assert (=> b!480336 m!462023))

(assert (=> b!480336 m!462023))

(declare-fun m!462025 () Bool)

(assert (=> b!480336 m!462025))

(declare-fun m!462027 () Bool)

(assert (=> mapNonEmpty!22255 m!462027))

(declare-fun m!462029 () Bool)

(assert (=> b!480339 m!462029))

(declare-fun m!462031 () Bool)

(assert (=> b!480333 m!462031))

(declare-fun m!462033 () Bool)

(assert (=> b!480333 m!462033))

(check-sat (not b!480339) (not start!43362) (not b!480334) (not mapNonEmpty!22255) (not b!480333) (not b!480330) b_and!20945 (not b!480331) (not b_next!12189) (not b!480336) tp_is_empty!13701)
(check-sat b_and!20945 (not b_next!12189))
