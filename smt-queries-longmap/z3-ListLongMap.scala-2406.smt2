; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38078 () Bool)

(assert start!38078)

(declare-fun b_free!9003 () Bool)

(declare-fun b_next!9003 () Bool)

(assert (=> start!38078 (= b_free!9003 (not b_next!9003))))

(declare-fun tp!31785 () Bool)

(declare-fun b_and!16341 () Bool)

(assert (=> start!38078 (= tp!31785 b_and!16341)))

(declare-fun b!392164 () Bool)

(declare-fun e!237492 () Bool)

(declare-fun e!237490 () Bool)

(declare-fun mapRes!16101 () Bool)

(assert (=> b!392164 (= e!237492 (and e!237490 mapRes!16101))))

(declare-fun condMapEmpty!16101 () Bool)

(declare-datatypes ((V!14005 0))(
  ( (V!14006 (val!4882 Int)) )
))
(declare-datatypes ((ValueCell!4494 0))(
  ( (ValueCellFull!4494 (v!7111 V!14005)) (EmptyCell!4494) )
))
(declare-datatypes ((array!23255 0))(
  ( (array!23256 (arr!11088 (Array (_ BitVec 32) ValueCell!4494)) (size!11440 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23255)

(declare-fun mapDefault!16101 () ValueCell!4494)

(assert (=> b!392164 (= condMapEmpty!16101 (= (arr!11088 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4494)) mapDefault!16101)))))

(declare-datatypes ((tuple2!6582 0))(
  ( (tuple2!6583 (_1!3302 (_ BitVec 64)) (_2!3302 V!14005)) )
))
(declare-datatypes ((List!6435 0))(
  ( (Nil!6432) (Cons!6431 (h!7287 tuple2!6582) (t!11601 List!6435)) )
))
(declare-datatypes ((ListLongMap!5495 0))(
  ( (ListLongMap!5496 (toList!2763 List!6435)) )
))
(declare-fun lt!185257 () ListLongMap!5495)

(declare-fun e!237496 () Bool)

(declare-fun lt!185258 () ListLongMap!5495)

(declare-fun b!392165 () Bool)

(declare-fun lt!185263 () tuple2!6582)

(declare-fun +!1058 (ListLongMap!5495 tuple2!6582) ListLongMap!5495)

(assert (=> b!392165 (= e!237496 (= lt!185258 (+!1058 lt!185257 lt!185263)))))

(declare-fun lt!185265 () ListLongMap!5495)

(assert (=> b!392165 (= lt!185258 (+!1058 lt!185265 lt!185263))))

(declare-fun minValue!472 () V!14005)

(assert (=> b!392165 (= lt!185263 (tuple2!6583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!224555 () Bool)

(declare-fun e!237494 () Bool)

(assert (=> start!38078 (=> (not res!224555) (not e!237494))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38078 (= res!224555 (validMask!0 mask!970))))

(assert (=> start!38078 e!237494))

(declare-fun array_inv!8146 (array!23255) Bool)

(assert (=> start!38078 (and (array_inv!8146 _values!506) e!237492)))

(assert (=> start!38078 tp!31785))

(assert (=> start!38078 true))

(declare-fun tp_is_empty!9675 () Bool)

(assert (=> start!38078 tp_is_empty!9675))

(declare-datatypes ((array!23257 0))(
  ( (array!23258 (arr!11089 (Array (_ BitVec 32) (_ BitVec 64))) (size!11441 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23257)

(declare-fun array_inv!8147 (array!23257) Bool)

(assert (=> start!38078 (array_inv!8147 _keys!658)))

(declare-fun b!392166 () Bool)

(declare-fun res!224556 () Bool)

(assert (=> b!392166 (=> (not res!224556) (not e!237494))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392166 (= res!224556 (validKeyInArray!0 k0!778))))

(declare-fun b!392167 () Bool)

(declare-fun res!224553 () Bool)

(declare-fun e!237491 () Bool)

(assert (=> b!392167 (=> (not res!224553) (not e!237491))))

(declare-fun lt!185259 () array!23257)

(declare-datatypes ((List!6436 0))(
  ( (Nil!6433) (Cons!6432 (h!7288 (_ BitVec 64)) (t!11602 List!6436)) )
))
(declare-fun arrayNoDuplicates!0 (array!23257 (_ BitVec 32) List!6436) Bool)

(assert (=> b!392167 (= res!224553 (arrayNoDuplicates!0 lt!185259 #b00000000000000000000000000000000 Nil!6433))))

(declare-fun b!392168 () Bool)

(declare-fun res!224557 () Bool)

(assert (=> b!392168 (=> (not res!224557) (not e!237494))))

(assert (=> b!392168 (= res!224557 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6433))))

(declare-fun b!392169 () Bool)

(declare-fun res!224554 () Bool)

(assert (=> b!392169 (=> (not res!224554) (not e!237494))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!392169 (= res!224554 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11441 _keys!658))))))

(declare-fun b!392170 () Bool)

(declare-fun res!224560 () Bool)

(assert (=> b!392170 (=> (not res!224560) (not e!237494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23257 (_ BitVec 32)) Bool)

(assert (=> b!392170 (= res!224560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392171 () Bool)

(declare-fun res!224559 () Bool)

(assert (=> b!392171 (=> (not res!224559) (not e!237494))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392171 (= res!224559 (and (= (size!11440 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11441 _keys!658) (size!11440 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392172 () Bool)

(declare-fun e!237495 () Bool)

(assert (=> b!392172 (= e!237495 tp_is_empty!9675)))

(declare-fun b!392173 () Bool)

(assert (=> b!392173 (= e!237491 (not e!237496))))

(declare-fun res!224561 () Bool)

(assert (=> b!392173 (=> res!224561 e!237496)))

(assert (=> b!392173 (= res!224561 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!185261 () ListLongMap!5495)

(declare-fun zeroValue!472 () V!14005)

(declare-fun getCurrentListMap!2105 (array!23257 array!23255 (_ BitVec 32) (_ BitVec 32) V!14005 V!14005 (_ BitVec 32) Int) ListLongMap!5495)

(assert (=> b!392173 (= lt!185261 (getCurrentListMap!2105 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185264 () array!23255)

(assert (=> b!392173 (= lt!185258 (getCurrentListMap!2105 lt!185259 lt!185264 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392173 (and (= lt!185265 lt!185257) (= lt!185257 lt!185265))))

(declare-fun v!373 () V!14005)

(declare-fun lt!185262 () ListLongMap!5495)

(assert (=> b!392173 (= lt!185257 (+!1058 lt!185262 (tuple2!6583 k0!778 v!373)))))

(declare-datatypes ((Unit!12000 0))(
  ( (Unit!12001) )
))
(declare-fun lt!185260 () Unit!12000)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!269 (array!23257 array!23255 (_ BitVec 32) (_ BitVec 32) V!14005 V!14005 (_ BitVec 32) (_ BitVec 64) V!14005 (_ BitVec 32) Int) Unit!12000)

(assert (=> b!392173 (= lt!185260 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!269 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!985 (array!23257 array!23255 (_ BitVec 32) (_ BitVec 32) V!14005 V!14005 (_ BitVec 32) Int) ListLongMap!5495)

(assert (=> b!392173 (= lt!185265 (getCurrentListMapNoExtraKeys!985 lt!185259 lt!185264 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392173 (= lt!185264 (array!23256 (store (arr!11088 _values!506) i!548 (ValueCellFull!4494 v!373)) (size!11440 _values!506)))))

(assert (=> b!392173 (= lt!185262 (getCurrentListMapNoExtraKeys!985 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392174 () Bool)

(assert (=> b!392174 (= e!237490 tp_is_empty!9675)))

(declare-fun mapNonEmpty!16101 () Bool)

(declare-fun tp!31784 () Bool)

(assert (=> mapNonEmpty!16101 (= mapRes!16101 (and tp!31784 e!237495))))

(declare-fun mapRest!16101 () (Array (_ BitVec 32) ValueCell!4494))

(declare-fun mapValue!16101 () ValueCell!4494)

(declare-fun mapKey!16101 () (_ BitVec 32))

(assert (=> mapNonEmpty!16101 (= (arr!11088 _values!506) (store mapRest!16101 mapKey!16101 mapValue!16101))))

(declare-fun b!392175 () Bool)

(assert (=> b!392175 (= e!237494 e!237491)))

(declare-fun res!224558 () Bool)

(assert (=> b!392175 (=> (not res!224558) (not e!237491))))

(assert (=> b!392175 (= res!224558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185259 mask!970))))

(assert (=> b!392175 (= lt!185259 (array!23258 (store (arr!11089 _keys!658) i!548 k0!778) (size!11441 _keys!658)))))

(declare-fun b!392176 () Bool)

(declare-fun res!224552 () Bool)

(assert (=> b!392176 (=> (not res!224552) (not e!237494))))

(assert (=> b!392176 (= res!224552 (or (= (select (arr!11089 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11089 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16101 () Bool)

(assert (=> mapIsEmpty!16101 mapRes!16101))

(declare-fun b!392177 () Bool)

(declare-fun res!224562 () Bool)

(assert (=> b!392177 (=> (not res!224562) (not e!237494))))

(declare-fun arrayContainsKey!0 (array!23257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392177 (= res!224562 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!38078 res!224555) b!392171))

(assert (= (and b!392171 res!224559) b!392170))

(assert (= (and b!392170 res!224560) b!392168))

(assert (= (and b!392168 res!224557) b!392169))

(assert (= (and b!392169 res!224554) b!392166))

(assert (= (and b!392166 res!224556) b!392176))

(assert (= (and b!392176 res!224552) b!392177))

(assert (= (and b!392177 res!224562) b!392175))

(assert (= (and b!392175 res!224558) b!392167))

(assert (= (and b!392167 res!224553) b!392173))

(assert (= (and b!392173 (not res!224561)) b!392165))

(assert (= (and b!392164 condMapEmpty!16101) mapIsEmpty!16101))

(assert (= (and b!392164 (not condMapEmpty!16101)) mapNonEmpty!16101))

(get-info :version)

(assert (= (and mapNonEmpty!16101 ((_ is ValueCellFull!4494) mapValue!16101)) b!392172))

(assert (= (and b!392164 ((_ is ValueCellFull!4494) mapDefault!16101)) b!392174))

(assert (= start!38078 b!392164))

(declare-fun m!388563 () Bool)

(assert (=> b!392173 m!388563))

(declare-fun m!388565 () Bool)

(assert (=> b!392173 m!388565))

(declare-fun m!388567 () Bool)

(assert (=> b!392173 m!388567))

(declare-fun m!388569 () Bool)

(assert (=> b!392173 m!388569))

(declare-fun m!388571 () Bool)

(assert (=> b!392173 m!388571))

(declare-fun m!388573 () Bool)

(assert (=> b!392173 m!388573))

(declare-fun m!388575 () Bool)

(assert (=> b!392173 m!388575))

(declare-fun m!388577 () Bool)

(assert (=> b!392165 m!388577))

(declare-fun m!388579 () Bool)

(assert (=> b!392165 m!388579))

(declare-fun m!388581 () Bool)

(assert (=> b!392167 m!388581))

(declare-fun m!388583 () Bool)

(assert (=> start!38078 m!388583))

(declare-fun m!388585 () Bool)

(assert (=> start!38078 m!388585))

(declare-fun m!388587 () Bool)

(assert (=> start!38078 m!388587))

(declare-fun m!388589 () Bool)

(assert (=> b!392170 m!388589))

(declare-fun m!388591 () Bool)

(assert (=> b!392176 m!388591))

(declare-fun m!388593 () Bool)

(assert (=> b!392166 m!388593))

(declare-fun m!388595 () Bool)

(assert (=> b!392175 m!388595))

(declare-fun m!388597 () Bool)

(assert (=> b!392175 m!388597))

(declare-fun m!388599 () Bool)

(assert (=> b!392168 m!388599))

(declare-fun m!388601 () Bool)

(assert (=> b!392177 m!388601))

(declare-fun m!388603 () Bool)

(assert (=> mapNonEmpty!16101 m!388603))

(check-sat (not b_next!9003) (not mapNonEmpty!16101) (not b!392168) (not b!392177) (not b!392166) (not b!392170) (not b!392167) b_and!16341 (not b!392175) (not start!38078) (not b!392165) tp_is_empty!9675 (not b!392173))
(check-sat b_and!16341 (not b_next!9003))
