; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69850 () Bool)

(assert start!69850)

(declare-fun b!812148 () Bool)

(declare-fun e!449808 () Bool)

(assert (=> b!812148 (= e!449808 false)))

(declare-fun lt!363888 () Bool)

(declare-datatypes ((array!44269 0))(
  ( (array!44270 (arr!21197 (Array (_ BitVec 32) (_ BitVec 64))) (size!21618 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44269)

(declare-datatypes ((List!15134 0))(
  ( (Nil!15131) (Cons!15130 (h!16259 (_ BitVec 64)) (t!21440 List!15134)) )
))
(declare-fun arrayNoDuplicates!0 (array!44269 (_ BitVec 32) List!15134) Bool)

(assert (=> b!812148 (= lt!363888 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15131))))

(declare-fun mapNonEmpty!22609 () Bool)

(declare-fun mapRes!22609 () Bool)

(declare-fun tp!43717 () Bool)

(declare-fun e!449804 () Bool)

(assert (=> mapNonEmpty!22609 (= mapRes!22609 (and tp!43717 e!449804))))

(declare-datatypes ((V!23699 0))(
  ( (V!23700 (val!7059 Int)) )
))
(declare-datatypes ((ValueCell!6596 0))(
  ( (ValueCellFull!6596 (v!9480 V!23699)) (EmptyCell!6596) )
))
(declare-fun mapRest!22609 () (Array (_ BitVec 32) ValueCell!6596))

(declare-fun mapKey!22609 () (_ BitVec 32))

(declare-datatypes ((array!44271 0))(
  ( (array!44272 (arr!21198 (Array (_ BitVec 32) ValueCell!6596)) (size!21619 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44271)

(declare-fun mapValue!22609 () ValueCell!6596)

(assert (=> mapNonEmpty!22609 (= (arr!21198 _values!788) (store mapRest!22609 mapKey!22609 mapValue!22609))))

(declare-fun res!555048 () Bool)

(assert (=> start!69850 (=> (not res!555048) (not e!449808))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69850 (= res!555048 (validMask!0 mask!1312))))

(assert (=> start!69850 e!449808))

(declare-fun array_inv!17067 (array!44269) Bool)

(assert (=> start!69850 (array_inv!17067 _keys!976)))

(assert (=> start!69850 true))

(declare-fun e!449805 () Bool)

(declare-fun array_inv!17068 (array!44271) Bool)

(assert (=> start!69850 (and (array_inv!17068 _values!788) e!449805)))

(declare-fun b!812149 () Bool)

(declare-fun res!555050 () Bool)

(assert (=> b!812149 (=> (not res!555050) (not e!449808))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812149 (= res!555050 (and (= (size!21619 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21618 _keys!976) (size!21619 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22609 () Bool)

(assert (=> mapIsEmpty!22609 mapRes!22609))

(declare-fun b!812150 () Bool)

(declare-fun e!449807 () Bool)

(assert (=> b!812150 (= e!449805 (and e!449807 mapRes!22609))))

(declare-fun condMapEmpty!22609 () Bool)

(declare-fun mapDefault!22609 () ValueCell!6596)

(assert (=> b!812150 (= condMapEmpty!22609 (= (arr!21198 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6596)) mapDefault!22609)))))

(declare-fun b!812151 () Bool)

(declare-fun tp_is_empty!14023 () Bool)

(assert (=> b!812151 (= e!449807 tp_is_empty!14023)))

(declare-fun b!812152 () Bool)

(assert (=> b!812152 (= e!449804 tp_is_empty!14023)))

(declare-fun b!812153 () Bool)

(declare-fun res!555049 () Bool)

(assert (=> b!812153 (=> (not res!555049) (not e!449808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44269 (_ BitVec 32)) Bool)

(assert (=> b!812153 (= res!555049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!69850 res!555048) b!812149))

(assert (= (and b!812149 res!555050) b!812153))

(assert (= (and b!812153 res!555049) b!812148))

(assert (= (and b!812150 condMapEmpty!22609) mapIsEmpty!22609))

(assert (= (and b!812150 (not condMapEmpty!22609)) mapNonEmpty!22609))

(get-info :version)

(assert (= (and mapNonEmpty!22609 ((_ is ValueCellFull!6596) mapValue!22609)) b!812152))

(assert (= (and b!812150 ((_ is ValueCellFull!6596) mapDefault!22609)) b!812151))

(assert (= start!69850 b!812150))

(declare-fun m!754045 () Bool)

(assert (=> b!812148 m!754045))

(declare-fun m!754047 () Bool)

(assert (=> mapNonEmpty!22609 m!754047))

(declare-fun m!754049 () Bool)

(assert (=> start!69850 m!754049))

(declare-fun m!754051 () Bool)

(assert (=> start!69850 m!754051))

(declare-fun m!754053 () Bool)

(assert (=> start!69850 m!754053))

(declare-fun m!754055 () Bool)

(assert (=> b!812153 m!754055))

(check-sat (not b!812153) (not start!69850) tp_is_empty!14023 (not mapNonEmpty!22609) (not b!812148))
(check-sat)
