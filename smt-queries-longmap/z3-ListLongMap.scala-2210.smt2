; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36676 () Bool)

(assert start!36676)

(declare-fun b!366059 () Bool)

(declare-fun res!204706 () Bool)

(declare-fun e!224174 () Bool)

(assert (=> b!366059 (=> (not res!204706) (not e!224174))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366059 (= res!204706 (validKeyInArray!0 k0!778))))

(declare-fun b!366060 () Bool)

(declare-fun e!224172 () Bool)

(declare-fun tp_is_empty!8499 () Bool)

(assert (=> b!366060 (= e!224172 tp_is_empty!8499)))

(declare-fun res!204703 () Bool)

(assert (=> start!36676 (=> (not res!204703) (not e!224174))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36676 (= res!204703 (validMask!0 mask!970))))

(assert (=> start!36676 e!224174))

(assert (=> start!36676 true))

(declare-datatypes ((V!12437 0))(
  ( (V!12438 (val!4294 Int)) )
))
(declare-datatypes ((ValueCell!3906 0))(
  ( (ValueCellFull!3906 (v!6490 V!12437)) (EmptyCell!3906) )
))
(declare-datatypes ((array!20951 0))(
  ( (array!20952 (arr!9947 (Array (_ BitVec 32) ValueCell!3906)) (size!10299 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20951)

(declare-fun e!224175 () Bool)

(declare-fun array_inv!7358 (array!20951) Bool)

(assert (=> start!36676 (and (array_inv!7358 _values!506) e!224175)))

(declare-datatypes ((array!20953 0))(
  ( (array!20954 (arr!9948 (Array (_ BitVec 32) (_ BitVec 64))) (size!10300 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20953)

(declare-fun array_inv!7359 (array!20953) Bool)

(assert (=> start!36676 (array_inv!7359 _keys!658)))

(declare-fun mapNonEmpty!14304 () Bool)

(declare-fun mapRes!14304 () Bool)

(declare-fun tp!28380 () Bool)

(assert (=> mapNonEmpty!14304 (= mapRes!14304 (and tp!28380 e!224172))))

(declare-fun mapKey!14304 () (_ BitVec 32))

(declare-fun mapValue!14304 () ValueCell!3906)

(declare-fun mapRest!14304 () (Array (_ BitVec 32) ValueCell!3906))

(assert (=> mapNonEmpty!14304 (= (arr!9947 _values!506) (store mapRest!14304 mapKey!14304 mapValue!14304))))

(declare-fun b!366061 () Bool)

(declare-fun e!224171 () Bool)

(assert (=> b!366061 (= e!224171 tp_is_empty!8499)))

(declare-fun mapIsEmpty!14304 () Bool)

(assert (=> mapIsEmpty!14304 mapRes!14304))

(declare-fun b!366062 () Bool)

(declare-fun res!204704 () Bool)

(assert (=> b!366062 (=> (not res!204704) (not e!224174))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366062 (= res!204704 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10300 _keys!658))))))

(declare-fun b!366063 () Bool)

(assert (=> b!366063 (= e!224174 (and (= (size!10300 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)) (bvsgt #b00000000000000000000000000000000 (size!10300 _keys!658))))))

(declare-fun b!366064 () Bool)

(declare-fun res!204701 () Bool)

(assert (=> b!366064 (=> (not res!204701) (not e!224174))))

(declare-fun arrayContainsKey!0 (array!20953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366064 (= res!204701 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366065 () Bool)

(declare-fun res!204705 () Bool)

(assert (=> b!366065 (=> (not res!204705) (not e!224174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20953 (_ BitVec 32)) Bool)

(assert (=> b!366065 (= res!204705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366066 () Bool)

(declare-fun res!204707 () Bool)

(assert (=> b!366066 (=> (not res!204707) (not e!224174))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366066 (= res!204707 (and (= (size!10299 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10300 _keys!658) (size!10299 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366067 () Bool)

(assert (=> b!366067 (= e!224175 (and e!224171 mapRes!14304))))

(declare-fun condMapEmpty!14304 () Bool)

(declare-fun mapDefault!14304 () ValueCell!3906)

(assert (=> b!366067 (= condMapEmpty!14304 (= (arr!9947 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3906)) mapDefault!14304)))))

(declare-fun b!366068 () Bool)

(declare-fun res!204702 () Bool)

(assert (=> b!366068 (=> (not res!204702) (not e!224174))))

(assert (=> b!366068 (= res!204702 (or (= (select (arr!9948 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9948 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366069 () Bool)

(declare-fun res!204708 () Bool)

(assert (=> b!366069 (=> (not res!204708) (not e!224174))))

(declare-datatypes ((List!5542 0))(
  ( (Nil!5539) (Cons!5538 (h!6394 (_ BitVec 64)) (t!10692 List!5542)) )
))
(declare-fun arrayNoDuplicates!0 (array!20953 (_ BitVec 32) List!5542) Bool)

(assert (=> b!366069 (= res!204708 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5539))))

(assert (= (and start!36676 res!204703) b!366066))

(assert (= (and b!366066 res!204707) b!366065))

(assert (= (and b!366065 res!204705) b!366069))

(assert (= (and b!366069 res!204708) b!366062))

(assert (= (and b!366062 res!204704) b!366059))

(assert (= (and b!366059 res!204706) b!366068))

(assert (= (and b!366068 res!204702) b!366064))

(assert (= (and b!366064 res!204701) b!366063))

(assert (= (and b!366067 condMapEmpty!14304) mapIsEmpty!14304))

(assert (= (and b!366067 (not condMapEmpty!14304)) mapNonEmpty!14304))

(get-info :version)

(assert (= (and mapNonEmpty!14304 ((_ is ValueCellFull!3906) mapValue!14304)) b!366060))

(assert (= (and b!366067 ((_ is ValueCellFull!3906) mapDefault!14304)) b!366061))

(assert (= start!36676 b!366067))

(declare-fun m!363525 () Bool)

(assert (=> b!366069 m!363525))

(declare-fun m!363527 () Bool)

(assert (=> b!366064 m!363527))

(declare-fun m!363529 () Bool)

(assert (=> mapNonEmpty!14304 m!363529))

(declare-fun m!363531 () Bool)

(assert (=> b!366068 m!363531))

(declare-fun m!363533 () Bool)

(assert (=> b!366065 m!363533))

(declare-fun m!363535 () Bool)

(assert (=> b!366059 m!363535))

(declare-fun m!363537 () Bool)

(assert (=> start!36676 m!363537))

(declare-fun m!363539 () Bool)

(assert (=> start!36676 m!363539))

(declare-fun m!363541 () Bool)

(assert (=> start!36676 m!363541))

(check-sat (not b!366059) (not b!366064) (not b!366069) tp_is_empty!8499 (not mapNonEmpty!14304) (not start!36676) (not b!366065))
(check-sat)
