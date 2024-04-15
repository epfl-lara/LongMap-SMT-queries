; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69874 () Bool)

(assert start!69874)

(declare-fun b!812364 () Bool)

(declare-fun res!555157 () Bool)

(declare-fun e!449986 () Bool)

(assert (=> b!812364 (=> (not res!555157) (not e!449986))))

(declare-datatypes ((array!44315 0))(
  ( (array!44316 (arr!21220 (Array (_ BitVec 32) (_ BitVec 64))) (size!21641 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44315)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44315 (_ BitVec 32)) Bool)

(assert (=> b!812364 (= res!555157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!555156 () Bool)

(assert (=> start!69874 (=> (not res!555156) (not e!449986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69874 (= res!555156 (validMask!0 mask!1312))))

(assert (=> start!69874 e!449986))

(declare-fun array_inv!17083 (array!44315) Bool)

(assert (=> start!69874 (array_inv!17083 _keys!976)))

(assert (=> start!69874 true))

(declare-datatypes ((V!23731 0))(
  ( (V!23732 (val!7071 Int)) )
))
(declare-datatypes ((ValueCell!6608 0))(
  ( (ValueCellFull!6608 (v!9492 V!23731)) (EmptyCell!6608) )
))
(declare-datatypes ((array!44317 0))(
  ( (array!44318 (arr!21221 (Array (_ BitVec 32) ValueCell!6608)) (size!21642 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44317)

(declare-fun e!449988 () Bool)

(declare-fun array_inv!17084 (array!44317) Bool)

(assert (=> start!69874 (and (array_inv!17084 _values!788) e!449988)))

(declare-fun mapNonEmpty!22645 () Bool)

(declare-fun mapRes!22645 () Bool)

(declare-fun tp!43753 () Bool)

(declare-fun e!449984 () Bool)

(assert (=> mapNonEmpty!22645 (= mapRes!22645 (and tp!43753 e!449984))))

(declare-fun mapRest!22645 () (Array (_ BitVec 32) ValueCell!6608))

(declare-fun mapValue!22645 () ValueCell!6608)

(declare-fun mapKey!22645 () (_ BitVec 32))

(assert (=> mapNonEmpty!22645 (= (arr!21221 _values!788) (store mapRest!22645 mapKey!22645 mapValue!22645))))

(declare-fun mapIsEmpty!22645 () Bool)

(assert (=> mapIsEmpty!22645 mapRes!22645))

(declare-fun b!812365 () Bool)

(declare-fun res!555158 () Bool)

(assert (=> b!812365 (=> (not res!555158) (not e!449986))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812365 (= res!555158 (and (= (size!21642 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21641 _keys!976) (size!21642 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812366 () Bool)

(assert (=> b!812366 (= e!449986 false)))

(declare-fun lt!363924 () Bool)

(declare-datatypes ((List!15143 0))(
  ( (Nil!15140) (Cons!15139 (h!16268 (_ BitVec 64)) (t!21449 List!15143)) )
))
(declare-fun arrayNoDuplicates!0 (array!44315 (_ BitVec 32) List!15143) Bool)

(assert (=> b!812366 (= lt!363924 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15140))))

(declare-fun b!812367 () Bool)

(declare-fun e!449987 () Bool)

(declare-fun tp_is_empty!14047 () Bool)

(assert (=> b!812367 (= e!449987 tp_is_empty!14047)))

(declare-fun b!812368 () Bool)

(assert (=> b!812368 (= e!449988 (and e!449987 mapRes!22645))))

(declare-fun condMapEmpty!22645 () Bool)

(declare-fun mapDefault!22645 () ValueCell!6608)

(assert (=> b!812368 (= condMapEmpty!22645 (= (arr!21221 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6608)) mapDefault!22645)))))

(declare-fun b!812369 () Bool)

(assert (=> b!812369 (= e!449984 tp_is_empty!14047)))

(assert (= (and start!69874 res!555156) b!812365))

(assert (= (and b!812365 res!555158) b!812364))

(assert (= (and b!812364 res!555157) b!812366))

(assert (= (and b!812368 condMapEmpty!22645) mapIsEmpty!22645))

(assert (= (and b!812368 (not condMapEmpty!22645)) mapNonEmpty!22645))

(get-info :version)

(assert (= (and mapNonEmpty!22645 ((_ is ValueCellFull!6608) mapValue!22645)) b!812369))

(assert (= (and b!812368 ((_ is ValueCellFull!6608) mapDefault!22645)) b!812367))

(assert (= start!69874 b!812368))

(declare-fun m!754189 () Bool)

(assert (=> b!812364 m!754189))

(declare-fun m!754191 () Bool)

(assert (=> start!69874 m!754191))

(declare-fun m!754193 () Bool)

(assert (=> start!69874 m!754193))

(declare-fun m!754195 () Bool)

(assert (=> start!69874 m!754195))

(declare-fun m!754197 () Bool)

(assert (=> mapNonEmpty!22645 m!754197))

(declare-fun m!754199 () Bool)

(assert (=> b!812366 m!754199))

(check-sat (not b!812366) (not b!812364) (not start!69874) tp_is_empty!14047 (not mapNonEmpty!22645))
(check-sat)
