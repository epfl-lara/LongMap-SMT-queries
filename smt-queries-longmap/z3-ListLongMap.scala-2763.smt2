; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40416 () Bool)

(assert start!40416)

(declare-fun b!444460 () Bool)

(declare-fun e!261333 () Bool)

(declare-fun e!261337 () Bool)

(assert (=> b!444460 (= e!261333 e!261337)))

(declare-fun res!263638 () Bool)

(assert (=> b!444460 (=> (not res!263638) (not e!261337))))

(declare-datatypes ((array!27443 0))(
  ( (array!27444 (arr!13169 (Array (_ BitVec 32) (_ BitVec 64))) (size!13522 (_ BitVec 32))) )
))
(declare-fun lt!203302 () array!27443)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27443 (_ BitVec 32)) Bool)

(assert (=> b!444460 (= res!263638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203302 mask!1025))))

(declare-fun _keys!709 () array!27443)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444460 (= lt!203302 (array!27444 (store (arr!13169 _keys!709) i!563 k0!794) (size!13522 _keys!709)))))

(declare-fun b!444461 () Bool)

(declare-fun e!261338 () Bool)

(declare-fun tp_is_empty!11815 () Bool)

(assert (=> b!444461 (= e!261338 tp_is_empty!11815)))

(declare-fun b!444462 () Bool)

(declare-fun res!263637 () Bool)

(assert (=> b!444462 (=> (not res!263637) (not e!261333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444462 (= res!263637 (validMask!0 mask!1025))))

(declare-fun b!444463 () Bool)

(declare-fun res!263633 () Bool)

(assert (=> b!444463 (=> (not res!263633) (not e!261333))))

(declare-datatypes ((List!7882 0))(
  ( (Nil!7879) (Cons!7878 (h!8734 (_ BitVec 64)) (t!13631 List!7882)) )
))
(declare-fun arrayNoDuplicates!0 (array!27443 (_ BitVec 32) List!7882) Bool)

(assert (=> b!444463 (= res!263633 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7879))))

(declare-fun b!444464 () Bool)

(declare-fun res!263640 () Bool)

(assert (=> b!444464 (=> (not res!263640) (not e!261333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444464 (= res!263640 (validKeyInArray!0 k0!794))))

(declare-fun b!444465 () Bool)

(declare-fun res!263641 () Bool)

(assert (=> b!444465 (=> (not res!263641) (not e!261333))))

(declare-fun arrayContainsKey!0 (array!27443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444465 (= res!263641 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19350 () Bool)

(declare-fun mapRes!19350 () Bool)

(assert (=> mapIsEmpty!19350 mapRes!19350))

(declare-fun b!444467 () Bool)

(declare-fun e!261335 () Bool)

(assert (=> b!444467 (= e!261335 tp_is_empty!11815)))

(declare-fun b!444468 () Bool)

(declare-fun res!263639 () Bool)

(assert (=> b!444468 (=> (not res!263639) (not e!261333))))

(assert (=> b!444468 (= res!263639 (or (= (select (arr!13169 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13169 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19350 () Bool)

(declare-fun tp!37332 () Bool)

(assert (=> mapNonEmpty!19350 (= mapRes!19350 (and tp!37332 e!261335))))

(declare-fun mapKey!19350 () (_ BitVec 32))

(declare-datatypes ((V!16859 0))(
  ( (V!16860 (val!5952 Int)) )
))
(declare-datatypes ((ValueCell!5564 0))(
  ( (ValueCellFull!5564 (v!8197 V!16859)) (EmptyCell!5564) )
))
(declare-datatypes ((array!27445 0))(
  ( (array!27446 (arr!13170 (Array (_ BitVec 32) ValueCell!5564)) (size!13523 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27445)

(declare-fun mapValue!19350 () ValueCell!5564)

(declare-fun mapRest!19350 () (Array (_ BitVec 32) ValueCell!5564))

(assert (=> mapNonEmpty!19350 (= (arr!13170 _values!549) (store mapRest!19350 mapKey!19350 mapValue!19350))))

(declare-fun b!444469 () Bool)

(declare-fun res!263636 () Bool)

(assert (=> b!444469 (=> (not res!263636) (not e!261333))))

(assert (=> b!444469 (= res!263636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444470 () Bool)

(assert (=> b!444470 (= e!261337 false)))

(declare-fun lt!203303 () Bool)

(assert (=> b!444470 (= lt!203303 (arrayNoDuplicates!0 lt!203302 #b00000000000000000000000000000000 Nil!7879))))

(declare-fun b!444471 () Bool)

(declare-fun res!263635 () Bool)

(assert (=> b!444471 (=> (not res!263635) (not e!261333))))

(assert (=> b!444471 (= res!263635 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13522 _keys!709))))))

(declare-fun b!444472 () Bool)

(declare-fun e!261334 () Bool)

(assert (=> b!444472 (= e!261334 (and e!261338 mapRes!19350))))

(declare-fun condMapEmpty!19350 () Bool)

(declare-fun mapDefault!19350 () ValueCell!5564)

(assert (=> b!444472 (= condMapEmpty!19350 (= (arr!13170 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5564)) mapDefault!19350)))))

(declare-fun res!263632 () Bool)

(assert (=> start!40416 (=> (not res!263632) (not e!261333))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40416 (= res!263632 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13522 _keys!709))))))

(assert (=> start!40416 e!261333))

(assert (=> start!40416 true))

(declare-fun array_inv!9602 (array!27445) Bool)

(assert (=> start!40416 (and (array_inv!9602 _values!549) e!261334)))

(declare-fun array_inv!9603 (array!27443) Bool)

(assert (=> start!40416 (array_inv!9603 _keys!709)))

(declare-fun b!444466 () Bool)

(declare-fun res!263634 () Bool)

(assert (=> b!444466 (=> (not res!263634) (not e!261333))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444466 (= res!263634 (and (= (size!13523 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13522 _keys!709) (size!13523 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40416 res!263632) b!444462))

(assert (= (and b!444462 res!263637) b!444466))

(assert (= (and b!444466 res!263634) b!444469))

(assert (= (and b!444469 res!263636) b!444463))

(assert (= (and b!444463 res!263633) b!444471))

(assert (= (and b!444471 res!263635) b!444464))

(assert (= (and b!444464 res!263640) b!444468))

(assert (= (and b!444468 res!263639) b!444465))

(assert (= (and b!444465 res!263641) b!444460))

(assert (= (and b!444460 res!263638) b!444470))

(assert (= (and b!444472 condMapEmpty!19350) mapIsEmpty!19350))

(assert (= (and b!444472 (not condMapEmpty!19350)) mapNonEmpty!19350))

(get-info :version)

(assert (= (and mapNonEmpty!19350 ((_ is ValueCellFull!5564) mapValue!19350)) b!444467))

(assert (= (and b!444472 ((_ is ValueCellFull!5564) mapDefault!19350)) b!444461))

(assert (= start!40416 b!444472))

(declare-fun m!429769 () Bool)

(assert (=> b!444468 m!429769))

(declare-fun m!429771 () Bool)

(assert (=> start!40416 m!429771))

(declare-fun m!429773 () Bool)

(assert (=> start!40416 m!429773))

(declare-fun m!429775 () Bool)

(assert (=> b!444464 m!429775))

(declare-fun m!429777 () Bool)

(assert (=> b!444463 m!429777))

(declare-fun m!429779 () Bool)

(assert (=> b!444470 m!429779))

(declare-fun m!429781 () Bool)

(assert (=> mapNonEmpty!19350 m!429781))

(declare-fun m!429783 () Bool)

(assert (=> b!444469 m!429783))

(declare-fun m!429785 () Bool)

(assert (=> b!444465 m!429785))

(declare-fun m!429787 () Bool)

(assert (=> b!444460 m!429787))

(declare-fun m!429789 () Bool)

(assert (=> b!444460 m!429789))

(declare-fun m!429791 () Bool)

(assert (=> b!444462 m!429791))

(check-sat (not b!444465) (not mapNonEmpty!19350) (not b!444469) tp_is_empty!11815 (not b!444462) (not b!444460) (not b!444464) (not b!444463) (not start!40416) (not b!444470))
(check-sat)
