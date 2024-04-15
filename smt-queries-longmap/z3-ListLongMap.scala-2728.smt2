; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40172 () Bool)

(assert start!40172)

(declare-fun b_free!10453 () Bool)

(declare-fun b_next!10453 () Bool)

(assert (=> start!40172 (= b_free!10453 (not b_next!10453))))

(declare-fun tp!36887 () Bool)

(declare-fun b_and!18395 () Bool)

(assert (=> start!40172 (= tp!36887 b_and!18395)))

(declare-fun b!439957 () Bool)

(declare-fun res!260204 () Bool)

(declare-fun e!259224 () Bool)

(assert (=> b!439957 (=> (not res!260204) (not e!259224))))

(declare-datatypes ((array!27027 0))(
  ( (array!27028 (arr!12963 (Array (_ BitVec 32) (_ BitVec 64))) (size!13316 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27027)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439957 (= res!260204 (or (= (select (arr!12963 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12963 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439958 () Bool)

(declare-fun e!259230 () Bool)

(declare-fun tp_is_empty!11605 () Bool)

(assert (=> b!439958 (= e!259230 tp_is_empty!11605)))

(declare-fun b!439959 () Bool)

(declare-fun e!259226 () Bool)

(declare-fun e!259229 () Bool)

(declare-fun mapRes!19029 () Bool)

(assert (=> b!439959 (= e!259226 (and e!259229 mapRes!19029))))

(declare-fun condMapEmpty!19029 () Bool)

(declare-datatypes ((V!16579 0))(
  ( (V!16580 (val!5847 Int)) )
))
(declare-datatypes ((ValueCell!5459 0))(
  ( (ValueCellFull!5459 (v!8088 V!16579)) (EmptyCell!5459) )
))
(declare-datatypes ((array!27029 0))(
  ( (array!27030 (arr!12964 (Array (_ BitVec 32) ValueCell!5459)) (size!13317 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27029)

(declare-fun mapDefault!19029 () ValueCell!5459)

(assert (=> b!439959 (= condMapEmpty!19029 (= (arr!12964 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5459)) mapDefault!19029)))))

(declare-fun b!439960 () Bool)

(declare-fun e!259225 () Bool)

(assert (=> b!439960 (= e!259225 (not true))))

(declare-fun minValue!515 () V!16579)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!202282 () array!27027)

(declare-fun zeroValue!515 () V!16579)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!202283 () array!27029)

(declare-fun v!412 () V!16579)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7784 0))(
  ( (tuple2!7785 (_1!3903 (_ BitVec 64)) (_2!3903 V!16579)) )
))
(declare-datatypes ((List!7771 0))(
  ( (Nil!7768) (Cons!7767 (h!8623 tuple2!7784) (t!13518 List!7771)) )
))
(declare-datatypes ((ListLongMap!6687 0))(
  ( (ListLongMap!6688 (toList!3359 List!7771)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1558 (array!27027 array!27029 (_ BitVec 32) (_ BitVec 32) V!16579 V!16579 (_ BitVec 32) Int) ListLongMap!6687)

(declare-fun +!1520 (ListLongMap!6687 tuple2!7784) ListLongMap!6687)

(assert (=> b!439960 (= (getCurrentListMapNoExtraKeys!1558 lt!202282 lt!202283 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1520 (getCurrentListMapNoExtraKeys!1558 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7785 k0!794 v!412)))))

(declare-datatypes ((Unit!13057 0))(
  ( (Unit!13058) )
))
(declare-fun lt!202284 () Unit!13057)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!658 (array!27027 array!27029 (_ BitVec 32) (_ BitVec 32) V!16579 V!16579 (_ BitVec 32) (_ BitVec 64) V!16579 (_ BitVec 32) Int) Unit!13057)

(assert (=> b!439960 (= lt!202284 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!658 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!260207 () Bool)

(assert (=> start!40172 (=> (not res!260207) (not e!259224))))

(assert (=> start!40172 (= res!260207 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13316 _keys!709))))))

(assert (=> start!40172 e!259224))

(assert (=> start!40172 tp_is_empty!11605))

(assert (=> start!40172 tp!36887))

(assert (=> start!40172 true))

(declare-fun array_inv!9460 (array!27029) Bool)

(assert (=> start!40172 (and (array_inv!9460 _values!549) e!259226)))

(declare-fun array_inv!9461 (array!27027) Bool)

(assert (=> start!40172 (array_inv!9461 _keys!709)))

(declare-fun b!439961 () Bool)

(declare-fun res!260201 () Bool)

(assert (=> b!439961 (=> (not res!260201) (not e!259224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439961 (= res!260201 (validKeyInArray!0 k0!794))))

(declare-fun b!439962 () Bool)

(declare-fun res!260202 () Bool)

(declare-fun e!259228 () Bool)

(assert (=> b!439962 (=> (not res!260202) (not e!259228))))

(assert (=> b!439962 (= res!260202 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19029 () Bool)

(declare-fun tp!36888 () Bool)

(assert (=> mapNonEmpty!19029 (= mapRes!19029 (and tp!36888 e!259230))))

(declare-fun mapRest!19029 () (Array (_ BitVec 32) ValueCell!5459))

(declare-fun mapValue!19029 () ValueCell!5459)

(declare-fun mapKey!19029 () (_ BitVec 32))

(assert (=> mapNonEmpty!19029 (= (arr!12964 _values!549) (store mapRest!19029 mapKey!19029 mapValue!19029))))

(declare-fun b!439963 () Bool)

(declare-fun res!260208 () Bool)

(assert (=> b!439963 (=> (not res!260208) (not e!259224))))

(assert (=> b!439963 (= res!260208 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13316 _keys!709))))))

(declare-fun mapIsEmpty!19029 () Bool)

(assert (=> mapIsEmpty!19029 mapRes!19029))

(declare-fun b!439964 () Bool)

(assert (=> b!439964 (= e!259224 e!259228)))

(declare-fun res!260200 () Bool)

(assert (=> b!439964 (=> (not res!260200) (not e!259228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27027 (_ BitVec 32)) Bool)

(assert (=> b!439964 (= res!260200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202282 mask!1025))))

(assert (=> b!439964 (= lt!202282 (array!27028 (store (arr!12963 _keys!709) i!563 k0!794) (size!13316 _keys!709)))))

(declare-fun b!439965 () Bool)

(declare-fun res!260198 () Bool)

(assert (=> b!439965 (=> (not res!260198) (not e!259224))))

(declare-fun arrayContainsKey!0 (array!27027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439965 (= res!260198 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439966 () Bool)

(assert (=> b!439966 (= e!259229 tp_is_empty!11605)))

(declare-fun b!439967 () Bool)

(assert (=> b!439967 (= e!259228 e!259225)))

(declare-fun res!260203 () Bool)

(assert (=> b!439967 (=> (not res!260203) (not e!259225))))

(assert (=> b!439967 (= res!260203 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202286 () ListLongMap!6687)

(assert (=> b!439967 (= lt!202286 (getCurrentListMapNoExtraKeys!1558 lt!202282 lt!202283 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439967 (= lt!202283 (array!27030 (store (arr!12964 _values!549) i!563 (ValueCellFull!5459 v!412)) (size!13317 _values!549)))))

(declare-fun lt!202285 () ListLongMap!6687)

(assert (=> b!439967 (= lt!202285 (getCurrentListMapNoExtraKeys!1558 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439968 () Bool)

(declare-fun res!260196 () Bool)

(assert (=> b!439968 (=> (not res!260196) (not e!259224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439968 (= res!260196 (validMask!0 mask!1025))))

(declare-fun b!439969 () Bool)

(declare-fun res!260206 () Bool)

(assert (=> b!439969 (=> (not res!260206) (not e!259228))))

(declare-datatypes ((List!7772 0))(
  ( (Nil!7769) (Cons!7768 (h!8624 (_ BitVec 64)) (t!13519 List!7772)) )
))
(declare-fun arrayNoDuplicates!0 (array!27027 (_ BitVec 32) List!7772) Bool)

(assert (=> b!439969 (= res!260206 (arrayNoDuplicates!0 lt!202282 #b00000000000000000000000000000000 Nil!7769))))

(declare-fun b!439970 () Bool)

(declare-fun res!260205 () Bool)

(assert (=> b!439970 (=> (not res!260205) (not e!259224))))

(assert (=> b!439970 (= res!260205 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7769))))

(declare-fun b!439971 () Bool)

(declare-fun res!260199 () Bool)

(assert (=> b!439971 (=> (not res!260199) (not e!259224))))

(assert (=> b!439971 (= res!260199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439972 () Bool)

(declare-fun res!260197 () Bool)

(assert (=> b!439972 (=> (not res!260197) (not e!259224))))

(assert (=> b!439972 (= res!260197 (and (= (size!13317 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13316 _keys!709) (size!13317 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40172 res!260207) b!439968))

(assert (= (and b!439968 res!260196) b!439972))

(assert (= (and b!439972 res!260197) b!439971))

(assert (= (and b!439971 res!260199) b!439970))

(assert (= (and b!439970 res!260205) b!439963))

(assert (= (and b!439963 res!260208) b!439961))

(assert (= (and b!439961 res!260201) b!439957))

(assert (= (and b!439957 res!260204) b!439965))

(assert (= (and b!439965 res!260198) b!439964))

(assert (= (and b!439964 res!260200) b!439969))

(assert (= (and b!439969 res!260206) b!439962))

(assert (= (and b!439962 res!260202) b!439967))

(assert (= (and b!439967 res!260203) b!439960))

(assert (= (and b!439959 condMapEmpty!19029) mapIsEmpty!19029))

(assert (= (and b!439959 (not condMapEmpty!19029)) mapNonEmpty!19029))

(get-info :version)

(assert (= (and mapNonEmpty!19029 ((_ is ValueCellFull!5459) mapValue!19029)) b!439958))

(assert (= (and b!439959 ((_ is ValueCellFull!5459) mapDefault!19029)) b!439966))

(assert (= start!40172 b!439959))

(declare-fun m!426585 () Bool)

(assert (=> b!439969 m!426585))

(declare-fun m!426587 () Bool)

(assert (=> start!40172 m!426587))

(declare-fun m!426589 () Bool)

(assert (=> start!40172 m!426589))

(declare-fun m!426591 () Bool)

(assert (=> b!439957 m!426591))

(declare-fun m!426593 () Bool)

(assert (=> b!439967 m!426593))

(declare-fun m!426595 () Bool)

(assert (=> b!439967 m!426595))

(declare-fun m!426597 () Bool)

(assert (=> b!439967 m!426597))

(declare-fun m!426599 () Bool)

(assert (=> b!439965 m!426599))

(declare-fun m!426601 () Bool)

(assert (=> mapNonEmpty!19029 m!426601))

(declare-fun m!426603 () Bool)

(assert (=> b!439971 m!426603))

(declare-fun m!426605 () Bool)

(assert (=> b!439964 m!426605))

(declare-fun m!426607 () Bool)

(assert (=> b!439964 m!426607))

(declare-fun m!426609 () Bool)

(assert (=> b!439960 m!426609))

(declare-fun m!426611 () Bool)

(assert (=> b!439960 m!426611))

(assert (=> b!439960 m!426611))

(declare-fun m!426613 () Bool)

(assert (=> b!439960 m!426613))

(declare-fun m!426615 () Bool)

(assert (=> b!439960 m!426615))

(declare-fun m!426617 () Bool)

(assert (=> b!439961 m!426617))

(declare-fun m!426619 () Bool)

(assert (=> b!439970 m!426619))

(declare-fun m!426621 () Bool)

(assert (=> b!439968 m!426621))

(check-sat b_and!18395 (not b!439964) (not b!439969) (not start!40172) (not b!439965) tp_is_empty!11605 (not b_next!10453) (not b!439960) (not mapNonEmpty!19029) (not b!439971) (not b!439970) (not b!439967) (not b!439968) (not b!439961))
(check-sat b_and!18395 (not b_next!10453))
