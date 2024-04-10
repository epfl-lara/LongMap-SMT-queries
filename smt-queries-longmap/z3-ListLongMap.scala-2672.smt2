; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39852 () Bool)

(assert start!39852)

(declare-fun b_free!10119 () Bool)

(declare-fun b_next!10119 () Bool)

(assert (=> start!39852 (= b_free!10119 (not b_next!10119))))

(declare-fun tp!35885 () Bool)

(declare-fun b_and!17897 () Bool)

(assert (=> start!39852 (= tp!35885 b_and!17897)))

(declare-fun b!430890 () Bool)

(declare-fun e!255047 () Bool)

(declare-fun e!255042 () Bool)

(assert (=> b!430890 (= e!255047 e!255042)))

(declare-fun res!253247 () Bool)

(assert (=> b!430890 (=> (not res!253247) (not e!255042))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430890 (= res!253247 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16133 0))(
  ( (V!16134 (val!5680 Int)) )
))
(declare-fun minValue!515 () V!16133)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16133)

(declare-datatypes ((array!26377 0))(
  ( (array!26378 (arr!12638 (Array (_ BitVec 32) (_ BitVec 64))) (size!12990 (_ BitVec 32))) )
))
(declare-fun lt!197184 () array!26377)

(declare-datatypes ((ValueCell!5292 0))(
  ( (ValueCellFull!5292 (v!7927 V!16133)) (EmptyCell!5292) )
))
(declare-datatypes ((array!26379 0))(
  ( (array!26380 (arr!12639 (Array (_ BitVec 32) ValueCell!5292)) (size!12991 (_ BitVec 32))) )
))
(declare-fun lt!197191 () array!26379)

(declare-datatypes ((tuple2!7484 0))(
  ( (tuple2!7485 (_1!3753 (_ BitVec 64)) (_2!3753 V!16133)) )
))
(declare-datatypes ((List!7501 0))(
  ( (Nil!7498) (Cons!7497 (h!8353 tuple2!7484) (t!13069 List!7501)) )
))
(declare-datatypes ((ListLongMap!6397 0))(
  ( (ListLongMap!6398 (toList!3214 List!7501)) )
))
(declare-fun lt!197192 () ListLongMap!6397)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1415 (array!26377 array!26379 (_ BitVec 32) (_ BitVec 32) V!16133 V!16133 (_ BitVec 32) Int) ListLongMap!6397)

(assert (=> b!430890 (= lt!197192 (getCurrentListMapNoExtraKeys!1415 lt!197184 lt!197191 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26379)

(declare-fun v!412 () V!16133)

(assert (=> b!430890 (= lt!197191 (array!26380 (store (arr!12639 _values!549) i!563 (ValueCellFull!5292 v!412)) (size!12991 _values!549)))))

(declare-fun lt!197190 () ListLongMap!6397)

(declare-fun _keys!709 () array!26377)

(assert (=> b!430890 (= lt!197190 (getCurrentListMapNoExtraKeys!1415 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430891 () Bool)

(declare-fun res!253251 () Bool)

(declare-fun e!255046 () Bool)

(assert (=> b!430891 (=> (not res!253251) (not e!255046))))

(declare-datatypes ((List!7502 0))(
  ( (Nil!7499) (Cons!7498 (h!8354 (_ BitVec 64)) (t!13070 List!7502)) )
))
(declare-fun arrayNoDuplicates!0 (array!26377 (_ BitVec 32) List!7502) Bool)

(assert (=> b!430891 (= res!253251 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7499))))

(declare-fun b!430892 () Bool)

(declare-fun res!253252 () Bool)

(assert (=> b!430892 (=> (not res!253252) (not e!255046))))

(assert (=> b!430892 (= res!253252 (or (= (select (arr!12638 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12638 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430893 () Bool)

(declare-fun e!255050 () Bool)

(declare-fun e!255045 () Bool)

(declare-fun mapRes!18528 () Bool)

(assert (=> b!430893 (= e!255050 (and e!255045 mapRes!18528))))

(declare-fun condMapEmpty!18528 () Bool)

(declare-fun mapDefault!18528 () ValueCell!5292)

(assert (=> b!430893 (= condMapEmpty!18528 (= (arr!12639 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5292)) mapDefault!18528)))))

(declare-fun b!430894 () Bool)

(declare-fun res!253250 () Bool)

(assert (=> b!430894 (=> (not res!253250) (not e!255047))))

(assert (=> b!430894 (= res!253250 (arrayNoDuplicates!0 lt!197184 #b00000000000000000000000000000000 Nil!7499))))

(declare-fun b!430895 () Bool)

(declare-datatypes ((Unit!12690 0))(
  ( (Unit!12691) )
))
(declare-fun e!255043 () Unit!12690)

(declare-fun Unit!12692 () Unit!12690)

(assert (=> b!430895 (= e!255043 Unit!12692)))

(declare-fun b!430896 () Bool)

(declare-fun res!253260 () Bool)

(assert (=> b!430896 (=> (not res!253260) (not e!255046))))

(assert (=> b!430896 (= res!253260 (and (= (size!12991 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12990 _keys!709) (size!12991 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430897 () Bool)

(declare-fun Unit!12693 () Unit!12690)

(assert (=> b!430897 (= e!255043 Unit!12693)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!197195 () Unit!12690)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12690)

(assert (=> b!430897 (= lt!197195 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430897 false))

(declare-fun b!430898 () Bool)

(assert (=> b!430898 (= e!255046 e!255047)))

(declare-fun res!253257 () Bool)

(assert (=> b!430898 (=> (not res!253257) (not e!255047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26377 (_ BitVec 32)) Bool)

(assert (=> b!430898 (= res!253257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197184 mask!1025))))

(assert (=> b!430898 (= lt!197184 (array!26378 (store (arr!12638 _keys!709) i!563 k0!794) (size!12990 _keys!709)))))

(declare-fun b!430899 () Bool)

(declare-fun e!255049 () Bool)

(assert (=> b!430899 (= e!255049 true)))

(declare-fun lt!197187 () tuple2!7484)

(declare-fun lt!197185 () tuple2!7484)

(declare-fun lt!197182 () ListLongMap!6397)

(declare-fun lt!197181 () ListLongMap!6397)

(declare-fun +!1363 (ListLongMap!6397 tuple2!7484) ListLongMap!6397)

(assert (=> b!430899 (= lt!197181 (+!1363 (+!1363 lt!197182 lt!197187) lt!197185))))

(declare-fun lt!197189 () V!16133)

(declare-fun lt!197188 () Unit!12690)

(declare-fun addCommutativeForDiffKeys!358 (ListLongMap!6397 (_ BitVec 64) V!16133 (_ BitVec 64) V!16133) Unit!12690)

(assert (=> b!430899 (= lt!197188 (addCommutativeForDiffKeys!358 lt!197182 k0!794 v!412 (select (arr!12638 _keys!709) from!863) lt!197189))))

(declare-fun mapNonEmpty!18528 () Bool)

(declare-fun tp!35886 () Bool)

(declare-fun e!255048 () Bool)

(assert (=> mapNonEmpty!18528 (= mapRes!18528 (and tp!35886 e!255048))))

(declare-fun mapValue!18528 () ValueCell!5292)

(declare-fun mapKey!18528 () (_ BitVec 32))

(declare-fun mapRest!18528 () (Array (_ BitVec 32) ValueCell!5292))

(assert (=> mapNonEmpty!18528 (= (arr!12639 _values!549) (store mapRest!18528 mapKey!18528 mapValue!18528))))

(declare-fun b!430900 () Bool)

(declare-fun e!255044 () Bool)

(assert (=> b!430900 (= e!255044 e!255049)))

(declare-fun res!253256 () Bool)

(assert (=> b!430900 (=> res!253256 e!255049)))

(assert (=> b!430900 (= res!253256 (= k0!794 (select (arr!12638 _keys!709) from!863)))))

(assert (=> b!430900 (not (= (select (arr!12638 _keys!709) from!863) k0!794))))

(declare-fun lt!197186 () Unit!12690)

(assert (=> b!430900 (= lt!197186 e!255043)))

(declare-fun c!55514 () Bool)

(assert (=> b!430900 (= c!55514 (= (select (arr!12638 _keys!709) from!863) k0!794))))

(assert (=> b!430900 (= lt!197192 lt!197181)))

(declare-fun lt!197193 () ListLongMap!6397)

(assert (=> b!430900 (= lt!197181 (+!1363 lt!197193 lt!197187))))

(assert (=> b!430900 (= lt!197187 (tuple2!7485 (select (arr!12638 _keys!709) from!863) lt!197189))))

(declare-fun get!6273 (ValueCell!5292 V!16133) V!16133)

(declare-fun dynLambda!786 (Int (_ BitVec 64)) V!16133)

(assert (=> b!430900 (= lt!197189 (get!6273 (select (arr!12639 _values!549) from!863) (dynLambda!786 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430901 () Bool)

(declare-fun res!253255 () Bool)

(assert (=> b!430901 (=> (not res!253255) (not e!255046))))

(assert (=> b!430901 (= res!253255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430902 () Bool)

(assert (=> b!430902 (= e!255042 (not e!255044))))

(declare-fun res!253248 () Bool)

(assert (=> b!430902 (=> res!253248 e!255044)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430902 (= res!253248 (not (validKeyInArray!0 (select (arr!12638 _keys!709) from!863))))))

(declare-fun lt!197183 () ListLongMap!6397)

(assert (=> b!430902 (= lt!197183 lt!197193)))

(assert (=> b!430902 (= lt!197193 (+!1363 lt!197182 lt!197185))))

(assert (=> b!430902 (= lt!197183 (getCurrentListMapNoExtraKeys!1415 lt!197184 lt!197191 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430902 (= lt!197185 (tuple2!7485 k0!794 v!412))))

(assert (=> b!430902 (= lt!197182 (getCurrentListMapNoExtraKeys!1415 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197194 () Unit!12690)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!551 (array!26377 array!26379 (_ BitVec 32) (_ BitVec 32) V!16133 V!16133 (_ BitVec 32) (_ BitVec 64) V!16133 (_ BitVec 32) Int) Unit!12690)

(assert (=> b!430902 (= lt!197194 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!551 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430903 () Bool)

(declare-fun res!253254 () Bool)

(assert (=> b!430903 (=> (not res!253254) (not e!255047))))

(assert (=> b!430903 (= res!253254 (bvsle from!863 i!563))))

(declare-fun b!430904 () Bool)

(declare-fun res!253253 () Bool)

(assert (=> b!430904 (=> (not res!253253) (not e!255046))))

(assert (=> b!430904 (= res!253253 (validKeyInArray!0 k0!794))))

(declare-fun res!253258 () Bool)

(assert (=> start!39852 (=> (not res!253258) (not e!255046))))

(assert (=> start!39852 (= res!253258 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12990 _keys!709))))))

(assert (=> start!39852 e!255046))

(declare-fun tp_is_empty!11271 () Bool)

(assert (=> start!39852 tp_is_empty!11271))

(assert (=> start!39852 tp!35885))

(assert (=> start!39852 true))

(declare-fun array_inv!9200 (array!26379) Bool)

(assert (=> start!39852 (and (array_inv!9200 _values!549) e!255050)))

(declare-fun array_inv!9201 (array!26377) Bool)

(assert (=> start!39852 (array_inv!9201 _keys!709)))

(declare-fun mapIsEmpty!18528 () Bool)

(assert (=> mapIsEmpty!18528 mapRes!18528))

(declare-fun b!430905 () Bool)

(assert (=> b!430905 (= e!255045 tp_is_empty!11271)))

(declare-fun b!430906 () Bool)

(declare-fun res!253249 () Bool)

(assert (=> b!430906 (=> (not res!253249) (not e!255046))))

(assert (=> b!430906 (= res!253249 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12990 _keys!709))))))

(declare-fun b!430907 () Bool)

(declare-fun res!253259 () Bool)

(assert (=> b!430907 (=> (not res!253259) (not e!255046))))

(declare-fun arrayContainsKey!0 (array!26377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430907 (= res!253259 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430908 () Bool)

(declare-fun res!253246 () Bool)

(assert (=> b!430908 (=> (not res!253246) (not e!255046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430908 (= res!253246 (validMask!0 mask!1025))))

(declare-fun b!430909 () Bool)

(assert (=> b!430909 (= e!255048 tp_is_empty!11271)))

(assert (= (and start!39852 res!253258) b!430908))

(assert (= (and b!430908 res!253246) b!430896))

(assert (= (and b!430896 res!253260) b!430901))

(assert (= (and b!430901 res!253255) b!430891))

(assert (= (and b!430891 res!253251) b!430906))

(assert (= (and b!430906 res!253249) b!430904))

(assert (= (and b!430904 res!253253) b!430892))

(assert (= (and b!430892 res!253252) b!430907))

(assert (= (and b!430907 res!253259) b!430898))

(assert (= (and b!430898 res!253257) b!430894))

(assert (= (and b!430894 res!253250) b!430903))

(assert (= (and b!430903 res!253254) b!430890))

(assert (= (and b!430890 res!253247) b!430902))

(assert (= (and b!430902 (not res!253248)) b!430900))

(assert (= (and b!430900 c!55514) b!430897))

(assert (= (and b!430900 (not c!55514)) b!430895))

(assert (= (and b!430900 (not res!253256)) b!430899))

(assert (= (and b!430893 condMapEmpty!18528) mapIsEmpty!18528))

(assert (= (and b!430893 (not condMapEmpty!18528)) mapNonEmpty!18528))

(get-info :version)

(assert (= (and mapNonEmpty!18528 ((_ is ValueCellFull!5292) mapValue!18528)) b!430909))

(assert (= (and b!430893 ((_ is ValueCellFull!5292) mapDefault!18528)) b!430905))

(assert (= start!39852 b!430893))

(declare-fun b_lambda!9207 () Bool)

(assert (=> (not b_lambda!9207) (not b!430900)))

(declare-fun t!13068 () Bool)

(declare-fun tb!3525 () Bool)

(assert (=> (and start!39852 (= defaultEntry!557 defaultEntry!557) t!13068) tb!3525))

(declare-fun result!6577 () Bool)

(assert (=> tb!3525 (= result!6577 tp_is_empty!11271)))

(assert (=> b!430900 t!13068))

(declare-fun b_and!17899 () Bool)

(assert (= b_and!17897 (and (=> t!13068 result!6577) b_and!17899)))

(declare-fun m!419071 () Bool)

(assert (=> b!430908 m!419071))

(declare-fun m!419073 () Bool)

(assert (=> b!430900 m!419073))

(declare-fun m!419075 () Bool)

(assert (=> b!430900 m!419075))

(declare-fun m!419077 () Bool)

(assert (=> b!430900 m!419077))

(declare-fun m!419079 () Bool)

(assert (=> b!430900 m!419079))

(assert (=> b!430900 m!419079))

(assert (=> b!430900 m!419077))

(declare-fun m!419081 () Bool)

(assert (=> b!430900 m!419081))

(declare-fun m!419083 () Bool)

(assert (=> b!430899 m!419083))

(assert (=> b!430899 m!419083))

(declare-fun m!419085 () Bool)

(assert (=> b!430899 m!419085))

(assert (=> b!430899 m!419073))

(assert (=> b!430899 m!419073))

(declare-fun m!419087 () Bool)

(assert (=> b!430899 m!419087))

(declare-fun m!419089 () Bool)

(assert (=> b!430897 m!419089))

(declare-fun m!419091 () Bool)

(assert (=> start!39852 m!419091))

(declare-fun m!419093 () Bool)

(assert (=> start!39852 m!419093))

(declare-fun m!419095 () Bool)

(assert (=> b!430891 m!419095))

(declare-fun m!419097 () Bool)

(assert (=> mapNonEmpty!18528 m!419097))

(declare-fun m!419099 () Bool)

(assert (=> b!430904 m!419099))

(declare-fun m!419101 () Bool)

(assert (=> b!430894 m!419101))

(assert (=> b!430902 m!419073))

(declare-fun m!419103 () Bool)

(assert (=> b!430902 m!419103))

(declare-fun m!419105 () Bool)

(assert (=> b!430902 m!419105))

(declare-fun m!419107 () Bool)

(assert (=> b!430902 m!419107))

(assert (=> b!430902 m!419073))

(declare-fun m!419109 () Bool)

(assert (=> b!430902 m!419109))

(declare-fun m!419111 () Bool)

(assert (=> b!430902 m!419111))

(declare-fun m!419113 () Bool)

(assert (=> b!430907 m!419113))

(declare-fun m!419115 () Bool)

(assert (=> b!430901 m!419115))

(declare-fun m!419117 () Bool)

(assert (=> b!430898 m!419117))

(declare-fun m!419119 () Bool)

(assert (=> b!430898 m!419119))

(declare-fun m!419121 () Bool)

(assert (=> b!430890 m!419121))

(declare-fun m!419123 () Bool)

(assert (=> b!430890 m!419123))

(declare-fun m!419125 () Bool)

(assert (=> b!430890 m!419125))

(declare-fun m!419127 () Bool)

(assert (=> b!430892 m!419127))

(check-sat tp_is_empty!11271 (not b!430890) (not b!430898) (not b!430904) (not start!39852) (not b!430899) (not b!430907) b_and!17899 (not b!430902) (not b!430891) (not b_lambda!9207) (not mapNonEmpty!18528) (not b_next!10119) (not b!430901) (not b!430900) (not b!430894) (not b!430897) (not b!430908))
(check-sat b_and!17899 (not b_next!10119))
