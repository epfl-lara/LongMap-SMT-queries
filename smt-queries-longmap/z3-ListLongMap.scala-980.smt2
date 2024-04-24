; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21182 () Bool)

(assert start!21182)

(declare-fun b_free!5629 () Bool)

(declare-fun b_next!5629 () Bool)

(assert (=> start!21182 (= b_free!5629 (not b_next!5629))))

(declare-fun tp!19957 () Bool)

(declare-fun b_and!12509 () Bool)

(assert (=> start!21182 (= tp!19957 b_and!12509)))

(declare-fun b!213343 () Bool)

(declare-fun res!104399 () Bool)

(declare-fun e!138757 () Bool)

(assert (=> b!213343 (=> (not res!104399) (not e!138757))))

(declare-datatypes ((array!10185 0))(
  ( (array!10186 (arr!4833 (Array (_ BitVec 32) (_ BitVec 64))) (size!5158 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10185)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10185 (_ BitVec 32)) Bool)

(assert (=> b!213343 (= res!104399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213344 () Bool)

(declare-fun e!138759 () Bool)

(declare-fun e!138760 () Bool)

(assert (=> b!213344 (= e!138759 e!138760)))

(declare-fun res!104397 () Bool)

(assert (=> b!213344 (=> res!104397 e!138760)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!213344 (= res!104397 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6969 0))(
  ( (V!6970 (val!2790 Int)) )
))
(declare-datatypes ((tuple2!4162 0))(
  ( (tuple2!4163 (_1!2092 (_ BitVec 64)) (_2!2092 V!6969)) )
))
(declare-datatypes ((List!3044 0))(
  ( (Nil!3041) (Cons!3040 (h!3682 tuple2!4162) (t!7987 List!3044)) )
))
(declare-datatypes ((ListLongMap!3077 0))(
  ( (ListLongMap!3078 (toList!1554 List!3044)) )
))
(declare-fun lt!110233 () ListLongMap!3077)

(declare-fun lt!110244 () ListLongMap!3077)

(assert (=> b!213344 (= lt!110233 lt!110244)))

(declare-fun lt!110242 () ListLongMap!3077)

(declare-fun lt!110234 () tuple2!4162)

(declare-fun +!583 (ListLongMap!3077 tuple2!4162) ListLongMap!3077)

(assert (=> b!213344 (= lt!110244 (+!583 lt!110242 lt!110234))))

(declare-fun lt!110237 () ListLongMap!3077)

(declare-fun lt!110239 () ListLongMap!3077)

(assert (=> b!213344 (= lt!110237 lt!110239)))

(declare-fun lt!110235 () ListLongMap!3077)

(assert (=> b!213344 (= lt!110239 (+!583 lt!110235 lt!110234))))

(declare-fun lt!110243 () ListLongMap!3077)

(assert (=> b!213344 (= lt!110237 (+!583 lt!110243 lt!110234))))

(declare-fun minValue!615 () V!6969)

(assert (=> b!213344 (= lt!110234 (tuple2!4163 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213345 () Bool)

(declare-fun e!138758 () Bool)

(declare-fun tp_is_empty!5491 () Bool)

(assert (=> b!213345 (= e!138758 tp_is_empty!5491)))

(declare-fun b!213346 () Bool)

(declare-fun res!104395 () Bool)

(assert (=> b!213346 (=> (not res!104395) (not e!138757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213346 (= res!104395 (validKeyInArray!0 k0!843))))

(declare-fun b!213347 () Bool)

(declare-fun res!104398 () Bool)

(assert (=> b!213347 (=> (not res!104398) (not e!138757))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!213347 (= res!104398 (= (select (arr!4833 _keys!825) i!601) k0!843))))

(declare-fun lt!110241 () tuple2!4162)

(declare-fun b!213348 () Bool)

(assert (=> b!213348 (= e!138760 (= (+!583 lt!110233 lt!110241) lt!110237))))

(assert (=> b!213348 (= lt!110239 (+!583 lt!110244 lt!110241))))

(declare-datatypes ((Unit!6456 0))(
  ( (Unit!6457) )
))
(declare-fun lt!110240 () Unit!6456)

(declare-fun v!520 () V!6969)

(declare-fun addCommutativeForDiffKeys!214 (ListLongMap!3077 (_ BitVec 64) V!6969 (_ BitVec 64) V!6969) Unit!6456)

(assert (=> b!213348 (= lt!110240 (addCommutativeForDiffKeys!214 lt!110242 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213349 () Bool)

(assert (=> b!213349 (= e!138757 (not e!138759))))

(declare-fun res!104396 () Bool)

(assert (=> b!213349 (=> res!104396 e!138759)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!213349 (= res!104396 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2402 0))(
  ( (ValueCellFull!2402 (v!4801 V!6969)) (EmptyCell!2402) )
))
(declare-datatypes ((array!10187 0))(
  ( (array!10188 (arr!4834 (Array (_ BitVec 32) ValueCell!2402)) (size!5159 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10187)

(declare-fun zeroValue!615 () V!6969)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1088 (array!10185 array!10187 (_ BitVec 32) (_ BitVec 32) V!6969 V!6969 (_ BitVec 32) Int) ListLongMap!3077)

(assert (=> b!213349 (= lt!110233 (getCurrentListMap!1088 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110238 () array!10187)

(assert (=> b!213349 (= lt!110237 (getCurrentListMap!1088 _keys!825 lt!110238 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213349 (and (= lt!110243 lt!110235) (= lt!110235 lt!110243))))

(assert (=> b!213349 (= lt!110235 (+!583 lt!110242 lt!110241))))

(assert (=> b!213349 (= lt!110241 (tuple2!4163 k0!843 v!520))))

(declare-fun lt!110236 () Unit!6456)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!229 (array!10185 array!10187 (_ BitVec 32) (_ BitVec 32) V!6969 V!6969 (_ BitVec 32) (_ BitVec 64) V!6969 (_ BitVec 32) Int) Unit!6456)

(assert (=> b!213349 (= lt!110236 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!229 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!511 (array!10185 array!10187 (_ BitVec 32) (_ BitVec 32) V!6969 V!6969 (_ BitVec 32) Int) ListLongMap!3077)

(assert (=> b!213349 (= lt!110243 (getCurrentListMapNoExtraKeys!511 _keys!825 lt!110238 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213349 (= lt!110238 (array!10188 (store (arr!4834 _values!649) i!601 (ValueCellFull!2402 v!520)) (size!5159 _values!649)))))

(assert (=> b!213349 (= lt!110242 (getCurrentListMapNoExtraKeys!511 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!104401 () Bool)

(assert (=> start!21182 (=> (not res!104401) (not e!138757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21182 (= res!104401 (validMask!0 mask!1149))))

(assert (=> start!21182 e!138757))

(declare-fun e!138756 () Bool)

(declare-fun array_inv!3171 (array!10187) Bool)

(assert (=> start!21182 (and (array_inv!3171 _values!649) e!138756)))

(assert (=> start!21182 true))

(assert (=> start!21182 tp_is_empty!5491))

(declare-fun array_inv!3172 (array!10185) Bool)

(assert (=> start!21182 (array_inv!3172 _keys!825)))

(assert (=> start!21182 tp!19957))

(declare-fun b!213350 () Bool)

(declare-fun mapRes!9335 () Bool)

(assert (=> b!213350 (= e!138756 (and e!138758 mapRes!9335))))

(declare-fun condMapEmpty!9335 () Bool)

(declare-fun mapDefault!9335 () ValueCell!2402)

(assert (=> b!213350 (= condMapEmpty!9335 (= (arr!4834 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2402)) mapDefault!9335)))))

(declare-fun mapNonEmpty!9335 () Bool)

(declare-fun tp!19958 () Bool)

(declare-fun e!138762 () Bool)

(assert (=> mapNonEmpty!9335 (= mapRes!9335 (and tp!19958 e!138762))))

(declare-fun mapValue!9335 () ValueCell!2402)

(declare-fun mapRest!9335 () (Array (_ BitVec 32) ValueCell!2402))

(declare-fun mapKey!9335 () (_ BitVec 32))

(assert (=> mapNonEmpty!9335 (= (arr!4834 _values!649) (store mapRest!9335 mapKey!9335 mapValue!9335))))

(declare-fun b!213351 () Bool)

(declare-fun res!104402 () Bool)

(assert (=> b!213351 (=> (not res!104402) (not e!138757))))

(assert (=> b!213351 (= res!104402 (and (= (size!5159 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5158 _keys!825) (size!5159 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!213352 () Bool)

(declare-fun res!104400 () Bool)

(assert (=> b!213352 (=> (not res!104400) (not e!138757))))

(assert (=> b!213352 (= res!104400 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5158 _keys!825))))))

(declare-fun b!213353 () Bool)

(assert (=> b!213353 (= e!138762 tp_is_empty!5491)))

(declare-fun b!213354 () Bool)

(declare-fun res!104403 () Bool)

(assert (=> b!213354 (=> (not res!104403) (not e!138757))))

(declare-datatypes ((List!3045 0))(
  ( (Nil!3042) (Cons!3041 (h!3683 (_ BitVec 64)) (t!7988 List!3045)) )
))
(declare-fun arrayNoDuplicates!0 (array!10185 (_ BitVec 32) List!3045) Bool)

(assert (=> b!213354 (= res!104403 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3042))))

(declare-fun mapIsEmpty!9335 () Bool)

(assert (=> mapIsEmpty!9335 mapRes!9335))

(assert (= (and start!21182 res!104401) b!213351))

(assert (= (and b!213351 res!104402) b!213343))

(assert (= (and b!213343 res!104399) b!213354))

(assert (= (and b!213354 res!104403) b!213352))

(assert (= (and b!213352 res!104400) b!213346))

(assert (= (and b!213346 res!104395) b!213347))

(assert (= (and b!213347 res!104398) b!213349))

(assert (= (and b!213349 (not res!104396)) b!213344))

(assert (= (and b!213344 (not res!104397)) b!213348))

(assert (= (and b!213350 condMapEmpty!9335) mapIsEmpty!9335))

(assert (= (and b!213350 (not condMapEmpty!9335)) mapNonEmpty!9335))

(get-info :version)

(assert (= (and mapNonEmpty!9335 ((_ is ValueCellFull!2402) mapValue!9335)) b!213353))

(assert (= (and b!213350 ((_ is ValueCellFull!2402) mapDefault!9335)) b!213345))

(assert (= start!21182 b!213350))

(declare-fun m!241331 () Bool)

(assert (=> b!213343 m!241331))

(declare-fun m!241333 () Bool)

(assert (=> b!213354 m!241333))

(declare-fun m!241335 () Bool)

(assert (=> b!213349 m!241335))

(declare-fun m!241337 () Bool)

(assert (=> b!213349 m!241337))

(declare-fun m!241339 () Bool)

(assert (=> b!213349 m!241339))

(declare-fun m!241341 () Bool)

(assert (=> b!213349 m!241341))

(declare-fun m!241343 () Bool)

(assert (=> b!213349 m!241343))

(declare-fun m!241345 () Bool)

(assert (=> b!213349 m!241345))

(declare-fun m!241347 () Bool)

(assert (=> b!213349 m!241347))

(declare-fun m!241349 () Bool)

(assert (=> mapNonEmpty!9335 m!241349))

(declare-fun m!241351 () Bool)

(assert (=> b!213344 m!241351))

(declare-fun m!241353 () Bool)

(assert (=> b!213344 m!241353))

(declare-fun m!241355 () Bool)

(assert (=> b!213344 m!241355))

(declare-fun m!241357 () Bool)

(assert (=> start!21182 m!241357))

(declare-fun m!241359 () Bool)

(assert (=> start!21182 m!241359))

(declare-fun m!241361 () Bool)

(assert (=> start!21182 m!241361))

(declare-fun m!241363 () Bool)

(assert (=> b!213348 m!241363))

(declare-fun m!241365 () Bool)

(assert (=> b!213348 m!241365))

(declare-fun m!241367 () Bool)

(assert (=> b!213348 m!241367))

(declare-fun m!241369 () Bool)

(assert (=> b!213347 m!241369))

(declare-fun m!241371 () Bool)

(assert (=> b!213346 m!241371))

(check-sat (not b_next!5629) (not b!213354) (not b!213344) b_and!12509 (not b!213343) (not b!213348) (not b!213349) (not start!21182) tp_is_empty!5491 (not mapNonEmpty!9335) (not b!213346))
(check-sat b_and!12509 (not b_next!5629))
