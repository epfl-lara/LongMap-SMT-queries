; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38492 () Bool)

(assert start!38492)

(declare-fun b!397714 () Bool)

(declare-fun e!240478 () Bool)

(declare-fun tp_is_empty!9925 () Bool)

(assert (=> b!397714 (= e!240478 tp_is_empty!9925)))

(declare-fun b!397715 () Bool)

(declare-fun res!228456 () Bool)

(declare-fun e!240476 () Bool)

(assert (=> b!397715 (=> (not res!228456) (not e!240476))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397715 (= res!228456 (validMask!0 mask!1025))))

(declare-fun b!397716 () Bool)

(declare-fun res!228448 () Bool)

(assert (=> b!397716 (=> (not res!228448) (not e!240476))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23746 0))(
  ( (array!23747 (arr!11322 (Array (_ BitVec 32) (_ BitVec 64))) (size!11674 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23746)

(assert (=> b!397716 (= res!228448 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11674 _keys!709))))))

(declare-fun b!397717 () Bool)

(declare-fun e!240474 () Bool)

(declare-fun mapRes!16509 () Bool)

(assert (=> b!397717 (= e!240474 (and e!240478 mapRes!16509))))

(declare-fun condMapEmpty!16509 () Bool)

(declare-datatypes ((V!14339 0))(
  ( (V!14340 (val!5007 Int)) )
))
(declare-datatypes ((ValueCell!4619 0))(
  ( (ValueCellFull!4619 (v!7255 V!14339)) (EmptyCell!4619) )
))
(declare-datatypes ((array!23748 0))(
  ( (array!23749 (arr!11323 (Array (_ BitVec 32) ValueCell!4619)) (size!11675 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23748)

(declare-fun mapDefault!16509 () ValueCell!4619)

(assert (=> b!397717 (= condMapEmpty!16509 (= (arr!11323 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4619)) mapDefault!16509)))))

(declare-fun b!397718 () Bool)

(declare-fun res!228455 () Bool)

(assert (=> b!397718 (=> (not res!228455) (not e!240476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23746 (_ BitVec 32)) Bool)

(assert (=> b!397718 (= res!228455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397719 () Bool)

(declare-fun res!228450 () Bool)

(assert (=> b!397719 (=> (not res!228450) (not e!240476))))

(declare-datatypes ((List!6419 0))(
  ( (Nil!6416) (Cons!6415 (h!7271 (_ BitVec 64)) (t!11585 List!6419)) )
))
(declare-fun arrayNoDuplicates!0 (array!23746 (_ BitVec 32) List!6419) Bool)

(assert (=> b!397719 (= res!228450 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6416))))

(declare-fun b!397720 () Bool)

(declare-fun res!228452 () Bool)

(assert (=> b!397720 (=> (not res!228452) (not e!240476))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397720 (= res!228452 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16509 () Bool)

(declare-fun tp!32304 () Bool)

(declare-fun e!240477 () Bool)

(assert (=> mapNonEmpty!16509 (= mapRes!16509 (and tp!32304 e!240477))))

(declare-fun mapKey!16509 () (_ BitVec 32))

(declare-fun mapRest!16509 () (Array (_ BitVec 32) ValueCell!4619))

(declare-fun mapValue!16509 () ValueCell!4619)

(assert (=> mapNonEmpty!16509 (= (arr!11323 _values!549) (store mapRest!16509 mapKey!16509 mapValue!16509))))

(declare-fun b!397721 () Bool)

(declare-fun res!228453 () Bool)

(assert (=> b!397721 (=> (not res!228453) (not e!240476))))

(declare-fun arrayContainsKey!0 (array!23746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397721 (= res!228453 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397722 () Bool)

(declare-fun res!228454 () Bool)

(assert (=> b!397722 (=> (not res!228454) (not e!240476))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397722 (= res!228454 (and (= (size!11675 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11674 _keys!709) (size!11675 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16509 () Bool)

(assert (=> mapIsEmpty!16509 mapRes!16509))

(declare-fun res!228451 () Bool)

(assert (=> start!38492 (=> (not res!228451) (not e!240476))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38492 (= res!228451 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11674 _keys!709))))))

(assert (=> start!38492 e!240476))

(assert (=> start!38492 true))

(declare-fun array_inv!8366 (array!23748) Bool)

(assert (=> start!38492 (and (array_inv!8366 _values!549) e!240474)))

(declare-fun array_inv!8367 (array!23746) Bool)

(assert (=> start!38492 (array_inv!8367 _keys!709)))

(declare-fun b!397723 () Bool)

(declare-fun res!228449 () Bool)

(assert (=> b!397723 (=> (not res!228449) (not e!240476))))

(assert (=> b!397723 (= res!228449 (or (= (select (arr!11322 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11322 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397724 () Bool)

(declare-fun e!240475 () Bool)

(assert (=> b!397724 (= e!240476 e!240475)))

(declare-fun res!228447 () Bool)

(assert (=> b!397724 (=> (not res!228447) (not e!240475))))

(declare-fun lt!187373 () array!23746)

(assert (=> b!397724 (= res!228447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187373 mask!1025))))

(assert (=> b!397724 (= lt!187373 (array!23747 (store (arr!11322 _keys!709) i!563 k0!794) (size!11674 _keys!709)))))

(declare-fun b!397725 () Bool)

(assert (=> b!397725 (= e!240477 tp_is_empty!9925)))

(declare-fun b!397726 () Bool)

(assert (=> b!397726 (= e!240475 false)))

(declare-fun lt!187374 () Bool)

(assert (=> b!397726 (= lt!187374 (arrayNoDuplicates!0 lt!187373 #b00000000000000000000000000000000 Nil!6416))))

(assert (= (and start!38492 res!228451) b!397715))

(assert (= (and b!397715 res!228456) b!397722))

(assert (= (and b!397722 res!228454) b!397718))

(assert (= (and b!397718 res!228455) b!397719))

(assert (= (and b!397719 res!228450) b!397716))

(assert (= (and b!397716 res!228448) b!397720))

(assert (= (and b!397720 res!228452) b!397723))

(assert (= (and b!397723 res!228449) b!397721))

(assert (= (and b!397721 res!228453) b!397724))

(assert (= (and b!397724 res!228447) b!397726))

(assert (= (and b!397717 condMapEmpty!16509) mapIsEmpty!16509))

(assert (= (and b!397717 (not condMapEmpty!16509)) mapNonEmpty!16509))

(get-info :version)

(assert (= (and mapNonEmpty!16509 ((_ is ValueCellFull!4619) mapValue!16509)) b!397725))

(assert (= (and b!397717 ((_ is ValueCellFull!4619) mapDefault!16509)) b!397714))

(assert (= start!38492 b!397717))

(declare-fun m!393117 () Bool)

(assert (=> b!397718 m!393117))

(declare-fun m!393119 () Bool)

(assert (=> b!397719 m!393119))

(declare-fun m!393121 () Bool)

(assert (=> b!397720 m!393121))

(declare-fun m!393123 () Bool)

(assert (=> mapNonEmpty!16509 m!393123))

(declare-fun m!393125 () Bool)

(assert (=> b!397721 m!393125))

(declare-fun m!393127 () Bool)

(assert (=> b!397715 m!393127))

(declare-fun m!393129 () Bool)

(assert (=> b!397724 m!393129))

(declare-fun m!393131 () Bool)

(assert (=> b!397724 m!393131))

(declare-fun m!393133 () Bool)

(assert (=> b!397723 m!393133))

(declare-fun m!393135 () Bool)

(assert (=> start!38492 m!393135))

(declare-fun m!393137 () Bool)

(assert (=> start!38492 m!393137))

(declare-fun m!393139 () Bool)

(assert (=> b!397726 m!393139))

(check-sat (not b!397719) (not b!397724) (not b!397721) (not start!38492) (not mapNonEmpty!16509) (not b!397715) (not b!397726) (not b!397720) tp_is_empty!9925 (not b!397718))
(check-sat)
