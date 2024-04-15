; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83034 () Bool)

(assert start!83034)

(declare-fun b!968673 () Bool)

(declare-fun e!545989 () Bool)

(declare-fun e!545988 () Bool)

(declare-fun mapRes!34924 () Bool)

(assert (=> b!968673 (= e!545989 (and e!545988 mapRes!34924))))

(declare-fun condMapEmpty!34924 () Bool)

(declare-datatypes ((V!34241 0))(
  ( (V!34242 (val!11022 Int)) )
))
(declare-datatypes ((ValueCell!10490 0))(
  ( (ValueCellFull!10490 (v!13580 V!34241)) (EmptyCell!10490) )
))
(declare-datatypes ((array!59890 0))(
  ( (array!59891 (arr!28809 (Array (_ BitVec 32) ValueCell!10490)) (size!29290 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59890)

(declare-fun mapDefault!34924 () ValueCell!10490)

(assert (=> b!968673 (= condMapEmpty!34924 (= (arr!28809 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10490)) mapDefault!34924)))))

(declare-fun mapIsEmpty!34924 () Bool)

(assert (=> mapIsEmpty!34924 mapRes!34924))

(declare-fun b!968674 () Bool)

(declare-fun res!648468 () Bool)

(declare-fun e!545991 () Bool)

(assert (=> b!968674 (=> (not res!648468) (not e!545991))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59892 0))(
  ( (array!59893 (arr!28810 (Array (_ BitVec 32) (_ BitVec 64))) (size!29291 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59892)

(assert (=> b!968674 (= res!648468 (and (= (size!29290 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29291 _keys!1717) (size!29290 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968675 () Bool)

(declare-fun res!648469 () Bool)

(assert (=> b!968675 (=> (not res!648469) (not e!545991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59892 (_ BitVec 32)) Bool)

(assert (=> b!968675 (= res!648469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968677 () Bool)

(declare-fun e!545987 () Bool)

(declare-fun tp_is_empty!21943 () Bool)

(assert (=> b!968677 (= e!545987 tp_is_empty!21943)))

(declare-fun mapNonEmpty!34924 () Bool)

(declare-fun tp!66493 () Bool)

(assert (=> mapNonEmpty!34924 (= mapRes!34924 (and tp!66493 e!545987))))

(declare-fun mapKey!34924 () (_ BitVec 32))

(declare-fun mapRest!34924 () (Array (_ BitVec 32) ValueCell!10490))

(declare-fun mapValue!34924 () ValueCell!10490)

(assert (=> mapNonEmpty!34924 (= (arr!28809 _values!1425) (store mapRest!34924 mapKey!34924 mapValue!34924))))

(declare-fun b!968678 () Bool)

(assert (=> b!968678 (= e!545988 tp_is_empty!21943)))

(declare-fun res!648467 () Bool)

(assert (=> start!83034 (=> (not res!648467) (not e!545991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83034 (= res!648467 (validMask!0 mask!2147))))

(assert (=> start!83034 e!545991))

(assert (=> start!83034 true))

(declare-fun array_inv!22365 (array!59890) Bool)

(assert (=> start!83034 (and (array_inv!22365 _values!1425) e!545989)))

(declare-fun array_inv!22366 (array!59892) Bool)

(assert (=> start!83034 (array_inv!22366 _keys!1717)))

(declare-fun b!968676 () Bool)

(assert (=> b!968676 (= e!545991 false)))

(declare-fun lt!431328 () Bool)

(declare-datatypes ((List!20039 0))(
  ( (Nil!20036) (Cons!20035 (h!21197 (_ BitVec 64)) (t!28393 List!20039)) )
))
(declare-fun arrayNoDuplicates!0 (array!59892 (_ BitVec 32) List!20039) Bool)

(assert (=> b!968676 (= lt!431328 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20036))))

(assert (= (and start!83034 res!648467) b!968674))

(assert (= (and b!968674 res!648468) b!968675))

(assert (= (and b!968675 res!648469) b!968676))

(assert (= (and b!968673 condMapEmpty!34924) mapIsEmpty!34924))

(assert (= (and b!968673 (not condMapEmpty!34924)) mapNonEmpty!34924))

(get-info :version)

(assert (= (and mapNonEmpty!34924 ((_ is ValueCellFull!10490) mapValue!34924)) b!968677))

(assert (= (and b!968673 ((_ is ValueCellFull!10490) mapDefault!34924)) b!968678))

(assert (= start!83034 b!968673))

(declare-fun m!896333 () Bool)

(assert (=> b!968675 m!896333))

(declare-fun m!896335 () Bool)

(assert (=> mapNonEmpty!34924 m!896335))

(declare-fun m!896337 () Bool)

(assert (=> start!83034 m!896337))

(declare-fun m!896339 () Bool)

(assert (=> start!83034 m!896339))

(declare-fun m!896341 () Bool)

(assert (=> start!83034 m!896341))

(declare-fun m!896343 () Bool)

(assert (=> b!968676 m!896343))

(check-sat tp_is_empty!21943 (not mapNonEmpty!34924) (not start!83034) (not b!968675) (not b!968676))
(check-sat)
