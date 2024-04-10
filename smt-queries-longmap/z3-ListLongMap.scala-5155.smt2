; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69896 () Bool)

(assert start!69896)

(declare-fun mapNonEmpty!22648 () Bool)

(declare-fun mapRes!22648 () Bool)

(declare-fun tp!43756 () Bool)

(declare-fun e!450151 () Bool)

(assert (=> mapNonEmpty!22648 (= mapRes!22648 (and tp!43756 e!450151))))

(declare-datatypes ((V!23733 0))(
  ( (V!23734 (val!7072 Int)) )
))
(declare-datatypes ((ValueCell!6609 0))(
  ( (ValueCellFull!6609 (v!9499 V!23733)) (EmptyCell!6609) )
))
(declare-fun mapRest!22648 () (Array (_ BitVec 32) ValueCell!6609))

(declare-fun mapKey!22648 () (_ BitVec 32))

(declare-fun mapValue!22648 () ValueCell!6609)

(declare-datatypes ((array!44318 0))(
  ( (array!44319 (arr!21221 (Array (_ BitVec 32) ValueCell!6609)) (size!21642 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44318)

(assert (=> mapNonEmpty!22648 (= (arr!21221 _values!788) (store mapRest!22648 mapKey!22648 mapValue!22648))))

(declare-fun b!812628 () Bool)

(declare-fun res!555271 () Bool)

(declare-fun e!450153 () Bool)

(assert (=> b!812628 (=> (not res!555271) (not e!450153))))

(declare-datatypes ((array!44320 0))(
  ( (array!44321 (arr!21222 (Array (_ BitVec 32) (_ BitVec 64))) (size!21643 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44320)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!812628 (= res!555271 (and (= (size!21642 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21643 _keys!976) (size!21642 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!555273 () Bool)

(assert (=> start!69896 (=> (not res!555273) (not e!450153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69896 (= res!555273 (validMask!0 mask!1312))))

(assert (=> start!69896 e!450153))

(declare-fun array_inv!17001 (array!44320) Bool)

(assert (=> start!69896 (array_inv!17001 _keys!976)))

(assert (=> start!69896 true))

(declare-fun e!450149 () Bool)

(declare-fun array_inv!17002 (array!44318) Bool)

(assert (=> start!69896 (and (array_inv!17002 _values!788) e!450149)))

(declare-fun b!812629 () Bool)

(declare-fun tp_is_empty!14049 () Bool)

(assert (=> b!812629 (= e!450151 tp_is_empty!14049)))

(declare-fun b!812630 () Bool)

(assert (=> b!812630 (= e!450153 false)))

(declare-fun lt!364170 () Bool)

(declare-datatypes ((List!15102 0))(
  ( (Nil!15099) (Cons!15098 (h!16227 (_ BitVec 64)) (t!21417 List!15102)) )
))
(declare-fun arrayNoDuplicates!0 (array!44320 (_ BitVec 32) List!15102) Bool)

(assert (=> b!812630 (= lt!364170 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15099))))

(declare-fun b!812631 () Bool)

(declare-fun res!555272 () Bool)

(assert (=> b!812631 (=> (not res!555272) (not e!450153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44320 (_ BitVec 32)) Bool)

(assert (=> b!812631 (= res!555272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22648 () Bool)

(assert (=> mapIsEmpty!22648 mapRes!22648))

(declare-fun b!812632 () Bool)

(declare-fun e!450150 () Bool)

(assert (=> b!812632 (= e!450150 tp_is_empty!14049)))

(declare-fun b!812633 () Bool)

(assert (=> b!812633 (= e!450149 (and e!450150 mapRes!22648))))

(declare-fun condMapEmpty!22648 () Bool)

(declare-fun mapDefault!22648 () ValueCell!6609)

(assert (=> b!812633 (= condMapEmpty!22648 (= (arr!21221 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6609)) mapDefault!22648)))))

(assert (= (and start!69896 res!555273) b!812628))

(assert (= (and b!812628 res!555271) b!812631))

(assert (= (and b!812631 res!555272) b!812630))

(assert (= (and b!812633 condMapEmpty!22648) mapIsEmpty!22648))

(assert (= (and b!812633 (not condMapEmpty!22648)) mapNonEmpty!22648))

(get-info :version)

(assert (= (and mapNonEmpty!22648 ((_ is ValueCellFull!6609) mapValue!22648)) b!812629))

(assert (= (and b!812633 ((_ is ValueCellFull!6609) mapDefault!22648)) b!812632))

(assert (= start!69896 b!812633))

(declare-fun m!754953 () Bool)

(assert (=> mapNonEmpty!22648 m!754953))

(declare-fun m!754955 () Bool)

(assert (=> start!69896 m!754955))

(declare-fun m!754957 () Bool)

(assert (=> start!69896 m!754957))

(declare-fun m!754959 () Bool)

(assert (=> start!69896 m!754959))

(declare-fun m!754961 () Bool)

(assert (=> b!812630 m!754961))

(declare-fun m!754963 () Bool)

(assert (=> b!812631 m!754963))

(check-sat (not b!812631) (not mapNonEmpty!22648) tp_is_empty!14049 (not b!812630) (not start!69896))
(check-sat)
