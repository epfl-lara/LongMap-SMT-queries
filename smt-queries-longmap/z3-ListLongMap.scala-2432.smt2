; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38348 () Bool)

(assert start!38348)

(declare-fun b!395651 () Bool)

(declare-fun res!226885 () Bool)

(declare-fun e!239506 () Bool)

(assert (=> b!395651 (=> (not res!226885) (not e!239506))))

(declare-datatypes ((array!23556 0))(
  ( (array!23557 (arr!11230 (Array (_ BitVec 32) (_ BitVec 64))) (size!11582 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23556)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395651 (= res!226885 (or (= (select (arr!11230 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11230 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395652 () Bool)

(declare-fun res!226883 () Bool)

(assert (=> b!395652 (=> (not res!226883) (not e!239506))))

(declare-datatypes ((List!6381 0))(
  ( (Nil!6378) (Cons!6377 (h!7233 (_ BitVec 64)) (t!11547 List!6381)) )
))
(declare-fun arrayNoDuplicates!0 (array!23556 (_ BitVec 32) List!6381) Bool)

(assert (=> b!395652 (= res!226883 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6378))))

(declare-fun b!395653 () Bool)

(declare-fun res!226888 () Bool)

(assert (=> b!395653 (=> (not res!226888) (not e!239506))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395653 (= res!226888 (validKeyInArray!0 k0!794))))

(declare-fun b!395654 () Bool)

(declare-fun res!226891 () Bool)

(assert (=> b!395654 (=> (not res!226891) (not e!239506))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23556 (_ BitVec 32)) Bool)

(assert (=> b!395654 (= res!226891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395655 () Bool)

(declare-fun res!226886 () Bool)

(assert (=> b!395655 (=> (not res!226886) (not e!239506))))

(assert (=> b!395655 (= res!226886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23557 (store (arr!11230 _keys!709) i!563 k0!794) (size!11582 _keys!709)) mask!1025))))

(declare-fun mapIsEmpty!16356 () Bool)

(declare-fun mapRes!16356 () Bool)

(assert (=> mapIsEmpty!16356 mapRes!16356))

(declare-fun res!226889 () Bool)

(assert (=> start!38348 (=> (not res!226889) (not e!239506))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38348 (= res!226889 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11582 _keys!709))))))

(assert (=> start!38348 e!239506))

(assert (=> start!38348 true))

(declare-datatypes ((V!14211 0))(
  ( (V!14212 (val!4959 Int)) )
))
(declare-datatypes ((ValueCell!4571 0))(
  ( (ValueCellFull!4571 (v!7206 V!14211)) (EmptyCell!4571) )
))
(declare-datatypes ((array!23558 0))(
  ( (array!23559 (arr!11231 (Array (_ BitVec 32) ValueCell!4571)) (size!11583 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23558)

(declare-fun e!239507 () Bool)

(declare-fun array_inv!8304 (array!23558) Bool)

(assert (=> start!38348 (and (array_inv!8304 _values!549) e!239507)))

(declare-fun array_inv!8305 (array!23556) Bool)

(assert (=> start!38348 (array_inv!8305 _keys!709)))

(declare-fun b!395656 () Bool)

(declare-fun res!226887 () Bool)

(assert (=> b!395656 (=> (not res!226887) (not e!239506))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395656 (= res!226887 (and (= (size!11583 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11582 _keys!709) (size!11583 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16356 () Bool)

(declare-fun tp!32151 () Bool)

(declare-fun e!239510 () Bool)

(assert (=> mapNonEmpty!16356 (= mapRes!16356 (and tp!32151 e!239510))))

(declare-fun mapValue!16356 () ValueCell!4571)

(declare-fun mapKey!16356 () (_ BitVec 32))

(declare-fun mapRest!16356 () (Array (_ BitVec 32) ValueCell!4571))

(assert (=> mapNonEmpty!16356 (= (arr!11231 _values!549) (store mapRest!16356 mapKey!16356 mapValue!16356))))

(declare-fun b!395657 () Bool)

(assert (=> b!395657 (= e!239506 (bvsgt #b00000000000000000000000000000000 (size!11582 _keys!709)))))

(declare-fun b!395658 () Bool)

(declare-fun e!239508 () Bool)

(declare-fun tp_is_empty!9829 () Bool)

(assert (=> b!395658 (= e!239508 tp_is_empty!9829)))

(declare-fun b!395659 () Bool)

(assert (=> b!395659 (= e!239507 (and e!239508 mapRes!16356))))

(declare-fun condMapEmpty!16356 () Bool)

(declare-fun mapDefault!16356 () ValueCell!4571)

(assert (=> b!395659 (= condMapEmpty!16356 (= (arr!11231 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4571)) mapDefault!16356)))))

(declare-fun b!395660 () Bool)

(assert (=> b!395660 (= e!239510 tp_is_empty!9829)))

(declare-fun b!395661 () Bool)

(declare-fun res!226890 () Bool)

(assert (=> b!395661 (=> (not res!226890) (not e!239506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395661 (= res!226890 (validMask!0 mask!1025))))

(declare-fun b!395662 () Bool)

(declare-fun res!226882 () Bool)

(assert (=> b!395662 (=> (not res!226882) (not e!239506))))

(declare-fun arrayContainsKey!0 (array!23556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395662 (= res!226882 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!395663 () Bool)

(declare-fun res!226884 () Bool)

(assert (=> b!395663 (=> (not res!226884) (not e!239506))))

(assert (=> b!395663 (= res!226884 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11582 _keys!709))))))

(assert (= (and start!38348 res!226889) b!395661))

(assert (= (and b!395661 res!226890) b!395656))

(assert (= (and b!395656 res!226887) b!395654))

(assert (= (and b!395654 res!226891) b!395652))

(assert (= (and b!395652 res!226883) b!395663))

(assert (= (and b!395663 res!226884) b!395653))

(assert (= (and b!395653 res!226888) b!395651))

(assert (= (and b!395651 res!226885) b!395662))

(assert (= (and b!395662 res!226882) b!395655))

(assert (= (and b!395655 res!226886) b!395657))

(assert (= (and b!395659 condMapEmpty!16356) mapIsEmpty!16356))

(assert (= (and b!395659 (not condMapEmpty!16356)) mapNonEmpty!16356))

(get-info :version)

(assert (= (and mapNonEmpty!16356 ((_ is ValueCellFull!4571) mapValue!16356)) b!395660))

(assert (= (and b!395659 ((_ is ValueCellFull!4571) mapDefault!16356)) b!395658))

(assert (= start!38348 b!395659))

(declare-fun m!391851 () Bool)

(assert (=> mapNonEmpty!16356 m!391851))

(declare-fun m!391853 () Bool)

(assert (=> b!395652 m!391853))

(declare-fun m!391855 () Bool)

(assert (=> b!395651 m!391855))

(declare-fun m!391857 () Bool)

(assert (=> b!395655 m!391857))

(declare-fun m!391859 () Bool)

(assert (=> b!395655 m!391859))

(declare-fun m!391861 () Bool)

(assert (=> start!38348 m!391861))

(declare-fun m!391863 () Bool)

(assert (=> start!38348 m!391863))

(declare-fun m!391865 () Bool)

(assert (=> b!395654 m!391865))

(declare-fun m!391867 () Bool)

(assert (=> b!395662 m!391867))

(declare-fun m!391869 () Bool)

(assert (=> b!395661 m!391869))

(declare-fun m!391871 () Bool)

(assert (=> b!395653 m!391871))

(check-sat (not start!38348) tp_is_empty!9829 (not b!395654) (not mapNonEmpty!16356) (not b!395652) (not b!395655) (not b!395661) (not b!395662) (not b!395653))
(check-sat)
