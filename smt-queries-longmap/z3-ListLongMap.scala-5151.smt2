; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69872 () Bool)

(assert start!69872)

(declare-fun res!555164 () Bool)

(declare-fun e!449969 () Bool)

(assert (=> start!69872 (=> (not res!555164) (not e!449969))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69872 (= res!555164 (validMask!0 mask!1312))))

(assert (=> start!69872 e!449969))

(declare-datatypes ((array!44274 0))(
  ( (array!44275 (arr!21199 (Array (_ BitVec 32) (_ BitVec 64))) (size!21620 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44274)

(declare-fun array_inv!16983 (array!44274) Bool)

(assert (=> start!69872 (array_inv!16983 _keys!976)))

(assert (=> start!69872 true))

(declare-datatypes ((V!23701 0))(
  ( (V!23702 (val!7060 Int)) )
))
(declare-datatypes ((ValueCell!6597 0))(
  ( (ValueCellFull!6597 (v!9487 V!23701)) (EmptyCell!6597) )
))
(declare-datatypes ((array!44276 0))(
  ( (array!44277 (arr!21200 (Array (_ BitVec 32) ValueCell!6597)) (size!21621 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44276)

(declare-fun e!449972 () Bool)

(declare-fun array_inv!16984 (array!44276) Bool)

(assert (=> start!69872 (and (array_inv!16984 _values!788) e!449972)))

(declare-fun b!812412 () Bool)

(declare-fun res!555165 () Bool)

(assert (=> b!812412 (=> (not res!555165) (not e!449969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44274 (_ BitVec 32)) Bool)

(assert (=> b!812412 (= res!555165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812413 () Bool)

(declare-fun e!449973 () Bool)

(declare-fun mapRes!22612 () Bool)

(assert (=> b!812413 (= e!449972 (and e!449973 mapRes!22612))))

(declare-fun condMapEmpty!22612 () Bool)

(declare-fun mapDefault!22612 () ValueCell!6597)

(assert (=> b!812413 (= condMapEmpty!22612 (= (arr!21200 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6597)) mapDefault!22612)))))

(declare-fun mapNonEmpty!22612 () Bool)

(declare-fun tp!43720 () Bool)

(declare-fun e!449970 () Bool)

(assert (=> mapNonEmpty!22612 (= mapRes!22612 (and tp!43720 e!449970))))

(declare-fun mapKey!22612 () (_ BitVec 32))

(declare-fun mapRest!22612 () (Array (_ BitVec 32) ValueCell!6597))

(declare-fun mapValue!22612 () ValueCell!6597)

(assert (=> mapNonEmpty!22612 (= (arr!21200 _values!788) (store mapRest!22612 mapKey!22612 mapValue!22612))))

(declare-fun b!812414 () Bool)

(declare-fun res!555163 () Bool)

(assert (=> b!812414 (=> (not res!555163) (not e!449969))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812414 (= res!555163 (and (= (size!21621 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21620 _keys!976) (size!21621 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812415 () Bool)

(assert (=> b!812415 (= e!449969 false)))

(declare-fun lt!364134 () Bool)

(declare-datatypes ((List!15096 0))(
  ( (Nil!15093) (Cons!15092 (h!16221 (_ BitVec 64)) (t!21411 List!15096)) )
))
(declare-fun arrayNoDuplicates!0 (array!44274 (_ BitVec 32) List!15096) Bool)

(assert (=> b!812415 (= lt!364134 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15093))))

(declare-fun mapIsEmpty!22612 () Bool)

(assert (=> mapIsEmpty!22612 mapRes!22612))

(declare-fun b!812416 () Bool)

(declare-fun tp_is_empty!14025 () Bool)

(assert (=> b!812416 (= e!449973 tp_is_empty!14025)))

(declare-fun b!812417 () Bool)

(assert (=> b!812417 (= e!449970 tp_is_empty!14025)))

(assert (= (and start!69872 res!555164) b!812414))

(assert (= (and b!812414 res!555163) b!812412))

(assert (= (and b!812412 res!555165) b!812415))

(assert (= (and b!812413 condMapEmpty!22612) mapIsEmpty!22612))

(assert (= (and b!812413 (not condMapEmpty!22612)) mapNonEmpty!22612))

(get-info :version)

(assert (= (and mapNonEmpty!22612 ((_ is ValueCellFull!6597) mapValue!22612)) b!812417))

(assert (= (and b!812413 ((_ is ValueCellFull!6597) mapDefault!22612)) b!812416))

(assert (= start!69872 b!812413))

(declare-fun m!754809 () Bool)

(assert (=> start!69872 m!754809))

(declare-fun m!754811 () Bool)

(assert (=> start!69872 m!754811))

(declare-fun m!754813 () Bool)

(assert (=> start!69872 m!754813))

(declare-fun m!754815 () Bool)

(assert (=> b!812412 m!754815))

(declare-fun m!754817 () Bool)

(assert (=> mapNonEmpty!22612 m!754817))

(declare-fun m!754819 () Bool)

(assert (=> b!812415 m!754819))

(check-sat (not b!812415) (not b!812412) (not start!69872) tp_is_empty!14025 (not mapNonEmpty!22612))
(check-sat)
