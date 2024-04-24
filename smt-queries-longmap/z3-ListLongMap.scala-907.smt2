; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20542 () Bool)

(assert start!20542)

(declare-fun b_free!5197 () Bool)

(declare-fun b_next!5197 () Bool)

(assert (=> start!20542 (= b_free!5197 (not b_next!5197))))

(declare-fun tp!18622 () Bool)

(declare-fun b_and!11957 () Bool)

(assert (=> start!20542 (= tp!18622 b_and!11957)))

(declare-fun b!204230 () Bool)

(declare-fun e!133643 () Bool)

(declare-fun tp_is_empty!5053 () Bool)

(assert (=> b!204230 (= e!133643 tp_is_empty!5053)))

(declare-fun b!204231 () Bool)

(declare-fun e!133641 () Bool)

(assert (=> b!204231 (= e!133641 true)))

(declare-datatypes ((V!6385 0))(
  ( (V!6386 (val!2571 Int)) )
))
(declare-datatypes ((tuple2!3844 0))(
  ( (tuple2!3845 (_1!1933 (_ BitVec 64)) (_2!1933 V!6385)) )
))
(declare-datatypes ((List!2740 0))(
  ( (Nil!2737) (Cons!2736 (h!3378 tuple2!3844) (t!7663 List!2740)) )
))
(declare-datatypes ((ListLongMap!2759 0))(
  ( (ListLongMap!2760 (toList!1395 List!2740)) )
))
(declare-fun lt!103430 () ListLongMap!2759)

(declare-fun lt!103426 () ListLongMap!2759)

(declare-fun lt!103424 () tuple2!3844)

(declare-fun +!449 (ListLongMap!2759 tuple2!3844) ListLongMap!2759)

(assert (=> b!204231 (= lt!103430 (+!449 lt!103426 lt!103424))))

(declare-fun lt!103423 () ListLongMap!2759)

(declare-fun v!520 () V!6385)

(declare-fun k0!843 () (_ BitVec 64))

(declare-datatypes ((Unit!6178 0))(
  ( (Unit!6179) )
))
(declare-fun lt!103425 () Unit!6178)

(declare-fun zeroValue!615 () V!6385)

(declare-fun addCommutativeForDiffKeys!159 (ListLongMap!2759 (_ BitVec 64) V!6385 (_ BitVec 64) V!6385) Unit!6178)

(assert (=> b!204231 (= lt!103425 (addCommutativeForDiffKeys!159 lt!103423 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8648 () Bool)

(declare-fun mapRes!8648 () Bool)

(assert (=> mapIsEmpty!8648 mapRes!8648))

(declare-fun b!204232 () Bool)

(declare-fun e!133644 () Bool)

(declare-fun e!133645 () Bool)

(assert (=> b!204232 (= e!133644 (and e!133645 mapRes!8648))))

(declare-fun condMapEmpty!8648 () Bool)

(declare-datatypes ((ValueCell!2183 0))(
  ( (ValueCellFull!2183 (v!4542 V!6385)) (EmptyCell!2183) )
))
(declare-datatypes ((array!9317 0))(
  ( (array!9318 (arr!4409 (Array (_ BitVec 32) ValueCell!2183)) (size!4734 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9317)

(declare-fun mapDefault!8648 () ValueCell!2183)

(assert (=> b!204232 (= condMapEmpty!8648 (= (arr!4409 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2183)) mapDefault!8648)))))

(declare-fun b!204233 () Bool)

(assert (=> b!204233 (= e!133645 tp_is_empty!5053)))

(declare-fun b!204234 () Bool)

(declare-fun res!98334 () Bool)

(declare-fun e!133640 () Bool)

(assert (=> b!204234 (=> (not res!98334) (not e!133640))))

(declare-datatypes ((array!9319 0))(
  ( (array!9320 (arr!4410 (Array (_ BitVec 32) (_ BitVec 64))) (size!4735 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9319)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204234 (= res!98334 (= (select (arr!4410 _keys!825) i!601) k0!843))))

(declare-fun res!98340 () Bool)

(assert (=> start!20542 (=> (not res!98340) (not e!133640))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20542 (= res!98340 (validMask!0 mask!1149))))

(assert (=> start!20542 e!133640))

(declare-fun array_inv!2881 (array!9317) Bool)

(assert (=> start!20542 (and (array_inv!2881 _values!649) e!133644)))

(assert (=> start!20542 true))

(assert (=> start!20542 tp_is_empty!5053))

(declare-fun array_inv!2882 (array!9319) Bool)

(assert (=> start!20542 (array_inv!2882 _keys!825)))

(assert (=> start!20542 tp!18622))

(declare-fun b!204235 () Bool)

(declare-fun res!98335 () Bool)

(assert (=> b!204235 (=> (not res!98335) (not e!133640))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204235 (= res!98335 (and (= (size!4734 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4735 _keys!825) (size!4734 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204236 () Bool)

(declare-fun e!133642 () Bool)

(assert (=> b!204236 (= e!133640 (not e!133642))))

(declare-fun res!98338 () Bool)

(assert (=> b!204236 (=> res!98338 e!133642)))

(assert (=> b!204236 (= res!98338 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!103427 () ListLongMap!2759)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6385)

(declare-fun getCurrentListMap!972 (array!9319 array!9317 (_ BitVec 32) (_ BitVec 32) V!6385 V!6385 (_ BitVec 32) Int) ListLongMap!2759)

(assert (=> b!204236 (= lt!103427 (getCurrentListMap!972 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103428 () array!9317)

(declare-fun lt!103421 () ListLongMap!2759)

(assert (=> b!204236 (= lt!103421 (getCurrentListMap!972 _keys!825 lt!103428 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103419 () ListLongMap!2759)

(declare-fun lt!103429 () ListLongMap!2759)

(assert (=> b!204236 (and (= lt!103419 lt!103429) (= lt!103429 lt!103419))))

(assert (=> b!204236 (= lt!103429 (+!449 lt!103423 lt!103424))))

(assert (=> b!204236 (= lt!103424 (tuple2!3845 k0!843 v!520))))

(declare-fun lt!103420 () Unit!6178)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!108 (array!9319 array!9317 (_ BitVec 32) (_ BitVec 32) V!6385 V!6385 (_ BitVec 32) (_ BitVec 64) V!6385 (_ BitVec 32) Int) Unit!6178)

(assert (=> b!204236 (= lt!103420 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!108 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!365 (array!9319 array!9317 (_ BitVec 32) (_ BitVec 32) V!6385 V!6385 (_ BitVec 32) Int) ListLongMap!2759)

(assert (=> b!204236 (= lt!103419 (getCurrentListMapNoExtraKeys!365 _keys!825 lt!103428 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204236 (= lt!103428 (array!9318 (store (arr!4409 _values!649) i!601 (ValueCellFull!2183 v!520)) (size!4734 _values!649)))))

(assert (=> b!204236 (= lt!103423 (getCurrentListMapNoExtraKeys!365 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204237 () Bool)

(declare-fun res!98333 () Bool)

(assert (=> b!204237 (=> (not res!98333) (not e!133640))))

(declare-datatypes ((List!2741 0))(
  ( (Nil!2738) (Cons!2737 (h!3379 (_ BitVec 64)) (t!7664 List!2741)) )
))
(declare-fun arrayNoDuplicates!0 (array!9319 (_ BitVec 32) List!2741) Bool)

(assert (=> b!204237 (= res!98333 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2738))))

(declare-fun b!204238 () Bool)

(assert (=> b!204238 (= e!133642 e!133641)))

(declare-fun res!98337 () Bool)

(assert (=> b!204238 (=> res!98337 e!133641)))

(assert (=> b!204238 (= res!98337 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!204238 (= lt!103421 lt!103430)))

(declare-fun lt!103422 () tuple2!3844)

(assert (=> b!204238 (= lt!103430 (+!449 lt!103429 lt!103422))))

(assert (=> b!204238 (= lt!103427 lt!103426)))

(assert (=> b!204238 (= lt!103426 (+!449 lt!103423 lt!103422))))

(assert (=> b!204238 (= lt!103421 (+!449 lt!103419 lt!103422))))

(assert (=> b!204238 (= lt!103422 (tuple2!3845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8648 () Bool)

(declare-fun tp!18623 () Bool)

(assert (=> mapNonEmpty!8648 (= mapRes!8648 (and tp!18623 e!133643))))

(declare-fun mapRest!8648 () (Array (_ BitVec 32) ValueCell!2183))

(declare-fun mapValue!8648 () ValueCell!2183)

(declare-fun mapKey!8648 () (_ BitVec 32))

(assert (=> mapNonEmpty!8648 (= (arr!4409 _values!649) (store mapRest!8648 mapKey!8648 mapValue!8648))))

(declare-fun b!204239 () Bool)

(declare-fun res!98339 () Bool)

(assert (=> b!204239 (=> (not res!98339) (not e!133640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9319 (_ BitVec 32)) Bool)

(assert (=> b!204239 (= res!98339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204240 () Bool)

(declare-fun res!98341 () Bool)

(assert (=> b!204240 (=> (not res!98341) (not e!133640))))

(assert (=> b!204240 (= res!98341 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4735 _keys!825))))))

(declare-fun b!204241 () Bool)

(declare-fun res!98336 () Bool)

(assert (=> b!204241 (=> (not res!98336) (not e!133640))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204241 (= res!98336 (validKeyInArray!0 k0!843))))

(assert (= (and start!20542 res!98340) b!204235))

(assert (= (and b!204235 res!98335) b!204239))

(assert (= (and b!204239 res!98339) b!204237))

(assert (= (and b!204237 res!98333) b!204240))

(assert (= (and b!204240 res!98341) b!204241))

(assert (= (and b!204241 res!98336) b!204234))

(assert (= (and b!204234 res!98334) b!204236))

(assert (= (and b!204236 (not res!98338)) b!204238))

(assert (= (and b!204238 (not res!98337)) b!204231))

(assert (= (and b!204232 condMapEmpty!8648) mapIsEmpty!8648))

(assert (= (and b!204232 (not condMapEmpty!8648)) mapNonEmpty!8648))

(get-info :version)

(assert (= (and mapNonEmpty!8648 ((_ is ValueCellFull!2183) mapValue!8648)) b!204230))

(assert (= (and b!204232 ((_ is ValueCellFull!2183) mapDefault!8648)) b!204233))

(assert (= start!20542 b!204232))

(declare-fun m!231873 () Bool)

(assert (=> b!204238 m!231873))

(declare-fun m!231875 () Bool)

(assert (=> b!204238 m!231875))

(declare-fun m!231877 () Bool)

(assert (=> b!204238 m!231877))

(declare-fun m!231879 () Bool)

(assert (=> start!20542 m!231879))

(declare-fun m!231881 () Bool)

(assert (=> start!20542 m!231881))

(declare-fun m!231883 () Bool)

(assert (=> start!20542 m!231883))

(declare-fun m!231885 () Bool)

(assert (=> b!204237 m!231885))

(declare-fun m!231887 () Bool)

(assert (=> b!204234 m!231887))

(declare-fun m!231889 () Bool)

(assert (=> b!204241 m!231889))

(declare-fun m!231891 () Bool)

(assert (=> mapNonEmpty!8648 m!231891))

(declare-fun m!231893 () Bool)

(assert (=> b!204239 m!231893))

(declare-fun m!231895 () Bool)

(assert (=> b!204231 m!231895))

(declare-fun m!231897 () Bool)

(assert (=> b!204231 m!231897))

(declare-fun m!231899 () Bool)

(assert (=> b!204236 m!231899))

(declare-fun m!231901 () Bool)

(assert (=> b!204236 m!231901))

(declare-fun m!231903 () Bool)

(assert (=> b!204236 m!231903))

(declare-fun m!231905 () Bool)

(assert (=> b!204236 m!231905))

(declare-fun m!231907 () Bool)

(assert (=> b!204236 m!231907))

(declare-fun m!231909 () Bool)

(assert (=> b!204236 m!231909))

(declare-fun m!231911 () Bool)

(assert (=> b!204236 m!231911))

(check-sat (not b!204238) b_and!11957 (not b!204237) tp_is_empty!5053 (not b!204231) (not b_next!5197) (not b!204241) (not b!204236) (not start!20542) (not b!204239) (not mapNonEmpty!8648))
(check-sat b_and!11957 (not b_next!5197))
