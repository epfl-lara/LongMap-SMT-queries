; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41164 () Bool)

(assert start!41164)

(declare-fun b_free!11047 () Bool)

(declare-fun b_next!11047 () Bool)

(assert (=> start!41164 (= b_free!11047 (not b_next!11047))))

(declare-fun tp!38977 () Bool)

(declare-fun b_and!19307 () Bool)

(assert (=> start!41164 (= tp!38977 b_and!19307)))

(declare-fun b!459976 () Bool)

(declare-fun e!268362 () Bool)

(assert (=> b!459976 (= e!268362 true)))

(declare-datatypes ((V!17619 0))(
  ( (V!17620 (val!6237 Int)) )
))
(declare-datatypes ((tuple2!8256 0))(
  ( (tuple2!8257 (_1!4139 (_ BitVec 64)) (_2!4139 V!17619)) )
))
(declare-fun lt!208128 () tuple2!8256)

(declare-datatypes ((List!8317 0))(
  ( (Nil!8314) (Cons!8313 (h!9169 tuple2!8256) (t!14234 List!8317)) )
))
(declare-datatypes ((ListLongMap!7159 0))(
  ( (ListLongMap!7160 (toList!3595 List!8317)) )
))
(declare-fun lt!208134 () ListLongMap!7159)

(declare-fun lt!208136 () ListLongMap!7159)

(declare-fun lt!208141 () tuple2!8256)

(declare-fun +!1647 (ListLongMap!7159 tuple2!8256) ListLongMap!7159)

(assert (=> b!459976 (= lt!208136 (+!1647 (+!1647 lt!208134 lt!208128) lt!208141))))

(declare-fun lt!208130 () V!17619)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13360 0))(
  ( (Unit!13361) )
))
(declare-fun lt!208140 () Unit!13360)

(declare-fun v!412 () V!17619)

(declare-datatypes ((array!28567 0))(
  ( (array!28568 (arr!13724 (Array (_ BitVec 32) (_ BitVec 64))) (size!14077 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28567)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!427 (ListLongMap!7159 (_ BitVec 64) V!17619 (_ BitVec 64) V!17619) Unit!13360)

(assert (=> b!459976 (= lt!208140 (addCommutativeForDiffKeys!427 lt!208134 k0!794 v!412 (select (arr!13724 _keys!709) from!863) lt!208130))))

(declare-fun b!459977 () Bool)

(declare-fun e!268363 () Bool)

(assert (=> b!459977 (= e!268363 e!268362)))

(declare-fun res!275022 () Bool)

(assert (=> b!459977 (=> res!275022 e!268362)))

(assert (=> b!459977 (= res!275022 (= k0!794 (select (arr!13724 _keys!709) from!863)))))

(assert (=> b!459977 (not (= (select (arr!13724 _keys!709) from!863) k0!794))))

(declare-fun lt!208132 () Unit!13360)

(declare-fun e!268359 () Unit!13360)

(assert (=> b!459977 (= lt!208132 e!268359)))

(declare-fun c!56448 () Bool)

(assert (=> b!459977 (= c!56448 (= (select (arr!13724 _keys!709) from!863) k0!794))))

(declare-fun lt!208139 () ListLongMap!7159)

(assert (=> b!459977 (= lt!208139 lt!208136)))

(declare-fun lt!208129 () ListLongMap!7159)

(assert (=> b!459977 (= lt!208136 (+!1647 lt!208129 lt!208128))))

(assert (=> b!459977 (= lt!208128 (tuple2!8257 (select (arr!13724 _keys!709) from!863) lt!208130))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5849 0))(
  ( (ValueCellFull!5849 (v!8509 V!17619)) (EmptyCell!5849) )
))
(declare-datatypes ((array!28569 0))(
  ( (array!28570 (arr!13725 (Array (_ BitVec 32) ValueCell!5849)) (size!14078 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28569)

(declare-fun get!6780 (ValueCell!5849 V!17619) V!17619)

(declare-fun dynLambda!907 (Int (_ BitVec 64)) V!17619)

(assert (=> b!459977 (= lt!208130 (get!6780 (select (arr!13725 _values!549) from!863) (dynLambda!907 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459979 () Bool)

(declare-fun res!275032 () Bool)

(declare-fun e!268356 () Bool)

(assert (=> b!459979 (=> (not res!275032) (not e!268356))))

(declare-fun arrayContainsKey!0 (array!28567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459979 (= res!275032 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20227 () Bool)

(declare-fun mapRes!20227 () Bool)

(assert (=> mapIsEmpty!20227 mapRes!20227))

(declare-fun b!459980 () Bool)

(declare-fun e!268358 () Bool)

(declare-fun e!268364 () Bool)

(assert (=> b!459980 (= e!268358 e!268364)))

(declare-fun res!275024 () Bool)

(assert (=> b!459980 (=> (not res!275024) (not e!268364))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459980 (= res!275024 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17619)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!208131 () array!28569)

(declare-fun zeroValue!515 () V!17619)

(declare-fun lt!208137 () array!28567)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1787 (array!28567 array!28569 (_ BitVec 32) (_ BitVec 32) V!17619 V!17619 (_ BitVec 32) Int) ListLongMap!7159)

(assert (=> b!459980 (= lt!208139 (getCurrentListMapNoExtraKeys!1787 lt!208137 lt!208131 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!459980 (= lt!208131 (array!28570 (store (arr!13725 _values!549) i!563 (ValueCellFull!5849 v!412)) (size!14078 _values!549)))))

(declare-fun lt!208133 () ListLongMap!7159)

(assert (=> b!459980 (= lt!208133 (getCurrentListMapNoExtraKeys!1787 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459981 () Bool)

(declare-fun res!275026 () Bool)

(assert (=> b!459981 (=> (not res!275026) (not e!268356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459981 (= res!275026 (validKeyInArray!0 k0!794))))

(declare-fun b!459982 () Bool)

(declare-fun res!275031 () Bool)

(assert (=> b!459982 (=> (not res!275031) (not e!268356))))

(declare-datatypes ((List!8318 0))(
  ( (Nil!8315) (Cons!8314 (h!9170 (_ BitVec 64)) (t!14235 List!8318)) )
))
(declare-fun arrayNoDuplicates!0 (array!28567 (_ BitVec 32) List!8318) Bool)

(assert (=> b!459982 (= res!275031 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8315))))

(declare-fun b!459983 () Bool)

(declare-fun res!275023 () Bool)

(assert (=> b!459983 (=> (not res!275023) (not e!268358))))

(assert (=> b!459983 (= res!275023 (bvsle from!863 i!563))))

(declare-fun b!459984 () Bool)

(declare-fun res!275028 () Bool)

(assert (=> b!459984 (=> (not res!275028) (not e!268356))))

(assert (=> b!459984 (= res!275028 (and (= (size!14078 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14077 _keys!709) (size!14078 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459985 () Bool)

(declare-fun e!268361 () Bool)

(declare-fun tp_is_empty!12385 () Bool)

(assert (=> b!459985 (= e!268361 tp_is_empty!12385)))

(declare-fun b!459986 () Bool)

(declare-fun res!275025 () Bool)

(assert (=> b!459986 (=> (not res!275025) (not e!268356))))

(assert (=> b!459986 (= res!275025 (or (= (select (arr!13724 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13724 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459987 () Bool)

(declare-fun Unit!13362 () Unit!13360)

(assert (=> b!459987 (= e!268359 Unit!13362)))

(declare-fun mapNonEmpty!20227 () Bool)

(declare-fun tp!38976 () Bool)

(assert (=> mapNonEmpty!20227 (= mapRes!20227 (and tp!38976 e!268361))))

(declare-fun mapRest!20227 () (Array (_ BitVec 32) ValueCell!5849))

(declare-fun mapValue!20227 () ValueCell!5849)

(declare-fun mapKey!20227 () (_ BitVec 32))

(assert (=> mapNonEmpty!20227 (= (arr!13725 _values!549) (store mapRest!20227 mapKey!20227 mapValue!20227))))

(declare-fun b!459988 () Bool)

(declare-fun res!275029 () Bool)

(assert (=> b!459988 (=> (not res!275029) (not e!268356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459988 (= res!275029 (validMask!0 mask!1025))))

(declare-fun b!459989 () Bool)

(declare-fun e!268357 () Bool)

(assert (=> b!459989 (= e!268357 tp_is_empty!12385)))

(declare-fun b!459978 () Bool)

(declare-fun res!275019 () Bool)

(assert (=> b!459978 (=> (not res!275019) (not e!268356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28567 (_ BitVec 32)) Bool)

(assert (=> b!459978 (= res!275019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!275021 () Bool)

(assert (=> start!41164 (=> (not res!275021) (not e!268356))))

(assert (=> start!41164 (= res!275021 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14077 _keys!709))))))

(assert (=> start!41164 e!268356))

(assert (=> start!41164 tp_is_empty!12385))

(assert (=> start!41164 tp!38977))

(assert (=> start!41164 true))

(declare-fun e!268365 () Bool)

(declare-fun array_inv!9988 (array!28569) Bool)

(assert (=> start!41164 (and (array_inv!9988 _values!549) e!268365)))

(declare-fun array_inv!9989 (array!28567) Bool)

(assert (=> start!41164 (array_inv!9989 _keys!709)))

(declare-fun b!459990 () Bool)

(assert (=> b!459990 (= e!268356 e!268358)))

(declare-fun res!275018 () Bool)

(assert (=> b!459990 (=> (not res!275018) (not e!268358))))

(assert (=> b!459990 (= res!275018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208137 mask!1025))))

(assert (=> b!459990 (= lt!208137 (array!28568 (store (arr!13724 _keys!709) i!563 k0!794) (size!14077 _keys!709)))))

(declare-fun b!459991 () Bool)

(assert (=> b!459991 (= e!268364 (not e!268363))))

(declare-fun res!275027 () Bool)

(assert (=> b!459991 (=> res!275027 e!268363)))

(assert (=> b!459991 (= res!275027 (not (validKeyInArray!0 (select (arr!13724 _keys!709) from!863))))))

(declare-fun lt!208135 () ListLongMap!7159)

(assert (=> b!459991 (= lt!208135 lt!208129)))

(assert (=> b!459991 (= lt!208129 (+!1647 lt!208134 lt!208141))))

(assert (=> b!459991 (= lt!208135 (getCurrentListMapNoExtraKeys!1787 lt!208137 lt!208131 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459991 (= lt!208141 (tuple2!8257 k0!794 v!412))))

(assert (=> b!459991 (= lt!208134 (getCurrentListMapNoExtraKeys!1787 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208142 () Unit!13360)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!777 (array!28567 array!28569 (_ BitVec 32) (_ BitVec 32) V!17619 V!17619 (_ BitVec 32) (_ BitVec 64) V!17619 (_ BitVec 32) Int) Unit!13360)

(assert (=> b!459991 (= lt!208142 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!777 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459992 () Bool)

(assert (=> b!459992 (= e!268365 (and e!268357 mapRes!20227))))

(declare-fun condMapEmpty!20227 () Bool)

(declare-fun mapDefault!20227 () ValueCell!5849)

(assert (=> b!459992 (= condMapEmpty!20227 (= (arr!13725 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5849)) mapDefault!20227)))))

(declare-fun b!459993 () Bool)

(declare-fun Unit!13363 () Unit!13360)

(assert (=> b!459993 (= e!268359 Unit!13363)))

(declare-fun lt!208138 () Unit!13360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28567 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13360)

(assert (=> b!459993 (= lt!208138 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459993 false))

(declare-fun b!459994 () Bool)

(declare-fun res!275020 () Bool)

(assert (=> b!459994 (=> (not res!275020) (not e!268358))))

(assert (=> b!459994 (= res!275020 (arrayNoDuplicates!0 lt!208137 #b00000000000000000000000000000000 Nil!8315))))

(declare-fun b!459995 () Bool)

(declare-fun res!275030 () Bool)

(assert (=> b!459995 (=> (not res!275030) (not e!268356))))

(assert (=> b!459995 (= res!275030 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14077 _keys!709))))))

(assert (= (and start!41164 res!275021) b!459988))

(assert (= (and b!459988 res!275029) b!459984))

(assert (= (and b!459984 res!275028) b!459978))

(assert (= (and b!459978 res!275019) b!459982))

(assert (= (and b!459982 res!275031) b!459995))

(assert (= (and b!459995 res!275030) b!459981))

(assert (= (and b!459981 res!275026) b!459986))

(assert (= (and b!459986 res!275025) b!459979))

(assert (= (and b!459979 res!275032) b!459990))

(assert (= (and b!459990 res!275018) b!459994))

(assert (= (and b!459994 res!275020) b!459983))

(assert (= (and b!459983 res!275023) b!459980))

(assert (= (and b!459980 res!275024) b!459991))

(assert (= (and b!459991 (not res!275027)) b!459977))

(assert (= (and b!459977 c!56448) b!459993))

(assert (= (and b!459977 (not c!56448)) b!459987))

(assert (= (and b!459977 (not res!275022)) b!459976))

(assert (= (and b!459992 condMapEmpty!20227) mapIsEmpty!20227))

(assert (= (and b!459992 (not condMapEmpty!20227)) mapNonEmpty!20227))

(get-info :version)

(assert (= (and mapNonEmpty!20227 ((_ is ValueCellFull!5849) mapValue!20227)) b!459985))

(assert (= (and b!459992 ((_ is ValueCellFull!5849) mapDefault!20227)) b!459989))

(assert (= start!41164 b!459992))

(declare-fun b_lambda!9863 () Bool)

(assert (=> (not b_lambda!9863) (not b!459977)))

(declare-fun t!14233 () Bool)

(declare-fun tb!3875 () Bool)

(assert (=> (and start!41164 (= defaultEntry!557 defaultEntry!557) t!14233) tb!3875))

(declare-fun result!7303 () Bool)

(assert (=> tb!3875 (= result!7303 tp_is_empty!12385)))

(assert (=> b!459977 t!14233))

(declare-fun b_and!19309 () Bool)

(assert (= b_and!19307 (and (=> t!14233 result!7303) b_and!19309)))

(declare-fun m!442717 () Bool)

(assert (=> mapNonEmpty!20227 m!442717))

(declare-fun m!442719 () Bool)

(assert (=> b!459977 m!442719))

(declare-fun m!442721 () Bool)

(assert (=> b!459977 m!442721))

(declare-fun m!442723 () Bool)

(assert (=> b!459977 m!442723))

(declare-fun m!442725 () Bool)

(assert (=> b!459977 m!442725))

(assert (=> b!459977 m!442725))

(assert (=> b!459977 m!442721))

(declare-fun m!442727 () Bool)

(assert (=> b!459977 m!442727))

(declare-fun m!442729 () Bool)

(assert (=> start!41164 m!442729))

(declare-fun m!442731 () Bool)

(assert (=> start!41164 m!442731))

(declare-fun m!442733 () Bool)

(assert (=> b!459981 m!442733))

(declare-fun m!442735 () Bool)

(assert (=> b!459979 m!442735))

(declare-fun m!442737 () Bool)

(assert (=> b!459982 m!442737))

(declare-fun m!442739 () Bool)

(assert (=> b!459978 m!442739))

(assert (=> b!459991 m!442719))

(declare-fun m!442741 () Bool)

(assert (=> b!459991 m!442741))

(declare-fun m!442743 () Bool)

(assert (=> b!459991 m!442743))

(declare-fun m!442745 () Bool)

(assert (=> b!459991 m!442745))

(assert (=> b!459991 m!442719))

(declare-fun m!442747 () Bool)

(assert (=> b!459991 m!442747))

(declare-fun m!442749 () Bool)

(assert (=> b!459991 m!442749))

(declare-fun m!442751 () Bool)

(assert (=> b!459994 m!442751))

(declare-fun m!442753 () Bool)

(assert (=> b!459986 m!442753))

(declare-fun m!442755 () Bool)

(assert (=> b!459990 m!442755))

(declare-fun m!442757 () Bool)

(assert (=> b!459990 m!442757))

(declare-fun m!442759 () Bool)

(assert (=> b!459993 m!442759))

(declare-fun m!442761 () Bool)

(assert (=> b!459988 m!442761))

(declare-fun m!442763 () Bool)

(assert (=> b!459980 m!442763))

(declare-fun m!442765 () Bool)

(assert (=> b!459980 m!442765))

(declare-fun m!442767 () Bool)

(assert (=> b!459980 m!442767))

(declare-fun m!442769 () Bool)

(assert (=> b!459976 m!442769))

(assert (=> b!459976 m!442769))

(declare-fun m!442771 () Bool)

(assert (=> b!459976 m!442771))

(assert (=> b!459976 m!442719))

(assert (=> b!459976 m!442719))

(declare-fun m!442773 () Bool)

(assert (=> b!459976 m!442773))

(check-sat (not b!459993) (not b!459982) (not mapNonEmpty!20227) (not b!459977) b_and!19309 (not b!459991) (not b_lambda!9863) tp_is_empty!12385 (not b!459978) (not b!459990) (not b!459976) (not b!459981) (not b_next!11047) (not b!459994) (not b!459980) (not start!41164) (not b!459979) (not b!459988))
(check-sat b_and!19309 (not b_next!11047))
