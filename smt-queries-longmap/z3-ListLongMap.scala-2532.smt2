; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38996 () Bool)

(assert start!38996)

(declare-fun mapNonEmpty!17265 () Bool)

(declare-fun mapRes!17265 () Bool)

(declare-fun tp!33384 () Bool)

(declare-fun e!245193 () Bool)

(assert (=> mapNonEmpty!17265 (= mapRes!17265 (and tp!33384 e!245193))))

(declare-datatypes ((V!15011 0))(
  ( (V!15012 (val!5259 Int)) )
))
(declare-datatypes ((ValueCell!4871 0))(
  ( (ValueCellFull!4871 (v!7500 V!15011)) (EmptyCell!4871) )
))
(declare-fun mapRest!17265 () (Array (_ BitVec 32) ValueCell!4871))

(declare-fun mapKey!17265 () (_ BitVec 32))

(declare-datatypes ((array!24721 0))(
  ( (array!24722 (arr!11810 (Array (_ BitVec 32) ValueCell!4871)) (size!12163 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24721)

(declare-fun mapValue!17265 () ValueCell!4871)

(assert (=> mapNonEmpty!17265 (= (arr!11810 _values!549) (store mapRest!17265 mapKey!17265 mapValue!17265))))

(declare-fun b!408616 () Bool)

(declare-fun res!236537 () Bool)

(declare-fun e!245191 () Bool)

(assert (=> b!408616 (=> (not res!236537) (not e!245191))))

(declare-datatypes ((array!24723 0))(
  ( (array!24724 (arr!11811 (Array (_ BitVec 32) (_ BitVec 64))) (size!12164 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24723)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408616 (= res!236537 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408617 () Bool)

(declare-fun res!236531 () Bool)

(assert (=> b!408617 (=> (not res!236531) (not e!245191))))

(declare-datatypes ((List!6815 0))(
  ( (Nil!6812) (Cons!6811 (h!7667 (_ BitVec 64)) (t!11980 List!6815)) )
))
(declare-fun arrayNoDuplicates!0 (array!24723 (_ BitVec 32) List!6815) Bool)

(assert (=> b!408617 (= res!236531 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6812))))

(declare-fun res!236532 () Bool)

(assert (=> start!38996 (=> (not res!236532) (not e!245191))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38996 (= res!236532 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12164 _keys!709))))))

(assert (=> start!38996 e!245191))

(assert (=> start!38996 true))

(declare-fun e!245192 () Bool)

(declare-fun array_inv!8662 (array!24721) Bool)

(assert (=> start!38996 (and (array_inv!8662 _values!549) e!245192)))

(declare-fun array_inv!8663 (array!24723) Bool)

(assert (=> start!38996 (array_inv!8663 _keys!709)))

(declare-fun b!408618 () Bool)

(declare-fun res!236533 () Bool)

(assert (=> b!408618 (=> (not res!236533) (not e!245191))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!408618 (= res!236533 (and (= (size!12163 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12164 _keys!709) (size!12163 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408619 () Bool)

(declare-fun res!236535 () Bool)

(assert (=> b!408619 (=> (not res!236535) (not e!245191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408619 (= res!236535 (validMask!0 mask!1025))))

(declare-fun b!408620 () Bool)

(declare-fun e!245194 () Bool)

(assert (=> b!408620 (= e!245192 (and e!245194 mapRes!17265))))

(declare-fun condMapEmpty!17265 () Bool)

(declare-fun mapDefault!17265 () ValueCell!4871)

(assert (=> b!408620 (= condMapEmpty!17265 (= (arr!11810 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4871)) mapDefault!17265)))))

(declare-fun b!408621 () Bool)

(declare-fun res!236530 () Bool)

(assert (=> b!408621 (=> (not res!236530) (not e!245191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24723 (_ BitVec 32)) Bool)

(assert (=> b!408621 (= res!236530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408622 () Bool)

(declare-fun res!236538 () Bool)

(assert (=> b!408622 (=> (not res!236538) (not e!245191))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408622 (= res!236538 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12164 _keys!709))))))

(declare-fun b!408623 () Bool)

(declare-fun res!236529 () Bool)

(assert (=> b!408623 (=> (not res!236529) (not e!245191))))

(assert (=> b!408623 (= res!236529 (or (= (select (arr!11811 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11811 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408624 () Bool)

(declare-fun tp_is_empty!10429 () Bool)

(assert (=> b!408624 (= e!245193 tp_is_empty!10429)))

(declare-fun b!408625 () Bool)

(assert (=> b!408625 (= e!245194 tp_is_empty!10429)))

(declare-fun b!408626 () Bool)

(declare-fun e!245196 () Bool)

(assert (=> b!408626 (= e!245196 false)))

(declare-fun lt!188632 () Bool)

(declare-fun lt!188633 () array!24723)

(assert (=> b!408626 (= lt!188632 (arrayNoDuplicates!0 lt!188633 #b00000000000000000000000000000000 Nil!6812))))

(declare-fun b!408627 () Bool)

(assert (=> b!408627 (= e!245191 e!245196)))

(declare-fun res!236536 () Bool)

(assert (=> b!408627 (=> (not res!236536) (not e!245196))))

(assert (=> b!408627 (= res!236536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188633 mask!1025))))

(assert (=> b!408627 (= lt!188633 (array!24724 (store (arr!11811 _keys!709) i!563 k0!794) (size!12164 _keys!709)))))

(declare-fun b!408628 () Bool)

(declare-fun res!236534 () Bool)

(assert (=> b!408628 (=> (not res!236534) (not e!245191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408628 (= res!236534 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17265 () Bool)

(assert (=> mapIsEmpty!17265 mapRes!17265))

(assert (= (and start!38996 res!236532) b!408619))

(assert (= (and b!408619 res!236535) b!408618))

(assert (= (and b!408618 res!236533) b!408621))

(assert (= (and b!408621 res!236530) b!408617))

(assert (= (and b!408617 res!236531) b!408622))

(assert (= (and b!408622 res!236538) b!408628))

(assert (= (and b!408628 res!236534) b!408623))

(assert (= (and b!408623 res!236529) b!408616))

(assert (= (and b!408616 res!236537) b!408627))

(assert (= (and b!408627 res!236536) b!408626))

(assert (= (and b!408620 condMapEmpty!17265) mapIsEmpty!17265))

(assert (= (and b!408620 (not condMapEmpty!17265)) mapNonEmpty!17265))

(get-info :version)

(assert (= (and mapNonEmpty!17265 ((_ is ValueCellFull!4871) mapValue!17265)) b!408624))

(assert (= (and b!408620 ((_ is ValueCellFull!4871) mapDefault!17265)) b!408625))

(assert (= start!38996 b!408620))

(declare-fun m!399291 () Bool)

(assert (=> b!408623 m!399291))

(declare-fun m!399293 () Bool)

(assert (=> mapNonEmpty!17265 m!399293))

(declare-fun m!399295 () Bool)

(assert (=> b!408616 m!399295))

(declare-fun m!399297 () Bool)

(assert (=> b!408627 m!399297))

(declare-fun m!399299 () Bool)

(assert (=> b!408627 m!399299))

(declare-fun m!399301 () Bool)

(assert (=> b!408619 m!399301))

(declare-fun m!399303 () Bool)

(assert (=> b!408617 m!399303))

(declare-fun m!399305 () Bool)

(assert (=> b!408628 m!399305))

(declare-fun m!399307 () Bool)

(assert (=> b!408626 m!399307))

(declare-fun m!399309 () Bool)

(assert (=> b!408621 m!399309))

(declare-fun m!399311 () Bool)

(assert (=> start!38996 m!399311))

(declare-fun m!399313 () Bool)

(assert (=> start!38996 m!399313))

(check-sat (not b!408616) (not b!408617) tp_is_empty!10429 (not b!408628) (not mapNonEmpty!17265) (not b!408619) (not b!408621) (not start!38996) (not b!408627) (not b!408626))
(check-sat)
