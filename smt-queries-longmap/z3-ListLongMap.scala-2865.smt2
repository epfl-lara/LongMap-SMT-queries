; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41248 () Bool)

(assert start!41248)

(declare-fun b_free!11091 () Bool)

(declare-fun b_next!11091 () Bool)

(assert (=> start!41248 (= b_free!11091 (not b_next!11091))))

(declare-fun tp!39112 () Bool)

(declare-fun b_and!19411 () Bool)

(assert (=> start!41248 (= tp!39112 b_and!19411)))

(declare-fun b!461586 () Bool)

(declare-fun res!276143 () Bool)

(declare-fun e!269186 () Bool)

(assert (=> b!461586 (=> (not res!276143) (not e!269186))))

(declare-datatypes ((array!28657 0))(
  ( (array!28658 (arr!13768 (Array (_ BitVec 32) (_ BitVec 64))) (size!14120 (_ BitVec 32))) )
))
(declare-fun lt!209041 () array!28657)

(declare-datatypes ((List!8330 0))(
  ( (Nil!8327) (Cons!8326 (h!9182 (_ BitVec 64)) (t!14272 List!8330)) )
))
(declare-fun arrayNoDuplicates!0 (array!28657 (_ BitVec 32) List!8330) Bool)

(assert (=> b!461586 (= res!276143 (arrayNoDuplicates!0 lt!209041 #b00000000000000000000000000000000 Nil!8327))))

(declare-fun b!461587 () Bool)

(declare-fun res!276148 () Bool)

(declare-fun e!269179 () Bool)

(assert (=> b!461587 (=> (not res!276148) (not e!269179))))

(declare-fun _keys!709 () array!28657)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461587 (= res!276148 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!461588 () Bool)

(declare-fun res!276140 () Bool)

(assert (=> b!461588 (=> (not res!276140) (not e!269179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461588 (= res!276140 (validKeyInArray!0 k0!794))))

(declare-fun b!461590 () Bool)

(declare-fun res!276139 () Bool)

(assert (=> b!461590 (=> (not res!276139) (not e!269179))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461590 (= res!276139 (validMask!0 mask!1025))))

(declare-fun b!461591 () Bool)

(declare-fun e!269181 () Bool)

(declare-fun e!269183 () Bool)

(declare-fun mapRes!20296 () Bool)

(assert (=> b!461591 (= e!269181 (and e!269183 mapRes!20296))))

(declare-fun condMapEmpty!20296 () Bool)

(declare-datatypes ((V!17677 0))(
  ( (V!17678 (val!6259 Int)) )
))
(declare-datatypes ((ValueCell!5871 0))(
  ( (ValueCellFull!5871 (v!8541 V!17677)) (EmptyCell!5871) )
))
(declare-datatypes ((array!28659 0))(
  ( (array!28660 (arr!13769 (Array (_ BitVec 32) ValueCell!5871)) (size!14121 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28659)

(declare-fun mapDefault!20296 () ValueCell!5871)

(assert (=> b!461591 (= condMapEmpty!20296 (= (arr!13769 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5871)) mapDefault!20296)))))

(declare-fun mapNonEmpty!20296 () Bool)

(declare-fun tp!39111 () Bool)

(declare-fun e!269182 () Bool)

(assert (=> mapNonEmpty!20296 (= mapRes!20296 (and tp!39111 e!269182))))

(declare-fun mapKey!20296 () (_ BitVec 32))

(declare-fun mapRest!20296 () (Array (_ BitVec 32) ValueCell!5871))

(declare-fun mapValue!20296 () ValueCell!5871)

(assert (=> mapNonEmpty!20296 (= (arr!13769 _values!549) (store mapRest!20296 mapKey!20296 mapValue!20296))))

(declare-fun b!461592 () Bool)

(declare-fun res!276147 () Bool)

(assert (=> b!461592 (=> (not res!276147) (not e!269179))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!461592 (= res!276147 (and (= (size!14121 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14120 _keys!709) (size!14121 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!461593 () Bool)

(declare-fun res!276142 () Bool)

(assert (=> b!461593 (=> (not res!276142) (not e!269179))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461593 (= res!276142 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14120 _keys!709))))))

(declare-fun b!461594 () Bool)

(declare-fun res!276144 () Bool)

(assert (=> b!461594 (=> (not res!276144) (not e!269179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28657 (_ BitVec 32)) Bool)

(assert (=> b!461594 (= res!276144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!461595 () Bool)

(declare-fun tp_is_empty!12429 () Bool)

(assert (=> b!461595 (= e!269183 tp_is_empty!12429)))

(declare-fun b!461596 () Bool)

(declare-fun res!276138 () Bool)

(assert (=> b!461596 (=> (not res!276138) (not e!269179))))

(assert (=> b!461596 (= res!276138 (or (= (select (arr!13768 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13768 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461597 () Bool)

(assert (=> b!461597 (= e!269179 e!269186)))

(declare-fun res!276146 () Bool)

(assert (=> b!461597 (=> (not res!276146) (not e!269186))))

(assert (=> b!461597 (= res!276146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!209041 mask!1025))))

(assert (=> b!461597 (= lt!209041 (array!28658 (store (arr!13768 _keys!709) i!563 k0!794) (size!14120 _keys!709)))))

(declare-datatypes ((tuple2!8258 0))(
  ( (tuple2!8259 (_1!4140 (_ BitVec 64)) (_2!4140 V!17677)) )
))
(declare-fun lt!209038 () tuple2!8258)

(declare-fun e!269184 () Bool)

(declare-datatypes ((List!8331 0))(
  ( (Nil!8328) (Cons!8327 (h!9183 tuple2!8258) (t!14273 List!8331)) )
))
(declare-datatypes ((ListLongMap!7171 0))(
  ( (ListLongMap!7172 (toList!3601 List!8331)) )
))
(declare-fun lt!209042 () ListLongMap!7171)

(declare-fun lt!209039 () ListLongMap!7171)

(declare-fun b!461598 () Bool)

(declare-fun +!1635 (ListLongMap!7171 tuple2!8258) ListLongMap!7171)

(assert (=> b!461598 (= e!269184 (= lt!209039 (+!1635 lt!209042 lt!209038)))))

(declare-fun b!461599 () Bool)

(declare-fun e!269185 () Bool)

(assert (=> b!461599 (= e!269186 e!269185)))

(declare-fun res!276136 () Bool)

(assert (=> b!461599 (=> (not res!276136) (not e!269185))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!461599 (= res!276136 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17677)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17677)

(declare-fun lt!209040 () array!28659)

(declare-fun getCurrentListMapNoExtraKeys!1781 (array!28657 array!28659 (_ BitVec 32) (_ BitVec 32) V!17677 V!17677 (_ BitVec 32) Int) ListLongMap!7171)

(assert (=> b!461599 (= lt!209039 (getCurrentListMapNoExtraKeys!1781 lt!209041 lt!209040 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17677)

(assert (=> b!461599 (= lt!209040 (array!28660 (store (arr!13769 _values!549) i!563 (ValueCellFull!5871 v!412)) (size!14121 _values!549)))))

(assert (=> b!461599 (= lt!209042 (getCurrentListMapNoExtraKeys!1781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!20296 () Bool)

(assert (=> mapIsEmpty!20296 mapRes!20296))

(declare-fun b!461600 () Bool)

(declare-fun res!276149 () Bool)

(assert (=> b!461600 (=> (not res!276149) (not e!269186))))

(assert (=> b!461600 (= res!276149 (bvsle from!863 i!563))))

(declare-fun b!461601 () Bool)

(assert (=> b!461601 (= e!269185 (not e!269184))))

(declare-fun res!276145 () Bool)

(assert (=> b!461601 (=> res!276145 e!269184)))

(assert (=> b!461601 (= res!276145 (validKeyInArray!0 (select (arr!13768 _keys!709) from!863)))))

(assert (=> b!461601 (= (getCurrentListMapNoExtraKeys!1781 lt!209041 lt!209040 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1635 (getCurrentListMapNoExtraKeys!1781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!209038))))

(assert (=> b!461601 (= lt!209038 (tuple2!8259 k0!794 v!412))))

(declare-datatypes ((Unit!13436 0))(
  ( (Unit!13437) )
))
(declare-fun lt!209043 () Unit!13436)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!791 (array!28657 array!28659 (_ BitVec 32) (_ BitVec 32) V!17677 V!17677 (_ BitVec 32) (_ BitVec 64) V!17677 (_ BitVec 32) Int) Unit!13436)

(assert (=> b!461601 (= lt!209043 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!791 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461602 () Bool)

(assert (=> b!461602 (= e!269182 tp_is_empty!12429)))

(declare-fun b!461589 () Bool)

(declare-fun res!276141 () Bool)

(assert (=> b!461589 (=> (not res!276141) (not e!269179))))

(assert (=> b!461589 (= res!276141 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8327))))

(declare-fun res!276137 () Bool)

(assert (=> start!41248 (=> (not res!276137) (not e!269179))))

(assert (=> start!41248 (= res!276137 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14120 _keys!709))))))

(assert (=> start!41248 e!269179))

(assert (=> start!41248 tp_is_empty!12429))

(assert (=> start!41248 tp!39112))

(assert (=> start!41248 true))

(declare-fun array_inv!9960 (array!28659) Bool)

(assert (=> start!41248 (and (array_inv!9960 _values!549) e!269181)))

(declare-fun array_inv!9961 (array!28657) Bool)

(assert (=> start!41248 (array_inv!9961 _keys!709)))

(assert (= (and start!41248 res!276137) b!461590))

(assert (= (and b!461590 res!276139) b!461592))

(assert (= (and b!461592 res!276147) b!461594))

(assert (= (and b!461594 res!276144) b!461589))

(assert (= (and b!461589 res!276141) b!461593))

(assert (= (and b!461593 res!276142) b!461588))

(assert (= (and b!461588 res!276140) b!461596))

(assert (= (and b!461596 res!276138) b!461587))

(assert (= (and b!461587 res!276148) b!461597))

(assert (= (and b!461597 res!276146) b!461586))

(assert (= (and b!461586 res!276143) b!461600))

(assert (= (and b!461600 res!276149) b!461599))

(assert (= (and b!461599 res!276136) b!461601))

(assert (= (and b!461601 (not res!276145)) b!461598))

(assert (= (and b!461591 condMapEmpty!20296) mapIsEmpty!20296))

(assert (= (and b!461591 (not condMapEmpty!20296)) mapNonEmpty!20296))

(get-info :version)

(assert (= (and mapNonEmpty!20296 ((_ is ValueCellFull!5871) mapValue!20296)) b!461602))

(assert (= (and b!461591 ((_ is ValueCellFull!5871) mapDefault!20296)) b!461595))

(assert (= start!41248 b!461591))

(declare-fun m!444713 () Bool)

(assert (=> b!461588 m!444713))

(declare-fun m!444715 () Bool)

(assert (=> b!461596 m!444715))

(declare-fun m!444717 () Bool)

(assert (=> b!461589 m!444717))

(declare-fun m!444719 () Bool)

(assert (=> b!461601 m!444719))

(declare-fun m!444721 () Bool)

(assert (=> b!461601 m!444721))

(declare-fun m!444723 () Bool)

(assert (=> b!461601 m!444723))

(assert (=> b!461601 m!444721))

(declare-fun m!444725 () Bool)

(assert (=> b!461601 m!444725))

(assert (=> b!461601 m!444719))

(declare-fun m!444727 () Bool)

(assert (=> b!461601 m!444727))

(declare-fun m!444729 () Bool)

(assert (=> b!461601 m!444729))

(declare-fun m!444731 () Bool)

(assert (=> start!41248 m!444731))

(declare-fun m!444733 () Bool)

(assert (=> start!41248 m!444733))

(declare-fun m!444735 () Bool)

(assert (=> b!461598 m!444735))

(declare-fun m!444737 () Bool)

(assert (=> b!461587 m!444737))

(declare-fun m!444739 () Bool)

(assert (=> b!461599 m!444739))

(declare-fun m!444741 () Bool)

(assert (=> b!461599 m!444741))

(declare-fun m!444743 () Bool)

(assert (=> b!461599 m!444743))

(declare-fun m!444745 () Bool)

(assert (=> b!461586 m!444745))

(declare-fun m!444747 () Bool)

(assert (=> b!461594 m!444747))

(declare-fun m!444749 () Bool)

(assert (=> b!461590 m!444749))

(declare-fun m!444751 () Bool)

(assert (=> mapNonEmpty!20296 m!444751))

(declare-fun m!444753 () Bool)

(assert (=> b!461597 m!444753))

(declare-fun m!444755 () Bool)

(assert (=> b!461597 m!444755))

(check-sat (not b!461587) (not b!461590) (not b!461597) b_and!19411 (not b!461601) (not b!461599) (not b!461586) (not mapNonEmpty!20296) (not start!41248) (not b!461598) tp_is_empty!12429 (not b!461589) (not b_next!11091) (not b!461594) (not b!461588))
(check-sat b_and!19411 (not b_next!11091))
(get-model)

(declare-fun d!74865 () Bool)

(assert (=> d!74865 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!461590 d!74865))

(declare-fun b!461662 () Bool)

(declare-fun e!269217 () Bool)

(declare-fun call!30174 () Bool)

(assert (=> b!461662 (= e!269217 call!30174)))

(declare-fun bm!30171 () Bool)

(assert (=> bm!30171 (= call!30174 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!461663 () Bool)

(declare-fun e!269219 () Bool)

(assert (=> b!461663 (= e!269219 e!269217)))

(declare-fun lt!209069 () (_ BitVec 64))

(assert (=> b!461663 (= lt!209069 (select (arr!13768 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!209068 () Unit!13436)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28657 (_ BitVec 64) (_ BitVec 32)) Unit!13436)

(assert (=> b!461663 (= lt!209068 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!209069 #b00000000000000000000000000000000))))

(assert (=> b!461663 (arrayContainsKey!0 _keys!709 lt!209069 #b00000000000000000000000000000000)))

(declare-fun lt!209070 () Unit!13436)

(assert (=> b!461663 (= lt!209070 lt!209068)))

(declare-fun res!276196 () Bool)

(declare-datatypes ((SeekEntryResult!3537 0))(
  ( (MissingZero!3537 (index!16327 (_ BitVec 32))) (Found!3537 (index!16328 (_ BitVec 32))) (Intermediate!3537 (undefined!4349 Bool) (index!16329 (_ BitVec 32)) (x!43023 (_ BitVec 32))) (Undefined!3537) (MissingVacant!3537 (index!16330 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28657 (_ BitVec 32)) SeekEntryResult!3537)

(assert (=> b!461663 (= res!276196 (= (seekEntryOrOpen!0 (select (arr!13768 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3537 #b00000000000000000000000000000000)))))

(assert (=> b!461663 (=> (not res!276196) (not e!269217))))

(declare-fun d!74867 () Bool)

(declare-fun res!276197 () Bool)

(declare-fun e!269218 () Bool)

(assert (=> d!74867 (=> res!276197 e!269218)))

(assert (=> d!74867 (= res!276197 (bvsge #b00000000000000000000000000000000 (size!14120 _keys!709)))))

(assert (=> d!74867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!269218)))

(declare-fun b!461664 () Bool)

(assert (=> b!461664 (= e!269219 call!30174)))

(declare-fun b!461665 () Bool)

(assert (=> b!461665 (= e!269218 e!269219)))

(declare-fun c!56584 () Bool)

(assert (=> b!461665 (= c!56584 (validKeyInArray!0 (select (arr!13768 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74867 (not res!276197)) b!461665))

(assert (= (and b!461665 c!56584) b!461663))

(assert (= (and b!461665 (not c!56584)) b!461664))

(assert (= (and b!461663 res!276196) b!461662))

(assert (= (or b!461662 b!461664) bm!30171))

(declare-fun m!444801 () Bool)

(assert (=> bm!30171 m!444801))

(declare-fun m!444803 () Bool)

(assert (=> b!461663 m!444803))

(declare-fun m!444805 () Bool)

(assert (=> b!461663 m!444805))

(declare-fun m!444807 () Bool)

(assert (=> b!461663 m!444807))

(assert (=> b!461663 m!444803))

(declare-fun m!444809 () Bool)

(assert (=> b!461663 m!444809))

(assert (=> b!461665 m!444803))

(assert (=> b!461665 m!444803))

(declare-fun m!444811 () Bool)

(assert (=> b!461665 m!444811))

(assert (=> b!461594 d!74867))

(declare-fun d!74869 () Bool)

(assert (=> d!74869 (= (array_inv!9960 _values!549) (bvsge (size!14121 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41248 d!74869))

(declare-fun d!74871 () Bool)

(assert (=> d!74871 (= (array_inv!9961 _keys!709) (bvsge (size!14120 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41248 d!74871))

(declare-fun b!461690 () Bool)

(declare-fun e!269238 () Bool)

(declare-fun e!269234 () Bool)

(assert (=> b!461690 (= e!269238 e!269234)))

(declare-fun c!56593 () Bool)

(declare-fun e!269237 () Bool)

(assert (=> b!461690 (= c!56593 e!269237)))

(declare-fun res!276206 () Bool)

(assert (=> b!461690 (=> (not res!276206) (not e!269237))))

(assert (=> b!461690 (= res!276206 (bvslt from!863 (size!14120 lt!209041)))))

(declare-fun call!30177 () ListLongMap!7171)

(declare-fun bm!30174 () Bool)

(assert (=> bm!30174 (= call!30177 (getCurrentListMapNoExtraKeys!1781 lt!209041 lt!209040 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!461691 () Bool)

(declare-fun e!269240 () Bool)

(declare-fun lt!209091 () ListLongMap!7171)

(assert (=> b!461691 (= e!269240 (= lt!209091 (getCurrentListMapNoExtraKeys!1781 lt!209041 lt!209040 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461692 () Bool)

(declare-fun e!269236 () ListLongMap!7171)

(assert (=> b!461692 (= e!269236 (ListLongMap!7172 Nil!8328))))

(declare-fun b!461693 () Bool)

(assert (=> b!461693 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14120 lt!209041)))))

(assert (=> b!461693 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14121 lt!209040)))))

(declare-fun e!269235 () Bool)

(declare-fun apply!318 (ListLongMap!7171 (_ BitVec 64)) V!17677)

(declare-fun get!6797 (ValueCell!5871 V!17677) V!17677)

(declare-fun dynLambda!911 (Int (_ BitVec 64)) V!17677)

(assert (=> b!461693 (= e!269235 (= (apply!318 lt!209091 (select (arr!13768 lt!209041) from!863)) (get!6797 (select (arr!13769 lt!209040) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461694 () Bool)

(assert (=> b!461694 (= e!269234 e!269235)))

(assert (=> b!461694 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14120 lt!209041)))))

(declare-fun res!276207 () Bool)

(declare-fun contains!2512 (ListLongMap!7171 (_ BitVec 64)) Bool)

(assert (=> b!461694 (= res!276207 (contains!2512 lt!209091 (select (arr!13768 lt!209041) from!863)))))

(assert (=> b!461694 (=> (not res!276207) (not e!269235))))

(declare-fun b!461695 () Bool)

(declare-fun lt!209087 () Unit!13436)

(declare-fun lt!209090 () Unit!13436)

(assert (=> b!461695 (= lt!209087 lt!209090)))

(declare-fun lt!209085 () (_ BitVec 64))

(declare-fun lt!209088 () (_ BitVec 64))

(declare-fun lt!209089 () ListLongMap!7171)

(declare-fun lt!209086 () V!17677)

(assert (=> b!461695 (not (contains!2512 (+!1635 lt!209089 (tuple2!8259 lt!209088 lt!209086)) lt!209085))))

(declare-fun addStillNotContains!151 (ListLongMap!7171 (_ BitVec 64) V!17677 (_ BitVec 64)) Unit!13436)

(assert (=> b!461695 (= lt!209090 (addStillNotContains!151 lt!209089 lt!209088 lt!209086 lt!209085))))

(assert (=> b!461695 (= lt!209085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!461695 (= lt!209086 (get!6797 (select (arr!13769 lt!209040) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461695 (= lt!209088 (select (arr!13768 lt!209041) from!863))))

(assert (=> b!461695 (= lt!209089 call!30177)))

(declare-fun e!269239 () ListLongMap!7171)

(assert (=> b!461695 (= e!269239 (+!1635 call!30177 (tuple2!8259 (select (arr!13768 lt!209041) from!863) (get!6797 (select (arr!13769 lt!209040) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461696 () Bool)

(assert (=> b!461696 (= e!269236 e!269239)))

(declare-fun c!56594 () Bool)

(assert (=> b!461696 (= c!56594 (validKeyInArray!0 (select (arr!13768 lt!209041) from!863)))))

(declare-fun b!461697 () Bool)

(declare-fun isEmpty!565 (ListLongMap!7171) Bool)

(assert (=> b!461697 (= e!269240 (isEmpty!565 lt!209091))))

(declare-fun b!461698 () Bool)

(assert (=> b!461698 (= e!269237 (validKeyInArray!0 (select (arr!13768 lt!209041) from!863)))))

(assert (=> b!461698 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!461699 () Bool)

(assert (=> b!461699 (= e!269234 e!269240)))

(declare-fun c!56596 () Bool)

(assert (=> b!461699 (= c!56596 (bvslt from!863 (size!14120 lt!209041)))))

(declare-fun b!461700 () Bool)

(assert (=> b!461700 (= e!269239 call!30177)))

(declare-fun d!74873 () Bool)

(assert (=> d!74873 e!269238))

(declare-fun res!276209 () Bool)

(assert (=> d!74873 (=> (not res!276209) (not e!269238))))

(assert (=> d!74873 (= res!276209 (not (contains!2512 lt!209091 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74873 (= lt!209091 e!269236)))

(declare-fun c!56595 () Bool)

(assert (=> d!74873 (= c!56595 (bvsge from!863 (size!14120 lt!209041)))))

(assert (=> d!74873 (validMask!0 mask!1025)))

(assert (=> d!74873 (= (getCurrentListMapNoExtraKeys!1781 lt!209041 lt!209040 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!209091)))

(declare-fun b!461701 () Bool)

(declare-fun res!276208 () Bool)

(assert (=> b!461701 (=> (not res!276208) (not e!269238))))

(assert (=> b!461701 (= res!276208 (not (contains!2512 lt!209091 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74873 c!56595) b!461692))

(assert (= (and d!74873 (not c!56595)) b!461696))

(assert (= (and b!461696 c!56594) b!461695))

(assert (= (and b!461696 (not c!56594)) b!461700))

(assert (= (or b!461695 b!461700) bm!30174))

(assert (= (and d!74873 res!276209) b!461701))

(assert (= (and b!461701 res!276208) b!461690))

(assert (= (and b!461690 res!276206) b!461698))

(assert (= (and b!461690 c!56593) b!461694))

(assert (= (and b!461690 (not c!56593)) b!461699))

(assert (= (and b!461694 res!276207) b!461693))

(assert (= (and b!461699 c!56596) b!461691))

(assert (= (and b!461699 (not c!56596)) b!461697))

(declare-fun b_lambda!9933 () Bool)

(assert (=> (not b_lambda!9933) (not b!461693)))

(declare-fun t!14276 () Bool)

(declare-fun tb!3901 () Bool)

(assert (=> (and start!41248 (= defaultEntry!557 defaultEntry!557) t!14276) tb!3901))

(declare-fun result!7349 () Bool)

(assert (=> tb!3901 (= result!7349 tp_is_empty!12429)))

(assert (=> b!461693 t!14276))

(declare-fun b_and!19415 () Bool)

(assert (= b_and!19411 (and (=> t!14276 result!7349) b_and!19415)))

(declare-fun b_lambda!9935 () Bool)

(assert (=> (not b_lambda!9935) (not b!461695)))

(assert (=> b!461695 t!14276))

(declare-fun b_and!19417 () Bool)

(assert (= b_and!19415 (and (=> t!14276 result!7349) b_and!19417)))

(declare-fun m!444813 () Bool)

(assert (=> bm!30174 m!444813))

(declare-fun m!444815 () Bool)

(assert (=> b!461693 m!444815))

(declare-fun m!444817 () Bool)

(assert (=> b!461693 m!444817))

(declare-fun m!444819 () Bool)

(assert (=> b!461693 m!444819))

(declare-fun m!444821 () Bool)

(assert (=> b!461693 m!444821))

(assert (=> b!461693 m!444815))

(assert (=> b!461693 m!444817))

(declare-fun m!444823 () Bool)

(assert (=> b!461693 m!444823))

(assert (=> b!461693 m!444819))

(declare-fun m!444825 () Bool)

(assert (=> b!461701 m!444825))

(assert (=> b!461696 m!444819))

(assert (=> b!461696 m!444819))

(declare-fun m!444827 () Bool)

(assert (=> b!461696 m!444827))

(assert (=> b!461698 m!444819))

(assert (=> b!461698 m!444819))

(assert (=> b!461698 m!444827))

(assert (=> b!461695 m!444815))

(declare-fun m!444829 () Bool)

(assert (=> b!461695 m!444829))

(declare-fun m!444831 () Bool)

(assert (=> b!461695 m!444831))

(assert (=> b!461695 m!444815))

(assert (=> b!461695 m!444817))

(assert (=> b!461695 m!444823))

(declare-fun m!444833 () Bool)

(assert (=> b!461695 m!444833))

(declare-fun m!444835 () Bool)

(assert (=> b!461695 m!444835))

(assert (=> b!461695 m!444819))

(assert (=> b!461695 m!444833))

(assert (=> b!461695 m!444817))

(assert (=> b!461694 m!444819))

(assert (=> b!461694 m!444819))

(declare-fun m!444837 () Bool)

(assert (=> b!461694 m!444837))

(declare-fun m!444839 () Bool)

(assert (=> d!74873 m!444839))

(assert (=> d!74873 m!444749))

(assert (=> b!461691 m!444813))

(declare-fun m!444841 () Bool)

(assert (=> b!461697 m!444841))

(assert (=> b!461599 d!74873))

(declare-fun b!461704 () Bool)

(declare-fun e!269245 () Bool)

(declare-fun e!269241 () Bool)

(assert (=> b!461704 (= e!269245 e!269241)))

(declare-fun c!56597 () Bool)

(declare-fun e!269244 () Bool)

(assert (=> b!461704 (= c!56597 e!269244)))

(declare-fun res!276210 () Bool)

(assert (=> b!461704 (=> (not res!276210) (not e!269244))))

(assert (=> b!461704 (= res!276210 (bvslt from!863 (size!14120 _keys!709)))))

(declare-fun call!30178 () ListLongMap!7171)

(declare-fun bm!30175 () Bool)

(assert (=> bm!30175 (= call!30178 (getCurrentListMapNoExtraKeys!1781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun e!269247 () Bool)

(declare-fun lt!209098 () ListLongMap!7171)

(declare-fun b!461705 () Bool)

(assert (=> b!461705 (= e!269247 (= lt!209098 (getCurrentListMapNoExtraKeys!1781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461706 () Bool)

(declare-fun e!269243 () ListLongMap!7171)

(assert (=> b!461706 (= e!269243 (ListLongMap!7172 Nil!8328))))

(declare-fun b!461707 () Bool)

(assert (=> b!461707 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14120 _keys!709)))))

(assert (=> b!461707 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14121 _values!549)))))

(declare-fun e!269242 () Bool)

(assert (=> b!461707 (= e!269242 (= (apply!318 lt!209098 (select (arr!13768 _keys!709) from!863)) (get!6797 (select (arr!13769 _values!549) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461708 () Bool)

(assert (=> b!461708 (= e!269241 e!269242)))

(assert (=> b!461708 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14120 _keys!709)))))

(declare-fun res!276211 () Bool)

(assert (=> b!461708 (= res!276211 (contains!2512 lt!209098 (select (arr!13768 _keys!709) from!863)))))

(assert (=> b!461708 (=> (not res!276211) (not e!269242))))

(declare-fun b!461709 () Bool)

(declare-fun lt!209094 () Unit!13436)

(declare-fun lt!209097 () Unit!13436)

(assert (=> b!461709 (= lt!209094 lt!209097)))

(declare-fun lt!209093 () V!17677)

(declare-fun lt!209095 () (_ BitVec 64))

(declare-fun lt!209096 () ListLongMap!7171)

(declare-fun lt!209092 () (_ BitVec 64))

(assert (=> b!461709 (not (contains!2512 (+!1635 lt!209096 (tuple2!8259 lt!209095 lt!209093)) lt!209092))))

(assert (=> b!461709 (= lt!209097 (addStillNotContains!151 lt!209096 lt!209095 lt!209093 lt!209092))))

(assert (=> b!461709 (= lt!209092 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!461709 (= lt!209093 (get!6797 (select (arr!13769 _values!549) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461709 (= lt!209095 (select (arr!13768 _keys!709) from!863))))

(assert (=> b!461709 (= lt!209096 call!30178)))

(declare-fun e!269246 () ListLongMap!7171)

(assert (=> b!461709 (= e!269246 (+!1635 call!30178 (tuple2!8259 (select (arr!13768 _keys!709) from!863) (get!6797 (select (arr!13769 _values!549) from!863) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461710 () Bool)

(assert (=> b!461710 (= e!269243 e!269246)))

(declare-fun c!56598 () Bool)

(assert (=> b!461710 (= c!56598 (validKeyInArray!0 (select (arr!13768 _keys!709) from!863)))))

(declare-fun b!461711 () Bool)

(assert (=> b!461711 (= e!269247 (isEmpty!565 lt!209098))))

(declare-fun b!461712 () Bool)

(assert (=> b!461712 (= e!269244 (validKeyInArray!0 (select (arr!13768 _keys!709) from!863)))))

(assert (=> b!461712 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!461713 () Bool)

(assert (=> b!461713 (= e!269241 e!269247)))

(declare-fun c!56600 () Bool)

(assert (=> b!461713 (= c!56600 (bvslt from!863 (size!14120 _keys!709)))))

(declare-fun b!461714 () Bool)

(assert (=> b!461714 (= e!269246 call!30178)))

(declare-fun d!74875 () Bool)

(assert (=> d!74875 e!269245))

(declare-fun res!276213 () Bool)

(assert (=> d!74875 (=> (not res!276213) (not e!269245))))

(assert (=> d!74875 (= res!276213 (not (contains!2512 lt!209098 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74875 (= lt!209098 e!269243)))

(declare-fun c!56599 () Bool)

(assert (=> d!74875 (= c!56599 (bvsge from!863 (size!14120 _keys!709)))))

(assert (=> d!74875 (validMask!0 mask!1025)))

(assert (=> d!74875 (= (getCurrentListMapNoExtraKeys!1781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!209098)))

(declare-fun b!461715 () Bool)

(declare-fun res!276212 () Bool)

(assert (=> b!461715 (=> (not res!276212) (not e!269245))))

(assert (=> b!461715 (= res!276212 (not (contains!2512 lt!209098 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74875 c!56599) b!461706))

(assert (= (and d!74875 (not c!56599)) b!461710))

(assert (= (and b!461710 c!56598) b!461709))

(assert (= (and b!461710 (not c!56598)) b!461714))

(assert (= (or b!461709 b!461714) bm!30175))

(assert (= (and d!74875 res!276213) b!461715))

(assert (= (and b!461715 res!276212) b!461704))

(assert (= (and b!461704 res!276210) b!461712))

(assert (= (and b!461704 c!56597) b!461708))

(assert (= (and b!461704 (not c!56597)) b!461713))

(assert (= (and b!461708 res!276211) b!461707))

(assert (= (and b!461713 c!56600) b!461705))

(assert (= (and b!461713 (not c!56600)) b!461711))

(declare-fun b_lambda!9937 () Bool)

(assert (=> (not b_lambda!9937) (not b!461707)))

(assert (=> b!461707 t!14276))

(declare-fun b_and!19419 () Bool)

(assert (= b_and!19417 (and (=> t!14276 result!7349) b_and!19419)))

(declare-fun b_lambda!9939 () Bool)

(assert (=> (not b_lambda!9939) (not b!461709)))

(assert (=> b!461709 t!14276))

(declare-fun b_and!19421 () Bool)

(assert (= b_and!19419 (and (=> t!14276 result!7349) b_and!19421)))

(declare-fun m!444843 () Bool)

(assert (=> bm!30175 m!444843))

(declare-fun m!444845 () Bool)

(assert (=> b!461707 m!444845))

(assert (=> b!461707 m!444817))

(assert (=> b!461707 m!444719))

(declare-fun m!444847 () Bool)

(assert (=> b!461707 m!444847))

(assert (=> b!461707 m!444845))

(assert (=> b!461707 m!444817))

(declare-fun m!444849 () Bool)

(assert (=> b!461707 m!444849))

(assert (=> b!461707 m!444719))

(declare-fun m!444851 () Bool)

(assert (=> b!461715 m!444851))

(assert (=> b!461710 m!444719))

(assert (=> b!461710 m!444719))

(assert (=> b!461710 m!444727))

(assert (=> b!461712 m!444719))

(assert (=> b!461712 m!444719))

(assert (=> b!461712 m!444727))

(assert (=> b!461709 m!444845))

(declare-fun m!444853 () Bool)

(assert (=> b!461709 m!444853))

(declare-fun m!444855 () Bool)

(assert (=> b!461709 m!444855))

(assert (=> b!461709 m!444845))

(assert (=> b!461709 m!444817))

(assert (=> b!461709 m!444849))

(declare-fun m!444857 () Bool)

(assert (=> b!461709 m!444857))

(declare-fun m!444859 () Bool)

(assert (=> b!461709 m!444859))

(assert (=> b!461709 m!444719))

(assert (=> b!461709 m!444857))

(assert (=> b!461709 m!444817))

(assert (=> b!461708 m!444719))

(assert (=> b!461708 m!444719))

(declare-fun m!444861 () Bool)

(assert (=> b!461708 m!444861))

(declare-fun m!444863 () Bool)

(assert (=> d!74875 m!444863))

(assert (=> d!74875 m!444749))

(assert (=> b!461705 m!444843))

(declare-fun m!444865 () Bool)

(assert (=> b!461711 m!444865))

(assert (=> b!461599 d!74875))

(declare-fun b!461726 () Bool)

(declare-fun e!269258 () Bool)

(declare-fun contains!2513 (List!8330 (_ BitVec 64)) Bool)

(assert (=> b!461726 (= e!269258 (contains!2513 Nil!8327 (select (arr!13768 lt!209041) #b00000000000000000000000000000000)))))

(declare-fun b!461727 () Bool)

(declare-fun e!269256 () Bool)

(declare-fun e!269257 () Bool)

(assert (=> b!461727 (= e!269256 e!269257)))

(declare-fun c!56603 () Bool)

(assert (=> b!461727 (= c!56603 (validKeyInArray!0 (select (arr!13768 lt!209041) #b00000000000000000000000000000000)))))

(declare-fun b!461728 () Bool)

(declare-fun call!30181 () Bool)

(assert (=> b!461728 (= e!269257 call!30181)))

(declare-fun b!461729 () Bool)

(declare-fun e!269259 () Bool)

(assert (=> b!461729 (= e!269259 e!269256)))

(declare-fun res!276222 () Bool)

(assert (=> b!461729 (=> (not res!276222) (not e!269256))))

(assert (=> b!461729 (= res!276222 (not e!269258))))

(declare-fun res!276221 () Bool)

(assert (=> b!461729 (=> (not res!276221) (not e!269258))))

(assert (=> b!461729 (= res!276221 (validKeyInArray!0 (select (arr!13768 lt!209041) #b00000000000000000000000000000000)))))

(declare-fun d!74877 () Bool)

(declare-fun res!276220 () Bool)

(assert (=> d!74877 (=> res!276220 e!269259)))

(assert (=> d!74877 (= res!276220 (bvsge #b00000000000000000000000000000000 (size!14120 lt!209041)))))

(assert (=> d!74877 (= (arrayNoDuplicates!0 lt!209041 #b00000000000000000000000000000000 Nil!8327) e!269259)))

(declare-fun b!461730 () Bool)

(assert (=> b!461730 (= e!269257 call!30181)))

(declare-fun bm!30178 () Bool)

(assert (=> bm!30178 (= call!30181 (arrayNoDuplicates!0 lt!209041 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56603 (Cons!8326 (select (arr!13768 lt!209041) #b00000000000000000000000000000000) Nil!8327) Nil!8327)))))

(assert (= (and d!74877 (not res!276220)) b!461729))

(assert (= (and b!461729 res!276221) b!461726))

(assert (= (and b!461729 res!276222) b!461727))

(assert (= (and b!461727 c!56603) b!461730))

(assert (= (and b!461727 (not c!56603)) b!461728))

(assert (= (or b!461730 b!461728) bm!30178))

(declare-fun m!444867 () Bool)

(assert (=> b!461726 m!444867))

(assert (=> b!461726 m!444867))

(declare-fun m!444869 () Bool)

(assert (=> b!461726 m!444869))

(assert (=> b!461727 m!444867))

(assert (=> b!461727 m!444867))

(declare-fun m!444871 () Bool)

(assert (=> b!461727 m!444871))

(assert (=> b!461729 m!444867))

(assert (=> b!461729 m!444867))

(assert (=> b!461729 m!444871))

(assert (=> bm!30178 m!444867))

(declare-fun m!444873 () Bool)

(assert (=> bm!30178 m!444873))

(assert (=> b!461586 d!74877))

(declare-fun b!461731 () Bool)

(declare-fun e!269260 () Bool)

(declare-fun call!30182 () Bool)

(assert (=> b!461731 (= e!269260 call!30182)))

(declare-fun bm!30179 () Bool)

(assert (=> bm!30179 (= call!30182 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!209041 mask!1025))))

(declare-fun b!461732 () Bool)

(declare-fun e!269262 () Bool)

(assert (=> b!461732 (= e!269262 e!269260)))

(declare-fun lt!209100 () (_ BitVec 64))

(assert (=> b!461732 (= lt!209100 (select (arr!13768 lt!209041) #b00000000000000000000000000000000))))

(declare-fun lt!209099 () Unit!13436)

(assert (=> b!461732 (= lt!209099 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!209041 lt!209100 #b00000000000000000000000000000000))))

(assert (=> b!461732 (arrayContainsKey!0 lt!209041 lt!209100 #b00000000000000000000000000000000)))

(declare-fun lt!209101 () Unit!13436)

(assert (=> b!461732 (= lt!209101 lt!209099)))

(declare-fun res!276223 () Bool)

(assert (=> b!461732 (= res!276223 (= (seekEntryOrOpen!0 (select (arr!13768 lt!209041) #b00000000000000000000000000000000) lt!209041 mask!1025) (Found!3537 #b00000000000000000000000000000000)))))

(assert (=> b!461732 (=> (not res!276223) (not e!269260))))

(declare-fun d!74879 () Bool)

(declare-fun res!276224 () Bool)

(declare-fun e!269261 () Bool)

(assert (=> d!74879 (=> res!276224 e!269261)))

(assert (=> d!74879 (= res!276224 (bvsge #b00000000000000000000000000000000 (size!14120 lt!209041)))))

(assert (=> d!74879 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!209041 mask!1025) e!269261)))

(declare-fun b!461733 () Bool)

(assert (=> b!461733 (= e!269262 call!30182)))

(declare-fun b!461734 () Bool)

(assert (=> b!461734 (= e!269261 e!269262)))

(declare-fun c!56604 () Bool)

(assert (=> b!461734 (= c!56604 (validKeyInArray!0 (select (arr!13768 lt!209041) #b00000000000000000000000000000000)))))

(assert (= (and d!74879 (not res!276224)) b!461734))

(assert (= (and b!461734 c!56604) b!461732))

(assert (= (and b!461734 (not c!56604)) b!461733))

(assert (= (and b!461732 res!276223) b!461731))

(assert (= (or b!461731 b!461733) bm!30179))

(declare-fun m!444875 () Bool)

(assert (=> bm!30179 m!444875))

(assert (=> b!461732 m!444867))

(declare-fun m!444877 () Bool)

(assert (=> b!461732 m!444877))

(declare-fun m!444879 () Bool)

(assert (=> b!461732 m!444879))

(assert (=> b!461732 m!444867))

(declare-fun m!444881 () Bool)

(assert (=> b!461732 m!444881))

(assert (=> b!461734 m!444867))

(assert (=> b!461734 m!444867))

(assert (=> b!461734 m!444871))

(assert (=> b!461597 d!74879))

(declare-fun b!461735 () Bool)

(declare-fun e!269267 () Bool)

(declare-fun e!269263 () Bool)

(assert (=> b!461735 (= e!269267 e!269263)))

(declare-fun c!56605 () Bool)

(declare-fun e!269266 () Bool)

(assert (=> b!461735 (= c!56605 e!269266)))

(declare-fun res!276225 () Bool)

(assert (=> b!461735 (=> (not res!276225) (not e!269266))))

(assert (=> b!461735 (= res!276225 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14120 _keys!709)))))

(declare-fun call!30183 () ListLongMap!7171)

(declare-fun bm!30180 () Bool)

(assert (=> bm!30180 (= call!30183 (getCurrentListMapNoExtraKeys!1781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun lt!209108 () ListLongMap!7171)

(declare-fun b!461736 () Bool)

(declare-fun e!269269 () Bool)

(assert (=> b!461736 (= e!269269 (= lt!209108 (getCurrentListMapNoExtraKeys!1781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461737 () Bool)

(declare-fun e!269265 () ListLongMap!7171)

(assert (=> b!461737 (= e!269265 (ListLongMap!7172 Nil!8328))))

(declare-fun b!461738 () Bool)

(assert (=> b!461738 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14120 _keys!709)))))

(assert (=> b!461738 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14121 _values!549)))))

(declare-fun e!269264 () Bool)

(assert (=> b!461738 (= e!269264 (= (apply!318 lt!209108 (select (arr!13768 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6797 (select (arr!13769 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461739 () Bool)

(assert (=> b!461739 (= e!269263 e!269264)))

(assert (=> b!461739 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14120 _keys!709)))))

(declare-fun res!276226 () Bool)

(assert (=> b!461739 (= res!276226 (contains!2512 lt!209108 (select (arr!13768 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461739 (=> (not res!276226) (not e!269264))))

(declare-fun b!461740 () Bool)

(declare-fun lt!209104 () Unit!13436)

(declare-fun lt!209107 () Unit!13436)

(assert (=> b!461740 (= lt!209104 lt!209107)))

(declare-fun lt!209103 () V!17677)

(declare-fun lt!209106 () ListLongMap!7171)

(declare-fun lt!209102 () (_ BitVec 64))

(declare-fun lt!209105 () (_ BitVec 64))

(assert (=> b!461740 (not (contains!2512 (+!1635 lt!209106 (tuple2!8259 lt!209105 lt!209103)) lt!209102))))

(assert (=> b!461740 (= lt!209107 (addStillNotContains!151 lt!209106 lt!209105 lt!209103 lt!209102))))

(assert (=> b!461740 (= lt!209102 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!461740 (= lt!209103 (get!6797 (select (arr!13769 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461740 (= lt!209105 (select (arr!13768 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!461740 (= lt!209106 call!30183)))

(declare-fun e!269268 () ListLongMap!7171)

(assert (=> b!461740 (= e!269268 (+!1635 call!30183 (tuple2!8259 (select (arr!13768 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6797 (select (arr!13769 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461741 () Bool)

(assert (=> b!461741 (= e!269265 e!269268)))

(declare-fun c!56606 () Bool)

(assert (=> b!461741 (= c!56606 (validKeyInArray!0 (select (arr!13768 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!461742 () Bool)

(assert (=> b!461742 (= e!269269 (isEmpty!565 lt!209108))))

(declare-fun b!461743 () Bool)

(assert (=> b!461743 (= e!269266 (validKeyInArray!0 (select (arr!13768 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461743 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!461744 () Bool)

(assert (=> b!461744 (= e!269263 e!269269)))

(declare-fun c!56608 () Bool)

(assert (=> b!461744 (= c!56608 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14120 _keys!709)))))

(declare-fun b!461745 () Bool)

(assert (=> b!461745 (= e!269268 call!30183)))

(declare-fun d!74881 () Bool)

(assert (=> d!74881 e!269267))

(declare-fun res!276228 () Bool)

(assert (=> d!74881 (=> (not res!276228) (not e!269267))))

(assert (=> d!74881 (= res!276228 (not (contains!2512 lt!209108 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74881 (= lt!209108 e!269265)))

(declare-fun c!56607 () Bool)

(assert (=> d!74881 (= c!56607 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14120 _keys!709)))))

(assert (=> d!74881 (validMask!0 mask!1025)))

(assert (=> d!74881 (= (getCurrentListMapNoExtraKeys!1781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!209108)))

(declare-fun b!461746 () Bool)

(declare-fun res!276227 () Bool)

(assert (=> b!461746 (=> (not res!276227) (not e!269267))))

(assert (=> b!461746 (= res!276227 (not (contains!2512 lt!209108 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74881 c!56607) b!461737))

(assert (= (and d!74881 (not c!56607)) b!461741))

(assert (= (and b!461741 c!56606) b!461740))

(assert (= (and b!461741 (not c!56606)) b!461745))

(assert (= (or b!461740 b!461745) bm!30180))

(assert (= (and d!74881 res!276228) b!461746))

(assert (= (and b!461746 res!276227) b!461735))

(assert (= (and b!461735 res!276225) b!461743))

(assert (= (and b!461735 c!56605) b!461739))

(assert (= (and b!461735 (not c!56605)) b!461744))

(assert (= (and b!461739 res!276226) b!461738))

(assert (= (and b!461744 c!56608) b!461736))

(assert (= (and b!461744 (not c!56608)) b!461742))

(declare-fun b_lambda!9941 () Bool)

(assert (=> (not b_lambda!9941) (not b!461738)))

(assert (=> b!461738 t!14276))

(declare-fun b_and!19423 () Bool)

(assert (= b_and!19421 (and (=> t!14276 result!7349) b_and!19423)))

(declare-fun b_lambda!9943 () Bool)

(assert (=> (not b_lambda!9943) (not b!461740)))

(assert (=> b!461740 t!14276))

(declare-fun b_and!19425 () Bool)

(assert (= b_and!19423 (and (=> t!14276 result!7349) b_and!19425)))

(declare-fun m!444883 () Bool)

(assert (=> bm!30180 m!444883))

(declare-fun m!444885 () Bool)

(assert (=> b!461738 m!444885))

(assert (=> b!461738 m!444817))

(declare-fun m!444887 () Bool)

(assert (=> b!461738 m!444887))

(declare-fun m!444889 () Bool)

(assert (=> b!461738 m!444889))

(assert (=> b!461738 m!444885))

(assert (=> b!461738 m!444817))

(declare-fun m!444891 () Bool)

(assert (=> b!461738 m!444891))

(assert (=> b!461738 m!444887))

(declare-fun m!444893 () Bool)

(assert (=> b!461746 m!444893))

(assert (=> b!461741 m!444887))

(assert (=> b!461741 m!444887))

(declare-fun m!444895 () Bool)

(assert (=> b!461741 m!444895))

(assert (=> b!461743 m!444887))

(assert (=> b!461743 m!444887))

(assert (=> b!461743 m!444895))

(assert (=> b!461740 m!444885))

(declare-fun m!444897 () Bool)

(assert (=> b!461740 m!444897))

(declare-fun m!444899 () Bool)

(assert (=> b!461740 m!444899))

(assert (=> b!461740 m!444885))

(assert (=> b!461740 m!444817))

(assert (=> b!461740 m!444891))

(declare-fun m!444901 () Bool)

(assert (=> b!461740 m!444901))

(declare-fun m!444903 () Bool)

(assert (=> b!461740 m!444903))

(assert (=> b!461740 m!444887))

(assert (=> b!461740 m!444901))

(assert (=> b!461740 m!444817))

(assert (=> b!461739 m!444887))

(assert (=> b!461739 m!444887))

(declare-fun m!444905 () Bool)

(assert (=> b!461739 m!444905))

(declare-fun m!444907 () Bool)

(assert (=> d!74881 m!444907))

(assert (=> d!74881 m!444749))

(assert (=> b!461736 m!444883))

(declare-fun m!444909 () Bool)

(assert (=> b!461742 m!444909))

(assert (=> b!461601 d!74881))

(declare-fun d!74883 () Bool)

(declare-fun e!269272 () Bool)

(assert (=> d!74883 e!269272))

(declare-fun res!276233 () Bool)

(assert (=> d!74883 (=> (not res!276233) (not e!269272))))

(declare-fun lt!209119 () ListLongMap!7171)

(assert (=> d!74883 (= res!276233 (contains!2512 lt!209119 (_1!4140 lt!209038)))))

(declare-fun lt!209118 () List!8331)

(assert (=> d!74883 (= lt!209119 (ListLongMap!7172 lt!209118))))

(declare-fun lt!209120 () Unit!13436)

(declare-fun lt!209117 () Unit!13436)

(assert (=> d!74883 (= lt!209120 lt!209117)))

(declare-datatypes ((Option!381 0))(
  ( (Some!380 (v!8546 V!17677)) (None!379) )
))
(declare-fun getValueByKey!375 (List!8331 (_ BitVec 64)) Option!381)

(assert (=> d!74883 (= (getValueByKey!375 lt!209118 (_1!4140 lt!209038)) (Some!380 (_2!4140 lt!209038)))))

(declare-fun lemmaContainsTupThenGetReturnValue!197 (List!8331 (_ BitVec 64) V!17677) Unit!13436)

(assert (=> d!74883 (= lt!209117 (lemmaContainsTupThenGetReturnValue!197 lt!209118 (_1!4140 lt!209038) (_2!4140 lt!209038)))))

(declare-fun insertStrictlySorted!200 (List!8331 (_ BitVec 64) V!17677) List!8331)

(assert (=> d!74883 (= lt!209118 (insertStrictlySorted!200 (toList!3601 (getCurrentListMapNoExtraKeys!1781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557)) (_1!4140 lt!209038) (_2!4140 lt!209038)))))

(assert (=> d!74883 (= (+!1635 (getCurrentListMapNoExtraKeys!1781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!209038) lt!209119)))

(declare-fun b!461751 () Bool)

(declare-fun res!276234 () Bool)

(assert (=> b!461751 (=> (not res!276234) (not e!269272))))

(assert (=> b!461751 (= res!276234 (= (getValueByKey!375 (toList!3601 lt!209119) (_1!4140 lt!209038)) (Some!380 (_2!4140 lt!209038))))))

(declare-fun b!461752 () Bool)

(declare-fun contains!2514 (List!8331 tuple2!8258) Bool)

(assert (=> b!461752 (= e!269272 (contains!2514 (toList!3601 lt!209119) lt!209038))))

(assert (= (and d!74883 res!276233) b!461751))

(assert (= (and b!461751 res!276234) b!461752))

(declare-fun m!444911 () Bool)

(assert (=> d!74883 m!444911))

(declare-fun m!444913 () Bool)

(assert (=> d!74883 m!444913))

(declare-fun m!444915 () Bool)

(assert (=> d!74883 m!444915))

(declare-fun m!444917 () Bool)

(assert (=> d!74883 m!444917))

(declare-fun m!444919 () Bool)

(assert (=> b!461751 m!444919))

(declare-fun m!444921 () Bool)

(assert (=> b!461752 m!444921))

(assert (=> b!461601 d!74883))

(declare-fun b!461753 () Bool)

(declare-fun e!269277 () Bool)

(declare-fun e!269273 () Bool)

(assert (=> b!461753 (= e!269277 e!269273)))

(declare-fun c!56609 () Bool)

(declare-fun e!269276 () Bool)

(assert (=> b!461753 (= c!56609 e!269276)))

(declare-fun res!276235 () Bool)

(assert (=> b!461753 (=> (not res!276235) (not e!269276))))

(assert (=> b!461753 (= res!276235 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14120 lt!209041)))))

(declare-fun bm!30181 () Bool)

(declare-fun call!30184 () ListLongMap!7171)

(assert (=> bm!30181 (= call!30184 (getCurrentListMapNoExtraKeys!1781 lt!209041 lt!209040 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun lt!209127 () ListLongMap!7171)

(declare-fun e!269279 () Bool)

(declare-fun b!461754 () Bool)

(assert (=> b!461754 (= e!269279 (= lt!209127 (getCurrentListMapNoExtraKeys!1781 lt!209041 lt!209040 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461755 () Bool)

(declare-fun e!269275 () ListLongMap!7171)

(assert (=> b!461755 (= e!269275 (ListLongMap!7172 Nil!8328))))

(declare-fun b!461756 () Bool)

(assert (=> b!461756 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14120 lt!209041)))))

(assert (=> b!461756 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14121 lt!209040)))))

(declare-fun e!269274 () Bool)

(assert (=> b!461756 (= e!269274 (= (apply!318 lt!209127 (select (arr!13768 lt!209041) (bvadd #b00000000000000000000000000000001 from!863))) (get!6797 (select (arr!13769 lt!209040) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461757 () Bool)

(assert (=> b!461757 (= e!269273 e!269274)))

(assert (=> b!461757 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14120 lt!209041)))))

(declare-fun res!276236 () Bool)

(assert (=> b!461757 (= res!276236 (contains!2512 lt!209127 (select (arr!13768 lt!209041) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461757 (=> (not res!276236) (not e!269274))))

(declare-fun b!461758 () Bool)

(declare-fun lt!209123 () Unit!13436)

(declare-fun lt!209126 () Unit!13436)

(assert (=> b!461758 (= lt!209123 lt!209126)))

(declare-fun lt!209122 () V!17677)

(declare-fun lt!209121 () (_ BitVec 64))

(declare-fun lt!209125 () ListLongMap!7171)

(declare-fun lt!209124 () (_ BitVec 64))

(assert (=> b!461758 (not (contains!2512 (+!1635 lt!209125 (tuple2!8259 lt!209124 lt!209122)) lt!209121))))

(assert (=> b!461758 (= lt!209126 (addStillNotContains!151 lt!209125 lt!209124 lt!209122 lt!209121))))

(assert (=> b!461758 (= lt!209121 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!461758 (= lt!209122 (get!6797 (select (arr!13769 lt!209040) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461758 (= lt!209124 (select (arr!13768 lt!209041) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!461758 (= lt!209125 call!30184)))

(declare-fun e!269278 () ListLongMap!7171)

(assert (=> b!461758 (= e!269278 (+!1635 call!30184 (tuple2!8259 (select (arr!13768 lt!209041) (bvadd #b00000000000000000000000000000001 from!863)) (get!6797 (select (arr!13769 lt!209040) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!911 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461759 () Bool)

(assert (=> b!461759 (= e!269275 e!269278)))

(declare-fun c!56610 () Bool)

(assert (=> b!461759 (= c!56610 (validKeyInArray!0 (select (arr!13768 lt!209041) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!461760 () Bool)

(assert (=> b!461760 (= e!269279 (isEmpty!565 lt!209127))))

(declare-fun b!461761 () Bool)

(assert (=> b!461761 (= e!269276 (validKeyInArray!0 (select (arr!13768 lt!209041) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461761 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!461762 () Bool)

(assert (=> b!461762 (= e!269273 e!269279)))

(declare-fun c!56612 () Bool)

(assert (=> b!461762 (= c!56612 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14120 lt!209041)))))

(declare-fun b!461763 () Bool)

(assert (=> b!461763 (= e!269278 call!30184)))

(declare-fun d!74885 () Bool)

(assert (=> d!74885 e!269277))

(declare-fun res!276238 () Bool)

(assert (=> d!74885 (=> (not res!276238) (not e!269277))))

(assert (=> d!74885 (= res!276238 (not (contains!2512 lt!209127 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74885 (= lt!209127 e!269275)))

(declare-fun c!56611 () Bool)

(assert (=> d!74885 (= c!56611 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14120 lt!209041)))))

(assert (=> d!74885 (validMask!0 mask!1025)))

(assert (=> d!74885 (= (getCurrentListMapNoExtraKeys!1781 lt!209041 lt!209040 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!209127)))

(declare-fun b!461764 () Bool)

(declare-fun res!276237 () Bool)

(assert (=> b!461764 (=> (not res!276237) (not e!269277))))

(assert (=> b!461764 (= res!276237 (not (contains!2512 lt!209127 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74885 c!56611) b!461755))

(assert (= (and d!74885 (not c!56611)) b!461759))

(assert (= (and b!461759 c!56610) b!461758))

(assert (= (and b!461759 (not c!56610)) b!461763))

(assert (= (or b!461758 b!461763) bm!30181))

(assert (= (and d!74885 res!276238) b!461764))

(assert (= (and b!461764 res!276237) b!461753))

(assert (= (and b!461753 res!276235) b!461761))

(assert (= (and b!461753 c!56609) b!461757))

(assert (= (and b!461753 (not c!56609)) b!461762))

(assert (= (and b!461757 res!276236) b!461756))

(assert (= (and b!461762 c!56612) b!461754))

(assert (= (and b!461762 (not c!56612)) b!461760))

(declare-fun b_lambda!9945 () Bool)

(assert (=> (not b_lambda!9945) (not b!461756)))

(assert (=> b!461756 t!14276))

(declare-fun b_and!19427 () Bool)

(assert (= b_and!19425 (and (=> t!14276 result!7349) b_and!19427)))

(declare-fun b_lambda!9947 () Bool)

(assert (=> (not b_lambda!9947) (not b!461758)))

(assert (=> b!461758 t!14276))

(declare-fun b_and!19429 () Bool)

(assert (= b_and!19427 (and (=> t!14276 result!7349) b_and!19429)))

(declare-fun m!444923 () Bool)

(assert (=> bm!30181 m!444923))

(declare-fun m!444925 () Bool)

(assert (=> b!461756 m!444925))

(assert (=> b!461756 m!444817))

(declare-fun m!444927 () Bool)

(assert (=> b!461756 m!444927))

(declare-fun m!444929 () Bool)

(assert (=> b!461756 m!444929))

(assert (=> b!461756 m!444925))

(assert (=> b!461756 m!444817))

(declare-fun m!444931 () Bool)

(assert (=> b!461756 m!444931))

(assert (=> b!461756 m!444927))

(declare-fun m!444933 () Bool)

(assert (=> b!461764 m!444933))

(assert (=> b!461759 m!444927))

(assert (=> b!461759 m!444927))

(declare-fun m!444935 () Bool)

(assert (=> b!461759 m!444935))

(assert (=> b!461761 m!444927))

(assert (=> b!461761 m!444927))

(assert (=> b!461761 m!444935))

(assert (=> b!461758 m!444925))

(declare-fun m!444937 () Bool)

(assert (=> b!461758 m!444937))

(declare-fun m!444939 () Bool)

(assert (=> b!461758 m!444939))

(assert (=> b!461758 m!444925))

(assert (=> b!461758 m!444817))

(assert (=> b!461758 m!444931))

(declare-fun m!444941 () Bool)

(assert (=> b!461758 m!444941))

(declare-fun m!444943 () Bool)

(assert (=> b!461758 m!444943))

(assert (=> b!461758 m!444927))

(assert (=> b!461758 m!444941))

(assert (=> b!461758 m!444817))

(assert (=> b!461757 m!444927))

(assert (=> b!461757 m!444927))

(declare-fun m!444945 () Bool)

(assert (=> b!461757 m!444945))

(declare-fun m!444947 () Bool)

(assert (=> d!74885 m!444947))

(assert (=> d!74885 m!444749))

(assert (=> b!461754 m!444923))

(declare-fun m!444949 () Bool)

(assert (=> b!461760 m!444949))

(assert (=> b!461601 d!74885))

(declare-fun d!74887 () Bool)

(assert (=> d!74887 (= (validKeyInArray!0 (select (arr!13768 _keys!709) from!863)) (and (not (= (select (arr!13768 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13768 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!461601 d!74887))

(declare-fun b!461771 () Bool)

(declare-fun e!269285 () Bool)

(declare-fun e!269284 () Bool)

(assert (=> b!461771 (= e!269285 e!269284)))

(declare-fun c!56615 () Bool)

(assert (=> b!461771 (= c!56615 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun b!461772 () Bool)

(declare-fun call!30189 () ListLongMap!7171)

(declare-fun call!30190 () ListLongMap!7171)

(assert (=> b!461772 (= e!269284 (= call!30189 call!30190))))

(declare-fun d!74889 () Bool)

(assert (=> d!74889 e!269285))

(declare-fun res!276241 () Bool)

(assert (=> d!74889 (=> (not res!276241) (not e!269285))))

(assert (=> d!74889 (= res!276241 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14120 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14121 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14120 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14121 _values!549))))))))

(declare-fun lt!209130 () Unit!13436)

(declare-fun choose!1336 (array!28657 array!28659 (_ BitVec 32) (_ BitVec 32) V!17677 V!17677 (_ BitVec 32) (_ BitVec 64) V!17677 (_ BitVec 32) Int) Unit!13436)

(assert (=> d!74889 (= lt!209130 (choose!1336 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74889 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14120 _keys!709)))))

(assert (=> d!74889 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!791 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!209130)))

(declare-fun bm!30186 () Bool)

(assert (=> bm!30186 (= call!30189 (getCurrentListMapNoExtraKeys!1781 (array!28658 (store (arr!13768 _keys!709) i!563 k0!794) (size!14120 _keys!709)) (array!28660 (store (arr!13769 _values!549) i!563 (ValueCellFull!5871 v!412)) (size!14121 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!30187 () Bool)

(assert (=> bm!30187 (= call!30190 (getCurrentListMapNoExtraKeys!1781 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461773 () Bool)

(assert (=> b!461773 (= e!269284 (= call!30189 (+!1635 call!30190 (tuple2!8259 k0!794 v!412))))))

(assert (= (and d!74889 res!276241) b!461771))

(assert (= (and b!461771 c!56615) b!461773))

(assert (= (and b!461771 (not c!56615)) b!461772))

(assert (= (or b!461773 b!461772) bm!30187))

(assert (= (or b!461773 b!461772) bm!30186))

(declare-fun m!444951 () Bool)

(assert (=> d!74889 m!444951))

(assert (=> bm!30186 m!444755))

(assert (=> bm!30186 m!444741))

(declare-fun m!444953 () Bool)

(assert (=> bm!30186 m!444953))

(assert (=> bm!30187 m!444721))

(declare-fun m!444955 () Bool)

(assert (=> b!461773 m!444955))

(assert (=> b!461601 d!74889))

(declare-fun d!74891 () Bool)

(declare-fun res!276246 () Bool)

(declare-fun e!269290 () Bool)

(assert (=> d!74891 (=> res!276246 e!269290)))

(assert (=> d!74891 (= res!276246 (= (select (arr!13768 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74891 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!269290)))

(declare-fun b!461778 () Bool)

(declare-fun e!269291 () Bool)

(assert (=> b!461778 (= e!269290 e!269291)))

(declare-fun res!276247 () Bool)

(assert (=> b!461778 (=> (not res!276247) (not e!269291))))

(assert (=> b!461778 (= res!276247 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14120 _keys!709)))))

(declare-fun b!461779 () Bool)

(assert (=> b!461779 (= e!269291 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74891 (not res!276246)) b!461778))

(assert (= (and b!461778 res!276247) b!461779))

(assert (=> d!74891 m!444803))

(declare-fun m!444957 () Bool)

(assert (=> b!461779 m!444957))

(assert (=> b!461587 d!74891))

(declare-fun b!461780 () Bool)

(declare-fun e!269294 () Bool)

(assert (=> b!461780 (= e!269294 (contains!2513 Nil!8327 (select (arr!13768 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!461781 () Bool)

(declare-fun e!269292 () Bool)

(declare-fun e!269293 () Bool)

(assert (=> b!461781 (= e!269292 e!269293)))

(declare-fun c!56616 () Bool)

(assert (=> b!461781 (= c!56616 (validKeyInArray!0 (select (arr!13768 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!461782 () Bool)

(declare-fun call!30191 () Bool)

(assert (=> b!461782 (= e!269293 call!30191)))

(declare-fun b!461783 () Bool)

(declare-fun e!269295 () Bool)

(assert (=> b!461783 (= e!269295 e!269292)))

(declare-fun res!276250 () Bool)

(assert (=> b!461783 (=> (not res!276250) (not e!269292))))

(assert (=> b!461783 (= res!276250 (not e!269294))))

(declare-fun res!276249 () Bool)

(assert (=> b!461783 (=> (not res!276249) (not e!269294))))

(assert (=> b!461783 (= res!276249 (validKeyInArray!0 (select (arr!13768 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74893 () Bool)

(declare-fun res!276248 () Bool)

(assert (=> d!74893 (=> res!276248 e!269295)))

(assert (=> d!74893 (= res!276248 (bvsge #b00000000000000000000000000000000 (size!14120 _keys!709)))))

(assert (=> d!74893 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8327) e!269295)))

(declare-fun b!461784 () Bool)

(assert (=> b!461784 (= e!269293 call!30191)))

(declare-fun bm!30188 () Bool)

(assert (=> bm!30188 (= call!30191 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56616 (Cons!8326 (select (arr!13768 _keys!709) #b00000000000000000000000000000000) Nil!8327) Nil!8327)))))

(assert (= (and d!74893 (not res!276248)) b!461783))

(assert (= (and b!461783 res!276249) b!461780))

(assert (= (and b!461783 res!276250) b!461781))

(assert (= (and b!461781 c!56616) b!461784))

(assert (= (and b!461781 (not c!56616)) b!461782))

(assert (= (or b!461784 b!461782) bm!30188))

(assert (=> b!461780 m!444803))

(assert (=> b!461780 m!444803))

(declare-fun m!444959 () Bool)

(assert (=> b!461780 m!444959))

(assert (=> b!461781 m!444803))

(assert (=> b!461781 m!444803))

(assert (=> b!461781 m!444811))

(assert (=> b!461783 m!444803))

(assert (=> b!461783 m!444803))

(assert (=> b!461783 m!444811))

(assert (=> bm!30188 m!444803))

(declare-fun m!444961 () Bool)

(assert (=> bm!30188 m!444961))

(assert (=> b!461589 d!74893))

(declare-fun d!74895 () Bool)

(declare-fun e!269296 () Bool)

(assert (=> d!74895 e!269296))

(declare-fun res!276251 () Bool)

(assert (=> d!74895 (=> (not res!276251) (not e!269296))))

(declare-fun lt!209133 () ListLongMap!7171)

(assert (=> d!74895 (= res!276251 (contains!2512 lt!209133 (_1!4140 lt!209038)))))

(declare-fun lt!209132 () List!8331)

(assert (=> d!74895 (= lt!209133 (ListLongMap!7172 lt!209132))))

(declare-fun lt!209134 () Unit!13436)

(declare-fun lt!209131 () Unit!13436)

(assert (=> d!74895 (= lt!209134 lt!209131)))

(assert (=> d!74895 (= (getValueByKey!375 lt!209132 (_1!4140 lt!209038)) (Some!380 (_2!4140 lt!209038)))))

(assert (=> d!74895 (= lt!209131 (lemmaContainsTupThenGetReturnValue!197 lt!209132 (_1!4140 lt!209038) (_2!4140 lt!209038)))))

(assert (=> d!74895 (= lt!209132 (insertStrictlySorted!200 (toList!3601 lt!209042) (_1!4140 lt!209038) (_2!4140 lt!209038)))))

(assert (=> d!74895 (= (+!1635 lt!209042 lt!209038) lt!209133)))

(declare-fun b!461785 () Bool)

(declare-fun res!276252 () Bool)

(assert (=> b!461785 (=> (not res!276252) (not e!269296))))

(assert (=> b!461785 (= res!276252 (= (getValueByKey!375 (toList!3601 lt!209133) (_1!4140 lt!209038)) (Some!380 (_2!4140 lt!209038))))))

(declare-fun b!461786 () Bool)

(assert (=> b!461786 (= e!269296 (contains!2514 (toList!3601 lt!209133) lt!209038))))

(assert (= (and d!74895 res!276251) b!461785))

(assert (= (and b!461785 res!276252) b!461786))

(declare-fun m!444963 () Bool)

(assert (=> d!74895 m!444963))

(declare-fun m!444965 () Bool)

(assert (=> d!74895 m!444965))

(declare-fun m!444967 () Bool)

(assert (=> d!74895 m!444967))

(declare-fun m!444969 () Bool)

(assert (=> d!74895 m!444969))

(declare-fun m!444971 () Bool)

(assert (=> b!461785 m!444971))

(declare-fun m!444973 () Bool)

(assert (=> b!461786 m!444973))

(assert (=> b!461598 d!74895))

(declare-fun d!74897 () Bool)

(assert (=> d!74897 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!461588 d!74897))

(declare-fun b!461794 () Bool)

(declare-fun e!269302 () Bool)

(assert (=> b!461794 (= e!269302 tp_is_empty!12429)))

(declare-fun condMapEmpty!20302 () Bool)

(declare-fun mapDefault!20302 () ValueCell!5871)

(assert (=> mapNonEmpty!20296 (= condMapEmpty!20302 (= mapRest!20296 ((as const (Array (_ BitVec 32) ValueCell!5871)) mapDefault!20302)))))

(declare-fun mapRes!20302 () Bool)

(assert (=> mapNonEmpty!20296 (= tp!39111 (and e!269302 mapRes!20302))))

(declare-fun mapNonEmpty!20302 () Bool)

(declare-fun tp!39121 () Bool)

(declare-fun e!269301 () Bool)

(assert (=> mapNonEmpty!20302 (= mapRes!20302 (and tp!39121 e!269301))))

(declare-fun mapRest!20302 () (Array (_ BitVec 32) ValueCell!5871))

(declare-fun mapKey!20302 () (_ BitVec 32))

(declare-fun mapValue!20302 () ValueCell!5871)

(assert (=> mapNonEmpty!20302 (= mapRest!20296 (store mapRest!20302 mapKey!20302 mapValue!20302))))

(declare-fun mapIsEmpty!20302 () Bool)

(assert (=> mapIsEmpty!20302 mapRes!20302))

(declare-fun b!461793 () Bool)

(assert (=> b!461793 (= e!269301 tp_is_empty!12429)))

(assert (= (and mapNonEmpty!20296 condMapEmpty!20302) mapIsEmpty!20302))

(assert (= (and mapNonEmpty!20296 (not condMapEmpty!20302)) mapNonEmpty!20302))

(assert (= (and mapNonEmpty!20302 ((_ is ValueCellFull!5871) mapValue!20302)) b!461793))

(assert (= (and mapNonEmpty!20296 ((_ is ValueCellFull!5871) mapDefault!20302)) b!461794))

(declare-fun m!444975 () Bool)

(assert (=> mapNonEmpty!20302 m!444975))

(declare-fun b_lambda!9949 () Bool)

(assert (= b_lambda!9943 (or (and start!41248 b_free!11091) b_lambda!9949)))

(declare-fun b_lambda!9951 () Bool)

(assert (= b_lambda!9939 (or (and start!41248 b_free!11091) b_lambda!9951)))

(declare-fun b_lambda!9953 () Bool)

(assert (= b_lambda!9947 (or (and start!41248 b_free!11091) b_lambda!9953)))

(declare-fun b_lambda!9955 () Bool)

(assert (= b_lambda!9935 (or (and start!41248 b_free!11091) b_lambda!9955)))

(declare-fun b_lambda!9957 () Bool)

(assert (= b_lambda!9937 (or (and start!41248 b_free!11091) b_lambda!9957)))

(declare-fun b_lambda!9959 () Bool)

(assert (= b_lambda!9941 (or (and start!41248 b_free!11091) b_lambda!9959)))

(declare-fun b_lambda!9961 () Bool)

(assert (= b_lambda!9945 (or (and start!41248 b_free!11091) b_lambda!9961)))

(declare-fun b_lambda!9963 () Bool)

(assert (= b_lambda!9933 (or (and start!41248 b_free!11091) b_lambda!9963)))

(check-sat (not b!461779) b_and!19429 (not b!461756) (not b!461711) (not b!461727) (not d!74895) (not b!461729) (not b_lambda!9957) (not b!461739) (not b_lambda!9953) (not bm!30186) (not b_lambda!9955) (not b!461707) (not d!74873) (not b!461736) (not b!461701) (not b!461754) (not b!461710) (not bm!30178) (not d!74883) (not b!461741) (not b!461740) (not bm!30187) (not b!461781) (not b!461785) (not b!461726) (not b!461712) (not b!461715) (not b!461696) (not b!461695) (not b!461693) (not b!461783) (not b!461760) (not b!461734) (not mapNonEmpty!20302) (not d!74889) (not d!74875) (not b!461665) (not bm!30171) (not b!461758) (not b!461764) (not b_lambda!9951) (not b!461752) (not b!461697) (not b!461761) (not b!461742) (not b!461732) (not b!461691) (not b!461705) (not b!461773) (not b!461746) (not bm!30180) (not b!461786) (not b_lambda!9963) (not b!461709) (not b!461708) (not b!461738) (not b_lambda!9949) (not b_lambda!9961) tp_is_empty!12429 (not b!461743) (not bm!30179) (not b!461694) (not bm!30181) (not d!74885) (not bm!30174) (not bm!30188) (not b!461757) (not d!74881) (not b_next!11091) (not bm!30175) (not b!461759) (not b!461780) (not b!461698) (not b!461663) (not b_lambda!9959) (not b!461751))
(check-sat b_and!19429 (not b_next!11091))
