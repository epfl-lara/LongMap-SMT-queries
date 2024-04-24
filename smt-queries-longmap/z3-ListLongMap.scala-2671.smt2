; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39830 () Bool)

(assert start!39830)

(declare-fun b_free!10111 () Bool)

(declare-fun b_next!10111 () Bool)

(assert (=> start!39830 (= b_free!10111 (not b_next!10111))))

(declare-fun tp!35861 () Bool)

(declare-fun b_and!17895 () Bool)

(assert (=> start!39830 (= tp!35861 b_and!17895)))

(declare-fun b!430593 () Bool)

(declare-fun res!253073 () Bool)

(declare-fun e!254893 () Bool)

(assert (=> b!430593 (=> (not res!253073) (not e!254893))))

(declare-datatypes ((array!26366 0))(
  ( (array!26367 (arr!12632 (Array (_ BitVec 32) (_ BitVec 64))) (size!12984 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26366)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26366 (_ BitVec 32)) Bool)

(assert (=> b!430593 (= res!253073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430594 () Bool)

(declare-fun e!254899 () Bool)

(declare-fun tp_is_empty!11263 () Bool)

(assert (=> b!430594 (= e!254899 tp_is_empty!11263)))

(declare-fun res!253063 () Bool)

(assert (=> start!39830 (=> (not res!253063) (not e!254893))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39830 (= res!253063 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12984 _keys!709))))))

(assert (=> start!39830 e!254893))

(assert (=> start!39830 tp_is_empty!11263))

(assert (=> start!39830 tp!35861))

(assert (=> start!39830 true))

(declare-datatypes ((V!16123 0))(
  ( (V!16124 (val!5676 Int)) )
))
(declare-datatypes ((ValueCell!5288 0))(
  ( (ValueCellFull!5288 (v!7924 V!16123)) (EmptyCell!5288) )
))
(declare-datatypes ((array!26368 0))(
  ( (array!26369 (arr!12633 (Array (_ BitVec 32) ValueCell!5288)) (size!12985 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26368)

(declare-fun e!254892 () Bool)

(declare-fun array_inv!9260 (array!26368) Bool)

(assert (=> start!39830 (and (array_inv!9260 _values!549) e!254892)))

(declare-fun array_inv!9261 (array!26366) Bool)

(assert (=> start!39830 (array_inv!9261 _keys!709)))

(declare-fun b!430595 () Bool)

(declare-fun res!253067 () Bool)

(assert (=> b!430595 (=> (not res!253067) (not e!254893))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430595 (= res!253067 (or (= (select (arr!12632 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12632 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18516 () Bool)

(declare-fun mapRes!18516 () Bool)

(assert (=> mapIsEmpty!18516 mapRes!18516))

(declare-fun b!430596 () Bool)

(declare-fun res!253069 () Bool)

(assert (=> b!430596 (=> (not res!253069) (not e!254893))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430596 (= res!253069 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!18516 () Bool)

(declare-fun tp!35862 () Bool)

(declare-fun e!254897 () Bool)

(assert (=> mapNonEmpty!18516 (= mapRes!18516 (and tp!35862 e!254897))))

(declare-fun mapValue!18516 () ValueCell!5288)

(declare-fun mapKey!18516 () (_ BitVec 32))

(declare-fun mapRest!18516 () (Array (_ BitVec 32) ValueCell!5288))

(assert (=> mapNonEmpty!18516 (= (arr!12633 _values!549) (store mapRest!18516 mapKey!18516 mapValue!18516))))

(declare-fun b!430597 () Bool)

(declare-datatypes ((Unit!12681 0))(
  ( (Unit!12682) )
))
(declare-fun e!254891 () Unit!12681)

(declare-fun Unit!12683 () Unit!12681)

(assert (=> b!430597 (= e!254891 Unit!12683)))

(declare-fun lt!197023 () Unit!12681)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26366 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12681)

(assert (=> b!430597 (= lt!197023 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430597 false))

(declare-fun b!430598 () Bool)

(declare-fun e!254890 () Bool)

(declare-fun e!254898 () Bool)

(assert (=> b!430598 (= e!254890 (not e!254898))))

(declare-fun res!253075 () Bool)

(assert (=> b!430598 (=> res!253075 e!254898)))

(assert (=> b!430598 (= res!253075 (not (validKeyInArray!0 (select (arr!12632 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7386 0))(
  ( (tuple2!7387 (_1!3704 (_ BitVec 64)) (_2!3704 V!16123)) )
))
(declare-datatypes ((List!7383 0))(
  ( (Nil!7380) (Cons!7379 (h!8235 tuple2!7386) (t!12935 List!7383)) )
))
(declare-datatypes ((ListLongMap!6301 0))(
  ( (ListLongMap!6302 (toList!3166 List!7383)) )
))
(declare-fun lt!197031 () ListLongMap!6301)

(declare-fun lt!197026 () ListLongMap!6301)

(assert (=> b!430598 (= lt!197031 lt!197026)))

(declare-fun lt!197030 () ListLongMap!6301)

(declare-fun lt!197021 () tuple2!7386)

(declare-fun +!1376 (ListLongMap!6301 tuple2!7386) ListLongMap!6301)

(assert (=> b!430598 (= lt!197026 (+!1376 lt!197030 lt!197021))))

(declare-fun minValue!515 () V!16123)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16123)

(declare-fun lt!197029 () array!26366)

(declare-fun lt!197032 () array!26368)

(declare-fun getCurrentListMapNoExtraKeys!1409 (array!26366 array!26368 (_ BitVec 32) (_ BitVec 32) V!16123 V!16123 (_ BitVec 32) Int) ListLongMap!6301)

(assert (=> b!430598 (= lt!197031 (getCurrentListMapNoExtraKeys!1409 lt!197029 lt!197032 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16123)

(assert (=> b!430598 (= lt!197021 (tuple2!7387 k0!794 v!412))))

(assert (=> b!430598 (= lt!197030 (getCurrentListMapNoExtraKeys!1409 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197025 () Unit!12681)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!553 (array!26366 array!26368 (_ BitVec 32) (_ BitVec 32) V!16123 V!16123 (_ BitVec 32) (_ BitVec 64) V!16123 (_ BitVec 32) Int) Unit!12681)

(assert (=> b!430598 (= lt!197025 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!553 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430599 () Bool)

(declare-fun e!254894 () Bool)

(assert (=> b!430599 (= e!254893 e!254894)))

(declare-fun res!253064 () Bool)

(assert (=> b!430599 (=> (not res!253064) (not e!254894))))

(assert (=> b!430599 (= res!253064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197029 mask!1025))))

(assert (=> b!430599 (= lt!197029 (array!26367 (store (arr!12632 _keys!709) i!563 k0!794) (size!12984 _keys!709)))))

(declare-fun b!430600 () Bool)

(declare-fun res!253071 () Bool)

(assert (=> b!430600 (=> (not res!253071) (not e!254893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430600 (= res!253071 (validMask!0 mask!1025))))

(declare-fun b!430601 () Bool)

(declare-fun res!253068 () Bool)

(assert (=> b!430601 (=> (not res!253068) (not e!254893))))

(declare-datatypes ((List!7384 0))(
  ( (Nil!7381) (Cons!7380 (h!8236 (_ BitVec 64)) (t!12936 List!7384)) )
))
(declare-fun arrayNoDuplicates!0 (array!26366 (_ BitVec 32) List!7384) Bool)

(assert (=> b!430601 (= res!253068 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7381))))

(declare-fun b!430602 () Bool)

(declare-fun res!253074 () Bool)

(assert (=> b!430602 (=> (not res!253074) (not e!254894))))

(assert (=> b!430602 (= res!253074 (bvsle from!863 i!563))))

(declare-fun b!430603 () Bool)

(assert (=> b!430603 (= e!254892 (and e!254899 mapRes!18516))))

(declare-fun condMapEmpty!18516 () Bool)

(declare-fun mapDefault!18516 () ValueCell!5288)

(assert (=> b!430603 (= condMapEmpty!18516 (= (arr!12633 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5288)) mapDefault!18516)))))

(declare-fun b!430604 () Bool)

(declare-fun e!254896 () Bool)

(assert (=> b!430604 (= e!254896 true)))

(declare-fun lt!197027 () ListLongMap!6301)

(declare-fun lt!197028 () tuple2!7386)

(assert (=> b!430604 (= lt!197027 (+!1376 (+!1376 lt!197030 lt!197028) lt!197021))))

(declare-fun lt!197020 () Unit!12681)

(declare-fun lt!197033 () V!16123)

(declare-fun addCommutativeForDiffKeys!357 (ListLongMap!6301 (_ BitVec 64) V!16123 (_ BitVec 64) V!16123) Unit!12681)

(assert (=> b!430604 (= lt!197020 (addCommutativeForDiffKeys!357 lt!197030 k0!794 v!412 (select (arr!12632 _keys!709) from!863) lt!197033))))

(declare-fun b!430605 () Bool)

(declare-fun res!253070 () Bool)

(assert (=> b!430605 (=> (not res!253070) (not e!254893))))

(assert (=> b!430605 (= res!253070 (and (= (size!12985 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12984 _keys!709) (size!12985 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430606 () Bool)

(declare-fun res!253076 () Bool)

(assert (=> b!430606 (=> (not res!253076) (not e!254893))))

(declare-fun arrayContainsKey!0 (array!26366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430606 (= res!253076 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430607 () Bool)

(declare-fun res!253072 () Bool)

(assert (=> b!430607 (=> (not res!253072) (not e!254894))))

(assert (=> b!430607 (= res!253072 (arrayNoDuplicates!0 lt!197029 #b00000000000000000000000000000000 Nil!7381))))

(declare-fun b!430608 () Bool)

(assert (=> b!430608 (= e!254898 e!254896)))

(declare-fun res!253066 () Bool)

(assert (=> b!430608 (=> res!253066 e!254896)))

(assert (=> b!430608 (= res!253066 (= k0!794 (select (arr!12632 _keys!709) from!863)))))

(assert (=> b!430608 (not (= (select (arr!12632 _keys!709) from!863) k0!794))))

(declare-fun lt!197022 () Unit!12681)

(assert (=> b!430608 (= lt!197022 e!254891)))

(declare-fun c!55479 () Bool)

(assert (=> b!430608 (= c!55479 (= (select (arr!12632 _keys!709) from!863) k0!794))))

(declare-fun lt!197034 () ListLongMap!6301)

(assert (=> b!430608 (= lt!197034 lt!197027)))

(assert (=> b!430608 (= lt!197027 (+!1376 lt!197026 lt!197028))))

(assert (=> b!430608 (= lt!197028 (tuple2!7387 (select (arr!12632 _keys!709) from!863) lt!197033))))

(declare-fun get!6280 (ValueCell!5288 V!16123) V!16123)

(declare-fun dynLambda!789 (Int (_ BitVec 64)) V!16123)

(assert (=> b!430608 (= lt!197033 (get!6280 (select (arr!12633 _values!549) from!863) (dynLambda!789 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430609 () Bool)

(declare-fun Unit!12684 () Unit!12681)

(assert (=> b!430609 (= e!254891 Unit!12684)))

(declare-fun b!430610 () Bool)

(assert (=> b!430610 (= e!254894 e!254890)))

(declare-fun res!253077 () Bool)

(assert (=> b!430610 (=> (not res!253077) (not e!254890))))

(assert (=> b!430610 (= res!253077 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!430610 (= lt!197034 (getCurrentListMapNoExtraKeys!1409 lt!197029 lt!197032 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430610 (= lt!197032 (array!26369 (store (arr!12633 _values!549) i!563 (ValueCellFull!5288 v!412)) (size!12985 _values!549)))))

(declare-fun lt!197024 () ListLongMap!6301)

(assert (=> b!430610 (= lt!197024 (getCurrentListMapNoExtraKeys!1409 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430611 () Bool)

(assert (=> b!430611 (= e!254897 tp_is_empty!11263)))

(declare-fun b!430612 () Bool)

(declare-fun res!253065 () Bool)

(assert (=> b!430612 (=> (not res!253065) (not e!254893))))

(assert (=> b!430612 (= res!253065 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12984 _keys!709))))))

(assert (= (and start!39830 res!253063) b!430600))

(assert (= (and b!430600 res!253071) b!430605))

(assert (= (and b!430605 res!253070) b!430593))

(assert (= (and b!430593 res!253073) b!430601))

(assert (= (and b!430601 res!253068) b!430612))

(assert (= (and b!430612 res!253065) b!430596))

(assert (= (and b!430596 res!253069) b!430595))

(assert (= (and b!430595 res!253067) b!430606))

(assert (= (and b!430606 res!253076) b!430599))

(assert (= (and b!430599 res!253064) b!430607))

(assert (= (and b!430607 res!253072) b!430602))

(assert (= (and b!430602 res!253074) b!430610))

(assert (= (and b!430610 res!253077) b!430598))

(assert (= (and b!430598 (not res!253075)) b!430608))

(assert (= (and b!430608 c!55479) b!430597))

(assert (= (and b!430608 (not c!55479)) b!430609))

(assert (= (and b!430608 (not res!253066)) b!430604))

(assert (= (and b!430603 condMapEmpty!18516) mapIsEmpty!18516))

(assert (= (and b!430603 (not condMapEmpty!18516)) mapNonEmpty!18516))

(get-info :version)

(assert (= (and mapNonEmpty!18516 ((_ is ValueCellFull!5288) mapValue!18516)) b!430611))

(assert (= (and b!430603 ((_ is ValueCellFull!5288) mapDefault!18516)) b!430594))

(assert (= start!39830 b!430603))

(declare-fun b_lambda!9221 () Bool)

(assert (=> (not b_lambda!9221) (not b!430608)))

(declare-fun t!12934 () Bool)

(declare-fun tb!3509 () Bool)

(assert (=> (and start!39830 (= defaultEntry!557 defaultEntry!557) t!12934) tb!3509))

(declare-fun result!6553 () Bool)

(assert (=> tb!3509 (= result!6553 tp_is_empty!11263)))

(assert (=> b!430608 t!12934))

(declare-fun b_and!17897 () Bool)

(assert (= b_and!17895 (and (=> t!12934 result!6553) b_and!17897)))

(declare-fun m!419057 () Bool)

(assert (=> b!430604 m!419057))

(assert (=> b!430604 m!419057))

(declare-fun m!419059 () Bool)

(assert (=> b!430604 m!419059))

(declare-fun m!419061 () Bool)

(assert (=> b!430604 m!419061))

(assert (=> b!430604 m!419061))

(declare-fun m!419063 () Bool)

(assert (=> b!430604 m!419063))

(declare-fun m!419065 () Bool)

(assert (=> b!430606 m!419065))

(declare-fun m!419067 () Bool)

(assert (=> mapNonEmpty!18516 m!419067))

(declare-fun m!419069 () Bool)

(assert (=> b!430593 m!419069))

(declare-fun m!419071 () Bool)

(assert (=> b!430601 m!419071))

(declare-fun m!419073 () Bool)

(assert (=> b!430596 m!419073))

(declare-fun m!419075 () Bool)

(assert (=> b!430595 m!419075))

(declare-fun m!419077 () Bool)

(assert (=> b!430610 m!419077))

(declare-fun m!419079 () Bool)

(assert (=> b!430610 m!419079))

(declare-fun m!419081 () Bool)

(assert (=> b!430610 m!419081))

(declare-fun m!419083 () Bool)

(assert (=> b!430599 m!419083))

(declare-fun m!419085 () Bool)

(assert (=> b!430599 m!419085))

(assert (=> b!430608 m!419061))

(declare-fun m!419087 () Bool)

(assert (=> b!430608 m!419087))

(declare-fun m!419089 () Bool)

(assert (=> b!430608 m!419089))

(declare-fun m!419091 () Bool)

(assert (=> b!430608 m!419091))

(assert (=> b!430608 m!419089))

(assert (=> b!430608 m!419087))

(declare-fun m!419093 () Bool)

(assert (=> b!430608 m!419093))

(declare-fun m!419095 () Bool)

(assert (=> b!430597 m!419095))

(assert (=> b!430598 m!419061))

(declare-fun m!419097 () Bool)

(assert (=> b!430598 m!419097))

(declare-fun m!419099 () Bool)

(assert (=> b!430598 m!419099))

(declare-fun m!419101 () Bool)

(assert (=> b!430598 m!419101))

(assert (=> b!430598 m!419061))

(declare-fun m!419103 () Bool)

(assert (=> b!430598 m!419103))

(declare-fun m!419105 () Bool)

(assert (=> b!430598 m!419105))

(declare-fun m!419107 () Bool)

(assert (=> b!430607 m!419107))

(declare-fun m!419109 () Bool)

(assert (=> b!430600 m!419109))

(declare-fun m!419111 () Bool)

(assert (=> start!39830 m!419111))

(declare-fun m!419113 () Bool)

(assert (=> start!39830 m!419113))

(check-sat b_and!17897 (not b!430608) (not b!430610) (not start!39830) (not b!430604) (not b!430597) (not b!430601) (not b!430606) tp_is_empty!11263 (not b!430596) (not mapNonEmpty!18516) (not b!430593) (not b!430600) (not b!430598) (not b!430599) (not b_lambda!9221) (not b_next!10111) (not b!430607))
(check-sat b_and!17897 (not b_next!10111))
