; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40530 () Bool)

(assert start!40530)

(declare-fun b!446619 () Bool)

(declare-fun e!262367 () Bool)

(declare-fun tp_is_empty!11895 () Bool)

(assert (=> b!446619 (= e!262367 tp_is_empty!11895)))

(declare-fun b!446620 () Bool)

(declare-fun res!265123 () Bool)

(declare-fun e!262363 () Bool)

(assert (=> b!446620 (=> (not res!265123) (not e!262363))))

(declare-datatypes ((array!27597 0))(
  ( (array!27598 (arr!13245 (Array (_ BitVec 32) (_ BitVec 64))) (size!13597 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27597)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16965 0))(
  ( (V!16966 (val!5992 Int)) )
))
(declare-datatypes ((ValueCell!5604 0))(
  ( (ValueCellFull!5604 (v!8247 V!16965)) (EmptyCell!5604) )
))
(declare-datatypes ((array!27599 0))(
  ( (array!27600 (arr!13246 (Array (_ BitVec 32) ValueCell!5604)) (size!13598 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27599)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!446620 (= res!265123 (and (= (size!13598 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13597 _keys!709) (size!13598 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446621 () Bool)

(declare-fun e!262366 () Bool)

(declare-fun e!262365 () Bool)

(declare-fun mapRes!19473 () Bool)

(assert (=> b!446621 (= e!262366 (and e!262365 mapRes!19473))))

(declare-fun condMapEmpty!19473 () Bool)

(declare-fun mapDefault!19473 () ValueCell!5604)

(assert (=> b!446621 (= condMapEmpty!19473 (= (arr!13246 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5604)) mapDefault!19473)))))

(declare-fun b!446622 () Bool)

(declare-fun res!265120 () Bool)

(assert (=> b!446622 (=> (not res!265120) (not e!262363))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446622 (= res!265120 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13597 _keys!709))))))

(declare-fun b!446623 () Bool)

(declare-fun e!262364 () Bool)

(assert (=> b!446623 (= e!262364 false)))

(declare-fun lt!203837 () Bool)

(declare-fun lt!203836 () array!27597)

(declare-datatypes ((List!7923 0))(
  ( (Nil!7920) (Cons!7919 (h!8775 (_ BitVec 64)) (t!13683 List!7923)) )
))
(declare-fun arrayNoDuplicates!0 (array!27597 (_ BitVec 32) List!7923) Bool)

(assert (=> b!446623 (= lt!203837 (arrayNoDuplicates!0 lt!203836 #b00000000000000000000000000000000 Nil!7920))))

(declare-fun b!446624 () Bool)

(declare-fun res!265125 () Bool)

(assert (=> b!446624 (=> (not res!265125) (not e!262363))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446624 (= res!265125 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446625 () Bool)

(declare-fun res!265128 () Bool)

(assert (=> b!446625 (=> (not res!265128) (not e!262363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446625 (= res!265128 (validKeyInArray!0 k0!794))))

(declare-fun b!446626 () Bool)

(declare-fun res!265126 () Bool)

(assert (=> b!446626 (=> (not res!265126) (not e!262363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27597 (_ BitVec 32)) Bool)

(assert (=> b!446626 (= res!265126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!265127 () Bool)

(assert (=> start!40530 (=> (not res!265127) (not e!262363))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40530 (= res!265127 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13597 _keys!709))))))

(assert (=> start!40530 e!262363))

(assert (=> start!40530 true))

(declare-fun array_inv!9604 (array!27599) Bool)

(assert (=> start!40530 (and (array_inv!9604 _values!549) e!262366)))

(declare-fun array_inv!9605 (array!27597) Bool)

(assert (=> start!40530 (array_inv!9605 _keys!709)))

(declare-fun b!446627 () Bool)

(assert (=> b!446627 (= e!262365 tp_is_empty!11895)))

(declare-fun mapIsEmpty!19473 () Bool)

(assert (=> mapIsEmpty!19473 mapRes!19473))

(declare-fun b!446628 () Bool)

(declare-fun res!265119 () Bool)

(assert (=> b!446628 (=> (not res!265119) (not e!262363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446628 (= res!265119 (validMask!0 mask!1025))))

(declare-fun b!446629 () Bool)

(assert (=> b!446629 (= e!262363 e!262364)))

(declare-fun res!265122 () Bool)

(assert (=> b!446629 (=> (not res!265122) (not e!262364))))

(assert (=> b!446629 (= res!265122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203836 mask!1025))))

(assert (=> b!446629 (= lt!203836 (array!27598 (store (arr!13245 _keys!709) i!563 k0!794) (size!13597 _keys!709)))))

(declare-fun mapNonEmpty!19473 () Bool)

(declare-fun tp!37500 () Bool)

(assert (=> mapNonEmpty!19473 (= mapRes!19473 (and tp!37500 e!262367))))

(declare-fun mapValue!19473 () ValueCell!5604)

(declare-fun mapKey!19473 () (_ BitVec 32))

(declare-fun mapRest!19473 () (Array (_ BitVec 32) ValueCell!5604))

(assert (=> mapNonEmpty!19473 (= (arr!13246 _values!549) (store mapRest!19473 mapKey!19473 mapValue!19473))))

(declare-fun b!446630 () Bool)

(declare-fun res!265121 () Bool)

(assert (=> b!446630 (=> (not res!265121) (not e!262363))))

(assert (=> b!446630 (= res!265121 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7920))))

(declare-fun b!446631 () Bool)

(declare-fun res!265124 () Bool)

(assert (=> b!446631 (=> (not res!265124) (not e!262363))))

(assert (=> b!446631 (= res!265124 (or (= (select (arr!13245 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13245 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40530 res!265127) b!446628))

(assert (= (and b!446628 res!265119) b!446620))

(assert (= (and b!446620 res!265123) b!446626))

(assert (= (and b!446626 res!265126) b!446630))

(assert (= (and b!446630 res!265121) b!446622))

(assert (= (and b!446622 res!265120) b!446625))

(assert (= (and b!446625 res!265128) b!446631))

(assert (= (and b!446631 res!265124) b!446624))

(assert (= (and b!446624 res!265125) b!446629))

(assert (= (and b!446629 res!265122) b!446623))

(assert (= (and b!446621 condMapEmpty!19473) mapIsEmpty!19473))

(assert (= (and b!446621 (not condMapEmpty!19473)) mapNonEmpty!19473))

(get-info :version)

(assert (= (and mapNonEmpty!19473 ((_ is ValueCellFull!5604) mapValue!19473)) b!446619))

(assert (= (and b!446621 ((_ is ValueCellFull!5604) mapDefault!19473)) b!446627))

(assert (= start!40530 b!446621))

(declare-fun m!431793 () Bool)

(assert (=> b!446624 m!431793))

(declare-fun m!431795 () Bool)

(assert (=> b!446631 m!431795))

(declare-fun m!431797 () Bool)

(assert (=> b!446623 m!431797))

(declare-fun m!431799 () Bool)

(assert (=> b!446626 m!431799))

(declare-fun m!431801 () Bool)

(assert (=> b!446628 m!431801))

(declare-fun m!431803 () Bool)

(assert (=> b!446629 m!431803))

(declare-fun m!431805 () Bool)

(assert (=> b!446629 m!431805))

(declare-fun m!431807 () Bool)

(assert (=> start!40530 m!431807))

(declare-fun m!431809 () Bool)

(assert (=> start!40530 m!431809))

(declare-fun m!431811 () Bool)

(assert (=> mapNonEmpty!19473 m!431811))

(declare-fun m!431813 () Bool)

(assert (=> b!446625 m!431813))

(declare-fun m!431815 () Bool)

(assert (=> b!446630 m!431815))

(check-sat (not start!40530) (not b!446629) tp_is_empty!11895 (not b!446624) (not b!446623) (not b!446626) (not b!446630) (not mapNonEmpty!19473) (not b!446628) (not b!446625))
(check-sat)
