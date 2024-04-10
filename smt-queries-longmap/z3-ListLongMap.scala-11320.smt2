; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131826 () Bool)

(assert start!131826)

(declare-fun mapNonEmpty!58426 () Bool)

(declare-fun mapRes!58426 () Bool)

(declare-fun tp!110953 () Bool)

(declare-fun e!858921 () Bool)

(assert (=> mapNonEmpty!58426 (= mapRes!58426 (and tp!110953 e!858921))))

(declare-datatypes ((V!58863 0))(
  ( (V!58864 (val!18985 Int)) )
))
(declare-datatypes ((ValueCell!17997 0))(
  ( (ValueCellFull!17997 (v!21786 V!58863)) (EmptyCell!17997) )
))
(declare-fun mapValue!58426 () ValueCell!17997)

(declare-datatypes ((array!102854 0))(
  ( (array!102855 (arr!49629 (Array (_ BitVec 32) ValueCell!17997)) (size!50179 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102854)

(declare-fun mapRest!58426 () (Array (_ BitVec 32) ValueCell!17997))

(declare-fun mapKey!58426 () (_ BitVec 32))

(assert (=> mapNonEmpty!58426 (= (arr!49629 _values!470) (store mapRest!58426 mapKey!58426 mapValue!58426))))

(declare-fun b!1543389 () Bool)

(declare-fun e!858922 () Bool)

(declare-fun tp_is_empty!37815 () Bool)

(assert (=> b!1543389 (= e!858922 tp_is_empty!37815)))

(declare-fun mapIsEmpty!58426 () Bool)

(assert (=> mapIsEmpty!58426 mapRes!58426))

(declare-fun b!1543391 () Bool)

(declare-fun res!1058970 () Bool)

(declare-fun e!858923 () Bool)

(assert (=> b!1543391 (=> (not res!1058970) (not e!858923))))

(declare-datatypes ((array!102856 0))(
  ( (array!102857 (arr!49630 (Array (_ BitVec 32) (_ BitVec 64))) (size!50180 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102856)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102856 (_ BitVec 32)) Bool)

(assert (=> b!1543391 (= res!1058970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543392 () Bool)

(declare-fun e!858920 () Bool)

(assert (=> b!1543392 (= e!858920 (and e!858922 mapRes!58426))))

(declare-fun condMapEmpty!58426 () Bool)

(declare-fun mapDefault!58426 () ValueCell!17997)

(assert (=> b!1543392 (= condMapEmpty!58426 (= (arr!49629 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17997)) mapDefault!58426)))))

(declare-fun b!1543393 () Bool)

(assert (=> b!1543393 (= e!858921 tp_is_empty!37815)))

(declare-fun b!1543394 () Bool)

(declare-fun res!1058968 () Bool)

(assert (=> b!1543394 (=> (not res!1058968) (not e!858923))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543394 (= res!1058968 (and (= (size!50179 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50180 _keys!618) (size!50179 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543390 () Bool)

(assert (=> b!1543390 (= e!858923 false)))

(declare-fun lt!665975 () Bool)

(declare-datatypes ((List!35919 0))(
  ( (Nil!35916) (Cons!35915 (h!37360 (_ BitVec 64)) (t!50613 List!35919)) )
))
(declare-fun arrayNoDuplicates!0 (array!102856 (_ BitVec 32) List!35919) Bool)

(assert (=> b!1543390 (= lt!665975 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35916))))

(declare-fun res!1058969 () Bool)

(assert (=> start!131826 (=> (not res!1058969) (not e!858923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131826 (= res!1058969 (validMask!0 mask!926))))

(assert (=> start!131826 e!858923))

(assert (=> start!131826 true))

(declare-fun array_inv!38611 (array!102854) Bool)

(assert (=> start!131826 (and (array_inv!38611 _values!470) e!858920)))

(declare-fun array_inv!38612 (array!102856) Bool)

(assert (=> start!131826 (array_inv!38612 _keys!618)))

(assert (= (and start!131826 res!1058969) b!1543394))

(assert (= (and b!1543394 res!1058968) b!1543391))

(assert (= (and b!1543391 res!1058970) b!1543390))

(assert (= (and b!1543392 condMapEmpty!58426) mapIsEmpty!58426))

(assert (= (and b!1543392 (not condMapEmpty!58426)) mapNonEmpty!58426))

(get-info :version)

(assert (= (and mapNonEmpty!58426 ((_ is ValueCellFull!17997) mapValue!58426)) b!1543393))

(assert (= (and b!1543392 ((_ is ValueCellFull!17997) mapDefault!58426)) b!1543389))

(assert (= start!131826 b!1543392))

(declare-fun m!1424713 () Bool)

(assert (=> mapNonEmpty!58426 m!1424713))

(declare-fun m!1424715 () Bool)

(assert (=> b!1543391 m!1424715))

(declare-fun m!1424717 () Bool)

(assert (=> b!1543390 m!1424717))

(declare-fun m!1424719 () Bool)

(assert (=> start!131826 m!1424719))

(declare-fun m!1424721 () Bool)

(assert (=> start!131826 m!1424721))

(declare-fun m!1424723 () Bool)

(assert (=> start!131826 m!1424723))

(check-sat tp_is_empty!37815 (not start!131826) (not b!1543391) (not mapNonEmpty!58426) (not b!1543390))
(check-sat)
