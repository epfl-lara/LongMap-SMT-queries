; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35002 () Bool)

(assert start!35002)

(declare-fun b_free!7705 () Bool)

(declare-fun b_next!7705 () Bool)

(assert (=> start!35002 (= b_free!7705 (not b_next!7705))))

(declare-fun tp!26693 () Bool)

(declare-fun b_and!14909 () Bool)

(assert (=> start!35002 (= tp!26693 b_and!14909)))

(declare-fun mapIsEmpty!12957 () Bool)

(declare-fun mapRes!12957 () Bool)

(assert (=> mapIsEmpty!12957 mapRes!12957))

(declare-fun b!350601 () Bool)

(declare-fun e!214725 () Bool)

(declare-fun e!214723 () Bool)

(assert (=> b!350601 (= e!214725 e!214723)))

(declare-fun res!194384 () Bool)

(assert (=> b!350601 (=> (not res!194384) (not e!214723))))

(declare-datatypes ((SeekEntryResult!3446 0))(
  ( (MissingZero!3446 (index!15963 (_ BitVec 32))) (Found!3446 (index!15964 (_ BitVec 32))) (Intermediate!3446 (undefined!4258 Bool) (index!15965 (_ BitVec 32)) (x!34921 (_ BitVec 32))) (Undefined!3446) (MissingVacant!3446 (index!15966 (_ BitVec 32))) )
))
(declare-fun lt!164427 () SeekEntryResult!3446)

(get-info :version)

(assert (=> b!350601 (= res!194384 (and (not ((_ is Found!3446) lt!164427)) (not ((_ is MissingZero!3446) lt!164427)) ((_ is MissingVacant!3446) lt!164427)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18881 0))(
  ( (array!18882 (arr!8946 (Array (_ BitVec 32) (_ BitVec 64))) (size!9299 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18881)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18881 (_ BitVec 32)) SeekEntryResult!3446)

(assert (=> b!350601 (= lt!164427 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350602 () Bool)

(declare-fun res!194387 () Bool)

(assert (=> b!350602 (=> (not res!194387) (not e!214725))))

(declare-datatypes ((V!11187 0))(
  ( (V!11188 (val!3873 Int)) )
))
(declare-fun zeroValue!1467 () V!11187)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3485 0))(
  ( (ValueCellFull!3485 (v!6054 V!11187)) (EmptyCell!3485) )
))
(declare-datatypes ((array!18883 0))(
  ( (array!18884 (arr!8947 (Array (_ BitVec 32) ValueCell!3485)) (size!9300 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18883)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11187)

(declare-datatypes ((tuple2!5560 0))(
  ( (tuple2!5561 (_1!2791 (_ BitVec 64)) (_2!2791 V!11187)) )
))
(declare-datatypes ((List!5175 0))(
  ( (Nil!5172) (Cons!5171 (h!6027 tuple2!5560) (t!10304 List!5175)) )
))
(declare-datatypes ((ListLongMap!4463 0))(
  ( (ListLongMap!4464 (toList!2247 List!5175)) )
))
(declare-fun contains!2327 (ListLongMap!4463 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1752 (array!18881 array!18883 (_ BitVec 32) (_ BitVec 32) V!11187 V!11187 (_ BitVec 32) Int) ListLongMap!4463)

(assert (=> b!350602 (= res!194387 (not (contains!2327 (getCurrentListMap!1752 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350603 () Bool)

(declare-fun res!194386 () Bool)

(assert (=> b!350603 (=> (not res!194386) (not e!214725))))

(declare-datatypes ((List!5176 0))(
  ( (Nil!5173) (Cons!5172 (h!6028 (_ BitVec 64)) (t!10305 List!5176)) )
))
(declare-fun arrayNoDuplicates!0 (array!18881 (_ BitVec 32) List!5176) Bool)

(assert (=> b!350603 (= res!194386 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5173))))

(declare-fun b!350604 () Bool)

(declare-fun res!194388 () Bool)

(assert (=> b!350604 (=> (not res!194388) (not e!214723))))

(declare-fun arrayContainsKey!0 (array!18881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350604 (= res!194388 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!194389 () Bool)

(assert (=> start!35002 (=> (not res!194389) (not e!214725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35002 (= res!194389 (validMask!0 mask!2385))))

(assert (=> start!35002 e!214725))

(assert (=> start!35002 true))

(declare-fun tp_is_empty!7657 () Bool)

(assert (=> start!35002 tp_is_empty!7657))

(assert (=> start!35002 tp!26693))

(declare-fun e!214727 () Bool)

(declare-fun array_inv!6628 (array!18883) Bool)

(assert (=> start!35002 (and (array_inv!6628 _values!1525) e!214727)))

(declare-fun array_inv!6629 (array!18881) Bool)

(assert (=> start!35002 (array_inv!6629 _keys!1895)))

(declare-fun b!350605 () Bool)

(declare-fun res!194391 () Bool)

(assert (=> b!350605 (=> (not res!194391) (not e!214725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350605 (= res!194391 (validKeyInArray!0 k0!1348))))

(declare-fun b!350606 () Bool)

(declare-fun e!214726 () Bool)

(assert (=> b!350606 (= e!214726 tp_is_empty!7657)))

(declare-fun b!350607 () Bool)

(assert (=> b!350607 (= e!214723 false)))

(declare-fun lt!164426 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18881 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350607 (= lt!164426 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350608 () Bool)

(declare-fun e!214722 () Bool)

(assert (=> b!350608 (= e!214722 tp_is_empty!7657)))

(declare-fun b!350609 () Bool)

(declare-fun res!194385 () Bool)

(assert (=> b!350609 (=> (not res!194385) (not e!214725))))

(assert (=> b!350609 (= res!194385 (and (= (size!9300 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9299 _keys!1895) (size!9300 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350610 () Bool)

(declare-fun res!194390 () Bool)

(assert (=> b!350610 (=> (not res!194390) (not e!214725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18881 (_ BitVec 32)) Bool)

(assert (=> b!350610 (= res!194390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350611 () Bool)

(assert (=> b!350611 (= e!214727 (and e!214726 mapRes!12957))))

(declare-fun condMapEmpty!12957 () Bool)

(declare-fun mapDefault!12957 () ValueCell!3485)

(assert (=> b!350611 (= condMapEmpty!12957 (= (arr!8947 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3485)) mapDefault!12957)))))

(declare-fun mapNonEmpty!12957 () Bool)

(declare-fun tp!26694 () Bool)

(assert (=> mapNonEmpty!12957 (= mapRes!12957 (and tp!26694 e!214722))))

(declare-fun mapKey!12957 () (_ BitVec 32))

(declare-fun mapValue!12957 () ValueCell!3485)

(declare-fun mapRest!12957 () (Array (_ BitVec 32) ValueCell!3485))

(assert (=> mapNonEmpty!12957 (= (arr!8947 _values!1525) (store mapRest!12957 mapKey!12957 mapValue!12957))))

(assert (= (and start!35002 res!194389) b!350609))

(assert (= (and b!350609 res!194385) b!350610))

(assert (= (and b!350610 res!194390) b!350603))

(assert (= (and b!350603 res!194386) b!350605))

(assert (= (and b!350605 res!194391) b!350602))

(assert (= (and b!350602 res!194387) b!350601))

(assert (= (and b!350601 res!194384) b!350604))

(assert (= (and b!350604 res!194388) b!350607))

(assert (= (and b!350611 condMapEmpty!12957) mapIsEmpty!12957))

(assert (= (and b!350611 (not condMapEmpty!12957)) mapNonEmpty!12957))

(assert (= (and mapNonEmpty!12957 ((_ is ValueCellFull!3485) mapValue!12957)) b!350608))

(assert (= (and b!350611 ((_ is ValueCellFull!3485) mapDefault!12957)) b!350606))

(assert (= start!35002 b!350611))

(declare-fun m!350223 () Bool)

(assert (=> b!350610 m!350223))

(declare-fun m!350225 () Bool)

(assert (=> mapNonEmpty!12957 m!350225))

(declare-fun m!350227 () Bool)

(assert (=> start!35002 m!350227))

(declare-fun m!350229 () Bool)

(assert (=> start!35002 m!350229))

(declare-fun m!350231 () Bool)

(assert (=> start!35002 m!350231))

(declare-fun m!350233 () Bool)

(assert (=> b!350601 m!350233))

(declare-fun m!350235 () Bool)

(assert (=> b!350602 m!350235))

(assert (=> b!350602 m!350235))

(declare-fun m!350237 () Bool)

(assert (=> b!350602 m!350237))

(declare-fun m!350239 () Bool)

(assert (=> b!350604 m!350239))

(declare-fun m!350241 () Bool)

(assert (=> b!350603 m!350241))

(declare-fun m!350243 () Bool)

(assert (=> b!350607 m!350243))

(declare-fun m!350245 () Bool)

(assert (=> b!350605 m!350245))

(check-sat (not b!350610) (not b!350605) (not b!350604) (not b!350607) b_and!14909 (not b!350603) (not b!350601) (not b!350602) (not start!35002) tp_is_empty!7657 (not b_next!7705) (not mapNonEmpty!12957))
(check-sat b_and!14909 (not b_next!7705))
