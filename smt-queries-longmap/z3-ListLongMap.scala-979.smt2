; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21176 () Bool)

(assert start!21176)

(declare-fun b_free!5623 () Bool)

(declare-fun b_next!5623 () Bool)

(assert (=> start!21176 (= b_free!5623 (not b_next!5623))))

(declare-fun tp!19939 () Bool)

(declare-fun b_and!12503 () Bool)

(assert (=> start!21176 (= tp!19939 b_and!12503)))

(declare-fun b!213235 () Bool)

(declare-fun e!138697 () Bool)

(declare-fun e!138695 () Bool)

(assert (=> b!213235 (= e!138697 (not e!138695))))

(declare-fun res!104316 () Bool)

(assert (=> b!213235 (=> res!104316 e!138695)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!213235 (= res!104316 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6961 0))(
  ( (V!6962 (val!2787 Int)) )
))
(declare-datatypes ((ValueCell!2399 0))(
  ( (ValueCellFull!2399 (v!4798 V!6961)) (EmptyCell!2399) )
))
(declare-datatypes ((array!10175 0))(
  ( (array!10176 (arr!4828 (Array (_ BitVec 32) ValueCell!2399)) (size!5153 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10175)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4158 0))(
  ( (tuple2!4159 (_1!2090 (_ BitVec 64)) (_2!2090 V!6961)) )
))
(declare-datatypes ((List!3041 0))(
  ( (Nil!3038) (Cons!3037 (h!3679 tuple2!4158) (t!7984 List!3041)) )
))
(declare-datatypes ((ListLongMap!3073 0))(
  ( (ListLongMap!3074 (toList!1552 List!3041)) )
))
(declare-fun lt!110131 () ListLongMap!3073)

(declare-fun zeroValue!615 () V!6961)

(declare-datatypes ((array!10177 0))(
  ( (array!10178 (arr!4829 (Array (_ BitVec 32) (_ BitVec 64))) (size!5154 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10177)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6961)

(declare-fun getCurrentListMap!1087 (array!10177 array!10175 (_ BitVec 32) (_ BitVec 32) V!6961 V!6961 (_ BitVec 32) Int) ListLongMap!3073)

(assert (=> b!213235 (= lt!110131 (getCurrentListMap!1087 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110125 () ListLongMap!3073)

(declare-fun lt!110126 () array!10175)

(assert (=> b!213235 (= lt!110125 (getCurrentListMap!1087 _keys!825 lt!110126 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110128 () ListLongMap!3073)

(declare-fun lt!110129 () ListLongMap!3073)

(assert (=> b!213235 (and (= lt!110128 lt!110129) (= lt!110129 lt!110128))))

(declare-fun lt!110132 () ListLongMap!3073)

(declare-fun lt!110133 () tuple2!4158)

(declare-fun +!581 (ListLongMap!3073 tuple2!4158) ListLongMap!3073)

(assert (=> b!213235 (= lt!110129 (+!581 lt!110132 lt!110133))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6961)

(assert (=> b!213235 (= lt!110133 (tuple2!4159 k0!843 v!520))))

(declare-datatypes ((Unit!6452 0))(
  ( (Unit!6453) )
))
(declare-fun lt!110130 () Unit!6452)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!228 (array!10177 array!10175 (_ BitVec 32) (_ BitVec 32) V!6961 V!6961 (_ BitVec 32) (_ BitVec 64) V!6961 (_ BitVec 32) Int) Unit!6452)

(assert (=> b!213235 (= lt!110130 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!228 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!510 (array!10177 array!10175 (_ BitVec 32) (_ BitVec 32) V!6961 V!6961 (_ BitVec 32) Int) ListLongMap!3073)

(assert (=> b!213235 (= lt!110128 (getCurrentListMapNoExtraKeys!510 _keys!825 lt!110126 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213235 (= lt!110126 (array!10176 (store (arr!4828 _values!649) i!601 (ValueCellFull!2399 v!520)) (size!5153 _values!649)))))

(assert (=> b!213235 (= lt!110132 (getCurrentListMapNoExtraKeys!510 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9326 () Bool)

(declare-fun mapRes!9326 () Bool)

(declare-fun tp!19940 () Bool)

(declare-fun e!138693 () Bool)

(assert (=> mapNonEmpty!9326 (= mapRes!9326 (and tp!19940 e!138693))))

(declare-fun mapRest!9326 () (Array (_ BitVec 32) ValueCell!2399))

(declare-fun mapValue!9326 () ValueCell!2399)

(declare-fun mapKey!9326 () (_ BitVec 32))

(assert (=> mapNonEmpty!9326 (= (arr!4828 _values!649) (store mapRest!9326 mapKey!9326 mapValue!9326))))

(declare-fun b!213236 () Bool)

(declare-fun res!104320 () Bool)

(assert (=> b!213236 (=> (not res!104320) (not e!138697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213236 (= res!104320 (validKeyInArray!0 k0!843))))

(declare-fun b!213237 () Bool)

(declare-fun tp_is_empty!5485 () Bool)

(assert (=> b!213237 (= e!138693 tp_is_empty!5485)))

(declare-fun res!104319 () Bool)

(assert (=> start!21176 (=> (not res!104319) (not e!138697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21176 (= res!104319 (validMask!0 mask!1149))))

(assert (=> start!21176 e!138697))

(declare-fun e!138698 () Bool)

(declare-fun array_inv!3169 (array!10175) Bool)

(assert (=> start!21176 (and (array_inv!3169 _values!649) e!138698)))

(assert (=> start!21176 true))

(assert (=> start!21176 tp_is_empty!5485))

(declare-fun array_inv!3170 (array!10177) Bool)

(assert (=> start!21176 (array_inv!3170 _keys!825)))

(assert (=> start!21176 tp!19939))

(declare-fun b!213238 () Bool)

(declare-fun res!104315 () Bool)

(assert (=> b!213238 (=> (not res!104315) (not e!138697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10177 (_ BitVec 32)) Bool)

(assert (=> b!213238 (= res!104315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213239 () Bool)

(declare-fun e!138696 () Bool)

(assert (=> b!213239 (= e!138696 (bvslt i!601 (size!5153 _values!649)))))

(declare-fun lt!110136 () ListLongMap!3073)

(declare-fun lt!110135 () ListLongMap!3073)

(assert (=> b!213239 (= lt!110136 (+!581 lt!110135 lt!110133))))

(declare-fun lt!110134 () Unit!6452)

(declare-fun addCommutativeForDiffKeys!212 (ListLongMap!3073 (_ BitVec 64) V!6961 (_ BitVec 64) V!6961) Unit!6452)

(assert (=> b!213239 (= lt!110134 (addCommutativeForDiffKeys!212 lt!110132 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213240 () Bool)

(assert (=> b!213240 (= e!138695 e!138696)))

(declare-fun res!104322 () Bool)

(assert (=> b!213240 (=> res!104322 e!138696)))

(assert (=> b!213240 (= res!104322 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!213240 (= lt!110131 lt!110135)))

(declare-fun lt!110127 () tuple2!4158)

(assert (=> b!213240 (= lt!110135 (+!581 lt!110132 lt!110127))))

(assert (=> b!213240 (= lt!110125 lt!110136)))

(assert (=> b!213240 (= lt!110136 (+!581 lt!110129 lt!110127))))

(assert (=> b!213240 (= lt!110125 (+!581 lt!110128 lt!110127))))

(assert (=> b!213240 (= lt!110127 (tuple2!4159 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213241 () Bool)

(declare-fun e!138694 () Bool)

(assert (=> b!213241 (= e!138694 tp_is_empty!5485)))

(declare-fun b!213242 () Bool)

(declare-fun res!104314 () Bool)

(assert (=> b!213242 (=> (not res!104314) (not e!138697))))

(declare-datatypes ((List!3042 0))(
  ( (Nil!3039) (Cons!3038 (h!3680 (_ BitVec 64)) (t!7985 List!3042)) )
))
(declare-fun arrayNoDuplicates!0 (array!10177 (_ BitVec 32) List!3042) Bool)

(assert (=> b!213242 (= res!104314 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3039))))

(declare-fun b!213243 () Bool)

(declare-fun res!104321 () Bool)

(assert (=> b!213243 (=> (not res!104321) (not e!138697))))

(assert (=> b!213243 (= res!104321 (= (select (arr!4829 _keys!825) i!601) k0!843))))

(declare-fun b!213244 () Bool)

(declare-fun res!104317 () Bool)

(assert (=> b!213244 (=> (not res!104317) (not e!138697))))

(assert (=> b!213244 (= res!104317 (and (= (size!5153 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5154 _keys!825) (size!5153 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!213245 () Bool)

(declare-fun res!104318 () Bool)

(assert (=> b!213245 (=> (not res!104318) (not e!138697))))

(assert (=> b!213245 (= res!104318 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5154 _keys!825))))))

(declare-fun b!213246 () Bool)

(assert (=> b!213246 (= e!138698 (and e!138694 mapRes!9326))))

(declare-fun condMapEmpty!9326 () Bool)

(declare-fun mapDefault!9326 () ValueCell!2399)

(assert (=> b!213246 (= condMapEmpty!9326 (= (arr!4828 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2399)) mapDefault!9326)))))

(declare-fun mapIsEmpty!9326 () Bool)

(assert (=> mapIsEmpty!9326 mapRes!9326))

(assert (= (and start!21176 res!104319) b!213244))

(assert (= (and b!213244 res!104317) b!213238))

(assert (= (and b!213238 res!104315) b!213242))

(assert (= (and b!213242 res!104314) b!213245))

(assert (= (and b!213245 res!104318) b!213236))

(assert (= (and b!213236 res!104320) b!213243))

(assert (= (and b!213243 res!104321) b!213235))

(assert (= (and b!213235 (not res!104316)) b!213240))

(assert (= (and b!213240 (not res!104322)) b!213239))

(assert (= (and b!213246 condMapEmpty!9326) mapIsEmpty!9326))

(assert (= (and b!213246 (not condMapEmpty!9326)) mapNonEmpty!9326))

(get-info :version)

(assert (= (and mapNonEmpty!9326 ((_ is ValueCellFull!2399) mapValue!9326)) b!213237))

(assert (= (and b!213246 ((_ is ValueCellFull!2399) mapDefault!9326)) b!213241))

(assert (= start!21176 b!213246))

(declare-fun m!241211 () Bool)

(assert (=> b!213240 m!241211))

(declare-fun m!241213 () Bool)

(assert (=> b!213240 m!241213))

(declare-fun m!241215 () Bool)

(assert (=> b!213240 m!241215))

(declare-fun m!241217 () Bool)

(assert (=> b!213239 m!241217))

(declare-fun m!241219 () Bool)

(assert (=> b!213239 m!241219))

(declare-fun m!241221 () Bool)

(assert (=> mapNonEmpty!9326 m!241221))

(declare-fun m!241223 () Bool)

(assert (=> b!213235 m!241223))

(declare-fun m!241225 () Bool)

(assert (=> b!213235 m!241225))

(declare-fun m!241227 () Bool)

(assert (=> b!213235 m!241227))

(declare-fun m!241229 () Bool)

(assert (=> b!213235 m!241229))

(declare-fun m!241231 () Bool)

(assert (=> b!213235 m!241231))

(declare-fun m!241233 () Bool)

(assert (=> b!213235 m!241233))

(declare-fun m!241235 () Bool)

(assert (=> b!213235 m!241235))

(declare-fun m!241237 () Bool)

(assert (=> start!21176 m!241237))

(declare-fun m!241239 () Bool)

(assert (=> start!21176 m!241239))

(declare-fun m!241241 () Bool)

(assert (=> start!21176 m!241241))

(declare-fun m!241243 () Bool)

(assert (=> b!213236 m!241243))

(declare-fun m!241245 () Bool)

(assert (=> b!213238 m!241245))

(declare-fun m!241247 () Bool)

(assert (=> b!213243 m!241247))

(declare-fun m!241249 () Bool)

(assert (=> b!213242 m!241249))

(check-sat (not b_next!5623) tp_is_empty!5485 (not b!213236) (not b!213239) (not b!213240) (not mapNonEmpty!9326) b_and!12503 (not b!213235) (not start!21176) (not b!213238) (not b!213242))
(check-sat b_and!12503 (not b_next!5623))
