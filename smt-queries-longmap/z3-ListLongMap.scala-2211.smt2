; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36682 () Bool)

(assert start!36682)

(declare-fun b!366163 () Bool)

(declare-fun res!204782 () Bool)

(declare-fun e!224220 () Bool)

(assert (=> b!366163 (=> (not res!204782) (not e!224220))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366163 (= res!204782 (validKeyInArray!0 k0!778))))

(declare-fun b!366164 () Bool)

(declare-fun res!204778 () Bool)

(assert (=> b!366164 (=> (not res!204778) (not e!224220))))

(declare-datatypes ((array!20963 0))(
  ( (array!20964 (arr!9953 (Array (_ BitVec 32) (_ BitVec 64))) (size!10305 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20963)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20963 (_ BitVec 32)) Bool)

(assert (=> b!366164 (= res!204778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20964 (store (arr!9953 _keys!658) i!548 k0!778) (size!10305 _keys!658)) mask!970))))

(declare-fun b!366165 () Bool)

(declare-fun res!204783 () Bool)

(assert (=> b!366165 (=> (not res!204783) (not e!224220))))

(declare-datatypes ((V!12445 0))(
  ( (V!12446 (val!4297 Int)) )
))
(declare-datatypes ((ValueCell!3909 0))(
  ( (ValueCellFull!3909 (v!6493 V!12445)) (EmptyCell!3909) )
))
(declare-datatypes ((array!20965 0))(
  ( (array!20966 (arr!9954 (Array (_ BitVec 32) ValueCell!3909)) (size!10306 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20965)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366165 (= res!204783 (and (= (size!10306 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10305 _keys!658) (size!10306 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!204784 () Bool)

(assert (=> start!36682 (=> (not res!204784) (not e!224220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36682 (= res!204784 (validMask!0 mask!970))))

(assert (=> start!36682 e!224220))

(assert (=> start!36682 true))

(declare-fun e!224217 () Bool)

(declare-fun array_inv!7360 (array!20965) Bool)

(assert (=> start!36682 (and (array_inv!7360 _values!506) e!224217)))

(declare-fun array_inv!7361 (array!20963) Bool)

(assert (=> start!36682 (array_inv!7361 _keys!658)))

(declare-fun b!366166 () Bool)

(declare-fun e!224218 () Bool)

(declare-fun mapRes!14313 () Bool)

(assert (=> b!366166 (= e!224217 (and e!224218 mapRes!14313))))

(declare-fun condMapEmpty!14313 () Bool)

(declare-fun mapDefault!14313 () ValueCell!3909)

(assert (=> b!366166 (= condMapEmpty!14313 (= (arr!9954 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3909)) mapDefault!14313)))))

(declare-fun b!366167 () Bool)

(assert (=> b!366167 (= e!224220 (bvsgt #b00000000000000000000000000000000 (size!10305 _keys!658)))))

(declare-fun mapIsEmpty!14313 () Bool)

(assert (=> mapIsEmpty!14313 mapRes!14313))

(declare-fun b!366168 () Bool)

(declare-fun res!204779 () Bool)

(assert (=> b!366168 (=> (not res!204779) (not e!224220))))

(assert (=> b!366168 (= res!204779 (or (= (select (arr!9953 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9953 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366169 () Bool)

(declare-fun res!204786 () Bool)

(assert (=> b!366169 (=> (not res!204786) (not e!224220))))

(assert (=> b!366169 (= res!204786 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10305 _keys!658))))))

(declare-fun b!366170 () Bool)

(declare-fun res!204785 () Bool)

(assert (=> b!366170 (=> (not res!204785) (not e!224220))))

(declare-datatypes ((List!5544 0))(
  ( (Nil!5541) (Cons!5540 (h!6396 (_ BitVec 64)) (t!10694 List!5544)) )
))
(declare-fun arrayNoDuplicates!0 (array!20963 (_ BitVec 32) List!5544) Bool)

(assert (=> b!366170 (= res!204785 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5541))))

(declare-fun b!366171 () Bool)

(declare-fun e!224219 () Bool)

(declare-fun tp_is_empty!8505 () Bool)

(assert (=> b!366171 (= e!224219 tp_is_empty!8505)))

(declare-fun mapNonEmpty!14313 () Bool)

(declare-fun tp!28389 () Bool)

(assert (=> mapNonEmpty!14313 (= mapRes!14313 (and tp!28389 e!224219))))

(declare-fun mapRest!14313 () (Array (_ BitVec 32) ValueCell!3909))

(declare-fun mapValue!14313 () ValueCell!3909)

(declare-fun mapKey!14313 () (_ BitVec 32))

(assert (=> mapNonEmpty!14313 (= (arr!9954 _values!506) (store mapRest!14313 mapKey!14313 mapValue!14313))))

(declare-fun b!366172 () Bool)

(assert (=> b!366172 (= e!224218 tp_is_empty!8505)))

(declare-fun b!366173 () Bool)

(declare-fun res!204781 () Bool)

(assert (=> b!366173 (=> (not res!204781) (not e!224220))))

(assert (=> b!366173 (= res!204781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366174 () Bool)

(declare-fun res!204780 () Bool)

(assert (=> b!366174 (=> (not res!204780) (not e!224220))))

(declare-fun arrayContainsKey!0 (array!20963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366174 (= res!204780 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!36682 res!204784) b!366165))

(assert (= (and b!366165 res!204783) b!366173))

(assert (= (and b!366173 res!204781) b!366170))

(assert (= (and b!366170 res!204785) b!366169))

(assert (= (and b!366169 res!204786) b!366163))

(assert (= (and b!366163 res!204782) b!366168))

(assert (= (and b!366168 res!204779) b!366174))

(assert (= (and b!366174 res!204780) b!366164))

(assert (= (and b!366164 res!204778) b!366167))

(assert (= (and b!366166 condMapEmpty!14313) mapIsEmpty!14313))

(assert (= (and b!366166 (not condMapEmpty!14313)) mapNonEmpty!14313))

(get-info :version)

(assert (= (and mapNonEmpty!14313 ((_ is ValueCellFull!3909) mapValue!14313)) b!366171))

(assert (= (and b!366166 ((_ is ValueCellFull!3909) mapDefault!14313)) b!366172))

(assert (= start!36682 b!366166))

(declare-fun m!363583 () Bool)

(assert (=> mapNonEmpty!14313 m!363583))

(declare-fun m!363585 () Bool)

(assert (=> start!36682 m!363585))

(declare-fun m!363587 () Bool)

(assert (=> start!36682 m!363587))

(declare-fun m!363589 () Bool)

(assert (=> start!36682 m!363589))

(declare-fun m!363591 () Bool)

(assert (=> b!366170 m!363591))

(declare-fun m!363593 () Bool)

(assert (=> b!366168 m!363593))

(declare-fun m!363595 () Bool)

(assert (=> b!366174 m!363595))

(declare-fun m!363597 () Bool)

(assert (=> b!366173 m!363597))

(declare-fun m!363599 () Bool)

(assert (=> b!366163 m!363599))

(declare-fun m!363601 () Bool)

(assert (=> b!366164 m!363601))

(declare-fun m!363603 () Bool)

(assert (=> b!366164 m!363603))

(check-sat (not start!36682) tp_is_empty!8505 (not b!366163) (not b!366170) (not b!366174) (not b!366164) (not b!366173) (not mapNonEmpty!14313))
(check-sat)
