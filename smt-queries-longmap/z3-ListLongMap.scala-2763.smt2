; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40416 () Bool)

(assert start!40416)

(declare-fun b!444682 () Bool)

(declare-fun e!261476 () Bool)

(declare-fun tp_is_empty!11815 () Bool)

(assert (=> b!444682 (= e!261476 tp_is_empty!11815)))

(declare-fun mapNonEmpty!19350 () Bool)

(declare-fun mapRes!19350 () Bool)

(declare-fun tp!37332 () Bool)

(declare-fun e!261475 () Bool)

(assert (=> mapNonEmpty!19350 (= mapRes!19350 (and tp!37332 e!261475))))

(declare-datatypes ((V!16859 0))(
  ( (V!16860 (val!5952 Int)) )
))
(declare-datatypes ((ValueCell!5564 0))(
  ( (ValueCellFull!5564 (v!8204 V!16859)) (EmptyCell!5564) )
))
(declare-fun mapValue!19350 () ValueCell!5564)

(declare-datatypes ((array!27444 0))(
  ( (array!27445 (arr!13169 (Array (_ BitVec 32) ValueCell!5564)) (size!13521 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27444)

(declare-fun mapKey!19350 () (_ BitVec 32))

(declare-fun mapRest!19350 () (Array (_ BitVec 32) ValueCell!5564))

(assert (=> mapNonEmpty!19350 (= (arr!13169 _values!549) (store mapRest!19350 mapKey!19350 mapValue!19350))))

(declare-fun b!444683 () Bool)

(declare-fun res!263764 () Bool)

(declare-fun e!261480 () Bool)

(assert (=> b!444683 (=> (not res!263764) (not e!261480))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27446 0))(
  ( (array!27447 (arr!13170 (Array (_ BitVec 32) (_ BitVec 64))) (size!13522 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27446)

(assert (=> b!444683 (= res!263764 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13522 _keys!709))))))

(declare-fun b!444684 () Bool)

(declare-fun e!261478 () Bool)

(assert (=> b!444684 (= e!261478 false)))

(declare-fun lt!203556 () Bool)

(declare-fun lt!203555 () array!27446)

(declare-datatypes ((List!7790 0))(
  ( (Nil!7787) (Cons!7786 (h!8642 (_ BitVec 64)) (t!13540 List!7790)) )
))
(declare-fun arrayNoDuplicates!0 (array!27446 (_ BitVec 32) List!7790) Bool)

(assert (=> b!444684 (= lt!203556 (arrayNoDuplicates!0 lt!203555 #b00000000000000000000000000000000 Nil!7787))))

(declare-fun mapIsEmpty!19350 () Bool)

(assert (=> mapIsEmpty!19350 mapRes!19350))

(declare-fun b!444685 () Bool)

(declare-fun res!263758 () Bool)

(assert (=> b!444685 (=> (not res!263758) (not e!261480))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444685 (= res!263758 (validKeyInArray!0 k0!794))))

(declare-fun b!444686 () Bool)

(declare-fun res!263760 () Bool)

(assert (=> b!444686 (=> (not res!263760) (not e!261480))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!444686 (= res!263760 (and (= (size!13521 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13522 _keys!709) (size!13521 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444687 () Bool)

(declare-fun res!263767 () Bool)

(assert (=> b!444687 (=> (not res!263767) (not e!261480))))

(assert (=> b!444687 (= res!263767 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7787))))

(declare-fun b!444688 () Bool)

(declare-fun res!263766 () Bool)

(assert (=> b!444688 (=> (not res!263766) (not e!261480))))

(declare-fun arrayContainsKey!0 (array!27446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444688 (= res!263766 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444689 () Bool)

(assert (=> b!444689 (= e!261475 tp_is_empty!11815)))

(declare-fun b!444690 () Bool)

(assert (=> b!444690 (= e!261480 e!261478)))

(declare-fun res!263765 () Bool)

(assert (=> b!444690 (=> (not res!263765) (not e!261478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27446 (_ BitVec 32)) Bool)

(assert (=> b!444690 (= res!263765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203555 mask!1025))))

(assert (=> b!444690 (= lt!203555 (array!27447 (store (arr!13170 _keys!709) i!563 k0!794) (size!13522 _keys!709)))))

(declare-fun b!444691 () Bool)

(declare-fun res!263763 () Bool)

(assert (=> b!444691 (=> (not res!263763) (not e!261480))))

(assert (=> b!444691 (= res!263763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444692 () Bool)

(declare-fun e!261479 () Bool)

(assert (=> b!444692 (= e!261479 (and e!261476 mapRes!19350))))

(declare-fun condMapEmpty!19350 () Bool)

(declare-fun mapDefault!19350 () ValueCell!5564)

(assert (=> b!444692 (= condMapEmpty!19350 (= (arr!13169 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5564)) mapDefault!19350)))))

(declare-fun res!263759 () Bool)

(assert (=> start!40416 (=> (not res!263759) (not e!261480))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40416 (= res!263759 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13522 _keys!709))))))

(assert (=> start!40416 e!261480))

(assert (=> start!40416 true))

(declare-fun array_inv!9628 (array!27444) Bool)

(assert (=> start!40416 (and (array_inv!9628 _values!549) e!261479)))

(declare-fun array_inv!9629 (array!27446) Bool)

(assert (=> start!40416 (array_inv!9629 _keys!709)))

(declare-fun b!444693 () Bool)

(declare-fun res!263762 () Bool)

(assert (=> b!444693 (=> (not res!263762) (not e!261480))))

(assert (=> b!444693 (= res!263762 (or (= (select (arr!13170 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13170 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444694 () Bool)

(declare-fun res!263761 () Bool)

(assert (=> b!444694 (=> (not res!263761) (not e!261480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444694 (= res!263761 (validMask!0 mask!1025))))

(assert (= (and start!40416 res!263759) b!444694))

(assert (= (and b!444694 res!263761) b!444686))

(assert (= (and b!444686 res!263760) b!444691))

(assert (= (and b!444691 res!263763) b!444687))

(assert (= (and b!444687 res!263767) b!444683))

(assert (= (and b!444683 res!263764) b!444685))

(assert (= (and b!444685 res!263758) b!444693))

(assert (= (and b!444693 res!263762) b!444688))

(assert (= (and b!444688 res!263766) b!444690))

(assert (= (and b!444690 res!263765) b!444684))

(assert (= (and b!444692 condMapEmpty!19350) mapIsEmpty!19350))

(assert (= (and b!444692 (not condMapEmpty!19350)) mapNonEmpty!19350))

(get-info :version)

(assert (= (and mapNonEmpty!19350 ((_ is ValueCellFull!5564) mapValue!19350)) b!444689))

(assert (= (and b!444692 ((_ is ValueCellFull!5564) mapDefault!19350)) b!444682))

(assert (= start!40416 b!444692))

(declare-fun m!430719 () Bool)

(assert (=> b!444690 m!430719))

(declare-fun m!430721 () Bool)

(assert (=> b!444690 m!430721))

(declare-fun m!430723 () Bool)

(assert (=> b!444688 m!430723))

(declare-fun m!430725 () Bool)

(assert (=> b!444685 m!430725))

(declare-fun m!430727 () Bool)

(assert (=> b!444694 m!430727))

(declare-fun m!430729 () Bool)

(assert (=> b!444687 m!430729))

(declare-fun m!430731 () Bool)

(assert (=> b!444693 m!430731))

(declare-fun m!430733 () Bool)

(assert (=> b!444684 m!430733))

(declare-fun m!430735 () Bool)

(assert (=> mapNonEmpty!19350 m!430735))

(declare-fun m!430737 () Bool)

(assert (=> b!444691 m!430737))

(declare-fun m!430739 () Bool)

(assert (=> start!40416 m!430739))

(declare-fun m!430741 () Bool)

(assert (=> start!40416 m!430741))

(check-sat (not b!444690) (not b!444694) (not b!444688) (not b!444684) tp_is_empty!11815 (not start!40416) (not mapNonEmpty!19350) (not b!444691) (not b!444687) (not b!444685))
(check-sat)
