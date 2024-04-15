; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38888 () Bool)

(assert start!38888)

(declare-fun res!234915 () Bool)

(declare-fun e!244221 () Bool)

(assert (=> start!38888 (=> (not res!234915) (not e!244221))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24515 0))(
  ( (array!24516 (arr!11707 (Array (_ BitVec 32) (_ BitVec 64))) (size!12060 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24515)

(assert (=> start!38888 (= res!234915 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12060 _keys!709))))))

(assert (=> start!38888 e!244221))

(assert (=> start!38888 true))

(declare-datatypes ((V!14867 0))(
  ( (V!14868 (val!5205 Int)) )
))
(declare-datatypes ((ValueCell!4817 0))(
  ( (ValueCellFull!4817 (v!7446 V!14867)) (EmptyCell!4817) )
))
(declare-datatypes ((array!24517 0))(
  ( (array!24518 (arr!11708 (Array (_ BitVec 32) ValueCell!4817)) (size!12061 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24517)

(declare-fun e!244220 () Bool)

(declare-fun array_inv!8586 (array!24517) Bool)

(assert (=> start!38888 (and (array_inv!8586 _values!549) e!244220)))

(declare-fun array_inv!8587 (array!24515) Bool)

(assert (=> start!38888 (array_inv!8587 _keys!709)))

(declare-fun b!406510 () Bool)

(declare-fun res!234913 () Bool)

(assert (=> b!406510 (=> (not res!234913) (not e!244221))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406510 (= res!234913 (validMask!0 mask!1025))))

(declare-fun b!406511 () Bool)

(declare-fun res!234912 () Bool)

(assert (=> b!406511 (=> (not res!234912) (not e!244221))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406511 (= res!234912 (validKeyInArray!0 k0!794))))

(declare-fun b!406512 () Bool)

(declare-fun e!244224 () Bool)

(assert (=> b!406512 (= e!244221 e!244224)))

(declare-fun res!234909 () Bool)

(assert (=> b!406512 (=> (not res!234909) (not e!244224))))

(declare-fun lt!188309 () array!24515)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24515 (_ BitVec 32)) Bool)

(assert (=> b!406512 (= res!234909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188309 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406512 (= lt!188309 (array!24516 (store (arr!11707 _keys!709) i!563 k0!794) (size!12060 _keys!709)))))

(declare-fun b!406513 () Bool)

(declare-fun e!244223 () Bool)

(declare-fun tp_is_empty!10321 () Bool)

(assert (=> b!406513 (= e!244223 tp_is_empty!10321)))

(declare-fun mapIsEmpty!17103 () Bool)

(declare-fun mapRes!17103 () Bool)

(assert (=> mapIsEmpty!17103 mapRes!17103))

(declare-fun mapNonEmpty!17103 () Bool)

(declare-fun tp!33222 () Bool)

(assert (=> mapNonEmpty!17103 (= mapRes!17103 (and tp!33222 e!244223))))

(declare-fun mapKey!17103 () (_ BitVec 32))

(declare-fun mapRest!17103 () (Array (_ BitVec 32) ValueCell!4817))

(declare-fun mapValue!17103 () ValueCell!4817)

(assert (=> mapNonEmpty!17103 (= (arr!11708 _values!549) (store mapRest!17103 mapKey!17103 mapValue!17103))))

(declare-fun b!406514 () Bool)

(declare-fun res!234911 () Bool)

(assert (=> b!406514 (=> (not res!234911) (not e!244221))))

(declare-fun arrayContainsKey!0 (array!24515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406514 (= res!234911 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406515 () Bool)

(declare-fun res!234917 () Bool)

(assert (=> b!406515 (=> (not res!234917) (not e!244221))))

(declare-datatypes ((List!6774 0))(
  ( (Nil!6771) (Cons!6770 (h!7626 (_ BitVec 64)) (t!11939 List!6774)) )
))
(declare-fun arrayNoDuplicates!0 (array!24515 (_ BitVec 32) List!6774) Bool)

(assert (=> b!406515 (= res!234917 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6771))))

(declare-fun b!406516 () Bool)

(declare-fun res!234916 () Bool)

(assert (=> b!406516 (=> (not res!234916) (not e!244221))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406516 (= res!234916 (and (= (size!12061 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12060 _keys!709) (size!12061 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406517 () Bool)

(declare-fun res!234918 () Bool)

(assert (=> b!406517 (=> (not res!234918) (not e!244221))))

(assert (=> b!406517 (= res!234918 (or (= (select (arr!11707 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11707 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406518 () Bool)

(declare-fun e!244222 () Bool)

(assert (=> b!406518 (= e!244222 tp_is_empty!10321)))

(declare-fun b!406519 () Bool)

(declare-fun res!234910 () Bool)

(assert (=> b!406519 (=> (not res!234910) (not e!244221))))

(assert (=> b!406519 (= res!234910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406520 () Bool)

(assert (=> b!406520 (= e!244224 false)))

(declare-fun lt!188308 () Bool)

(assert (=> b!406520 (= lt!188308 (arrayNoDuplicates!0 lt!188309 #b00000000000000000000000000000000 Nil!6771))))

(declare-fun b!406521 () Bool)

(assert (=> b!406521 (= e!244220 (and e!244222 mapRes!17103))))

(declare-fun condMapEmpty!17103 () Bool)

(declare-fun mapDefault!17103 () ValueCell!4817)

(assert (=> b!406521 (= condMapEmpty!17103 (= (arr!11708 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4817)) mapDefault!17103)))))

(declare-fun b!406522 () Bool)

(declare-fun res!234914 () Bool)

(assert (=> b!406522 (=> (not res!234914) (not e!244221))))

(assert (=> b!406522 (= res!234914 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12060 _keys!709))))))

(assert (= (and start!38888 res!234915) b!406510))

(assert (= (and b!406510 res!234913) b!406516))

(assert (= (and b!406516 res!234916) b!406519))

(assert (= (and b!406519 res!234910) b!406515))

(assert (= (and b!406515 res!234917) b!406522))

(assert (= (and b!406522 res!234914) b!406511))

(assert (= (and b!406511 res!234912) b!406517))

(assert (= (and b!406517 res!234918) b!406514))

(assert (= (and b!406514 res!234911) b!406512))

(assert (= (and b!406512 res!234909) b!406520))

(assert (= (and b!406521 condMapEmpty!17103) mapIsEmpty!17103))

(assert (= (and b!406521 (not condMapEmpty!17103)) mapNonEmpty!17103))

(get-info :version)

(assert (= (and mapNonEmpty!17103 ((_ is ValueCellFull!4817) mapValue!17103)) b!406513))

(assert (= (and b!406521 ((_ is ValueCellFull!4817) mapDefault!17103)) b!406518))

(assert (= start!38888 b!406521))

(declare-fun m!397995 () Bool)

(assert (=> start!38888 m!397995))

(declare-fun m!397997 () Bool)

(assert (=> start!38888 m!397997))

(declare-fun m!397999 () Bool)

(assert (=> b!406520 m!397999))

(declare-fun m!398001 () Bool)

(assert (=> b!406515 m!398001))

(declare-fun m!398003 () Bool)

(assert (=> b!406517 m!398003))

(declare-fun m!398005 () Bool)

(assert (=> b!406514 m!398005))

(declare-fun m!398007 () Bool)

(assert (=> b!406511 m!398007))

(declare-fun m!398009 () Bool)

(assert (=> b!406510 m!398009))

(declare-fun m!398011 () Bool)

(assert (=> mapNonEmpty!17103 m!398011))

(declare-fun m!398013 () Bool)

(assert (=> b!406519 m!398013))

(declare-fun m!398015 () Bool)

(assert (=> b!406512 m!398015))

(declare-fun m!398017 () Bool)

(assert (=> b!406512 m!398017))

(check-sat (not b!406519) (not b!406514) (not b!406512) tp_is_empty!10321 (not b!406520) (not b!406511) (not b!406510) (not mapNonEmpty!17103) (not start!38888) (not b!406515))
(check-sat)
