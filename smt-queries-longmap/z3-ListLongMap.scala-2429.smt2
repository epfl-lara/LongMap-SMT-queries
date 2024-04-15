; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38330 () Bool)

(assert start!38330)

(declare-fun b!395148 () Bool)

(declare-fun res!226556 () Bool)

(declare-fun e!239229 () Bool)

(assert (=> b!395148 (=> (not res!226556) (not e!239229))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395148 (= res!226556 (validMask!0 mask!1025))))

(declare-fun b!395149 () Bool)

(declare-fun res!226557 () Bool)

(assert (=> b!395149 (=> (not res!226557) (not e!239229))))

(declare-datatypes ((array!23517 0))(
  ( (array!23518 (arr!11211 (Array (_ BitVec 32) (_ BitVec 64))) (size!11564 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23517)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395149 (= res!226557 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!395150 () Bool)

(declare-fun res!226560 () Bool)

(assert (=> b!395150 (=> (not res!226560) (not e!239229))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14187 0))(
  ( (V!14188 (val!4950 Int)) )
))
(declare-datatypes ((ValueCell!4562 0))(
  ( (ValueCellFull!4562 (v!7190 V!14187)) (EmptyCell!4562) )
))
(declare-datatypes ((array!23519 0))(
  ( (array!23520 (arr!11212 (Array (_ BitVec 32) ValueCell!4562)) (size!11565 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23519)

(assert (=> b!395150 (= res!226560 (and (= (size!11565 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11564 _keys!709) (size!11565 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16329 () Bool)

(declare-fun mapRes!16329 () Bool)

(declare-fun tp!32124 () Bool)

(declare-fun e!239231 () Bool)

(assert (=> mapNonEmpty!16329 (= mapRes!16329 (and tp!32124 e!239231))))

(declare-fun mapRest!16329 () (Array (_ BitVec 32) ValueCell!4562))

(declare-fun mapKey!16329 () (_ BitVec 32))

(declare-fun mapValue!16329 () ValueCell!4562)

(assert (=> mapNonEmpty!16329 (= (arr!11212 _values!549) (store mapRest!16329 mapKey!16329 mapValue!16329))))

(declare-fun b!395151 () Bool)

(declare-fun e!239230 () Bool)

(declare-fun tp_is_empty!9811 () Bool)

(assert (=> b!395151 (= e!239230 tp_is_empty!9811)))

(declare-fun b!395152 () Bool)

(declare-fun res!226564 () Bool)

(assert (=> b!395152 (=> (not res!226564) (not e!239229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395152 (= res!226564 (validKeyInArray!0 k0!794))))

(declare-fun res!226559 () Bool)

(assert (=> start!38330 (=> (not res!226559) (not e!239229))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38330 (= res!226559 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11564 _keys!709))))))

(assert (=> start!38330 e!239229))

(assert (=> start!38330 true))

(declare-fun e!239232 () Bool)

(declare-fun array_inv!8230 (array!23519) Bool)

(assert (=> start!38330 (and (array_inv!8230 _values!549) e!239232)))

(declare-fun array_inv!8231 (array!23517) Bool)

(assert (=> start!38330 (array_inv!8231 _keys!709)))

(declare-fun b!395153 () Bool)

(assert (=> b!395153 (= e!239231 tp_is_empty!9811)))

(declare-fun b!395154 () Bool)

(declare-fun res!226561 () Bool)

(assert (=> b!395154 (=> (not res!226561) (not e!239229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23517 (_ BitVec 32)) Bool)

(assert (=> b!395154 (= res!226561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395155 () Bool)

(assert (=> b!395155 (= e!239232 (and e!239230 mapRes!16329))))

(declare-fun condMapEmpty!16329 () Bool)

(declare-fun mapDefault!16329 () ValueCell!4562)

(assert (=> b!395155 (= condMapEmpty!16329 (= (arr!11212 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4562)) mapDefault!16329)))))

(declare-fun b!395156 () Bool)

(declare-fun res!226562 () Bool)

(assert (=> b!395156 (=> (not res!226562) (not e!239229))))

(declare-datatypes ((List!6468 0))(
  ( (Nil!6465) (Cons!6464 (h!7320 (_ BitVec 64)) (t!11633 List!6468)) )
))
(declare-fun arrayNoDuplicates!0 (array!23517 (_ BitVec 32) List!6468) Bool)

(assert (=> b!395156 (= res!226562 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6465))))

(declare-fun b!395157 () Bool)

(declare-fun res!226563 () Bool)

(assert (=> b!395157 (=> (not res!226563) (not e!239229))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395157 (= res!226563 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11564 _keys!709))))))

(declare-fun mapIsEmpty!16329 () Bool)

(assert (=> mapIsEmpty!16329 mapRes!16329))

(declare-fun b!395158 () Bool)

(declare-fun res!226558 () Bool)

(assert (=> b!395158 (=> (not res!226558) (not e!239229))))

(assert (=> b!395158 (= res!226558 (or (= (select (arr!11211 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11211 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395159 () Bool)

(assert (=> b!395159 (= e!239229 (not (= (size!11564 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025))))))

(assert (= (and start!38330 res!226559) b!395148))

(assert (= (and b!395148 res!226556) b!395150))

(assert (= (and b!395150 res!226560) b!395154))

(assert (= (and b!395154 res!226561) b!395156))

(assert (= (and b!395156 res!226562) b!395157))

(assert (= (and b!395157 res!226563) b!395152))

(assert (= (and b!395152 res!226564) b!395158))

(assert (= (and b!395158 res!226558) b!395149))

(assert (= (and b!395149 res!226557) b!395159))

(assert (= (and b!395155 condMapEmpty!16329) mapIsEmpty!16329))

(assert (= (and b!395155 (not condMapEmpty!16329)) mapNonEmpty!16329))

(get-info :version)

(assert (= (and mapNonEmpty!16329 ((_ is ValueCellFull!4562) mapValue!16329)) b!395153))

(assert (= (and b!395155 ((_ is ValueCellFull!4562) mapDefault!16329)) b!395151))

(assert (= start!38330 b!395155))

(declare-fun m!390753 () Bool)

(assert (=> b!395158 m!390753))

(declare-fun m!390755 () Bool)

(assert (=> b!395149 m!390755))

(declare-fun m!390757 () Bool)

(assert (=> b!395156 m!390757))

(declare-fun m!390759 () Bool)

(assert (=> b!395152 m!390759))

(declare-fun m!390761 () Bool)

(assert (=> b!395154 m!390761))

(declare-fun m!390763 () Bool)

(assert (=> start!38330 m!390763))

(declare-fun m!390765 () Bool)

(assert (=> start!38330 m!390765))

(declare-fun m!390767 () Bool)

(assert (=> mapNonEmpty!16329 m!390767))

(declare-fun m!390769 () Bool)

(assert (=> b!395148 m!390769))

(check-sat (not b!395148) (not b!395156) (not b!395149) (not b!395152) (not mapNonEmpty!16329) (not b!395154) tp_is_empty!9811 (not start!38330))
(check-sat)
