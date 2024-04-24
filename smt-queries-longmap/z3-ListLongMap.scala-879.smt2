; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20374 () Bool)

(assert start!20374)

(declare-fun b_free!5029 () Bool)

(declare-fun b_next!5029 () Bool)

(assert (=> start!20374 (= b_free!5029 (not b_next!5029))))

(declare-fun tp!18119 () Bool)

(declare-fun b_and!11789 () Bool)

(assert (=> start!20374 (= tp!18119 b_and!11789)))

(declare-fun b!201197 () Bool)

(declare-fun e!131879 () Bool)

(declare-fun e!131881 () Bool)

(assert (=> b!201197 (= e!131879 e!131881)))

(declare-fun res!96061 () Bool)

(assert (=> b!201197 (=> res!96061 e!131881)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!201197 (= res!96061 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6161 0))(
  ( (V!6162 (val!2487 Int)) )
))
(declare-datatypes ((tuple2!3700 0))(
  ( (tuple2!3701 (_1!1861 (_ BitVec 64)) (_2!1861 V!6161)) )
))
(declare-datatypes ((List!2612 0))(
  ( (Nil!2609) (Cons!2608 (h!3250 tuple2!3700) (t!7535 List!2612)) )
))
(declare-datatypes ((ListLongMap!2615 0))(
  ( (ListLongMap!2616 (toList!1323 List!2612)) )
))
(declare-fun lt!100054 () ListLongMap!2615)

(declare-fun lt!100055 () ListLongMap!2615)

(assert (=> b!201197 (= lt!100054 lt!100055)))

(declare-fun lt!100053 () ListLongMap!2615)

(declare-fun lt!100048 () tuple2!3700)

(declare-fun +!377 (ListLongMap!2615 tuple2!3700) ListLongMap!2615)

(assert (=> b!201197 (= lt!100055 (+!377 lt!100053 lt!100048))))

(declare-fun v!520 () V!6161)

(declare-fun lt!100052 () ListLongMap!2615)

(declare-datatypes ((Unit!6038 0))(
  ( (Unit!6039) )
))
(declare-fun lt!100044 () Unit!6038)

(declare-fun zeroValue!615 () V!6161)

(declare-fun addCommutativeForDiffKeys!100 (ListLongMap!2615 (_ BitVec 64) V!6161 (_ BitVec 64) V!6161) Unit!6038)

(assert (=> b!201197 (= lt!100044 (addCommutativeForDiffKeys!100 lt!100052 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100046 () ListLongMap!2615)

(declare-fun lt!100045 () tuple2!3700)

(assert (=> b!201197 (= lt!100046 (+!377 lt!100054 lt!100045))))

(declare-fun lt!100049 () ListLongMap!2615)

(declare-fun lt!100056 () tuple2!3700)

(assert (=> b!201197 (= lt!100054 (+!377 lt!100049 lt!100056))))

(declare-fun lt!100057 () ListLongMap!2615)

(declare-fun lt!100058 () ListLongMap!2615)

(assert (=> b!201197 (= lt!100057 lt!100058)))

(assert (=> b!201197 (= lt!100058 (+!377 lt!100053 lt!100045))))

(assert (=> b!201197 (= lt!100053 (+!377 lt!100052 lt!100056))))

(declare-fun lt!100050 () ListLongMap!2615)

(assert (=> b!201197 (= lt!100046 (+!377 (+!377 lt!100050 lt!100056) lt!100045))))

(declare-fun minValue!615 () V!6161)

(assert (=> b!201197 (= lt!100045 (tuple2!3701 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201197 (= lt!100056 (tuple2!3701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201198 () Bool)

(declare-fun e!131880 () Bool)

(declare-fun tp_is_empty!4885 () Bool)

(assert (=> b!201198 (= e!131880 tp_is_empty!4885)))

(declare-fun b!201199 () Bool)

(declare-fun res!96057 () Bool)

(declare-fun e!131878 () Bool)

(assert (=> b!201199 (=> (not res!96057) (not e!131878))))

(declare-datatypes ((array!8993 0))(
  ( (array!8994 (arr!4247 (Array (_ BitVec 32) (_ BitVec 64))) (size!4572 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8993)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201199 (= res!96057 (= (select (arr!4247 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8396 () Bool)

(declare-fun mapRes!8396 () Bool)

(assert (=> mapIsEmpty!8396 mapRes!8396))

(declare-fun b!201200 () Bool)

(assert (=> b!201200 (= e!131878 (not e!131879))))

(declare-fun res!96063 () Bool)

(assert (=> b!201200 (=> res!96063 e!131879)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201200 (= res!96063 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2099 0))(
  ( (ValueCellFull!2099 (v!4458 V!6161)) (EmptyCell!2099) )
))
(declare-datatypes ((array!8995 0))(
  ( (array!8996 (arr!4248 (Array (_ BitVec 32) ValueCell!2099)) (size!4573 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8995)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!915 (array!8993 array!8995 (_ BitVec 32) (_ BitVec 32) V!6161 V!6161 (_ BitVec 32) Int) ListLongMap!2615)

(assert (=> b!201200 (= lt!100057 (getCurrentListMap!915 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100043 () array!8995)

(assert (=> b!201200 (= lt!100046 (getCurrentListMap!915 _keys!825 lt!100043 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201200 (and (= lt!100050 lt!100049) (= lt!100049 lt!100050))))

(assert (=> b!201200 (= lt!100049 (+!377 lt!100052 lt!100048))))

(assert (=> b!201200 (= lt!100048 (tuple2!3701 k0!843 v!520))))

(declare-fun lt!100047 () Unit!6038)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!51 (array!8993 array!8995 (_ BitVec 32) (_ BitVec 32) V!6161 V!6161 (_ BitVec 32) (_ BitVec 64) V!6161 (_ BitVec 32) Int) Unit!6038)

(assert (=> b!201200 (= lt!100047 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!51 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!308 (array!8993 array!8995 (_ BitVec 32) (_ BitVec 32) V!6161 V!6161 (_ BitVec 32) Int) ListLongMap!2615)

(assert (=> b!201200 (= lt!100050 (getCurrentListMapNoExtraKeys!308 _keys!825 lt!100043 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201200 (= lt!100043 (array!8996 (store (arr!4248 _values!649) i!601 (ValueCellFull!2099 v!520)) (size!4573 _values!649)))))

(assert (=> b!201200 (= lt!100052 (getCurrentListMapNoExtraKeys!308 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201201 () Bool)

(declare-fun res!96060 () Bool)

(assert (=> b!201201 (=> (not res!96060) (not e!131878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8993 (_ BitVec 32)) Bool)

(assert (=> b!201201 (= res!96060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8396 () Bool)

(declare-fun tp!18118 () Bool)

(assert (=> mapNonEmpty!8396 (= mapRes!8396 (and tp!18118 e!131880))))

(declare-fun mapKey!8396 () (_ BitVec 32))

(declare-fun mapRest!8396 () (Array (_ BitVec 32) ValueCell!2099))

(declare-fun mapValue!8396 () ValueCell!2099)

(assert (=> mapNonEmpty!8396 (= (arr!4248 _values!649) (store mapRest!8396 mapKey!8396 mapValue!8396))))

(declare-fun b!201202 () Bool)

(declare-fun res!96059 () Bool)

(assert (=> b!201202 (=> (not res!96059) (not e!131878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201202 (= res!96059 (validKeyInArray!0 k0!843))))

(declare-fun b!201203 () Bool)

(declare-fun res!96062 () Bool)

(assert (=> b!201203 (=> (not res!96062) (not e!131878))))

(assert (=> b!201203 (= res!96062 (and (= (size!4573 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4572 _keys!825) (size!4573 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201204 () Bool)

(declare-fun res!96058 () Bool)

(assert (=> b!201204 (=> (not res!96058) (not e!131878))))

(assert (=> b!201204 (= res!96058 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4572 _keys!825))))))

(declare-fun res!96056 () Bool)

(assert (=> start!20374 (=> (not res!96056) (not e!131878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20374 (= res!96056 (validMask!0 mask!1149))))

(assert (=> start!20374 e!131878))

(declare-fun e!131876 () Bool)

(declare-fun array_inv!2769 (array!8995) Bool)

(assert (=> start!20374 (and (array_inv!2769 _values!649) e!131876)))

(assert (=> start!20374 true))

(assert (=> start!20374 tp_is_empty!4885))

(declare-fun array_inv!2770 (array!8993) Bool)

(assert (=> start!20374 (array_inv!2770 _keys!825)))

(assert (=> start!20374 tp!18119))

(declare-fun b!201205 () Bool)

(declare-fun e!131882 () Bool)

(assert (=> b!201205 (= e!131882 tp_is_empty!4885)))

(declare-fun b!201206 () Bool)

(assert (=> b!201206 (= e!131881 true)))

(assert (=> b!201206 (= (+!377 lt!100055 lt!100045) (+!377 lt!100058 lt!100048))))

(declare-fun lt!100051 () Unit!6038)

(assert (=> b!201206 (= lt!100051 (addCommutativeForDiffKeys!100 lt!100053 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201207 () Bool)

(assert (=> b!201207 (= e!131876 (and e!131882 mapRes!8396))))

(declare-fun condMapEmpty!8396 () Bool)

(declare-fun mapDefault!8396 () ValueCell!2099)

(assert (=> b!201207 (= condMapEmpty!8396 (= (arr!4248 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2099)) mapDefault!8396)))))

(declare-fun b!201208 () Bool)

(declare-fun res!96064 () Bool)

(assert (=> b!201208 (=> (not res!96064) (not e!131878))))

(declare-datatypes ((List!2613 0))(
  ( (Nil!2610) (Cons!2609 (h!3251 (_ BitVec 64)) (t!7536 List!2613)) )
))
(declare-fun arrayNoDuplicates!0 (array!8993 (_ BitVec 32) List!2613) Bool)

(assert (=> b!201208 (= res!96064 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2610))))

(assert (= (and start!20374 res!96056) b!201203))

(assert (= (and b!201203 res!96062) b!201201))

(assert (= (and b!201201 res!96060) b!201208))

(assert (= (and b!201208 res!96064) b!201204))

(assert (= (and b!201204 res!96058) b!201202))

(assert (= (and b!201202 res!96059) b!201199))

(assert (= (and b!201199 res!96057) b!201200))

(assert (= (and b!201200 (not res!96063)) b!201197))

(assert (= (and b!201197 (not res!96061)) b!201206))

(assert (= (and b!201207 condMapEmpty!8396) mapIsEmpty!8396))

(assert (= (and b!201207 (not condMapEmpty!8396)) mapNonEmpty!8396))

(get-info :version)

(assert (= (and mapNonEmpty!8396 ((_ is ValueCellFull!2099) mapValue!8396)) b!201198))

(assert (= (and b!201207 ((_ is ValueCellFull!2099) mapDefault!8396)) b!201205))

(assert (= start!20374 b!201207))

(declare-fun m!228129 () Bool)

(assert (=> b!201197 m!228129))

(declare-fun m!228131 () Bool)

(assert (=> b!201197 m!228131))

(declare-fun m!228133 () Bool)

(assert (=> b!201197 m!228133))

(assert (=> b!201197 m!228131))

(declare-fun m!228135 () Bool)

(assert (=> b!201197 m!228135))

(declare-fun m!228137 () Bool)

(assert (=> b!201197 m!228137))

(declare-fun m!228139 () Bool)

(assert (=> b!201197 m!228139))

(declare-fun m!228141 () Bool)

(assert (=> b!201197 m!228141))

(declare-fun m!228143 () Bool)

(assert (=> b!201197 m!228143))

(declare-fun m!228145 () Bool)

(assert (=> b!201208 m!228145))

(declare-fun m!228147 () Bool)

(assert (=> start!20374 m!228147))

(declare-fun m!228149 () Bool)

(assert (=> start!20374 m!228149))

(declare-fun m!228151 () Bool)

(assert (=> start!20374 m!228151))

(declare-fun m!228153 () Bool)

(assert (=> b!201202 m!228153))

(declare-fun m!228155 () Bool)

(assert (=> mapNonEmpty!8396 m!228155))

(declare-fun m!228157 () Bool)

(assert (=> b!201206 m!228157))

(declare-fun m!228159 () Bool)

(assert (=> b!201206 m!228159))

(declare-fun m!228161 () Bool)

(assert (=> b!201206 m!228161))

(declare-fun m!228163 () Bool)

(assert (=> b!201201 m!228163))

(declare-fun m!228165 () Bool)

(assert (=> b!201200 m!228165))

(declare-fun m!228167 () Bool)

(assert (=> b!201200 m!228167))

(declare-fun m!228169 () Bool)

(assert (=> b!201200 m!228169))

(declare-fun m!228171 () Bool)

(assert (=> b!201200 m!228171))

(declare-fun m!228173 () Bool)

(assert (=> b!201200 m!228173))

(declare-fun m!228175 () Bool)

(assert (=> b!201200 m!228175))

(declare-fun m!228177 () Bool)

(assert (=> b!201200 m!228177))

(declare-fun m!228179 () Bool)

(assert (=> b!201199 m!228179))

(check-sat (not b!201206) (not b!201200) (not mapNonEmpty!8396) tp_is_empty!4885 (not b!201208) (not b!201201) (not start!20374) (not b!201197) (not b!201202) b_and!11789 (not b_next!5029))
(check-sat b_and!11789 (not b_next!5029))
