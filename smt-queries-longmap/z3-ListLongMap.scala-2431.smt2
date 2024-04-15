; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38342 () Bool)

(assert start!38342)

(declare-fun res!226678 () Bool)

(declare-fun e!239320 () Bool)

(assert (=> start!38342 (=> (not res!226678) (not e!239320))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23541 0))(
  ( (array!23542 (arr!11223 (Array (_ BitVec 32) (_ BitVec 64))) (size!11576 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23541)

(assert (=> start!38342 (= res!226678 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11576 _keys!709))))))

(assert (=> start!38342 e!239320))

(assert (=> start!38342 true))

(declare-datatypes ((V!14203 0))(
  ( (V!14204 (val!4956 Int)) )
))
(declare-datatypes ((ValueCell!4568 0))(
  ( (ValueCellFull!4568 (v!7196 V!14203)) (EmptyCell!4568) )
))
(declare-datatypes ((array!23543 0))(
  ( (array!23544 (arr!11224 (Array (_ BitVec 32) ValueCell!4568)) (size!11577 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23543)

(declare-fun e!239322 () Bool)

(declare-fun array_inv!8238 (array!23543) Bool)

(assert (=> start!38342 (and (array_inv!8238 _values!549) e!239322)))

(declare-fun array_inv!8239 (array!23541) Bool)

(assert (=> start!38342 (array_inv!8239 _keys!709)))

(declare-fun mapNonEmpty!16347 () Bool)

(declare-fun mapRes!16347 () Bool)

(declare-fun tp!32142 () Bool)

(declare-fun e!239321 () Bool)

(assert (=> mapNonEmpty!16347 (= mapRes!16347 (and tp!32142 e!239321))))

(declare-fun mapRest!16347 () (Array (_ BitVec 32) ValueCell!4568))

(declare-fun mapValue!16347 () ValueCell!4568)

(declare-fun mapKey!16347 () (_ BitVec 32))

(assert (=> mapNonEmpty!16347 (= (arr!11224 _values!549) (store mapRest!16347 mapKey!16347 mapValue!16347))))

(declare-fun b!395319 () Bool)

(declare-fun res!226679 () Bool)

(assert (=> b!395319 (=> (not res!226679) (not e!239320))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!395319 (= res!226679 (and (= (size!11577 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11576 _keys!709) (size!11577 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395320 () Bool)

(declare-fun e!239319 () Bool)

(declare-fun tp_is_empty!9823 () Bool)

(assert (=> b!395320 (= e!239319 tp_is_empty!9823)))

(declare-fun b!395321 () Bool)

(declare-fun res!226674 () Bool)

(assert (=> b!395321 (=> (not res!226674) (not e!239320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23541 (_ BitVec 32)) Bool)

(assert (=> b!395321 (= res!226674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395322 () Bool)

(assert (=> b!395322 (= e!239320 (and (= (size!11576 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)) (bvsgt #b00000000000000000000000000000000 (size!11576 _keys!709))))))

(declare-fun mapIsEmpty!16347 () Bool)

(assert (=> mapIsEmpty!16347 mapRes!16347))

(declare-fun b!395323 () Bool)

(declare-fun res!226675 () Bool)

(assert (=> b!395323 (=> (not res!226675) (not e!239320))))

(declare-datatypes ((List!6474 0))(
  ( (Nil!6471) (Cons!6470 (h!7326 (_ BitVec 64)) (t!11639 List!6474)) )
))
(declare-fun arrayNoDuplicates!0 (array!23541 (_ BitVec 32) List!6474) Bool)

(assert (=> b!395323 (= res!226675 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6471))))

(declare-fun b!395324 () Bool)

(declare-fun res!226681 () Bool)

(assert (=> b!395324 (=> (not res!226681) (not e!239320))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395324 (= res!226681 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11576 _keys!709))))))

(declare-fun b!395325 () Bool)

(declare-fun res!226680 () Bool)

(assert (=> b!395325 (=> (not res!226680) (not e!239320))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395325 (= res!226680 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!395326 () Bool)

(assert (=> b!395326 (= e!239322 (and e!239319 mapRes!16347))))

(declare-fun condMapEmpty!16347 () Bool)

(declare-fun mapDefault!16347 () ValueCell!4568)

(assert (=> b!395326 (= condMapEmpty!16347 (= (arr!11224 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4568)) mapDefault!16347)))))

(declare-fun b!395327 () Bool)

(declare-fun res!226677 () Bool)

(assert (=> b!395327 (=> (not res!226677) (not e!239320))))

(assert (=> b!395327 (= res!226677 (or (= (select (arr!11223 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11223 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395328 () Bool)

(declare-fun res!226676 () Bool)

(assert (=> b!395328 (=> (not res!226676) (not e!239320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395328 (= res!226676 (validMask!0 mask!1025))))

(declare-fun b!395329 () Bool)

(declare-fun res!226673 () Bool)

(assert (=> b!395329 (=> (not res!226673) (not e!239320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395329 (= res!226673 (validKeyInArray!0 k0!794))))

(declare-fun b!395330 () Bool)

(assert (=> b!395330 (= e!239321 tp_is_empty!9823)))

(assert (= (and start!38342 res!226678) b!395328))

(assert (= (and b!395328 res!226676) b!395319))

(assert (= (and b!395319 res!226679) b!395321))

(assert (= (and b!395321 res!226674) b!395323))

(assert (= (and b!395323 res!226675) b!395324))

(assert (= (and b!395324 res!226681) b!395329))

(assert (= (and b!395329 res!226673) b!395327))

(assert (= (and b!395327 res!226677) b!395325))

(assert (= (and b!395325 res!226680) b!395322))

(assert (= (and b!395326 condMapEmpty!16347) mapIsEmpty!16347))

(assert (= (and b!395326 (not condMapEmpty!16347)) mapNonEmpty!16347))

(get-info :version)

(assert (= (and mapNonEmpty!16347 ((_ is ValueCellFull!4568) mapValue!16347)) b!395330))

(assert (= (and b!395326 ((_ is ValueCellFull!4568) mapDefault!16347)) b!395320))

(assert (= start!38342 b!395326))

(declare-fun m!390843 () Bool)

(assert (=> start!38342 m!390843))

(declare-fun m!390845 () Bool)

(assert (=> start!38342 m!390845))

(declare-fun m!390847 () Bool)

(assert (=> b!395328 m!390847))

(declare-fun m!390849 () Bool)

(assert (=> mapNonEmpty!16347 m!390849))

(declare-fun m!390851 () Bool)

(assert (=> b!395329 m!390851))

(declare-fun m!390853 () Bool)

(assert (=> b!395325 m!390853))

(declare-fun m!390855 () Bool)

(assert (=> b!395323 m!390855))

(declare-fun m!390857 () Bool)

(assert (=> b!395321 m!390857))

(declare-fun m!390859 () Bool)

(assert (=> b!395327 m!390859))

(check-sat (not b!395328) (not b!395321) (not b!395323) (not b!395325) (not start!38342) (not mapNonEmpty!16347) (not b!395329) tp_is_empty!9823)
(check-sat)
