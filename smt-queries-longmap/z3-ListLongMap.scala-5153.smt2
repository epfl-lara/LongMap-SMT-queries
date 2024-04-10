; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69884 () Bool)

(assert start!69884)

(declare-fun mapNonEmpty!22630 () Bool)

(declare-fun mapRes!22630 () Bool)

(declare-fun tp!43738 () Bool)

(declare-fun e!450060 () Bool)

(assert (=> mapNonEmpty!22630 (= mapRes!22630 (and tp!43738 e!450060))))

(declare-datatypes ((V!23717 0))(
  ( (V!23718 (val!7066 Int)) )
))
(declare-datatypes ((ValueCell!6603 0))(
  ( (ValueCellFull!6603 (v!9493 V!23717)) (EmptyCell!6603) )
))
(declare-fun mapValue!22630 () ValueCell!6603)

(declare-fun mapRest!22630 () (Array (_ BitVec 32) ValueCell!6603))

(declare-datatypes ((array!44296 0))(
  ( (array!44297 (arr!21210 (Array (_ BitVec 32) ValueCell!6603)) (size!21631 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44296)

(declare-fun mapKey!22630 () (_ BitVec 32))

(assert (=> mapNonEmpty!22630 (= (arr!21210 _values!788) (store mapRest!22630 mapKey!22630 mapValue!22630))))

(declare-fun b!812520 () Bool)

(declare-fun e!450059 () Bool)

(declare-fun e!450063 () Bool)

(assert (=> b!812520 (= e!450059 (and e!450063 mapRes!22630))))

(declare-fun condMapEmpty!22630 () Bool)

(declare-fun mapDefault!22630 () ValueCell!6603)

(assert (=> b!812520 (= condMapEmpty!22630 (= (arr!21210 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6603)) mapDefault!22630)))))

(declare-fun b!812522 () Bool)

(declare-fun e!450062 () Bool)

(assert (=> b!812522 (= e!450062 false)))

(declare-fun lt!364152 () Bool)

(declare-datatypes ((array!44298 0))(
  ( (array!44299 (arr!21211 (Array (_ BitVec 32) (_ BitVec 64))) (size!21632 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44298)

(declare-datatypes ((List!15100 0))(
  ( (Nil!15097) (Cons!15096 (h!16225 (_ BitVec 64)) (t!21415 List!15100)) )
))
(declare-fun arrayNoDuplicates!0 (array!44298 (_ BitVec 32) List!15100) Bool)

(assert (=> b!812522 (= lt!364152 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15097))))

(declare-fun b!812523 () Bool)

(declare-fun tp_is_empty!14037 () Bool)

(assert (=> b!812523 (= e!450060 tp_is_empty!14037)))

(declare-fun b!812524 () Bool)

(declare-fun res!555218 () Bool)

(assert (=> b!812524 (=> (not res!555218) (not e!450062))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44298 (_ BitVec 32)) Bool)

(assert (=> b!812524 (= res!555218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22630 () Bool)

(assert (=> mapIsEmpty!22630 mapRes!22630))

(declare-fun b!812525 () Bool)

(assert (=> b!812525 (= e!450063 tp_is_empty!14037)))

(declare-fun res!555219 () Bool)

(assert (=> start!69884 (=> (not res!555219) (not e!450062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69884 (= res!555219 (validMask!0 mask!1312))))

(assert (=> start!69884 e!450062))

(declare-fun array_inv!16993 (array!44298) Bool)

(assert (=> start!69884 (array_inv!16993 _keys!976)))

(assert (=> start!69884 true))

(declare-fun array_inv!16994 (array!44296) Bool)

(assert (=> start!69884 (and (array_inv!16994 _values!788) e!450059)))

(declare-fun b!812521 () Bool)

(declare-fun res!555217 () Bool)

(assert (=> b!812521 (=> (not res!555217) (not e!450062))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812521 (= res!555217 (and (= (size!21631 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21632 _keys!976) (size!21631 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!69884 res!555219) b!812521))

(assert (= (and b!812521 res!555217) b!812524))

(assert (= (and b!812524 res!555218) b!812522))

(assert (= (and b!812520 condMapEmpty!22630) mapIsEmpty!22630))

(assert (= (and b!812520 (not condMapEmpty!22630)) mapNonEmpty!22630))

(get-info :version)

(assert (= (and mapNonEmpty!22630 ((_ is ValueCellFull!6603) mapValue!22630)) b!812523))

(assert (= (and b!812520 ((_ is ValueCellFull!6603) mapDefault!22630)) b!812525))

(assert (= start!69884 b!812520))

(declare-fun m!754881 () Bool)

(assert (=> mapNonEmpty!22630 m!754881))

(declare-fun m!754883 () Bool)

(assert (=> b!812522 m!754883))

(declare-fun m!754885 () Bool)

(assert (=> b!812524 m!754885))

(declare-fun m!754887 () Bool)

(assert (=> start!69884 m!754887))

(declare-fun m!754889 () Bool)

(assert (=> start!69884 m!754889))

(declare-fun m!754891 () Bool)

(assert (=> start!69884 m!754891))

(check-sat (not b!812524) (not mapNonEmpty!22630) (not start!69884) tp_is_empty!14037 (not b!812522))
(check-sat)
