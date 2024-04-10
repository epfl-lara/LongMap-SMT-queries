; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40794 () Bool)

(assert start!40794)

(declare-fun b_free!10783 () Bool)

(declare-fun b_next!10783 () Bool)

(assert (=> start!40794 (= b_free!10783 (not b_next!10783))))

(declare-fun tp!38171 () Bool)

(declare-fun b_and!18853 () Bool)

(assert (=> start!40794 (= tp!38171 b_and!18853)))

(declare-fun b!452471 () Bool)

(declare-datatypes ((V!17267 0))(
  ( (V!17268 (val!6105 Int)) )
))
(declare-datatypes ((tuple2!8036 0))(
  ( (tuple2!8037 (_1!4029 (_ BitVec 64)) (_2!4029 V!17267)) )
))
(declare-datatypes ((List!8094 0))(
  ( (Nil!8091) (Cons!8090 (h!8946 tuple2!8036) (t!13900 List!8094)) )
))
(declare-datatypes ((ListLongMap!6949 0))(
  ( (ListLongMap!6950 (toList!3490 List!8094)) )
))
(declare-fun call!29963 () ListLongMap!6949)

(declare-fun e!264930 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun call!29962 () ListLongMap!6949)

(declare-fun v!412 () V!17267)

(declare-fun +!1567 (ListLongMap!6949 tuple2!8036) ListLongMap!6949)

(assert (=> b!452471 (= e!264930 (= call!29962 (+!1567 call!29963 (tuple2!8037 k!794 v!412))))))

(declare-fun b!452473 () Bool)

(declare-fun res!269506 () Bool)

(declare-fun e!264927 () Bool)

(assert (=> b!452473 (=> (not res!269506) (not e!264927))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28049 0))(
  ( (array!28050 (arr!13469 (Array (_ BitVec 32) (_ BitVec 64))) (size!13821 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28049)

(assert (=> b!452473 (= res!269506 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13821 _keys!709))))))

(declare-fun b!452474 () Bool)

(declare-fun e!264931 () Bool)

(assert (=> b!452474 (= e!264927 e!264931)))

(declare-fun res!269515 () Bool)

(assert (=> b!452474 (=> (not res!269515) (not e!264931))))

(declare-fun lt!205264 () array!28049)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28049 (_ BitVec 32)) Bool)

(assert (=> b!452474 (= res!269515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205264 mask!1025))))

(assert (=> b!452474 (= lt!205264 (array!28050 (store (arr!13469 _keys!709) i!563 k!794) (size!13821 _keys!709)))))

(declare-fun b!452475 () Bool)

(declare-fun res!269513 () Bool)

(assert (=> b!452475 (=> (not res!269513) (not e!264927))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5717 0))(
  ( (ValueCellFull!5717 (v!8364 V!17267)) (EmptyCell!5717) )
))
(declare-datatypes ((array!28051 0))(
  ( (array!28052 (arr!13470 (Array (_ BitVec 32) ValueCell!5717)) (size!13822 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28051)

(assert (=> b!452475 (= res!269513 (and (= (size!13822 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13821 _keys!709) (size!13822 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452476 () Bool)

(declare-fun res!269519 () Bool)

(assert (=> b!452476 (=> (not res!269519) (not e!264931))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!452476 (= res!269519 (bvsle from!863 i!563))))

(declare-fun minValue!515 () V!17267)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17267)

(declare-fun bm!29959 () Bool)

(declare-fun lt!205263 () array!28051)

(declare-fun c!56123 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1674 (array!28049 array!28051 (_ BitVec 32) (_ BitVec 32) V!17267 V!17267 (_ BitVec 32) Int) ListLongMap!6949)

(assert (=> bm!29959 (= call!29962 (getCurrentListMapNoExtraKeys!1674 (ite c!56123 lt!205264 _keys!709) (ite c!56123 lt!205263 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452477 () Bool)

(declare-fun e!264929 () Bool)

(assert (=> b!452477 (= e!264929 (bvslt i!563 (size!13822 _values!549)))))

(declare-fun lt!205256 () V!17267)

(declare-fun lt!205261 () tuple2!8036)

(declare-fun lt!205257 () ListLongMap!6949)

(assert (=> b!452477 (= (+!1567 lt!205257 lt!205261) (+!1567 (+!1567 lt!205257 (tuple2!8037 k!794 lt!205256)) lt!205261))))

(declare-fun lt!205259 () V!17267)

(assert (=> b!452477 (= lt!205261 (tuple2!8037 k!794 lt!205259))))

(declare-datatypes ((Unit!13230 0))(
  ( (Unit!13231) )
))
(declare-fun lt!205265 () Unit!13230)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!79 (ListLongMap!6949 (_ BitVec 64) V!17267 V!17267) Unit!13230)

(assert (=> b!452477 (= lt!205265 (addSameAsAddTwiceSameKeyDiffValues!79 lt!205257 k!794 lt!205256 lt!205259))))

(declare-fun lt!205258 () V!17267)

(declare-fun get!6639 (ValueCell!5717 V!17267) V!17267)

(assert (=> b!452477 (= lt!205256 (get!6639 (select (arr!13470 _values!549) from!863) lt!205258))))

(declare-fun lt!205255 () ListLongMap!6949)

(assert (=> b!452477 (= lt!205255 (+!1567 lt!205257 (tuple2!8037 (select (arr!13469 lt!205264) from!863) lt!205259)))))

(assert (=> b!452477 (= lt!205259 (get!6639 (select (store (arr!13470 _values!549) i!563 (ValueCellFull!5717 v!412)) from!863) lt!205258))))

(declare-fun dynLambda!866 (Int (_ BitVec 64)) V!17267)

(assert (=> b!452477 (= lt!205258 (dynLambda!866 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452477 (= lt!205257 (getCurrentListMapNoExtraKeys!1674 lt!205264 lt!205263 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452478 () Bool)

(declare-fun res!269509 () Bool)

(assert (=> b!452478 (=> (not res!269509) (not e!264931))))

(declare-datatypes ((List!8095 0))(
  ( (Nil!8092) (Cons!8091 (h!8947 (_ BitVec 64)) (t!13901 List!8095)) )
))
(declare-fun arrayNoDuplicates!0 (array!28049 (_ BitVec 32) List!8095) Bool)

(assert (=> b!452478 (= res!269509 (arrayNoDuplicates!0 lt!205264 #b00000000000000000000000000000000 Nil!8092))))

(declare-fun b!452472 () Bool)

(declare-fun res!269514 () Bool)

(assert (=> b!452472 (=> (not res!269514) (not e!264927))))

(assert (=> b!452472 (= res!269514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!269516 () Bool)

(assert (=> start!40794 (=> (not res!269516) (not e!264927))))

(assert (=> start!40794 (= res!269516 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13821 _keys!709))))))

(assert (=> start!40794 e!264927))

(declare-fun tp_is_empty!12121 () Bool)

(assert (=> start!40794 tp_is_empty!12121))

(assert (=> start!40794 tp!38171))

(assert (=> start!40794 true))

(declare-fun e!264926 () Bool)

(declare-fun array_inv!9754 (array!28051) Bool)

(assert (=> start!40794 (and (array_inv!9754 _values!549) e!264926)))

(declare-fun array_inv!9755 (array!28049) Bool)

(assert (=> start!40794 (array_inv!9755 _keys!709)))

(declare-fun b!452479 () Bool)

(declare-fun res!269510 () Bool)

(assert (=> b!452479 (=> (not res!269510) (not e!264927))))

(declare-fun arrayContainsKey!0 (array!28049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452479 (= res!269510 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!452480 () Bool)

(declare-fun e!264925 () Bool)

(assert (=> b!452480 (= e!264931 e!264925)))

(declare-fun res!269508 () Bool)

(assert (=> b!452480 (=> (not res!269508) (not e!264925))))

(assert (=> b!452480 (= res!269508 (= from!863 i!563))))

(assert (=> b!452480 (= lt!205255 (getCurrentListMapNoExtraKeys!1674 lt!205264 lt!205263 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452480 (= lt!205263 (array!28052 (store (arr!13470 _values!549) i!563 (ValueCellFull!5717 v!412)) (size!13822 _values!549)))))

(declare-fun lt!205262 () ListLongMap!6949)

(assert (=> b!452480 (= lt!205262 (getCurrentListMapNoExtraKeys!1674 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19818 () Bool)

(declare-fun mapRes!19818 () Bool)

(declare-fun tp!38172 () Bool)

(declare-fun e!264928 () Bool)

(assert (=> mapNonEmpty!19818 (= mapRes!19818 (and tp!38172 e!264928))))

(declare-fun mapRest!19818 () (Array (_ BitVec 32) ValueCell!5717))

(declare-fun mapKey!19818 () (_ BitVec 32))

(declare-fun mapValue!19818 () ValueCell!5717)

(assert (=> mapNonEmpty!19818 (= (arr!13470 _values!549) (store mapRest!19818 mapKey!19818 mapValue!19818))))

(declare-fun b!452481 () Bool)

(declare-fun res!269507 () Bool)

(assert (=> b!452481 (=> (not res!269507) (not e!264927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452481 (= res!269507 (validKeyInArray!0 k!794))))

(declare-fun bm!29960 () Bool)

(assert (=> bm!29960 (= call!29963 (getCurrentListMapNoExtraKeys!1674 (ite c!56123 _keys!709 lt!205264) (ite c!56123 _values!549 lt!205263) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452482 () Bool)

(assert (=> b!452482 (= e!264925 (not e!264929))))

(declare-fun res!269517 () Bool)

(assert (=> b!452482 (=> res!269517 e!264929)))

(assert (=> b!452482 (= res!269517 (validKeyInArray!0 (select (arr!13469 _keys!709) from!863)))))

(assert (=> b!452482 e!264930))

(assert (=> b!452482 (= c!56123 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!205260 () Unit!13230)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!729 (array!28049 array!28051 (_ BitVec 32) (_ BitVec 32) V!17267 V!17267 (_ BitVec 32) (_ BitVec 64) V!17267 (_ BitVec 32) Int) Unit!13230)

(assert (=> b!452482 (= lt!205260 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!729 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452483 () Bool)

(assert (=> b!452483 (= e!264928 tp_is_empty!12121)))

(declare-fun b!452484 () Bool)

(declare-fun e!264924 () Bool)

(assert (=> b!452484 (= e!264924 tp_is_empty!12121)))

(declare-fun mapIsEmpty!19818 () Bool)

(assert (=> mapIsEmpty!19818 mapRes!19818))

(declare-fun b!452485 () Bool)

(assert (=> b!452485 (= e!264926 (and e!264924 mapRes!19818))))

(declare-fun condMapEmpty!19818 () Bool)

(declare-fun mapDefault!19818 () ValueCell!5717)

