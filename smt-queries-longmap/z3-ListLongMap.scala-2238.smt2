; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36876 () Bool)

(assert start!36876)

(declare-fun b_free!8017 () Bool)

(declare-fun b_next!8017 () Bool)

(assert (=> start!36876 (= b_free!8017 (not b_next!8017))))

(declare-fun tp!28767 () Bool)

(declare-fun b_and!15273 () Bool)

(assert (=> start!36876 (= tp!28767 b_and!15273)))

(declare-fun res!207197 () Bool)

(declare-fun e!225731 () Bool)

(assert (=> start!36876 (=> (not res!207197) (not e!225731))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36876 (= res!207197 (validMask!0 mask!970))))

(assert (=> start!36876 e!225731))

(declare-datatypes ((V!12659 0))(
  ( (V!12660 (val!4377 Int)) )
))
(declare-datatypes ((ValueCell!3989 0))(
  ( (ValueCellFull!3989 (v!6575 V!12659)) (EmptyCell!3989) )
))
(declare-datatypes ((array!21262 0))(
  ( (array!21263 (arr!10099 (Array (_ BitVec 32) ValueCell!3989)) (size!10451 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21262)

(declare-fun e!225733 () Bool)

(declare-fun array_inv!7492 (array!21262) Bool)

(assert (=> start!36876 (and (array_inv!7492 _values!506) e!225733)))

(assert (=> start!36876 tp!28767))

(assert (=> start!36876 true))

(declare-fun tp_is_empty!8665 () Bool)

(assert (=> start!36876 tp_is_empty!8665))

(declare-datatypes ((array!21264 0))(
  ( (array!21265 (arr!10100 (Array (_ BitVec 32) (_ BitVec 64))) (size!10452 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21264)

(declare-fun array_inv!7493 (array!21264) Bool)

(assert (=> start!36876 (array_inv!7493 _keys!658)))

(declare-fun b!369322 () Bool)

(declare-fun res!207204 () Bool)

(declare-fun e!225734 () Bool)

(assert (=> b!369322 (=> (not res!207204) (not e!225734))))

(declare-fun lt!169740 () array!21264)

(declare-datatypes ((List!5540 0))(
  ( (Nil!5537) (Cons!5536 (h!6392 (_ BitVec 64)) (t!10682 List!5540)) )
))
(declare-fun arrayNoDuplicates!0 (array!21264 (_ BitVec 32) List!5540) Bool)

(assert (=> b!369322 (= res!207204 (arrayNoDuplicates!0 lt!169740 #b00000000000000000000000000000000 Nil!5537))))

(declare-fun b!369323 () Bool)

(assert (=> b!369323 (= e!225731 e!225734)))

(declare-fun res!207200 () Bool)

(assert (=> b!369323 (=> (not res!207200) (not e!225734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21264 (_ BitVec 32)) Bool)

(assert (=> b!369323 (= res!207200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169740 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369323 (= lt!169740 (array!21265 (store (arr!10100 _keys!658) i!548 k0!778) (size!10452 _keys!658)))))

(declare-fun mapNonEmpty!14562 () Bool)

(declare-fun mapRes!14562 () Bool)

(declare-fun tp!28766 () Bool)

(declare-fun e!225730 () Bool)

(assert (=> mapNonEmpty!14562 (= mapRes!14562 (and tp!28766 e!225730))))

(declare-fun mapRest!14562 () (Array (_ BitVec 32) ValueCell!3989))

(declare-fun mapValue!14562 () ValueCell!3989)

(declare-fun mapKey!14562 () (_ BitVec 32))

(assert (=> mapNonEmpty!14562 (= (arr!10099 _values!506) (store mapRest!14562 mapKey!14562 mapValue!14562))))

(declare-fun b!369324 () Bool)

(declare-fun res!207198 () Bool)

(assert (=> b!369324 (=> (not res!207198) (not e!225731))))

(declare-fun arrayContainsKey!0 (array!21264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369324 (= res!207198 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369325 () Bool)

(declare-fun res!207201 () Bool)

(assert (=> b!369325 (=> (not res!207201) (not e!225731))))

(assert (=> b!369325 (= res!207201 (or (= (select (arr!10100 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10100 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369326 () Bool)

(declare-fun e!225732 () Bool)

(assert (=> b!369326 (= e!225732 tp_is_empty!8665)))

(declare-fun b!369327 () Bool)

(assert (=> b!369327 (= e!225733 (and e!225732 mapRes!14562))))

(declare-fun condMapEmpty!14562 () Bool)

(declare-fun mapDefault!14562 () ValueCell!3989)

(assert (=> b!369327 (= condMapEmpty!14562 (= (arr!10099 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3989)) mapDefault!14562)))))

(declare-fun b!369328 () Bool)

(declare-fun res!207205 () Bool)

(assert (=> b!369328 (=> (not res!207205) (not e!225731))))

(assert (=> b!369328 (= res!207205 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10452 _keys!658))))))

(declare-fun b!369329 () Bool)

(declare-fun res!207206 () Bool)

(assert (=> b!369329 (=> (not res!207206) (not e!225731))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369329 (= res!207206 (and (= (size!10451 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10452 _keys!658) (size!10451 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369330 () Bool)

(declare-fun res!207202 () Bool)

(assert (=> b!369330 (=> (not res!207202) (not e!225731))))

(assert (=> b!369330 (= res!207202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369331 () Bool)

(declare-fun res!207203 () Bool)

(assert (=> b!369331 (=> (not res!207203) (not e!225731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369331 (= res!207203 (validKeyInArray!0 k0!778))))

(declare-fun b!369332 () Bool)

(declare-fun res!207199 () Bool)

(assert (=> b!369332 (=> (not res!207199) (not e!225731))))

(assert (=> b!369332 (= res!207199 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5537))))

(declare-fun mapIsEmpty!14562 () Bool)

(assert (=> mapIsEmpty!14562 mapRes!14562))

(declare-fun b!369333 () Bool)

(assert (=> b!369333 (= e!225730 tp_is_empty!8665)))

(declare-fun b!369334 () Bool)

(assert (=> b!369334 (= e!225734 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5714 0))(
  ( (tuple2!5715 (_1!2868 (_ BitVec 64)) (_2!2868 V!12659)) )
))
(declare-datatypes ((List!5541 0))(
  ( (Nil!5538) (Cons!5537 (h!6393 tuple2!5714) (t!10683 List!5541)) )
))
(declare-datatypes ((ListLongMap!4629 0))(
  ( (ListLongMap!4630 (toList!2330 List!5541)) )
))
(declare-fun lt!169739 () ListLongMap!4629)

(declare-fun zeroValue!472 () V!12659)

(declare-fun v!373 () V!12659)

(declare-fun minValue!472 () V!12659)

(declare-fun getCurrentListMapNoExtraKeys!639 (array!21264 array!21262 (_ BitVec 32) (_ BitVec 32) V!12659 V!12659 (_ BitVec 32) Int) ListLongMap!4629)

(assert (=> b!369334 (= lt!169739 (getCurrentListMapNoExtraKeys!639 lt!169740 (array!21263 (store (arr!10099 _values!506) i!548 (ValueCellFull!3989 v!373)) (size!10451 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169741 () ListLongMap!4629)

(assert (=> b!369334 (= lt!169741 (getCurrentListMapNoExtraKeys!639 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!36876 res!207197) b!369329))

(assert (= (and b!369329 res!207206) b!369330))

(assert (= (and b!369330 res!207202) b!369332))

(assert (= (and b!369332 res!207199) b!369328))

(assert (= (and b!369328 res!207205) b!369331))

(assert (= (and b!369331 res!207203) b!369325))

(assert (= (and b!369325 res!207201) b!369324))

(assert (= (and b!369324 res!207198) b!369323))

(assert (= (and b!369323 res!207200) b!369322))

(assert (= (and b!369322 res!207204) b!369334))

(assert (= (and b!369327 condMapEmpty!14562) mapIsEmpty!14562))

(assert (= (and b!369327 (not condMapEmpty!14562)) mapNonEmpty!14562))

(get-info :version)

(assert (= (and mapNonEmpty!14562 ((_ is ValueCellFull!3989) mapValue!14562)) b!369333))

(assert (= (and b!369327 ((_ is ValueCellFull!3989) mapDefault!14562)) b!369326))

(assert (= start!36876 b!369327))

(declare-fun m!365993 () Bool)

(assert (=> b!369323 m!365993))

(declare-fun m!365995 () Bool)

(assert (=> b!369323 m!365995))

(declare-fun m!365997 () Bool)

(assert (=> b!369330 m!365997))

(declare-fun m!365999 () Bool)

(assert (=> b!369332 m!365999))

(declare-fun m!366001 () Bool)

(assert (=> b!369324 m!366001))

(declare-fun m!366003 () Bool)

(assert (=> mapNonEmpty!14562 m!366003))

(declare-fun m!366005 () Bool)

(assert (=> b!369334 m!366005))

(declare-fun m!366007 () Bool)

(assert (=> b!369334 m!366007))

(declare-fun m!366009 () Bool)

(assert (=> b!369334 m!366009))

(declare-fun m!366011 () Bool)

(assert (=> start!36876 m!366011))

(declare-fun m!366013 () Bool)

(assert (=> start!36876 m!366013))

(declare-fun m!366015 () Bool)

(assert (=> start!36876 m!366015))

(declare-fun m!366017 () Bool)

(assert (=> b!369331 m!366017))

(declare-fun m!366019 () Bool)

(assert (=> b!369322 m!366019))

(declare-fun m!366021 () Bool)

(assert (=> b!369325 m!366021))

(check-sat (not b!369324) (not b!369322) (not b_next!8017) tp_is_empty!8665 (not b!369332) (not start!36876) (not b!369330) b_and!15273 (not b!369334) (not mapNonEmpty!14562) (not b!369323) (not b!369331))
(check-sat b_and!15273 (not b_next!8017))
