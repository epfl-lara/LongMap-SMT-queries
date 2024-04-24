; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38942 () Bool)

(assert start!38942)

(declare-fun b!407785 () Bool)

(declare-fun res!235850 () Bool)

(declare-fun e!244848 () Bool)

(assert (=> b!407785 (=> (not res!235850) (not e!244848))))

(declare-datatypes ((array!24628 0))(
  ( (array!24629 (arr!11763 (Array (_ BitVec 32) (_ BitVec 64))) (size!12115 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24628)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24628 (_ BitVec 32)) Bool)

(assert (=> b!407785 (= res!235850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407786 () Bool)

(declare-fun res!235847 () Bool)

(assert (=> b!407786 (=> (not res!235847) (not e!244848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407786 (= res!235847 (validMask!0 mask!1025))))

(declare-fun b!407787 () Bool)

(declare-fun res!235845 () Bool)

(assert (=> b!407787 (=> (not res!235845) (not e!244848))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407787 (= res!235845 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12115 _keys!709))))))

(declare-fun b!407788 () Bool)

(declare-fun res!235849 () Bool)

(assert (=> b!407788 (=> (not res!235849) (not e!244848))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14939 0))(
  ( (V!14940 (val!5232 Int)) )
))
(declare-datatypes ((ValueCell!4844 0))(
  ( (ValueCellFull!4844 (v!7480 V!14939)) (EmptyCell!4844) )
))
(declare-datatypes ((array!24630 0))(
  ( (array!24631 (arr!11764 (Array (_ BitVec 32) ValueCell!4844)) (size!12116 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24630)

(assert (=> b!407788 (= res!235849 (and (= (size!12116 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12115 _keys!709) (size!12116 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407789 () Bool)

(declare-fun res!235846 () Bool)

(assert (=> b!407789 (=> (not res!235846) (not e!244848))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407789 (= res!235846 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407790 () Bool)

(declare-fun e!244849 () Bool)

(declare-fun e!244850 () Bool)

(declare-fun mapRes!17184 () Bool)

(assert (=> b!407790 (= e!244849 (and e!244850 mapRes!17184))))

(declare-fun condMapEmpty!17184 () Bool)

(declare-fun mapDefault!17184 () ValueCell!4844)

(assert (=> b!407790 (= condMapEmpty!17184 (= (arr!11764 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4844)) mapDefault!17184)))))

(declare-fun mapIsEmpty!17184 () Bool)

(assert (=> mapIsEmpty!17184 mapRes!17184))

(declare-fun res!235852 () Bool)

(assert (=> start!38942 (=> (not res!235852) (not e!244848))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38942 (= res!235852 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12115 _keys!709))))))

(assert (=> start!38942 e!244848))

(assert (=> start!38942 true))

(declare-fun array_inv!8670 (array!24630) Bool)

(assert (=> start!38942 (and (array_inv!8670 _values!549) e!244849)))

(declare-fun array_inv!8671 (array!24628) Bool)

(assert (=> start!38942 (array_inv!8671 _keys!709)))

(declare-fun mapNonEmpty!17184 () Bool)

(declare-fun tp!33303 () Bool)

(declare-fun e!244847 () Bool)

(assert (=> mapNonEmpty!17184 (= mapRes!17184 (and tp!33303 e!244847))))

(declare-fun mapKey!17184 () (_ BitVec 32))

(declare-fun mapValue!17184 () ValueCell!4844)

(declare-fun mapRest!17184 () (Array (_ BitVec 32) ValueCell!4844))

(assert (=> mapNonEmpty!17184 (= (arr!11764 _values!549) (store mapRest!17184 mapKey!17184 mapValue!17184))))

(declare-fun b!407791 () Bool)

(declare-fun res!235853 () Bool)

(assert (=> b!407791 (=> (not res!235853) (not e!244848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407791 (= res!235853 (validKeyInArray!0 k0!794))))

(declare-fun b!407792 () Bool)

(declare-fun e!244852 () Bool)

(assert (=> b!407792 (= e!244852 false)))

(declare-fun lt!188723 () Bool)

(declare-fun lt!188724 () array!24628)

(declare-datatypes ((List!6698 0))(
  ( (Nil!6695) (Cons!6694 (h!7550 (_ BitVec 64)) (t!11864 List!6698)) )
))
(declare-fun arrayNoDuplicates!0 (array!24628 (_ BitVec 32) List!6698) Bool)

(assert (=> b!407792 (= lt!188723 (arrayNoDuplicates!0 lt!188724 #b00000000000000000000000000000000 Nil!6695))))

(declare-fun b!407793 () Bool)

(assert (=> b!407793 (= e!244848 e!244852)))

(declare-fun res!235854 () Bool)

(assert (=> b!407793 (=> (not res!235854) (not e!244852))))

(assert (=> b!407793 (= res!235854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188724 mask!1025))))

(assert (=> b!407793 (= lt!188724 (array!24629 (store (arr!11763 _keys!709) i!563 k0!794) (size!12115 _keys!709)))))

(declare-fun b!407794 () Bool)

(declare-fun res!235851 () Bool)

(assert (=> b!407794 (=> (not res!235851) (not e!244848))))

(assert (=> b!407794 (= res!235851 (or (= (select (arr!11763 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11763 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407795 () Bool)

(declare-fun tp_is_empty!10375 () Bool)

(assert (=> b!407795 (= e!244847 tp_is_empty!10375)))

(declare-fun b!407796 () Bool)

(declare-fun res!235848 () Bool)

(assert (=> b!407796 (=> (not res!235848) (not e!244848))))

(assert (=> b!407796 (= res!235848 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6695))))

(declare-fun b!407797 () Bool)

(assert (=> b!407797 (= e!244850 tp_is_empty!10375)))

(assert (= (and start!38942 res!235852) b!407786))

(assert (= (and b!407786 res!235847) b!407788))

(assert (= (and b!407788 res!235849) b!407785))

(assert (= (and b!407785 res!235850) b!407796))

(assert (= (and b!407796 res!235848) b!407787))

(assert (= (and b!407787 res!235845) b!407791))

(assert (= (and b!407791 res!235853) b!407794))

(assert (= (and b!407794 res!235851) b!407789))

(assert (= (and b!407789 res!235846) b!407793))

(assert (= (and b!407793 res!235854) b!407792))

(assert (= (and b!407790 condMapEmpty!17184) mapIsEmpty!17184))

(assert (= (and b!407790 (not condMapEmpty!17184)) mapNonEmpty!17184))

(get-info :version)

(assert (= (and mapNonEmpty!17184 ((_ is ValueCellFull!4844) mapValue!17184)) b!407795))

(assert (= (and b!407790 ((_ is ValueCellFull!4844) mapDefault!17184)) b!407797))

(assert (= start!38942 b!407790))

(declare-fun m!399597 () Bool)

(assert (=> b!407796 m!399597))

(declare-fun m!399599 () Bool)

(assert (=> b!407786 m!399599))

(declare-fun m!399601 () Bool)

(assert (=> b!407793 m!399601))

(declare-fun m!399603 () Bool)

(assert (=> b!407793 m!399603))

(declare-fun m!399605 () Bool)

(assert (=> b!407785 m!399605))

(declare-fun m!399607 () Bool)

(assert (=> b!407791 m!399607))

(declare-fun m!399609 () Bool)

(assert (=> start!38942 m!399609))

(declare-fun m!399611 () Bool)

(assert (=> start!38942 m!399611))

(declare-fun m!399613 () Bool)

(assert (=> mapNonEmpty!17184 m!399613))

(declare-fun m!399615 () Bool)

(assert (=> b!407794 m!399615))

(declare-fun m!399617 () Bool)

(assert (=> b!407789 m!399617))

(declare-fun m!399619 () Bool)

(assert (=> b!407792 m!399619))

(check-sat (not b!407796) (not b!407793) (not mapNonEmpty!17184) (not b!407786) (not b!407791) (not start!38942) tp_is_empty!10375 (not b!407789) (not b!407785) (not b!407792))
(check-sat)
