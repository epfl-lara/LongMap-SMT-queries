; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38990 () Bool)

(assert start!38990)

(declare-fun b!408722 () Bool)

(declare-fun e!245284 () Bool)

(assert (=> b!408722 (= e!245284 false)))

(declare-fun lt!188867 () Bool)

(declare-datatypes ((array!24720 0))(
  ( (array!24721 (arr!11809 (Array (_ BitVec 32) (_ BitVec 64))) (size!12161 (_ BitVec 32))) )
))
(declare-fun lt!188868 () array!24720)

(declare-datatypes ((List!6714 0))(
  ( (Nil!6711) (Cons!6710 (h!7566 (_ BitVec 64)) (t!11880 List!6714)) )
))
(declare-fun arrayNoDuplicates!0 (array!24720 (_ BitVec 32) List!6714) Bool)

(assert (=> b!408722 (= lt!188867 (arrayNoDuplicates!0 lt!188868 #b00000000000000000000000000000000 Nil!6711))))

(declare-fun b!408723 () Bool)

(declare-fun e!245283 () Bool)

(declare-fun tp_is_empty!10423 () Bool)

(assert (=> b!408723 (= e!245283 tp_is_empty!10423)))

(declare-fun b!408724 () Bool)

(declare-fun res!236569 () Bool)

(declare-fun e!245280 () Bool)

(assert (=> b!408724 (=> (not res!236569) (not e!245280))))

(declare-fun _keys!709 () array!24720)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24720 (_ BitVec 32)) Bool)

(assert (=> b!408724 (= res!236569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408725 () Bool)

(declare-fun res!236571 () Bool)

(assert (=> b!408725 (=> (not res!236571) (not e!245280))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15003 0))(
  ( (V!15004 (val!5256 Int)) )
))
(declare-datatypes ((ValueCell!4868 0))(
  ( (ValueCellFull!4868 (v!7504 V!15003)) (EmptyCell!4868) )
))
(declare-datatypes ((array!24722 0))(
  ( (array!24723 (arr!11810 (Array (_ BitVec 32) ValueCell!4868)) (size!12162 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24722)

(assert (=> b!408725 (= res!236571 (and (= (size!12162 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12161 _keys!709) (size!12162 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17256 () Bool)

(declare-fun mapRes!17256 () Bool)

(assert (=> mapIsEmpty!17256 mapRes!17256))

(declare-fun b!408726 () Bool)

(declare-fun res!236568 () Bool)

(assert (=> b!408726 (=> (not res!236568) (not e!245280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408726 (= res!236568 (validMask!0 mask!1025))))

(declare-fun b!408727 () Bool)

(declare-fun res!236566 () Bool)

(assert (=> b!408727 (=> (not res!236566) (not e!245280))))

(assert (=> b!408727 (= res!236566 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6711))))

(declare-fun b!408728 () Bool)

(declare-fun res!236567 () Bool)

(assert (=> b!408728 (=> (not res!236567) (not e!245280))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408728 (= res!236567 (or (= (select (arr!11809 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11809 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408729 () Bool)

(assert (=> b!408729 (= e!245280 e!245284)))

(declare-fun res!236570 () Bool)

(assert (=> b!408729 (=> (not res!236570) (not e!245284))))

(assert (=> b!408729 (= res!236570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188868 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!408729 (= lt!188868 (array!24721 (store (arr!11809 _keys!709) i!563 k0!794) (size!12161 _keys!709)))))

(declare-fun b!408730 () Bool)

(declare-fun e!245282 () Bool)

(assert (=> b!408730 (= e!245282 tp_is_empty!10423)))

(declare-fun b!408731 () Bool)

(declare-fun e!245279 () Bool)

(assert (=> b!408731 (= e!245279 (and e!245282 mapRes!17256))))

(declare-fun condMapEmpty!17256 () Bool)

(declare-fun mapDefault!17256 () ValueCell!4868)

(assert (=> b!408731 (= condMapEmpty!17256 (= (arr!11810 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4868)) mapDefault!17256)))))

(declare-fun b!408732 () Bool)

(declare-fun res!236565 () Bool)

(assert (=> b!408732 (=> (not res!236565) (not e!245280))))

(declare-fun arrayContainsKey!0 (array!24720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408732 (= res!236565 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408721 () Bool)

(declare-fun res!236573 () Bool)

(assert (=> b!408721 (=> (not res!236573) (not e!245280))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408721 (= res!236573 (validKeyInArray!0 k0!794))))

(declare-fun res!236572 () Bool)

(assert (=> start!38990 (=> (not res!236572) (not e!245280))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38990 (= res!236572 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12161 _keys!709))))))

(assert (=> start!38990 e!245280))

(assert (=> start!38990 true))

(declare-fun array_inv!8704 (array!24722) Bool)

(assert (=> start!38990 (and (array_inv!8704 _values!549) e!245279)))

(declare-fun array_inv!8705 (array!24720) Bool)

(assert (=> start!38990 (array_inv!8705 _keys!709)))

(declare-fun mapNonEmpty!17256 () Bool)

(declare-fun tp!33375 () Bool)

(assert (=> mapNonEmpty!17256 (= mapRes!17256 (and tp!33375 e!245283))))

(declare-fun mapValue!17256 () ValueCell!4868)

(declare-fun mapKey!17256 () (_ BitVec 32))

(declare-fun mapRest!17256 () (Array (_ BitVec 32) ValueCell!4868))

(assert (=> mapNonEmpty!17256 (= (arr!11810 _values!549) (store mapRest!17256 mapKey!17256 mapValue!17256))))

(declare-fun b!408733 () Bool)

(declare-fun res!236574 () Bool)

(assert (=> b!408733 (=> (not res!236574) (not e!245280))))

(assert (=> b!408733 (= res!236574 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12161 _keys!709))))))

(assert (= (and start!38990 res!236572) b!408726))

(assert (= (and b!408726 res!236568) b!408725))

(assert (= (and b!408725 res!236571) b!408724))

(assert (= (and b!408724 res!236569) b!408727))

(assert (= (and b!408727 res!236566) b!408733))

(assert (= (and b!408733 res!236574) b!408721))

(assert (= (and b!408721 res!236573) b!408728))

(assert (= (and b!408728 res!236567) b!408732))

(assert (= (and b!408732 res!236565) b!408729))

(assert (= (and b!408729 res!236570) b!408722))

(assert (= (and b!408731 condMapEmpty!17256) mapIsEmpty!17256))

(assert (= (and b!408731 (not condMapEmpty!17256)) mapNonEmpty!17256))

(get-info :version)

(assert (= (and mapNonEmpty!17256 ((_ is ValueCellFull!4868) mapValue!17256)) b!408723))

(assert (= (and b!408731 ((_ is ValueCellFull!4868) mapDefault!17256)) b!408730))

(assert (= start!38990 b!408731))

(declare-fun m!400173 () Bool)

(assert (=> b!408726 m!400173))

(declare-fun m!400175 () Bool)

(assert (=> b!408732 m!400175))

(declare-fun m!400177 () Bool)

(assert (=> b!408728 m!400177))

(declare-fun m!400179 () Bool)

(assert (=> b!408724 m!400179))

(declare-fun m!400181 () Bool)

(assert (=> start!38990 m!400181))

(declare-fun m!400183 () Bool)

(assert (=> start!38990 m!400183))

(declare-fun m!400185 () Bool)

(assert (=> mapNonEmpty!17256 m!400185))

(declare-fun m!400187 () Bool)

(assert (=> b!408727 m!400187))

(declare-fun m!400189 () Bool)

(assert (=> b!408729 m!400189))

(declare-fun m!400191 () Bool)

(assert (=> b!408729 m!400191))

(declare-fun m!400193 () Bool)

(assert (=> b!408722 m!400193))

(declare-fun m!400195 () Bool)

(assert (=> b!408721 m!400195))

(check-sat (not b!408729) (not b!408732) tp_is_empty!10423 (not start!38990) (not b!408727) (not b!408724) (not b!408722) (not mapNonEmpty!17256) (not b!408726) (not b!408721))
(check-sat)
