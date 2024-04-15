; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39554 () Bool)

(assert start!39554)

(declare-fun b_free!9835 () Bool)

(declare-fun b_next!9835 () Bool)

(assert (=> start!39554 (= b_free!9835 (not b_next!9835))))

(declare-fun tp!35033 () Bool)

(declare-fun b_and!17465 () Bool)

(assert (=> start!39554 (= tp!35033 b_and!17465)))

(declare-fun b!423263 () Bool)

(declare-fun res!247429 () Bool)

(declare-fun e!251601 () Bool)

(assert (=> b!423263 (=> (not res!247429) (not e!251601))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25803 0))(
  ( (array!25804 (arr!12351 (Array (_ BitVec 32) (_ BitVec 64))) (size!12704 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25803)

(assert (=> b!423263 (= res!247429 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12704 _keys!709))))))

(declare-fun b!423264 () Bool)

(declare-fun res!247424 () Bool)

(declare-fun e!251600 () Bool)

(assert (=> b!423264 (=> (not res!247424) (not e!251600))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!423264 (= res!247424 (bvsle from!863 i!563))))

(declare-fun b!423265 () Bool)

(declare-fun res!247427 () Bool)

(assert (=> b!423265 (=> (not res!247427) (not e!251601))))

(assert (=> b!423265 (= res!247427 (or (= (select (arr!12351 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12351 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18102 () Bool)

(declare-fun mapRes!18102 () Bool)

(declare-fun tp!35034 () Bool)

(declare-fun e!251604 () Bool)

(assert (=> mapNonEmpty!18102 (= mapRes!18102 (and tp!35034 e!251604))))

(declare-datatypes ((V!15755 0))(
  ( (V!15756 (val!5538 Int)) )
))
(declare-datatypes ((ValueCell!5150 0))(
  ( (ValueCellFull!5150 (v!7779 V!15755)) (EmptyCell!5150) )
))
(declare-fun mapRest!18102 () (Array (_ BitVec 32) ValueCell!5150))

(declare-fun mapKey!18102 () (_ BitVec 32))

(declare-fun mapValue!18102 () ValueCell!5150)

(declare-datatypes ((array!25805 0))(
  ( (array!25806 (arr!12352 (Array (_ BitVec 32) ValueCell!5150)) (size!12705 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25805)

(assert (=> mapNonEmpty!18102 (= (arr!12352 _values!549) (store mapRest!18102 mapKey!18102 mapValue!18102))))

(declare-fun res!247425 () Bool)

(assert (=> start!39554 (=> (not res!247425) (not e!251601))))

(assert (=> start!39554 (= res!247425 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12704 _keys!709))))))

(assert (=> start!39554 e!251601))

(declare-fun tp_is_empty!10987 () Bool)

(assert (=> start!39554 tp_is_empty!10987))

(assert (=> start!39554 tp!35033))

(assert (=> start!39554 true))

(declare-fun e!251602 () Bool)

(declare-fun array_inv!9036 (array!25805) Bool)

(assert (=> start!39554 (and (array_inv!9036 _values!549) e!251602)))

(declare-fun array_inv!9037 (array!25803) Bool)

(assert (=> start!39554 (array_inv!9037 _keys!709)))

(declare-fun mapIsEmpty!18102 () Bool)

(assert (=> mapIsEmpty!18102 mapRes!18102))

(declare-fun b!423266 () Bool)

(declare-fun res!247426 () Bool)

(assert (=> b!423266 (=> (not res!247426) (not e!251601))))

(declare-datatypes ((List!7255 0))(
  ( (Nil!7252) (Cons!7251 (h!8107 (_ BitVec 64)) (t!12690 List!7255)) )
))
(declare-fun arrayNoDuplicates!0 (array!25803 (_ BitVec 32) List!7255) Bool)

(assert (=> b!423266 (= res!247426 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7252))))

(declare-fun b!423267 () Bool)

(declare-fun res!247423 () Bool)

(assert (=> b!423267 (=> (not res!247423) (not e!251601))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423267 (= res!247423 (validKeyInArray!0 k0!794))))

(declare-fun b!423268 () Bool)

(declare-fun res!247430 () Bool)

(assert (=> b!423268 (=> (not res!247430) (not e!251600))))

(declare-fun lt!193955 () array!25803)

(assert (=> b!423268 (= res!247430 (arrayNoDuplicates!0 lt!193955 #b00000000000000000000000000000000 Nil!7252))))

(declare-fun b!423269 () Bool)

(declare-fun res!247431 () Bool)

(assert (=> b!423269 (=> (not res!247431) (not e!251601))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25803 (_ BitVec 32)) Bool)

(assert (=> b!423269 (= res!247431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423270 () Bool)

(declare-fun res!247433 () Bool)

(assert (=> b!423270 (=> (not res!247433) (not e!251601))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!423270 (= res!247433 (and (= (size!12705 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12704 _keys!709) (size!12705 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423271 () Bool)

(declare-fun res!247428 () Bool)

(assert (=> b!423271 (=> (not res!247428) (not e!251601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423271 (= res!247428 (validMask!0 mask!1025))))

(declare-fun b!423272 () Bool)

(assert (=> b!423272 (= e!251601 e!251600)))

(declare-fun res!247434 () Bool)

(assert (=> b!423272 (=> (not res!247434) (not e!251600))))

(assert (=> b!423272 (= res!247434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193955 mask!1025))))

(assert (=> b!423272 (= lt!193955 (array!25804 (store (arr!12351 _keys!709) i!563 k0!794) (size!12704 _keys!709)))))

(declare-fun b!423273 () Bool)

(declare-fun res!247432 () Bool)

(assert (=> b!423273 (=> (not res!247432) (not e!251601))))

(declare-fun arrayContainsKey!0 (array!25803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423273 (= res!247432 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423274 () Bool)

(declare-fun e!251599 () Bool)

(assert (=> b!423274 (= e!251599 tp_is_empty!10987)))

(declare-fun b!423275 () Bool)

(assert (=> b!423275 (= e!251604 tp_is_empty!10987)))

(declare-fun b!423276 () Bool)

(assert (=> b!423276 (= e!251600 false)))

(declare-fun minValue!515 () V!15755)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15755)

(declare-datatypes ((tuple2!7260 0))(
  ( (tuple2!7261 (_1!3641 (_ BitVec 64)) (_2!3641 V!15755)) )
))
(declare-datatypes ((List!7256 0))(
  ( (Nil!7253) (Cons!7252 (h!8108 tuple2!7260) (t!12691 List!7256)) )
))
(declare-datatypes ((ListLongMap!6163 0))(
  ( (ListLongMap!6164 (toList!3097 List!7256)) )
))
(declare-fun lt!193954 () ListLongMap!6163)

(declare-fun v!412 () V!15755)

(declare-fun getCurrentListMapNoExtraKeys!1305 (array!25803 array!25805 (_ BitVec 32) (_ BitVec 32) V!15755 V!15755 (_ BitVec 32) Int) ListLongMap!6163)

(assert (=> b!423276 (= lt!193954 (getCurrentListMapNoExtraKeys!1305 lt!193955 (array!25806 (store (arr!12352 _values!549) i!563 (ValueCellFull!5150 v!412)) (size!12705 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193953 () ListLongMap!6163)

(assert (=> b!423276 (= lt!193953 (getCurrentListMapNoExtraKeys!1305 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423277 () Bool)

(assert (=> b!423277 (= e!251602 (and e!251599 mapRes!18102))))

(declare-fun condMapEmpty!18102 () Bool)

(declare-fun mapDefault!18102 () ValueCell!5150)

(assert (=> b!423277 (= condMapEmpty!18102 (= (arr!12352 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5150)) mapDefault!18102)))))

(assert (= (and start!39554 res!247425) b!423271))

(assert (= (and b!423271 res!247428) b!423270))

(assert (= (and b!423270 res!247433) b!423269))

(assert (= (and b!423269 res!247431) b!423266))

(assert (= (and b!423266 res!247426) b!423263))

(assert (= (and b!423263 res!247429) b!423267))

(assert (= (and b!423267 res!247423) b!423265))

(assert (= (and b!423265 res!247427) b!423273))

(assert (= (and b!423273 res!247432) b!423272))

(assert (= (and b!423272 res!247434) b!423268))

(assert (= (and b!423268 res!247430) b!423264))

(assert (= (and b!423264 res!247424) b!423276))

(assert (= (and b!423277 condMapEmpty!18102) mapIsEmpty!18102))

(assert (= (and b!423277 (not condMapEmpty!18102)) mapNonEmpty!18102))

(get-info :version)

(assert (= (and mapNonEmpty!18102 ((_ is ValueCellFull!5150) mapValue!18102)) b!423275))

(assert (= (and b!423277 ((_ is ValueCellFull!5150) mapDefault!18102)) b!423274))

(assert (= start!39554 b!423277))

(declare-fun m!412251 () Bool)

(assert (=> b!423271 m!412251))

(declare-fun m!412253 () Bool)

(assert (=> start!39554 m!412253))

(declare-fun m!412255 () Bool)

(assert (=> start!39554 m!412255))

(declare-fun m!412257 () Bool)

(assert (=> b!423267 m!412257))

(declare-fun m!412259 () Bool)

(assert (=> b!423266 m!412259))

(declare-fun m!412261 () Bool)

(assert (=> mapNonEmpty!18102 m!412261))

(declare-fun m!412263 () Bool)

(assert (=> b!423273 m!412263))

(declare-fun m!412265 () Bool)

(assert (=> b!423272 m!412265))

(declare-fun m!412267 () Bool)

(assert (=> b!423272 m!412267))

(declare-fun m!412269 () Bool)

(assert (=> b!423268 m!412269))

(declare-fun m!412271 () Bool)

(assert (=> b!423269 m!412271))

(declare-fun m!412273 () Bool)

(assert (=> b!423276 m!412273))

(declare-fun m!412275 () Bool)

(assert (=> b!423276 m!412275))

(declare-fun m!412277 () Bool)

(assert (=> b!423276 m!412277))

(declare-fun m!412279 () Bool)

(assert (=> b!423265 m!412279))

(check-sat (not b!423272) (not start!39554) (not b!423269) b_and!17465 (not b_next!9835) (not b!423267) (not mapNonEmpty!18102) (not b!423266) (not b!423273) tp_is_empty!10987 (not b!423271) (not b!423276) (not b!423268))
(check-sat b_and!17465 (not b_next!9835))
