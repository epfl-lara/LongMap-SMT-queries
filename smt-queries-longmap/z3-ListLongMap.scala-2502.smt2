; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38816 () Bool)

(assert start!38816)

(declare-fun b!405106 () Bool)

(declare-fun res!233835 () Bool)

(declare-fun e!243576 () Bool)

(assert (=> b!405106 (=> (not res!233835) (not e!243576))))

(declare-datatypes ((array!24373 0))(
  ( (array!24374 (arr!11636 (Array (_ BitVec 32) (_ BitVec 64))) (size!11989 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24373)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24373 (_ BitVec 32)) Bool)

(assert (=> b!405106 (= res!233835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405107 () Bool)

(declare-fun res!233829 () Bool)

(assert (=> b!405107 (=> (not res!233829) (not e!243576))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14771 0))(
  ( (V!14772 (val!5169 Int)) )
))
(declare-datatypes ((ValueCell!4781 0))(
  ( (ValueCellFull!4781 (v!7410 V!14771)) (EmptyCell!4781) )
))
(declare-datatypes ((array!24375 0))(
  ( (array!24376 (arr!11637 (Array (_ BitVec 32) ValueCell!4781)) (size!11990 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24375)

(assert (=> b!405107 (= res!233829 (and (= (size!11990 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11989 _keys!709) (size!11990 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405108 () Bool)

(declare-fun res!233831 () Bool)

(assert (=> b!405108 (=> (not res!233831) (not e!243576))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405108 (= res!233831 (validKeyInArray!0 k0!794))))

(declare-fun b!405109 () Bool)

(declare-fun e!243573 () Bool)

(assert (=> b!405109 (= e!243576 e!243573)))

(declare-fun res!233833 () Bool)

(assert (=> b!405109 (=> (not res!233833) (not e!243573))))

(declare-fun lt!188092 () array!24373)

(assert (=> b!405109 (= res!233833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188092 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405109 (= lt!188092 (array!24374 (store (arr!11636 _keys!709) i!563 k0!794) (size!11989 _keys!709)))))

(declare-fun b!405111 () Bool)

(declare-fun e!243575 () Bool)

(declare-fun tp_is_empty!10249 () Bool)

(assert (=> b!405111 (= e!243575 tp_is_empty!10249)))

(declare-fun b!405112 () Bool)

(declare-fun res!233836 () Bool)

(assert (=> b!405112 (=> (not res!233836) (not e!243576))))

(declare-datatypes ((List!6743 0))(
  ( (Nil!6740) (Cons!6739 (h!7595 (_ BitVec 64)) (t!11908 List!6743)) )
))
(declare-fun arrayNoDuplicates!0 (array!24373 (_ BitVec 32) List!6743) Bool)

(assert (=> b!405112 (= res!233836 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6740))))

(declare-fun b!405113 () Bool)

(declare-fun e!243574 () Bool)

(declare-fun mapRes!16995 () Bool)

(assert (=> b!405113 (= e!243574 (and e!243575 mapRes!16995))))

(declare-fun condMapEmpty!16995 () Bool)

(declare-fun mapDefault!16995 () ValueCell!4781)

(assert (=> b!405113 (= condMapEmpty!16995 (= (arr!11637 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4781)) mapDefault!16995)))))

(declare-fun b!405114 () Bool)

(declare-fun res!233832 () Bool)

(assert (=> b!405114 (=> (not res!233832) (not e!243576))))

(assert (=> b!405114 (= res!233832 (or (= (select (arr!11636 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11636 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405115 () Bool)

(assert (=> b!405115 (= e!243573 false)))

(declare-fun lt!188093 () Bool)

(assert (=> b!405115 (= lt!188093 (arrayNoDuplicates!0 lt!188092 #b00000000000000000000000000000000 Nil!6740))))

(declare-fun res!233834 () Bool)

(assert (=> start!38816 (=> (not res!233834) (not e!243576))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38816 (= res!233834 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11989 _keys!709))))))

(assert (=> start!38816 e!243576))

(assert (=> start!38816 true))

(declare-fun array_inv!8538 (array!24375) Bool)

(assert (=> start!38816 (and (array_inv!8538 _values!549) e!243574)))

(declare-fun array_inv!8539 (array!24373) Bool)

(assert (=> start!38816 (array_inv!8539 _keys!709)))

(declare-fun b!405110 () Bool)

(declare-fun e!243571 () Bool)

(assert (=> b!405110 (= e!243571 tp_is_empty!10249)))

(declare-fun mapNonEmpty!16995 () Bool)

(declare-fun tp!33114 () Bool)

(assert (=> mapNonEmpty!16995 (= mapRes!16995 (and tp!33114 e!243571))))

(declare-fun mapKey!16995 () (_ BitVec 32))

(declare-fun mapValue!16995 () ValueCell!4781)

(declare-fun mapRest!16995 () (Array (_ BitVec 32) ValueCell!4781))

(assert (=> mapNonEmpty!16995 (= (arr!11637 _values!549) (store mapRest!16995 mapKey!16995 mapValue!16995))))

(declare-fun mapIsEmpty!16995 () Bool)

(assert (=> mapIsEmpty!16995 mapRes!16995))

(declare-fun b!405116 () Bool)

(declare-fun res!233838 () Bool)

(assert (=> b!405116 (=> (not res!233838) (not e!243576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405116 (= res!233838 (validMask!0 mask!1025))))

(declare-fun b!405117 () Bool)

(declare-fun res!233830 () Bool)

(assert (=> b!405117 (=> (not res!233830) (not e!243576))))

(declare-fun arrayContainsKey!0 (array!24373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405117 (= res!233830 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405118 () Bool)

(declare-fun res!233837 () Bool)

(assert (=> b!405118 (=> (not res!233837) (not e!243576))))

(assert (=> b!405118 (= res!233837 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11989 _keys!709))))))

(assert (= (and start!38816 res!233834) b!405116))

(assert (= (and b!405116 res!233838) b!405107))

(assert (= (and b!405107 res!233829) b!405106))

(assert (= (and b!405106 res!233835) b!405112))

(assert (= (and b!405112 res!233836) b!405118))

(assert (= (and b!405118 res!233837) b!405108))

(assert (= (and b!405108 res!233831) b!405114))

(assert (= (and b!405114 res!233832) b!405117))

(assert (= (and b!405117 res!233830) b!405109))

(assert (= (and b!405109 res!233833) b!405115))

(assert (= (and b!405113 condMapEmpty!16995) mapIsEmpty!16995))

(assert (= (and b!405113 (not condMapEmpty!16995)) mapNonEmpty!16995))

(get-info :version)

(assert (= (and mapNonEmpty!16995 ((_ is ValueCellFull!4781) mapValue!16995)) b!405110))

(assert (= (and b!405113 ((_ is ValueCellFull!4781) mapDefault!16995)) b!405111))

(assert (= start!38816 b!405113))

(declare-fun m!397131 () Bool)

(assert (=> b!405108 m!397131))

(declare-fun m!397133 () Bool)

(assert (=> b!405115 m!397133))

(declare-fun m!397135 () Bool)

(assert (=> b!405117 m!397135))

(declare-fun m!397137 () Bool)

(assert (=> b!405116 m!397137))

(declare-fun m!397139 () Bool)

(assert (=> b!405106 m!397139))

(declare-fun m!397141 () Bool)

(assert (=> start!38816 m!397141))

(declare-fun m!397143 () Bool)

(assert (=> start!38816 m!397143))

(declare-fun m!397145 () Bool)

(assert (=> b!405109 m!397145))

(declare-fun m!397147 () Bool)

(assert (=> b!405109 m!397147))

(declare-fun m!397149 () Bool)

(assert (=> mapNonEmpty!16995 m!397149))

(declare-fun m!397151 () Bool)

(assert (=> b!405112 m!397151))

(declare-fun m!397153 () Bool)

(assert (=> b!405114 m!397153))

(check-sat (not b!405112) (not mapNonEmpty!16995) (not b!405115) (not b!405108) (not b!405116) (not start!38816) (not b!405109) (not b!405106) (not b!405117) tp_is_empty!10249)
(check-sat)
