; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38960 () Bool)

(assert start!38960)

(declare-fun b!408136 () Bool)

(declare-fun res!236121 () Bool)

(declare-fun e!245013 () Bool)

(assert (=> b!408136 (=> (not res!236121) (not e!245013))))

(declare-datatypes ((array!24662 0))(
  ( (array!24663 (arr!11780 (Array (_ BitVec 32) (_ BitVec 64))) (size!12132 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24662)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24662 (_ BitVec 32)) Bool)

(assert (=> b!408136 (= res!236121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408137 () Bool)

(declare-fun res!236123 () Bool)

(assert (=> b!408137 (=> (not res!236123) (not e!245013))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408137 (= res!236123 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12132 _keys!709))))))

(declare-fun b!408138 () Bool)

(declare-fun res!236115 () Bool)

(assert (=> b!408138 (=> (not res!236115) (not e!245013))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14963 0))(
  ( (V!14964 (val!5241 Int)) )
))
(declare-datatypes ((ValueCell!4853 0))(
  ( (ValueCellFull!4853 (v!7489 V!14963)) (EmptyCell!4853) )
))
(declare-datatypes ((array!24664 0))(
  ( (array!24665 (arr!11781 (Array (_ BitVec 32) ValueCell!4853)) (size!12133 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24664)

(assert (=> b!408138 (= res!236115 (and (= (size!12133 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12132 _keys!709) (size!12133 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!236117 () Bool)

(assert (=> start!38960 (=> (not res!236117) (not e!245013))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38960 (= res!236117 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12132 _keys!709))))))

(assert (=> start!38960 e!245013))

(assert (=> start!38960 true))

(declare-fun e!245009 () Bool)

(declare-fun array_inv!8684 (array!24664) Bool)

(assert (=> start!38960 (and (array_inv!8684 _values!549) e!245009)))

(declare-fun array_inv!8685 (array!24662) Bool)

(assert (=> start!38960 (array_inv!8685 _keys!709)))

(declare-fun mapIsEmpty!17211 () Bool)

(declare-fun mapRes!17211 () Bool)

(assert (=> mapIsEmpty!17211 mapRes!17211))

(declare-fun b!408139 () Bool)

(declare-fun e!245011 () Bool)

(declare-fun tp_is_empty!10393 () Bool)

(assert (=> b!408139 (= e!245011 tp_is_empty!10393)))

(declare-fun b!408140 () Bool)

(declare-fun e!245010 () Bool)

(assert (=> b!408140 (= e!245010 tp_is_empty!10393)))

(declare-fun b!408141 () Bool)

(declare-fun e!245012 () Bool)

(assert (=> b!408141 (= e!245013 e!245012)))

(declare-fun res!236119 () Bool)

(assert (=> b!408141 (=> (not res!236119) (not e!245012))))

(declare-fun lt!188777 () array!24662)

(assert (=> b!408141 (= res!236119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188777 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!408141 (= lt!188777 (array!24663 (store (arr!11780 _keys!709) i!563 k0!794) (size!12132 _keys!709)))))

(declare-fun b!408142 () Bool)

(declare-fun res!236118 () Bool)

(assert (=> b!408142 (=> (not res!236118) (not e!245013))))

(declare-datatypes ((List!6706 0))(
  ( (Nil!6703) (Cons!6702 (h!7558 (_ BitVec 64)) (t!11872 List!6706)) )
))
(declare-fun arrayNoDuplicates!0 (array!24662 (_ BitVec 32) List!6706) Bool)

(assert (=> b!408142 (= res!236118 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6703))))

(declare-fun b!408143 () Bool)

(declare-fun res!236124 () Bool)

(assert (=> b!408143 (=> (not res!236124) (not e!245013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408143 (= res!236124 (validKeyInArray!0 k0!794))))

(declare-fun b!408144 () Bool)

(assert (=> b!408144 (= e!245012 false)))

(declare-fun lt!188778 () Bool)

(assert (=> b!408144 (= lt!188778 (arrayNoDuplicates!0 lt!188777 #b00000000000000000000000000000000 Nil!6703))))

(declare-fun b!408145 () Bool)

(declare-fun res!236116 () Bool)

(assert (=> b!408145 (=> (not res!236116) (not e!245013))))

(declare-fun arrayContainsKey!0 (array!24662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408145 (= res!236116 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408146 () Bool)

(declare-fun res!236122 () Bool)

(assert (=> b!408146 (=> (not res!236122) (not e!245013))))

(assert (=> b!408146 (= res!236122 (or (= (select (arr!11780 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11780 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17211 () Bool)

(declare-fun tp!33330 () Bool)

(assert (=> mapNonEmpty!17211 (= mapRes!17211 (and tp!33330 e!245010))))

(declare-fun mapRest!17211 () (Array (_ BitVec 32) ValueCell!4853))

(declare-fun mapKey!17211 () (_ BitVec 32))

(declare-fun mapValue!17211 () ValueCell!4853)

(assert (=> mapNonEmpty!17211 (= (arr!11781 _values!549) (store mapRest!17211 mapKey!17211 mapValue!17211))))

(declare-fun b!408147 () Bool)

(assert (=> b!408147 (= e!245009 (and e!245011 mapRes!17211))))

(declare-fun condMapEmpty!17211 () Bool)

(declare-fun mapDefault!17211 () ValueCell!4853)

(assert (=> b!408147 (= condMapEmpty!17211 (= (arr!11781 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4853)) mapDefault!17211)))))

(declare-fun b!408148 () Bool)

(declare-fun res!236120 () Bool)

(assert (=> b!408148 (=> (not res!236120) (not e!245013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408148 (= res!236120 (validMask!0 mask!1025))))

(assert (= (and start!38960 res!236117) b!408148))

(assert (= (and b!408148 res!236120) b!408138))

(assert (= (and b!408138 res!236115) b!408136))

(assert (= (and b!408136 res!236121) b!408142))

(assert (= (and b!408142 res!236118) b!408137))

(assert (= (and b!408137 res!236123) b!408143))

(assert (= (and b!408143 res!236124) b!408146))

(assert (= (and b!408146 res!236122) b!408145))

(assert (= (and b!408145 res!236116) b!408141))

(assert (= (and b!408141 res!236119) b!408144))

(assert (= (and b!408147 condMapEmpty!17211) mapIsEmpty!17211))

(assert (= (and b!408147 (not condMapEmpty!17211)) mapNonEmpty!17211))

(get-info :version)

(assert (= (and mapNonEmpty!17211 ((_ is ValueCellFull!4853) mapValue!17211)) b!408140))

(assert (= (and b!408147 ((_ is ValueCellFull!4853) mapDefault!17211)) b!408139))

(assert (= start!38960 b!408147))

(declare-fun m!399813 () Bool)

(assert (=> start!38960 m!399813))

(declare-fun m!399815 () Bool)

(assert (=> start!38960 m!399815))

(declare-fun m!399817 () Bool)

(assert (=> b!408144 m!399817))

(declare-fun m!399819 () Bool)

(assert (=> mapNonEmpty!17211 m!399819))

(declare-fun m!399821 () Bool)

(assert (=> b!408146 m!399821))

(declare-fun m!399823 () Bool)

(assert (=> b!408145 m!399823))

(declare-fun m!399825 () Bool)

(assert (=> b!408148 m!399825))

(declare-fun m!399827 () Bool)

(assert (=> b!408142 m!399827))

(declare-fun m!399829 () Bool)

(assert (=> b!408136 m!399829))

(declare-fun m!399831 () Bool)

(assert (=> b!408143 m!399831))

(declare-fun m!399833 () Bool)

(assert (=> b!408141 m!399833))

(declare-fun m!399835 () Bool)

(assert (=> b!408141 m!399835))

(check-sat (not b!408148) (not b!408142) (not b!408141) (not mapNonEmpty!17211) (not b!408145) (not b!408144) (not start!38960) (not b!408143) (not b!408136) tp_is_empty!10393)
(check-sat)
