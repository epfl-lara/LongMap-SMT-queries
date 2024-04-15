; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38684 () Bool)

(assert start!38684)

(declare-fun b_free!9235 () Bool)

(declare-fun b_next!9235 () Bool)

(assert (=> start!38684 (= b_free!9235 (not b_next!9235))))

(declare-fun tp!32829 () Bool)

(declare-fun b_and!16595 () Bool)

(assert (=> start!38684 (= tp!32829 b_and!16595)))

(declare-fun res!231674 () Bool)

(declare-fun e!242295 () Bool)

(assert (=> start!38684 (=> (not res!231674) (not e!242295))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24115 0))(
  ( (array!24116 (arr!11507 (Array (_ BitVec 32) (_ BitVec 64))) (size!11860 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24115)

(assert (=> start!38684 (= res!231674 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11860 _keys!709))))))

(assert (=> start!38684 e!242295))

(declare-fun tp_is_empty!10117 () Bool)

(assert (=> start!38684 tp_is_empty!10117))

(assert (=> start!38684 tp!32829))

(assert (=> start!38684 true))

(declare-datatypes ((V!14595 0))(
  ( (V!14596 (val!5103 Int)) )
))
(declare-datatypes ((ValueCell!4715 0))(
  ( (ValueCellFull!4715 (v!7344 V!14595)) (EmptyCell!4715) )
))
(declare-datatypes ((array!24117 0))(
  ( (array!24118 (arr!11508 (Array (_ BitVec 32) ValueCell!4715)) (size!11861 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24117)

(declare-fun e!242296 () Bool)

(declare-fun array_inv!8440 (array!24117) Bool)

(assert (=> start!38684 (and (array_inv!8440 _values!549) e!242296)))

(declare-fun array_inv!8441 (array!24115) Bool)

(assert (=> start!38684 (array_inv!8441 _keys!709)))

(declare-fun b!402180 () Bool)

(declare-fun res!231679 () Bool)

(assert (=> b!402180 (=> (not res!231679) (not e!242295))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402180 (= res!231679 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402181 () Bool)

(declare-fun res!231683 () Bool)

(assert (=> b!402181 (=> (not res!231683) (not e!242295))))

(declare-datatypes ((List!6664 0))(
  ( (Nil!6661) (Cons!6660 (h!7516 (_ BitVec 64)) (t!11829 List!6664)) )
))
(declare-fun arrayNoDuplicates!0 (array!24115 (_ BitVec 32) List!6664) Bool)

(assert (=> b!402181 (= res!231683 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6661))))

(declare-fun b!402182 () Bool)

(declare-fun res!231675 () Bool)

(declare-fun e!242298 () Bool)

(assert (=> b!402182 (=> (not res!231675) (not e!242298))))

(declare-fun lt!187696 () array!24115)

(assert (=> b!402182 (= res!231675 (arrayNoDuplicates!0 lt!187696 #b00000000000000000000000000000000 Nil!6661))))

(declare-fun b!402183 () Bool)

(assert (=> b!402183 (= e!242298 (not true))))

(declare-fun e!242297 () Bool)

(assert (=> b!402183 e!242297))

(declare-fun c!54738 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402183 (= c!54738 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14595)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14595)

(declare-fun v!412 () V!14595)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!12152 0))(
  ( (Unit!12153) )
))
(declare-fun lt!187697 () Unit!12152)

(declare-fun defaultEntry!557 () Int)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!339 (array!24115 array!24117 (_ BitVec 32) (_ BitVec 32) V!14595 V!14595 (_ BitVec 32) (_ BitVec 64) V!14595 (_ BitVec 32) Int) Unit!12152)

(assert (=> b!402183 (= lt!187697 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!339 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402184 () Bool)

(declare-fun e!242299 () Bool)

(assert (=> b!402184 (= e!242299 tp_is_empty!10117)))

(declare-fun b!402185 () Bool)

(declare-fun res!231676 () Bool)

(assert (=> b!402185 (=> (not res!231676) (not e!242295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24115 (_ BitVec 32)) Bool)

(assert (=> b!402185 (= res!231676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-datatypes ((tuple2!6760 0))(
  ( (tuple2!6761 (_1!3391 (_ BitVec 64)) (_2!3391 V!14595)) )
))
(declare-datatypes ((List!6665 0))(
  ( (Nil!6662) (Cons!6661 (h!7517 tuple2!6760) (t!11830 List!6665)) )
))
(declare-datatypes ((ListLongMap!5663 0))(
  ( (ListLongMap!5664 (toList!2847 List!6665)) )
))
(declare-fun call!28344 () ListLongMap!5663)

(declare-fun bm!28341 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1063 (array!24115 array!24117 (_ BitVec 32) (_ BitVec 32) V!14595 V!14595 (_ BitVec 32) Int) ListLongMap!5663)

(assert (=> bm!28341 (= call!28344 (getCurrentListMapNoExtraKeys!1063 (ite c!54738 lt!187696 _keys!709) (ite c!54738 (array!24118 (store (arr!11508 _values!549) i!563 (ValueCellFull!4715 v!412)) (size!11861 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402186 () Bool)

(declare-fun res!231681 () Bool)

(assert (=> b!402186 (=> (not res!231681) (not e!242298))))

(assert (=> b!402186 (= res!231681 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11860 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!28342 () Bool)

(declare-fun call!28345 () ListLongMap!5663)

(assert (=> bm!28342 (= call!28345 (getCurrentListMapNoExtraKeys!1063 (ite c!54738 _keys!709 lt!187696) (ite c!54738 _values!549 (array!24118 (store (arr!11508 _values!549) i!563 (ValueCellFull!4715 v!412)) (size!11861 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16797 () Bool)

(declare-fun mapRes!16797 () Bool)

(assert (=> mapIsEmpty!16797 mapRes!16797))

(declare-fun b!402187 () Bool)

(declare-fun res!231673 () Bool)

(assert (=> b!402187 (=> (not res!231673) (not e!242295))))

(assert (=> b!402187 (= res!231673 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11860 _keys!709))))))

(declare-fun b!402188 () Bool)

(declare-fun e!242300 () Bool)

(assert (=> b!402188 (= e!242300 tp_is_empty!10117)))

(declare-fun b!402189 () Bool)

(declare-fun res!231684 () Bool)

(assert (=> b!402189 (=> (not res!231684) (not e!242295))))

(assert (=> b!402189 (= res!231684 (or (= (select (arr!11507 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11507 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402190 () Bool)

(declare-fun res!231680 () Bool)

(assert (=> b!402190 (=> (not res!231680) (not e!242295))))

(assert (=> b!402190 (= res!231680 (and (= (size!11861 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11860 _keys!709) (size!11861 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402191 () Bool)

(assert (=> b!402191 (= e!242295 e!242298)))

(declare-fun res!231677 () Bool)

(assert (=> b!402191 (=> (not res!231677) (not e!242298))))

(assert (=> b!402191 (= res!231677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187696 mask!1025))))

(assert (=> b!402191 (= lt!187696 (array!24116 (store (arr!11507 _keys!709) i!563 k0!794) (size!11860 _keys!709)))))

(declare-fun b!402192 () Bool)

(declare-fun res!231682 () Bool)

(assert (=> b!402192 (=> (not res!231682) (not e!242295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402192 (= res!231682 (validMask!0 mask!1025))))

(declare-fun b!402193 () Bool)

(assert (=> b!402193 (= e!242296 (and e!242299 mapRes!16797))))

(declare-fun condMapEmpty!16797 () Bool)

(declare-fun mapDefault!16797 () ValueCell!4715)

(assert (=> b!402193 (= condMapEmpty!16797 (= (arr!11508 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4715)) mapDefault!16797)))))

(declare-fun b!402194 () Bool)

(declare-fun res!231678 () Bool)

(assert (=> b!402194 (=> (not res!231678) (not e!242295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402194 (= res!231678 (validKeyInArray!0 k0!794))))

(declare-fun b!402195 () Bool)

(declare-fun +!1152 (ListLongMap!5663 tuple2!6760) ListLongMap!5663)

(assert (=> b!402195 (= e!242297 (= call!28344 (+!1152 call!28345 (tuple2!6761 k0!794 v!412))))))

(declare-fun mapNonEmpty!16797 () Bool)

(declare-fun tp!32828 () Bool)

(assert (=> mapNonEmpty!16797 (= mapRes!16797 (and tp!32828 e!242300))))

(declare-fun mapKey!16797 () (_ BitVec 32))

(declare-fun mapValue!16797 () ValueCell!4715)

(declare-fun mapRest!16797 () (Array (_ BitVec 32) ValueCell!4715))

(assert (=> mapNonEmpty!16797 (= (arr!11508 _values!549) (store mapRest!16797 mapKey!16797 mapValue!16797))))

(declare-fun b!402196 () Bool)

(assert (=> b!402196 (= e!242297 (= call!28345 call!28344))))

(assert (= (and start!38684 res!231674) b!402192))

(assert (= (and b!402192 res!231682) b!402190))

(assert (= (and b!402190 res!231680) b!402185))

(assert (= (and b!402185 res!231676) b!402181))

(assert (= (and b!402181 res!231683) b!402187))

(assert (= (and b!402187 res!231673) b!402194))

(assert (= (and b!402194 res!231678) b!402189))

(assert (= (and b!402189 res!231684) b!402180))

(assert (= (and b!402180 res!231679) b!402191))

(assert (= (and b!402191 res!231677) b!402182))

(assert (= (and b!402182 res!231675) b!402186))

(assert (= (and b!402186 res!231681) b!402183))

(assert (= (and b!402183 c!54738) b!402195))

(assert (= (and b!402183 (not c!54738)) b!402196))

(assert (= (or b!402195 b!402196) bm!28341))

(assert (= (or b!402195 b!402196) bm!28342))

(assert (= (and b!402193 condMapEmpty!16797) mapIsEmpty!16797))

(assert (= (and b!402193 (not condMapEmpty!16797)) mapNonEmpty!16797))

(get-info :version)

(assert (= (and mapNonEmpty!16797 ((_ is ValueCellFull!4715) mapValue!16797)) b!402188))

(assert (= (and b!402193 ((_ is ValueCellFull!4715) mapDefault!16797)) b!402184))

(assert (= start!38684 b!402193))

(declare-fun m!395247 () Bool)

(assert (=> b!402183 m!395247))

(declare-fun m!395249 () Bool)

(assert (=> b!402180 m!395249))

(declare-fun m!395251 () Bool)

(assert (=> b!402185 m!395251))

(declare-fun m!395253 () Bool)

(assert (=> b!402189 m!395253))

(declare-fun m!395255 () Bool)

(assert (=> bm!28342 m!395255))

(declare-fun m!395257 () Bool)

(assert (=> bm!28342 m!395257))

(declare-fun m!395259 () Bool)

(assert (=> b!402181 m!395259))

(declare-fun m!395261 () Bool)

(assert (=> b!402195 m!395261))

(declare-fun m!395263 () Bool)

(assert (=> b!402191 m!395263))

(declare-fun m!395265 () Bool)

(assert (=> b!402191 m!395265))

(assert (=> bm!28341 m!395255))

(declare-fun m!395267 () Bool)

(assert (=> bm!28341 m!395267))

(declare-fun m!395269 () Bool)

(assert (=> b!402182 m!395269))

(declare-fun m!395271 () Bool)

(assert (=> b!402194 m!395271))

(declare-fun m!395273 () Bool)

(assert (=> b!402192 m!395273))

(declare-fun m!395275 () Bool)

(assert (=> mapNonEmpty!16797 m!395275))

(declare-fun m!395277 () Bool)

(assert (=> start!38684 m!395277))

(declare-fun m!395279 () Bool)

(assert (=> start!38684 m!395279))

(check-sat (not b!402192) (not b!402180) (not mapNonEmpty!16797) (not b!402194) (not b!402182) (not b!402181) (not bm!28342) (not b!402185) (not b!402195) (not b!402183) b_and!16595 (not bm!28341) (not b!402191) (not b_next!9235) (not start!38684) tp_is_empty!10117)
(check-sat b_and!16595 (not b_next!9235))
