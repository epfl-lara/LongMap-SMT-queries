; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38990 () Bool)

(assert start!38990)

(declare-fun mapIsEmpty!17256 () Bool)

(declare-fun mapRes!17256 () Bool)

(assert (=> mapIsEmpty!17256 mapRes!17256))

(declare-fun mapNonEmpty!17256 () Bool)

(declare-fun tp!33375 () Bool)

(declare-fun e!245141 () Bool)

(assert (=> mapNonEmpty!17256 (= mapRes!17256 (and tp!33375 e!245141))))

(declare-fun mapKey!17256 () (_ BitVec 32))

(declare-datatypes ((V!15003 0))(
  ( (V!15004 (val!5256 Int)) )
))
(declare-datatypes ((ValueCell!4868 0))(
  ( (ValueCellFull!4868 (v!7497 V!15003)) (EmptyCell!4868) )
))
(declare-fun mapValue!17256 () ValueCell!4868)

(declare-datatypes ((array!24709 0))(
  ( (array!24710 (arr!11804 (Array (_ BitVec 32) ValueCell!4868)) (size!12157 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24709)

(declare-fun mapRest!17256 () (Array (_ BitVec 32) ValueCell!4868))

(assert (=> mapNonEmpty!17256 (= (arr!11804 _values!549) (store mapRest!17256 mapKey!17256 mapValue!17256))))

(declare-fun b!408500 () Bool)

(declare-fun res!236439 () Bool)

(declare-fun e!245142 () Bool)

(assert (=> b!408500 (=> (not res!236439) (not e!245142))))

(declare-datatypes ((array!24711 0))(
  ( (array!24712 (arr!11805 (Array (_ BitVec 32) (_ BitVec 64))) (size!12158 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24711)

(declare-datatypes ((List!6813 0))(
  ( (Nil!6810) (Cons!6809 (h!7665 (_ BitVec 64)) (t!11978 List!6813)) )
))
(declare-fun arrayNoDuplicates!0 (array!24711 (_ BitVec 32) List!6813) Bool)

(assert (=> b!408500 (= res!236439 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6810))))

(declare-fun b!408501 () Bool)

(declare-fun e!245137 () Bool)

(declare-fun tp_is_empty!10423 () Bool)

(assert (=> b!408501 (= e!245137 tp_is_empty!10423)))

(declare-fun b!408502 () Bool)

(declare-fun e!245139 () Bool)

(assert (=> b!408502 (= e!245139 (and e!245137 mapRes!17256))))

(declare-fun condMapEmpty!17256 () Bool)

(declare-fun mapDefault!17256 () ValueCell!4868)

(assert (=> b!408502 (= condMapEmpty!17256 (= (arr!11804 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4868)) mapDefault!17256)))))

(declare-fun b!408503 () Bool)

(declare-fun res!236442 () Bool)

(assert (=> b!408503 (=> (not res!236442) (not e!245142))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408503 (= res!236442 (validKeyInArray!0 k0!794))))

(declare-fun b!408499 () Bool)

(declare-fun e!245140 () Bool)

(assert (=> b!408499 (= e!245140 false)))

(declare-fun lt!188614 () Bool)

(declare-fun lt!188615 () array!24711)

(assert (=> b!408499 (= lt!188614 (arrayNoDuplicates!0 lt!188615 #b00000000000000000000000000000000 Nil!6810))))

(declare-fun res!236448 () Bool)

(assert (=> start!38990 (=> (not res!236448) (not e!245142))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38990 (= res!236448 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12158 _keys!709))))))

(assert (=> start!38990 e!245142))

(assert (=> start!38990 true))

(declare-fun array_inv!8658 (array!24709) Bool)

(assert (=> start!38990 (and (array_inv!8658 _values!549) e!245139)))

(declare-fun array_inv!8659 (array!24711) Bool)

(assert (=> start!38990 (array_inv!8659 _keys!709)))

(declare-fun b!408504 () Bool)

(assert (=> b!408504 (= e!245141 tp_is_empty!10423)))

(declare-fun b!408505 () Bool)

(declare-fun res!236441 () Bool)

(assert (=> b!408505 (=> (not res!236441) (not e!245142))))

(declare-fun arrayContainsKey!0 (array!24711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408505 (= res!236441 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408506 () Bool)

(declare-fun res!236444 () Bool)

(assert (=> b!408506 (=> (not res!236444) (not e!245142))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24711 (_ BitVec 32)) Bool)

(assert (=> b!408506 (= res!236444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408507 () Bool)

(declare-fun res!236447 () Bool)

(assert (=> b!408507 (=> (not res!236447) (not e!245142))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408507 (= res!236447 (and (= (size!12157 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12158 _keys!709) (size!12157 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408508 () Bool)

(declare-fun res!236445 () Bool)

(assert (=> b!408508 (=> (not res!236445) (not e!245142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408508 (= res!236445 (validMask!0 mask!1025))))

(declare-fun b!408509 () Bool)

(assert (=> b!408509 (= e!245142 e!245140)))

(declare-fun res!236446 () Bool)

(assert (=> b!408509 (=> (not res!236446) (not e!245140))))

(assert (=> b!408509 (= res!236446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188615 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408509 (= lt!188615 (array!24712 (store (arr!11805 _keys!709) i!563 k0!794) (size!12158 _keys!709)))))

(declare-fun b!408510 () Bool)

(declare-fun res!236440 () Bool)

(assert (=> b!408510 (=> (not res!236440) (not e!245142))))

(assert (=> b!408510 (= res!236440 (or (= (select (arr!11805 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11805 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408511 () Bool)

(declare-fun res!236443 () Bool)

(assert (=> b!408511 (=> (not res!236443) (not e!245142))))

(assert (=> b!408511 (= res!236443 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12158 _keys!709))))))

(assert (= (and start!38990 res!236448) b!408508))

(assert (= (and b!408508 res!236445) b!408507))

(assert (= (and b!408507 res!236447) b!408506))

(assert (= (and b!408506 res!236444) b!408500))

(assert (= (and b!408500 res!236439) b!408511))

(assert (= (and b!408511 res!236443) b!408503))

(assert (= (and b!408503 res!236442) b!408510))

(assert (= (and b!408510 res!236440) b!408505))

(assert (= (and b!408505 res!236441) b!408509))

(assert (= (and b!408509 res!236446) b!408499))

(assert (= (and b!408502 condMapEmpty!17256) mapIsEmpty!17256))

(assert (= (and b!408502 (not condMapEmpty!17256)) mapNonEmpty!17256))

(get-info :version)

(assert (= (and mapNonEmpty!17256 ((_ is ValueCellFull!4868) mapValue!17256)) b!408504))

(assert (= (and b!408502 ((_ is ValueCellFull!4868) mapDefault!17256)) b!408501))

(assert (= start!38990 b!408502))

(declare-fun m!399219 () Bool)

(assert (=> start!38990 m!399219))

(declare-fun m!399221 () Bool)

(assert (=> start!38990 m!399221))

(declare-fun m!399223 () Bool)

(assert (=> b!408505 m!399223))

(declare-fun m!399225 () Bool)

(assert (=> b!408500 m!399225))

(declare-fun m!399227 () Bool)

(assert (=> b!408499 m!399227))

(declare-fun m!399229 () Bool)

(assert (=> b!408508 m!399229))

(declare-fun m!399231 () Bool)

(assert (=> b!408506 m!399231))

(declare-fun m!399233 () Bool)

(assert (=> b!408509 m!399233))

(declare-fun m!399235 () Bool)

(assert (=> b!408509 m!399235))

(declare-fun m!399237 () Bool)

(assert (=> b!408510 m!399237))

(declare-fun m!399239 () Bool)

(assert (=> mapNonEmpty!17256 m!399239))

(declare-fun m!399241 () Bool)

(assert (=> b!408503 m!399241))

(check-sat (not b!408506) (not start!38990) tp_is_empty!10423 (not b!408509) (not mapNonEmpty!17256) (not b!408499) (not b!408505) (not b!408508) (not b!408503) (not b!408500))
(check-sat)
