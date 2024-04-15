; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69868 () Bool)

(assert start!69868)

(declare-fun b!812310 () Bool)

(declare-fun e!449943 () Bool)

(declare-fun tp_is_empty!14041 () Bool)

(assert (=> b!812310 (= e!449943 tp_is_empty!14041)))

(declare-fun b!812311 () Bool)

(declare-fun e!449939 () Bool)

(declare-fun e!449940 () Bool)

(declare-fun mapRes!22636 () Bool)

(assert (=> b!812311 (= e!449939 (and e!449940 mapRes!22636))))

(declare-fun condMapEmpty!22636 () Bool)

(declare-datatypes ((V!23723 0))(
  ( (V!23724 (val!7068 Int)) )
))
(declare-datatypes ((ValueCell!6605 0))(
  ( (ValueCellFull!6605 (v!9489 V!23723)) (EmptyCell!6605) )
))
(declare-datatypes ((array!44303 0))(
  ( (array!44304 (arr!21214 (Array (_ BitVec 32) ValueCell!6605)) (size!21635 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44303)

(declare-fun mapDefault!22636 () ValueCell!6605)

(assert (=> b!812311 (= condMapEmpty!22636 (= (arr!21214 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6605)) mapDefault!22636)))))

(declare-fun b!812312 () Bool)

(declare-fun res!555130 () Bool)

(declare-fun e!449941 () Bool)

(assert (=> b!812312 (=> (not res!555130) (not e!449941))))

(declare-datatypes ((array!44305 0))(
  ( (array!44306 (arr!21215 (Array (_ BitVec 32) (_ BitVec 64))) (size!21636 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44305)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812312 (= res!555130 (and (= (size!21635 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21636 _keys!976) (size!21635 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812313 () Bool)

(assert (=> b!812313 (= e!449941 false)))

(declare-fun lt!363915 () Bool)

(declare-datatypes ((List!15141 0))(
  ( (Nil!15138) (Cons!15137 (h!16266 (_ BitVec 64)) (t!21447 List!15141)) )
))
(declare-fun arrayNoDuplicates!0 (array!44305 (_ BitVec 32) List!15141) Bool)

(assert (=> b!812313 (= lt!363915 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15138))))

(declare-fun res!555129 () Bool)

(assert (=> start!69868 (=> (not res!555129) (not e!449941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69868 (= res!555129 (validMask!0 mask!1312))))

(assert (=> start!69868 e!449941))

(declare-fun array_inv!17077 (array!44305) Bool)

(assert (=> start!69868 (array_inv!17077 _keys!976)))

(assert (=> start!69868 true))

(declare-fun array_inv!17078 (array!44303) Bool)

(assert (=> start!69868 (and (array_inv!17078 _values!788) e!449939)))

(declare-fun mapIsEmpty!22636 () Bool)

(assert (=> mapIsEmpty!22636 mapRes!22636))

(declare-fun b!812314 () Bool)

(assert (=> b!812314 (= e!449940 tp_is_empty!14041)))

(declare-fun mapNonEmpty!22636 () Bool)

(declare-fun tp!43744 () Bool)

(assert (=> mapNonEmpty!22636 (= mapRes!22636 (and tp!43744 e!449943))))

(declare-fun mapRest!22636 () (Array (_ BitVec 32) ValueCell!6605))

(declare-fun mapKey!22636 () (_ BitVec 32))

(declare-fun mapValue!22636 () ValueCell!6605)

(assert (=> mapNonEmpty!22636 (= (arr!21214 _values!788) (store mapRest!22636 mapKey!22636 mapValue!22636))))

(declare-fun b!812315 () Bool)

(declare-fun res!555131 () Bool)

(assert (=> b!812315 (=> (not res!555131) (not e!449941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44305 (_ BitVec 32)) Bool)

(assert (=> b!812315 (= res!555131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!69868 res!555129) b!812312))

(assert (= (and b!812312 res!555130) b!812315))

(assert (= (and b!812315 res!555131) b!812313))

(assert (= (and b!812311 condMapEmpty!22636) mapIsEmpty!22636))

(assert (= (and b!812311 (not condMapEmpty!22636)) mapNonEmpty!22636))

(get-info :version)

(assert (= (and mapNonEmpty!22636 ((_ is ValueCellFull!6605) mapValue!22636)) b!812310))

(assert (= (and b!812311 ((_ is ValueCellFull!6605) mapDefault!22636)) b!812314))

(assert (= start!69868 b!812311))

(declare-fun m!754153 () Bool)

(assert (=> b!812313 m!754153))

(declare-fun m!754155 () Bool)

(assert (=> start!69868 m!754155))

(declare-fun m!754157 () Bool)

(assert (=> start!69868 m!754157))

(declare-fun m!754159 () Bool)

(assert (=> start!69868 m!754159))

(declare-fun m!754161 () Bool)

(assert (=> mapNonEmpty!22636 m!754161))

(declare-fun m!754163 () Bool)

(assert (=> b!812315 m!754163))

(check-sat tp_is_empty!14041 (not start!69868) (not b!812315) (not mapNonEmpty!22636) (not b!812313))
(check-sat)
