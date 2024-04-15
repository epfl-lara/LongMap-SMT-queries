; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38846 () Bool)

(assert start!38846)

(declare-fun b!405691 () Bool)

(declare-fun res!234279 () Bool)

(declare-fun e!243841 () Bool)

(assert (=> b!405691 (=> (not res!234279) (not e!243841))))

(declare-datatypes ((array!24433 0))(
  ( (array!24434 (arr!11666 (Array (_ BitVec 32) (_ BitVec 64))) (size!12019 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24433)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405691 (= res!234279 (or (= (select (arr!11666 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11666 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405692 () Bool)

(declare-fun res!234280 () Bool)

(assert (=> b!405692 (=> (not res!234280) (not e!243841))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24433 (_ BitVec 32)) Bool)

(assert (=> b!405692 (= res!234280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17040 () Bool)

(declare-fun mapRes!17040 () Bool)

(assert (=> mapIsEmpty!17040 mapRes!17040))

(declare-fun b!405693 () Bool)

(declare-fun e!243845 () Bool)

(declare-fun tp_is_empty!10279 () Bool)

(assert (=> b!405693 (= e!243845 tp_is_empty!10279)))

(declare-fun b!405694 () Bool)

(declare-fun res!234281 () Bool)

(assert (=> b!405694 (=> (not res!234281) (not e!243841))))

(assert (=> b!405694 (= res!234281 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12019 _keys!709))))))

(declare-fun b!405695 () Bool)

(declare-fun res!234288 () Bool)

(assert (=> b!405695 (=> (not res!234288) (not e!243841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405695 (= res!234288 (validMask!0 mask!1025))))

(declare-fun b!405696 () Bool)

(declare-fun res!234283 () Bool)

(assert (=> b!405696 (=> (not res!234283) (not e!243841))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405696 (= res!234283 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17040 () Bool)

(declare-fun tp!33159 () Bool)

(assert (=> mapNonEmpty!17040 (= mapRes!17040 (and tp!33159 e!243845))))

(declare-datatypes ((V!14811 0))(
  ( (V!14812 (val!5184 Int)) )
))
(declare-datatypes ((ValueCell!4796 0))(
  ( (ValueCellFull!4796 (v!7425 V!14811)) (EmptyCell!4796) )
))
(declare-datatypes ((array!24435 0))(
  ( (array!24436 (arr!11667 (Array (_ BitVec 32) ValueCell!4796)) (size!12020 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24435)

(declare-fun mapValue!17040 () ValueCell!4796)

(declare-fun mapKey!17040 () (_ BitVec 32))

(declare-fun mapRest!17040 () (Array (_ BitVec 32) ValueCell!4796))

(assert (=> mapNonEmpty!17040 (= (arr!11667 _values!549) (store mapRest!17040 mapKey!17040 mapValue!17040))))

(declare-fun b!405697 () Bool)

(declare-fun res!234284 () Bool)

(assert (=> b!405697 (=> (not res!234284) (not e!243841))))

(declare-datatypes ((List!6757 0))(
  ( (Nil!6754) (Cons!6753 (h!7609 (_ BitVec 64)) (t!11922 List!6757)) )
))
(declare-fun arrayNoDuplicates!0 (array!24433 (_ BitVec 32) List!6757) Bool)

(assert (=> b!405697 (= res!234284 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6754))))

(declare-fun res!234282 () Bool)

(assert (=> start!38846 (=> (not res!234282) (not e!243841))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38846 (= res!234282 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12019 _keys!709))))))

(assert (=> start!38846 e!243841))

(assert (=> start!38846 true))

(declare-fun e!243843 () Bool)

(declare-fun array_inv!8558 (array!24435) Bool)

(assert (=> start!38846 (and (array_inv!8558 _values!549) e!243843)))

(declare-fun array_inv!8559 (array!24433) Bool)

(assert (=> start!38846 (array_inv!8559 _keys!709)))

(declare-fun b!405698 () Bool)

(declare-fun e!243846 () Bool)

(assert (=> b!405698 (= e!243841 e!243846)))

(declare-fun res!234285 () Bool)

(assert (=> b!405698 (=> (not res!234285) (not e!243846))))

(declare-fun lt!188183 () array!24433)

(assert (=> b!405698 (= res!234285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188183 mask!1025))))

(assert (=> b!405698 (= lt!188183 (array!24434 (store (arr!11666 _keys!709) i!563 k0!794) (size!12019 _keys!709)))))

(declare-fun b!405699 () Bool)

(declare-fun e!243842 () Bool)

(assert (=> b!405699 (= e!243842 tp_is_empty!10279)))

(declare-fun b!405700 () Bool)

(declare-fun res!234287 () Bool)

(assert (=> b!405700 (=> (not res!234287) (not e!243841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405700 (= res!234287 (validKeyInArray!0 k0!794))))

(declare-fun b!405701 () Bool)

(assert (=> b!405701 (= e!243843 (and e!243842 mapRes!17040))))

(declare-fun condMapEmpty!17040 () Bool)

(declare-fun mapDefault!17040 () ValueCell!4796)

(assert (=> b!405701 (= condMapEmpty!17040 (= (arr!11667 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4796)) mapDefault!17040)))))

(declare-fun b!405702 () Bool)

(assert (=> b!405702 (= e!243846 false)))

(declare-fun lt!188182 () Bool)

(assert (=> b!405702 (= lt!188182 (arrayNoDuplicates!0 lt!188183 #b00000000000000000000000000000000 Nil!6754))))

(declare-fun b!405703 () Bool)

(declare-fun res!234286 () Bool)

(assert (=> b!405703 (=> (not res!234286) (not e!243841))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!405703 (= res!234286 (and (= (size!12020 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12019 _keys!709) (size!12020 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38846 res!234282) b!405695))

(assert (= (and b!405695 res!234288) b!405703))

(assert (= (and b!405703 res!234286) b!405692))

(assert (= (and b!405692 res!234280) b!405697))

(assert (= (and b!405697 res!234284) b!405694))

(assert (= (and b!405694 res!234281) b!405700))

(assert (= (and b!405700 res!234287) b!405691))

(assert (= (and b!405691 res!234279) b!405696))

(assert (= (and b!405696 res!234283) b!405698))

(assert (= (and b!405698 res!234285) b!405702))

(assert (= (and b!405701 condMapEmpty!17040) mapIsEmpty!17040))

(assert (= (and b!405701 (not condMapEmpty!17040)) mapNonEmpty!17040))

(get-info :version)

(assert (= (and mapNonEmpty!17040 ((_ is ValueCellFull!4796) mapValue!17040)) b!405693))

(assert (= (and b!405701 ((_ is ValueCellFull!4796) mapDefault!17040)) b!405699))

(assert (= start!38846 b!405701))

(declare-fun m!397491 () Bool)

(assert (=> b!405697 m!397491))

(declare-fun m!397493 () Bool)

(assert (=> b!405698 m!397493))

(declare-fun m!397495 () Bool)

(assert (=> b!405698 m!397495))

(declare-fun m!397497 () Bool)

(assert (=> b!405695 m!397497))

(declare-fun m!397499 () Bool)

(assert (=> b!405696 m!397499))

(declare-fun m!397501 () Bool)

(assert (=> b!405692 m!397501))

(declare-fun m!397503 () Bool)

(assert (=> start!38846 m!397503))

(declare-fun m!397505 () Bool)

(assert (=> start!38846 m!397505))

(declare-fun m!397507 () Bool)

(assert (=> b!405702 m!397507))

(declare-fun m!397509 () Bool)

(assert (=> b!405700 m!397509))

(declare-fun m!397511 () Bool)

(assert (=> b!405691 m!397511))

(declare-fun m!397513 () Bool)

(assert (=> mapNonEmpty!17040 m!397513))

(check-sat (not b!405695) (not b!405698) (not b!405702) (not b!405697) (not start!38846) (not b!405692) (not b!405696) tp_is_empty!10279 (not b!405700) (not mapNonEmpty!17040))
(check-sat)
