; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38820 () Bool)

(assert start!38820)

(declare-fun b!405182 () Bool)

(declare-fun res!233809 () Bool)

(declare-fun e!243658 () Bool)

(assert (=> b!405182 (=> (not res!233809) (not e!243658))))

(declare-datatypes ((array!24371 0))(
  ( (array!24372 (arr!11635 (Array (_ BitVec 32) (_ BitVec 64))) (size!11987 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24371)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405182 (= res!233809 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16980 () Bool)

(declare-fun mapRes!16980 () Bool)

(declare-fun tp!33099 () Bool)

(declare-fun e!243655 () Bool)

(assert (=> mapNonEmpty!16980 (= mapRes!16980 (and tp!33099 e!243655))))

(declare-datatypes ((V!14757 0))(
  ( (V!14758 (val!5164 Int)) )
))
(declare-datatypes ((ValueCell!4776 0))(
  ( (ValueCellFull!4776 (v!7411 V!14757)) (EmptyCell!4776) )
))
(declare-fun mapValue!16980 () ValueCell!4776)

(declare-fun mapKey!16980 () (_ BitVec 32))

(declare-datatypes ((array!24373 0))(
  ( (array!24374 (arr!11636 (Array (_ BitVec 32) ValueCell!4776)) (size!11988 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24373)

(declare-fun mapRest!16980 () (Array (_ BitVec 32) ValueCell!4776))

(assert (=> mapNonEmpty!16980 (= (arr!11636 _values!549) (store mapRest!16980 mapKey!16980 mapValue!16980))))

(declare-fun mapIsEmpty!16980 () Bool)

(assert (=> mapIsEmpty!16980 mapRes!16980))

(declare-fun b!405183 () Bool)

(declare-fun e!243659 () Bool)

(declare-fun tp_is_empty!10239 () Bool)

(assert (=> b!405183 (= e!243659 tp_is_empty!10239)))

(declare-fun b!405184 () Bool)

(declare-fun res!233817 () Bool)

(assert (=> b!405184 (=> (not res!233817) (not e!243658))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!405184 (= res!233817 (and (= (size!11988 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11987 _keys!709) (size!11988 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405185 () Bool)

(declare-fun e!243657 () Bool)

(assert (=> b!405185 (= e!243658 e!243657)))

(declare-fun res!233813 () Bool)

(assert (=> b!405185 (=> (not res!233813) (not e!243657))))

(declare-fun lt!188296 () array!24371)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24371 (_ BitVec 32)) Bool)

(assert (=> b!405185 (= res!233813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188296 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405185 (= lt!188296 (array!24372 (store (arr!11635 _keys!709) i!563 k0!794) (size!11987 _keys!709)))))

(declare-fun b!405186 () Bool)

(declare-fun res!233810 () Bool)

(assert (=> b!405186 (=> (not res!233810) (not e!243658))))

(assert (=> b!405186 (= res!233810 (or (= (select (arr!11635 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11635 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405187 () Bool)

(declare-fun res!233816 () Bool)

(assert (=> b!405187 (=> (not res!233816) (not e!243658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405187 (= res!233816 (validKeyInArray!0 k0!794))))

(declare-fun res!233815 () Bool)

(assert (=> start!38820 (=> (not res!233815) (not e!243658))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38820 (= res!233815 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11987 _keys!709))))))

(assert (=> start!38820 e!243658))

(assert (=> start!38820 true))

(declare-fun e!243660 () Bool)

(declare-fun array_inv!8504 (array!24373) Bool)

(assert (=> start!38820 (and (array_inv!8504 _values!549) e!243660)))

(declare-fun array_inv!8505 (array!24371) Bool)

(assert (=> start!38820 (array_inv!8505 _keys!709)))

(declare-fun b!405188 () Bool)

(assert (=> b!405188 (= e!243660 (and e!243659 mapRes!16980))))

(declare-fun condMapEmpty!16980 () Bool)

(declare-fun mapDefault!16980 () ValueCell!4776)

(assert (=> b!405188 (= condMapEmpty!16980 (= (arr!11636 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4776)) mapDefault!16980)))))

(declare-fun b!405189 () Bool)

(declare-fun res!233811 () Bool)

(assert (=> b!405189 (=> (not res!233811) (not e!243658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405189 (= res!233811 (validMask!0 mask!1025))))

(declare-fun b!405190 () Bool)

(declare-fun res!233808 () Bool)

(assert (=> b!405190 (=> (not res!233808) (not e!243658))))

(assert (=> b!405190 (= res!233808 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11987 _keys!709))))))

(declare-fun b!405191 () Bool)

(declare-fun res!233814 () Bool)

(assert (=> b!405191 (=> (not res!233814) (not e!243658))))

(assert (=> b!405191 (= res!233814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405192 () Bool)

(assert (=> b!405192 (= e!243655 tp_is_empty!10239)))

(declare-fun b!405193 () Bool)

(assert (=> b!405193 (= e!243657 false)))

(declare-fun lt!188297 () Bool)

(declare-datatypes ((List!6768 0))(
  ( (Nil!6765) (Cons!6764 (h!7620 (_ BitVec 64)) (t!11942 List!6768)) )
))
(declare-fun arrayNoDuplicates!0 (array!24371 (_ BitVec 32) List!6768) Bool)

(assert (=> b!405193 (= lt!188297 (arrayNoDuplicates!0 lt!188296 #b00000000000000000000000000000000 Nil!6765))))

(declare-fun b!405194 () Bool)

(declare-fun res!233812 () Bool)

(assert (=> b!405194 (=> (not res!233812) (not e!243658))))

(assert (=> b!405194 (= res!233812 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6765))))

(assert (= (and start!38820 res!233815) b!405189))

(assert (= (and b!405189 res!233811) b!405184))

(assert (= (and b!405184 res!233817) b!405191))

(assert (= (and b!405191 res!233814) b!405194))

(assert (= (and b!405194 res!233812) b!405190))

(assert (= (and b!405190 res!233808) b!405187))

(assert (= (and b!405187 res!233816) b!405186))

(assert (= (and b!405186 res!233810) b!405182))

(assert (= (and b!405182 res!233809) b!405185))

(assert (= (and b!405185 res!233813) b!405193))

(assert (= (and b!405188 condMapEmpty!16980) mapIsEmpty!16980))

(assert (= (and b!405188 (not condMapEmpty!16980)) mapNonEmpty!16980))

(get-info :version)

(assert (= (and mapNonEmpty!16980 ((_ is ValueCellFull!4776) mapValue!16980)) b!405192))

(assert (= (and b!405188 ((_ is ValueCellFull!4776) mapDefault!16980)) b!405183))

(assert (= start!38820 b!405188))

(declare-fun m!397735 () Bool)

(assert (=> b!405182 m!397735))

(declare-fun m!397737 () Bool)

(assert (=> b!405186 m!397737))

(declare-fun m!397739 () Bool)

(assert (=> b!405191 m!397739))

(declare-fun m!397741 () Bool)

(assert (=> start!38820 m!397741))

(declare-fun m!397743 () Bool)

(assert (=> start!38820 m!397743))

(declare-fun m!397745 () Bool)

(assert (=> b!405187 m!397745))

(declare-fun m!397747 () Bool)

(assert (=> b!405194 m!397747))

(declare-fun m!397749 () Bool)

(assert (=> mapNonEmpty!16980 m!397749))

(declare-fun m!397751 () Bool)

(assert (=> b!405193 m!397751))

(declare-fun m!397753 () Bool)

(assert (=> b!405189 m!397753))

(declare-fun m!397755 () Bool)

(assert (=> b!405185 m!397755))

(declare-fun m!397757 () Bool)

(assert (=> b!405185 m!397757))

(check-sat (not b!405189) (not b!405187) (not b!405193) tp_is_empty!10239 (not start!38820) (not mapNonEmpty!16980) (not b!405191) (not b!405185) (not b!405182) (not b!405194))
(check-sat)
