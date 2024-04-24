; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132176 () Bool)

(assert start!132176)

(declare-fun b!1545267 () Bool)

(declare-fun e!859964 () Bool)

(declare-fun e!859968 () Bool)

(declare-fun mapRes!58333 () Bool)

(assert (=> b!1545267 (= e!859964 (and e!859968 mapRes!58333))))

(declare-fun condMapEmpty!58333 () Bool)

(declare-datatypes ((V!58781 0))(
  ( (V!58782 (val!18954 Int)) )
))
(declare-datatypes ((ValueCell!17966 0))(
  ( (ValueCellFull!17966 (v!21747 V!58781)) (EmptyCell!17966) )
))
(declare-datatypes ((array!102856 0))(
  ( (array!102857 (arr!49623 (Array (_ BitVec 32) ValueCell!17966)) (size!50174 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102856)

(declare-fun mapDefault!58333 () ValueCell!17966)

(assert (=> b!1545267 (= condMapEmpty!58333 (= (arr!49623 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17966)) mapDefault!58333)))))

(declare-fun res!1059551 () Bool)

(declare-fun e!859966 () Bool)

(assert (=> start!132176 (=> (not res!1059551) (not e!859966))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132176 (= res!1059551 (validMask!0 mask!926))))

(assert (=> start!132176 e!859966))

(assert (=> start!132176 true))

(declare-fun array_inv!38869 (array!102856) Bool)

(assert (=> start!132176 (and (array_inv!38869 _values!470) e!859964)))

(declare-datatypes ((array!102858 0))(
  ( (array!102859 (arr!49624 (Array (_ BitVec 32) (_ BitVec 64))) (size!50175 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102858)

(declare-fun array_inv!38870 (array!102858) Bool)

(assert (=> start!132176 (array_inv!38870 _keys!618)))

(declare-fun b!1545268 () Bool)

(declare-fun res!1059550 () Bool)

(assert (=> b!1545268 (=> (not res!1059550) (not e!859966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102858 (_ BitVec 32)) Bool)

(assert (=> b!1545268 (= res!1059550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58333 () Bool)

(assert (=> mapIsEmpty!58333 mapRes!58333))

(declare-fun mapNonEmpty!58333 () Bool)

(declare-fun tp!110860 () Bool)

(declare-fun e!859965 () Bool)

(assert (=> mapNonEmpty!58333 (= mapRes!58333 (and tp!110860 e!859965))))

(declare-fun mapKey!58333 () (_ BitVec 32))

(declare-fun mapValue!58333 () ValueCell!17966)

(declare-fun mapRest!58333 () (Array (_ BitVec 32) ValueCell!17966))

(assert (=> mapNonEmpty!58333 (= (arr!49623 _values!470) (store mapRest!58333 mapKey!58333 mapValue!58333))))

(declare-fun b!1545269 () Bool)

(declare-fun res!1059549 () Bool)

(assert (=> b!1545269 (=> (not res!1059549) (not e!859966))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545269 (= res!1059549 (and (= (size!50174 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50175 _keys!618) (size!50174 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545270 () Bool)

(declare-fun tp_is_empty!37753 () Bool)

(assert (=> b!1545270 (= e!859968 tp_is_empty!37753)))

(declare-fun b!1545271 () Bool)

(assert (=> b!1545271 (= e!859965 tp_is_empty!37753)))

(declare-fun b!1545272 () Bool)

(assert (=> b!1545272 (= e!859966 false)))

(declare-fun lt!666790 () Bool)

(declare-datatypes ((List!35931 0))(
  ( (Nil!35928) (Cons!35927 (h!37390 (_ BitVec 64)) (t!50617 List!35931)) )
))
(declare-fun arrayNoDuplicates!0 (array!102858 (_ BitVec 32) List!35931) Bool)

(assert (=> b!1545272 (= lt!666790 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35928))))

(assert (= (and start!132176 res!1059551) b!1545269))

(assert (= (and b!1545269 res!1059549) b!1545268))

(assert (= (and b!1545268 res!1059550) b!1545272))

(assert (= (and b!1545267 condMapEmpty!58333) mapIsEmpty!58333))

(assert (= (and b!1545267 (not condMapEmpty!58333)) mapNonEmpty!58333))

(get-info :version)

(assert (= (and mapNonEmpty!58333 ((_ is ValueCellFull!17966) mapValue!58333)) b!1545271))

(assert (= (and b!1545267 ((_ is ValueCellFull!17966) mapDefault!58333)) b!1545270))

(assert (= start!132176 b!1545267))

(declare-fun m!1426599 () Bool)

(assert (=> start!132176 m!1426599))

(declare-fun m!1426601 () Bool)

(assert (=> start!132176 m!1426601))

(declare-fun m!1426603 () Bool)

(assert (=> start!132176 m!1426603))

(declare-fun m!1426605 () Bool)

(assert (=> b!1545268 m!1426605))

(declare-fun m!1426607 () Bool)

(assert (=> mapNonEmpty!58333 m!1426607))

(declare-fun m!1426609 () Bool)

(assert (=> b!1545272 m!1426609))

(check-sat (not mapNonEmpty!58333) (not b!1545272) tp_is_empty!37753 (not start!132176) (not b!1545268))
(check-sat)
