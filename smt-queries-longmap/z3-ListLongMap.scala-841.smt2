; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20146 () Bool)

(assert start!20146)

(declare-fun b_free!4801 () Bool)

(declare-fun b_next!4801 () Bool)

(assert (=> start!20146 (= b_free!4801 (not b_next!4801))))

(declare-fun tp!17434 () Bool)

(declare-fun b_and!11521 () Bool)

(assert (=> start!20146 (= tp!17434 b_and!11521)))

(declare-fun mapNonEmpty!8054 () Bool)

(declare-fun mapRes!8054 () Bool)

(declare-fun tp!17435 () Bool)

(declare-fun e!129888 () Bool)

(assert (=> mapNonEmpty!8054 (= mapRes!8054 (and tp!17435 e!129888))))

(declare-fun mapKey!8054 () (_ BitVec 32))

(declare-datatypes ((V!5857 0))(
  ( (V!5858 (val!2373 Int)) )
))
(declare-datatypes ((ValueCell!1985 0))(
  ( (ValueCellFull!1985 (v!4337 V!5857)) (EmptyCell!1985) )
))
(declare-fun mapValue!8054 () ValueCell!1985)

(declare-datatypes ((array!8543 0))(
  ( (array!8544 (arr!4021 (Array (_ BitVec 32) ValueCell!1985)) (size!4347 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8543)

(declare-fun mapRest!8054 () (Array (_ BitVec 32) ValueCell!1985))

(assert (=> mapNonEmpty!8054 (= (arr!4021 _values!649) (store mapRest!8054 mapKey!8054 mapValue!8054))))

(declare-fun b!197417 () Bool)

(declare-fun tp_is_empty!4657 () Bool)

(assert (=> b!197417 (= e!129888 tp_is_empty!4657)))

(declare-fun b!197418 () Bool)

(declare-fun res!93381 () Bool)

(declare-fun e!129887 () Bool)

(assert (=> b!197418 (=> (not res!93381) (not e!129887))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8545 0))(
  ( (array!8546 (arr!4022 (Array (_ BitVec 32) (_ BitVec 64))) (size!4348 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8545)

(assert (=> b!197418 (= res!93381 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4348 _keys!825))))))

(declare-fun res!93385 () Bool)

(assert (=> start!20146 (=> (not res!93385) (not e!129887))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20146 (= res!93385 (validMask!0 mask!1149))))

(assert (=> start!20146 e!129887))

(declare-fun e!129885 () Bool)

(declare-fun array_inv!2617 (array!8543) Bool)

(assert (=> start!20146 (and (array_inv!2617 _values!649) e!129885)))

(assert (=> start!20146 true))

(assert (=> start!20146 tp_is_empty!4657))

(declare-fun array_inv!2618 (array!8545) Bool)

(assert (=> start!20146 (array_inv!2618 _keys!825)))

(assert (=> start!20146 tp!17434))

(declare-fun b!197419 () Bool)

(assert (=> b!197419 (= e!129887 false)))

(declare-fun v!520 () V!5857)

(declare-fun zeroValue!615 () V!5857)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3570 0))(
  ( (tuple2!3571 (_1!1796 (_ BitVec 64)) (_2!1796 V!5857)) )
))
(declare-datatypes ((List!2501 0))(
  ( (Nil!2498) (Cons!2497 (h!3139 tuple2!3570) (t!7423 List!2501)) )
))
(declare-datatypes ((ListLongMap!2473 0))(
  ( (ListLongMap!2474 (toList!1252 List!2501)) )
))
(declare-fun lt!97562 () ListLongMap!2473)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5857)

(declare-fun getCurrentListMapNoExtraKeys!232 (array!8545 array!8543 (_ BitVec 32) (_ BitVec 32) V!5857 V!5857 (_ BitVec 32) Int) ListLongMap!2473)

(assert (=> b!197419 (= lt!97562 (getCurrentListMapNoExtraKeys!232 _keys!825 (array!8544 (store (arr!4021 _values!649) i!601 (ValueCellFull!1985 v!520)) (size!4347 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97561 () ListLongMap!2473)

(assert (=> b!197419 (= lt!97561 (getCurrentListMapNoExtraKeys!232 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197420 () Bool)

(declare-fun res!93384 () Bool)

(assert (=> b!197420 (=> (not res!93384) (not e!129887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8545 (_ BitVec 32)) Bool)

(assert (=> b!197420 (= res!93384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197421 () Bool)

(declare-fun e!129886 () Bool)

(assert (=> b!197421 (= e!129886 tp_is_empty!4657)))

(declare-fun b!197422 () Bool)

(declare-fun res!93382 () Bool)

(assert (=> b!197422 (=> (not res!93382) (not e!129887))))

(assert (=> b!197422 (= res!93382 (and (= (size!4347 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4348 _keys!825) (size!4347 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197423 () Bool)

(declare-fun res!93386 () Bool)

(assert (=> b!197423 (=> (not res!93386) (not e!129887))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!197423 (= res!93386 (= (select (arr!4022 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8054 () Bool)

(assert (=> mapIsEmpty!8054 mapRes!8054))

(declare-fun b!197424 () Bool)

(declare-fun res!93380 () Bool)

(assert (=> b!197424 (=> (not res!93380) (not e!129887))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197424 (= res!93380 (validKeyInArray!0 k0!843))))

(declare-fun b!197425 () Bool)

(assert (=> b!197425 (= e!129885 (and e!129886 mapRes!8054))))

(declare-fun condMapEmpty!8054 () Bool)

(declare-fun mapDefault!8054 () ValueCell!1985)

(assert (=> b!197425 (= condMapEmpty!8054 (= (arr!4021 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1985)) mapDefault!8054)))))

(declare-fun b!197426 () Bool)

(declare-fun res!93383 () Bool)

(assert (=> b!197426 (=> (not res!93383) (not e!129887))))

(declare-datatypes ((List!2502 0))(
  ( (Nil!2499) (Cons!2498 (h!3140 (_ BitVec 64)) (t!7424 List!2502)) )
))
(declare-fun arrayNoDuplicates!0 (array!8545 (_ BitVec 32) List!2502) Bool)

(assert (=> b!197426 (= res!93383 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2499))))

(assert (= (and start!20146 res!93385) b!197422))

(assert (= (and b!197422 res!93382) b!197420))

(assert (= (and b!197420 res!93384) b!197426))

(assert (= (and b!197426 res!93383) b!197418))

(assert (= (and b!197418 res!93381) b!197424))

(assert (= (and b!197424 res!93380) b!197423))

(assert (= (and b!197423 res!93386) b!197419))

(assert (= (and b!197425 condMapEmpty!8054) mapIsEmpty!8054))

(assert (= (and b!197425 (not condMapEmpty!8054)) mapNonEmpty!8054))

(get-info :version)

(assert (= (and mapNonEmpty!8054 ((_ is ValueCellFull!1985) mapValue!8054)) b!197417))

(assert (= (and b!197425 ((_ is ValueCellFull!1985) mapDefault!8054)) b!197421))

(assert (= start!20146 b!197425))

(declare-fun m!223791 () Bool)

(assert (=> mapNonEmpty!8054 m!223791))

(declare-fun m!223793 () Bool)

(assert (=> b!197419 m!223793))

(declare-fun m!223795 () Bool)

(assert (=> b!197419 m!223795))

(declare-fun m!223797 () Bool)

(assert (=> b!197419 m!223797))

(declare-fun m!223799 () Bool)

(assert (=> b!197423 m!223799))

(declare-fun m!223801 () Bool)

(assert (=> start!20146 m!223801))

(declare-fun m!223803 () Bool)

(assert (=> start!20146 m!223803))

(declare-fun m!223805 () Bool)

(assert (=> start!20146 m!223805))

(declare-fun m!223807 () Bool)

(assert (=> b!197424 m!223807))

(declare-fun m!223809 () Bool)

(assert (=> b!197420 m!223809))

(declare-fun m!223811 () Bool)

(assert (=> b!197426 m!223811))

(check-sat (not mapNonEmpty!8054) (not b!197420) tp_is_empty!4657 (not b!197419) (not b!197424) (not b_next!4801) b_and!11521 (not start!20146) (not b!197426))
(check-sat b_and!11521 (not b_next!4801))
