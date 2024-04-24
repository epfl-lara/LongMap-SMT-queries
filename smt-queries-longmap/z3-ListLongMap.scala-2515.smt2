; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38894 () Bool)

(assert start!38894)

(declare-fun b!406849 () Bool)

(declare-fun e!244420 () Bool)

(assert (=> b!406849 (= e!244420 false)))

(declare-fun lt!188579 () Bool)

(declare-datatypes ((array!24532 0))(
  ( (array!24533 (arr!11715 (Array (_ BitVec 32) (_ BitVec 64))) (size!12067 (_ BitVec 32))) )
))
(declare-fun lt!188580 () array!24532)

(declare-datatypes ((List!6678 0))(
  ( (Nil!6675) (Cons!6674 (h!7530 (_ BitVec 64)) (t!11844 List!6678)) )
))
(declare-fun arrayNoDuplicates!0 (array!24532 (_ BitVec 32) List!6678) Bool)

(assert (=> b!406849 (= lt!188579 (arrayNoDuplicates!0 lt!188580 #b00000000000000000000000000000000 Nil!6675))))

(declare-fun mapNonEmpty!17112 () Bool)

(declare-fun mapRes!17112 () Bool)

(declare-fun tp!33231 () Bool)

(declare-fun e!244418 () Bool)

(assert (=> mapNonEmpty!17112 (= mapRes!17112 (and tp!33231 e!244418))))

(declare-datatypes ((V!14875 0))(
  ( (V!14876 (val!5208 Int)) )
))
(declare-datatypes ((ValueCell!4820 0))(
  ( (ValueCellFull!4820 (v!7456 V!14875)) (EmptyCell!4820) )
))
(declare-fun mapValue!17112 () ValueCell!4820)

(declare-fun mapKey!17112 () (_ BitVec 32))

(declare-datatypes ((array!24534 0))(
  ( (array!24535 (arr!11716 (Array (_ BitVec 32) ValueCell!4820)) (size!12068 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24534)

(declare-fun mapRest!17112 () (Array (_ BitVec 32) ValueCell!4820))

(assert (=> mapNonEmpty!17112 (= (arr!11716 _values!549) (store mapRest!17112 mapKey!17112 mapValue!17112))))

(declare-fun b!406850 () Bool)

(declare-fun e!244419 () Bool)

(assert (=> b!406850 (= e!244419 e!244420)))

(declare-fun res!235125 () Bool)

(assert (=> b!406850 (=> (not res!235125) (not e!244420))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24532 (_ BitVec 32)) Bool)

(assert (=> b!406850 (= res!235125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188580 mask!1025))))

(declare-fun _keys!709 () array!24532)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406850 (= lt!188580 (array!24533 (store (arr!11715 _keys!709) i!563 k0!794) (size!12067 _keys!709)))))

(declare-fun b!406851 () Bool)

(declare-fun res!235132 () Bool)

(assert (=> b!406851 (=> (not res!235132) (not e!244419))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406851 (= res!235132 (and (= (size!12068 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12067 _keys!709) (size!12068 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!235133 () Bool)

(assert (=> start!38894 (=> (not res!235133) (not e!244419))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38894 (= res!235133 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12067 _keys!709))))))

(assert (=> start!38894 e!244419))

(assert (=> start!38894 true))

(declare-fun e!244416 () Bool)

(declare-fun array_inv!8640 (array!24534) Bool)

(assert (=> start!38894 (and (array_inv!8640 _values!549) e!244416)))

(declare-fun array_inv!8641 (array!24532) Bool)

(assert (=> start!38894 (array_inv!8641 _keys!709)))

(declare-fun b!406852 () Bool)

(declare-fun res!235131 () Bool)

(assert (=> b!406852 (=> (not res!235131) (not e!244419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406852 (= res!235131 (validMask!0 mask!1025))))

(declare-fun b!406853 () Bool)

(declare-fun tp_is_empty!10327 () Bool)

(assert (=> b!406853 (= e!244418 tp_is_empty!10327)))

(declare-fun b!406854 () Bool)

(declare-fun e!244417 () Bool)

(assert (=> b!406854 (= e!244416 (and e!244417 mapRes!17112))))

(declare-fun condMapEmpty!17112 () Bool)

(declare-fun mapDefault!17112 () ValueCell!4820)

(assert (=> b!406854 (= condMapEmpty!17112 (= (arr!11716 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4820)) mapDefault!17112)))))

(declare-fun b!406855 () Bool)

(declare-fun res!235126 () Bool)

(assert (=> b!406855 (=> (not res!235126) (not e!244419))))

(assert (=> b!406855 (= res!235126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406856 () Bool)

(declare-fun res!235127 () Bool)

(assert (=> b!406856 (=> (not res!235127) (not e!244419))))

(declare-fun arrayContainsKey!0 (array!24532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406856 (= res!235127 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406857 () Bool)

(declare-fun res!235128 () Bool)

(assert (=> b!406857 (=> (not res!235128) (not e!244419))))

(assert (=> b!406857 (= res!235128 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12067 _keys!709))))))

(declare-fun mapIsEmpty!17112 () Bool)

(assert (=> mapIsEmpty!17112 mapRes!17112))

(declare-fun b!406858 () Bool)

(declare-fun res!235134 () Bool)

(assert (=> b!406858 (=> (not res!235134) (not e!244419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406858 (= res!235134 (validKeyInArray!0 k0!794))))

(declare-fun b!406859 () Bool)

(assert (=> b!406859 (= e!244417 tp_is_empty!10327)))

(declare-fun b!406860 () Bool)

(declare-fun res!235129 () Bool)

(assert (=> b!406860 (=> (not res!235129) (not e!244419))))

(assert (=> b!406860 (= res!235129 (or (= (select (arr!11715 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11715 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406861 () Bool)

(declare-fun res!235130 () Bool)

(assert (=> b!406861 (=> (not res!235130) (not e!244419))))

(assert (=> b!406861 (= res!235130 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6675))))

(assert (= (and start!38894 res!235133) b!406852))

(assert (= (and b!406852 res!235131) b!406851))

(assert (= (and b!406851 res!235132) b!406855))

(assert (= (and b!406855 res!235126) b!406861))

(assert (= (and b!406861 res!235130) b!406857))

(assert (= (and b!406857 res!235128) b!406858))

(assert (= (and b!406858 res!235134) b!406860))

(assert (= (and b!406860 res!235129) b!406856))

(assert (= (and b!406856 res!235127) b!406850))

(assert (= (and b!406850 res!235125) b!406849))

(assert (= (and b!406854 condMapEmpty!17112) mapIsEmpty!17112))

(assert (= (and b!406854 (not condMapEmpty!17112)) mapNonEmpty!17112))

(get-info :version)

(assert (= (and mapNonEmpty!17112 ((_ is ValueCellFull!4820) mapValue!17112)) b!406853))

(assert (= (and b!406854 ((_ is ValueCellFull!4820) mapDefault!17112)) b!406859))

(assert (= start!38894 b!406854))

(declare-fun m!399021 () Bool)

(assert (=> b!406855 m!399021))

(declare-fun m!399023 () Bool)

(assert (=> start!38894 m!399023))

(declare-fun m!399025 () Bool)

(assert (=> start!38894 m!399025))

(declare-fun m!399027 () Bool)

(assert (=> b!406860 m!399027))

(declare-fun m!399029 () Bool)

(assert (=> b!406858 m!399029))

(declare-fun m!399031 () Bool)

(assert (=> b!406852 m!399031))

(declare-fun m!399033 () Bool)

(assert (=> b!406861 m!399033))

(declare-fun m!399035 () Bool)

(assert (=> b!406850 m!399035))

(declare-fun m!399037 () Bool)

(assert (=> b!406850 m!399037))

(declare-fun m!399039 () Bool)

(assert (=> b!406856 m!399039))

(declare-fun m!399041 () Bool)

(assert (=> mapNonEmpty!17112 m!399041))

(declare-fun m!399043 () Bool)

(assert (=> b!406849 m!399043))

(check-sat (not start!38894) tp_is_empty!10327 (not b!406858) (not b!406861) (not b!406850) (not b!406852) (not b!406849) (not b!406855) (not b!406856) (not mapNonEmpty!17112))
(check-sat)
