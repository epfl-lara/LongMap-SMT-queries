; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39620 () Bool)

(assert start!39620)

(declare-fun b_free!9901 () Bool)

(declare-fun b_next!9901 () Bool)

(assert (=> start!39620 (= b_free!9901 (not b_next!9901))))

(declare-fun tp!35232 () Bool)

(declare-fun b_and!17531 () Bool)

(assert (=> start!39620 (= tp!35232 b_and!17531)))

(declare-fun b!424768 () Bool)

(declare-fun res!248639 () Bool)

(declare-fun e!252219 () Bool)

(assert (=> b!424768 (=> (not res!248639) (not e!252219))))

(declare-datatypes ((array!25935 0))(
  ( (array!25936 (arr!12417 (Array (_ BitVec 32) (_ BitVec 64))) (size!12770 (_ BitVec 32))) )
))
(declare-fun lt!194291 () array!25935)

(declare-datatypes ((List!7304 0))(
  ( (Nil!7301) (Cons!7300 (h!8156 (_ BitVec 64)) (t!12739 List!7304)) )
))
(declare-fun arrayNoDuplicates!0 (array!25935 (_ BitVec 32) List!7304) Bool)

(assert (=> b!424768 (= res!248639 (arrayNoDuplicates!0 lt!194291 #b00000000000000000000000000000000 Nil!7301))))

(declare-fun b!424769 () Bool)

(declare-fun e!252218 () Bool)

(declare-fun e!252214 () Bool)

(declare-fun mapRes!18201 () Bool)

(assert (=> b!424769 (= e!252218 (and e!252214 mapRes!18201))))

(declare-fun condMapEmpty!18201 () Bool)

(declare-datatypes ((V!15843 0))(
  ( (V!15844 (val!5571 Int)) )
))
(declare-datatypes ((ValueCell!5183 0))(
  ( (ValueCellFull!5183 (v!7812 V!15843)) (EmptyCell!5183) )
))
(declare-datatypes ((array!25937 0))(
  ( (array!25938 (arr!12418 (Array (_ BitVec 32) ValueCell!5183)) (size!12771 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25937)

(declare-fun mapDefault!18201 () ValueCell!5183)

(assert (=> b!424769 (= condMapEmpty!18201 (= (arr!12418 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5183)) mapDefault!18201)))))

(declare-fun b!424770 () Bool)

(declare-fun tp_is_empty!11053 () Bool)

(assert (=> b!424770 (= e!252214 tp_is_empty!11053)))

(declare-fun b!424771 () Bool)

(declare-fun res!248641 () Bool)

(declare-fun e!252217 () Bool)

(assert (=> b!424771 (=> (not res!248641) (not e!252217))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424771 (= res!248641 (validMask!0 mask!1025))))

(declare-fun b!424772 () Bool)

(declare-fun res!248631 () Bool)

(assert (=> b!424772 (=> (not res!248631) (not e!252217))))

(declare-fun _keys!709 () array!25935)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424772 (= res!248631 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424773 () Bool)

(declare-fun res!248633 () Bool)

(assert (=> b!424773 (=> (not res!248633) (not e!252217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424773 (= res!248633 (validKeyInArray!0 k0!794))))

(declare-fun res!248642 () Bool)

(assert (=> start!39620 (=> (not res!248642) (not e!252217))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39620 (= res!248642 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12770 _keys!709))))))

(assert (=> start!39620 e!252217))

(assert (=> start!39620 tp_is_empty!11053))

(assert (=> start!39620 tp!35232))

(assert (=> start!39620 true))

(declare-fun array_inv!9080 (array!25937) Bool)

(assert (=> start!39620 (and (array_inv!9080 _values!549) e!252218)))

(declare-fun array_inv!9081 (array!25935) Bool)

(assert (=> start!39620 (array_inv!9081 _keys!709)))

(declare-fun b!424774 () Bool)

(declare-fun res!248636 () Bool)

(assert (=> b!424774 (=> (not res!248636) (not e!252219))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424774 (= res!248636 (bvsle from!863 i!563))))

(declare-fun b!424775 () Bool)

(declare-fun e!252216 () Bool)

(assert (=> b!424775 (= e!252216 tp_is_empty!11053)))

(declare-fun b!424776 () Bool)

(declare-fun res!248632 () Bool)

(assert (=> b!424776 (=> (not res!248632) (not e!252217))))

(assert (=> b!424776 (= res!248632 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7301))))

(declare-fun b!424777 () Bool)

(declare-fun e!252213 () Bool)

(assert (=> b!424777 (= e!252219 e!252213)))

(declare-fun res!248637 () Bool)

(assert (=> b!424777 (=> (not res!248637) (not e!252213))))

(assert (=> b!424777 (= res!248637 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194290 () array!25937)

(declare-fun minValue!515 () V!15843)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15843)

(declare-datatypes ((tuple2!7304 0))(
  ( (tuple2!7305 (_1!3663 (_ BitVec 64)) (_2!3663 V!15843)) )
))
(declare-datatypes ((List!7305 0))(
  ( (Nil!7302) (Cons!7301 (h!8157 tuple2!7304) (t!12740 List!7305)) )
))
(declare-datatypes ((ListLongMap!6207 0))(
  ( (ListLongMap!6208 (toList!3119 List!7305)) )
))
(declare-fun lt!194294 () ListLongMap!6207)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1327 (array!25935 array!25937 (_ BitVec 32) (_ BitVec 32) V!15843 V!15843 (_ BitVec 32) Int) ListLongMap!6207)

(assert (=> b!424777 (= lt!194294 (getCurrentListMapNoExtraKeys!1327 lt!194291 lt!194290 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15843)

(assert (=> b!424777 (= lt!194290 (array!25938 (store (arr!12418 _values!549) i!563 (ValueCellFull!5183 v!412)) (size!12771 _values!549)))))

(declare-fun lt!194293 () ListLongMap!6207)

(assert (=> b!424777 (= lt!194293 (getCurrentListMapNoExtraKeys!1327 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18201 () Bool)

(declare-fun tp!35231 () Bool)

(assert (=> mapNonEmpty!18201 (= mapRes!18201 (and tp!35231 e!252216))))

(declare-fun mapKey!18201 () (_ BitVec 32))

(declare-fun mapRest!18201 () (Array (_ BitVec 32) ValueCell!5183))

(declare-fun mapValue!18201 () ValueCell!5183)

(assert (=> mapNonEmpty!18201 (= (arr!12418 _values!549) (store mapRest!18201 mapKey!18201 mapValue!18201))))

(declare-fun b!424778 () Bool)

(declare-fun res!248634 () Bool)

(assert (=> b!424778 (=> (not res!248634) (not e!252217))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25935 (_ BitVec 32)) Bool)

(assert (=> b!424778 (= res!248634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424779 () Bool)

(declare-fun res!248643 () Bool)

(assert (=> b!424779 (=> (not res!248643) (not e!252217))))

(assert (=> b!424779 (= res!248643 (or (= (select (arr!12417 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12417 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424780 () Bool)

(declare-fun res!248635 () Bool)

(assert (=> b!424780 (=> (not res!248635) (not e!252217))))

(assert (=> b!424780 (= res!248635 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12770 _keys!709))))))

(declare-fun mapIsEmpty!18201 () Bool)

(assert (=> mapIsEmpty!18201 mapRes!18201))

(declare-fun b!424781 () Bool)

(assert (=> b!424781 (= e!252217 e!252219)))

(declare-fun res!248638 () Bool)

(assert (=> b!424781 (=> (not res!248638) (not e!252219))))

(assert (=> b!424781 (= res!248638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194291 mask!1025))))

(assert (=> b!424781 (= lt!194291 (array!25936 (store (arr!12417 _keys!709) i!563 k0!794) (size!12770 _keys!709)))))

(declare-fun b!424782 () Bool)

(declare-fun res!248640 () Bool)

(assert (=> b!424782 (=> (not res!248640) (not e!252217))))

(assert (=> b!424782 (= res!248640 (and (= (size!12771 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12770 _keys!709) (size!12771 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424783 () Bool)

(assert (=> b!424783 (= e!252213 (not true))))

(declare-fun +!1303 (ListLongMap!6207 tuple2!7304) ListLongMap!6207)

(assert (=> b!424783 (= (getCurrentListMapNoExtraKeys!1327 lt!194291 lt!194290 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1303 (getCurrentListMapNoExtraKeys!1327 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7305 k0!794 v!412)))))

(declare-datatypes ((Unit!12452 0))(
  ( (Unit!12453) )
))
(declare-fun lt!194292 () Unit!12452)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!474 (array!25935 array!25937 (_ BitVec 32) (_ BitVec 32) V!15843 V!15843 (_ BitVec 32) (_ BitVec 64) V!15843 (_ BitVec 32) Int) Unit!12452)

(assert (=> b!424783 (= lt!194292 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!474 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39620 res!248642) b!424771))

(assert (= (and b!424771 res!248641) b!424782))

(assert (= (and b!424782 res!248640) b!424778))

(assert (= (and b!424778 res!248634) b!424776))

(assert (= (and b!424776 res!248632) b!424780))

(assert (= (and b!424780 res!248635) b!424773))

(assert (= (and b!424773 res!248633) b!424779))

(assert (= (and b!424779 res!248643) b!424772))

(assert (= (and b!424772 res!248631) b!424781))

(assert (= (and b!424781 res!248638) b!424768))

(assert (= (and b!424768 res!248639) b!424774))

(assert (= (and b!424774 res!248636) b!424777))

(assert (= (and b!424777 res!248637) b!424783))

(assert (= (and b!424769 condMapEmpty!18201) mapIsEmpty!18201))

(assert (= (and b!424769 (not condMapEmpty!18201)) mapNonEmpty!18201))

(get-info :version)

(assert (= (and mapNonEmpty!18201 ((_ is ValueCellFull!5183) mapValue!18201)) b!424775))

(assert (= (and b!424769 ((_ is ValueCellFull!5183) mapDefault!18201)) b!424770))

(assert (= start!39620 b!424769))

(declare-fun m!413289 () Bool)

(assert (=> start!39620 m!413289))

(declare-fun m!413291 () Bool)

(assert (=> start!39620 m!413291))

(declare-fun m!413293 () Bool)

(assert (=> b!424779 m!413293))

(declare-fun m!413295 () Bool)

(assert (=> mapNonEmpty!18201 m!413295))

(declare-fun m!413297 () Bool)

(assert (=> b!424771 m!413297))

(declare-fun m!413299 () Bool)

(assert (=> b!424783 m!413299))

(declare-fun m!413301 () Bool)

(assert (=> b!424783 m!413301))

(assert (=> b!424783 m!413301))

(declare-fun m!413303 () Bool)

(assert (=> b!424783 m!413303))

(declare-fun m!413305 () Bool)

(assert (=> b!424783 m!413305))

(declare-fun m!413307 () Bool)

(assert (=> b!424778 m!413307))

(declare-fun m!413309 () Bool)

(assert (=> b!424776 m!413309))

(declare-fun m!413311 () Bool)

(assert (=> b!424781 m!413311))

(declare-fun m!413313 () Bool)

(assert (=> b!424781 m!413313))

(declare-fun m!413315 () Bool)

(assert (=> b!424777 m!413315))

(declare-fun m!413317 () Bool)

(assert (=> b!424777 m!413317))

(declare-fun m!413319 () Bool)

(assert (=> b!424777 m!413319))

(declare-fun m!413321 () Bool)

(assert (=> b!424772 m!413321))

(declare-fun m!413323 () Bool)

(assert (=> b!424768 m!413323))

(declare-fun m!413325 () Bool)

(assert (=> b!424773 m!413325))

(check-sat (not b!424771) (not b!424778) (not b!424768) tp_is_empty!11053 (not b!424783) (not b!424777) (not b!424772) (not b_next!9901) b_and!17531 (not b!424773) (not start!39620) (not mapNonEmpty!18201) (not b!424781) (not b!424776))
(check-sat b_and!17531 (not b_next!9901))
