; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21118 () Bool)

(assert start!21118)

(declare-fun b_free!5605 () Bool)

(declare-fun b_next!5605 () Bool)

(assert (=> start!21118 (= b_free!5605 (not b_next!5605))))

(declare-fun tp!19880 () Bool)

(declare-fun b_and!12461 () Bool)

(assert (=> start!21118 (= tp!19880 b_and!12461)))

(declare-fun res!103905 () Bool)

(declare-fun e!138275 () Bool)

(assert (=> start!21118 (=> (not res!103905) (not e!138275))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21118 (= res!103905 (validMask!0 mask!1149))))

(assert (=> start!21118 e!138275))

(declare-datatypes ((V!6937 0))(
  ( (V!6938 (val!2778 Int)) )
))
(declare-datatypes ((ValueCell!2390 0))(
  ( (ValueCellFull!2390 (v!4781 V!6937)) (EmptyCell!2390) )
))
(declare-datatypes ((array!10137 0))(
  ( (array!10138 (arr!4811 (Array (_ BitVec 32) ValueCell!2390)) (size!5136 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10137)

(declare-fun e!138273 () Bool)

(declare-fun array_inv!3159 (array!10137) Bool)

(assert (=> start!21118 (and (array_inv!3159 _values!649) e!138273)))

(assert (=> start!21118 true))

(declare-fun tp_is_empty!5467 () Bool)

(assert (=> start!21118 tp_is_empty!5467))

(declare-datatypes ((array!10139 0))(
  ( (array!10140 (arr!4812 (Array (_ BitVec 32) (_ BitVec 64))) (size!5137 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10139)

(declare-fun array_inv!3160 (array!10139) Bool)

(assert (=> start!21118 (array_inv!3160 _keys!825)))

(assert (=> start!21118 tp!19880))

(declare-fun mapIsEmpty!9293 () Bool)

(declare-fun mapRes!9293 () Bool)

(assert (=> mapIsEmpty!9293 mapRes!9293))

(declare-fun b!212529 () Bool)

(declare-fun res!103909 () Bool)

(assert (=> b!212529 (=> (not res!103909) (not e!138275))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212529 (= res!103909 (validKeyInArray!0 k0!843))))

(declare-fun b!212530 () Bool)

(declare-fun e!138276 () Bool)

(assert (=> b!212530 (= e!138276 tp_is_empty!5467)))

(declare-fun b!212531 () Bool)

(declare-fun res!103910 () Bool)

(assert (=> b!212531 (=> (not res!103910) (not e!138275))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212531 (= res!103910 (and (= (size!5136 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5137 _keys!825) (size!5136 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9293 () Bool)

(declare-fun tp!19879 () Bool)

(declare-fun e!138274 () Bool)

(assert (=> mapNonEmpty!9293 (= mapRes!9293 (and tp!19879 e!138274))))

(declare-fun mapValue!9293 () ValueCell!2390)

(declare-fun mapKey!9293 () (_ BitVec 32))

(declare-fun mapRest!9293 () (Array (_ BitVec 32) ValueCell!2390))

(assert (=> mapNonEmpty!9293 (= (arr!4811 _values!649) (store mapRest!9293 mapKey!9293 mapValue!9293))))

(declare-fun b!212532 () Bool)

(declare-fun e!138278 () Bool)

(assert (=> b!212532 (= e!138275 (not e!138278))))

(declare-fun res!103906 () Bool)

(assert (=> b!212532 (=> res!103906 e!138278)))

(assert (=> b!212532 (= res!103906 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6937)

(declare-datatypes ((tuple2!4148 0))(
  ( (tuple2!4149 (_1!2085 (_ BitVec 64)) (_2!2085 V!6937)) )
))
(declare-datatypes ((List!3031 0))(
  ( (Nil!3028) (Cons!3027 (h!3669 tuple2!4148) (t!7970 List!3031)) )
))
(declare-datatypes ((ListLongMap!3063 0))(
  ( (ListLongMap!3064 (toList!1547 List!3031)) )
))
(declare-fun lt!109603 () ListLongMap!3063)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6937)

(declare-fun getCurrentListMap!1083 (array!10139 array!10137 (_ BitVec 32) (_ BitVec 32) V!6937 V!6937 (_ BitVec 32) Int) ListLongMap!3063)

(assert (=> b!212532 (= lt!109603 (getCurrentListMap!1083 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109602 () array!10137)

(declare-fun lt!109597 () ListLongMap!3063)

(assert (=> b!212532 (= lt!109597 (getCurrentListMap!1083 _keys!825 lt!109602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109599 () ListLongMap!3063)

(declare-fun lt!109604 () ListLongMap!3063)

(assert (=> b!212532 (and (= lt!109599 lt!109604) (= lt!109604 lt!109599))))

(declare-fun lt!109601 () ListLongMap!3063)

(declare-fun v!520 () V!6937)

(declare-fun +!576 (ListLongMap!3063 tuple2!4148) ListLongMap!3063)

(assert (=> b!212532 (= lt!109604 (+!576 lt!109601 (tuple2!4149 k0!843 v!520)))))

(declare-datatypes ((Unit!6440 0))(
  ( (Unit!6441) )
))
(declare-fun lt!109600 () Unit!6440)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!224 (array!10139 array!10137 (_ BitVec 32) (_ BitVec 32) V!6937 V!6937 (_ BitVec 32) (_ BitVec 64) V!6937 (_ BitVec 32) Int) Unit!6440)

(assert (=> b!212532 (= lt!109600 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!224 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!506 (array!10139 array!10137 (_ BitVec 32) (_ BitVec 32) V!6937 V!6937 (_ BitVec 32) Int) ListLongMap!3063)

(assert (=> b!212532 (= lt!109599 (getCurrentListMapNoExtraKeys!506 _keys!825 lt!109602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212532 (= lt!109602 (array!10138 (store (arr!4811 _values!649) i!601 (ValueCellFull!2390 v!520)) (size!5136 _values!649)))))

(assert (=> b!212532 (= lt!109601 (getCurrentListMapNoExtraKeys!506 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212533 () Bool)

(assert (=> b!212533 (= e!138273 (and e!138276 mapRes!9293))))

(declare-fun condMapEmpty!9293 () Bool)

(declare-fun mapDefault!9293 () ValueCell!2390)

(assert (=> b!212533 (= condMapEmpty!9293 (= (arr!4811 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2390)) mapDefault!9293)))))

(declare-fun b!212534 () Bool)

(assert (=> b!212534 (= e!138274 tp_is_empty!5467)))

(declare-fun b!212535 () Bool)

(declare-fun res!103912 () Bool)

(assert (=> b!212535 (=> (not res!103912) (not e!138275))))

(assert (=> b!212535 (= res!103912 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5137 _keys!825))))))

(declare-fun b!212536 () Bool)

(declare-fun res!103907 () Bool)

(assert (=> b!212536 (=> (not res!103907) (not e!138275))))

(assert (=> b!212536 (= res!103907 (= (select (arr!4812 _keys!825) i!601) k0!843))))

(declare-fun b!212537 () Bool)

(declare-fun res!103908 () Bool)

(assert (=> b!212537 (=> (not res!103908) (not e!138275))))

(declare-datatypes ((List!3032 0))(
  ( (Nil!3029) (Cons!3028 (h!3670 (_ BitVec 64)) (t!7971 List!3032)) )
))
(declare-fun arrayNoDuplicates!0 (array!10139 (_ BitVec 32) List!3032) Bool)

(assert (=> b!212537 (= res!103908 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3029))))

(declare-fun b!212538 () Bool)

(declare-fun res!103911 () Bool)

(assert (=> b!212538 (=> (not res!103911) (not e!138275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10139 (_ BitVec 32)) Bool)

(assert (=> b!212538 (= res!103911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun lt!109598 () tuple2!4148)

(declare-fun b!212539 () Bool)

(assert (=> b!212539 (= e!138278 (= lt!109597 (+!576 lt!109604 lt!109598)))))

(assert (=> b!212539 (= lt!109597 (+!576 lt!109599 lt!109598))))

(assert (=> b!212539 (= lt!109598 (tuple2!4149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!21118 res!103905) b!212531))

(assert (= (and b!212531 res!103910) b!212538))

(assert (= (and b!212538 res!103911) b!212537))

(assert (= (and b!212537 res!103908) b!212535))

(assert (= (and b!212535 res!103912) b!212529))

(assert (= (and b!212529 res!103909) b!212536))

(assert (= (and b!212536 res!103907) b!212532))

(assert (= (and b!212532 (not res!103906)) b!212539))

(assert (= (and b!212533 condMapEmpty!9293) mapIsEmpty!9293))

(assert (= (and b!212533 (not condMapEmpty!9293)) mapNonEmpty!9293))

(get-info :version)

(assert (= (and mapNonEmpty!9293 ((_ is ValueCellFull!2390) mapValue!9293)) b!212534))

(assert (= (and b!212533 ((_ is ValueCellFull!2390) mapDefault!9293)) b!212530))

(assert (= start!21118 b!212533))

(declare-fun m!240465 () Bool)

(assert (=> b!212538 m!240465))

(declare-fun m!240467 () Bool)

(assert (=> b!212529 m!240467))

(declare-fun m!240469 () Bool)

(assert (=> b!212532 m!240469))

(declare-fun m!240471 () Bool)

(assert (=> b!212532 m!240471))

(declare-fun m!240473 () Bool)

(assert (=> b!212532 m!240473))

(declare-fun m!240475 () Bool)

(assert (=> b!212532 m!240475))

(declare-fun m!240477 () Bool)

(assert (=> b!212532 m!240477))

(declare-fun m!240479 () Bool)

(assert (=> b!212532 m!240479))

(declare-fun m!240481 () Bool)

(assert (=> b!212532 m!240481))

(declare-fun m!240483 () Bool)

(assert (=> b!212537 m!240483))

(declare-fun m!240485 () Bool)

(assert (=> b!212536 m!240485))

(declare-fun m!240487 () Bool)

(assert (=> b!212539 m!240487))

(declare-fun m!240489 () Bool)

(assert (=> b!212539 m!240489))

(declare-fun m!240491 () Bool)

(assert (=> mapNonEmpty!9293 m!240491))

(declare-fun m!240493 () Bool)

(assert (=> start!21118 m!240493))

(declare-fun m!240495 () Bool)

(assert (=> start!21118 m!240495))

(declare-fun m!240497 () Bool)

(assert (=> start!21118 m!240497))

(check-sat tp_is_empty!5467 (not mapNonEmpty!9293) (not b!212532) (not start!21118) b_and!12461 (not b!212537) (not b!212529) (not b!212539) (not b_next!5605) (not b!212538))
(check-sat b_and!12461 (not b_next!5605))
