; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38276 () Bool)

(assert start!38276)

(declare-fun b!394679 () Bool)

(declare-fun e!238941 () Bool)

(declare-fun tp_is_empty!9781 () Bool)

(assert (=> b!394679 (= e!238941 tp_is_empty!9781)))

(declare-fun b!394680 () Bool)

(declare-fun e!238946 () Bool)

(declare-fun mapRes!16278 () Bool)

(assert (=> b!394680 (= e!238946 (and e!238941 mapRes!16278))))

(declare-fun condMapEmpty!16278 () Bool)

(declare-datatypes ((V!14147 0))(
  ( (V!14148 (val!4935 Int)) )
))
(declare-datatypes ((ValueCell!4547 0))(
  ( (ValueCellFull!4547 (v!7174 V!14147)) (EmptyCell!4547) )
))
(declare-datatypes ((array!23457 0))(
  ( (array!23458 (arr!11183 (Array (_ BitVec 32) ValueCell!4547)) (size!11536 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23457)

(declare-fun mapDefault!16278 () ValueCell!4547)

(assert (=> b!394680 (= condMapEmpty!16278 (= (arr!11183 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4547)) mapDefault!16278)))))

(declare-fun b!394681 () Bool)

(declare-fun res!226261 () Bool)

(declare-fun e!238944 () Bool)

(assert (=> b!394681 (=> (not res!226261) (not e!238944))))

(declare-datatypes ((array!23459 0))(
  ( (array!23460 (arr!11184 (Array (_ BitVec 32) (_ BitVec 64))) (size!11537 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23459)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394681 (= res!226261 (and (= (size!11536 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11537 _keys!709) (size!11536 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16278 () Bool)

(declare-fun tp!32073 () Bool)

(declare-fun e!238942 () Bool)

(assert (=> mapNonEmpty!16278 (= mapRes!16278 (and tp!32073 e!238942))))

(declare-fun mapRest!16278 () (Array (_ BitVec 32) ValueCell!4547))

(declare-fun mapValue!16278 () ValueCell!4547)

(declare-fun mapKey!16278 () (_ BitVec 32))

(assert (=> mapNonEmpty!16278 (= (arr!11183 _values!549) (store mapRest!16278 mapKey!16278 mapValue!16278))))

(declare-fun b!394682 () Bool)

(declare-fun res!226260 () Bool)

(assert (=> b!394682 (=> (not res!226260) (not e!238944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394682 (= res!226260 (validMask!0 mask!1025))))

(declare-fun b!394683 () Bool)

(declare-fun e!238943 () Bool)

(declare-datatypes ((List!6457 0))(
  ( (Nil!6454) (Cons!6453 (h!7309 (_ BitVec 64)) (t!11622 List!6457)) )
))
(declare-fun contains!2467 (List!6457 (_ BitVec 64)) Bool)

(assert (=> b!394683 (= e!238943 (contains!2467 Nil!6454 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394684 () Bool)

(declare-fun res!226262 () Bool)

(assert (=> b!394684 (=> (not res!226262) (not e!238944))))

(assert (=> b!394684 (= res!226262 (and (bvsle #b00000000000000000000000000000000 (size!11537 _keys!709)) (bvslt (size!11537 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!394685 () Bool)

(assert (=> b!394685 (= e!238944 e!238943)))

(declare-fun res!226256 () Bool)

(assert (=> b!394685 (=> res!226256 e!238943)))

(assert (=> b!394685 (= res!226256 (contains!2467 Nil!6454 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394686 () Bool)

(declare-fun res!226259 () Bool)

(assert (=> b!394686 (=> (not res!226259) (not e!238944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23459 (_ BitVec 32)) Bool)

(assert (=> b!394686 (= res!226259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394687 () Bool)

(declare-fun res!226258 () Bool)

(assert (=> b!394687 (=> (not res!226258) (not e!238944))))

(declare-fun noDuplicate!196 (List!6457) Bool)

(assert (=> b!394687 (= res!226258 (noDuplicate!196 Nil!6454))))

(declare-fun b!394688 () Bool)

(assert (=> b!394688 (= e!238942 tp_is_empty!9781)))

(declare-fun mapIsEmpty!16278 () Bool)

(assert (=> mapIsEmpty!16278 mapRes!16278))

(declare-fun res!226257 () Bool)

(assert (=> start!38276 (=> (not res!226257) (not e!238944))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38276 (= res!226257 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11537 _keys!709))))))

(assert (=> start!38276 e!238944))

(assert (=> start!38276 true))

(declare-fun array_inv!8208 (array!23457) Bool)

(assert (=> start!38276 (and (array_inv!8208 _values!549) e!238946)))

(declare-fun array_inv!8209 (array!23459) Bool)

(assert (=> start!38276 (array_inv!8209 _keys!709)))

(assert (= (and start!38276 res!226257) b!394682))

(assert (= (and b!394682 res!226260) b!394681))

(assert (= (and b!394681 res!226261) b!394686))

(assert (= (and b!394686 res!226259) b!394684))

(assert (= (and b!394684 res!226262) b!394687))

(assert (= (and b!394687 res!226258) b!394685))

(assert (= (and b!394685 (not res!226256)) b!394683))

(assert (= (and b!394680 condMapEmpty!16278) mapIsEmpty!16278))

(assert (= (and b!394680 (not condMapEmpty!16278)) mapNonEmpty!16278))

(get-info :version)

(assert (= (and mapNonEmpty!16278 ((_ is ValueCellFull!4547) mapValue!16278)) b!394688))

(assert (= (and b!394680 ((_ is ValueCellFull!4547) mapDefault!16278)) b!394679))

(assert (= start!38276 b!394680))

(declare-fun m!390491 () Bool)

(assert (=> b!394686 m!390491))

(declare-fun m!390493 () Bool)

(assert (=> b!394683 m!390493))

(declare-fun m!390495 () Bool)

(assert (=> b!394682 m!390495))

(declare-fun m!390497 () Bool)

(assert (=> b!394685 m!390497))

(declare-fun m!390499 () Bool)

(assert (=> b!394687 m!390499))

(declare-fun m!390501 () Bool)

(assert (=> mapNonEmpty!16278 m!390501))

(declare-fun m!390503 () Bool)

(assert (=> start!38276 m!390503))

(declare-fun m!390505 () Bool)

(assert (=> start!38276 m!390505))

(check-sat (not start!38276) (not b!394686) (not b!394682) (not b!394687) (not b!394685) (not b!394683) (not mapNonEmpty!16278) tp_is_empty!9781)
(check-sat)
(get-model)

(declare-fun d!73109 () Bool)

(assert (=> d!73109 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!394682 d!73109))

(declare-fun d!73111 () Bool)

(declare-fun lt!186813 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!202 (List!6457) (InoxSet (_ BitVec 64)))

(assert (=> d!73111 (= lt!186813 (select (content!202 Nil!6454) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!238988 () Bool)

(assert (=> d!73111 (= lt!186813 e!238988)))

(declare-fun res!226309 () Bool)

(assert (=> d!73111 (=> (not res!226309) (not e!238988))))

(assert (=> d!73111 (= res!226309 ((_ is Cons!6453) Nil!6454))))

(assert (=> d!73111 (= (contains!2467 Nil!6454 #b1000000000000000000000000000000000000000000000000000000000000000) lt!186813)))

(declare-fun b!394753 () Bool)

(declare-fun e!238987 () Bool)

(assert (=> b!394753 (= e!238988 e!238987)))

(declare-fun res!226310 () Bool)

(assert (=> b!394753 (=> res!226310 e!238987)))

(assert (=> b!394753 (= res!226310 (= (h!7309 Nil!6454) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394754 () Bool)

(assert (=> b!394754 (= e!238987 (contains!2467 (t!11622 Nil!6454) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73111 res!226309) b!394753))

(assert (= (and b!394753 (not res!226310)) b!394754))

(declare-fun m!390539 () Bool)

(assert (=> d!73111 m!390539))

(declare-fun m!390541 () Bool)

(assert (=> d!73111 m!390541))

(declare-fun m!390543 () Bool)

(assert (=> b!394754 m!390543))

(assert (=> b!394683 d!73111))

(declare-fun d!73113 () Bool)

(declare-fun lt!186814 () Bool)

(assert (=> d!73113 (= lt!186814 (select (content!202 Nil!6454) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!238990 () Bool)

(assert (=> d!73113 (= lt!186814 e!238990)))

(declare-fun res!226311 () Bool)

(assert (=> d!73113 (=> (not res!226311) (not e!238990))))

(assert (=> d!73113 (= res!226311 ((_ is Cons!6453) Nil!6454))))

(assert (=> d!73113 (= (contains!2467 Nil!6454 #b0000000000000000000000000000000000000000000000000000000000000000) lt!186814)))

(declare-fun b!394755 () Bool)

(declare-fun e!238989 () Bool)

(assert (=> b!394755 (= e!238990 e!238989)))

(declare-fun res!226312 () Bool)

(assert (=> b!394755 (=> res!226312 e!238989)))

(assert (=> b!394755 (= res!226312 (= (h!7309 Nil!6454) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394756 () Bool)

(assert (=> b!394756 (= e!238989 (contains!2467 (t!11622 Nil!6454) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!73113 res!226311) b!394755))

(assert (= (and b!394755 (not res!226312)) b!394756))

(assert (=> d!73113 m!390539))

(declare-fun m!390545 () Bool)

(assert (=> d!73113 m!390545))

(declare-fun m!390547 () Bool)

(assert (=> b!394756 m!390547))

(assert (=> b!394685 d!73113))

(declare-fun b!394765 () Bool)

(declare-fun e!238997 () Bool)

(declare-fun e!238998 () Bool)

(assert (=> b!394765 (= e!238997 e!238998)))

(declare-fun c!54474 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394765 (= c!54474 (validKeyInArray!0 (select (arr!11184 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!394766 () Bool)

(declare-fun e!238999 () Bool)

(assert (=> b!394766 (= e!238998 e!238999)))

(declare-fun lt!186823 () (_ BitVec 64))

(assert (=> b!394766 (= lt!186823 (select (arr!11184 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12038 0))(
  ( (Unit!12039) )
))
(declare-fun lt!186822 () Unit!12038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23459 (_ BitVec 64) (_ BitVec 32)) Unit!12038)

(assert (=> b!394766 (= lt!186822 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!186823 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394766 (arrayContainsKey!0 _keys!709 lt!186823 #b00000000000000000000000000000000)))

(declare-fun lt!186821 () Unit!12038)

(assert (=> b!394766 (= lt!186821 lt!186822)))

(declare-fun res!226317 () Bool)

(declare-datatypes ((SeekEntryResult!3517 0))(
  ( (MissingZero!3517 (index!16247 (_ BitVec 32))) (Found!3517 (index!16248 (_ BitVec 32))) (Intermediate!3517 (undefined!4329 Bool) (index!16249 (_ BitVec 32)) (x!38584 (_ BitVec 32))) (Undefined!3517) (MissingVacant!3517 (index!16250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23459 (_ BitVec 32)) SeekEntryResult!3517)

(assert (=> b!394766 (= res!226317 (= (seekEntryOrOpen!0 (select (arr!11184 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3517 #b00000000000000000000000000000000)))))

(assert (=> b!394766 (=> (not res!226317) (not e!238999))))

(declare-fun b!394767 () Bool)

(declare-fun call!27844 () Bool)

(assert (=> b!394767 (= e!238999 call!27844)))

(declare-fun d!73115 () Bool)

(declare-fun res!226318 () Bool)

(assert (=> d!73115 (=> res!226318 e!238997)))

(assert (=> d!73115 (= res!226318 (bvsge #b00000000000000000000000000000000 (size!11537 _keys!709)))))

(assert (=> d!73115 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!238997)))

(declare-fun b!394768 () Bool)

(assert (=> b!394768 (= e!238998 call!27844)))

(declare-fun bm!27841 () Bool)

(assert (=> bm!27841 (= call!27844 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!73115 (not res!226318)) b!394765))

(assert (= (and b!394765 c!54474) b!394766))

(assert (= (and b!394765 (not c!54474)) b!394768))

(assert (= (and b!394766 res!226317) b!394767))

(assert (= (or b!394767 b!394768) bm!27841))

(declare-fun m!390549 () Bool)

(assert (=> b!394765 m!390549))

(assert (=> b!394765 m!390549))

(declare-fun m!390551 () Bool)

(assert (=> b!394765 m!390551))

(assert (=> b!394766 m!390549))

(declare-fun m!390553 () Bool)

(assert (=> b!394766 m!390553))

(declare-fun m!390555 () Bool)

(assert (=> b!394766 m!390555))

(assert (=> b!394766 m!390549))

(declare-fun m!390557 () Bool)

(assert (=> b!394766 m!390557))

(declare-fun m!390559 () Bool)

(assert (=> bm!27841 m!390559))

(assert (=> b!394686 d!73115))

(declare-fun d!73117 () Bool)

(declare-fun res!226323 () Bool)

(declare-fun e!239004 () Bool)

(assert (=> d!73117 (=> res!226323 e!239004)))

(assert (=> d!73117 (= res!226323 ((_ is Nil!6454) Nil!6454))))

(assert (=> d!73117 (= (noDuplicate!196 Nil!6454) e!239004)))

(declare-fun b!394773 () Bool)

(declare-fun e!239005 () Bool)

(assert (=> b!394773 (= e!239004 e!239005)))

(declare-fun res!226324 () Bool)

(assert (=> b!394773 (=> (not res!226324) (not e!239005))))

(assert (=> b!394773 (= res!226324 (not (contains!2467 (t!11622 Nil!6454) (h!7309 Nil!6454))))))

(declare-fun b!394774 () Bool)

(assert (=> b!394774 (= e!239005 (noDuplicate!196 (t!11622 Nil!6454)))))

(assert (= (and d!73117 (not res!226323)) b!394773))

(assert (= (and b!394773 res!226324) b!394774))

(declare-fun m!390561 () Bool)

(assert (=> b!394773 m!390561))

(declare-fun m!390563 () Bool)

(assert (=> b!394774 m!390563))

(assert (=> b!394687 d!73117))

(declare-fun d!73119 () Bool)

(assert (=> d!73119 (= (array_inv!8208 _values!549) (bvsge (size!11536 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38276 d!73119))

(declare-fun d!73121 () Bool)

(assert (=> d!73121 (= (array_inv!8209 _keys!709) (bvsge (size!11537 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38276 d!73121))

(declare-fun mapIsEmpty!16287 () Bool)

(declare-fun mapRes!16287 () Bool)

(assert (=> mapIsEmpty!16287 mapRes!16287))

(declare-fun b!394782 () Bool)

(declare-fun e!239010 () Bool)

(assert (=> b!394782 (= e!239010 tp_is_empty!9781)))

(declare-fun mapNonEmpty!16287 () Bool)

(declare-fun tp!32082 () Bool)

(declare-fun e!239011 () Bool)

(assert (=> mapNonEmpty!16287 (= mapRes!16287 (and tp!32082 e!239011))))

(declare-fun mapKey!16287 () (_ BitVec 32))

(declare-fun mapValue!16287 () ValueCell!4547)

(declare-fun mapRest!16287 () (Array (_ BitVec 32) ValueCell!4547))

(assert (=> mapNonEmpty!16287 (= mapRest!16278 (store mapRest!16287 mapKey!16287 mapValue!16287))))

(declare-fun condMapEmpty!16287 () Bool)

(declare-fun mapDefault!16287 () ValueCell!4547)

(assert (=> mapNonEmpty!16278 (= condMapEmpty!16287 (= mapRest!16278 ((as const (Array (_ BitVec 32) ValueCell!4547)) mapDefault!16287)))))

(assert (=> mapNonEmpty!16278 (= tp!32073 (and e!239010 mapRes!16287))))

(declare-fun b!394781 () Bool)

(assert (=> b!394781 (= e!239011 tp_is_empty!9781)))

(assert (= (and mapNonEmpty!16278 condMapEmpty!16287) mapIsEmpty!16287))

(assert (= (and mapNonEmpty!16278 (not condMapEmpty!16287)) mapNonEmpty!16287))

(assert (= (and mapNonEmpty!16287 ((_ is ValueCellFull!4547) mapValue!16287)) b!394781))

(assert (= (and mapNonEmpty!16278 ((_ is ValueCellFull!4547) mapDefault!16287)) b!394782))

(declare-fun m!390565 () Bool)

(assert (=> mapNonEmpty!16287 m!390565))

(check-sat (not bm!27841) (not b!394756) (not mapNonEmpty!16287) (not b!394774) (not b!394773) tp_is_empty!9781 (not d!73111) (not b!394766) (not b!394754) (not b!394765) (not d!73113))
(check-sat)
