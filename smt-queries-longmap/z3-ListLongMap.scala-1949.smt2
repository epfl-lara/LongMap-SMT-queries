; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34442 () Bool)

(assert start!34442)

(declare-fun b_free!7365 () Bool)

(declare-fun b_next!7365 () Bool)

(assert (=> start!34442 (= b_free!7365 (not b_next!7365))))

(declare-fun tp!25640 () Bool)

(declare-fun b_and!14573 () Bool)

(assert (=> start!34442 (= tp!25640 b_and!14573)))

(declare-fun b!343975 () Bool)

(declare-fun e!210894 () Bool)

(declare-fun tp_is_empty!7317 () Bool)

(assert (=> b!343975 (= e!210894 tp_is_empty!7317)))

(declare-fun res!190176 () Bool)

(declare-fun e!210893 () Bool)

(assert (=> start!34442 (=> (not res!190176) (not e!210893))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34442 (= res!190176 (validMask!0 mask!2385))))

(assert (=> start!34442 e!210893))

(assert (=> start!34442 true))

(assert (=> start!34442 tp_is_empty!7317))

(assert (=> start!34442 tp!25640))

(declare-datatypes ((V!10733 0))(
  ( (V!10734 (val!3703 Int)) )
))
(declare-datatypes ((ValueCell!3315 0))(
  ( (ValueCellFull!3315 (v!5879 V!10733)) (EmptyCell!3315) )
))
(declare-datatypes ((array!18225 0))(
  ( (array!18226 (arr!8629 (Array (_ BitVec 32) ValueCell!3315)) (size!8981 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18225)

(declare-fun e!210890 () Bool)

(declare-fun array_inv!6396 (array!18225) Bool)

(assert (=> start!34442 (and (array_inv!6396 _values!1525) e!210890)))

(declare-datatypes ((array!18227 0))(
  ( (array!18228 (arr!8630 (Array (_ BitVec 32) (_ BitVec 64))) (size!8982 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18227)

(declare-fun array_inv!6397 (array!18227) Bool)

(assert (=> start!34442 (array_inv!6397 _keys!1895)))

(declare-fun b!343976 () Bool)

(declare-fun res!190179 () Bool)

(assert (=> b!343976 (=> (not res!190179) (not e!210893))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343976 (= res!190179 (and (= (size!8981 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8982 _keys!1895) (size!8981 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12414 () Bool)

(declare-fun mapRes!12414 () Bool)

(assert (=> mapIsEmpty!12414 mapRes!12414))

(declare-fun b!343977 () Bool)

(assert (=> b!343977 (= e!210890 (and e!210894 mapRes!12414))))

(declare-fun condMapEmpty!12414 () Bool)

(declare-fun mapDefault!12414 () ValueCell!3315)

(assert (=> b!343977 (= condMapEmpty!12414 (= (arr!8629 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3315)) mapDefault!12414)))))

(declare-fun b!343978 () Bool)

(assert (=> b!343978 (= e!210893 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3331 0))(
  ( (MissingZero!3331 (index!15503 (_ BitVec 32))) (Found!3331 (index!15504 (_ BitVec 32))) (Intermediate!3331 (undefined!4143 Bool) (index!15505 (_ BitVec 32)) (x!34245 (_ BitVec 32))) (Undefined!3331) (MissingVacant!3331 (index!15506 (_ BitVec 32))) )
))
(declare-fun lt!162622 () SeekEntryResult!3331)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18227 (_ BitVec 32)) SeekEntryResult!3331)

(assert (=> b!343978 (= lt!162622 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343979 () Bool)

(declare-fun res!190181 () Bool)

(assert (=> b!343979 (=> (not res!190181) (not e!210893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18227 (_ BitVec 32)) Bool)

(assert (=> b!343979 (= res!190181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343980 () Bool)

(declare-fun e!210892 () Bool)

(assert (=> b!343980 (= e!210892 tp_is_empty!7317)))

(declare-fun b!343981 () Bool)

(declare-fun res!190177 () Bool)

(assert (=> b!343981 (=> (not res!190177) (not e!210893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343981 (= res!190177 (validKeyInArray!0 k0!1348))))

(declare-fun b!343982 () Bool)

(declare-fun res!190180 () Bool)

(assert (=> b!343982 (=> (not res!190180) (not e!210893))))

(declare-fun zeroValue!1467 () V!10733)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10733)

(declare-datatypes ((tuple2!5360 0))(
  ( (tuple2!5361 (_1!2691 (_ BitVec 64)) (_2!2691 V!10733)) )
))
(declare-datatypes ((List!4982 0))(
  ( (Nil!4979) (Cons!4978 (h!5834 tuple2!5360) (t!10098 List!4982)) )
))
(declare-datatypes ((ListLongMap!4273 0))(
  ( (ListLongMap!4274 (toList!2152 List!4982)) )
))
(declare-fun contains!2210 (ListLongMap!4273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1673 (array!18227 array!18225 (_ BitVec 32) (_ BitVec 32) V!10733 V!10733 (_ BitVec 32) Int) ListLongMap!4273)

(assert (=> b!343982 (= res!190180 (not (contains!2210 (getCurrentListMap!1673 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12414 () Bool)

(declare-fun tp!25641 () Bool)

(assert (=> mapNonEmpty!12414 (= mapRes!12414 (and tp!25641 e!210892))))

(declare-fun mapValue!12414 () ValueCell!3315)

(declare-fun mapKey!12414 () (_ BitVec 32))

(declare-fun mapRest!12414 () (Array (_ BitVec 32) ValueCell!3315))

(assert (=> mapNonEmpty!12414 (= (arr!8629 _values!1525) (store mapRest!12414 mapKey!12414 mapValue!12414))))

(declare-fun b!343983 () Bool)

(declare-fun res!190178 () Bool)

(assert (=> b!343983 (=> (not res!190178) (not e!210893))))

(declare-datatypes ((List!4983 0))(
  ( (Nil!4980) (Cons!4979 (h!5835 (_ BitVec 64)) (t!10099 List!4983)) )
))
(declare-fun arrayNoDuplicates!0 (array!18227 (_ BitVec 32) List!4983) Bool)

(assert (=> b!343983 (= res!190178 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4980))))

(assert (= (and start!34442 res!190176) b!343976))

(assert (= (and b!343976 res!190179) b!343979))

(assert (= (and b!343979 res!190181) b!343983))

(assert (= (and b!343983 res!190178) b!343981))

(assert (= (and b!343981 res!190177) b!343982))

(assert (= (and b!343982 res!190180) b!343978))

(assert (= (and b!343977 condMapEmpty!12414) mapIsEmpty!12414))

(assert (= (and b!343977 (not condMapEmpty!12414)) mapNonEmpty!12414))

(get-info :version)

(assert (= (and mapNonEmpty!12414 ((_ is ValueCellFull!3315) mapValue!12414)) b!343980))

(assert (= (and b!343977 ((_ is ValueCellFull!3315) mapDefault!12414)) b!343975))

(assert (= start!34442 b!343977))

(declare-fun m!345717 () Bool)

(assert (=> mapNonEmpty!12414 m!345717))

(declare-fun m!345719 () Bool)

(assert (=> b!343981 m!345719))

(declare-fun m!345721 () Bool)

(assert (=> b!343978 m!345721))

(declare-fun m!345723 () Bool)

(assert (=> b!343983 m!345723))

(declare-fun m!345725 () Bool)

(assert (=> start!34442 m!345725))

(declare-fun m!345727 () Bool)

(assert (=> start!34442 m!345727))

(declare-fun m!345729 () Bool)

(assert (=> start!34442 m!345729))

(declare-fun m!345731 () Bool)

(assert (=> b!343979 m!345731))

(declare-fun m!345733 () Bool)

(assert (=> b!343982 m!345733))

(assert (=> b!343982 m!345733))

(declare-fun m!345735 () Bool)

(assert (=> b!343982 m!345735))

(check-sat (not b!343981) (not b!343979) (not start!34442) (not b!343983) b_and!14573 (not b_next!7365) tp_is_empty!7317 (not mapNonEmpty!12414) (not b!343982) (not b!343978))
(check-sat b_and!14573 (not b_next!7365))
