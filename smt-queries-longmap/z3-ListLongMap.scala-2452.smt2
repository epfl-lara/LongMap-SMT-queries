; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38516 () Bool)

(assert start!38516)

(declare-fun b!398182 () Bool)

(declare-fun e!240691 () Bool)

(declare-fun e!240694 () Bool)

(declare-fun mapRes!16545 () Bool)

(assert (=> b!398182 (= e!240691 (and e!240694 mapRes!16545))))

(declare-fun condMapEmpty!16545 () Bool)

(declare-datatypes ((V!14371 0))(
  ( (V!14372 (val!5019 Int)) )
))
(declare-datatypes ((ValueCell!4631 0))(
  ( (ValueCellFull!4631 (v!7267 V!14371)) (EmptyCell!4631) )
))
(declare-datatypes ((array!23790 0))(
  ( (array!23791 (arr!11344 (Array (_ BitVec 32) ValueCell!4631)) (size!11696 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23790)

(declare-fun mapDefault!16545 () ValueCell!4631)

(assert (=> b!398182 (= condMapEmpty!16545 (= (arr!11344 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4631)) mapDefault!16545)))))

(declare-fun mapNonEmpty!16545 () Bool)

(declare-fun tp!32340 () Bool)

(declare-fun e!240690 () Bool)

(assert (=> mapNonEmpty!16545 (= mapRes!16545 (and tp!32340 e!240690))))

(declare-fun mapKey!16545 () (_ BitVec 32))

(declare-fun mapRest!16545 () (Array (_ BitVec 32) ValueCell!4631))

(declare-fun mapValue!16545 () ValueCell!4631)

(assert (=> mapNonEmpty!16545 (= (arr!11344 _values!549) (store mapRest!16545 mapKey!16545 mapValue!16545))))

(declare-fun b!398183 () Bool)

(declare-fun res!228814 () Bool)

(declare-fun e!240692 () Bool)

(assert (=> b!398183 (=> (not res!228814) (not e!240692))))

(declare-datatypes ((array!23792 0))(
  ( (array!23793 (arr!11345 (Array (_ BitVec 32) (_ BitVec 64))) (size!11697 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23792)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23792 (_ BitVec 32)) Bool)

(assert (=> b!398183 (= res!228814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!228816 () Bool)

(assert (=> start!38516 (=> (not res!228816) (not e!240692))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38516 (= res!228816 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11697 _keys!709))))))

(assert (=> start!38516 e!240692))

(assert (=> start!38516 true))

(declare-fun array_inv!8380 (array!23790) Bool)

(assert (=> start!38516 (and (array_inv!8380 _values!549) e!240691)))

(declare-fun array_inv!8381 (array!23792) Bool)

(assert (=> start!38516 (array_inv!8381 _keys!709)))

(declare-fun b!398184 () Bool)

(declare-fun res!228813 () Bool)

(assert (=> b!398184 (=> (not res!228813) (not e!240692))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398184 (= res!228813 (or (= (select (arr!11345 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11345 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398185 () Bool)

(declare-fun e!240693 () Bool)

(assert (=> b!398185 (= e!240692 e!240693)))

(declare-fun res!228807 () Bool)

(assert (=> b!398185 (=> (not res!228807) (not e!240693))))

(declare-fun lt!187445 () array!23792)

(assert (=> b!398185 (= res!228807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187445 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!398185 (= lt!187445 (array!23793 (store (arr!11345 _keys!709) i!563 k0!794) (size!11697 _keys!709)))))

(declare-fun b!398186 () Bool)

(declare-fun res!228809 () Bool)

(assert (=> b!398186 (=> (not res!228809) (not e!240692))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!398186 (= res!228809 (and (= (size!11696 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11697 _keys!709) (size!11696 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398187 () Bool)

(declare-fun res!228815 () Bool)

(assert (=> b!398187 (=> (not res!228815) (not e!240692))))

(declare-fun arrayContainsKey!0 (array!23792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398187 (= res!228815 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398188 () Bool)

(declare-fun tp_is_empty!9949 () Bool)

(assert (=> b!398188 (= e!240690 tp_is_empty!9949)))

(declare-fun mapIsEmpty!16545 () Bool)

(assert (=> mapIsEmpty!16545 mapRes!16545))

(declare-fun b!398189 () Bool)

(assert (=> b!398189 (= e!240693 false)))

(declare-fun lt!187446 () Bool)

(declare-datatypes ((List!6425 0))(
  ( (Nil!6422) (Cons!6421 (h!7277 (_ BitVec 64)) (t!11591 List!6425)) )
))
(declare-fun arrayNoDuplicates!0 (array!23792 (_ BitVec 32) List!6425) Bool)

(assert (=> b!398189 (= lt!187446 (arrayNoDuplicates!0 lt!187445 #b00000000000000000000000000000000 Nil!6422))))

(declare-fun b!398190 () Bool)

(declare-fun res!228810 () Bool)

(assert (=> b!398190 (=> (not res!228810) (not e!240692))))

(assert (=> b!398190 (= res!228810 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6422))))

(declare-fun b!398191 () Bool)

(declare-fun res!228812 () Bool)

(assert (=> b!398191 (=> (not res!228812) (not e!240692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398191 (= res!228812 (validKeyInArray!0 k0!794))))

(declare-fun b!398192 () Bool)

(declare-fun res!228811 () Bool)

(assert (=> b!398192 (=> (not res!228811) (not e!240692))))

(assert (=> b!398192 (= res!228811 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11697 _keys!709))))))

(declare-fun b!398193 () Bool)

(assert (=> b!398193 (= e!240694 tp_is_empty!9949)))

(declare-fun b!398194 () Bool)

(declare-fun res!228808 () Bool)

(assert (=> b!398194 (=> (not res!228808) (not e!240692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398194 (= res!228808 (validMask!0 mask!1025))))

(assert (= (and start!38516 res!228816) b!398194))

(assert (= (and b!398194 res!228808) b!398186))

(assert (= (and b!398186 res!228809) b!398183))

(assert (= (and b!398183 res!228814) b!398190))

(assert (= (and b!398190 res!228810) b!398192))

(assert (= (and b!398192 res!228811) b!398191))

(assert (= (and b!398191 res!228812) b!398184))

(assert (= (and b!398184 res!228813) b!398187))

(assert (= (and b!398187 res!228815) b!398185))

(assert (= (and b!398185 res!228807) b!398189))

(assert (= (and b!398182 condMapEmpty!16545) mapIsEmpty!16545))

(assert (= (and b!398182 (not condMapEmpty!16545)) mapNonEmpty!16545))

(get-info :version)

(assert (= (and mapNonEmpty!16545 ((_ is ValueCellFull!4631) mapValue!16545)) b!398188))

(assert (= (and b!398182 ((_ is ValueCellFull!4631) mapDefault!16545)) b!398193))

(assert (= start!38516 b!398182))

(declare-fun m!393405 () Bool)

(assert (=> mapNonEmpty!16545 m!393405))

(declare-fun m!393407 () Bool)

(assert (=> start!38516 m!393407))

(declare-fun m!393409 () Bool)

(assert (=> start!38516 m!393409))

(declare-fun m!393411 () Bool)

(assert (=> b!398184 m!393411))

(declare-fun m!393413 () Bool)

(assert (=> b!398191 m!393413))

(declare-fun m!393415 () Bool)

(assert (=> b!398185 m!393415))

(declare-fun m!393417 () Bool)

(assert (=> b!398185 m!393417))

(declare-fun m!393419 () Bool)

(assert (=> b!398183 m!393419))

(declare-fun m!393421 () Bool)

(assert (=> b!398194 m!393421))

(declare-fun m!393423 () Bool)

(assert (=> b!398189 m!393423))

(declare-fun m!393425 () Bool)

(assert (=> b!398187 m!393425))

(declare-fun m!393427 () Bool)

(assert (=> b!398190 m!393427))

(check-sat (not mapNonEmpty!16545) (not b!398191) (not b!398185) (not b!398187) tp_is_empty!9949 (not b!398183) (not b!398194) (not b!398189) (not b!398190) (not start!38516))
(check-sat)
