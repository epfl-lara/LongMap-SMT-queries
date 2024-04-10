; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20654 () Bool)

(assert start!20654)

(declare-fun b_free!5313 () Bool)

(declare-fun b_next!5313 () Bool)

(assert (=> start!20654 (= b_free!5313 (not b_next!5313))))

(declare-fun tp!18971 () Bool)

(declare-fun b_and!12059 () Bool)

(assert (=> start!20654 (= tp!18971 b_and!12059)))

(declare-fun b!206280 () Bool)

(declare-fun e!134836 () Bool)

(declare-fun tp_is_empty!5169 () Bool)

(assert (=> b!206280 (= e!134836 tp_is_empty!5169)))

(declare-fun b!206281 () Bool)

(declare-fun e!134839 () Bool)

(assert (=> b!206281 (= e!134839 true)))

(declare-datatypes ((V!6539 0))(
  ( (V!6540 (val!2629 Int)) )
))
(declare-datatypes ((tuple2!3994 0))(
  ( (tuple2!3995 (_1!2008 (_ BitVec 64)) (_2!2008 V!6539)) )
))
(declare-datatypes ((List!2886 0))(
  ( (Nil!2883) (Cons!2882 (h!3524 tuple2!3994) (t!7817 List!2886)) )
))
(declare-datatypes ((ListLongMap!2907 0))(
  ( (ListLongMap!2908 (toList!1469 List!2886)) )
))
(declare-fun lt!105416 () ListLongMap!2907)

(declare-fun lt!105419 () ListLongMap!2907)

(declare-fun lt!105413 () tuple2!3994)

(declare-fun +!496 (ListLongMap!2907 tuple2!3994) ListLongMap!2907)

(assert (=> b!206281 (= lt!105416 (+!496 lt!105419 lt!105413))))

(declare-datatypes ((Unit!6280 0))(
  ( (Unit!6281) )
))
(declare-fun lt!105415 () Unit!6280)

(declare-fun minValue!615 () V!6539)

(declare-fun lt!105417 () ListLongMap!2907)

(declare-fun v!520 () V!6539)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!194 (ListLongMap!2907 (_ BitVec 64) V!6539 (_ BitVec 64) V!6539) Unit!6280)

(assert (=> b!206281 (= lt!105415 (addCommutativeForDiffKeys!194 lt!105417 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8822 () Bool)

(declare-fun mapRes!8822 () Bool)

(declare-fun tp!18970 () Bool)

(declare-fun e!134834 () Bool)

(assert (=> mapNonEmpty!8822 (= mapRes!8822 (and tp!18970 e!134834))))

(declare-fun mapKey!8822 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2241 0))(
  ( (ValueCellFull!2241 (v!4599 V!6539)) (EmptyCell!2241) )
))
(declare-fun mapRest!8822 () (Array (_ BitVec 32) ValueCell!2241))

(declare-datatypes ((array!9549 0))(
  ( (array!9550 (arr!4525 (Array (_ BitVec 32) ValueCell!2241)) (size!4850 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9549)

(declare-fun mapValue!8822 () ValueCell!2241)

(assert (=> mapNonEmpty!8822 (= (arr!4525 _values!649) (store mapRest!8822 mapKey!8822 mapValue!8822))))

(declare-fun b!206282 () Bool)

(declare-fun e!134838 () Bool)

(declare-fun e!134837 () Bool)

(assert (=> b!206282 (= e!134838 (not e!134837))))

(declare-fun res!99894 () Bool)

(assert (=> b!206282 (=> res!99894 e!134837)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206282 (= res!99894 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6539)

(declare-datatypes ((array!9551 0))(
  ( (array!9552 (arr!4526 (Array (_ BitVec 32) (_ BitVec 64))) (size!4851 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9551)

(declare-fun defaultEntry!657 () Int)

(declare-fun lt!105414 () ListLongMap!2907)

(declare-fun getCurrentListMap!1036 (array!9551 array!9549 (_ BitVec 32) (_ BitVec 32) V!6539 V!6539 (_ BitVec 32) Int) ListLongMap!2907)

(assert (=> b!206282 (= lt!105414 (getCurrentListMap!1036 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105421 () array!9549)

(declare-fun lt!105418 () ListLongMap!2907)

(assert (=> b!206282 (= lt!105418 (getCurrentListMap!1036 _keys!825 lt!105421 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105420 () ListLongMap!2907)

(declare-fun lt!105422 () ListLongMap!2907)

(assert (=> b!206282 (and (= lt!105420 lt!105422) (= lt!105422 lt!105420))))

(assert (=> b!206282 (= lt!105422 (+!496 lt!105417 lt!105413))))

(assert (=> b!206282 (= lt!105413 (tuple2!3995 k0!843 v!520))))

(declare-fun lt!105412 () Unit!6280)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!149 (array!9551 array!9549 (_ BitVec 32) (_ BitVec 32) V!6539 V!6539 (_ BitVec 32) (_ BitVec 64) V!6539 (_ BitVec 32) Int) Unit!6280)

(assert (=> b!206282 (= lt!105412 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!149 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!410 (array!9551 array!9549 (_ BitVec 32) (_ BitVec 32) V!6539 V!6539 (_ BitVec 32) Int) ListLongMap!2907)

(assert (=> b!206282 (= lt!105420 (getCurrentListMapNoExtraKeys!410 _keys!825 lt!105421 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206282 (= lt!105421 (array!9550 (store (arr!4525 _values!649) i!601 (ValueCellFull!2241 v!520)) (size!4850 _values!649)))))

(assert (=> b!206282 (= lt!105417 (getCurrentListMapNoExtraKeys!410 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206284 () Bool)

(assert (=> b!206284 (= e!134834 tp_is_empty!5169)))

(declare-fun b!206285 () Bool)

(declare-fun e!134840 () Bool)

(assert (=> b!206285 (= e!134840 (and e!134836 mapRes!8822))))

(declare-fun condMapEmpty!8822 () Bool)

(declare-fun mapDefault!8822 () ValueCell!2241)

(assert (=> b!206285 (= condMapEmpty!8822 (= (arr!4525 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2241)) mapDefault!8822)))))

(declare-fun b!206286 () Bool)

(declare-fun res!99887 () Bool)

(assert (=> b!206286 (=> (not res!99887) (not e!134838))))

(assert (=> b!206286 (= res!99887 (= (select (arr!4526 _keys!825) i!601) k0!843))))

(declare-fun b!206287 () Bool)

(assert (=> b!206287 (= e!134837 e!134839)))

(declare-fun res!99888 () Bool)

(assert (=> b!206287 (=> res!99888 e!134839)))

(assert (=> b!206287 (= res!99888 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!206287 (= lt!105414 lt!105419)))

(declare-fun lt!105423 () tuple2!3994)

(assert (=> b!206287 (= lt!105419 (+!496 lt!105417 lt!105423))))

(assert (=> b!206287 (= lt!105418 lt!105416)))

(assert (=> b!206287 (= lt!105416 (+!496 lt!105422 lt!105423))))

(assert (=> b!206287 (= lt!105418 (+!496 lt!105420 lt!105423))))

(assert (=> b!206287 (= lt!105423 (tuple2!3995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206288 () Bool)

(declare-fun res!99892 () Bool)

(assert (=> b!206288 (=> (not res!99892) (not e!134838))))

(declare-datatypes ((List!2887 0))(
  ( (Nil!2884) (Cons!2883 (h!3525 (_ BitVec 64)) (t!7818 List!2887)) )
))
(declare-fun arrayNoDuplicates!0 (array!9551 (_ BitVec 32) List!2887) Bool)

(assert (=> b!206288 (= res!99892 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2884))))

(declare-fun b!206289 () Bool)

(declare-fun res!99890 () Bool)

(assert (=> b!206289 (=> (not res!99890) (not e!134838))))

(assert (=> b!206289 (= res!99890 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4851 _keys!825))))))

(declare-fun b!206290 () Bool)

(declare-fun res!99891 () Bool)

(assert (=> b!206290 (=> (not res!99891) (not e!134838))))

(assert (=> b!206290 (= res!99891 (and (= (size!4850 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4851 _keys!825) (size!4850 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206291 () Bool)

(declare-fun res!99889 () Bool)

(assert (=> b!206291 (=> (not res!99889) (not e!134838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9551 (_ BitVec 32)) Bool)

(assert (=> b!206291 (= res!99889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8822 () Bool)

(assert (=> mapIsEmpty!8822 mapRes!8822))

(declare-fun b!206283 () Bool)

(declare-fun res!99895 () Bool)

(assert (=> b!206283 (=> (not res!99895) (not e!134838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206283 (= res!99895 (validKeyInArray!0 k0!843))))

(declare-fun res!99893 () Bool)

(assert (=> start!20654 (=> (not res!99893) (not e!134838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20654 (= res!99893 (validMask!0 mask!1149))))

(assert (=> start!20654 e!134838))

(declare-fun array_inv!2993 (array!9549) Bool)

(assert (=> start!20654 (and (array_inv!2993 _values!649) e!134840)))

(assert (=> start!20654 true))

(assert (=> start!20654 tp_is_empty!5169))

(declare-fun array_inv!2994 (array!9551) Bool)

(assert (=> start!20654 (array_inv!2994 _keys!825)))

(assert (=> start!20654 tp!18971))

(assert (= (and start!20654 res!99893) b!206290))

(assert (= (and b!206290 res!99891) b!206291))

(assert (= (and b!206291 res!99889) b!206288))

(assert (= (and b!206288 res!99892) b!206289))

(assert (= (and b!206289 res!99890) b!206283))

(assert (= (and b!206283 res!99895) b!206286))

(assert (= (and b!206286 res!99887) b!206282))

(assert (= (and b!206282 (not res!99894)) b!206287))

(assert (= (and b!206287 (not res!99888)) b!206281))

(assert (= (and b!206285 condMapEmpty!8822) mapIsEmpty!8822))

(assert (= (and b!206285 (not condMapEmpty!8822)) mapNonEmpty!8822))

(get-info :version)

(assert (= (and mapNonEmpty!8822 ((_ is ValueCellFull!2241) mapValue!8822)) b!206284))

(assert (= (and b!206285 ((_ is ValueCellFull!2241) mapDefault!8822)) b!206280))

(assert (= start!20654 b!206285))

(declare-fun m!233999 () Bool)

(assert (=> b!206283 m!233999))

(declare-fun m!234001 () Bool)

(assert (=> b!206282 m!234001))

(declare-fun m!234003 () Bool)

(assert (=> b!206282 m!234003))

(declare-fun m!234005 () Bool)

(assert (=> b!206282 m!234005))

(declare-fun m!234007 () Bool)

(assert (=> b!206282 m!234007))

(declare-fun m!234009 () Bool)

(assert (=> b!206282 m!234009))

(declare-fun m!234011 () Bool)

(assert (=> b!206282 m!234011))

(declare-fun m!234013 () Bool)

(assert (=> b!206282 m!234013))

(declare-fun m!234015 () Bool)

(assert (=> b!206281 m!234015))

(declare-fun m!234017 () Bool)

(assert (=> b!206281 m!234017))

(declare-fun m!234019 () Bool)

(assert (=> mapNonEmpty!8822 m!234019))

(declare-fun m!234021 () Bool)

(assert (=> b!206288 m!234021))

(declare-fun m!234023 () Bool)

(assert (=> b!206287 m!234023))

(declare-fun m!234025 () Bool)

(assert (=> b!206287 m!234025))

(declare-fun m!234027 () Bool)

(assert (=> b!206287 m!234027))

(declare-fun m!234029 () Bool)

(assert (=> b!206286 m!234029))

(declare-fun m!234031 () Bool)

(assert (=> b!206291 m!234031))

(declare-fun m!234033 () Bool)

(assert (=> start!20654 m!234033))

(declare-fun m!234035 () Bool)

(assert (=> start!20654 m!234035))

(declare-fun m!234037 () Bool)

(assert (=> start!20654 m!234037))

(check-sat (not mapNonEmpty!8822) (not b!206283) (not b!206281) (not b_next!5313) (not b!206287) (not start!20654) (not b!206288) (not b!206291) tp_is_empty!5169 b_and!12059 (not b!206282))
(check-sat b_and!12059 (not b_next!5313))
