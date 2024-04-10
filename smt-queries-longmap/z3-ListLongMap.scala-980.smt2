; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21180 () Bool)

(assert start!21180)

(declare-fun b_free!5631 () Bool)

(declare-fun b_next!5631 () Bool)

(assert (=> start!21180 (= b_free!5631 (not b_next!5631))))

(declare-fun tp!19964 () Bool)

(declare-fun b_and!12497 () Bool)

(assert (=> start!21180 (= tp!19964 b_and!12497)))

(declare-fun b!213332 () Bool)

(declare-fun res!104405 () Bool)

(declare-fun e!138756 () Bool)

(assert (=> b!213332 (=> (not res!104405) (not e!138756))))

(declare-datatypes ((array!10191 0))(
  ( (array!10192 (arr!4836 (Array (_ BitVec 32) (_ BitVec 64))) (size!5161 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10191)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6971 0))(
  ( (V!6972 (val!2791 Int)) )
))
(declare-datatypes ((ValueCell!2403 0))(
  ( (ValueCellFull!2403 (v!4801 V!6971)) (EmptyCell!2403) )
))
(declare-datatypes ((array!10193 0))(
  ( (array!10194 (arr!4837 (Array (_ BitVec 32) ValueCell!2403)) (size!5162 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10193)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!213332 (= res!104405 (and (= (size!5162 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5161 _keys!825) (size!5162 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!213333 () Bool)

(declare-fun e!138758 () Bool)

(declare-fun tp_is_empty!5493 () Bool)

(assert (=> b!213333 (= e!138758 tp_is_empty!5493)))

(declare-fun b!213334 () Bool)

(declare-fun res!104401 () Bool)

(assert (=> b!213334 (=> (not res!104401) (not e!138756))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!213334 (= res!104401 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5161 _keys!825))))))

(declare-fun b!213335 () Bool)

(declare-fun res!104403 () Bool)

(assert (=> b!213335 (=> (not res!104403) (not e!138756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10191 (_ BitVec 32)) Bool)

(assert (=> b!213335 (= res!104403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213336 () Bool)

(declare-fun res!104408 () Bool)

(assert (=> b!213336 (=> (not res!104408) (not e!138756))))

(declare-datatypes ((List!3114 0))(
  ( (Nil!3111) (Cons!3110 (h!3752 (_ BitVec 64)) (t!8065 List!3114)) )
))
(declare-fun arrayNoDuplicates!0 (array!10191 (_ BitVec 32) List!3114) Bool)

(assert (=> b!213336 (= res!104408 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3111))))

(declare-datatypes ((tuple2!4228 0))(
  ( (tuple2!4229 (_1!2125 (_ BitVec 64)) (_2!2125 V!6971)) )
))
(declare-datatypes ((List!3115 0))(
  ( (Nil!3112) (Cons!3111 (h!3753 tuple2!4228) (t!8066 List!3115)) )
))
(declare-datatypes ((ListLongMap!3141 0))(
  ( (ListLongMap!3142 (toList!1586 List!3115)) )
))
(declare-fun lt!110213 () ListLongMap!3141)

(declare-fun lt!110217 () tuple2!4228)

(declare-fun b!213337 () Bool)

(declare-fun e!138753 () Bool)

(declare-fun lt!110214 () ListLongMap!3141)

(declare-fun +!589 (ListLongMap!3141 tuple2!4228) ListLongMap!3141)

(assert (=> b!213337 (= e!138753 (= (+!589 lt!110214 lt!110217) lt!110213))))

(declare-fun lt!110210 () ListLongMap!3141)

(declare-fun lt!110215 () ListLongMap!3141)

(assert (=> b!213337 (= lt!110210 (+!589 lt!110215 lt!110217))))

(declare-fun lt!110221 () ListLongMap!3141)

(declare-fun minValue!615 () V!6971)

(declare-datatypes ((Unit!6470 0))(
  ( (Unit!6471) )
))
(declare-fun lt!110219 () Unit!6470)

(declare-fun v!520 () V!6971)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!211 (ListLongMap!3141 (_ BitVec 64) V!6971 (_ BitVec 64) V!6971) Unit!6470)

(assert (=> b!213337 (= lt!110219 (addCommutativeForDiffKeys!211 lt!110221 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213338 () Bool)

(declare-fun e!138757 () Bool)

(assert (=> b!213338 (= e!138756 (not e!138757))))

(declare-fun res!104402 () Bool)

(assert (=> b!213338 (=> res!104402 e!138757)))

(assert (=> b!213338 (= res!104402 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6971)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1114 (array!10191 array!10193 (_ BitVec 32) (_ BitVec 32) V!6971 V!6971 (_ BitVec 32) Int) ListLongMap!3141)

(assert (=> b!213338 (= lt!110214 (getCurrentListMap!1114 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110218 () array!10193)

(assert (=> b!213338 (= lt!110213 (getCurrentListMap!1114 _keys!825 lt!110218 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110216 () ListLongMap!3141)

(declare-fun lt!110212 () ListLongMap!3141)

(assert (=> b!213338 (and (= lt!110216 lt!110212) (= lt!110212 lt!110216))))

(assert (=> b!213338 (= lt!110212 (+!589 lt!110221 lt!110217))))

(assert (=> b!213338 (= lt!110217 (tuple2!4229 k0!843 v!520))))

(declare-fun lt!110211 () Unit!6470)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!231 (array!10191 array!10193 (_ BitVec 32) (_ BitVec 32) V!6971 V!6971 (_ BitVec 32) (_ BitVec 64) V!6971 (_ BitVec 32) Int) Unit!6470)

(assert (=> b!213338 (= lt!110211 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!231 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!516 (array!10191 array!10193 (_ BitVec 32) (_ BitVec 32) V!6971 V!6971 (_ BitVec 32) Int) ListLongMap!3141)

(assert (=> b!213338 (= lt!110216 (getCurrentListMapNoExtraKeys!516 _keys!825 lt!110218 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213338 (= lt!110218 (array!10194 (store (arr!4837 _values!649) i!601 (ValueCellFull!2403 v!520)) (size!5162 _values!649)))))

(assert (=> b!213338 (= lt!110221 (getCurrentListMapNoExtraKeys!516 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!9338 () Bool)

(declare-fun mapRes!9338 () Bool)

(assert (=> mapIsEmpty!9338 mapRes!9338))

(declare-fun b!213339 () Bool)

(declare-fun res!104409 () Bool)

(assert (=> b!213339 (=> (not res!104409) (not e!138756))))

(assert (=> b!213339 (= res!104409 (= (select (arr!4836 _keys!825) i!601) k0!843))))

(declare-fun b!213340 () Bool)

(declare-fun e!138755 () Bool)

(assert (=> b!213340 (= e!138755 tp_is_empty!5493)))

(declare-fun b!213341 () Bool)

(declare-fun res!104404 () Bool)

(assert (=> b!213341 (=> (not res!104404) (not e!138756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213341 (= res!104404 (validKeyInArray!0 k0!843))))

(declare-fun res!104406 () Bool)

(assert (=> start!21180 (=> (not res!104406) (not e!138756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21180 (= res!104406 (validMask!0 mask!1149))))

(assert (=> start!21180 e!138756))

(declare-fun e!138754 () Bool)

(declare-fun array_inv!3199 (array!10193) Bool)

(assert (=> start!21180 (and (array_inv!3199 _values!649) e!138754)))

(assert (=> start!21180 true))

(assert (=> start!21180 tp_is_empty!5493))

(declare-fun array_inv!3200 (array!10191) Bool)

(assert (=> start!21180 (array_inv!3200 _keys!825)))

(assert (=> start!21180 tp!19964))

(declare-fun mapNonEmpty!9338 () Bool)

(declare-fun tp!19963 () Bool)

(assert (=> mapNonEmpty!9338 (= mapRes!9338 (and tp!19963 e!138758))))

(declare-fun mapRest!9338 () (Array (_ BitVec 32) ValueCell!2403))

(declare-fun mapValue!9338 () ValueCell!2403)

(declare-fun mapKey!9338 () (_ BitVec 32))

(assert (=> mapNonEmpty!9338 (= (arr!4837 _values!649) (store mapRest!9338 mapKey!9338 mapValue!9338))))

(declare-fun b!213342 () Bool)

(assert (=> b!213342 (= e!138757 e!138753)))

(declare-fun res!104407 () Bool)

(assert (=> b!213342 (=> res!104407 e!138753)))

(assert (=> b!213342 (= res!104407 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!213342 (= lt!110214 lt!110215)))

(declare-fun lt!110220 () tuple2!4228)

(assert (=> b!213342 (= lt!110215 (+!589 lt!110221 lt!110220))))

(assert (=> b!213342 (= lt!110213 lt!110210)))

(assert (=> b!213342 (= lt!110210 (+!589 lt!110212 lt!110220))))

(assert (=> b!213342 (= lt!110213 (+!589 lt!110216 lt!110220))))

(assert (=> b!213342 (= lt!110220 (tuple2!4229 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213343 () Bool)

(assert (=> b!213343 (= e!138754 (and e!138755 mapRes!9338))))

(declare-fun condMapEmpty!9338 () Bool)

(declare-fun mapDefault!9338 () ValueCell!2403)

(assert (=> b!213343 (= condMapEmpty!9338 (= (arr!4837 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2403)) mapDefault!9338)))))

(assert (= (and start!21180 res!104406) b!213332))

(assert (= (and b!213332 res!104405) b!213335))

(assert (= (and b!213335 res!104403) b!213336))

(assert (= (and b!213336 res!104408) b!213334))

(assert (= (and b!213334 res!104401) b!213341))

(assert (= (and b!213341 res!104404) b!213339))

(assert (= (and b!213339 res!104409) b!213338))

(assert (= (and b!213338 (not res!104402)) b!213342))

(assert (= (and b!213342 (not res!104407)) b!213337))

(assert (= (and b!213343 condMapEmpty!9338) mapIsEmpty!9338))

(assert (= (and b!213343 (not condMapEmpty!9338)) mapNonEmpty!9338))

(get-info :version)

(assert (= (and mapNonEmpty!9338 ((_ is ValueCellFull!2403) mapValue!9338)) b!213333))

(assert (= (and b!213343 ((_ is ValueCellFull!2403) mapDefault!9338)) b!213340))

(assert (= start!21180 b!213343))

(declare-fun m!241191 () Bool)

(assert (=> b!213342 m!241191))

(declare-fun m!241193 () Bool)

(assert (=> b!213342 m!241193))

(declare-fun m!241195 () Bool)

(assert (=> b!213342 m!241195))

(declare-fun m!241197 () Bool)

(assert (=> b!213337 m!241197))

(declare-fun m!241199 () Bool)

(assert (=> b!213337 m!241199))

(declare-fun m!241201 () Bool)

(assert (=> b!213337 m!241201))

(declare-fun m!241203 () Bool)

(assert (=> b!213336 m!241203))

(declare-fun m!241205 () Bool)

(assert (=> b!213339 m!241205))

(declare-fun m!241207 () Bool)

(assert (=> mapNonEmpty!9338 m!241207))

(declare-fun m!241209 () Bool)

(assert (=> b!213335 m!241209))

(declare-fun m!241211 () Bool)

(assert (=> start!21180 m!241211))

(declare-fun m!241213 () Bool)

(assert (=> start!21180 m!241213))

(declare-fun m!241215 () Bool)

(assert (=> start!21180 m!241215))

(declare-fun m!241217 () Bool)

(assert (=> b!213341 m!241217))

(declare-fun m!241219 () Bool)

(assert (=> b!213338 m!241219))

(declare-fun m!241221 () Bool)

(assert (=> b!213338 m!241221))

(declare-fun m!241223 () Bool)

(assert (=> b!213338 m!241223))

(declare-fun m!241225 () Bool)

(assert (=> b!213338 m!241225))

(declare-fun m!241227 () Bool)

(assert (=> b!213338 m!241227))

(declare-fun m!241229 () Bool)

(assert (=> b!213338 m!241229))

(declare-fun m!241231 () Bool)

(assert (=> b!213338 m!241231))

(check-sat (not b!213341) b_and!12497 (not b!213342) (not b!213338) tp_is_empty!5493 (not start!21180) (not b_next!5631) (not b!213337) (not mapNonEmpty!9338) (not b!213335) (not b!213336))
(check-sat b_and!12497 (not b_next!5631))
