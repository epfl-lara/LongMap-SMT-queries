; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40208 () Bool)

(assert start!40208)

(declare-fun b_free!10489 () Bool)

(declare-fun b_next!10489 () Bool)

(assert (=> start!40208 (= b_free!10489 (not b_next!10489))))

(declare-fun tp!36996 () Bool)

(declare-fun b_and!18431 () Bool)

(assert (=> start!40208 (= tp!36996 b_and!18431)))

(declare-fun b!440821 () Bool)

(declare-fun res!260904 () Bool)

(declare-fun e!259603 () Bool)

(assert (=> b!440821 (=> (not res!260904) (not e!259603))))

(declare-datatypes ((array!27097 0))(
  ( (array!27098 (arr!12998 (Array (_ BitVec 32) (_ BitVec 64))) (size!13351 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27097)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27097 (_ BitVec 32)) Bool)

(assert (=> b!440821 (= res!260904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440822 () Bool)

(declare-fun e!259602 () Bool)

(assert (=> b!440822 (= e!259603 e!259602)))

(declare-fun res!260903 () Bool)

(assert (=> b!440822 (=> (not res!260903) (not e!259602))))

(declare-fun lt!202555 () array!27097)

(assert (=> b!440822 (= res!260903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202555 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440822 (= lt!202555 (array!27098 (store (arr!12998 _keys!709) i!563 k0!794) (size!13351 _keys!709)))))

(declare-fun b!440823 () Bool)

(declare-fun res!260908 () Bool)

(assert (=> b!440823 (=> (not res!260908) (not e!259603))))

(declare-fun arrayContainsKey!0 (array!27097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440823 (= res!260908 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440824 () Bool)

(declare-fun res!260909 () Bool)

(assert (=> b!440824 (=> (not res!260909) (not e!259603))))

(assert (=> b!440824 (= res!260909 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13351 _keys!709))))))

(declare-fun b!440825 () Bool)

(declare-fun e!259604 () Bool)

(declare-fun tp_is_empty!11641 () Bool)

(assert (=> b!440825 (= e!259604 tp_is_empty!11641)))

(declare-fun b!440826 () Bool)

(declare-fun res!260906 () Bool)

(assert (=> b!440826 (=> (not res!260906) (not e!259602))))

(declare-datatypes ((List!7802 0))(
  ( (Nil!7799) (Cons!7798 (h!8654 (_ BitVec 64)) (t!13549 List!7802)) )
))
(declare-fun arrayNoDuplicates!0 (array!27097 (_ BitVec 32) List!7802) Bool)

(assert (=> b!440826 (= res!260906 (arrayNoDuplicates!0 lt!202555 #b00000000000000000000000000000000 Nil!7799))))

(declare-fun mapIsEmpty!19083 () Bool)

(declare-fun mapRes!19083 () Bool)

(assert (=> mapIsEmpty!19083 mapRes!19083))

(declare-fun b!440827 () Bool)

(declare-fun res!260905 () Bool)

(assert (=> b!440827 (=> (not res!260905) (not e!259603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440827 (= res!260905 (validMask!0 mask!1025))))

(declare-fun b!440828 () Bool)

(declare-fun res!260902 () Bool)

(assert (=> b!440828 (=> (not res!260902) (not e!259603))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16627 0))(
  ( (V!16628 (val!5865 Int)) )
))
(declare-datatypes ((ValueCell!5477 0))(
  ( (ValueCellFull!5477 (v!8106 V!16627)) (EmptyCell!5477) )
))
(declare-datatypes ((array!27099 0))(
  ( (array!27100 (arr!12999 (Array (_ BitVec 32) ValueCell!5477)) (size!13352 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27099)

(assert (=> b!440828 (= res!260902 (and (= (size!13352 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13351 _keys!709) (size!13352 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19083 () Bool)

(declare-fun tp!36995 () Bool)

(assert (=> mapNonEmpty!19083 (= mapRes!19083 (and tp!36995 e!259604))))

(declare-fun mapRest!19083 () (Array (_ BitVec 32) ValueCell!5477))

(declare-fun mapKey!19083 () (_ BitVec 32))

(declare-fun mapValue!19083 () ValueCell!5477)

(assert (=> mapNonEmpty!19083 (= (arr!12999 _values!549) (store mapRest!19083 mapKey!19083 mapValue!19083))))

(declare-fun b!440829 () Bool)

(declare-fun res!260900 () Bool)

(assert (=> b!440829 (=> (not res!260900) (not e!259603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440829 (= res!260900 (validKeyInArray!0 k0!794))))

(declare-fun b!440830 () Bool)

(declare-fun res!260898 () Bool)

(assert (=> b!440830 (=> (not res!260898) (not e!259603))))

(assert (=> b!440830 (= res!260898 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7799))))

(declare-fun b!440831 () Bool)

(declare-fun res!260907 () Bool)

(assert (=> b!440831 (=> (not res!260907) (not e!259603))))

(assert (=> b!440831 (= res!260907 (or (= (select (arr!12998 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12998 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440832 () Bool)

(declare-fun e!259606 () Bool)

(assert (=> b!440832 (= e!259606 (not true))))

(declare-fun minValue!515 () V!16627)

(declare-fun zeroValue!515 () V!16627)

(declare-fun lt!202553 () array!27099)

(declare-fun v!412 () V!16627)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7816 0))(
  ( (tuple2!7817 (_1!3919 (_ BitVec 64)) (_2!3919 V!16627)) )
))
(declare-datatypes ((List!7803 0))(
  ( (Nil!7800) (Cons!7799 (h!8655 tuple2!7816) (t!13550 List!7803)) )
))
(declare-datatypes ((ListLongMap!6719 0))(
  ( (ListLongMap!6720 (toList!3375 List!7803)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1574 (array!27097 array!27099 (_ BitVec 32) (_ BitVec 32) V!16627 V!16627 (_ BitVec 32) Int) ListLongMap!6719)

(declare-fun +!1535 (ListLongMap!6719 tuple2!7816) ListLongMap!6719)

(assert (=> b!440832 (= (getCurrentListMapNoExtraKeys!1574 lt!202555 lt!202553 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1535 (getCurrentListMapNoExtraKeys!1574 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7817 k0!794 v!412)))))

(declare-datatypes ((Unit!13087 0))(
  ( (Unit!13088) )
))
(declare-fun lt!202552 () Unit!13087)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!673 (array!27097 array!27099 (_ BitVec 32) (_ BitVec 32) V!16627 V!16627 (_ BitVec 32) (_ BitVec 64) V!16627 (_ BitVec 32) Int) Unit!13087)

(assert (=> b!440832 (= lt!202552 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!673 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440833 () Bool)

(declare-fun res!260899 () Bool)

(assert (=> b!440833 (=> (not res!260899) (not e!259602))))

(assert (=> b!440833 (= res!260899 (bvsle from!863 i!563))))

(declare-fun b!440834 () Bool)

(declare-fun e!259605 () Bool)

(declare-fun e!259607 () Bool)

(assert (=> b!440834 (= e!259605 (and e!259607 mapRes!19083))))

(declare-fun condMapEmpty!19083 () Bool)

(declare-fun mapDefault!19083 () ValueCell!5477)

(assert (=> b!440834 (= condMapEmpty!19083 (= (arr!12999 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5477)) mapDefault!19083)))))

(declare-fun b!440835 () Bool)

(assert (=> b!440835 (= e!259607 tp_is_empty!11641)))

(declare-fun b!440836 () Bool)

(assert (=> b!440836 (= e!259602 e!259606)))

(declare-fun res!260910 () Bool)

(assert (=> b!440836 (=> (not res!260910) (not e!259606))))

(assert (=> b!440836 (= res!260910 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202554 () ListLongMap!6719)

(assert (=> b!440836 (= lt!202554 (getCurrentListMapNoExtraKeys!1574 lt!202555 lt!202553 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440836 (= lt!202553 (array!27100 (store (arr!12999 _values!549) i!563 (ValueCellFull!5477 v!412)) (size!13352 _values!549)))))

(declare-fun lt!202556 () ListLongMap!6719)

(assert (=> b!440836 (= lt!202556 (getCurrentListMapNoExtraKeys!1574 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!260901 () Bool)

(assert (=> start!40208 (=> (not res!260901) (not e!259603))))

(assert (=> start!40208 (= res!260901 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13351 _keys!709))))))

(assert (=> start!40208 e!259603))

(assert (=> start!40208 tp_is_empty!11641))

(assert (=> start!40208 tp!36996))

(assert (=> start!40208 true))

(declare-fun array_inv!9478 (array!27099) Bool)

(assert (=> start!40208 (and (array_inv!9478 _values!549) e!259605)))

(declare-fun array_inv!9479 (array!27097) Bool)

(assert (=> start!40208 (array_inv!9479 _keys!709)))

(assert (= (and start!40208 res!260901) b!440827))

(assert (= (and b!440827 res!260905) b!440828))

(assert (= (and b!440828 res!260902) b!440821))

(assert (= (and b!440821 res!260904) b!440830))

(assert (= (and b!440830 res!260898) b!440824))

(assert (= (and b!440824 res!260909) b!440829))

(assert (= (and b!440829 res!260900) b!440831))

(assert (= (and b!440831 res!260907) b!440823))

(assert (= (and b!440823 res!260908) b!440822))

(assert (= (and b!440822 res!260903) b!440826))

(assert (= (and b!440826 res!260906) b!440833))

(assert (= (and b!440833 res!260899) b!440836))

(assert (= (and b!440836 res!260910) b!440832))

(assert (= (and b!440834 condMapEmpty!19083) mapIsEmpty!19083))

(assert (= (and b!440834 (not condMapEmpty!19083)) mapNonEmpty!19083))

(get-info :version)

(assert (= (and mapNonEmpty!19083 ((_ is ValueCellFull!5477) mapValue!19083)) b!440825))

(assert (= (and b!440834 ((_ is ValueCellFull!5477) mapDefault!19083)) b!440835))

(assert (= start!40208 b!440834))

(declare-fun m!427269 () Bool)

(assert (=> b!440826 m!427269))

(declare-fun m!427271 () Bool)

(assert (=> b!440831 m!427271))

(declare-fun m!427273 () Bool)

(assert (=> b!440822 m!427273))

(declare-fun m!427275 () Bool)

(assert (=> b!440822 m!427275))

(declare-fun m!427277 () Bool)

(assert (=> b!440830 m!427277))

(declare-fun m!427279 () Bool)

(assert (=> b!440832 m!427279))

(declare-fun m!427281 () Bool)

(assert (=> b!440832 m!427281))

(assert (=> b!440832 m!427281))

(declare-fun m!427283 () Bool)

(assert (=> b!440832 m!427283))

(declare-fun m!427285 () Bool)

(assert (=> b!440832 m!427285))

(declare-fun m!427287 () Bool)

(assert (=> b!440836 m!427287))

(declare-fun m!427289 () Bool)

(assert (=> b!440836 m!427289))

(declare-fun m!427291 () Bool)

(assert (=> b!440836 m!427291))

(declare-fun m!427293 () Bool)

(assert (=> mapNonEmpty!19083 m!427293))

(declare-fun m!427295 () Bool)

(assert (=> b!440821 m!427295))

(declare-fun m!427297 () Bool)

(assert (=> start!40208 m!427297))

(declare-fun m!427299 () Bool)

(assert (=> start!40208 m!427299))

(declare-fun m!427301 () Bool)

(assert (=> b!440823 m!427301))

(declare-fun m!427303 () Bool)

(assert (=> b!440829 m!427303))

(declare-fun m!427305 () Bool)

(assert (=> b!440827 m!427305))

(check-sat (not b_next!10489) (not start!40208) (not b!440830) (not b!440829) (not b!440836) tp_is_empty!11641 b_and!18431 (not b!440823) (not mapNonEmpty!19083) (not b!440832) (not b!440822) (not b!440826) (not b!440827) (not b!440821))
(check-sat b_and!18431 (not b_next!10489))
