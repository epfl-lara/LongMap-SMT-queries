; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41168 () Bool)

(assert start!41168)

(declare-fun b_free!11037 () Bool)

(declare-fun b_next!11037 () Bool)

(assert (=> start!41168 (= b_free!11037 (not b_next!11037))))

(declare-fun tp!38946 () Bool)

(declare-fun b_and!19313 () Bool)

(assert (=> start!41168 (= tp!38946 b_and!19313)))

(declare-fun b!459937 () Bool)

(declare-fun e!268384 () Bool)

(declare-fun e!268389 () Bool)

(assert (=> b!459937 (= e!268384 e!268389)))

(declare-fun res!274934 () Bool)

(assert (=> b!459937 (=> (not res!274934) (not e!268389))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459937 (= res!274934 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17605 0))(
  ( (V!17606 (val!6232 Int)) )
))
(declare-fun minValue!515 () V!17605)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!28551 0))(
  ( (array!28552 (arr!13716 (Array (_ BitVec 32) (_ BitVec 64))) (size!14068 (_ BitVec 32))) )
))
(declare-fun lt!208145 () array!28551)

(declare-fun zeroValue!515 () V!17605)

(declare-datatypes ((tuple2!8218 0))(
  ( (tuple2!8219 (_1!4120 (_ BitVec 64)) (_2!4120 V!17605)) )
))
(declare-datatypes ((List!8290 0))(
  ( (Nil!8287) (Cons!8286 (h!9142 tuple2!8218) (t!14206 List!8290)) )
))
(declare-datatypes ((ListLongMap!7131 0))(
  ( (ListLongMap!7132 (toList!3581 List!8290)) )
))
(declare-fun lt!208140 () ListLongMap!7131)

(declare-datatypes ((ValueCell!5844 0))(
  ( (ValueCellFull!5844 (v!8510 V!17605)) (EmptyCell!5844) )
))
(declare-datatypes ((array!28553 0))(
  ( (array!28554 (arr!13717 (Array (_ BitVec 32) ValueCell!5844)) (size!14069 (_ BitVec 32))) )
))
(declare-fun lt!208151 () array!28553)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1761 (array!28551 array!28553 (_ BitVec 32) (_ BitVec 32) V!17605 V!17605 (_ BitVec 32) Int) ListLongMap!7131)

(assert (=> b!459937 (= lt!208140 (getCurrentListMapNoExtraKeys!1761 lt!208145 lt!208151 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28553)

(declare-fun v!412 () V!17605)

(assert (=> b!459937 (= lt!208151 (array!28554 (store (arr!13717 _values!549) i!563 (ValueCellFull!5844 v!412)) (size!14069 _values!549)))))

(declare-fun lt!208148 () ListLongMap!7131)

(declare-fun _keys!709 () array!28551)

(assert (=> b!459937 (= lt!208148 (getCurrentListMapNoExtraKeys!1761 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459938 () Bool)

(declare-fun e!268383 () Bool)

(declare-fun e!268388 () Bool)

(assert (=> b!459938 (= e!268383 e!268388)))

(declare-fun res!274935 () Bool)

(assert (=> b!459938 (=> res!274935 e!268388)))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!459938 (= res!274935 (= k0!794 (select (arr!13716 _keys!709) from!863)))))

(assert (=> b!459938 (not (= (select (arr!13716 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!13377 0))(
  ( (Unit!13378) )
))
(declare-fun lt!208138 () Unit!13377)

(declare-fun e!268385 () Unit!13377)

(assert (=> b!459938 (= lt!208138 e!268385)))

(declare-fun c!56504 () Bool)

(assert (=> b!459938 (= c!56504 (= (select (arr!13716 _keys!709) from!863) k0!794))))

(declare-fun lt!208141 () ListLongMap!7131)

(assert (=> b!459938 (= lt!208140 lt!208141)))

(declare-fun lt!208137 () ListLongMap!7131)

(declare-fun lt!208143 () tuple2!8218)

(declare-fun +!1617 (ListLongMap!7131 tuple2!8218) ListLongMap!7131)

(assert (=> b!459938 (= lt!208141 (+!1617 lt!208137 lt!208143))))

(declare-fun lt!208147 () V!17605)

(assert (=> b!459938 (= lt!208143 (tuple2!8219 (select (arr!13716 _keys!709) from!863) lt!208147))))

(declare-fun get!6769 (ValueCell!5844 V!17605) V!17605)

(declare-fun dynLambda!903 (Int (_ BitVec 64)) V!17605)

(assert (=> b!459938 (= lt!208147 (get!6769 (select (arr!13717 _values!549) from!863) (dynLambda!903 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459939 () Bool)

(declare-fun res!274933 () Bool)

(declare-fun e!268387 () Bool)

(assert (=> b!459939 (=> (not res!274933) (not e!268387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459939 (= res!274933 (validMask!0 mask!1025))))

(declare-fun b!459940 () Bool)

(declare-fun Unit!13379 () Unit!13377)

(assert (=> b!459940 (= e!268385 Unit!13379)))

(declare-fun lt!208144 () Unit!13377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28551 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13377)

(assert (=> b!459940 (= lt!208144 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459940 false))

(declare-fun b!459941 () Bool)

(declare-fun e!268381 () Bool)

(declare-fun tp_is_empty!12375 () Bool)

(assert (=> b!459941 (= e!268381 tp_is_empty!12375)))

(declare-fun b!459942 () Bool)

(declare-fun res!274925 () Bool)

(assert (=> b!459942 (=> (not res!274925) (not e!268387))))

(assert (=> b!459942 (= res!274925 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14068 _keys!709))))))

(declare-fun b!459943 () Bool)

(assert (=> b!459943 (= e!268387 e!268384)))

(declare-fun res!274936 () Bool)

(assert (=> b!459943 (=> (not res!274936) (not e!268384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28551 (_ BitVec 32)) Bool)

(assert (=> b!459943 (= res!274936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208145 mask!1025))))

(assert (=> b!459943 (= lt!208145 (array!28552 (store (arr!13716 _keys!709) i!563 k0!794) (size!14068 _keys!709)))))

(declare-fun b!459944 () Bool)

(declare-fun res!274930 () Bool)

(assert (=> b!459944 (=> (not res!274930) (not e!268387))))

(declare-fun arrayContainsKey!0 (array!28551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459944 (= res!274930 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!274931 () Bool)

(assert (=> start!41168 (=> (not res!274931) (not e!268387))))

(assert (=> start!41168 (= res!274931 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14068 _keys!709))))))

(assert (=> start!41168 e!268387))

(assert (=> start!41168 tp_is_empty!12375))

(assert (=> start!41168 tp!38946))

(assert (=> start!41168 true))

(declare-fun e!268380 () Bool)

(declare-fun array_inv!9920 (array!28553) Bool)

(assert (=> start!41168 (and (array_inv!9920 _values!549) e!268380)))

(declare-fun array_inv!9921 (array!28551) Bool)

(assert (=> start!41168 (array_inv!9921 _keys!709)))

(declare-fun b!459945 () Bool)

(assert (=> b!459945 (= e!268389 (not e!268383))))

(declare-fun res!274923 () Bool)

(assert (=> b!459945 (=> res!274923 e!268383)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459945 (= res!274923 (not (validKeyInArray!0 (select (arr!13716 _keys!709) from!863))))))

(declare-fun lt!208142 () ListLongMap!7131)

(assert (=> b!459945 (= lt!208142 lt!208137)))

(declare-fun lt!208139 () ListLongMap!7131)

(declare-fun lt!208149 () tuple2!8218)

(assert (=> b!459945 (= lt!208137 (+!1617 lt!208139 lt!208149))))

(assert (=> b!459945 (= lt!208142 (getCurrentListMapNoExtraKeys!1761 lt!208145 lt!208151 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459945 (= lt!208149 (tuple2!8219 k0!794 v!412))))

(assert (=> b!459945 (= lt!208139 (getCurrentListMapNoExtraKeys!1761 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208146 () Unit!13377)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!773 (array!28551 array!28553 (_ BitVec 32) (_ BitVec 32) V!17605 V!17605 (_ BitVec 32) (_ BitVec 64) V!17605 (_ BitVec 32) Int) Unit!13377)

(assert (=> b!459945 (= lt!208146 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!773 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459946 () Bool)

(declare-fun res!274924 () Bool)

(assert (=> b!459946 (=> (not res!274924) (not e!268387))))

(assert (=> b!459946 (= res!274924 (and (= (size!14069 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14068 _keys!709) (size!14069 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459947 () Bool)

(declare-fun e!268382 () Bool)

(assert (=> b!459947 (= e!268382 tp_is_empty!12375)))

(declare-fun b!459948 () Bool)

(declare-fun mapRes!20212 () Bool)

(assert (=> b!459948 (= e!268380 (and e!268382 mapRes!20212))))

(declare-fun condMapEmpty!20212 () Bool)

(declare-fun mapDefault!20212 () ValueCell!5844)

(assert (=> b!459948 (= condMapEmpty!20212 (= (arr!13717 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5844)) mapDefault!20212)))))

(declare-fun b!459949 () Bool)

(declare-fun res!274926 () Bool)

(assert (=> b!459949 (=> (not res!274926) (not e!268387))))

(assert (=> b!459949 (= res!274926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459950 () Bool)

(declare-fun res!274928 () Bool)

(assert (=> b!459950 (=> (not res!274928) (not e!268387))))

(assert (=> b!459950 (= res!274928 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!20212 () Bool)

(declare-fun tp!38947 () Bool)

(assert (=> mapNonEmpty!20212 (= mapRes!20212 (and tp!38947 e!268381))))

(declare-fun mapValue!20212 () ValueCell!5844)

(declare-fun mapKey!20212 () (_ BitVec 32))

(declare-fun mapRest!20212 () (Array (_ BitVec 32) ValueCell!5844))

(assert (=> mapNonEmpty!20212 (= (arr!13717 _values!549) (store mapRest!20212 mapKey!20212 mapValue!20212))))

(declare-fun b!459951 () Bool)

(declare-fun res!274927 () Bool)

(assert (=> b!459951 (=> (not res!274927) (not e!268387))))

(assert (=> b!459951 (= res!274927 (or (= (select (arr!13716 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13716 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459952 () Bool)

(declare-fun Unit!13380 () Unit!13377)

(assert (=> b!459952 (= e!268385 Unit!13380)))

(declare-fun b!459953 () Bool)

(declare-fun res!274922 () Bool)

(assert (=> b!459953 (=> (not res!274922) (not e!268384))))

(declare-datatypes ((List!8291 0))(
  ( (Nil!8288) (Cons!8287 (h!9143 (_ BitVec 64)) (t!14207 List!8291)) )
))
(declare-fun arrayNoDuplicates!0 (array!28551 (_ BitVec 32) List!8291) Bool)

(assert (=> b!459953 (= res!274922 (arrayNoDuplicates!0 lt!208145 #b00000000000000000000000000000000 Nil!8288))))

(declare-fun b!459954 () Bool)

(assert (=> b!459954 (= e!268388 true)))

(assert (=> b!459954 (= lt!208141 (+!1617 (+!1617 lt!208139 lt!208143) lt!208149))))

(declare-fun lt!208150 () Unit!13377)

(declare-fun addCommutativeForDiffKeys!428 (ListLongMap!7131 (_ BitVec 64) V!17605 (_ BitVec 64) V!17605) Unit!13377)

(assert (=> b!459954 (= lt!208150 (addCommutativeForDiffKeys!428 lt!208139 k0!794 v!412 (select (arr!13716 _keys!709) from!863) lt!208147))))

(declare-fun b!459955 () Bool)

(declare-fun res!274932 () Bool)

(assert (=> b!459955 (=> (not res!274932) (not e!268387))))

(assert (=> b!459955 (= res!274932 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8288))))

(declare-fun b!459956 () Bool)

(declare-fun res!274929 () Bool)

(assert (=> b!459956 (=> (not res!274929) (not e!268384))))

(assert (=> b!459956 (= res!274929 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!20212 () Bool)

(assert (=> mapIsEmpty!20212 mapRes!20212))

(assert (= (and start!41168 res!274931) b!459939))

(assert (= (and b!459939 res!274933) b!459946))

(assert (= (and b!459946 res!274924) b!459949))

(assert (= (and b!459949 res!274926) b!459955))

(assert (= (and b!459955 res!274932) b!459942))

(assert (= (and b!459942 res!274925) b!459950))

(assert (= (and b!459950 res!274928) b!459951))

(assert (= (and b!459951 res!274927) b!459944))

(assert (= (and b!459944 res!274930) b!459943))

(assert (= (and b!459943 res!274936) b!459953))

(assert (= (and b!459953 res!274922) b!459956))

(assert (= (and b!459956 res!274929) b!459937))

(assert (= (and b!459937 res!274934) b!459945))

(assert (= (and b!459945 (not res!274923)) b!459938))

(assert (= (and b!459938 c!56504) b!459940))

(assert (= (and b!459938 (not c!56504)) b!459952))

(assert (= (and b!459938 (not res!274935)) b!459954))

(assert (= (and b!459948 condMapEmpty!20212) mapIsEmpty!20212))

(assert (= (and b!459948 (not condMapEmpty!20212)) mapNonEmpty!20212))

(get-info :version)

(assert (= (and mapNonEmpty!20212 ((_ is ValueCellFull!5844) mapValue!20212)) b!459941))

(assert (= (and b!459948 ((_ is ValueCellFull!5844) mapDefault!20212)) b!459947))

(assert (= start!41168 b!459948))

(declare-fun b_lambda!9871 () Bool)

(assert (=> (not b_lambda!9871) (not b!459938)))

(declare-fun t!14205 () Bool)

(declare-fun tb!3873 () Bool)

(assert (=> (and start!41168 (= defaultEntry!557 defaultEntry!557) t!14205) tb!3873))

(declare-fun result!7291 () Bool)

(assert (=> tb!3873 (= result!7291 tp_is_empty!12375)))

(assert (=> b!459938 t!14205))

(declare-fun b_and!19315 () Bool)

(assert (= b_and!19313 (and (=> t!14205 result!7291) b_and!19315)))

(declare-fun m!443161 () Bool)

(assert (=> b!459955 m!443161))

(declare-fun m!443163 () Bool)

(assert (=> b!459954 m!443163))

(assert (=> b!459954 m!443163))

(declare-fun m!443165 () Bool)

(assert (=> b!459954 m!443165))

(declare-fun m!443167 () Bool)

(assert (=> b!459954 m!443167))

(assert (=> b!459954 m!443167))

(declare-fun m!443169 () Bool)

(assert (=> b!459954 m!443169))

(declare-fun m!443171 () Bool)

(assert (=> mapNonEmpty!20212 m!443171))

(assert (=> b!459938 m!443167))

(declare-fun m!443173 () Bool)

(assert (=> b!459938 m!443173))

(declare-fun m!443175 () Bool)

(assert (=> b!459938 m!443175))

(declare-fun m!443177 () Bool)

(assert (=> b!459938 m!443177))

(assert (=> b!459938 m!443175))

(assert (=> b!459938 m!443173))

(declare-fun m!443179 () Bool)

(assert (=> b!459938 m!443179))

(declare-fun m!443181 () Bool)

(assert (=> b!459939 m!443181))

(declare-fun m!443183 () Bool)

(assert (=> b!459951 m!443183))

(declare-fun m!443185 () Bool)

(assert (=> b!459953 m!443185))

(declare-fun m!443187 () Bool)

(assert (=> b!459940 m!443187))

(declare-fun m!443189 () Bool)

(assert (=> b!459950 m!443189))

(declare-fun m!443191 () Bool)

(assert (=> b!459937 m!443191))

(declare-fun m!443193 () Bool)

(assert (=> b!459937 m!443193))

(declare-fun m!443195 () Bool)

(assert (=> b!459937 m!443195))

(assert (=> b!459945 m!443167))

(declare-fun m!443197 () Bool)

(assert (=> b!459945 m!443197))

(declare-fun m!443199 () Bool)

(assert (=> b!459945 m!443199))

(declare-fun m!443201 () Bool)

(assert (=> b!459945 m!443201))

(assert (=> b!459945 m!443167))

(declare-fun m!443203 () Bool)

(assert (=> b!459945 m!443203))

(declare-fun m!443205 () Bool)

(assert (=> b!459945 m!443205))

(declare-fun m!443207 () Bool)

(assert (=> b!459943 m!443207))

(declare-fun m!443209 () Bool)

(assert (=> b!459943 m!443209))

(declare-fun m!443211 () Bool)

(assert (=> b!459944 m!443211))

(declare-fun m!443213 () Bool)

(assert (=> b!459949 m!443213))

(declare-fun m!443215 () Bool)

(assert (=> start!41168 m!443215))

(declare-fun m!443217 () Bool)

(assert (=> start!41168 m!443217))

(check-sat tp_is_empty!12375 (not b!459945) (not b_lambda!9871) (not b_next!11037) (not b!459944) (not mapNonEmpty!20212) (not b!459954) b_and!19315 (not b!459943) (not b!459940) (not b!459950) (not b!459937) (not b!459938) (not b!459939) (not b!459949) (not b!459955) (not b!459953) (not start!41168))
(check-sat b_and!19315 (not b_next!11037))
