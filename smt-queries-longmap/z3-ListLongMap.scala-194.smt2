; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3786 () Bool)

(assert start!3786)

(declare-fun mapNonEmpty!1177 () Bool)

(declare-fun mapRes!1177 () Bool)

(declare-fun tp!3697 () Bool)

(declare-fun e!17245 () Bool)

(assert (=> mapNonEmpty!1177 (= mapRes!1177 (and tp!3697 e!17245))))

(declare-datatypes ((V!1301 0))(
  ( (V!1302 (val!580 Int)) )
))
(declare-datatypes ((ValueCell!354 0))(
  ( (ValueCellFull!354 (v!1666 V!1301)) (EmptyCell!354) )
))
(declare-fun mapValue!1177 () ValueCell!354)

(declare-datatypes ((array!1457 0))(
  ( (array!1458 (arr!686 (Array (_ BitVec 32) ValueCell!354)) (size!787 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1457)

(declare-fun mapKey!1177 () (_ BitVec 32))

(declare-fun mapRest!1177 () (Array (_ BitVec 32) ValueCell!354))

(assert (=> mapNonEmpty!1177 (= (arr!686 _values!1501) (store mapRest!1177 mapKey!1177 mapValue!1177))))

(declare-fun b!26468 () Bool)

(declare-fun e!17247 () Bool)

(declare-fun tp_is_empty!1107 () Bool)

(assert (=> b!26468 (= e!17247 tp_is_empty!1107)))

(declare-fun mapIsEmpty!1177 () Bool)

(assert (=> mapIsEmpty!1177 mapRes!1177))

(declare-fun b!26469 () Bool)

(declare-fun e!17249 () Bool)

(assert (=> b!26469 (= e!17249 (and e!17247 mapRes!1177))))

(declare-fun condMapEmpty!1177 () Bool)

(declare-fun mapDefault!1177 () ValueCell!354)

(assert (=> b!26469 (= condMapEmpty!1177 (= (arr!686 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!354)) mapDefault!1177)))))

(declare-fun b!26470 () Bool)

(assert (=> b!26470 (= e!17245 tp_is_empty!1107)))

(declare-fun res!15711 () Bool)

(declare-fun e!17246 () Bool)

(assert (=> start!3786 (=> (not res!15711) (not e!17246))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3786 (= res!15711 (validMask!0 mask!2294))))

(assert (=> start!3786 e!17246))

(assert (=> start!3786 true))

(declare-fun array_inv!469 (array!1457) Bool)

(assert (=> start!3786 (and (array_inv!469 _values!1501) e!17249)))

(declare-datatypes ((array!1459 0))(
  ( (array!1460 (arr!687 (Array (_ BitVec 32) (_ BitVec 64))) (size!788 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1459)

(declare-fun array_inv!470 (array!1459) Bool)

(assert (=> start!3786 (array_inv!470 _keys!1833)))

(declare-fun b!26471 () Bool)

(declare-fun res!15710 () Bool)

(assert (=> b!26471 (=> (not res!15710) (not e!17246))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26471 (= res!15710 (and (= (size!787 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!788 _keys!1833) (size!787 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26472 () Bool)

(declare-fun res!15709 () Bool)

(assert (=> b!26472 (=> (not res!15709) (not e!17246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1459 (_ BitVec 32)) Bool)

(assert (=> b!26472 (= res!15709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26473 () Bool)

(assert (=> b!26473 (= e!17246 false)))

(declare-fun lt!10370 () Bool)

(declare-datatypes ((List!591 0))(
  ( (Nil!588) (Cons!587 (h!1154 (_ BitVec 64)) (t!3278 List!591)) )
))
(declare-fun arrayNoDuplicates!0 (array!1459 (_ BitVec 32) List!591) Bool)

(assert (=> b!26473 (= lt!10370 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!588))))

(assert (= (and start!3786 res!15711) b!26471))

(assert (= (and b!26471 res!15710) b!26472))

(assert (= (and b!26472 res!15709) b!26473))

(assert (= (and b!26469 condMapEmpty!1177) mapIsEmpty!1177))

(assert (= (and b!26469 (not condMapEmpty!1177)) mapNonEmpty!1177))

(get-info :version)

(assert (= (and mapNonEmpty!1177 ((_ is ValueCellFull!354) mapValue!1177)) b!26470))

(assert (= (and b!26469 ((_ is ValueCellFull!354) mapDefault!1177)) b!26468))

(assert (= start!3786 b!26469))

(declare-fun m!21233 () Bool)

(assert (=> mapNonEmpty!1177 m!21233))

(declare-fun m!21235 () Bool)

(assert (=> start!3786 m!21235))

(declare-fun m!21237 () Bool)

(assert (=> start!3786 m!21237))

(declare-fun m!21239 () Bool)

(assert (=> start!3786 m!21239))

(declare-fun m!21241 () Bool)

(assert (=> b!26472 m!21241))

(declare-fun m!21243 () Bool)

(assert (=> b!26473 m!21243))

(check-sat (not mapNonEmpty!1177) (not b!26472) tp_is_empty!1107 (not b!26473) (not start!3786))
(check-sat)
