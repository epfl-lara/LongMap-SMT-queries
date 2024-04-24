; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36666 () Bool)

(assert start!36666)

(declare-fun mapNonEmpty!14310 () Bool)

(declare-fun mapRes!14310 () Bool)

(declare-fun tp!28386 () Bool)

(declare-fun e!224173 () Bool)

(assert (=> mapNonEmpty!14310 (= mapRes!14310 (and tp!28386 e!224173))))

(declare-datatypes ((V!12443 0))(
  ( (V!12444 (val!4296 Int)) )
))
(declare-datatypes ((ValueCell!3908 0))(
  ( (ValueCellFull!3908 (v!6493 V!12443)) (EmptyCell!3908) )
))
(declare-datatypes ((array!20952 0))(
  ( (array!20953 (arr!9947 (Array (_ BitVec 32) ValueCell!3908)) (size!10299 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20952)

(declare-fun mapValue!14310 () ValueCell!3908)

(declare-fun mapKey!14310 () (_ BitVec 32))

(declare-fun mapRest!14310 () (Array (_ BitVec 32) ValueCell!3908))

(assert (=> mapNonEmpty!14310 (= (arr!9947 _values!506) (store mapRest!14310 mapKey!14310 mapValue!14310))))

(declare-fun b!366078 () Bool)

(declare-fun e!224171 () Bool)

(declare-datatypes ((array!20954 0))(
  ( (array!20955 (arr!9948 (Array (_ BitVec 32) (_ BitVec 64))) (size!10300 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20954)

(assert (=> b!366078 (= e!224171 (bvsgt #b00000000000000000000000000000000 (size!10300 _keys!658)))))

(declare-fun b!366079 () Bool)

(declare-fun res!204750 () Bool)

(assert (=> b!366079 (=> (not res!204750) (not e!224171))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366079 (= res!204750 (validKeyInArray!0 k0!778))))

(declare-fun b!366080 () Bool)

(declare-fun tp_is_empty!8503 () Bool)

(assert (=> b!366080 (= e!224173 tp_is_empty!8503)))

(declare-fun b!366081 () Bool)

(declare-fun res!204756 () Bool)

(assert (=> b!366081 (=> (not res!204756) (not e!224171))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!366081 (= res!204756 (or (= (select (arr!9948 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9948 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!204754 () Bool)

(assert (=> start!36666 (=> (not res!204754) (not e!224171))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36666 (= res!204754 (validMask!0 mask!970))))

(assert (=> start!36666 e!224171))

(assert (=> start!36666 true))

(declare-fun e!224172 () Bool)

(declare-fun array_inv!7398 (array!20952) Bool)

(assert (=> start!36666 (and (array_inv!7398 _values!506) e!224172)))

(declare-fun array_inv!7399 (array!20954) Bool)

(assert (=> start!36666 (array_inv!7399 _keys!658)))

(declare-fun b!366082 () Bool)

(declare-fun e!224170 () Bool)

(assert (=> b!366082 (= e!224172 (and e!224170 mapRes!14310))))

(declare-fun condMapEmpty!14310 () Bool)

(declare-fun mapDefault!14310 () ValueCell!3908)

(assert (=> b!366082 (= condMapEmpty!14310 (= (arr!9947 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3908)) mapDefault!14310)))))

(declare-fun b!366083 () Bool)

(declare-fun res!204751 () Bool)

(assert (=> b!366083 (=> (not res!204751) (not e!224171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20954 (_ BitVec 32)) Bool)

(assert (=> b!366083 (= res!204751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!20955 (store (arr!9948 _keys!658) i!548 k0!778) (size!10300 _keys!658)) mask!970))))

(declare-fun b!366084 () Bool)

(assert (=> b!366084 (= e!224170 tp_is_empty!8503)))

(declare-fun b!366085 () Bool)

(declare-fun res!204753 () Bool)

(assert (=> b!366085 (=> (not res!204753) (not e!224171))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366085 (= res!204753 (and (= (size!10299 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10300 _keys!658) (size!10299 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!366086 () Bool)

(declare-fun res!204755 () Bool)

(assert (=> b!366086 (=> (not res!204755) (not e!224171))))

(declare-fun arrayContainsKey!0 (array!20954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366086 (= res!204755 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14310 () Bool)

(assert (=> mapIsEmpty!14310 mapRes!14310))

(declare-fun b!366087 () Bool)

(declare-fun res!204748 () Bool)

(assert (=> b!366087 (=> (not res!204748) (not e!224171))))

(assert (=> b!366087 (= res!204748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366088 () Bool)

(declare-fun res!204752 () Bool)

(assert (=> b!366088 (=> (not res!204752) (not e!224171))))

(assert (=> b!366088 (= res!204752 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10300 _keys!658))))))

(declare-fun b!366089 () Bool)

(declare-fun res!204749 () Bool)

(assert (=> b!366089 (=> (not res!204749) (not e!224171))))

(declare-datatypes ((List!5453 0))(
  ( (Nil!5450) (Cons!5449 (h!6305 (_ BitVec 64)) (t!10595 List!5453)) )
))
(declare-fun arrayNoDuplicates!0 (array!20954 (_ BitVec 32) List!5453) Bool)

(assert (=> b!366089 (= res!204749 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5450))))

(assert (= (and start!36666 res!204754) b!366085))

(assert (= (and b!366085 res!204753) b!366087))

(assert (= (and b!366087 res!204748) b!366089))

(assert (= (and b!366089 res!204749) b!366088))

(assert (= (and b!366088 res!204752) b!366079))

(assert (= (and b!366079 res!204750) b!366081))

(assert (= (and b!366081 res!204756) b!366086))

(assert (= (and b!366086 res!204755) b!366083))

(assert (= (and b!366083 res!204751) b!366078))

(assert (= (and b!366082 condMapEmpty!14310) mapIsEmpty!14310))

(assert (= (and b!366082 (not condMapEmpty!14310)) mapNonEmpty!14310))

(get-info :version)

(assert (= (and mapNonEmpty!14310 ((_ is ValueCellFull!3908) mapValue!14310)) b!366080))

(assert (= (and b!366082 ((_ is ValueCellFull!3908) mapDefault!14310)) b!366084))

(assert (= start!36666 b!366082))

(declare-fun m!363791 () Bool)

(assert (=> b!366089 m!363791))

(declare-fun m!363793 () Bool)

(assert (=> b!366079 m!363793))

(declare-fun m!363795 () Bool)

(assert (=> b!366087 m!363795))

(declare-fun m!363797 () Bool)

(assert (=> mapNonEmpty!14310 m!363797))

(declare-fun m!363799 () Bool)

(assert (=> b!366083 m!363799))

(declare-fun m!363801 () Bool)

(assert (=> b!366083 m!363801))

(declare-fun m!363803 () Bool)

(assert (=> start!36666 m!363803))

(declare-fun m!363805 () Bool)

(assert (=> start!36666 m!363805))

(declare-fun m!363807 () Bool)

(assert (=> start!36666 m!363807))

(declare-fun m!363809 () Bool)

(assert (=> b!366081 m!363809))

(declare-fun m!363811 () Bool)

(assert (=> b!366086 m!363811))

(check-sat (not b!366086) tp_is_empty!8503 (not b!366089) (not start!36666) (not mapNonEmpty!14310) (not b!366083) (not b!366087) (not b!366079))
(check-sat)
