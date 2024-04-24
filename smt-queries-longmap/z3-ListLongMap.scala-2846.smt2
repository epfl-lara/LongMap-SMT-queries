; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41048 () Bool)

(assert start!41048)

(declare-fun b_free!10975 () Bool)

(declare-fun b_next!10975 () Bool)

(assert (=> start!41048 (= b_free!10975 (not b_next!10975))))

(declare-fun tp!38754 () Bool)

(declare-fun b_and!19167 () Bool)

(assert (=> start!41048 (= tp!38754 b_and!19167)))

(declare-fun b!457818 () Bool)

(declare-fun e!267332 () Bool)

(declare-fun e!267338 () Bool)

(assert (=> b!457818 (= e!267332 (not e!267338))))

(declare-fun res!273473 () Bool)

(assert (=> b!457818 (=> res!273473 e!267338)))

(declare-datatypes ((array!28418 0))(
  ( (array!28419 (arr!13651 (Array (_ BitVec 32) (_ BitVec 64))) (size!14003 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28418)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457818 (= res!273473 (not (validKeyInArray!0 (select (arr!13651 _keys!709) from!863))))))

(declare-datatypes ((V!17523 0))(
  ( (V!17524 (val!6201 Int)) )
))
(declare-datatypes ((tuple2!8088 0))(
  ( (tuple2!8089 (_1!4055 (_ BitVec 64)) (_2!4055 V!17523)) )
))
(declare-datatypes ((List!8160 0))(
  ( (Nil!8157) (Cons!8156 (h!9012 tuple2!8088) (t!14006 List!8160)) )
))
(declare-datatypes ((ListLongMap!7003 0))(
  ( (ListLongMap!7004 (toList!3517 List!8160)) )
))
(declare-fun lt!207130 () ListLongMap!7003)

(declare-fun lt!207125 () ListLongMap!7003)

(assert (=> b!457818 (= lt!207130 lt!207125)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!207127 () ListLongMap!7003)

(declare-fun v!412 () V!17523)

(declare-fun +!1599 (ListLongMap!7003 tuple2!8088) ListLongMap!7003)

(assert (=> b!457818 (= lt!207125 (+!1599 lt!207127 (tuple2!8089 k0!794 v!412)))))

(declare-fun minValue!515 () V!17523)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5813 0))(
  ( (ValueCellFull!5813 (v!8472 V!17523)) (EmptyCell!5813) )
))
(declare-datatypes ((array!28420 0))(
  ( (array!28421 (arr!13652 (Array (_ BitVec 32) ValueCell!5813)) (size!14004 (_ BitVec 32))) )
))
(declare-fun lt!207126 () array!28420)

(declare-fun zeroValue!515 () V!17523)

(declare-fun lt!207129 () array!28418)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1746 (array!28418 array!28420 (_ BitVec 32) (_ BitVec 32) V!17523 V!17523 (_ BitVec 32) Int) ListLongMap!7003)

(assert (=> b!457818 (= lt!207130 (getCurrentListMapNoExtraKeys!1746 lt!207129 lt!207126 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28420)

(assert (=> b!457818 (= lt!207127 (getCurrentListMapNoExtraKeys!1746 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13301 0))(
  ( (Unit!13302) )
))
(declare-fun lt!207131 () Unit!13301)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!758 (array!28418 array!28420 (_ BitVec 32) (_ BitVec 32) V!17523 V!17523 (_ BitVec 32) (_ BitVec 64) V!17523 (_ BitVec 32) Int) Unit!13301)

(assert (=> b!457818 (= lt!207131 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!758 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457819 () Bool)

(declare-fun res!273472 () Bool)

(declare-fun e!267333 () Bool)

(assert (=> b!457819 (=> (not res!273472) (not e!267333))))

(assert (=> b!457819 (= res!273472 (or (= (select (arr!13651 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13651 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457820 () Bool)

(declare-fun res!273470 () Bool)

(assert (=> b!457820 (=> (not res!273470) (not e!267333))))

(assert (=> b!457820 (= res!273470 (validKeyInArray!0 k0!794))))

(declare-fun b!457821 () Bool)

(assert (=> b!457821 (= e!267338 true)))

(declare-fun lt!207132 () ListLongMap!7003)

(declare-fun get!6730 (ValueCell!5813 V!17523) V!17523)

(declare-fun dynLambda!882 (Int (_ BitVec 64)) V!17523)

(assert (=> b!457821 (= lt!207132 (+!1599 lt!207125 (tuple2!8089 (select (arr!13651 _keys!709) from!863) (get!6730 (select (arr!13652 _values!549) from!863) (dynLambda!882 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457822 () Bool)

(declare-fun res!273474 () Bool)

(assert (=> b!457822 (=> (not res!273474) (not e!267333))))

(assert (=> b!457822 (= res!273474 (and (= (size!14004 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14003 _keys!709) (size!14004 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457823 () Bool)

(declare-fun res!273466 () Bool)

(assert (=> b!457823 (=> (not res!273466) (not e!267333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457823 (= res!273466 (validMask!0 mask!1025))))

(declare-fun b!457824 () Bool)

(declare-fun res!273478 () Bool)

(declare-fun e!267334 () Bool)

(assert (=> b!457824 (=> (not res!273478) (not e!267334))))

(assert (=> b!457824 (= res!273478 (bvsle from!863 i!563))))

(declare-fun b!457825 () Bool)

(declare-fun res!273468 () Bool)

(assert (=> b!457825 (=> (not res!273468) (not e!267333))))

(assert (=> b!457825 (= res!273468 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14003 _keys!709))))))

(declare-fun b!457826 () Bool)

(declare-fun res!273476 () Bool)

(assert (=> b!457826 (=> (not res!273476) (not e!267333))))

(declare-fun arrayContainsKey!0 (array!28418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457826 (= res!273476 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457827 () Bool)

(declare-fun e!267339 () Bool)

(declare-fun e!267337 () Bool)

(declare-fun mapRes!20113 () Bool)

(assert (=> b!457827 (= e!267339 (and e!267337 mapRes!20113))))

(declare-fun condMapEmpty!20113 () Bool)

(declare-fun mapDefault!20113 () ValueCell!5813)

(assert (=> b!457827 (= condMapEmpty!20113 (= (arr!13652 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5813)) mapDefault!20113)))))

(declare-fun b!457828 () Bool)

(declare-fun tp_is_empty!12313 () Bool)

(assert (=> b!457828 (= e!267337 tp_is_empty!12313)))

(declare-fun res!273475 () Bool)

(assert (=> start!41048 (=> (not res!273475) (not e!267333))))

(assert (=> start!41048 (= res!273475 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14003 _keys!709))))))

(assert (=> start!41048 e!267333))

(assert (=> start!41048 tp_is_empty!12313))

(assert (=> start!41048 tp!38754))

(assert (=> start!41048 true))

(declare-fun array_inv!9960 (array!28420) Bool)

(assert (=> start!41048 (and (array_inv!9960 _values!549) e!267339)))

(declare-fun array_inv!9961 (array!28418) Bool)

(assert (=> start!41048 (array_inv!9961 _keys!709)))

(declare-fun mapIsEmpty!20113 () Bool)

(assert (=> mapIsEmpty!20113 mapRes!20113))

(declare-fun b!457829 () Bool)

(assert (=> b!457829 (= e!267334 e!267332)))

(declare-fun res!273479 () Bool)

(assert (=> b!457829 (=> (not res!273479) (not e!267332))))

(assert (=> b!457829 (= res!273479 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!457829 (= lt!207132 (getCurrentListMapNoExtraKeys!1746 lt!207129 lt!207126 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457829 (= lt!207126 (array!28421 (store (arr!13652 _values!549) i!563 (ValueCellFull!5813 v!412)) (size!14004 _values!549)))))

(declare-fun lt!207128 () ListLongMap!7003)

(assert (=> b!457829 (= lt!207128 (getCurrentListMapNoExtraKeys!1746 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457830 () Bool)

(assert (=> b!457830 (= e!267333 e!267334)))

(declare-fun res!273477 () Bool)

(assert (=> b!457830 (=> (not res!273477) (not e!267334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28418 (_ BitVec 32)) Bool)

(assert (=> b!457830 (= res!273477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207129 mask!1025))))

(assert (=> b!457830 (= lt!207129 (array!28419 (store (arr!13651 _keys!709) i!563 k0!794) (size!14003 _keys!709)))))

(declare-fun mapNonEmpty!20113 () Bool)

(declare-fun tp!38755 () Bool)

(declare-fun e!267336 () Bool)

(assert (=> mapNonEmpty!20113 (= mapRes!20113 (and tp!38755 e!267336))))

(declare-fun mapRest!20113 () (Array (_ BitVec 32) ValueCell!5813))

(declare-fun mapKey!20113 () (_ BitVec 32))

(declare-fun mapValue!20113 () ValueCell!5813)

(assert (=> mapNonEmpty!20113 (= (arr!13652 _values!549) (store mapRest!20113 mapKey!20113 mapValue!20113))))

(declare-fun b!457831 () Bool)

(declare-fun res!273467 () Bool)

(assert (=> b!457831 (=> (not res!273467) (not e!267333))))

(declare-datatypes ((List!8161 0))(
  ( (Nil!8158) (Cons!8157 (h!9013 (_ BitVec 64)) (t!14007 List!8161)) )
))
(declare-fun arrayNoDuplicates!0 (array!28418 (_ BitVec 32) List!8161) Bool)

(assert (=> b!457831 (= res!273467 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8158))))

(declare-fun b!457832 () Bool)

(declare-fun res!273471 () Bool)

(assert (=> b!457832 (=> (not res!273471) (not e!267333))))

(assert (=> b!457832 (= res!273471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457833 () Bool)

(declare-fun res!273469 () Bool)

(assert (=> b!457833 (=> (not res!273469) (not e!267334))))

(assert (=> b!457833 (= res!273469 (arrayNoDuplicates!0 lt!207129 #b00000000000000000000000000000000 Nil!8158))))

(declare-fun b!457834 () Bool)

(assert (=> b!457834 (= e!267336 tp_is_empty!12313)))

(assert (= (and start!41048 res!273475) b!457823))

(assert (= (and b!457823 res!273466) b!457822))

(assert (= (and b!457822 res!273474) b!457832))

(assert (= (and b!457832 res!273471) b!457831))

(assert (= (and b!457831 res!273467) b!457825))

(assert (= (and b!457825 res!273468) b!457820))

(assert (= (and b!457820 res!273470) b!457819))

(assert (= (and b!457819 res!273472) b!457826))

(assert (= (and b!457826 res!273476) b!457830))

(assert (= (and b!457830 res!273477) b!457833))

(assert (= (and b!457833 res!273469) b!457824))

(assert (= (and b!457824 res!273478) b!457829))

(assert (= (and b!457829 res!273479) b!457818))

(assert (= (and b!457818 (not res!273473)) b!457821))

(assert (= (and b!457827 condMapEmpty!20113) mapIsEmpty!20113))

(assert (= (and b!457827 (not condMapEmpty!20113)) mapNonEmpty!20113))

(get-info :version)

(assert (= (and mapNonEmpty!20113 ((_ is ValueCellFull!5813) mapValue!20113)) b!457834))

(assert (= (and b!457827 ((_ is ValueCellFull!5813) mapDefault!20113)) b!457828))

(assert (= start!41048 b!457827))

(declare-fun b_lambda!9755 () Bool)

(assert (=> (not b_lambda!9755) (not b!457821)))

(declare-fun t!14005 () Bool)

(declare-fun tb!3803 () Bool)

(assert (=> (and start!41048 (= defaultEntry!557 defaultEntry!557) t!14005) tb!3803))

(declare-fun result!7155 () Bool)

(assert (=> tb!3803 (= result!7155 tp_is_empty!12313)))

(assert (=> b!457821 t!14005))

(declare-fun b_and!19169 () Bool)

(assert (= b_and!19167 (and (=> t!14005 result!7155) b_and!19169)))

(declare-fun m!441393 () Bool)

(assert (=> b!457831 m!441393))

(declare-fun m!441395 () Bool)

(assert (=> b!457829 m!441395))

(declare-fun m!441397 () Bool)

(assert (=> b!457829 m!441397))

(declare-fun m!441399 () Bool)

(assert (=> b!457829 m!441399))

(declare-fun m!441401 () Bool)

(assert (=> mapNonEmpty!20113 m!441401))

(declare-fun m!441403 () Bool)

(assert (=> b!457818 m!441403))

(declare-fun m!441405 () Bool)

(assert (=> b!457818 m!441405))

(declare-fun m!441407 () Bool)

(assert (=> b!457818 m!441407))

(declare-fun m!441409 () Bool)

(assert (=> b!457818 m!441409))

(assert (=> b!457818 m!441403))

(declare-fun m!441411 () Bool)

(assert (=> b!457818 m!441411))

(declare-fun m!441413 () Bool)

(assert (=> b!457818 m!441413))

(assert (=> b!457821 m!441403))

(declare-fun m!441415 () Bool)

(assert (=> b!457821 m!441415))

(declare-fun m!441417 () Bool)

(assert (=> b!457821 m!441417))

(declare-fun m!441419 () Bool)

(assert (=> b!457821 m!441419))

(assert (=> b!457821 m!441419))

(assert (=> b!457821 m!441415))

(declare-fun m!441421 () Bool)

(assert (=> b!457821 m!441421))

(declare-fun m!441423 () Bool)

(assert (=> b!457820 m!441423))

(declare-fun m!441425 () Bool)

(assert (=> b!457826 m!441425))

(declare-fun m!441427 () Bool)

(assert (=> b!457830 m!441427))

(declare-fun m!441429 () Bool)

(assert (=> b!457830 m!441429))

(declare-fun m!441431 () Bool)

(assert (=> b!457832 m!441431))

(declare-fun m!441433 () Bool)

(assert (=> b!457833 m!441433))

(declare-fun m!441435 () Bool)

(assert (=> b!457823 m!441435))

(declare-fun m!441437 () Bool)

(assert (=> start!41048 m!441437))

(declare-fun m!441439 () Bool)

(assert (=> start!41048 m!441439))

(declare-fun m!441441 () Bool)

(assert (=> b!457819 m!441441))

(check-sat (not b_lambda!9755) (not b!457818) (not b!457832) (not b!457829) (not mapNonEmpty!20113) b_and!19169 (not b!457826) (not b!457820) (not b_next!10975) (not b!457821) (not b!457830) (not start!41048) (not b!457833) (not b!457831) (not b!457823) tp_is_empty!12313)
(check-sat b_and!19169 (not b_next!10975))
