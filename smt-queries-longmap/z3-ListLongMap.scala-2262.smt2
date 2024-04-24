; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37020 () Bool)

(assert start!37020)

(declare-fun b_free!8161 () Bool)

(declare-fun b_next!8161 () Bool)

(assert (=> start!37020 (= b_free!8161 (not b_next!8161))))

(declare-fun tp!29198 () Bool)

(declare-fun b_and!15417 () Bool)

(assert (=> start!37020 (= tp!29198 b_and!15417)))

(declare-fun b!372130 () Bool)

(declare-fun e!227029 () Bool)

(declare-fun e!227031 () Bool)

(assert (=> b!372130 (= e!227029 e!227031)))

(declare-fun res!209361 () Bool)

(assert (=> b!372130 (=> (not res!209361) (not e!227031))))

(declare-datatypes ((array!21540 0))(
  ( (array!21541 (arr!10238 (Array (_ BitVec 32) (_ BitVec 64))) (size!10590 (_ BitVec 32))) )
))
(declare-fun lt!170629 () array!21540)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21540 (_ BitVec 32)) Bool)

(assert (=> b!372130 (= res!209361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170629 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21540)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372130 (= lt!170629 (array!21541 (store (arr!10238 _keys!658) i!548 k0!778) (size!10590 _keys!658)))))

(declare-fun b!372131 () Bool)

(declare-fun e!227026 () Bool)

(declare-fun tp_is_empty!8809 () Bool)

(assert (=> b!372131 (= e!227026 tp_is_empty!8809)))

(declare-fun b!372132 () Bool)

(declare-fun e!227028 () Bool)

(assert (=> b!372132 (= e!227028 tp_is_empty!8809)))

(declare-fun res!209357 () Bool)

(assert (=> start!37020 (=> (not res!209357) (not e!227029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37020 (= res!209357 (validMask!0 mask!970))))

(assert (=> start!37020 e!227029))

(declare-datatypes ((V!12851 0))(
  ( (V!12852 (val!4449 Int)) )
))
(declare-datatypes ((ValueCell!4061 0))(
  ( (ValueCellFull!4061 (v!6647 V!12851)) (EmptyCell!4061) )
))
(declare-datatypes ((array!21542 0))(
  ( (array!21543 (arr!10239 (Array (_ BitVec 32) ValueCell!4061)) (size!10591 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21542)

(declare-fun e!227030 () Bool)

(declare-fun array_inv!7588 (array!21542) Bool)

(assert (=> start!37020 (and (array_inv!7588 _values!506) e!227030)))

(assert (=> start!37020 tp!29198))

(assert (=> start!37020 true))

(assert (=> start!37020 tp_is_empty!8809))

(declare-fun array_inv!7589 (array!21540) Bool)

(assert (=> start!37020 (array_inv!7589 _keys!658)))

(declare-fun b!372133 () Bool)

(declare-fun res!209358 () Bool)

(assert (=> b!372133 (=> (not res!209358) (not e!227029))))

(assert (=> b!372133 (= res!209358 (or (= (select (arr!10238 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10238 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372134 () Bool)

(declare-fun res!209365 () Bool)

(assert (=> b!372134 (=> (not res!209365) (not e!227029))))

(assert (=> b!372134 (= res!209365 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10590 _keys!658))))))

(declare-fun b!372135 () Bool)

(declare-fun res!209362 () Bool)

(assert (=> b!372135 (=> (not res!209362) (not e!227029))))

(declare-datatypes ((List!5642 0))(
  ( (Nil!5639) (Cons!5638 (h!6494 (_ BitVec 64)) (t!10784 List!5642)) )
))
(declare-fun arrayNoDuplicates!0 (array!21540 (_ BitVec 32) List!5642) Bool)

(assert (=> b!372135 (= res!209362 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5639))))

(declare-fun b!372136 () Bool)

(declare-fun res!209359 () Bool)

(assert (=> b!372136 (=> (not res!209359) (not e!227031))))

(assert (=> b!372136 (= res!209359 (arrayNoDuplicates!0 lt!170629 #b00000000000000000000000000000000 Nil!5639))))

(declare-fun b!372137 () Bool)

(declare-fun res!209364 () Bool)

(assert (=> b!372137 (=> (not res!209364) (not e!227029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372137 (= res!209364 (validKeyInArray!0 k0!778))))

(declare-fun b!372138 () Bool)

(declare-fun res!209363 () Bool)

(assert (=> b!372138 (=> (not res!209363) (not e!227029))))

(assert (=> b!372138 (= res!209363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14778 () Bool)

(declare-fun mapRes!14778 () Bool)

(assert (=> mapIsEmpty!14778 mapRes!14778))

(declare-fun b!372139 () Bool)

(assert (=> b!372139 (= e!227030 (and e!227028 mapRes!14778))))

(declare-fun condMapEmpty!14778 () Bool)

(declare-fun mapDefault!14778 () ValueCell!4061)

(assert (=> b!372139 (= condMapEmpty!14778 (= (arr!10239 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4061)) mapDefault!14778)))))

(declare-fun b!372140 () Bool)

(assert (=> b!372140 (= e!227031 (not true))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12851)

(declare-datatypes ((tuple2!5800 0))(
  ( (tuple2!5801 (_1!2911 (_ BitVec 64)) (_2!2911 V!12851)) )
))
(declare-datatypes ((List!5643 0))(
  ( (Nil!5640) (Cons!5639 (h!6495 tuple2!5800) (t!10785 List!5643)) )
))
(declare-datatypes ((ListLongMap!4715 0))(
  ( (ListLongMap!4716 (toList!2373 List!5643)) )
))
(declare-fun lt!170634 () ListLongMap!4715)

(declare-fun lt!170631 () array!21542)

(declare-fun minValue!472 () V!12851)

(declare-fun getCurrentListMap!1835 (array!21540 array!21542 (_ BitVec 32) (_ BitVec 32) V!12851 V!12851 (_ BitVec 32) Int) ListLongMap!4715)

(assert (=> b!372140 (= lt!170634 (getCurrentListMap!1835 lt!170629 lt!170631 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170630 () ListLongMap!4715)

(declare-fun lt!170635 () ListLongMap!4715)

(assert (=> b!372140 (and (= lt!170630 lt!170635) (= lt!170635 lt!170630))))

(declare-fun v!373 () V!12851)

(declare-fun lt!170633 () ListLongMap!4715)

(declare-fun +!769 (ListLongMap!4715 tuple2!5800) ListLongMap!4715)

(assert (=> b!372140 (= lt!170635 (+!769 lt!170633 (tuple2!5801 k0!778 v!373)))))

(declare-datatypes ((Unit!11429 0))(
  ( (Unit!11430) )
))
(declare-fun lt!170632 () Unit!11429)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!22 (array!21540 array!21542 (_ BitVec 32) (_ BitVec 32) V!12851 V!12851 (_ BitVec 32) (_ BitVec 64) V!12851 (_ BitVec 32) Int) Unit!11429)

(assert (=> b!372140 (= lt!170632 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!22 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!682 (array!21540 array!21542 (_ BitVec 32) (_ BitVec 32) V!12851 V!12851 (_ BitVec 32) Int) ListLongMap!4715)

(assert (=> b!372140 (= lt!170630 (getCurrentListMapNoExtraKeys!682 lt!170629 lt!170631 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372140 (= lt!170631 (array!21543 (store (arr!10239 _values!506) i!548 (ValueCellFull!4061 v!373)) (size!10591 _values!506)))))

(assert (=> b!372140 (= lt!170633 (getCurrentListMapNoExtraKeys!682 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372141 () Bool)

(declare-fun res!209366 () Bool)

(assert (=> b!372141 (=> (not res!209366) (not e!227029))))

(declare-fun arrayContainsKey!0 (array!21540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372141 (= res!209366 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372142 () Bool)

(declare-fun res!209360 () Bool)

(assert (=> b!372142 (=> (not res!209360) (not e!227029))))

(assert (=> b!372142 (= res!209360 (and (= (size!10591 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10590 _keys!658) (size!10591 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14778 () Bool)

(declare-fun tp!29199 () Bool)

(assert (=> mapNonEmpty!14778 (= mapRes!14778 (and tp!29199 e!227026))))

(declare-fun mapKey!14778 () (_ BitVec 32))

(declare-fun mapRest!14778 () (Array (_ BitVec 32) ValueCell!4061))

(declare-fun mapValue!14778 () ValueCell!4061)

(assert (=> mapNonEmpty!14778 (= (arr!10239 _values!506) (store mapRest!14778 mapKey!14778 mapValue!14778))))

(assert (= (and start!37020 res!209357) b!372142))

(assert (= (and b!372142 res!209360) b!372138))

(assert (= (and b!372138 res!209363) b!372135))

(assert (= (and b!372135 res!209362) b!372134))

(assert (= (and b!372134 res!209365) b!372137))

(assert (= (and b!372137 res!209364) b!372133))

(assert (= (and b!372133 res!209358) b!372141))

(assert (= (and b!372141 res!209366) b!372130))

(assert (= (and b!372130 res!209361) b!372136))

(assert (= (and b!372136 res!209359) b!372140))

(assert (= (and b!372139 condMapEmpty!14778) mapIsEmpty!14778))

(assert (= (and b!372139 (not condMapEmpty!14778)) mapNonEmpty!14778))

(get-info :version)

(assert (= (and mapNonEmpty!14778 ((_ is ValueCellFull!4061) mapValue!14778)) b!372131))

(assert (= (and b!372139 ((_ is ValueCellFull!4061) mapDefault!14778)) b!372132))

(assert (= start!37020 b!372139))

(declare-fun m!368297 () Bool)

(assert (=> b!372133 m!368297))

(declare-fun m!368299 () Bool)

(assert (=> b!372138 m!368299))

(declare-fun m!368301 () Bool)

(assert (=> b!372137 m!368301))

(declare-fun m!368303 () Bool)

(assert (=> b!372135 m!368303))

(declare-fun m!368305 () Bool)

(assert (=> start!37020 m!368305))

(declare-fun m!368307 () Bool)

(assert (=> start!37020 m!368307))

(declare-fun m!368309 () Bool)

(assert (=> start!37020 m!368309))

(declare-fun m!368311 () Bool)

(assert (=> b!372140 m!368311))

(declare-fun m!368313 () Bool)

(assert (=> b!372140 m!368313))

(declare-fun m!368315 () Bool)

(assert (=> b!372140 m!368315))

(declare-fun m!368317 () Bool)

(assert (=> b!372140 m!368317))

(declare-fun m!368319 () Bool)

(assert (=> b!372140 m!368319))

(declare-fun m!368321 () Bool)

(assert (=> b!372140 m!368321))

(declare-fun m!368323 () Bool)

(assert (=> b!372141 m!368323))

(declare-fun m!368325 () Bool)

(assert (=> b!372130 m!368325))

(declare-fun m!368327 () Bool)

(assert (=> b!372130 m!368327))

(declare-fun m!368329 () Bool)

(assert (=> mapNonEmpty!14778 m!368329))

(declare-fun m!368331 () Bool)

(assert (=> b!372136 m!368331))

(check-sat (not b!372135) (not start!37020) tp_is_empty!8809 (not b!372141) (not b!372130) (not b!372138) b_and!15417 (not b!372137) (not b!372136) (not mapNonEmpty!14778) (not b!372140) (not b_next!8161))
(check-sat b_and!15417 (not b_next!8161))
