; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39968 () Bool)

(assert start!39968)

(declare-fun b_free!10249 () Bool)

(declare-fun b_next!10249 () Bool)

(assert (=> start!39968 (= b_free!10249 (not b_next!10249))))

(declare-fun tp!36275 () Bool)

(declare-fun b_and!18171 () Bool)

(assert (=> start!39968 (= tp!36275 b_and!18171)))

(declare-fun b!434871 () Bool)

(declare-fun res!256169 () Bool)

(declare-fun e!256969 () Bool)

(assert (=> b!434871 (=> (not res!256169) (not e!256969))))

(declare-datatypes ((array!26638 0))(
  ( (array!26639 (arr!12768 (Array (_ BitVec 32) (_ BitVec 64))) (size!13120 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26638)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434871 (= res!256169 (or (= (select (arr!12768 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12768 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434872 () Bool)

(declare-fun res!256179 () Bool)

(assert (=> b!434872 (=> (not res!256179) (not e!256969))))

(declare-datatypes ((List!7499 0))(
  ( (Nil!7496) (Cons!7495 (h!8351 (_ BitVec 64)) (t!13189 List!7499)) )
))
(declare-fun arrayNoDuplicates!0 (array!26638 (_ BitVec 32) List!7499) Bool)

(assert (=> b!434872 (= res!256179 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7496))))

(declare-fun b!434873 () Bool)

(declare-fun e!256967 () Bool)

(declare-fun e!256962 () Bool)

(assert (=> b!434873 (= e!256967 (not e!256962))))

(declare-fun res!256181 () Bool)

(assert (=> b!434873 (=> res!256181 e!256962)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434873 (= res!256181 (not (validKeyInArray!0 (select (arr!12768 _keys!709) from!863))))))

(declare-datatypes ((V!16307 0))(
  ( (V!16308 (val!5745 Int)) )
))
(declare-datatypes ((tuple2!7508 0))(
  ( (tuple2!7509 (_1!3765 (_ BitVec 64)) (_2!3765 V!16307)) )
))
(declare-datatypes ((List!7500 0))(
  ( (Nil!7497) (Cons!7496 (h!8352 tuple2!7508) (t!13190 List!7500)) )
))
(declare-datatypes ((ListLongMap!6423 0))(
  ( (ListLongMap!6424 (toList!3227 List!7500)) )
))
(declare-fun lt!200137 () ListLongMap!6423)

(declare-fun lt!200131 () ListLongMap!6423)

(assert (=> b!434873 (= lt!200137 lt!200131)))

(declare-fun lt!200132 () ListLongMap!6423)

(declare-fun lt!200136 () tuple2!7508)

(declare-fun +!1431 (ListLongMap!6423 tuple2!7508) ListLongMap!6423)

(assert (=> b!434873 (= lt!200131 (+!1431 lt!200132 lt!200136))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16307)

(declare-datatypes ((ValueCell!5357 0))(
  ( (ValueCellFull!5357 (v!7993 V!16307)) (EmptyCell!5357) )
))
(declare-datatypes ((array!26640 0))(
  ( (array!26641 (arr!12769 (Array (_ BitVec 32) ValueCell!5357)) (size!13121 (_ BitVec 32))) )
))
(declare-fun lt!200128 () array!26640)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!16307)

(declare-fun lt!200125 () array!26638)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1462 (array!26638 array!26640 (_ BitVec 32) (_ BitVec 32) V!16307 V!16307 (_ BitVec 32) Int) ListLongMap!6423)

(assert (=> b!434873 (= lt!200137 (getCurrentListMapNoExtraKeys!1462 lt!200125 lt!200128 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16307)

(assert (=> b!434873 (= lt!200136 (tuple2!7509 k0!794 v!412))))

(declare-fun _values!549 () array!26640)

(assert (=> b!434873 (= lt!200132 (getCurrentListMapNoExtraKeys!1462 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12904 0))(
  ( (Unit!12905) )
))
(declare-fun lt!200133 () Unit!12904)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!595 (array!26638 array!26640 (_ BitVec 32) (_ BitVec 32) V!16307 V!16307 (_ BitVec 32) (_ BitVec 64) V!16307 (_ BitVec 32) Int) Unit!12904)

(assert (=> b!434873 (= lt!200133 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!595 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18723 () Bool)

(declare-fun mapRes!18723 () Bool)

(declare-fun tp!36276 () Bool)

(declare-fun e!256964 () Bool)

(assert (=> mapNonEmpty!18723 (= mapRes!18723 (and tp!36276 e!256964))))

(declare-fun mapValue!18723 () ValueCell!5357)

(declare-fun mapRest!18723 () (Array (_ BitVec 32) ValueCell!5357))

(declare-fun mapKey!18723 () (_ BitVec 32))

(assert (=> mapNonEmpty!18723 (= (arr!12769 _values!549) (store mapRest!18723 mapKey!18723 mapValue!18723))))

(declare-fun b!434874 () Bool)

(declare-fun e!256960 () Bool)

(declare-fun e!256963 () Bool)

(assert (=> b!434874 (= e!256960 (and e!256963 mapRes!18723))))

(declare-fun condMapEmpty!18723 () Bool)

(declare-fun mapDefault!18723 () ValueCell!5357)

(assert (=> b!434874 (= condMapEmpty!18723 (= (arr!12769 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5357)) mapDefault!18723)))))

(declare-fun b!434875 () Bool)

(declare-fun res!256171 () Bool)

(declare-fun e!256968 () Bool)

(assert (=> b!434875 (=> (not res!256171) (not e!256968))))

(assert (=> b!434875 (= res!256171 (bvsle from!863 i!563))))

(declare-fun b!434876 () Bool)

(declare-fun res!256172 () Bool)

(assert (=> b!434876 (=> (not res!256172) (not e!256969))))

(assert (=> b!434876 (= res!256172 (validKeyInArray!0 k0!794))))

(declare-fun b!434877 () Bool)

(declare-fun e!256961 () Bool)

(assert (=> b!434877 (= e!256962 e!256961)))

(declare-fun res!256178 () Bool)

(assert (=> b!434877 (=> res!256178 e!256961)))

(assert (=> b!434877 (= res!256178 (= k0!794 (select (arr!12768 _keys!709) from!863)))))

(assert (=> b!434877 (not (= (select (arr!12768 _keys!709) from!863) k0!794))))

(declare-fun lt!200129 () Unit!12904)

(declare-fun e!256966 () Unit!12904)

(assert (=> b!434877 (= lt!200129 e!256966)))

(declare-fun c!55686 () Bool)

(assert (=> b!434877 (= c!55686 (= (select (arr!12768 _keys!709) from!863) k0!794))))

(declare-fun lt!200135 () ListLongMap!6423)

(declare-fun lt!200130 () ListLongMap!6423)

(assert (=> b!434877 (= lt!200135 lt!200130)))

(declare-fun lt!200134 () tuple2!7508)

(assert (=> b!434877 (= lt!200130 (+!1431 lt!200131 lt!200134))))

(declare-fun lt!200139 () V!16307)

(assert (=> b!434877 (= lt!200134 (tuple2!7509 (select (arr!12768 _keys!709) from!863) lt!200139))))

(declare-fun get!6371 (ValueCell!5357 V!16307) V!16307)

(declare-fun dynLambda!834 (Int (_ BitVec 64)) V!16307)

(assert (=> b!434877 (= lt!200139 (get!6371 (select (arr!12769 _values!549) from!863) (dynLambda!834 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434878 () Bool)

(declare-fun res!256176 () Bool)

(assert (=> b!434878 (=> (not res!256176) (not e!256969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26638 (_ BitVec 32)) Bool)

(assert (=> b!434878 (= res!256176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434879 () Bool)

(declare-fun res!256175 () Bool)

(assert (=> b!434879 (=> (not res!256175) (not e!256969))))

(declare-fun arrayContainsKey!0 (array!26638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434879 (= res!256175 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434880 () Bool)

(declare-fun tp_is_empty!11401 () Bool)

(assert (=> b!434880 (= e!256963 tp_is_empty!11401)))

(declare-fun b!434881 () Bool)

(declare-fun res!256177 () Bool)

(assert (=> b!434881 (=> (not res!256177) (not e!256969))))

(assert (=> b!434881 (= res!256177 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13120 _keys!709))))))

(declare-fun b!434882 () Bool)

(assert (=> b!434882 (= e!256968 e!256967)))

(declare-fun res!256174 () Bool)

(assert (=> b!434882 (=> (not res!256174) (not e!256967))))

(assert (=> b!434882 (= res!256174 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!434882 (= lt!200135 (getCurrentListMapNoExtraKeys!1462 lt!200125 lt!200128 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434882 (= lt!200128 (array!26641 (store (arr!12769 _values!549) i!563 (ValueCellFull!5357 v!412)) (size!13121 _values!549)))))

(declare-fun lt!200127 () ListLongMap!6423)

(assert (=> b!434882 (= lt!200127 (getCurrentListMapNoExtraKeys!1462 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434883 () Bool)

(declare-fun res!256182 () Bool)

(assert (=> b!434883 (=> (not res!256182) (not e!256969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434883 (= res!256182 (validMask!0 mask!1025))))

(declare-fun b!434884 () Bool)

(declare-fun Unit!12906 () Unit!12904)

(assert (=> b!434884 (= e!256966 Unit!12906)))

(declare-fun lt!200138 () Unit!12904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26638 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12904)

(assert (=> b!434884 (= lt!200138 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434884 false))

(declare-fun b!434885 () Bool)

(assert (=> b!434885 (= e!256969 e!256968)))

(declare-fun res!256180 () Bool)

(assert (=> b!434885 (=> (not res!256180) (not e!256968))))

(assert (=> b!434885 (= res!256180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200125 mask!1025))))

(assert (=> b!434885 (= lt!200125 (array!26639 (store (arr!12768 _keys!709) i!563 k0!794) (size!13120 _keys!709)))))

(declare-fun mapIsEmpty!18723 () Bool)

(assert (=> mapIsEmpty!18723 mapRes!18723))

(declare-fun b!434886 () Bool)

(declare-fun Unit!12907 () Unit!12904)

(assert (=> b!434886 (= e!256966 Unit!12907)))

(declare-fun b!434887 () Bool)

(declare-fun res!256168 () Bool)

(assert (=> b!434887 (=> (not res!256168) (not e!256969))))

(assert (=> b!434887 (= res!256168 (and (= (size!13121 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13120 _keys!709) (size!13121 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434888 () Bool)

(assert (=> b!434888 (= e!256961 true)))

(assert (=> b!434888 (= lt!200130 (+!1431 (+!1431 lt!200132 lt!200134) lt!200136))))

(declare-fun lt!200126 () Unit!12904)

(declare-fun addCommutativeForDiffKeys!401 (ListLongMap!6423 (_ BitVec 64) V!16307 (_ BitVec 64) V!16307) Unit!12904)

(assert (=> b!434888 (= lt!200126 (addCommutativeForDiffKeys!401 lt!200132 k0!794 v!412 (select (arr!12768 _keys!709) from!863) lt!200139))))

(declare-fun b!434889 () Bool)

(declare-fun res!256173 () Bool)

(assert (=> b!434889 (=> (not res!256173) (not e!256968))))

(assert (=> b!434889 (= res!256173 (arrayNoDuplicates!0 lt!200125 #b00000000000000000000000000000000 Nil!7496))))

(declare-fun b!434890 () Bool)

(assert (=> b!434890 (= e!256964 tp_is_empty!11401)))

(declare-fun res!256170 () Bool)

(assert (=> start!39968 (=> (not res!256170) (not e!256969))))

(assert (=> start!39968 (= res!256170 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13120 _keys!709))))))

(assert (=> start!39968 e!256969))

(assert (=> start!39968 tp_is_empty!11401))

(assert (=> start!39968 tp!36275))

(assert (=> start!39968 true))

(declare-fun array_inv!9342 (array!26640) Bool)

(assert (=> start!39968 (and (array_inv!9342 _values!549) e!256960)))

(declare-fun array_inv!9343 (array!26638) Bool)

(assert (=> start!39968 (array_inv!9343 _keys!709)))

(assert (= (and start!39968 res!256170) b!434883))

(assert (= (and b!434883 res!256182) b!434887))

(assert (= (and b!434887 res!256168) b!434878))

(assert (= (and b!434878 res!256176) b!434872))

(assert (= (and b!434872 res!256179) b!434881))

(assert (= (and b!434881 res!256177) b!434876))

(assert (= (and b!434876 res!256172) b!434871))

(assert (= (and b!434871 res!256169) b!434879))

(assert (= (and b!434879 res!256175) b!434885))

(assert (= (and b!434885 res!256180) b!434889))

(assert (= (and b!434889 res!256173) b!434875))

(assert (= (and b!434875 res!256171) b!434882))

(assert (= (and b!434882 res!256174) b!434873))

(assert (= (and b!434873 (not res!256181)) b!434877))

(assert (= (and b!434877 c!55686) b!434884))

(assert (= (and b!434877 (not c!55686)) b!434886))

(assert (= (and b!434877 (not res!256178)) b!434888))

(assert (= (and b!434874 condMapEmpty!18723) mapIsEmpty!18723))

(assert (= (and b!434874 (not condMapEmpty!18723)) mapNonEmpty!18723))

(get-info :version)

(assert (= (and mapNonEmpty!18723 ((_ is ValueCellFull!5357) mapValue!18723)) b!434890))

(assert (= (and b!434874 ((_ is ValueCellFull!5357) mapDefault!18723)) b!434880))

(assert (= start!39968 b!434874))

(declare-fun b_lambda!9359 () Bool)

(assert (=> (not b_lambda!9359) (not b!434877)))

(declare-fun t!13188 () Bool)

(declare-fun tb!3647 () Bool)

(assert (=> (and start!39968 (= defaultEntry!557 defaultEntry!557) t!13188) tb!3647))

(declare-fun result!6829 () Bool)

(assert (=> tb!3647 (= result!6829 tp_is_empty!11401)))

(assert (=> b!434877 t!13188))

(declare-fun b_and!18173 () Bool)

(assert (= b_and!18171 (and (=> t!13188 result!6829) b_and!18173)))

(declare-fun m!423059 () Bool)

(assert (=> b!434885 m!423059))

(declare-fun m!423061 () Bool)

(assert (=> b!434885 m!423061))

(declare-fun m!423063 () Bool)

(assert (=> start!39968 m!423063))

(declare-fun m!423065 () Bool)

(assert (=> start!39968 m!423065))

(declare-fun m!423067 () Bool)

(assert (=> b!434879 m!423067))

(declare-fun m!423069 () Bool)

(assert (=> b!434884 m!423069))

(declare-fun m!423071 () Bool)

(assert (=> b!434872 m!423071))

(declare-fun m!423073 () Bool)

(assert (=> b!434877 m!423073))

(declare-fun m!423075 () Bool)

(assert (=> b!434877 m!423075))

(declare-fun m!423077 () Bool)

(assert (=> b!434877 m!423077))

(declare-fun m!423079 () Bool)

(assert (=> b!434877 m!423079))

(assert (=> b!434877 m!423077))

(assert (=> b!434877 m!423075))

(declare-fun m!423081 () Bool)

(assert (=> b!434877 m!423081))

(declare-fun m!423083 () Bool)

(assert (=> b!434876 m!423083))

(declare-fun m!423085 () Bool)

(assert (=> b!434871 m!423085))

(declare-fun m!423087 () Bool)

(assert (=> b!434889 m!423087))

(declare-fun m!423089 () Bool)

(assert (=> mapNonEmpty!18723 m!423089))

(declare-fun m!423091 () Bool)

(assert (=> b!434882 m!423091))

(declare-fun m!423093 () Bool)

(assert (=> b!434882 m!423093))

(declare-fun m!423095 () Bool)

(assert (=> b!434882 m!423095))

(declare-fun m!423097 () Bool)

(assert (=> b!434878 m!423097))

(assert (=> b!434873 m!423073))

(declare-fun m!423099 () Bool)

(assert (=> b!434873 m!423099))

(declare-fun m!423101 () Bool)

(assert (=> b!434873 m!423101))

(declare-fun m!423103 () Bool)

(assert (=> b!434873 m!423103))

(assert (=> b!434873 m!423073))

(declare-fun m!423105 () Bool)

(assert (=> b!434873 m!423105))

(declare-fun m!423107 () Bool)

(assert (=> b!434873 m!423107))

(declare-fun m!423109 () Bool)

(assert (=> b!434883 m!423109))

(declare-fun m!423111 () Bool)

(assert (=> b!434888 m!423111))

(assert (=> b!434888 m!423111))

(declare-fun m!423113 () Bool)

(assert (=> b!434888 m!423113))

(assert (=> b!434888 m!423073))

(assert (=> b!434888 m!423073))

(declare-fun m!423115 () Bool)

(assert (=> b!434888 m!423115))

(check-sat (not b!434888) (not b!434885) (not b!434882) (not b_next!10249) (not b!434872) b_and!18173 (not b!434878) (not b!434873) (not b!434883) (not b!434876) (not start!39968) (not b!434889) tp_is_empty!11401 (not b_lambda!9359) (not b!434877) (not b!434884) (not b!434879) (not mapNonEmpty!18723))
(check-sat b_and!18173 (not b_next!10249))
