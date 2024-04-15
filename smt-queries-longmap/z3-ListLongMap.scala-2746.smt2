; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40300 () Bool)

(assert start!40300)

(declare-fun b!442419 () Bool)

(declare-fun e!260383 () Bool)

(assert (=> b!442419 (= e!260383 false)))

(declare-datatypes ((array!27237 0))(
  ( (array!27238 (arr!13067 (Array (_ BitVec 32) (_ BitVec 64))) (size!13420 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27237)

(declare-fun lt!203000 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27237 (_ BitVec 32)) Bool)

(assert (=> b!442419 (= lt!203000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!27238 (store (arr!13067 _keys!709) i!563 k0!794) (size!13420 _keys!709)) mask!1025))))

(declare-fun res!262082 () Bool)

(assert (=> start!40300 (=> (not res!262082) (not e!260383))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40300 (= res!262082 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13420 _keys!709))))))

(assert (=> start!40300 e!260383))

(assert (=> start!40300 true))

(declare-datatypes ((V!16723 0))(
  ( (V!16724 (val!5901 Int)) )
))
(declare-datatypes ((ValueCell!5513 0))(
  ( (ValueCellFull!5513 (v!8146 V!16723)) (EmptyCell!5513) )
))
(declare-datatypes ((array!27239 0))(
  ( (array!27240 (arr!13068 (Array (_ BitVec 32) ValueCell!5513)) (size!13421 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27239)

(declare-fun e!260382 () Bool)

(declare-fun array_inv!9528 (array!27239) Bool)

(assert (=> start!40300 (and (array_inv!9528 _values!549) e!260382)))

(declare-fun array_inv!9529 (array!27237) Bool)

(assert (=> start!40300 (array_inv!9529 _keys!709)))

(declare-fun b!442420 () Bool)

(declare-fun res!262075 () Bool)

(assert (=> b!442420 (=> (not res!262075) (not e!260383))))

(assert (=> b!442420 (= res!262075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19194 () Bool)

(declare-fun mapRes!19194 () Bool)

(assert (=> mapIsEmpty!19194 mapRes!19194))

(declare-fun mapNonEmpty!19194 () Bool)

(declare-fun tp!37176 () Bool)

(declare-fun e!260385 () Bool)

(assert (=> mapNonEmpty!19194 (= mapRes!19194 (and tp!37176 e!260385))))

(declare-fun mapKey!19194 () (_ BitVec 32))

(declare-fun mapRest!19194 () (Array (_ BitVec 32) ValueCell!5513))

(declare-fun mapValue!19194 () ValueCell!5513)

(assert (=> mapNonEmpty!19194 (= (arr!13068 _values!549) (store mapRest!19194 mapKey!19194 mapValue!19194))))

(declare-fun b!442421 () Bool)

(declare-fun e!260386 () Bool)

(declare-fun tp_is_empty!11713 () Bool)

(assert (=> b!442421 (= e!260386 tp_is_empty!11713)))

(declare-fun b!442422 () Bool)

(declare-fun res!262074 () Bool)

(assert (=> b!442422 (=> (not res!262074) (not e!260383))))

(assert (=> b!442422 (= res!262074 (or (= (select (arr!13067 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13067 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442423 () Bool)

(declare-fun res!262081 () Bool)

(assert (=> b!442423 (=> (not res!262081) (not e!260383))))

(declare-datatypes ((List!7843 0))(
  ( (Nil!7840) (Cons!7839 (h!8695 (_ BitVec 64)) (t!13592 List!7843)) )
))
(declare-fun arrayNoDuplicates!0 (array!27237 (_ BitVec 32) List!7843) Bool)

(assert (=> b!442423 (= res!262081 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7840))))

(declare-fun b!442424 () Bool)

(declare-fun res!262079 () Bool)

(assert (=> b!442424 (=> (not res!262079) (not e!260383))))

(declare-fun arrayContainsKey!0 (array!27237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442424 (= res!262079 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442425 () Bool)

(assert (=> b!442425 (= e!260385 tp_is_empty!11713)))

(declare-fun b!442426 () Bool)

(declare-fun res!262077 () Bool)

(assert (=> b!442426 (=> (not res!262077) (not e!260383))))

(assert (=> b!442426 (= res!262077 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13420 _keys!709))))))

(declare-fun b!442427 () Bool)

(declare-fun res!262076 () Bool)

(assert (=> b!442427 (=> (not res!262076) (not e!260383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442427 (= res!262076 (validKeyInArray!0 k0!794))))

(declare-fun b!442428 () Bool)

(declare-fun res!262080 () Bool)

(assert (=> b!442428 (=> (not res!262080) (not e!260383))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442428 (= res!262080 (and (= (size!13421 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13420 _keys!709) (size!13421 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442429 () Bool)

(declare-fun res!262078 () Bool)

(assert (=> b!442429 (=> (not res!262078) (not e!260383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442429 (= res!262078 (validMask!0 mask!1025))))

(declare-fun b!442430 () Bool)

(assert (=> b!442430 (= e!260382 (and e!260386 mapRes!19194))))

(declare-fun condMapEmpty!19194 () Bool)

(declare-fun mapDefault!19194 () ValueCell!5513)

(assert (=> b!442430 (= condMapEmpty!19194 (= (arr!13068 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5513)) mapDefault!19194)))))

(assert (= (and start!40300 res!262082) b!442429))

(assert (= (and b!442429 res!262078) b!442428))

(assert (= (and b!442428 res!262080) b!442420))

(assert (= (and b!442420 res!262075) b!442423))

(assert (= (and b!442423 res!262081) b!442426))

(assert (= (and b!442426 res!262077) b!442427))

(assert (= (and b!442427 res!262076) b!442422))

(assert (= (and b!442422 res!262074) b!442424))

(assert (= (and b!442424 res!262079) b!442419))

(assert (= (and b!442430 condMapEmpty!19194) mapIsEmpty!19194))

(assert (= (and b!442430 (not condMapEmpty!19194)) mapNonEmpty!19194))

(get-info :version)

(assert (= (and mapNonEmpty!19194 ((_ is ValueCellFull!5513) mapValue!19194)) b!442425))

(assert (= (and b!442430 ((_ is ValueCellFull!5513) mapDefault!19194)) b!442421))

(assert (= start!40300 b!442430))

(declare-fun m!428515 () Bool)

(assert (=> b!442429 m!428515))

(declare-fun m!428517 () Bool)

(assert (=> mapNonEmpty!19194 m!428517))

(declare-fun m!428519 () Bool)

(assert (=> b!442424 m!428519))

(declare-fun m!428521 () Bool)

(assert (=> b!442420 m!428521))

(declare-fun m!428523 () Bool)

(assert (=> b!442427 m!428523))

(declare-fun m!428525 () Bool)

(assert (=> b!442423 m!428525))

(declare-fun m!428527 () Bool)

(assert (=> start!40300 m!428527))

(declare-fun m!428529 () Bool)

(assert (=> start!40300 m!428529))

(declare-fun m!428531 () Bool)

(assert (=> b!442419 m!428531))

(declare-fun m!428533 () Bool)

(assert (=> b!442419 m!428533))

(declare-fun m!428535 () Bool)

(assert (=> b!442422 m!428535))

(check-sat tp_is_empty!11713 (not b!442424) (not b!442429) (not mapNonEmpty!19194) (not b!442427) (not b!442420) (not start!40300) (not b!442419) (not b!442423))
(check-sat)
