; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40118 () Bool)

(assert start!40118)

(declare-fun b_free!10399 () Bool)

(declare-fun b_next!10399 () Bool)

(assert (=> start!40118 (= b_free!10399 (not b_next!10399))))

(declare-fun tp!36725 () Bool)

(declare-fun b_and!18381 () Bool)

(assert (=> start!40118 (= tp!36725 b_and!18381)))

(declare-fun b!438883 () Bool)

(declare-fun res!259277 () Bool)

(declare-fun e!258804 () Bool)

(assert (=> b!438883 (=> (not res!259277) (not e!258804))))

(declare-datatypes ((array!26924 0))(
  ( (array!26925 (arr!12911 (Array (_ BitVec 32) (_ BitVec 64))) (size!13263 (_ BitVec 32))) )
))
(declare-fun lt!202133 () array!26924)

(declare-datatypes ((List!7617 0))(
  ( (Nil!7614) (Cons!7613 (h!8469 (_ BitVec 64)) (t!13365 List!7617)) )
))
(declare-fun arrayNoDuplicates!0 (array!26924 (_ BitVec 32) List!7617) Bool)

(assert (=> b!438883 (= res!259277 (arrayNoDuplicates!0 lt!202133 #b00000000000000000000000000000000 Nil!7614))))

(declare-fun b!438884 () Bool)

(declare-fun res!259278 () Bool)

(declare-fun e!258803 () Bool)

(assert (=> b!438884 (=> (not res!259278) (not e!258803))))

(declare-fun _keys!709 () array!26924)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26924 (_ BitVec 32)) Bool)

(assert (=> b!438884 (= res!259278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438885 () Bool)

(declare-fun e!258805 () Bool)

(assert (=> b!438885 (= e!258805 (not true))))

(declare-datatypes ((V!16507 0))(
  ( (V!16508 (val!5820 Int)) )
))
(declare-datatypes ((ValueCell!5432 0))(
  ( (ValueCellFull!5432 (v!8068 V!16507)) (EmptyCell!5432) )
))
(declare-datatypes ((array!26926 0))(
  ( (array!26927 (arr!12912 (Array (_ BitVec 32) ValueCell!5432)) (size!13264 (_ BitVec 32))) )
))
(declare-fun lt!202132 () array!26926)

(declare-fun minValue!515 () V!16507)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun _values!549 () array!26926)

(declare-fun zeroValue!515 () V!16507)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16507)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7630 0))(
  ( (tuple2!7631 (_1!3826 (_ BitVec 64)) (_2!3826 V!16507)) )
))
(declare-datatypes ((List!7618 0))(
  ( (Nil!7615) (Cons!7614 (h!8470 tuple2!7630) (t!13366 List!7618)) )
))
(declare-datatypes ((ListLongMap!6545 0))(
  ( (ListLongMap!6546 (toList!3288 List!7618)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1521 (array!26924 array!26926 (_ BitVec 32) (_ BitVec 32) V!16507 V!16507 (_ BitVec 32) Int) ListLongMap!6545)

(declare-fun +!1483 (ListLongMap!6545 tuple2!7630) ListLongMap!6545)

(assert (=> b!438885 (= (getCurrentListMapNoExtraKeys!1521 lt!202133 lt!202132 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1483 (getCurrentListMapNoExtraKeys!1521 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7631 k0!794 v!412)))))

(declare-datatypes ((Unit!13041 0))(
  ( (Unit!13042) )
))
(declare-fun lt!202131 () Unit!13041)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!643 (array!26924 array!26926 (_ BitVec 32) (_ BitVec 32) V!16507 V!16507 (_ BitVec 32) (_ BitVec 64) V!16507 (_ BitVec 32) Int) Unit!13041)

(assert (=> b!438885 (= lt!202131 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!643 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18948 () Bool)

(declare-fun mapRes!18948 () Bool)

(declare-fun tp!36726 () Bool)

(declare-fun e!258800 () Bool)

(assert (=> mapNonEmpty!18948 (= mapRes!18948 (and tp!36726 e!258800))))

(declare-fun mapValue!18948 () ValueCell!5432)

(declare-fun mapKey!18948 () (_ BitVec 32))

(declare-fun mapRest!18948 () (Array (_ BitVec 32) ValueCell!5432))

(assert (=> mapNonEmpty!18948 (= (arr!12912 _values!549) (store mapRest!18948 mapKey!18948 mapValue!18948))))

(declare-fun b!438886 () Bool)

(assert (=> b!438886 (= e!258803 e!258804)))

(declare-fun res!259274 () Bool)

(assert (=> b!438886 (=> (not res!259274) (not e!258804))))

(assert (=> b!438886 (= res!259274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202133 mask!1025))))

(assert (=> b!438886 (= lt!202133 (array!26925 (store (arr!12911 _keys!709) i!563 k0!794) (size!13263 _keys!709)))))

(declare-fun res!259280 () Bool)

(assert (=> start!40118 (=> (not res!259280) (not e!258803))))

(assert (=> start!40118 (= res!259280 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13263 _keys!709))))))

(assert (=> start!40118 e!258803))

(declare-fun tp_is_empty!11551 () Bool)

(assert (=> start!40118 tp_is_empty!11551))

(assert (=> start!40118 tp!36725))

(assert (=> start!40118 true))

(declare-fun e!258801 () Bool)

(declare-fun array_inv!9442 (array!26926) Bool)

(assert (=> start!40118 (and (array_inv!9442 _values!549) e!258801)))

(declare-fun array_inv!9443 (array!26924) Bool)

(assert (=> start!40118 (array_inv!9443 _keys!709)))

(declare-fun b!438887 () Bool)

(declare-fun res!259272 () Bool)

(assert (=> b!438887 (=> (not res!259272) (not e!258803))))

(declare-fun arrayContainsKey!0 (array!26924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438887 (= res!259272 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438888 () Bool)

(declare-fun e!258799 () Bool)

(assert (=> b!438888 (= e!258799 tp_is_empty!11551)))

(declare-fun b!438889 () Bool)

(assert (=> b!438889 (= e!258801 (and e!258799 mapRes!18948))))

(declare-fun condMapEmpty!18948 () Bool)

(declare-fun mapDefault!18948 () ValueCell!5432)

(assert (=> b!438889 (= condMapEmpty!18948 (= (arr!12912 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5432)) mapDefault!18948)))))

(declare-fun b!438890 () Bool)

(declare-fun res!259273 () Bool)

(assert (=> b!438890 (=> (not res!259273) (not e!258804))))

(assert (=> b!438890 (= res!259273 (bvsle from!863 i!563))))

(declare-fun b!438891 () Bool)

(declare-fun res!259275 () Bool)

(assert (=> b!438891 (=> (not res!259275) (not e!258803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438891 (= res!259275 (validKeyInArray!0 k0!794))))

(declare-fun b!438892 () Bool)

(declare-fun res!259271 () Bool)

(assert (=> b!438892 (=> (not res!259271) (not e!258803))))

(assert (=> b!438892 (= res!259271 (or (= (select (arr!12911 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12911 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438893 () Bool)

(declare-fun res!259269 () Bool)

(assert (=> b!438893 (=> (not res!259269) (not e!258803))))

(assert (=> b!438893 (= res!259269 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13263 _keys!709))))))

(declare-fun b!438894 () Bool)

(declare-fun res!259279 () Bool)

(assert (=> b!438894 (=> (not res!259279) (not e!258803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438894 (= res!259279 (validMask!0 mask!1025))))

(declare-fun b!438895 () Bool)

(assert (=> b!438895 (= e!258800 tp_is_empty!11551)))

(declare-fun b!438896 () Bool)

(declare-fun res!259281 () Bool)

(assert (=> b!438896 (=> (not res!259281) (not e!258803))))

(assert (=> b!438896 (= res!259281 (and (= (size!13264 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13263 _keys!709) (size!13264 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18948 () Bool)

(assert (=> mapIsEmpty!18948 mapRes!18948))

(declare-fun b!438897 () Bool)

(assert (=> b!438897 (= e!258804 e!258805)))

(declare-fun res!259276 () Bool)

(assert (=> b!438897 (=> (not res!259276) (not e!258805))))

(assert (=> b!438897 (= res!259276 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202130 () ListLongMap!6545)

(assert (=> b!438897 (= lt!202130 (getCurrentListMapNoExtraKeys!1521 lt!202133 lt!202132 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438897 (= lt!202132 (array!26927 (store (arr!12912 _values!549) i!563 (ValueCellFull!5432 v!412)) (size!13264 _values!549)))))

(declare-fun lt!202134 () ListLongMap!6545)

(assert (=> b!438897 (= lt!202134 (getCurrentListMapNoExtraKeys!1521 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438898 () Bool)

(declare-fun res!259270 () Bool)

(assert (=> b!438898 (=> (not res!259270) (not e!258803))))

(assert (=> b!438898 (= res!259270 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7614))))

(assert (= (and start!40118 res!259280) b!438894))

(assert (= (and b!438894 res!259279) b!438896))

(assert (= (and b!438896 res!259281) b!438884))

(assert (= (and b!438884 res!259278) b!438898))

(assert (= (and b!438898 res!259270) b!438893))

(assert (= (and b!438893 res!259269) b!438891))

(assert (= (and b!438891 res!259275) b!438892))

(assert (= (and b!438892 res!259271) b!438887))

(assert (= (and b!438887 res!259272) b!438886))

(assert (= (and b!438886 res!259274) b!438883))

(assert (= (and b!438883 res!259277) b!438890))

(assert (= (and b!438890 res!259273) b!438897))

(assert (= (and b!438897 res!259276) b!438885))

(assert (= (and b!438889 condMapEmpty!18948) mapIsEmpty!18948))

(assert (= (and b!438889 (not condMapEmpty!18948)) mapNonEmpty!18948))

(get-info :version)

(assert (= (and mapNonEmpty!18948 ((_ is ValueCellFull!5432) mapValue!18948)) b!438895))

(assert (= (and b!438889 ((_ is ValueCellFull!5432) mapDefault!18948)) b!438888))

(assert (= start!40118 b!438889))

(declare-fun m!426509 () Bool)

(assert (=> b!438887 m!426509))

(declare-fun m!426511 () Bool)

(assert (=> b!438891 m!426511))

(declare-fun m!426513 () Bool)

(assert (=> b!438897 m!426513))

(declare-fun m!426515 () Bool)

(assert (=> b!438897 m!426515))

(declare-fun m!426517 () Bool)

(assert (=> b!438897 m!426517))

(declare-fun m!426519 () Bool)

(assert (=> b!438883 m!426519))

(declare-fun m!426521 () Bool)

(assert (=> b!438892 m!426521))

(declare-fun m!426523 () Bool)

(assert (=> mapNonEmpty!18948 m!426523))

(declare-fun m!426525 () Bool)

(assert (=> b!438894 m!426525))

(declare-fun m!426527 () Bool)

(assert (=> start!40118 m!426527))

(declare-fun m!426529 () Bool)

(assert (=> start!40118 m!426529))

(declare-fun m!426531 () Bool)

(assert (=> b!438886 m!426531))

(declare-fun m!426533 () Bool)

(assert (=> b!438886 m!426533))

(declare-fun m!426535 () Bool)

(assert (=> b!438884 m!426535))

(declare-fun m!426537 () Bool)

(assert (=> b!438898 m!426537))

(declare-fun m!426539 () Bool)

(assert (=> b!438885 m!426539))

(declare-fun m!426541 () Bool)

(assert (=> b!438885 m!426541))

(assert (=> b!438885 m!426541))

(declare-fun m!426543 () Bool)

(assert (=> b!438885 m!426543))

(declare-fun m!426545 () Bool)

(assert (=> b!438885 m!426545))

(check-sat (not b!438883) (not b_next!10399) (not b!438886) (not b!438884) (not b!438885) tp_is_empty!11551 (not b!438897) (not b!438894) (not mapNonEmpty!18948) (not b!438887) (not start!40118) (not b!438898) b_and!18381 (not b!438891))
(check-sat b_and!18381 (not b_next!10399))
