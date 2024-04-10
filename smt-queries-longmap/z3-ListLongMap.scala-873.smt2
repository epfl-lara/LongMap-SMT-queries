; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20336 () Bool)

(assert start!20336)

(declare-fun b_free!4995 () Bool)

(declare-fun b_next!4995 () Bool)

(assert (=> start!20336 (= b_free!4995 (not b_next!4995))))

(declare-fun tp!18017 () Bool)

(declare-fun b_and!11741 () Bool)

(assert (=> start!20336 (= tp!18017 b_and!11741)))

(declare-fun b!200538 () Bool)

(declare-fun res!95581 () Bool)

(declare-fun e!131499 () Bool)

(assert (=> b!200538 (=> (not res!95581) (not e!131499))))

(declare-datatypes ((array!8933 0))(
  ( (array!8934 (arr!4217 (Array (_ BitVec 32) (_ BitVec 64))) (size!4542 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8933)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8933 (_ BitVec 32)) Bool)

(assert (=> b!200538 (= res!95581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200539 () Bool)

(declare-fun res!95583 () Bool)

(assert (=> b!200539 (=> (not res!95583) (not e!131499))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6115 0))(
  ( (V!6116 (val!2470 Int)) )
))
(declare-datatypes ((ValueCell!2082 0))(
  ( (ValueCellFull!2082 (v!4440 V!6115)) (EmptyCell!2082) )
))
(declare-datatypes ((array!8935 0))(
  ( (array!8936 (arr!4218 (Array (_ BitVec 32) ValueCell!2082)) (size!4543 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8935)

(assert (=> b!200539 (= res!95583 (and (= (size!4543 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4542 _keys!825) (size!4543 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8345 () Bool)

(declare-fun mapRes!8345 () Bool)

(assert (=> mapIsEmpty!8345 mapRes!8345))

(declare-fun b!200540 () Bool)

(declare-fun e!131496 () Bool)

(declare-fun e!131498 () Bool)

(assert (=> b!200540 (= e!131496 (and e!131498 mapRes!8345))))

(declare-fun condMapEmpty!8345 () Bool)

(declare-fun mapDefault!8345 () ValueCell!2082)

(assert (=> b!200540 (= condMapEmpty!8345 (= (arr!4218 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2082)) mapDefault!8345)))))

(declare-fun mapNonEmpty!8345 () Bool)

(declare-fun tp!18016 () Bool)

(declare-fun e!131501 () Bool)

(assert (=> mapNonEmpty!8345 (= mapRes!8345 (and tp!18016 e!131501))))

(declare-fun mapRest!8345 () (Array (_ BitVec 32) ValueCell!2082))

(declare-fun mapValue!8345 () ValueCell!2082)

(declare-fun mapKey!8345 () (_ BitVec 32))

(assert (=> mapNonEmpty!8345 (= (arr!4218 _values!649) (store mapRest!8345 mapKey!8345 mapValue!8345))))

(declare-fun res!95584 () Bool)

(assert (=> start!20336 (=> (not res!95584) (not e!131499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20336 (= res!95584 (validMask!0 mask!1149))))

(assert (=> start!20336 e!131499))

(declare-fun array_inv!2773 (array!8935) Bool)

(assert (=> start!20336 (and (array_inv!2773 _values!649) e!131496)))

(assert (=> start!20336 true))

(declare-fun tp_is_empty!4851 () Bool)

(assert (=> start!20336 tp_is_empty!4851))

(declare-fun array_inv!2774 (array!8933) Bool)

(assert (=> start!20336 (array_inv!2774 _keys!825)))

(assert (=> start!20336 tp!18017))

(declare-fun b!200541 () Bool)

(declare-fun res!95577 () Bool)

(assert (=> b!200541 (=> (not res!95577) (not e!131499))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!200541 (= res!95577 (= (select (arr!4217 _keys!825) i!601) k0!843))))

(declare-fun b!200542 () Bool)

(declare-fun res!95578 () Bool)

(assert (=> b!200542 (=> (not res!95578) (not e!131499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200542 (= res!95578 (validKeyInArray!0 k0!843))))

(declare-fun b!200543 () Bool)

(assert (=> b!200543 (= e!131501 tp_is_empty!4851)))

(declare-fun b!200544 () Bool)

(declare-fun res!95580 () Bool)

(assert (=> b!200544 (=> (not res!95580) (not e!131499))))

(assert (=> b!200544 (= res!95580 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4542 _keys!825))))))

(declare-fun b!200545 () Bool)

(declare-fun e!131495 () Bool)

(assert (=> b!200545 (= e!131495 true)))

(declare-datatypes ((tuple2!3732 0))(
  ( (tuple2!3733 (_1!1877 (_ BitVec 64)) (_2!1877 V!6115)) )
))
(declare-datatypes ((List!2649 0))(
  ( (Nil!2646) (Cons!2645 (h!3287 tuple2!3732) (t!7580 List!2649)) )
))
(declare-datatypes ((ListLongMap!2645 0))(
  ( (ListLongMap!2646 (toList!1338 List!2649)) )
))
(declare-fun lt!99182 () ListLongMap!2645)

(declare-fun lt!99173 () ListLongMap!2645)

(declare-fun lt!99172 () tuple2!3732)

(declare-fun lt!99175 () tuple2!3732)

(declare-fun +!365 (ListLongMap!2645 tuple2!3732) ListLongMap!2645)

(assert (=> b!200545 (= (+!365 lt!99173 lt!99172) (+!365 lt!99182 lt!99175))))

(declare-fun lt!99176 () ListLongMap!2645)

(declare-fun minValue!615 () V!6115)

(declare-fun v!520 () V!6115)

(declare-datatypes ((Unit!6030 0))(
  ( (Unit!6031) )
))
(declare-fun lt!99169 () Unit!6030)

(declare-fun addCommutativeForDiffKeys!88 (ListLongMap!2645 (_ BitVec 64) V!6115 (_ BitVec 64) V!6115) Unit!6030)

(assert (=> b!200545 (= lt!99169 (addCommutativeForDiffKeys!88 lt!99176 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200546 () Bool)

(assert (=> b!200546 (= e!131498 tp_is_empty!4851)))

(declare-fun b!200547 () Bool)

(declare-fun res!95579 () Bool)

(assert (=> b!200547 (=> (not res!95579) (not e!131499))))

(declare-datatypes ((List!2650 0))(
  ( (Nil!2647) (Cons!2646 (h!3288 (_ BitVec 64)) (t!7581 List!2650)) )
))
(declare-fun arrayNoDuplicates!0 (array!8933 (_ BitVec 32) List!2650) Bool)

(assert (=> b!200547 (= res!95579 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2647))))

(declare-fun b!200548 () Bool)

(declare-fun e!131497 () Bool)

(assert (=> b!200548 (= e!131499 (not e!131497))))

(declare-fun res!95576 () Bool)

(assert (=> b!200548 (=> res!95576 e!131497)))

(assert (=> b!200548 (= res!95576 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!99171 () ListLongMap!2645)

(declare-fun zeroValue!615 () V!6115)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!928 (array!8933 array!8935 (_ BitVec 32) (_ BitVec 32) V!6115 V!6115 (_ BitVec 32) Int) ListLongMap!2645)

(assert (=> b!200548 (= lt!99171 (getCurrentListMap!928 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99180 () array!8935)

(declare-fun lt!99174 () ListLongMap!2645)

(assert (=> b!200548 (= lt!99174 (getCurrentListMap!928 _keys!825 lt!99180 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99183 () ListLongMap!2645)

(declare-fun lt!99170 () ListLongMap!2645)

(assert (=> b!200548 (and (= lt!99183 lt!99170) (= lt!99170 lt!99183))))

(declare-fun lt!99168 () ListLongMap!2645)

(assert (=> b!200548 (= lt!99170 (+!365 lt!99168 lt!99175))))

(assert (=> b!200548 (= lt!99175 (tuple2!3733 k0!843 v!520))))

(declare-fun lt!99179 () Unit!6030)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!41 (array!8933 array!8935 (_ BitVec 32) (_ BitVec 32) V!6115 V!6115 (_ BitVec 32) (_ BitVec 64) V!6115 (_ BitVec 32) Int) Unit!6030)

(assert (=> b!200548 (= lt!99179 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!41 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!302 (array!8933 array!8935 (_ BitVec 32) (_ BitVec 32) V!6115 V!6115 (_ BitVec 32) Int) ListLongMap!2645)

(assert (=> b!200548 (= lt!99183 (getCurrentListMapNoExtraKeys!302 _keys!825 lt!99180 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200548 (= lt!99180 (array!8936 (store (arr!4218 _values!649) i!601 (ValueCellFull!2082 v!520)) (size!4543 _values!649)))))

(assert (=> b!200548 (= lt!99168 (getCurrentListMapNoExtraKeys!302 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200549 () Bool)

(assert (=> b!200549 (= e!131497 e!131495)))

(declare-fun res!95582 () Bool)

(assert (=> b!200549 (=> res!95582 e!131495)))

(assert (=> b!200549 (= res!95582 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99181 () ListLongMap!2645)

(assert (=> b!200549 (= lt!99181 lt!99173)))

(assert (=> b!200549 (= lt!99173 (+!365 lt!99176 lt!99175))))

(declare-fun lt!99177 () Unit!6030)

(assert (=> b!200549 (= lt!99177 (addCommutativeForDiffKeys!88 lt!99168 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!200549 (= lt!99174 (+!365 lt!99181 lt!99172))))

(declare-fun lt!99178 () tuple2!3732)

(assert (=> b!200549 (= lt!99181 (+!365 lt!99170 lt!99178))))

(assert (=> b!200549 (= lt!99171 lt!99182)))

(assert (=> b!200549 (= lt!99182 (+!365 lt!99176 lt!99172))))

(assert (=> b!200549 (= lt!99176 (+!365 lt!99168 lt!99178))))

(assert (=> b!200549 (= lt!99174 (+!365 (+!365 lt!99183 lt!99178) lt!99172))))

(assert (=> b!200549 (= lt!99172 (tuple2!3733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200549 (= lt!99178 (tuple2!3733 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20336 res!95584) b!200539))

(assert (= (and b!200539 res!95583) b!200538))

(assert (= (and b!200538 res!95581) b!200547))

(assert (= (and b!200547 res!95579) b!200544))

(assert (= (and b!200544 res!95580) b!200542))

(assert (= (and b!200542 res!95578) b!200541))

(assert (= (and b!200541 res!95577) b!200548))

(assert (= (and b!200548 (not res!95576)) b!200549))

(assert (= (and b!200549 (not res!95582)) b!200545))

(assert (= (and b!200540 condMapEmpty!8345) mapIsEmpty!8345))

(assert (= (and b!200540 (not condMapEmpty!8345)) mapNonEmpty!8345))

(get-info :version)

(assert (= (and mapNonEmpty!8345 ((_ is ValueCellFull!2082) mapValue!8345)) b!200543))

(assert (= (and b!200540 ((_ is ValueCellFull!2082) mapDefault!8345)) b!200546))

(assert (= start!20336 b!200540))

(declare-fun m!227063 () Bool)

(assert (=> b!200538 m!227063))

(declare-fun m!227065 () Bool)

(assert (=> b!200545 m!227065))

(declare-fun m!227067 () Bool)

(assert (=> b!200545 m!227067))

(declare-fun m!227069 () Bool)

(assert (=> b!200545 m!227069))

(declare-fun m!227071 () Bool)

(assert (=> b!200542 m!227071))

(declare-fun m!227073 () Bool)

(assert (=> start!20336 m!227073))

(declare-fun m!227075 () Bool)

(assert (=> start!20336 m!227075))

(declare-fun m!227077 () Bool)

(assert (=> start!20336 m!227077))

(declare-fun m!227079 () Bool)

(assert (=> b!200547 m!227079))

(declare-fun m!227081 () Bool)

(assert (=> b!200548 m!227081))

(declare-fun m!227083 () Bool)

(assert (=> b!200548 m!227083))

(declare-fun m!227085 () Bool)

(assert (=> b!200548 m!227085))

(declare-fun m!227087 () Bool)

(assert (=> b!200548 m!227087))

(declare-fun m!227089 () Bool)

(assert (=> b!200548 m!227089))

(declare-fun m!227091 () Bool)

(assert (=> b!200548 m!227091))

(declare-fun m!227093 () Bool)

(assert (=> b!200548 m!227093))

(declare-fun m!227095 () Bool)

(assert (=> b!200549 m!227095))

(declare-fun m!227097 () Bool)

(assert (=> b!200549 m!227097))

(declare-fun m!227099 () Bool)

(assert (=> b!200549 m!227099))

(declare-fun m!227101 () Bool)

(assert (=> b!200549 m!227101))

(assert (=> b!200549 m!227097))

(declare-fun m!227103 () Bool)

(assert (=> b!200549 m!227103))

(declare-fun m!227105 () Bool)

(assert (=> b!200549 m!227105))

(declare-fun m!227107 () Bool)

(assert (=> b!200549 m!227107))

(declare-fun m!227109 () Bool)

(assert (=> b!200549 m!227109))

(declare-fun m!227111 () Bool)

(assert (=> mapNonEmpty!8345 m!227111))

(declare-fun m!227113 () Bool)

(assert (=> b!200541 m!227113))

(check-sat (not b!200545) (not b!200549) (not mapNonEmpty!8345) (not b!200542) (not b_next!4995) (not b!200547) (not b!200538) b_and!11741 tp_is_empty!4851 (not b!200548) (not start!20336))
(check-sat b_and!11741 (not b_next!4995))
