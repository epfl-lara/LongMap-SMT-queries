; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38532 () Bool)

(assert start!38532)

(declare-fun res!228842 () Bool)

(declare-fun e!240740 () Bool)

(assert (=> start!38532 (=> (not res!228842) (not e!240740))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23813 0))(
  ( (array!23814 (arr!11356 (Array (_ BitVec 32) (_ BitVec 64))) (size!11708 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23813)

(assert (=> start!38532 (= res!228842 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11708 _keys!709))))))

(assert (=> start!38532 e!240740))

(assert (=> start!38532 true))

(declare-datatypes ((V!14373 0))(
  ( (V!14374 (val!5020 Int)) )
))
(declare-datatypes ((ValueCell!4632 0))(
  ( (ValueCellFull!4632 (v!7267 V!14373)) (EmptyCell!4632) )
))
(declare-datatypes ((array!23815 0))(
  ( (array!23816 (arr!11357 (Array (_ BitVec 32) ValueCell!4632)) (size!11709 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23815)

(declare-fun e!240744 () Bool)

(declare-fun array_inv!8322 (array!23815) Bool)

(assert (=> start!38532 (and (array_inv!8322 _values!549) e!240744)))

(declare-fun array_inv!8323 (array!23813) Bool)

(assert (=> start!38532 (array_inv!8323 _keys!709)))

(declare-fun b!398270 () Bool)

(declare-fun e!240739 () Bool)

(declare-fun tp_is_empty!9951 () Bool)

(assert (=> b!398270 (= e!240739 tp_is_empty!9951)))

(declare-fun mapIsEmpty!16548 () Bool)

(declare-fun mapRes!16548 () Bool)

(assert (=> mapIsEmpty!16548 mapRes!16548))

(declare-fun b!398271 () Bool)

(declare-fun e!240743 () Bool)

(assert (=> b!398271 (= e!240743 false)))

(declare-fun lt!187433 () Bool)

(declare-fun lt!187432 () array!23813)

(declare-datatypes ((List!6568 0))(
  ( (Nil!6565) (Cons!6564 (h!7420 (_ BitVec 64)) (t!11742 List!6568)) )
))
(declare-fun arrayNoDuplicates!0 (array!23813 (_ BitVec 32) List!6568) Bool)

(assert (=> b!398271 (= lt!187433 (arrayNoDuplicates!0 lt!187432 #b00000000000000000000000000000000 Nil!6565))))

(declare-fun b!398272 () Bool)

(declare-fun res!228841 () Bool)

(assert (=> b!398272 (=> (not res!228841) (not e!240740))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!398272 (= res!228841 (and (= (size!11709 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11708 _keys!709) (size!11709 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398273 () Bool)

(declare-fun res!228849 () Bool)

(assert (=> b!398273 (=> (not res!228849) (not e!240740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398273 (= res!228849 (validMask!0 mask!1025))))

(declare-fun b!398274 () Bool)

(declare-fun e!240742 () Bool)

(assert (=> b!398274 (= e!240742 tp_is_empty!9951)))

(declare-fun b!398275 () Bool)

(assert (=> b!398275 (= e!240740 e!240743)))

(declare-fun res!228846 () Bool)

(assert (=> b!398275 (=> (not res!228846) (not e!240743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23813 (_ BitVec 32)) Bool)

(assert (=> b!398275 (= res!228846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187432 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398275 (= lt!187432 (array!23814 (store (arr!11356 _keys!709) i!563 k0!794) (size!11708 _keys!709)))))

(declare-fun b!398276 () Bool)

(declare-fun res!228847 () Bool)

(assert (=> b!398276 (=> (not res!228847) (not e!240740))))

(assert (=> b!398276 (= res!228847 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6565))))

(declare-fun b!398277 () Bool)

(declare-fun res!228840 () Bool)

(assert (=> b!398277 (=> (not res!228840) (not e!240740))))

(assert (=> b!398277 (= res!228840 (or (= (select (arr!11356 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11356 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398278 () Bool)

(declare-fun res!228845 () Bool)

(assert (=> b!398278 (=> (not res!228845) (not e!240740))))

(declare-fun arrayContainsKey!0 (array!23813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398278 (= res!228845 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398279 () Bool)

(declare-fun res!228844 () Bool)

(assert (=> b!398279 (=> (not res!228844) (not e!240740))))

(assert (=> b!398279 (= res!228844 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11708 _keys!709))))))

(declare-fun b!398280 () Bool)

(declare-fun res!228843 () Bool)

(assert (=> b!398280 (=> (not res!228843) (not e!240740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398280 (= res!228843 (validKeyInArray!0 k0!794))))

(declare-fun b!398281 () Bool)

(declare-fun res!228848 () Bool)

(assert (=> b!398281 (=> (not res!228848) (not e!240740))))

(assert (=> b!398281 (= res!228848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16548 () Bool)

(declare-fun tp!32343 () Bool)

(assert (=> mapNonEmpty!16548 (= mapRes!16548 (and tp!32343 e!240739))))

(declare-fun mapKey!16548 () (_ BitVec 32))

(declare-fun mapRest!16548 () (Array (_ BitVec 32) ValueCell!4632))

(declare-fun mapValue!16548 () ValueCell!4632)

(assert (=> mapNonEmpty!16548 (= (arr!11357 _values!549) (store mapRest!16548 mapKey!16548 mapValue!16548))))

(declare-fun b!398282 () Bool)

(assert (=> b!398282 (= e!240744 (and e!240742 mapRes!16548))))

(declare-fun condMapEmpty!16548 () Bool)

(declare-fun mapDefault!16548 () ValueCell!4632)

(assert (=> b!398282 (= condMapEmpty!16548 (= (arr!11357 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4632)) mapDefault!16548)))))

(assert (= (and start!38532 res!228842) b!398273))

(assert (= (and b!398273 res!228849) b!398272))

(assert (= (and b!398272 res!228841) b!398281))

(assert (= (and b!398281 res!228848) b!398276))

(assert (= (and b!398276 res!228847) b!398279))

(assert (= (and b!398279 res!228844) b!398280))

(assert (= (and b!398280 res!228843) b!398277))

(assert (= (and b!398277 res!228840) b!398278))

(assert (= (and b!398278 res!228845) b!398275))

(assert (= (and b!398275 res!228846) b!398271))

(assert (= (and b!398282 condMapEmpty!16548) mapIsEmpty!16548))

(assert (= (and b!398282 (not condMapEmpty!16548)) mapNonEmpty!16548))

(get-info :version)

(assert (= (and mapNonEmpty!16548 ((_ is ValueCellFull!4632) mapValue!16548)) b!398270))

(assert (= (and b!398282 ((_ is ValueCellFull!4632) mapDefault!16548)) b!398274))

(assert (= start!38532 b!398282))

(declare-fun m!393199 () Bool)

(assert (=> b!398275 m!393199))

(declare-fun m!393201 () Bool)

(assert (=> b!398275 m!393201))

(declare-fun m!393203 () Bool)

(assert (=> b!398277 m!393203))

(declare-fun m!393205 () Bool)

(assert (=> b!398273 m!393205))

(declare-fun m!393207 () Bool)

(assert (=> b!398278 m!393207))

(declare-fun m!393209 () Bool)

(assert (=> start!38532 m!393209))

(declare-fun m!393211 () Bool)

(assert (=> start!38532 m!393211))

(declare-fun m!393213 () Bool)

(assert (=> mapNonEmpty!16548 m!393213))

(declare-fun m!393215 () Bool)

(assert (=> b!398280 m!393215))

(declare-fun m!393217 () Bool)

(assert (=> b!398281 m!393217))

(declare-fun m!393219 () Bool)

(assert (=> b!398276 m!393219))

(declare-fun m!393221 () Bool)

(assert (=> b!398271 m!393221))

(check-sat (not mapNonEmpty!16548) (not b!398280) (not b!398273) (not b!398271) (not start!38532) tp_is_empty!9951 (not b!398281) (not b!398278) (not b!398276) (not b!398275))
(check-sat)
