; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38924 () Bool)

(assert start!38924)

(declare-fun b!407434 () Bool)

(declare-fun res!235579 () Bool)

(declare-fun e!244687 () Bool)

(assert (=> b!407434 (=> (not res!235579) (not e!244687))))

(declare-datatypes ((array!24592 0))(
  ( (array!24593 (arr!11745 (Array (_ BitVec 32) (_ BitVec 64))) (size!12097 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24592)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24592 (_ BitVec 32)) Bool)

(assert (=> b!407434 (= res!235579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407435 () Bool)

(declare-fun res!235576 () Bool)

(assert (=> b!407435 (=> (not res!235576) (not e!244687))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407435 (= res!235576 (validKeyInArray!0 k0!794))))

(declare-fun b!407436 () Bool)

(declare-fun res!235575 () Bool)

(assert (=> b!407436 (=> (not res!235575) (not e!244687))))

(declare-datatypes ((List!6690 0))(
  ( (Nil!6687) (Cons!6686 (h!7542 (_ BitVec 64)) (t!11856 List!6690)) )
))
(declare-fun arrayNoDuplicates!0 (array!24592 (_ BitVec 32) List!6690) Bool)

(assert (=> b!407436 (= res!235575 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6687))))

(declare-fun mapIsEmpty!17157 () Bool)

(declare-fun mapRes!17157 () Bool)

(assert (=> mapIsEmpty!17157 mapRes!17157))

(declare-fun b!407437 () Bool)

(declare-fun res!235578 () Bool)

(assert (=> b!407437 (=> (not res!235578) (not e!244687))))

(declare-fun arrayContainsKey!0 (array!24592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407437 (= res!235578 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407438 () Bool)

(declare-fun e!244688 () Bool)

(assert (=> b!407438 (= e!244688 false)))

(declare-fun lt!188670 () Bool)

(declare-fun lt!188669 () array!24592)

(assert (=> b!407438 (= lt!188670 (arrayNoDuplicates!0 lt!188669 #b00000000000000000000000000000000 Nil!6687))))

(declare-fun b!407439 () Bool)

(declare-fun e!244690 () Bool)

(declare-fun tp_is_empty!10357 () Bool)

(assert (=> b!407439 (= e!244690 tp_is_empty!10357)))

(declare-fun b!407440 () Bool)

(assert (=> b!407440 (= e!244687 e!244688)))

(declare-fun res!235584 () Bool)

(assert (=> b!407440 (=> (not res!235584) (not e!244688))))

(assert (=> b!407440 (= res!235584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188669 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407440 (= lt!188669 (array!24593 (store (arr!11745 _keys!709) i!563 k0!794) (size!12097 _keys!709)))))

(declare-fun b!407442 () Bool)

(declare-fun res!235580 () Bool)

(assert (=> b!407442 (=> (not res!235580) (not e!244687))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14915 0))(
  ( (V!14916 (val!5223 Int)) )
))
(declare-datatypes ((ValueCell!4835 0))(
  ( (ValueCellFull!4835 (v!7471 V!14915)) (EmptyCell!4835) )
))
(declare-datatypes ((array!24594 0))(
  ( (array!24595 (arr!11746 (Array (_ BitVec 32) ValueCell!4835)) (size!12098 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24594)

(assert (=> b!407442 (= res!235580 (and (= (size!12098 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12097 _keys!709) (size!12098 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407443 () Bool)

(declare-fun res!235577 () Bool)

(assert (=> b!407443 (=> (not res!235577) (not e!244687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407443 (= res!235577 (validMask!0 mask!1025))))

(declare-fun b!407444 () Bool)

(declare-fun res!235583 () Bool)

(assert (=> b!407444 (=> (not res!235583) (not e!244687))))

(assert (=> b!407444 (= res!235583 (or (= (select (arr!11745 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11745 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407445 () Bool)

(declare-fun res!235581 () Bool)

(assert (=> b!407445 (=> (not res!235581) (not e!244687))))

(assert (=> b!407445 (= res!235581 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12097 _keys!709))))))

(declare-fun b!407446 () Bool)

(declare-fun e!244686 () Bool)

(assert (=> b!407446 (= e!244686 tp_is_empty!10357)))

(declare-fun mapNonEmpty!17157 () Bool)

(declare-fun tp!33276 () Bool)

(assert (=> mapNonEmpty!17157 (= mapRes!17157 (and tp!33276 e!244690))))

(declare-fun mapRest!17157 () (Array (_ BitVec 32) ValueCell!4835))

(declare-fun mapKey!17157 () (_ BitVec 32))

(declare-fun mapValue!17157 () ValueCell!4835)

(assert (=> mapNonEmpty!17157 (= (arr!11746 _values!549) (store mapRest!17157 mapKey!17157 mapValue!17157))))

(declare-fun res!235582 () Bool)

(assert (=> start!38924 (=> (not res!235582) (not e!244687))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38924 (= res!235582 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12097 _keys!709))))))

(assert (=> start!38924 e!244687))

(assert (=> start!38924 true))

(declare-fun e!244689 () Bool)

(declare-fun array_inv!8656 (array!24594) Bool)

(assert (=> start!38924 (and (array_inv!8656 _values!549) e!244689)))

(declare-fun array_inv!8657 (array!24592) Bool)

(assert (=> start!38924 (array_inv!8657 _keys!709)))

(declare-fun b!407441 () Bool)

(assert (=> b!407441 (= e!244689 (and e!244686 mapRes!17157))))

(declare-fun condMapEmpty!17157 () Bool)

(declare-fun mapDefault!17157 () ValueCell!4835)

(assert (=> b!407441 (= condMapEmpty!17157 (= (arr!11746 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4835)) mapDefault!17157)))))

(assert (= (and start!38924 res!235582) b!407443))

(assert (= (and b!407443 res!235577) b!407442))

(assert (= (and b!407442 res!235580) b!407434))

(assert (= (and b!407434 res!235579) b!407436))

(assert (= (and b!407436 res!235575) b!407445))

(assert (= (and b!407445 res!235581) b!407435))

(assert (= (and b!407435 res!235576) b!407444))

(assert (= (and b!407444 res!235583) b!407437))

(assert (= (and b!407437 res!235578) b!407440))

(assert (= (and b!407440 res!235584) b!407438))

(assert (= (and b!407441 condMapEmpty!17157) mapIsEmpty!17157))

(assert (= (and b!407441 (not condMapEmpty!17157)) mapNonEmpty!17157))

(get-info :version)

(assert (= (and mapNonEmpty!17157 ((_ is ValueCellFull!4835) mapValue!17157)) b!407439))

(assert (= (and b!407441 ((_ is ValueCellFull!4835) mapDefault!17157)) b!407446))

(assert (= start!38924 b!407441))

(declare-fun m!399381 () Bool)

(assert (=> start!38924 m!399381))

(declare-fun m!399383 () Bool)

(assert (=> start!38924 m!399383))

(declare-fun m!399385 () Bool)

(assert (=> mapNonEmpty!17157 m!399385))

(declare-fun m!399387 () Bool)

(assert (=> b!407444 m!399387))

(declare-fun m!399389 () Bool)

(assert (=> b!407440 m!399389))

(declare-fun m!399391 () Bool)

(assert (=> b!407440 m!399391))

(declare-fun m!399393 () Bool)

(assert (=> b!407443 m!399393))

(declare-fun m!399395 () Bool)

(assert (=> b!407437 m!399395))

(declare-fun m!399397 () Bool)

(assert (=> b!407436 m!399397))

(declare-fun m!399399 () Bool)

(assert (=> b!407435 m!399399))

(declare-fun m!399401 () Bool)

(assert (=> b!407434 m!399401))

(declare-fun m!399403 () Bool)

(assert (=> b!407438 m!399403))

(check-sat (not b!407435) (not start!38924) (not b!407438) tp_is_empty!10357 (not b!407443) (not b!407437) (not b!407434) (not mapNonEmpty!17157) (not b!407440) (not b!407436))
(check-sat)
