; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38876 () Bool)

(assert start!38876)

(declare-fun b!406498 () Bool)

(declare-fun res!234860 () Bool)

(declare-fun e!244254 () Bool)

(assert (=> b!406498 (=> (not res!234860) (not e!244254))))

(declare-datatypes ((array!24496 0))(
  ( (array!24497 (arr!11697 (Array (_ BitVec 32) (_ BitVec 64))) (size!12049 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24496)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24496 (_ BitVec 32)) Bool)

(assert (=> b!406498 (= res!234860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406499 () Bool)

(declare-fun res!234859 () Bool)

(assert (=> b!406499 (=> (not res!234859) (not e!244254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406499 (= res!234859 (validMask!0 mask!1025))))

(declare-fun b!406500 () Bool)

(declare-fun res!234861 () Bool)

(assert (=> b!406500 (=> (not res!234861) (not e!244254))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406500 (= res!234861 (or (= (select (arr!11697 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11697 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406501 () Bool)

(declare-fun res!234855 () Bool)

(assert (=> b!406501 (=> (not res!234855) (not e!244254))))

(assert (=> b!406501 (= res!234855 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12049 _keys!709))))))

(declare-fun mapIsEmpty!17085 () Bool)

(declare-fun mapRes!17085 () Bool)

(assert (=> mapIsEmpty!17085 mapRes!17085))

(declare-fun b!406502 () Bool)

(declare-fun e!244255 () Bool)

(declare-fun tp_is_empty!10309 () Bool)

(assert (=> b!406502 (= e!244255 tp_is_empty!10309)))

(declare-fun res!234864 () Bool)

(assert (=> start!38876 (=> (not res!234864) (not e!244254))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38876 (= res!234864 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12049 _keys!709))))))

(assert (=> start!38876 e!244254))

(assert (=> start!38876 true))

(declare-datatypes ((V!14851 0))(
  ( (V!14852 (val!5199 Int)) )
))
(declare-datatypes ((ValueCell!4811 0))(
  ( (ValueCellFull!4811 (v!7447 V!14851)) (EmptyCell!4811) )
))
(declare-datatypes ((array!24498 0))(
  ( (array!24499 (arr!11698 (Array (_ BitVec 32) ValueCell!4811)) (size!12050 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24498)

(declare-fun e!244257 () Bool)

(declare-fun array_inv!8634 (array!24498) Bool)

(assert (=> start!38876 (and (array_inv!8634 _values!549) e!244257)))

(declare-fun array_inv!8635 (array!24496) Bool)

(assert (=> start!38876 (array_inv!8635 _keys!709)))

(declare-fun b!406503 () Bool)

(declare-fun e!244258 () Bool)

(assert (=> b!406503 (= e!244254 e!244258)))

(declare-fun res!234857 () Bool)

(assert (=> b!406503 (=> (not res!234857) (not e!244258))))

(declare-fun lt!188525 () array!24496)

(assert (=> b!406503 (= res!234857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188525 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!406503 (= lt!188525 (array!24497 (store (arr!11697 _keys!709) i!563 k0!794) (size!12049 _keys!709)))))

(declare-fun b!406504 () Bool)

(declare-fun res!234863 () Bool)

(assert (=> b!406504 (=> (not res!234863) (not e!244254))))

(declare-fun arrayContainsKey!0 (array!24496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406504 (= res!234863 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406505 () Bool)

(declare-fun res!234856 () Bool)

(assert (=> b!406505 (=> (not res!234856) (not e!244254))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406505 (= res!234856 (and (= (size!12050 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12049 _keys!709) (size!12050 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406506 () Bool)

(assert (=> b!406506 (= e!244258 false)))

(declare-fun lt!188526 () Bool)

(declare-datatypes ((List!6672 0))(
  ( (Nil!6669) (Cons!6668 (h!7524 (_ BitVec 64)) (t!11838 List!6672)) )
))
(declare-fun arrayNoDuplicates!0 (array!24496 (_ BitVec 32) List!6672) Bool)

(assert (=> b!406506 (= lt!188526 (arrayNoDuplicates!0 lt!188525 #b00000000000000000000000000000000 Nil!6669))))

(declare-fun b!406507 () Bool)

(assert (=> b!406507 (= e!244257 (and e!244255 mapRes!17085))))

(declare-fun condMapEmpty!17085 () Bool)

(declare-fun mapDefault!17085 () ValueCell!4811)

(assert (=> b!406507 (= condMapEmpty!17085 (= (arr!11698 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4811)) mapDefault!17085)))))

(declare-fun b!406508 () Bool)

(declare-fun res!234862 () Bool)

(assert (=> b!406508 (=> (not res!234862) (not e!244254))))

(assert (=> b!406508 (= res!234862 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6669))))

(declare-fun b!406509 () Bool)

(declare-fun e!244253 () Bool)

(assert (=> b!406509 (= e!244253 tp_is_empty!10309)))

(declare-fun mapNonEmpty!17085 () Bool)

(declare-fun tp!33204 () Bool)

(assert (=> mapNonEmpty!17085 (= mapRes!17085 (and tp!33204 e!244253))))

(declare-fun mapValue!17085 () ValueCell!4811)

(declare-fun mapRest!17085 () (Array (_ BitVec 32) ValueCell!4811))

(declare-fun mapKey!17085 () (_ BitVec 32))

(assert (=> mapNonEmpty!17085 (= (arr!11698 _values!549) (store mapRest!17085 mapKey!17085 mapValue!17085))))

(declare-fun b!406510 () Bool)

(declare-fun res!234858 () Bool)

(assert (=> b!406510 (=> (not res!234858) (not e!244254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406510 (= res!234858 (validKeyInArray!0 k0!794))))

(assert (= (and start!38876 res!234864) b!406499))

(assert (= (and b!406499 res!234859) b!406505))

(assert (= (and b!406505 res!234856) b!406498))

(assert (= (and b!406498 res!234860) b!406508))

(assert (= (and b!406508 res!234862) b!406501))

(assert (= (and b!406501 res!234855) b!406510))

(assert (= (and b!406510 res!234858) b!406500))

(assert (= (and b!406500 res!234861) b!406504))

(assert (= (and b!406504 res!234863) b!406503))

(assert (= (and b!406503 res!234857) b!406506))

(assert (= (and b!406507 condMapEmpty!17085) mapIsEmpty!17085))

(assert (= (and b!406507 (not condMapEmpty!17085)) mapNonEmpty!17085))

(get-info :version)

(assert (= (and mapNonEmpty!17085 ((_ is ValueCellFull!4811) mapValue!17085)) b!406509))

(assert (= (and b!406507 ((_ is ValueCellFull!4811) mapDefault!17085)) b!406502))

(assert (= start!38876 b!406507))

(declare-fun m!398805 () Bool)

(assert (=> start!38876 m!398805))

(declare-fun m!398807 () Bool)

(assert (=> start!38876 m!398807))

(declare-fun m!398809 () Bool)

(assert (=> b!406510 m!398809))

(declare-fun m!398811 () Bool)

(assert (=> b!406500 m!398811))

(declare-fun m!398813 () Bool)

(assert (=> b!406503 m!398813))

(declare-fun m!398815 () Bool)

(assert (=> b!406503 m!398815))

(declare-fun m!398817 () Bool)

(assert (=> b!406499 m!398817))

(declare-fun m!398819 () Bool)

(assert (=> mapNonEmpty!17085 m!398819))

(declare-fun m!398821 () Bool)

(assert (=> b!406498 m!398821))

(declare-fun m!398823 () Bool)

(assert (=> b!406504 m!398823))

(declare-fun m!398825 () Bool)

(assert (=> b!406508 m!398825))

(declare-fun m!398827 () Bool)

(assert (=> b!406506 m!398827))

(check-sat tp_is_empty!10309 (not b!406499) (not b!406510) (not b!406503) (not mapNonEmpty!17085) (not start!38876) (not b!406508) (not b!406506) (not b!406498) (not b!406504))
(check-sat)
