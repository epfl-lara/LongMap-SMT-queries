; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38904 () Bool)

(assert start!38904)

(declare-fun b!406820 () Bool)

(declare-fun res!235070 () Bool)

(declare-fun e!244415 () Bool)

(assert (=> b!406820 (=> (not res!235070) (not e!244415))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24533 0))(
  ( (array!24534 (arr!11716 (Array (_ BitVec 32) (_ BitVec 64))) (size!12068 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24533)

(assert (=> b!406820 (= res!235070 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12068 _keys!709))))))

(declare-fun b!406821 () Bool)

(declare-fun res!235075 () Bool)

(assert (=> b!406821 (=> (not res!235075) (not e!244415))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14869 0))(
  ( (V!14870 (val!5206 Int)) )
))
(declare-datatypes ((ValueCell!4818 0))(
  ( (ValueCellFull!4818 (v!7453 V!14869)) (EmptyCell!4818) )
))
(declare-datatypes ((array!24535 0))(
  ( (array!24536 (arr!11717 (Array (_ BitVec 32) ValueCell!4818)) (size!12069 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24535)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!406821 (= res!235075 (and (= (size!12069 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12068 _keys!709) (size!12069 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406822 () Bool)

(declare-fun res!235073 () Bool)

(assert (=> b!406822 (=> (not res!235073) (not e!244415))))

(assert (=> b!406822 (= res!235073 (or (= (select (arr!11716 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11716 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406823 () Bool)

(declare-fun e!244412 () Bool)

(declare-fun tp_is_empty!10323 () Bool)

(assert (=> b!406823 (= e!244412 tp_is_empty!10323)))

(declare-fun b!406824 () Bool)

(declare-fun res!235068 () Bool)

(assert (=> b!406824 (=> (not res!235068) (not e!244415))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406824 (= res!235068 (validKeyInArray!0 k0!794))))

(declare-fun b!406825 () Bool)

(declare-fun res!235069 () Bool)

(assert (=> b!406825 (=> (not res!235069) (not e!244415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24533 (_ BitVec 32)) Bool)

(assert (=> b!406825 (= res!235069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406826 () Bool)

(declare-fun res!235072 () Bool)

(assert (=> b!406826 (=> (not res!235072) (not e!244415))))

(declare-datatypes ((List!6801 0))(
  ( (Nil!6798) (Cons!6797 (h!7653 (_ BitVec 64)) (t!11975 List!6801)) )
))
(declare-fun arrayNoDuplicates!0 (array!24533 (_ BitVec 32) List!6801) Bool)

(assert (=> b!406826 (= res!235072 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6798))))

(declare-fun b!406827 () Bool)

(declare-fun e!244416 () Bool)

(assert (=> b!406827 (= e!244416 false)))

(declare-fun lt!188549 () Bool)

(declare-fun lt!188548 () array!24533)

(assert (=> b!406827 (= lt!188549 (arrayNoDuplicates!0 lt!188548 #b00000000000000000000000000000000 Nil!6798))))

(declare-fun res!235071 () Bool)

(assert (=> start!38904 (=> (not res!235071) (not e!244415))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38904 (= res!235071 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12068 _keys!709))))))

(assert (=> start!38904 e!244415))

(assert (=> start!38904 true))

(declare-fun e!244413 () Bool)

(declare-fun array_inv!8554 (array!24535) Bool)

(assert (=> start!38904 (and (array_inv!8554 _values!549) e!244413)))

(declare-fun array_inv!8555 (array!24533) Bool)

(assert (=> start!38904 (array_inv!8555 _keys!709)))

(declare-fun b!406828 () Bool)

(assert (=> b!406828 (= e!244415 e!244416)))

(declare-fun res!235077 () Bool)

(assert (=> b!406828 (=> (not res!235077) (not e!244416))))

(assert (=> b!406828 (= res!235077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188548 mask!1025))))

(assert (=> b!406828 (= lt!188548 (array!24534 (store (arr!11716 _keys!709) i!563 k0!794) (size!12068 _keys!709)))))

(declare-fun b!406829 () Bool)

(declare-fun res!235074 () Bool)

(assert (=> b!406829 (=> (not res!235074) (not e!244415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406829 (= res!235074 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17106 () Bool)

(declare-fun mapRes!17106 () Bool)

(declare-fun tp!33225 () Bool)

(declare-fun e!244414 () Bool)

(assert (=> mapNonEmpty!17106 (= mapRes!17106 (and tp!33225 e!244414))))

(declare-fun mapRest!17106 () (Array (_ BitVec 32) ValueCell!4818))

(declare-fun mapValue!17106 () ValueCell!4818)

(declare-fun mapKey!17106 () (_ BitVec 32))

(assert (=> mapNonEmpty!17106 (= (arr!11717 _values!549) (store mapRest!17106 mapKey!17106 mapValue!17106))))

(declare-fun mapIsEmpty!17106 () Bool)

(assert (=> mapIsEmpty!17106 mapRes!17106))

(declare-fun b!406830 () Bool)

(assert (=> b!406830 (= e!244413 (and e!244412 mapRes!17106))))

(declare-fun condMapEmpty!17106 () Bool)

(declare-fun mapDefault!17106 () ValueCell!4818)

(assert (=> b!406830 (= condMapEmpty!17106 (= (arr!11717 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4818)) mapDefault!17106)))))

(declare-fun b!406831 () Bool)

(declare-fun res!235076 () Bool)

(assert (=> b!406831 (=> (not res!235076) (not e!244415))))

(declare-fun arrayContainsKey!0 (array!24533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406831 (= res!235076 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406832 () Bool)

(assert (=> b!406832 (= e!244414 tp_is_empty!10323)))

(assert (= (and start!38904 res!235071) b!406829))

(assert (= (and b!406829 res!235074) b!406821))

(assert (= (and b!406821 res!235075) b!406825))

(assert (= (and b!406825 res!235069) b!406826))

(assert (= (and b!406826 res!235072) b!406820))

(assert (= (and b!406820 res!235070) b!406824))

(assert (= (and b!406824 res!235068) b!406822))

(assert (= (and b!406822 res!235073) b!406831))

(assert (= (and b!406831 res!235076) b!406828))

(assert (= (and b!406828 res!235077) b!406827))

(assert (= (and b!406830 condMapEmpty!17106) mapIsEmpty!17106))

(assert (= (and b!406830 (not condMapEmpty!17106)) mapNonEmpty!17106))

(get-info :version)

(assert (= (and mapNonEmpty!17106 ((_ is ValueCellFull!4818) mapValue!17106)) b!406832))

(assert (= (and b!406830 ((_ is ValueCellFull!4818) mapDefault!17106)) b!406823))

(assert (= start!38904 b!406830))

(declare-fun m!398743 () Bool)

(assert (=> start!38904 m!398743))

(declare-fun m!398745 () Bool)

(assert (=> start!38904 m!398745))

(declare-fun m!398747 () Bool)

(assert (=> b!406822 m!398747))

(declare-fun m!398749 () Bool)

(assert (=> b!406825 m!398749))

(declare-fun m!398751 () Bool)

(assert (=> b!406829 m!398751))

(declare-fun m!398753 () Bool)

(assert (=> b!406826 m!398753))

(declare-fun m!398755 () Bool)

(assert (=> b!406828 m!398755))

(declare-fun m!398757 () Bool)

(assert (=> b!406828 m!398757))

(declare-fun m!398759 () Bool)

(assert (=> mapNonEmpty!17106 m!398759))

(declare-fun m!398761 () Bool)

(assert (=> b!406827 m!398761))

(declare-fun m!398763 () Bool)

(assert (=> b!406831 m!398763))

(declare-fun m!398765 () Bool)

(assert (=> b!406824 m!398765))

(check-sat (not b!406824) (not b!406827) (not b!406825) (not b!406831) (not start!38904) (not b!406826) (not b!406828) (not b!406829) (not mapNonEmpty!17106) tp_is_empty!10323)
(check-sat)
