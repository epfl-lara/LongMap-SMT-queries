; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40520 () Bool)

(assert start!40520)

(declare-fun b!446428 () Bool)

(declare-fun res!265055 () Bool)

(declare-fun e!262230 () Bool)

(assert (=> b!446428 (=> (not res!265055) (not e!262230))))

(declare-datatypes ((array!27607 0))(
  ( (array!27608 (arr!13250 (Array (_ BitVec 32) (_ BitVec 64))) (size!13603 (_ BitVec 32))) )
))
(declare-fun lt!203612 () array!27607)

(declare-datatypes ((List!7930 0))(
  ( (Nil!7927) (Cons!7926 (h!8782 (_ BitVec 64)) (t!13681 List!7930)) )
))
(declare-fun arrayNoDuplicates!0 (array!27607 (_ BitVec 32) List!7930) Bool)

(assert (=> b!446428 (= res!265055 (arrayNoDuplicates!0 lt!203612 #b00000000000000000000000000000000 Nil!7927))))

(declare-fun b!446429 () Bool)

(declare-fun res!265062 () Bool)

(declare-fun e!262228 () Bool)

(assert (=> b!446429 (=> (not res!265062) (not e!262228))))

(declare-fun _keys!709 () array!27607)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446429 (= res!265062 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446430 () Bool)

(declare-fun e!262226 () Bool)

(declare-fun tp_is_empty!11899 () Bool)

(assert (=> b!446430 (= e!262226 tp_is_empty!11899)))

(declare-fun b!446431 () Bool)

(declare-fun res!265061 () Bool)

(assert (=> b!446431 (=> (not res!265061) (not e!262228))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16971 0))(
  ( (V!16972 (val!5994 Int)) )
))
(declare-datatypes ((ValueCell!5606 0))(
  ( (ValueCellFull!5606 (v!8243 V!16971)) (EmptyCell!5606) )
))
(declare-datatypes ((array!27609 0))(
  ( (array!27610 (arr!13251 (Array (_ BitVec 32) ValueCell!5606)) (size!13604 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27609)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!446431 (= res!265061 (and (= (size!13604 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13603 _keys!709) (size!13604 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446432 () Bool)

(assert (=> b!446432 (= e!262228 e!262230)))

(declare-fun res!265059 () Bool)

(assert (=> b!446432 (=> (not res!265059) (not e!262230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27607 (_ BitVec 32)) Bool)

(assert (=> b!446432 (= res!265059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203612 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446432 (= lt!203612 (array!27608 (store (arr!13250 _keys!709) i!563 k0!794) (size!13603 _keys!709)))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun b!446433 () Bool)

(assert (=> b!446433 (= e!262230 (and (bvsgt from!863 i!563) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13603 _keys!709)) (bvsge i!563 (size!13604 _values!549))))))

(declare-fun b!446434 () Bool)

(declare-fun res!265054 () Bool)

(assert (=> b!446434 (=> (not res!265054) (not e!262228))))

(assert (=> b!446434 (= res!265054 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7927))))

(declare-fun b!446435 () Bool)

(declare-fun res!265056 () Bool)

(assert (=> b!446435 (=> (not res!265056) (not e!262228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446435 (= res!265056 (validMask!0 mask!1025))))

(declare-fun b!446436 () Bool)

(declare-fun res!265058 () Bool)

(assert (=> b!446436 (=> (not res!265058) (not e!262228))))

(assert (=> b!446436 (= res!265058 (or (= (select (arr!13250 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13250 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446437 () Bool)

(declare-fun res!265060 () Bool)

(assert (=> b!446437 (=> (not res!265060) (not e!262228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446437 (= res!265060 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19479 () Bool)

(declare-fun mapRes!19479 () Bool)

(declare-fun tp!37506 () Bool)

(declare-fun e!262225 () Bool)

(assert (=> mapNonEmpty!19479 (= mapRes!19479 (and tp!37506 e!262225))))

(declare-fun mapRest!19479 () (Array (_ BitVec 32) ValueCell!5606))

(declare-fun mapValue!19479 () ValueCell!5606)

(declare-fun mapKey!19479 () (_ BitVec 32))

(assert (=> mapNonEmpty!19479 (= (arr!13251 _values!549) (store mapRest!19479 mapKey!19479 mapValue!19479))))

(declare-fun res!265057 () Bool)

(assert (=> start!40520 (=> (not res!265057) (not e!262228))))

(assert (=> start!40520 (= res!265057 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13603 _keys!709))))))

(assert (=> start!40520 e!262228))

(assert (=> start!40520 true))

(declare-fun e!262229 () Bool)

(declare-fun array_inv!9656 (array!27609) Bool)

(assert (=> start!40520 (and (array_inv!9656 _values!549) e!262229)))

(declare-fun array_inv!9657 (array!27607) Bool)

(assert (=> start!40520 (array_inv!9657 _keys!709)))

(declare-fun b!446438 () Bool)

(declare-fun res!265052 () Bool)

(assert (=> b!446438 (=> (not res!265052) (not e!262228))))

(assert (=> b!446438 (= res!265052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446439 () Bool)

(assert (=> b!446439 (= e!262225 tp_is_empty!11899)))

(declare-fun b!446440 () Bool)

(assert (=> b!446440 (= e!262229 (and e!262226 mapRes!19479))))

(declare-fun condMapEmpty!19479 () Bool)

(declare-fun mapDefault!19479 () ValueCell!5606)

(assert (=> b!446440 (= condMapEmpty!19479 (= (arr!13251 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5606)) mapDefault!19479)))))

(declare-fun b!446441 () Bool)

(declare-fun res!265053 () Bool)

(assert (=> b!446441 (=> (not res!265053) (not e!262228))))

(assert (=> b!446441 (= res!265053 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13603 _keys!709))))))

(declare-fun mapIsEmpty!19479 () Bool)

(assert (=> mapIsEmpty!19479 mapRes!19479))

(assert (= (and start!40520 res!265057) b!446435))

(assert (= (and b!446435 res!265056) b!446431))

(assert (= (and b!446431 res!265061) b!446438))

(assert (= (and b!446438 res!265052) b!446434))

(assert (= (and b!446434 res!265054) b!446441))

(assert (= (and b!446441 res!265053) b!446437))

(assert (= (and b!446437 res!265060) b!446436))

(assert (= (and b!446436 res!265058) b!446429))

(assert (= (and b!446429 res!265062) b!446432))

(assert (= (and b!446432 res!265059) b!446428))

(assert (= (and b!446428 res!265055) b!446433))

(assert (= (and b!446440 condMapEmpty!19479) mapIsEmpty!19479))

(assert (= (and b!446440 (not condMapEmpty!19479)) mapNonEmpty!19479))

(get-info :version)

(assert (= (and mapNonEmpty!19479 ((_ is ValueCellFull!5606) mapValue!19479)) b!446439))

(assert (= (and b!446440 ((_ is ValueCellFull!5606) mapDefault!19479)) b!446430))

(assert (= start!40520 b!446440))

(declare-fun m!431109 () Bool)

(assert (=> b!446429 m!431109))

(declare-fun m!431111 () Bool)

(assert (=> mapNonEmpty!19479 m!431111))

(declare-fun m!431113 () Bool)

(assert (=> b!446435 m!431113))

(declare-fun m!431115 () Bool)

(assert (=> start!40520 m!431115))

(declare-fun m!431117 () Bool)

(assert (=> start!40520 m!431117))

(declare-fun m!431119 () Bool)

(assert (=> b!446438 m!431119))

(declare-fun m!431121 () Bool)

(assert (=> b!446436 m!431121))

(declare-fun m!431123 () Bool)

(assert (=> b!446434 m!431123))

(declare-fun m!431125 () Bool)

(assert (=> b!446428 m!431125))

(declare-fun m!431127 () Bool)

(assert (=> b!446437 m!431127))

(declare-fun m!431129 () Bool)

(assert (=> b!446432 m!431129))

(declare-fun m!431131 () Bool)

(assert (=> b!446432 m!431131))

(check-sat (not b!446429) (not b!446435) (not b!446432) (not b!446434) tp_is_empty!11899 (not b!446437) (not mapNonEmpty!19479) (not start!40520) (not b!446428) (not b!446438))
(check-sat)
