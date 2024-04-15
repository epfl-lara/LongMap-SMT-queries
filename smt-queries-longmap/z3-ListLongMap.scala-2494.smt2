; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38768 () Bool)

(assert start!38768)

(declare-fun res!233110 () Bool)

(declare-fun e!243144 () Bool)

(assert (=> start!38768 (=> (not res!233110) (not e!243144))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24283 0))(
  ( (array!24284 (arr!11591 (Array (_ BitVec 32) (_ BitVec 64))) (size!11944 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24283)

(assert (=> start!38768 (= res!233110 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11944 _keys!709))))))

(assert (=> start!38768 e!243144))

(assert (=> start!38768 true))

(declare-datatypes ((V!14707 0))(
  ( (V!14708 (val!5145 Int)) )
))
(declare-datatypes ((ValueCell!4757 0))(
  ( (ValueCellFull!4757 (v!7386 V!14707)) (EmptyCell!4757) )
))
(declare-datatypes ((array!24285 0))(
  ( (array!24286 (arr!11592 (Array (_ BitVec 32) ValueCell!4757)) (size!11945 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24285)

(declare-fun e!243140 () Bool)

(declare-fun array_inv!8508 (array!24285) Bool)

(assert (=> start!38768 (and (array_inv!8508 _values!549) e!243140)))

(declare-fun array_inv!8509 (array!24283) Bool)

(assert (=> start!38768 (array_inv!8509 _keys!709)))

(declare-fun b!404170 () Bool)

(declare-fun e!243139 () Bool)

(assert (=> b!404170 (= e!243144 e!243139)))

(declare-fun res!233109 () Bool)

(assert (=> b!404170 (=> (not res!233109) (not e!243139))))

(declare-fun lt!187949 () array!24283)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24283 (_ BitVec 32)) Bool)

(assert (=> b!404170 (= res!233109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187949 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404170 (= lt!187949 (array!24284 (store (arr!11591 _keys!709) i!563 k0!794) (size!11944 _keys!709)))))

(declare-fun b!404171 () Bool)

(assert (=> b!404171 (= e!243139 false)))

(declare-fun lt!187948 () Bool)

(declare-datatypes ((List!6728 0))(
  ( (Nil!6725) (Cons!6724 (h!7580 (_ BitVec 64)) (t!11893 List!6728)) )
))
(declare-fun arrayNoDuplicates!0 (array!24283 (_ BitVec 32) List!6728) Bool)

(assert (=> b!404171 (= lt!187948 (arrayNoDuplicates!0 lt!187949 #b00000000000000000000000000000000 Nil!6725))))

(declare-fun b!404172 () Bool)

(declare-fun res!233114 () Bool)

(assert (=> b!404172 (=> (not res!233114) (not e!243144))))

(declare-fun arrayContainsKey!0 (array!24283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404172 (= res!233114 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404173 () Bool)

(declare-fun res!233118 () Bool)

(assert (=> b!404173 (=> (not res!233118) (not e!243144))))

(assert (=> b!404173 (= res!233118 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6725))))

(declare-fun b!404174 () Bool)

(declare-fun e!243143 () Bool)

(declare-fun tp_is_empty!10201 () Bool)

(assert (=> b!404174 (= e!243143 tp_is_empty!10201)))

(declare-fun mapIsEmpty!16923 () Bool)

(declare-fun mapRes!16923 () Bool)

(assert (=> mapIsEmpty!16923 mapRes!16923))

(declare-fun b!404175 () Bool)

(declare-fun res!233115 () Bool)

(assert (=> b!404175 (=> (not res!233115) (not e!243144))))

(assert (=> b!404175 (= res!233115 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11944 _keys!709))))))

(declare-fun b!404176 () Bool)

(declare-fun res!233116 () Bool)

(assert (=> b!404176 (=> (not res!233116) (not e!243144))))

(assert (=> b!404176 (= res!233116 (or (= (select (arr!11591 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11591 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!404177 () Bool)

(declare-fun res!233112 () Bool)

(assert (=> b!404177 (=> (not res!233112) (not e!243144))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404177 (= res!233112 (and (= (size!11945 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11944 _keys!709) (size!11945 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404178 () Bool)

(declare-fun e!243141 () Bool)

(assert (=> b!404178 (= e!243141 tp_is_empty!10201)))

(declare-fun b!404179 () Bool)

(declare-fun res!233113 () Bool)

(assert (=> b!404179 (=> (not res!233113) (not e!243144))))

(assert (=> b!404179 (= res!233113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404180 () Bool)

(declare-fun res!233111 () Bool)

(assert (=> b!404180 (=> (not res!233111) (not e!243144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404180 (= res!233111 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16923 () Bool)

(declare-fun tp!33042 () Bool)

(assert (=> mapNonEmpty!16923 (= mapRes!16923 (and tp!33042 e!243141))))

(declare-fun mapValue!16923 () ValueCell!4757)

(declare-fun mapKey!16923 () (_ BitVec 32))

(declare-fun mapRest!16923 () (Array (_ BitVec 32) ValueCell!4757))

(assert (=> mapNonEmpty!16923 (= (arr!11592 _values!549) (store mapRest!16923 mapKey!16923 mapValue!16923))))

(declare-fun b!404181 () Bool)

(declare-fun res!233117 () Bool)

(assert (=> b!404181 (=> (not res!233117) (not e!243144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404181 (= res!233117 (validKeyInArray!0 k0!794))))

(declare-fun b!404182 () Bool)

(assert (=> b!404182 (= e!243140 (and e!243143 mapRes!16923))))

(declare-fun condMapEmpty!16923 () Bool)

(declare-fun mapDefault!16923 () ValueCell!4757)

(assert (=> b!404182 (= condMapEmpty!16923 (= (arr!11592 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4757)) mapDefault!16923)))))

(assert (= (and start!38768 res!233110) b!404180))

(assert (= (and b!404180 res!233111) b!404177))

(assert (= (and b!404177 res!233112) b!404179))

(assert (= (and b!404179 res!233113) b!404173))

(assert (= (and b!404173 res!233118) b!404175))

(assert (= (and b!404175 res!233115) b!404181))

(assert (= (and b!404181 res!233117) b!404176))

(assert (= (and b!404176 res!233116) b!404172))

(assert (= (and b!404172 res!233114) b!404170))

(assert (= (and b!404170 res!233109) b!404171))

(assert (= (and b!404182 condMapEmpty!16923) mapIsEmpty!16923))

(assert (= (and b!404182 (not condMapEmpty!16923)) mapNonEmpty!16923))

(get-info :version)

(assert (= (and mapNonEmpty!16923 ((_ is ValueCellFull!4757) mapValue!16923)) b!404178))

(assert (= (and b!404182 ((_ is ValueCellFull!4757) mapDefault!16923)) b!404174))

(assert (= start!38768 b!404182))

(declare-fun m!396555 () Bool)

(assert (=> b!404176 m!396555))

(declare-fun m!396557 () Bool)

(assert (=> start!38768 m!396557))

(declare-fun m!396559 () Bool)

(assert (=> start!38768 m!396559))

(declare-fun m!396561 () Bool)

(assert (=> b!404173 m!396561))

(declare-fun m!396563 () Bool)

(assert (=> b!404172 m!396563))

(declare-fun m!396565 () Bool)

(assert (=> b!404179 m!396565))

(declare-fun m!396567 () Bool)

(assert (=> b!404181 m!396567))

(declare-fun m!396569 () Bool)

(assert (=> mapNonEmpty!16923 m!396569))

(declare-fun m!396571 () Bool)

(assert (=> b!404180 m!396571))

(declare-fun m!396573 () Bool)

(assert (=> b!404170 m!396573))

(declare-fun m!396575 () Bool)

(assert (=> b!404170 m!396575))

(declare-fun m!396577 () Bool)

(assert (=> b!404171 m!396577))

(check-sat (not b!404173) (not b!404171) tp_is_empty!10201 (not b!404170) (not mapNonEmpty!16923) (not start!38768) (not b!404179) (not b!404172) (not b!404180) (not b!404181))
(check-sat)
