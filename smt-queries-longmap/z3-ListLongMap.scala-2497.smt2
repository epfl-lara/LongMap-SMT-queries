; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38786 () Bool)

(assert start!38786)

(declare-fun b!404743 () Bool)

(declare-fun res!233507 () Bool)

(declare-fun e!243445 () Bool)

(assert (=> b!404743 (=> (not res!233507) (not e!243445))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404743 (= res!233507 (validKeyInArray!0 k0!794))))

(declare-fun b!404744 () Bool)

(declare-fun e!243446 () Bool)

(declare-fun e!243444 () Bool)

(declare-fun mapRes!16950 () Bool)

(assert (=> b!404744 (= e!243446 (and e!243444 mapRes!16950))))

(declare-fun condMapEmpty!16950 () Bool)

(declare-datatypes ((V!14731 0))(
  ( (V!14732 (val!5154 Int)) )
))
(declare-datatypes ((ValueCell!4766 0))(
  ( (ValueCellFull!4766 (v!7402 V!14731)) (EmptyCell!4766) )
))
(declare-datatypes ((array!24318 0))(
  ( (array!24319 (arr!11608 (Array (_ BitVec 32) ValueCell!4766)) (size!11960 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24318)

(declare-fun mapDefault!16950 () ValueCell!4766)

(assert (=> b!404744 (= condMapEmpty!16950 (= (arr!11608 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4766)) mapDefault!16950)))))

(declare-fun res!233511 () Bool)

(assert (=> start!38786 (=> (not res!233511) (not e!243445))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24320 0))(
  ( (array!24321 (arr!11609 (Array (_ BitVec 32) (_ BitVec 64))) (size!11961 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24320)

(assert (=> start!38786 (= res!233511 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11961 _keys!709))))))

(assert (=> start!38786 e!243445))

(assert (=> start!38786 true))

(declare-fun array_inv!8570 (array!24318) Bool)

(assert (=> start!38786 (and (array_inv!8570 _values!549) e!243446)))

(declare-fun array_inv!8571 (array!24320) Bool)

(assert (=> start!38786 (array_inv!8571 _keys!709)))

(declare-fun b!404745 () Bool)

(declare-fun e!243447 () Bool)

(declare-fun tp_is_empty!10219 () Bool)

(assert (=> b!404745 (= e!243447 tp_is_empty!10219)))

(declare-fun b!404746 () Bool)

(declare-fun res!233514 () Bool)

(assert (=> b!404746 (=> (not res!233514) (not e!243445))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404746 (= res!233514 (validMask!0 mask!1025))))

(declare-fun b!404747 () Bool)

(declare-fun res!233512 () Bool)

(assert (=> b!404747 (=> (not res!233512) (not e!243445))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404747 (= res!233512 (or (= (select (arr!11609 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11609 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404748 () Bool)

(declare-fun res!233508 () Bool)

(assert (=> b!404748 (=> (not res!233508) (not e!243445))))

(declare-datatypes ((List!6634 0))(
  ( (Nil!6631) (Cons!6630 (h!7486 (_ BitVec 64)) (t!11800 List!6634)) )
))
(declare-fun arrayNoDuplicates!0 (array!24320 (_ BitVec 32) List!6634) Bool)

(assert (=> b!404748 (= res!233508 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6631))))

(declare-fun b!404749 () Bool)

(declare-fun res!233513 () Bool)

(assert (=> b!404749 (=> (not res!233513) (not e!243445))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404749 (= res!233513 (and (= (size!11960 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11961 _keys!709) (size!11960 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404750 () Bool)

(assert (=> b!404750 (= e!243444 tp_is_empty!10219)))

(declare-fun mapIsEmpty!16950 () Bool)

(assert (=> mapIsEmpty!16950 mapRes!16950))

(declare-fun b!404751 () Bool)

(declare-fun res!233509 () Bool)

(assert (=> b!404751 (=> (not res!233509) (not e!243445))))

(declare-fun arrayContainsKey!0 (array!24320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404751 (= res!233509 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404752 () Bool)

(declare-fun res!233506 () Bool)

(assert (=> b!404752 (=> (not res!233506) (not e!243445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24320 (_ BitVec 32)) Bool)

(assert (=> b!404752 (= res!233506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16950 () Bool)

(declare-fun tp!33069 () Bool)

(assert (=> mapNonEmpty!16950 (= mapRes!16950 (and tp!33069 e!243447))))

(declare-fun mapRest!16950 () (Array (_ BitVec 32) ValueCell!4766))

(declare-fun mapKey!16950 () (_ BitVec 32))

(declare-fun mapValue!16950 () ValueCell!4766)

(assert (=> mapNonEmpty!16950 (= (arr!11608 _values!549) (store mapRest!16950 mapKey!16950 mapValue!16950))))

(declare-fun b!404753 () Bool)

(declare-fun e!243443 () Bool)

(assert (=> b!404753 (= e!243445 e!243443)))

(declare-fun res!233510 () Bool)

(assert (=> b!404753 (=> (not res!233510) (not e!243443))))

(declare-fun lt!188256 () array!24320)

(assert (=> b!404753 (= res!233510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188256 mask!1025))))

(assert (=> b!404753 (= lt!188256 (array!24321 (store (arr!11609 _keys!709) i!563 k0!794) (size!11961 _keys!709)))))

(declare-fun b!404754 () Bool)

(declare-fun res!233505 () Bool)

(assert (=> b!404754 (=> (not res!233505) (not e!243445))))

(assert (=> b!404754 (= res!233505 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11961 _keys!709))))))

(declare-fun b!404755 () Bool)

(assert (=> b!404755 (= e!243443 false)))

(declare-fun lt!188255 () Bool)

(assert (=> b!404755 (= lt!188255 (arrayNoDuplicates!0 lt!188256 #b00000000000000000000000000000000 Nil!6631))))

(assert (= (and start!38786 res!233511) b!404746))

(assert (= (and b!404746 res!233514) b!404749))

(assert (= (and b!404749 res!233513) b!404752))

(assert (= (and b!404752 res!233506) b!404748))

(assert (= (and b!404748 res!233508) b!404754))

(assert (= (and b!404754 res!233505) b!404743))

(assert (= (and b!404743 res!233507) b!404747))

(assert (= (and b!404747 res!233512) b!404751))

(assert (= (and b!404751 res!233509) b!404753))

(assert (= (and b!404753 res!233510) b!404755))

(assert (= (and b!404744 condMapEmpty!16950) mapIsEmpty!16950))

(assert (= (and b!404744 (not condMapEmpty!16950)) mapNonEmpty!16950))

(get-info :version)

(assert (= (and mapNonEmpty!16950 ((_ is ValueCellFull!4766) mapValue!16950)) b!404745))

(assert (= (and b!404744 ((_ is ValueCellFull!4766) mapDefault!16950)) b!404750))

(assert (= start!38786 b!404744))

(declare-fun m!397725 () Bool)

(assert (=> b!404743 m!397725))

(declare-fun m!397727 () Bool)

(assert (=> b!404753 m!397727))

(declare-fun m!397729 () Bool)

(assert (=> b!404753 m!397729))

(declare-fun m!397731 () Bool)

(assert (=> b!404755 m!397731))

(declare-fun m!397733 () Bool)

(assert (=> start!38786 m!397733))

(declare-fun m!397735 () Bool)

(assert (=> start!38786 m!397735))

(declare-fun m!397737 () Bool)

(assert (=> b!404748 m!397737))

(declare-fun m!397739 () Bool)

(assert (=> b!404752 m!397739))

(declare-fun m!397741 () Bool)

(assert (=> b!404747 m!397741))

(declare-fun m!397743 () Bool)

(assert (=> b!404751 m!397743))

(declare-fun m!397745 () Bool)

(assert (=> b!404746 m!397745))

(declare-fun m!397747 () Bool)

(assert (=> mapNonEmpty!16950 m!397747))

(check-sat (not b!404746) tp_is_empty!10219 (not b!404755) (not b!404748) (not start!38786) (not b!404752) (not mapNonEmpty!16950) (not b!404753) (not b!404751) (not b!404743))
(check-sat)
