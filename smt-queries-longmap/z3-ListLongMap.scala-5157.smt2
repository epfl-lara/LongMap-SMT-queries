; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69886 () Bool)

(assert start!69886)

(declare-fun b!812472 () Bool)

(declare-fun res!555212 () Bool)

(declare-fun e!450074 () Bool)

(assert (=> b!812472 (=> (not res!555212) (not e!450074))))

(declare-datatypes ((array!44337 0))(
  ( (array!44338 (arr!21231 (Array (_ BitVec 32) (_ BitVec 64))) (size!21652 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44337)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((V!23747 0))(
  ( (V!23748 (val!7077 Int)) )
))
(declare-datatypes ((ValueCell!6614 0))(
  ( (ValueCellFull!6614 (v!9498 V!23747)) (EmptyCell!6614) )
))
(declare-datatypes ((array!44339 0))(
  ( (array!44340 (arr!21232 (Array (_ BitVec 32) ValueCell!6614)) (size!21653 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44339)

(assert (=> b!812472 (= res!555212 (and (= (size!21653 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21652 _keys!976) (size!21653 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812474 () Bool)

(assert (=> b!812474 (= e!450074 false)))

(declare-fun lt!363942 () Bool)

(declare-datatypes ((List!15146 0))(
  ( (Nil!15143) (Cons!15142 (h!16271 (_ BitVec 64)) (t!21452 List!15146)) )
))
(declare-fun arrayNoDuplicates!0 (array!44337 (_ BitVec 32) List!15146) Bool)

(assert (=> b!812474 (= lt!363942 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15143))))

(declare-fun mapNonEmpty!22663 () Bool)

(declare-fun mapRes!22663 () Bool)

(declare-fun tp!43771 () Bool)

(declare-fun e!450076 () Bool)

(assert (=> mapNonEmpty!22663 (= mapRes!22663 (and tp!43771 e!450076))))

(declare-fun mapValue!22663 () ValueCell!6614)

(declare-fun mapRest!22663 () (Array (_ BitVec 32) ValueCell!6614))

(declare-fun mapKey!22663 () (_ BitVec 32))

(assert (=> mapNonEmpty!22663 (= (arr!21232 _values!788) (store mapRest!22663 mapKey!22663 mapValue!22663))))

(declare-fun b!812475 () Bool)

(declare-fun res!555211 () Bool)

(assert (=> b!812475 (=> (not res!555211) (not e!450074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44337 (_ BitVec 32)) Bool)

(assert (=> b!812475 (= res!555211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812476 () Bool)

(declare-fun tp_is_empty!14059 () Bool)

(assert (=> b!812476 (= e!450076 tp_is_empty!14059)))

(declare-fun mapIsEmpty!22663 () Bool)

(assert (=> mapIsEmpty!22663 mapRes!22663))

(declare-fun b!812477 () Bool)

(declare-fun e!450075 () Bool)

(assert (=> b!812477 (= e!450075 tp_is_empty!14059)))

(declare-fun b!812473 () Bool)

(declare-fun e!450078 () Bool)

(assert (=> b!812473 (= e!450078 (and e!450075 mapRes!22663))))

(declare-fun condMapEmpty!22663 () Bool)

(declare-fun mapDefault!22663 () ValueCell!6614)

(assert (=> b!812473 (= condMapEmpty!22663 (= (arr!21232 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6614)) mapDefault!22663)))))

(declare-fun res!555210 () Bool)

(assert (=> start!69886 (=> (not res!555210) (not e!450074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69886 (= res!555210 (validMask!0 mask!1312))))

(assert (=> start!69886 e!450074))

(declare-fun array_inv!17091 (array!44337) Bool)

(assert (=> start!69886 (array_inv!17091 _keys!976)))

(assert (=> start!69886 true))

(declare-fun array_inv!17092 (array!44339) Bool)

(assert (=> start!69886 (and (array_inv!17092 _values!788) e!450078)))

(assert (= (and start!69886 res!555210) b!812472))

(assert (= (and b!812472 res!555212) b!812475))

(assert (= (and b!812475 res!555211) b!812474))

(assert (= (and b!812473 condMapEmpty!22663) mapIsEmpty!22663))

(assert (= (and b!812473 (not condMapEmpty!22663)) mapNonEmpty!22663))

(get-info :version)

(assert (= (and mapNonEmpty!22663 ((_ is ValueCellFull!6614) mapValue!22663)) b!812476))

(assert (= (and b!812473 ((_ is ValueCellFull!6614) mapDefault!22663)) b!812477))

(assert (= start!69886 b!812473))

(declare-fun m!754261 () Bool)

(assert (=> b!812474 m!754261))

(declare-fun m!754263 () Bool)

(assert (=> mapNonEmpty!22663 m!754263))

(declare-fun m!754265 () Bool)

(assert (=> b!812475 m!754265))

(declare-fun m!754267 () Bool)

(assert (=> start!69886 m!754267))

(declare-fun m!754269 () Bool)

(assert (=> start!69886 m!754269))

(declare-fun m!754271 () Bool)

(assert (=> start!69886 m!754271))

(check-sat tp_is_empty!14059 (not b!812474) (not start!69886) (not mapNonEmpty!22663) (not b!812475))
(check-sat)
