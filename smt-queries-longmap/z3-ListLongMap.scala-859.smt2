; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20252 () Bool)

(assert start!20252)

(declare-fun b_free!4911 () Bool)

(declare-fun b_next!4911 () Bool)

(assert (=> start!20252 (= b_free!4911 (not b_next!4911))))

(declare-fun tp!17764 () Bool)

(declare-fun b_and!11657 () Bool)

(assert (=> start!20252 (= tp!17764 b_and!11657)))

(declare-fun b!199214 () Bool)

(declare-fun res!94630 () Bool)

(declare-fun e!130812 () Bool)

(assert (=> b!199214 (=> (not res!94630) (not e!130812))))

(declare-datatypes ((array!8775 0))(
  ( (array!8776 (arr!4138 (Array (_ BitVec 32) (_ BitVec 64))) (size!4463 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8775)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6003 0))(
  ( (V!6004 (val!2428 Int)) )
))
(declare-datatypes ((ValueCell!2040 0))(
  ( (ValueCellFull!2040 (v!4398 V!6003)) (EmptyCell!2040) )
))
(declare-datatypes ((array!8777 0))(
  ( (array!8778 (arr!4139 (Array (_ BitVec 32) ValueCell!2040)) (size!4464 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8777)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!199214 (= res!94630 (and (= (size!4464 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4463 _keys!825) (size!4464 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199215 () Bool)

(declare-fun res!94636 () Bool)

(assert (=> b!199215 (=> (not res!94636) (not e!130812))))

(declare-datatypes ((List!2592 0))(
  ( (Nil!2589) (Cons!2588 (h!3230 (_ BitVec 64)) (t!7523 List!2592)) )
))
(declare-fun arrayNoDuplicates!0 (array!8775 (_ BitVec 32) List!2592) Bool)

(assert (=> b!199215 (= res!94636 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2589))))

(declare-fun b!199216 () Bool)

(declare-fun e!130813 () Bool)

(declare-fun tp_is_empty!4767 () Bool)

(assert (=> b!199216 (= e!130813 tp_is_empty!4767)))

(declare-fun res!94632 () Bool)

(assert (=> start!20252 (=> (not res!94632) (not e!130812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20252 (= res!94632 (validMask!0 mask!1149))))

(assert (=> start!20252 e!130812))

(declare-fun e!130811 () Bool)

(declare-fun array_inv!2713 (array!8777) Bool)

(assert (=> start!20252 (and (array_inv!2713 _values!649) e!130811)))

(assert (=> start!20252 true))

(assert (=> start!20252 tp_is_empty!4767))

(declare-fun array_inv!2714 (array!8775) Bool)

(assert (=> start!20252 (array_inv!2714 _keys!825)))

(assert (=> start!20252 tp!17764))

(declare-fun mapNonEmpty!8219 () Bool)

(declare-fun mapRes!8219 () Bool)

(declare-fun tp!17765 () Bool)

(assert (=> mapNonEmpty!8219 (= mapRes!8219 (and tp!17765 e!130813))))

(declare-fun mapKey!8219 () (_ BitVec 32))

(declare-fun mapValue!8219 () ValueCell!2040)

(declare-fun mapRest!8219 () (Array (_ BitVec 32) ValueCell!2040))

(assert (=> mapNonEmpty!8219 (= (arr!4139 _values!649) (store mapRest!8219 mapKey!8219 mapValue!8219))))

(declare-fun b!199217 () Bool)

(declare-fun res!94634 () Bool)

(assert (=> b!199217 (=> (not res!94634) (not e!130812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8775 (_ BitVec 32)) Bool)

(assert (=> b!199217 (= res!94634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8219 () Bool)

(assert (=> mapIsEmpty!8219 mapRes!8219))

(declare-fun b!199218 () Bool)

(declare-fun res!94635 () Bool)

(assert (=> b!199218 (=> (not res!94635) (not e!130812))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199218 (= res!94635 (validKeyInArray!0 k0!843))))

(declare-fun b!199219 () Bool)

(declare-fun res!94633 () Bool)

(assert (=> b!199219 (=> (not res!94633) (not e!130812))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199219 (= res!94633 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4463 _keys!825))))))

(declare-fun b!199220 () Bool)

(declare-fun res!94631 () Bool)

(assert (=> b!199220 (=> (not res!94631) (not e!130812))))

(assert (=> b!199220 (= res!94631 (= (select (arr!4138 _keys!825) i!601) k0!843))))

(declare-fun b!199221 () Bool)

(declare-fun e!130810 () Bool)

(assert (=> b!199221 (= e!130810 tp_is_empty!4767)))

(declare-fun b!199222 () Bool)

(assert (=> b!199222 (= e!130812 (not true))))

(declare-datatypes ((tuple2!3676 0))(
  ( (tuple2!3677 (_1!1849 (_ BitVec 64)) (_2!1849 V!6003)) )
))
(declare-datatypes ((List!2593 0))(
  ( (Nil!2590) (Cons!2589 (h!3231 tuple2!3676) (t!7524 List!2593)) )
))
(declare-datatypes ((ListLongMap!2589 0))(
  ( (ListLongMap!2590 (toList!1310 List!2593)) )
))
(declare-fun lt!98209 () ListLongMap!2589)

(declare-fun lt!98211 () ListLongMap!2589)

(assert (=> b!199222 (and (= lt!98209 lt!98211) (= lt!98211 lt!98209))))

(declare-fun lt!98208 () ListLongMap!2589)

(declare-fun v!520 () V!6003)

(declare-fun +!337 (ListLongMap!2589 tuple2!3676) ListLongMap!2589)

(assert (=> b!199222 (= lt!98211 (+!337 lt!98208 (tuple2!3677 k0!843 v!520)))))

(declare-datatypes ((Unit!5976 0))(
  ( (Unit!5977) )
))
(declare-fun lt!98210 () Unit!5976)

(declare-fun zeroValue!615 () V!6003)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6003)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!14 (array!8775 array!8777 (_ BitVec 32) (_ BitVec 32) V!6003 V!6003 (_ BitVec 32) (_ BitVec 64) V!6003 (_ BitVec 32) Int) Unit!5976)

(assert (=> b!199222 (= lt!98210 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!14 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!275 (array!8775 array!8777 (_ BitVec 32) (_ BitVec 32) V!6003 V!6003 (_ BitVec 32) Int) ListLongMap!2589)

(assert (=> b!199222 (= lt!98209 (getCurrentListMapNoExtraKeys!275 _keys!825 (array!8778 (store (arr!4139 _values!649) i!601 (ValueCellFull!2040 v!520)) (size!4464 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199222 (= lt!98208 (getCurrentListMapNoExtraKeys!275 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199223 () Bool)

(assert (=> b!199223 (= e!130811 (and e!130810 mapRes!8219))))

(declare-fun condMapEmpty!8219 () Bool)

(declare-fun mapDefault!8219 () ValueCell!2040)

(assert (=> b!199223 (= condMapEmpty!8219 (= (arr!4139 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2040)) mapDefault!8219)))))

(assert (= (and start!20252 res!94632) b!199214))

(assert (= (and b!199214 res!94630) b!199217))

(assert (= (and b!199217 res!94634) b!199215))

(assert (= (and b!199215 res!94636) b!199219))

(assert (= (and b!199219 res!94633) b!199218))

(assert (= (and b!199218 res!94635) b!199220))

(assert (= (and b!199220 res!94631) b!199222))

(assert (= (and b!199223 condMapEmpty!8219) mapIsEmpty!8219))

(assert (= (and b!199223 (not condMapEmpty!8219)) mapNonEmpty!8219))

(get-info :version)

(assert (= (and mapNonEmpty!8219 ((_ is ValueCellFull!2040) mapValue!8219)) b!199216))

(assert (= (and b!199223 ((_ is ValueCellFull!2040) mapDefault!8219)) b!199221))

(assert (= start!20252 b!199223))

(declare-fun m!225705 () Bool)

(assert (=> b!199218 m!225705))

(declare-fun m!225707 () Bool)

(assert (=> start!20252 m!225707))

(declare-fun m!225709 () Bool)

(assert (=> start!20252 m!225709))

(declare-fun m!225711 () Bool)

(assert (=> start!20252 m!225711))

(declare-fun m!225713 () Bool)

(assert (=> b!199222 m!225713))

(declare-fun m!225715 () Bool)

(assert (=> b!199222 m!225715))

(declare-fun m!225717 () Bool)

(assert (=> b!199222 m!225717))

(declare-fun m!225719 () Bool)

(assert (=> b!199222 m!225719))

(declare-fun m!225721 () Bool)

(assert (=> b!199222 m!225721))

(declare-fun m!225723 () Bool)

(assert (=> b!199215 m!225723))

(declare-fun m!225725 () Bool)

(assert (=> b!199217 m!225725))

(declare-fun m!225727 () Bool)

(assert (=> mapNonEmpty!8219 m!225727))

(declare-fun m!225729 () Bool)

(assert (=> b!199220 m!225729))

(check-sat (not b!199217) (not mapNonEmpty!8219) (not b!199215) b_and!11657 (not b_next!4911) (not start!20252) (not b!199222) (not b!199218) tp_is_empty!4767)
(check-sat b_and!11657 (not b_next!4911))
