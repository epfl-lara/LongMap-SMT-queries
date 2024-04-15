; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38498 () Bool)

(assert start!38498)

(declare-fun b!397609 () Bool)

(declare-fun res!228420 () Bool)

(declare-fun e!240386 () Bool)

(assert (=> b!397609 (=> (not res!228420) (not e!240386))))

(declare-datatypes ((array!23753 0))(
  ( (array!23754 (arr!11326 (Array (_ BitVec 32) (_ BitVec 64))) (size!11679 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23753)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397609 (= res!228420 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397610 () Bool)

(declare-fun res!228411 () Bool)

(assert (=> b!397610 (=> (not res!228411) (not e!240386))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397610 (= res!228411 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11679 _keys!709))))))

(declare-fun b!397611 () Bool)

(declare-fun e!240387 () Bool)

(assert (=> b!397611 (= e!240386 e!240387)))

(declare-fun res!228412 () Bool)

(assert (=> b!397611 (=> (not res!228412) (not e!240387))))

(declare-fun lt!187138 () array!23753)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23753 (_ BitVec 32)) Bool)

(assert (=> b!397611 (= res!228412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187138 mask!1025))))

(assert (=> b!397611 (= lt!187138 (array!23754 (store (arr!11326 _keys!709) i!563 k0!794) (size!11679 _keys!709)))))

(declare-fun b!397612 () Bool)

(declare-fun e!240389 () Bool)

(declare-fun tp_is_empty!9931 () Bool)

(assert (=> b!397612 (= e!240389 tp_is_empty!9931)))

(declare-fun mapIsEmpty!16518 () Bool)

(declare-fun mapRes!16518 () Bool)

(assert (=> mapIsEmpty!16518 mapRes!16518))

(declare-fun b!397613 () Bool)

(declare-fun e!240388 () Bool)

(assert (=> b!397613 (= e!240388 tp_is_empty!9931)))

(declare-fun b!397614 () Bool)

(declare-fun res!228416 () Bool)

(assert (=> b!397614 (=> (not res!228416) (not e!240386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397614 (= res!228416 (validMask!0 mask!1025))))

(declare-fun b!397615 () Bool)

(declare-fun res!228414 () Bool)

(assert (=> b!397615 (=> (not res!228414) (not e!240386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397615 (= res!228414 (validKeyInArray!0 k0!794))))

(declare-fun b!397616 () Bool)

(declare-fun res!228417 () Bool)

(assert (=> b!397616 (=> (not res!228417) (not e!240386))))

(assert (=> b!397616 (= res!228417 (or (= (select (arr!11326 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11326 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!228415 () Bool)

(assert (=> start!38498 (=> (not res!228415) (not e!240386))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38498 (= res!228415 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11679 _keys!709))))))

(assert (=> start!38498 e!240386))

(assert (=> start!38498 true))

(declare-datatypes ((V!14347 0))(
  ( (V!14348 (val!5010 Int)) )
))
(declare-datatypes ((ValueCell!4622 0))(
  ( (ValueCellFull!4622 (v!7251 V!14347)) (EmptyCell!4622) )
))
(declare-datatypes ((array!23755 0))(
  ( (array!23756 (arr!11327 (Array (_ BitVec 32) ValueCell!4622)) (size!11680 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23755)

(declare-fun e!240390 () Bool)

(declare-fun array_inv!8314 (array!23755) Bool)

(assert (=> start!38498 (and (array_inv!8314 _values!549) e!240390)))

(declare-fun array_inv!8315 (array!23753) Bool)

(assert (=> start!38498 (array_inv!8315 _keys!709)))

(declare-fun b!397617 () Bool)

(declare-fun res!228418 () Bool)

(assert (=> b!397617 (=> (not res!228418) (not e!240386))))

(declare-datatypes ((List!6516 0))(
  ( (Nil!6513) (Cons!6512 (h!7368 (_ BitVec 64)) (t!11681 List!6516)) )
))
(declare-fun arrayNoDuplicates!0 (array!23753 (_ BitVec 32) List!6516) Bool)

(assert (=> b!397617 (= res!228418 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6513))))

(declare-fun b!397618 () Bool)

(declare-fun res!228419 () Bool)

(assert (=> b!397618 (=> (not res!228419) (not e!240386))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397618 (= res!228419 (and (= (size!11680 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11679 _keys!709) (size!11680 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397619 () Bool)

(assert (=> b!397619 (= e!240390 (and e!240388 mapRes!16518))))

(declare-fun condMapEmpty!16518 () Bool)

(declare-fun mapDefault!16518 () ValueCell!4622)

(assert (=> b!397619 (= condMapEmpty!16518 (= (arr!11327 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4622)) mapDefault!16518)))))

(declare-fun b!397620 () Bool)

(declare-fun res!228413 () Bool)

(assert (=> b!397620 (=> (not res!228413) (not e!240386))))

(assert (=> b!397620 (= res!228413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397621 () Bool)

(assert (=> b!397621 (= e!240387 false)))

(declare-fun lt!187139 () Bool)

(assert (=> b!397621 (= lt!187139 (arrayNoDuplicates!0 lt!187138 #b00000000000000000000000000000000 Nil!6513))))

(declare-fun mapNonEmpty!16518 () Bool)

(declare-fun tp!32313 () Bool)

(assert (=> mapNonEmpty!16518 (= mapRes!16518 (and tp!32313 e!240389))))

(declare-fun mapRest!16518 () (Array (_ BitVec 32) ValueCell!4622))

(declare-fun mapKey!16518 () (_ BitVec 32))

(declare-fun mapValue!16518 () ValueCell!4622)

(assert (=> mapNonEmpty!16518 (= (arr!11327 _values!549) (store mapRest!16518 mapKey!16518 mapValue!16518))))

(assert (= (and start!38498 res!228415) b!397614))

(assert (= (and b!397614 res!228416) b!397618))

(assert (= (and b!397618 res!228419) b!397620))

(assert (= (and b!397620 res!228413) b!397617))

(assert (= (and b!397617 res!228418) b!397610))

(assert (= (and b!397610 res!228411) b!397615))

(assert (= (and b!397615 res!228414) b!397616))

(assert (= (and b!397616 res!228417) b!397609))

(assert (= (and b!397609 res!228420) b!397611))

(assert (= (and b!397611 res!228412) b!397621))

(assert (= (and b!397619 condMapEmpty!16518) mapIsEmpty!16518))

(assert (= (and b!397619 (not condMapEmpty!16518)) mapNonEmpty!16518))

(get-info :version)

(assert (= (and mapNonEmpty!16518 ((_ is ValueCellFull!4622) mapValue!16518)) b!397612))

(assert (= (and b!397619 ((_ is ValueCellFull!4622) mapDefault!16518)) b!397613))

(assert (= start!38498 b!397619))

(declare-fun m!392235 () Bool)

(assert (=> b!397615 m!392235))

(declare-fun m!392237 () Bool)

(assert (=> b!397617 m!392237))

(declare-fun m!392239 () Bool)

(assert (=> b!397609 m!392239))

(declare-fun m!392241 () Bool)

(assert (=> b!397611 m!392241))

(declare-fun m!392243 () Bool)

(assert (=> b!397611 m!392243))

(declare-fun m!392245 () Bool)

(assert (=> mapNonEmpty!16518 m!392245))

(declare-fun m!392247 () Bool)

(assert (=> b!397620 m!392247))

(declare-fun m!392249 () Bool)

(assert (=> start!38498 m!392249))

(declare-fun m!392251 () Bool)

(assert (=> start!38498 m!392251))

(declare-fun m!392253 () Bool)

(assert (=> b!397614 m!392253))

(declare-fun m!392255 () Bool)

(assert (=> b!397616 m!392255))

(declare-fun m!392257 () Bool)

(assert (=> b!397621 m!392257))

(check-sat (not mapNonEmpty!16518) (not b!397617) (not b!397621) (not b!397609) (not b!397614) (not b!397615) (not start!38498) (not b!397611) (not b!397620) tp_is_empty!9931)
(check-sat)
