; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38816 () Bool)

(assert start!38816)

(declare-fun b!405328 () Bool)

(declare-fun e!243718 () Bool)

(declare-fun e!243716 () Bool)

(declare-fun mapRes!16995 () Bool)

(assert (=> b!405328 (= e!243718 (and e!243716 mapRes!16995))))

(declare-fun condMapEmpty!16995 () Bool)

(declare-datatypes ((V!14771 0))(
  ( (V!14772 (val!5169 Int)) )
))
(declare-datatypes ((ValueCell!4781 0))(
  ( (ValueCellFull!4781 (v!7417 V!14771)) (EmptyCell!4781) )
))
(declare-datatypes ((array!24378 0))(
  ( (array!24379 (arr!11638 (Array (_ BitVec 32) ValueCell!4781)) (size!11990 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24378)

(declare-fun mapDefault!16995 () ValueCell!4781)

(assert (=> b!405328 (= condMapEmpty!16995 (= (arr!11638 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4781)) mapDefault!16995)))))

(declare-fun res!233963 () Bool)

(declare-fun e!243717 () Bool)

(assert (=> start!38816 (=> (not res!233963) (not e!243717))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24380 0))(
  ( (array!24381 (arr!11639 (Array (_ BitVec 32) (_ BitVec 64))) (size!11991 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24380)

(assert (=> start!38816 (= res!233963 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11991 _keys!709))))))

(assert (=> start!38816 e!243717))

(assert (=> start!38816 true))

(declare-fun array_inv!8598 (array!24378) Bool)

(assert (=> start!38816 (and (array_inv!8598 _values!549) e!243718)))

(declare-fun array_inv!8599 (array!24380) Bool)

(assert (=> start!38816 (array_inv!8599 _keys!709)))

(declare-fun b!405329 () Bool)

(declare-fun res!233962 () Bool)

(assert (=> b!405329 (=> (not res!233962) (not e!243717))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!405329 (= res!233962 (and (= (size!11990 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11991 _keys!709) (size!11990 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405330 () Bool)

(declare-fun res!233959 () Bool)

(assert (=> b!405330 (=> (not res!233959) (not e!243717))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405330 (= res!233959 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16995 () Bool)

(declare-fun tp!33114 () Bool)

(declare-fun e!243715 () Bool)

(assert (=> mapNonEmpty!16995 (= mapRes!16995 (and tp!33114 e!243715))))

(declare-fun mapRest!16995 () (Array (_ BitVec 32) ValueCell!4781))

(declare-fun mapKey!16995 () (_ BitVec 32))

(declare-fun mapValue!16995 () ValueCell!4781)

(assert (=> mapNonEmpty!16995 (= (arr!11638 _values!549) (store mapRest!16995 mapKey!16995 mapValue!16995))))

(declare-fun b!405331 () Bool)

(declare-fun tp_is_empty!10249 () Bool)

(assert (=> b!405331 (= e!243716 tp_is_empty!10249)))

(declare-fun b!405332 () Bool)

(declare-fun res!233957 () Bool)

(assert (=> b!405332 (=> (not res!233957) (not e!243717))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405332 (= res!233957 (or (= (select (arr!11639 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11639 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405333 () Bool)

(assert (=> b!405333 (= e!243715 tp_is_empty!10249)))

(declare-fun b!405334 () Bool)

(declare-fun e!243714 () Bool)

(assert (=> b!405334 (= e!243717 e!243714)))

(declare-fun res!233964 () Bool)

(assert (=> b!405334 (=> (not res!233964) (not e!243714))))

(declare-fun lt!188346 () array!24380)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24380 (_ BitVec 32)) Bool)

(assert (=> b!405334 (= res!233964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188346 mask!1025))))

(assert (=> b!405334 (= lt!188346 (array!24381 (store (arr!11639 _keys!709) i!563 k0!794) (size!11991 _keys!709)))))

(declare-fun b!405335 () Bool)

(declare-fun res!233955 () Bool)

(assert (=> b!405335 (=> (not res!233955) (not e!243717))))

(assert (=> b!405335 (= res!233955 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11991 _keys!709))))))

(declare-fun b!405336 () Bool)

(declare-fun res!233956 () Bool)

(assert (=> b!405336 (=> (not res!233956) (not e!243717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405336 (= res!233956 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!16995 () Bool)

(assert (=> mapIsEmpty!16995 mapRes!16995))

(declare-fun b!405337 () Bool)

(declare-fun res!233958 () Bool)

(assert (=> b!405337 (=> (not res!233958) (not e!243717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405337 (= res!233958 (validMask!0 mask!1025))))

(declare-fun b!405338 () Bool)

(declare-fun res!233961 () Bool)

(assert (=> b!405338 (=> (not res!233961) (not e!243717))))

(assert (=> b!405338 (= res!233961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405339 () Bool)

(declare-fun res!233960 () Bool)

(assert (=> b!405339 (=> (not res!233960) (not e!243717))))

(declare-datatypes ((List!6647 0))(
  ( (Nil!6644) (Cons!6643 (h!7499 (_ BitVec 64)) (t!11813 List!6647)) )
))
(declare-fun arrayNoDuplicates!0 (array!24380 (_ BitVec 32) List!6647) Bool)

(assert (=> b!405339 (= res!233960 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6644))))

(declare-fun b!405340 () Bool)

(assert (=> b!405340 (= e!243714 false)))

(declare-fun lt!188345 () Bool)

(assert (=> b!405340 (= lt!188345 (arrayNoDuplicates!0 lt!188346 #b00000000000000000000000000000000 Nil!6644))))

(assert (= (and start!38816 res!233963) b!405337))

(assert (= (and b!405337 res!233958) b!405329))

(assert (= (and b!405329 res!233962) b!405338))

(assert (= (and b!405338 res!233961) b!405339))

(assert (= (and b!405339 res!233960) b!405335))

(assert (= (and b!405335 res!233955) b!405336))

(assert (= (and b!405336 res!233956) b!405332))

(assert (= (and b!405332 res!233957) b!405330))

(assert (= (and b!405330 res!233959) b!405334))

(assert (= (and b!405334 res!233964) b!405340))

(assert (= (and b!405328 condMapEmpty!16995) mapIsEmpty!16995))

(assert (= (and b!405328 (not condMapEmpty!16995)) mapNonEmpty!16995))

(get-info :version)

(assert (= (and mapNonEmpty!16995 ((_ is ValueCellFull!4781) mapValue!16995)) b!405333))

(assert (= (and b!405328 ((_ is ValueCellFull!4781) mapDefault!16995)) b!405331))

(assert (= start!38816 b!405328))

(declare-fun m!398085 () Bool)

(assert (=> b!405334 m!398085))

(declare-fun m!398087 () Bool)

(assert (=> b!405334 m!398087))

(declare-fun m!398089 () Bool)

(assert (=> b!405330 m!398089))

(declare-fun m!398091 () Bool)

(assert (=> start!38816 m!398091))

(declare-fun m!398093 () Bool)

(assert (=> start!38816 m!398093))

(declare-fun m!398095 () Bool)

(assert (=> mapNonEmpty!16995 m!398095))

(declare-fun m!398097 () Bool)

(assert (=> b!405340 m!398097))

(declare-fun m!398099 () Bool)

(assert (=> b!405338 m!398099))

(declare-fun m!398101 () Bool)

(assert (=> b!405337 m!398101))

(declare-fun m!398103 () Bool)

(assert (=> b!405332 m!398103))

(declare-fun m!398105 () Bool)

(assert (=> b!405336 m!398105))

(declare-fun m!398107 () Bool)

(assert (=> b!405339 m!398107))

(check-sat (not b!405340) tp_is_empty!10249 (not b!405334) (not b!405330) (not b!405337) (not mapNonEmpty!16995) (not b!405336) (not b!405339) (not b!405338) (not start!38816))
(check-sat)
