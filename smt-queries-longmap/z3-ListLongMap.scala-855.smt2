; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20228 () Bool)

(assert start!20228)

(declare-fun b_free!4887 () Bool)

(declare-fun b_next!4887 () Bool)

(assert (=> start!20228 (= b_free!4887 (not b_next!4887))))

(declare-fun tp!17692 () Bool)

(declare-fun b_and!11633 () Bool)

(assert (=> start!20228 (= tp!17692 b_and!11633)))

(declare-fun b!198854 () Bool)

(declare-fun e!130634 () Bool)

(declare-fun e!130631 () Bool)

(declare-fun mapRes!8183 () Bool)

(assert (=> b!198854 (= e!130634 (and e!130631 mapRes!8183))))

(declare-fun condMapEmpty!8183 () Bool)

(declare-datatypes ((V!5971 0))(
  ( (V!5972 (val!2416 Int)) )
))
(declare-datatypes ((ValueCell!2028 0))(
  ( (ValueCellFull!2028 (v!4386 V!5971)) (EmptyCell!2028) )
))
(declare-datatypes ((array!8727 0))(
  ( (array!8728 (arr!4114 (Array (_ BitVec 32) ValueCell!2028)) (size!4439 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8727)

(declare-fun mapDefault!8183 () ValueCell!2028)

(assert (=> b!198854 (= condMapEmpty!8183 (= (arr!4114 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2028)) mapDefault!8183)))))

(declare-fun b!198855 () Bool)

(declare-fun res!94378 () Bool)

(declare-fun e!130630 () Bool)

(assert (=> b!198855 (=> (not res!94378) (not e!130630))))

(declare-datatypes ((array!8729 0))(
  ( (array!8730 (arr!4115 (Array (_ BitVec 32) (_ BitVec 64))) (size!4440 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8729)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!198855 (= res!94378 (and (= (size!4439 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4440 _keys!825) (size!4439 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198856 () Bool)

(declare-fun tp_is_empty!4743 () Bool)

(assert (=> b!198856 (= e!130631 tp_is_empty!4743)))

(declare-fun b!198858 () Bool)

(declare-fun res!94380 () Bool)

(assert (=> b!198858 (=> (not res!94380) (not e!130630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8729 (_ BitVec 32)) Bool)

(assert (=> b!198858 (= res!94380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8183 () Bool)

(declare-fun tp!17693 () Bool)

(declare-fun e!130633 () Bool)

(assert (=> mapNonEmpty!8183 (= mapRes!8183 (and tp!17693 e!130633))))

(declare-fun mapValue!8183 () ValueCell!2028)

(declare-fun mapRest!8183 () (Array (_ BitVec 32) ValueCell!2028))

(declare-fun mapKey!8183 () (_ BitVec 32))

(assert (=> mapNonEmpty!8183 (= (arr!4114 _values!649) (store mapRest!8183 mapKey!8183 mapValue!8183))))

(declare-fun b!198859 () Bool)

(assert (=> b!198859 (= e!130633 tp_is_empty!4743)))

(declare-fun b!198860 () Bool)

(declare-fun res!94383 () Bool)

(assert (=> b!198860 (=> (not res!94383) (not e!130630))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198860 (= res!94383 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4440 _keys!825))))))

(declare-fun b!198861 () Bool)

(declare-fun res!94381 () Bool)

(assert (=> b!198861 (=> (not res!94381) (not e!130630))))

(declare-datatypes ((List!2575 0))(
  ( (Nil!2572) (Cons!2571 (h!3213 (_ BitVec 64)) (t!7506 List!2575)) )
))
(declare-fun arrayNoDuplicates!0 (array!8729 (_ BitVec 32) List!2575) Bool)

(assert (=> b!198861 (= res!94381 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2572))))

(declare-fun res!94382 () Bool)

(assert (=> start!20228 (=> (not res!94382) (not e!130630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20228 (= res!94382 (validMask!0 mask!1149))))

(assert (=> start!20228 e!130630))

(declare-fun array_inv!2695 (array!8727) Bool)

(assert (=> start!20228 (and (array_inv!2695 _values!649) e!130634)))

(assert (=> start!20228 true))

(assert (=> start!20228 tp_is_empty!4743))

(declare-fun array_inv!2696 (array!8729) Bool)

(assert (=> start!20228 (array_inv!2696 _keys!825)))

(assert (=> start!20228 tp!17692))

(declare-fun b!198857 () Bool)

(declare-fun res!94379 () Bool)

(assert (=> b!198857 (=> (not res!94379) (not e!130630))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!198857 (= res!94379 (= (select (arr!4115 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8183 () Bool)

(assert (=> mapIsEmpty!8183 mapRes!8183))

(declare-fun b!198862 () Bool)

(declare-fun res!94384 () Bool)

(assert (=> b!198862 (=> (not res!94384) (not e!130630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198862 (= res!94384 (validKeyInArray!0 k0!843))))

(declare-fun b!198863 () Bool)

(assert (=> b!198863 (= e!130630 (not true))))

(declare-datatypes ((tuple2!3660 0))(
  ( (tuple2!3661 (_1!1841 (_ BitVec 64)) (_2!1841 V!5971)) )
))
(declare-datatypes ((List!2576 0))(
  ( (Nil!2573) (Cons!2572 (h!3214 tuple2!3660) (t!7507 List!2576)) )
))
(declare-datatypes ((ListLongMap!2573 0))(
  ( (ListLongMap!2574 (toList!1302 List!2576)) )
))
(declare-fun lt!98064 () ListLongMap!2573)

(declare-fun lt!98067 () ListLongMap!2573)

(assert (=> b!198863 (and (= lt!98064 lt!98067) (= lt!98067 lt!98064))))

(declare-fun lt!98065 () ListLongMap!2573)

(declare-fun v!520 () V!5971)

(declare-fun +!329 (ListLongMap!2573 tuple2!3660) ListLongMap!2573)

(assert (=> b!198863 (= lt!98067 (+!329 lt!98065 (tuple2!3661 k0!843 v!520)))))

(declare-datatypes ((Unit!5960 0))(
  ( (Unit!5961) )
))
(declare-fun lt!98066 () Unit!5960)

(declare-fun zeroValue!615 () V!5971)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5971)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!6 (array!8729 array!8727 (_ BitVec 32) (_ BitVec 32) V!5971 V!5971 (_ BitVec 32) (_ BitVec 64) V!5971 (_ BitVec 32) Int) Unit!5960)

(assert (=> b!198863 (= lt!98066 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!6 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!267 (array!8729 array!8727 (_ BitVec 32) (_ BitVec 32) V!5971 V!5971 (_ BitVec 32) Int) ListLongMap!2573)

(assert (=> b!198863 (= lt!98064 (getCurrentListMapNoExtraKeys!267 _keys!825 (array!8728 (store (arr!4114 _values!649) i!601 (ValueCellFull!2028 v!520)) (size!4439 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198863 (= lt!98065 (getCurrentListMapNoExtraKeys!267 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20228 res!94382) b!198855))

(assert (= (and b!198855 res!94378) b!198858))

(assert (= (and b!198858 res!94380) b!198861))

(assert (= (and b!198861 res!94381) b!198860))

(assert (= (and b!198860 res!94383) b!198862))

(assert (= (and b!198862 res!94384) b!198857))

(assert (= (and b!198857 res!94379) b!198863))

(assert (= (and b!198854 condMapEmpty!8183) mapIsEmpty!8183))

(assert (= (and b!198854 (not condMapEmpty!8183)) mapNonEmpty!8183))

(get-info :version)

(assert (= (and mapNonEmpty!8183 ((_ is ValueCellFull!2028) mapValue!8183)) b!198859))

(assert (= (and b!198854 ((_ is ValueCellFull!2028) mapDefault!8183)) b!198856))

(assert (= start!20228 b!198854))

(declare-fun m!225393 () Bool)

(assert (=> b!198861 m!225393))

(declare-fun m!225395 () Bool)

(assert (=> b!198862 m!225395))

(declare-fun m!225397 () Bool)

(assert (=> mapNonEmpty!8183 m!225397))

(declare-fun m!225399 () Bool)

(assert (=> b!198858 m!225399))

(declare-fun m!225401 () Bool)

(assert (=> start!20228 m!225401))

(declare-fun m!225403 () Bool)

(assert (=> start!20228 m!225403))

(declare-fun m!225405 () Bool)

(assert (=> start!20228 m!225405))

(declare-fun m!225407 () Bool)

(assert (=> b!198857 m!225407))

(declare-fun m!225409 () Bool)

(assert (=> b!198863 m!225409))

(declare-fun m!225411 () Bool)

(assert (=> b!198863 m!225411))

(declare-fun m!225413 () Bool)

(assert (=> b!198863 m!225413))

(declare-fun m!225415 () Bool)

(assert (=> b!198863 m!225415))

(declare-fun m!225417 () Bool)

(assert (=> b!198863 m!225417))

(check-sat (not b!198861) b_and!11633 (not mapNonEmpty!8183) (not start!20228) (not b!198858) (not b_next!4887) (not b!198862) (not b!198863) tp_is_empty!4743)
(check-sat b_and!11633 (not b_next!4887))
