; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38864 () Bool)

(assert start!38864)

(declare-fun b!406042 () Bool)

(declare-fun res!234550 () Bool)

(declare-fun e!244004 () Bool)

(assert (=> b!406042 (=> (not res!234550) (not e!244004))))

(declare-datatypes ((array!24469 0))(
  ( (array!24470 (arr!11684 (Array (_ BitVec 32) (_ BitVec 64))) (size!12037 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24469)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24469 (_ BitVec 32)) Bool)

(assert (=> b!406042 (= res!234550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406043 () Bool)

(declare-fun res!234552 () Bool)

(assert (=> b!406043 (=> (not res!234552) (not e!244004))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14835 0))(
  ( (V!14836 (val!5193 Int)) )
))
(declare-datatypes ((ValueCell!4805 0))(
  ( (ValueCellFull!4805 (v!7434 V!14835)) (EmptyCell!4805) )
))
(declare-datatypes ((array!24471 0))(
  ( (array!24472 (arr!11685 (Array (_ BitVec 32) ValueCell!4805)) (size!12038 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24471)

(assert (=> b!406043 (= res!234552 (and (= (size!12038 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12037 _keys!709) (size!12038 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406044 () Bool)

(declare-fun res!234558 () Bool)

(assert (=> b!406044 (=> (not res!234558) (not e!244004))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406044 (= res!234558 (or (= (select (arr!11684 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11684 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406045 () Bool)

(declare-fun res!234554 () Bool)

(assert (=> b!406045 (=> (not res!234554) (not e!244004))))

(declare-datatypes ((List!6765 0))(
  ( (Nil!6762) (Cons!6761 (h!7617 (_ BitVec 64)) (t!11930 List!6765)) )
))
(declare-fun arrayNoDuplicates!0 (array!24469 (_ BitVec 32) List!6765) Bool)

(assert (=> b!406045 (= res!234554 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6762))))

(declare-fun b!406046 () Bool)

(declare-fun res!234553 () Bool)

(assert (=> b!406046 (=> (not res!234553) (not e!244004))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406046 (= res!234553 (validKeyInArray!0 k0!794))))

(declare-fun b!406047 () Bool)

(declare-fun e!244006 () Bool)

(assert (=> b!406047 (= e!244004 e!244006)))

(declare-fun res!234551 () Bool)

(assert (=> b!406047 (=> (not res!234551) (not e!244006))))

(declare-fun lt!188236 () array!24469)

(assert (=> b!406047 (= res!234551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188236 mask!1025))))

(assert (=> b!406047 (= lt!188236 (array!24470 (store (arr!11684 _keys!709) i!563 k0!794) (size!12037 _keys!709)))))

(declare-fun b!406048 () Bool)

(assert (=> b!406048 (= e!244006 false)))

(declare-fun lt!188237 () Bool)

(assert (=> b!406048 (= lt!188237 (arrayNoDuplicates!0 lt!188236 #b00000000000000000000000000000000 Nil!6762))))

(declare-fun b!406049 () Bool)

(declare-fun e!244007 () Bool)

(declare-fun tp_is_empty!10297 () Bool)

(assert (=> b!406049 (= e!244007 tp_is_empty!10297)))

(declare-fun b!406051 () Bool)

(declare-fun res!234555 () Bool)

(assert (=> b!406051 (=> (not res!234555) (not e!244004))))

(declare-fun arrayContainsKey!0 (array!24469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406051 (= res!234555 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17067 () Bool)

(declare-fun mapRes!17067 () Bool)

(declare-fun tp!33186 () Bool)

(declare-fun e!244005 () Bool)

(assert (=> mapNonEmpty!17067 (= mapRes!17067 (and tp!33186 e!244005))))

(declare-fun mapKey!17067 () (_ BitVec 32))

(declare-fun mapRest!17067 () (Array (_ BitVec 32) ValueCell!4805))

(declare-fun mapValue!17067 () ValueCell!4805)

(assert (=> mapNonEmpty!17067 (= (arr!11685 _values!549) (store mapRest!17067 mapKey!17067 mapValue!17067))))

(declare-fun b!406052 () Bool)

(assert (=> b!406052 (= e!244005 tp_is_empty!10297)))

(declare-fun mapIsEmpty!17067 () Bool)

(assert (=> mapIsEmpty!17067 mapRes!17067))

(declare-fun b!406053 () Bool)

(declare-fun e!244008 () Bool)

(assert (=> b!406053 (= e!244008 (and e!244007 mapRes!17067))))

(declare-fun condMapEmpty!17067 () Bool)

(declare-fun mapDefault!17067 () ValueCell!4805)

(assert (=> b!406053 (= condMapEmpty!17067 (= (arr!11685 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4805)) mapDefault!17067)))))

(declare-fun b!406054 () Bool)

(declare-fun res!234556 () Bool)

(assert (=> b!406054 (=> (not res!234556) (not e!244004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406054 (= res!234556 (validMask!0 mask!1025))))

(declare-fun res!234557 () Bool)

(assert (=> start!38864 (=> (not res!234557) (not e!244004))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38864 (= res!234557 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12037 _keys!709))))))

(assert (=> start!38864 e!244004))

(assert (=> start!38864 true))

(declare-fun array_inv!8574 (array!24471) Bool)

(assert (=> start!38864 (and (array_inv!8574 _values!549) e!244008)))

(declare-fun array_inv!8575 (array!24469) Bool)

(assert (=> start!38864 (array_inv!8575 _keys!709)))

(declare-fun b!406050 () Bool)

(declare-fun res!234549 () Bool)

(assert (=> b!406050 (=> (not res!234549) (not e!244004))))

(assert (=> b!406050 (= res!234549 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12037 _keys!709))))))

(assert (= (and start!38864 res!234557) b!406054))

(assert (= (and b!406054 res!234556) b!406043))

(assert (= (and b!406043 res!234552) b!406042))

(assert (= (and b!406042 res!234550) b!406045))

(assert (= (and b!406045 res!234554) b!406050))

(assert (= (and b!406050 res!234549) b!406046))

(assert (= (and b!406046 res!234553) b!406044))

(assert (= (and b!406044 res!234558) b!406051))

(assert (= (and b!406051 res!234555) b!406047))

(assert (= (and b!406047 res!234551) b!406048))

(assert (= (and b!406053 condMapEmpty!17067) mapIsEmpty!17067))

(assert (= (and b!406053 (not condMapEmpty!17067)) mapNonEmpty!17067))

(get-info :version)

(assert (= (and mapNonEmpty!17067 ((_ is ValueCellFull!4805) mapValue!17067)) b!406052))

(assert (= (and b!406053 ((_ is ValueCellFull!4805) mapDefault!17067)) b!406049))

(assert (= start!38864 b!406053))

(declare-fun m!397707 () Bool)

(assert (=> b!406047 m!397707))

(declare-fun m!397709 () Bool)

(assert (=> b!406047 m!397709))

(declare-fun m!397711 () Bool)

(assert (=> b!406042 m!397711))

(declare-fun m!397713 () Bool)

(assert (=> start!38864 m!397713))

(declare-fun m!397715 () Bool)

(assert (=> start!38864 m!397715))

(declare-fun m!397717 () Bool)

(assert (=> b!406045 m!397717))

(declare-fun m!397719 () Bool)

(assert (=> b!406051 m!397719))

(declare-fun m!397721 () Bool)

(assert (=> b!406046 m!397721))

(declare-fun m!397723 () Bool)

(assert (=> b!406048 m!397723))

(declare-fun m!397725 () Bool)

(assert (=> b!406044 m!397725))

(declare-fun m!397727 () Bool)

(assert (=> b!406054 m!397727))

(declare-fun m!397729 () Bool)

(assert (=> mapNonEmpty!17067 m!397729))

(check-sat (not b!406046) (not start!38864) tp_is_empty!10297 (not b!406048) (not b!406047) (not b!406054) (not b!406045) (not b!406042) (not b!406051) (not mapNonEmpty!17067))
(check-sat)
