; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38882 () Bool)

(assert start!38882)

(declare-fun res!234953 () Bool)

(declare-fun e!244311 () Bool)

(assert (=> start!38882 (=> (not res!234953) (not e!244311))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24508 0))(
  ( (array!24509 (arr!11703 (Array (_ BitVec 32) (_ BitVec 64))) (size!12055 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24508)

(assert (=> start!38882 (= res!234953 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12055 _keys!709))))))

(assert (=> start!38882 e!244311))

(assert (=> start!38882 true))

(declare-datatypes ((V!14859 0))(
  ( (V!14860 (val!5202 Int)) )
))
(declare-datatypes ((ValueCell!4814 0))(
  ( (ValueCellFull!4814 (v!7450 V!14859)) (EmptyCell!4814) )
))
(declare-datatypes ((array!24510 0))(
  ( (array!24511 (arr!11704 (Array (_ BitVec 32) ValueCell!4814)) (size!12056 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24510)

(declare-fun e!244309 () Bool)

(declare-fun array_inv!8636 (array!24510) Bool)

(assert (=> start!38882 (and (array_inv!8636 _values!549) e!244309)))

(declare-fun array_inv!8637 (array!24508) Bool)

(assert (=> start!38882 (array_inv!8637 _keys!709)))

(declare-fun b!406615 () Bool)

(declare-fun e!244312 () Bool)

(assert (=> b!406615 (= e!244312 false)))

(declare-fun lt!188544 () Bool)

(declare-fun lt!188543 () array!24508)

(declare-datatypes ((List!6673 0))(
  ( (Nil!6670) (Cons!6669 (h!7525 (_ BitVec 64)) (t!11839 List!6673)) )
))
(declare-fun arrayNoDuplicates!0 (array!24508 (_ BitVec 32) List!6673) Bool)

(assert (=> b!406615 (= lt!188544 (arrayNoDuplicates!0 lt!188543 #b00000000000000000000000000000000 Nil!6670))))

(declare-fun b!406616 () Bool)

(declare-fun res!234947 () Bool)

(assert (=> b!406616 (=> (not res!234947) (not e!244311))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24508 (_ BitVec 32)) Bool)

(assert (=> b!406616 (= res!234947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406617 () Bool)

(declare-fun e!244310 () Bool)

(declare-fun mapRes!17094 () Bool)

(assert (=> b!406617 (= e!244309 (and e!244310 mapRes!17094))))

(declare-fun condMapEmpty!17094 () Bool)

(declare-fun mapDefault!17094 () ValueCell!4814)

(assert (=> b!406617 (= condMapEmpty!17094 (= (arr!11704 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4814)) mapDefault!17094)))))

(declare-fun b!406618 () Bool)

(assert (=> b!406618 (= e!244311 e!244312)))

(declare-fun res!234945 () Bool)

(assert (=> b!406618 (=> (not res!234945) (not e!244312))))

(assert (=> b!406618 (= res!234945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188543 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406618 (= lt!188543 (array!24509 (store (arr!11703 _keys!709) i!563 k0!794) (size!12055 _keys!709)))))

(declare-fun mapNonEmpty!17094 () Bool)

(declare-fun tp!33213 () Bool)

(declare-fun e!244308 () Bool)

(assert (=> mapNonEmpty!17094 (= mapRes!17094 (and tp!33213 e!244308))))

(declare-fun mapKey!17094 () (_ BitVec 32))

(declare-fun mapRest!17094 () (Array (_ BitVec 32) ValueCell!4814))

(declare-fun mapValue!17094 () ValueCell!4814)

(assert (=> mapNonEmpty!17094 (= (arr!11704 _values!549) (store mapRest!17094 mapKey!17094 mapValue!17094))))

(declare-fun b!406619 () Bool)

(declare-fun res!234951 () Bool)

(assert (=> b!406619 (=> (not res!234951) (not e!244311))))

(assert (=> b!406619 (= res!234951 (or (= (select (arr!11703 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11703 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406620 () Bool)

(declare-fun res!234950 () Bool)

(assert (=> b!406620 (=> (not res!234950) (not e!244311))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406620 (= res!234950 (and (= (size!12056 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12055 _keys!709) (size!12056 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406621 () Bool)

(declare-fun res!234954 () Bool)

(assert (=> b!406621 (=> (not res!234954) (not e!244311))))

(assert (=> b!406621 (= res!234954 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6670))))

(declare-fun b!406622 () Bool)

(declare-fun res!234948 () Bool)

(assert (=> b!406622 (=> (not res!234948) (not e!244311))))

(assert (=> b!406622 (= res!234948 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12055 _keys!709))))))

(declare-fun b!406623 () Bool)

(declare-fun res!234946 () Bool)

(assert (=> b!406623 (=> (not res!234946) (not e!244311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406623 (= res!234946 (validMask!0 mask!1025))))

(declare-fun b!406624 () Bool)

(declare-fun res!234952 () Bool)

(assert (=> b!406624 (=> (not res!234952) (not e!244311))))

(declare-fun arrayContainsKey!0 (array!24508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406624 (= res!234952 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406625 () Bool)

(declare-fun res!234949 () Bool)

(assert (=> b!406625 (=> (not res!234949) (not e!244311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406625 (= res!234949 (validKeyInArray!0 k0!794))))

(declare-fun b!406626 () Bool)

(declare-fun tp_is_empty!10315 () Bool)

(assert (=> b!406626 (= e!244308 tp_is_empty!10315)))

(declare-fun mapIsEmpty!17094 () Bool)

(assert (=> mapIsEmpty!17094 mapRes!17094))

(declare-fun b!406627 () Bool)

(assert (=> b!406627 (= e!244310 tp_is_empty!10315)))

(assert (= (and start!38882 res!234953) b!406623))

(assert (= (and b!406623 res!234946) b!406620))

(assert (= (and b!406620 res!234950) b!406616))

(assert (= (and b!406616 res!234947) b!406621))

(assert (= (and b!406621 res!234954) b!406622))

(assert (= (and b!406622 res!234948) b!406625))

(assert (= (and b!406625 res!234949) b!406619))

(assert (= (and b!406619 res!234951) b!406624))

(assert (= (and b!406624 res!234952) b!406618))

(assert (= (and b!406618 res!234945) b!406615))

(assert (= (and b!406617 condMapEmpty!17094) mapIsEmpty!17094))

(assert (= (and b!406617 (not condMapEmpty!17094)) mapNonEmpty!17094))

(get-info :version)

(assert (= (and mapNonEmpty!17094 ((_ is ValueCellFull!4814) mapValue!17094)) b!406626))

(assert (= (and b!406617 ((_ is ValueCellFull!4814) mapDefault!17094)) b!406627))

(assert (= start!38882 b!406617))

(declare-fun m!398877 () Bool)

(assert (=> b!406618 m!398877))

(declare-fun m!398879 () Bool)

(assert (=> b!406618 m!398879))

(declare-fun m!398881 () Bool)

(assert (=> mapNonEmpty!17094 m!398881))

(declare-fun m!398883 () Bool)

(assert (=> b!406625 m!398883))

(declare-fun m!398885 () Bool)

(assert (=> b!406621 m!398885))

(declare-fun m!398887 () Bool)

(assert (=> b!406615 m!398887))

(declare-fun m!398889 () Bool)

(assert (=> b!406616 m!398889))

(declare-fun m!398891 () Bool)

(assert (=> b!406619 m!398891))

(declare-fun m!398893 () Bool)

(assert (=> b!406623 m!398893))

(declare-fun m!398895 () Bool)

(assert (=> b!406624 m!398895))

(declare-fun m!398897 () Bool)

(assert (=> start!38882 m!398897))

(declare-fun m!398899 () Bool)

(assert (=> start!38882 m!398899))

(check-sat (not b!406625) (not b!406616) (not b!406618) (not b!406621) (not start!38882) (not mapNonEmpty!17094) (not b!406623) (not b!406624) tp_is_empty!10315 (not b!406615))
(check-sat)
