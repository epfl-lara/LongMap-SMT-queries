; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38984 () Bool)

(assert start!38984)

(declare-fun mapIsEmpty!17247 () Bool)

(declare-fun mapRes!17247 () Bool)

(assert (=> mapIsEmpty!17247 mapRes!17247))

(declare-fun b!408604 () Bool)

(declare-fun e!245230 () Bool)

(declare-fun e!245229 () Bool)

(assert (=> b!408604 (= e!245230 e!245229)))

(declare-fun res!236477 () Bool)

(assert (=> b!408604 (=> (not res!236477) (not e!245229))))

(declare-datatypes ((array!24708 0))(
  ( (array!24709 (arr!11803 (Array (_ BitVec 32) (_ BitVec 64))) (size!12155 (_ BitVec 32))) )
))
(declare-fun lt!188849 () array!24708)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24708 (_ BitVec 32)) Bool)

(assert (=> b!408604 (= res!236477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188849 mask!1025))))

(declare-fun _keys!709 () array!24708)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408604 (= lt!188849 (array!24709 (store (arr!11803 _keys!709) i!563 k0!794) (size!12155 _keys!709)))))

(declare-fun b!408605 () Bool)

(declare-fun res!236479 () Bool)

(assert (=> b!408605 (=> (not res!236479) (not e!245230))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14995 0))(
  ( (V!14996 (val!5253 Int)) )
))
(declare-datatypes ((ValueCell!4865 0))(
  ( (ValueCellFull!4865 (v!7501 V!14995)) (EmptyCell!4865) )
))
(declare-datatypes ((array!24710 0))(
  ( (array!24711 (arr!11804 (Array (_ BitVec 32) ValueCell!4865)) (size!12156 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24710)

(assert (=> b!408605 (= res!236479 (and (= (size!12156 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12155 _keys!709) (size!12156 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!236483 () Bool)

(assert (=> start!38984 (=> (not res!236483) (not e!245230))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38984 (= res!236483 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12155 _keys!709))))))

(assert (=> start!38984 e!245230))

(assert (=> start!38984 true))

(declare-fun e!245226 () Bool)

(declare-fun array_inv!8700 (array!24710) Bool)

(assert (=> start!38984 (and (array_inv!8700 _values!549) e!245226)))

(declare-fun array_inv!8701 (array!24708) Bool)

(assert (=> start!38984 (array_inv!8701 _keys!709)))

(declare-fun b!408606 () Bool)

(declare-fun res!236478 () Bool)

(assert (=> b!408606 (=> (not res!236478) (not e!245230))))

(declare-fun arrayContainsKey!0 (array!24708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408606 (= res!236478 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408607 () Bool)

(declare-fun res!236481 () Bool)

(assert (=> b!408607 (=> (not res!236481) (not e!245230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408607 (= res!236481 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!17247 () Bool)

(declare-fun tp!33366 () Bool)

(declare-fun e!245228 () Bool)

(assert (=> mapNonEmpty!17247 (= mapRes!17247 (and tp!33366 e!245228))))

(declare-fun mapRest!17247 () (Array (_ BitVec 32) ValueCell!4865))

(declare-fun mapValue!17247 () ValueCell!4865)

(declare-fun mapKey!17247 () (_ BitVec 32))

(assert (=> mapNonEmpty!17247 (= (arr!11804 _values!549) (store mapRest!17247 mapKey!17247 mapValue!17247))))

(declare-fun b!408608 () Bool)

(assert (=> b!408608 (= e!245229 false)))

(declare-fun lt!188850 () Bool)

(declare-datatypes ((List!6712 0))(
  ( (Nil!6709) (Cons!6708 (h!7564 (_ BitVec 64)) (t!11878 List!6712)) )
))
(declare-fun arrayNoDuplicates!0 (array!24708 (_ BitVec 32) List!6712) Bool)

(assert (=> b!408608 (= lt!188850 (arrayNoDuplicates!0 lt!188849 #b00000000000000000000000000000000 Nil!6709))))

(declare-fun b!408609 () Bool)

(declare-fun e!245225 () Bool)

(declare-fun tp_is_empty!10417 () Bool)

(assert (=> b!408609 (= e!245225 tp_is_empty!10417)))

(declare-fun b!408610 () Bool)

(assert (=> b!408610 (= e!245226 (and e!245225 mapRes!17247))))

(declare-fun condMapEmpty!17247 () Bool)

(declare-fun mapDefault!17247 () ValueCell!4865)

(assert (=> b!408610 (= condMapEmpty!17247 (= (arr!11804 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4865)) mapDefault!17247)))))

(declare-fun b!408611 () Bool)

(declare-fun res!236475 () Bool)

(assert (=> b!408611 (=> (not res!236475) (not e!245230))))

(assert (=> b!408611 (= res!236475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408612 () Bool)

(assert (=> b!408612 (= e!245228 tp_is_empty!10417)))

(declare-fun b!408613 () Bool)

(declare-fun res!236482 () Bool)

(assert (=> b!408613 (=> (not res!236482) (not e!245230))))

(assert (=> b!408613 (= res!236482 (or (= (select (arr!11803 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11803 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408614 () Bool)

(declare-fun res!236480 () Bool)

(assert (=> b!408614 (=> (not res!236480) (not e!245230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408614 (= res!236480 (validMask!0 mask!1025))))

(declare-fun b!408615 () Bool)

(declare-fun res!236484 () Bool)

(assert (=> b!408615 (=> (not res!236484) (not e!245230))))

(assert (=> b!408615 (= res!236484 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6709))))

(declare-fun b!408616 () Bool)

(declare-fun res!236476 () Bool)

(assert (=> b!408616 (=> (not res!236476) (not e!245230))))

(assert (=> b!408616 (= res!236476 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12155 _keys!709))))))

(assert (= (and start!38984 res!236483) b!408614))

(assert (= (and b!408614 res!236480) b!408605))

(assert (= (and b!408605 res!236479) b!408611))

(assert (= (and b!408611 res!236475) b!408615))

(assert (= (and b!408615 res!236484) b!408616))

(assert (= (and b!408616 res!236476) b!408607))

(assert (= (and b!408607 res!236481) b!408613))

(assert (= (and b!408613 res!236482) b!408606))

(assert (= (and b!408606 res!236478) b!408604))

(assert (= (and b!408604 res!236477) b!408608))

(assert (= (and b!408610 condMapEmpty!17247) mapIsEmpty!17247))

(assert (= (and b!408610 (not condMapEmpty!17247)) mapNonEmpty!17247))

(get-info :version)

(assert (= (and mapNonEmpty!17247 ((_ is ValueCellFull!4865) mapValue!17247)) b!408612))

(assert (= (and b!408610 ((_ is ValueCellFull!4865) mapDefault!17247)) b!408609))

(assert (= start!38984 b!408610))

(declare-fun m!400101 () Bool)

(assert (=> start!38984 m!400101))

(declare-fun m!400103 () Bool)

(assert (=> start!38984 m!400103))

(declare-fun m!400105 () Bool)

(assert (=> b!408604 m!400105))

(declare-fun m!400107 () Bool)

(assert (=> b!408604 m!400107))

(declare-fun m!400109 () Bool)

(assert (=> b!408614 m!400109))

(declare-fun m!400111 () Bool)

(assert (=> b!408615 m!400111))

(declare-fun m!400113 () Bool)

(assert (=> b!408608 m!400113))

(declare-fun m!400115 () Bool)

(assert (=> b!408606 m!400115))

(declare-fun m!400117 () Bool)

(assert (=> mapNonEmpty!17247 m!400117))

(declare-fun m!400119 () Bool)

(assert (=> b!408607 m!400119))

(declare-fun m!400121 () Bool)

(assert (=> b!408613 m!400121))

(declare-fun m!400123 () Bool)

(assert (=> b!408611 m!400123))

(check-sat (not mapNonEmpty!17247) (not b!408608) (not b!408614) tp_is_empty!10417 (not b!408606) (not b!408611) (not start!38984) (not b!408604) (not b!408607) (not b!408615))
(check-sat)
