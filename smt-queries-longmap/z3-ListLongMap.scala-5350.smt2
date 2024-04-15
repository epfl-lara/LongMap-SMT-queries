; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71654 () Bool)

(assert start!71654)

(declare-fun b_free!13507 () Bool)

(declare-fun b_next!13507 () Bool)

(assert (=> start!71654 (= b_free!13507 (not b_next!13507))))

(declare-fun tp!47318 () Bool)

(declare-fun b_and!22567 () Bool)

(assert (=> start!71654 (= tp!47318 b_and!22567)))

(declare-fun b!833249 () Bool)

(declare-fun res!566650 () Bool)

(declare-fun e!464783 () Bool)

(assert (=> b!833249 (=> (not res!566650) (not e!464783))))

(declare-datatypes ((array!46581 0))(
  ( (array!46582 (arr!22325 (Array (_ BitVec 32) (_ BitVec 64))) (size!22746 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46581)

(declare-datatypes ((List!15955 0))(
  ( (Nil!15952) (Cons!15951 (h!17082 (_ BitVec 64)) (t!22317 List!15955)) )
))
(declare-fun arrayNoDuplicates!0 (array!46581 (_ BitVec 32) List!15955) Bool)

(assert (=> b!833249 (= res!566650 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15952))))

(declare-fun b!833250 () Bool)

(declare-fun res!566645 () Bool)

(assert (=> b!833250 (=> (not res!566645) (not e!464783))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25291 0))(
  ( (V!25292 (val!7656 Int)) )
))
(declare-datatypes ((ValueCell!7193 0))(
  ( (ValueCellFull!7193 (v!10098 V!25291)) (EmptyCell!7193) )
))
(declare-datatypes ((array!46583 0))(
  ( (array!46584 (arr!22326 (Array (_ BitVec 32) ValueCell!7193)) (size!22747 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46583)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!833250 (= res!566645 (and (= (size!22747 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22746 _keys!976) (size!22747 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10172 0))(
  ( (tuple2!10173 (_1!5097 (_ BitVec 64)) (_2!5097 V!25291)) )
))
(declare-fun lt!377951 () tuple2!10172)

(declare-datatypes ((List!15956 0))(
  ( (Nil!15953) (Cons!15952 (h!17083 tuple2!10172) (t!22318 List!15956)) )
))
(declare-datatypes ((ListLongMap!8985 0))(
  ( (ListLongMap!8986 (toList!4508 List!15956)) )
))
(declare-fun lt!377950 () ListLongMap!8985)

(declare-fun lt!377957 () ListLongMap!8985)

(declare-fun e!464785 () Bool)

(declare-fun b!833251 () Bool)

(declare-fun lt!377949 () tuple2!10172)

(declare-fun +!2016 (ListLongMap!8985 tuple2!10172) ListLongMap!8985)

(assert (=> b!833251 (= e!464785 (= lt!377950 (+!2016 (+!2016 lt!377957 lt!377949) lt!377951)))))

(declare-fun b!833252 () Bool)

(declare-fun e!464787 () Bool)

(assert (=> b!833252 (= e!464783 (not e!464787))))

(declare-fun res!566649 () Bool)

(assert (=> b!833252 (=> res!566649 e!464787)))

(assert (=> b!833252 (= res!566649 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!377956 () ListLongMap!8985)

(assert (=> b!833252 (= lt!377956 lt!377957)))

(declare-fun zeroValueBefore!34 () V!25291)

(declare-fun zeroValueAfter!34 () V!25291)

(declare-fun minValue!754 () V!25291)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28511 0))(
  ( (Unit!28512) )
))
(declare-fun lt!377959 () Unit!28511)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!605 (array!46581 array!46583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25291 V!25291 V!25291 V!25291 (_ BitVec 32) Int) Unit!28511)

(assert (=> b!833252 (= lt!377959 (lemmaNoChangeToArrayThenSameMapNoExtras!605 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2535 (array!46581 array!46583 (_ BitVec 32) (_ BitVec 32) V!25291 V!25291 (_ BitVec 32) Int) ListLongMap!8985)

(assert (=> b!833252 (= lt!377957 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833252 (= lt!377956 (getCurrentListMapNoExtraKeys!2535 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24488 () Bool)

(declare-fun mapRes!24488 () Bool)

(assert (=> mapIsEmpty!24488 mapRes!24488))

(declare-fun b!833253 () Bool)

(declare-fun res!566647 () Bool)

(assert (=> b!833253 (=> (not res!566647) (not e!464783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46581 (_ BitVec 32)) Bool)

(assert (=> b!833253 (= res!566647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!833254 () Bool)

(declare-fun e!464784 () Bool)

(declare-fun tp_is_empty!15217 () Bool)

(assert (=> b!833254 (= e!464784 tp_is_empty!15217)))

(declare-fun b!833256 () Bool)

(declare-fun e!464780 () Bool)

(assert (=> b!833256 (= e!464780 tp_is_empty!15217)))

(declare-fun mapNonEmpty!24488 () Bool)

(declare-fun tp!47317 () Bool)

(assert (=> mapNonEmpty!24488 (= mapRes!24488 (and tp!47317 e!464780))))

(declare-fun mapValue!24488 () ValueCell!7193)

(declare-fun mapKey!24488 () (_ BitVec 32))

(declare-fun mapRest!24488 () (Array (_ BitVec 32) ValueCell!7193))

(assert (=> mapNonEmpty!24488 (= (arr!22326 _values!788) (store mapRest!24488 mapKey!24488 mapValue!24488))))

(declare-fun b!833257 () Bool)

(declare-fun lt!377958 () ListLongMap!8985)

(assert (=> b!833257 (= e!464787 (= lt!377950 lt!377958))))

(declare-fun lt!377953 () ListLongMap!8985)

(assert (=> b!833257 (= lt!377953 lt!377958)))

(declare-fun lt!377952 () ListLongMap!8985)

(assert (=> b!833257 (= lt!377958 (+!2016 lt!377952 lt!377951))))

(declare-fun lt!377954 () ListLongMap!8985)

(assert (=> b!833257 (= lt!377953 (+!2016 lt!377954 lt!377951))))

(declare-fun lt!377955 () Unit!28511)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!249 (ListLongMap!8985 (_ BitVec 64) V!25291 V!25291) Unit!28511)

(assert (=> b!833257 (= lt!377955 (addSameAsAddTwiceSameKeyDiffValues!249 lt!377954 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!833257 e!464785))

(declare-fun res!566648 () Bool)

(assert (=> b!833257 (=> (not res!566648) (not e!464785))))

(declare-fun lt!377948 () ListLongMap!8985)

(assert (=> b!833257 (= res!566648 (= lt!377948 lt!377952))))

(declare-fun lt!377947 () tuple2!10172)

(assert (=> b!833257 (= lt!377952 (+!2016 lt!377954 lt!377947))))

(assert (=> b!833257 (= lt!377954 (+!2016 lt!377956 lt!377949))))

(assert (=> b!833257 (= lt!377951 (tuple2!10173 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!464782 () Bool)

(assert (=> b!833257 e!464782))

(declare-fun res!566644 () Bool)

(assert (=> b!833257 (=> (not res!566644) (not e!464782))))

(assert (=> b!833257 (= res!566644 (= lt!377948 (+!2016 (+!2016 lt!377956 lt!377947) lt!377949)))))

(assert (=> b!833257 (= lt!377949 (tuple2!10173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833257 (= lt!377947 (tuple2!10173 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2556 (array!46581 array!46583 (_ BitVec 32) (_ BitVec 32) V!25291 V!25291 (_ BitVec 32) Int) ListLongMap!8985)

(assert (=> b!833257 (= lt!377950 (getCurrentListMap!2556 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833257 (= lt!377948 (getCurrentListMap!2556 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833258 () Bool)

(assert (=> b!833258 (= e!464782 (= lt!377950 (+!2016 (+!2016 lt!377957 (tuple2!10173 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377949)))))

(declare-fun b!833255 () Bool)

(declare-fun e!464786 () Bool)

(assert (=> b!833255 (= e!464786 (and e!464784 mapRes!24488))))

(declare-fun condMapEmpty!24488 () Bool)

(declare-fun mapDefault!24488 () ValueCell!7193)

(assert (=> b!833255 (= condMapEmpty!24488 (= (arr!22326 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7193)) mapDefault!24488)))))

(declare-fun res!566646 () Bool)

(assert (=> start!71654 (=> (not res!566646) (not e!464783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71654 (= res!566646 (validMask!0 mask!1312))))

(assert (=> start!71654 e!464783))

(assert (=> start!71654 tp_is_empty!15217))

(declare-fun array_inv!17843 (array!46581) Bool)

(assert (=> start!71654 (array_inv!17843 _keys!976)))

(assert (=> start!71654 true))

(declare-fun array_inv!17844 (array!46583) Bool)

(assert (=> start!71654 (and (array_inv!17844 _values!788) e!464786)))

(assert (=> start!71654 tp!47318))

(assert (= (and start!71654 res!566646) b!833250))

(assert (= (and b!833250 res!566645) b!833253))

(assert (= (and b!833253 res!566647) b!833249))

(assert (= (and b!833249 res!566650) b!833252))

(assert (= (and b!833252 (not res!566649)) b!833257))

(assert (= (and b!833257 res!566644) b!833258))

(assert (= (and b!833257 res!566648) b!833251))

(assert (= (and b!833255 condMapEmpty!24488) mapIsEmpty!24488))

(assert (= (and b!833255 (not condMapEmpty!24488)) mapNonEmpty!24488))

(get-info :version)

(assert (= (and mapNonEmpty!24488 ((_ is ValueCellFull!7193) mapValue!24488)) b!833256))

(assert (= (and b!833255 ((_ is ValueCellFull!7193) mapDefault!24488)) b!833254))

(assert (= start!71654 b!833255))

(declare-fun m!777527 () Bool)

(assert (=> start!71654 m!777527))

(declare-fun m!777529 () Bool)

(assert (=> start!71654 m!777529))

(declare-fun m!777531 () Bool)

(assert (=> start!71654 m!777531))

(declare-fun m!777533 () Bool)

(assert (=> b!833251 m!777533))

(assert (=> b!833251 m!777533))

(declare-fun m!777535 () Bool)

(assert (=> b!833251 m!777535))

(declare-fun m!777537 () Bool)

(assert (=> mapNonEmpty!24488 m!777537))

(declare-fun m!777539 () Bool)

(assert (=> b!833249 m!777539))

(declare-fun m!777541 () Bool)

(assert (=> b!833257 m!777541))

(assert (=> b!833257 m!777541))

(declare-fun m!777543 () Bool)

(assert (=> b!833257 m!777543))

(declare-fun m!777545 () Bool)

(assert (=> b!833257 m!777545))

(declare-fun m!777547 () Bool)

(assert (=> b!833257 m!777547))

(declare-fun m!777549 () Bool)

(assert (=> b!833257 m!777549))

(declare-fun m!777551 () Bool)

(assert (=> b!833257 m!777551))

(declare-fun m!777553 () Bool)

(assert (=> b!833257 m!777553))

(declare-fun m!777555 () Bool)

(assert (=> b!833257 m!777555))

(declare-fun m!777557 () Bool)

(assert (=> b!833257 m!777557))

(declare-fun m!777559 () Bool)

(assert (=> b!833253 m!777559))

(declare-fun m!777561 () Bool)

(assert (=> b!833252 m!777561))

(declare-fun m!777563 () Bool)

(assert (=> b!833252 m!777563))

(declare-fun m!777565 () Bool)

(assert (=> b!833252 m!777565))

(declare-fun m!777567 () Bool)

(assert (=> b!833258 m!777567))

(assert (=> b!833258 m!777567))

(declare-fun m!777569 () Bool)

(assert (=> b!833258 m!777569))

(check-sat (not b!833249) tp_is_empty!15217 (not start!71654) (not b!833253) (not b!833257) (not b!833252) (not b_next!13507) b_and!22567 (not b!833258) (not mapNonEmpty!24488) (not b!833251))
(check-sat b_and!22567 (not b_next!13507))
