; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38504 () Bool)

(assert start!38504)

(declare-fun b!397726 () Bool)

(declare-fun e!240439 () Bool)

(declare-fun tp_is_empty!9937 () Bool)

(assert (=> b!397726 (= e!240439 tp_is_empty!9937)))

(declare-fun b!397727 () Bool)

(declare-fun res!228510 () Bool)

(declare-fun e!240440 () Bool)

(assert (=> b!397727 (=> (not res!228510) (not e!240440))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23765 0))(
  ( (array!23766 (arr!11332 (Array (_ BitVec 32) (_ BitVec 64))) (size!11685 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23765)

(assert (=> b!397727 (= res!228510 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11685 _keys!709))))))

(declare-fun b!397728 () Bool)

(declare-fun res!228506 () Bool)

(assert (=> b!397728 (=> (not res!228506) (not e!240440))))

(assert (=> b!397728 (= res!228506 (or (= (select (arr!11332 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11332 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397729 () Bool)

(declare-fun e!240442 () Bool)

(assert (=> b!397729 (= e!240442 tp_is_empty!9937)))

(declare-fun res!228502 () Bool)

(assert (=> start!38504 (=> (not res!228502) (not e!240440))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38504 (= res!228502 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11685 _keys!709))))))

(assert (=> start!38504 e!240440))

(assert (=> start!38504 true))

(declare-datatypes ((V!14355 0))(
  ( (V!14356 (val!5013 Int)) )
))
(declare-datatypes ((ValueCell!4625 0))(
  ( (ValueCellFull!4625 (v!7254 V!14355)) (EmptyCell!4625) )
))
(declare-datatypes ((array!23767 0))(
  ( (array!23768 (arr!11333 (Array (_ BitVec 32) ValueCell!4625)) (size!11686 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23767)

(declare-fun e!240443 () Bool)

(declare-fun array_inv!8320 (array!23767) Bool)

(assert (=> start!38504 (and (array_inv!8320 _values!549) e!240443)))

(declare-fun array_inv!8321 (array!23765) Bool)

(assert (=> start!38504 (array_inv!8321 _keys!709)))

(declare-fun b!397730 () Bool)

(declare-fun res!228505 () Bool)

(assert (=> b!397730 (=> (not res!228505) (not e!240440))))

(declare-datatypes ((List!6519 0))(
  ( (Nil!6516) (Cons!6515 (h!7371 (_ BitVec 64)) (t!11684 List!6519)) )
))
(declare-fun arrayNoDuplicates!0 (array!23765 (_ BitVec 32) List!6519) Bool)

(assert (=> b!397730 (= res!228505 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6516))))

(declare-fun b!397731 () Bool)

(declare-fun e!240441 () Bool)

(assert (=> b!397731 (= e!240441 false)))

(declare-fun lt!187156 () Bool)

(declare-fun lt!187157 () array!23765)

(assert (=> b!397731 (= lt!187156 (arrayNoDuplicates!0 lt!187157 #b00000000000000000000000000000000 Nil!6516))))

(declare-fun b!397732 () Bool)

(declare-fun res!228508 () Bool)

(assert (=> b!397732 (=> (not res!228508) (not e!240440))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!397732 (= res!228508 (and (= (size!11686 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11685 _keys!709) (size!11686 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397733 () Bool)

(declare-fun res!228501 () Bool)

(assert (=> b!397733 (=> (not res!228501) (not e!240440))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397733 (= res!228501 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16527 () Bool)

(declare-fun mapRes!16527 () Bool)

(declare-fun tp!32322 () Bool)

(assert (=> mapNonEmpty!16527 (= mapRes!16527 (and tp!32322 e!240442))))

(declare-fun mapValue!16527 () ValueCell!4625)

(declare-fun mapKey!16527 () (_ BitVec 32))

(declare-fun mapRest!16527 () (Array (_ BitVec 32) ValueCell!4625))

(assert (=> mapNonEmpty!16527 (= (arr!11333 _values!549) (store mapRest!16527 mapKey!16527 mapValue!16527))))

(declare-fun b!397734 () Bool)

(declare-fun res!228504 () Bool)

(assert (=> b!397734 (=> (not res!228504) (not e!240440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23765 (_ BitVec 32)) Bool)

(assert (=> b!397734 (= res!228504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397735 () Bool)

(declare-fun res!228503 () Bool)

(assert (=> b!397735 (=> (not res!228503) (not e!240440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397735 (= res!228503 (validKeyInArray!0 k0!794))))

(declare-fun b!397736 () Bool)

(assert (=> b!397736 (= e!240440 e!240441)))

(declare-fun res!228507 () Bool)

(assert (=> b!397736 (=> (not res!228507) (not e!240441))))

(assert (=> b!397736 (= res!228507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187157 mask!1025))))

(assert (=> b!397736 (= lt!187157 (array!23766 (store (arr!11332 _keys!709) i!563 k0!794) (size!11685 _keys!709)))))

(declare-fun b!397737 () Bool)

(assert (=> b!397737 (= e!240443 (and e!240439 mapRes!16527))))

(declare-fun condMapEmpty!16527 () Bool)

(declare-fun mapDefault!16527 () ValueCell!4625)

(assert (=> b!397737 (= condMapEmpty!16527 (= (arr!11333 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4625)) mapDefault!16527)))))

(declare-fun b!397738 () Bool)

(declare-fun res!228509 () Bool)

(assert (=> b!397738 (=> (not res!228509) (not e!240440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397738 (= res!228509 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16527 () Bool)

(assert (=> mapIsEmpty!16527 mapRes!16527))

(assert (= (and start!38504 res!228502) b!397738))

(assert (= (and b!397738 res!228509) b!397732))

(assert (= (and b!397732 res!228508) b!397734))

(assert (= (and b!397734 res!228504) b!397730))

(assert (= (and b!397730 res!228505) b!397727))

(assert (= (and b!397727 res!228510) b!397735))

(assert (= (and b!397735 res!228503) b!397728))

(assert (= (and b!397728 res!228506) b!397733))

(assert (= (and b!397733 res!228501) b!397736))

(assert (= (and b!397736 res!228507) b!397731))

(assert (= (and b!397737 condMapEmpty!16527) mapIsEmpty!16527))

(assert (= (and b!397737 (not condMapEmpty!16527)) mapNonEmpty!16527))

(get-info :version)

(assert (= (and mapNonEmpty!16527 ((_ is ValueCellFull!4625) mapValue!16527)) b!397729))

(assert (= (and b!397737 ((_ is ValueCellFull!4625) mapDefault!16527)) b!397726))

(assert (= start!38504 b!397737))

(declare-fun m!392307 () Bool)

(assert (=> b!397736 m!392307))

(declare-fun m!392309 () Bool)

(assert (=> b!397736 m!392309))

(declare-fun m!392311 () Bool)

(assert (=> b!397728 m!392311))

(declare-fun m!392313 () Bool)

(assert (=> b!397734 m!392313))

(declare-fun m!392315 () Bool)

(assert (=> b!397731 m!392315))

(declare-fun m!392317 () Bool)

(assert (=> b!397735 m!392317))

(declare-fun m!392319 () Bool)

(assert (=> mapNonEmpty!16527 m!392319))

(declare-fun m!392321 () Bool)

(assert (=> b!397730 m!392321))

(declare-fun m!392323 () Bool)

(assert (=> b!397738 m!392323))

(declare-fun m!392325 () Bool)

(assert (=> start!38504 m!392325))

(declare-fun m!392327 () Bool)

(assert (=> start!38504 m!392327))

(declare-fun m!392329 () Bool)

(assert (=> b!397733 m!392329))

(check-sat (not b!397731) (not mapNonEmpty!16527) (not b!397734) (not b!397733) (not start!38504) (not b!397736) (not b!397730) tp_is_empty!9937 (not b!397738) (not b!397735))
(check-sat)
