; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34418 () Bool)

(assert start!34418)

(declare-fun b_free!7341 () Bool)

(declare-fun b_next!7341 () Bool)

(assert (=> start!34418 (= b_free!7341 (not b_next!7341))))

(declare-fun tp!25569 () Bool)

(declare-fun b_and!14549 () Bool)

(assert (=> start!34418 (= tp!25569 b_and!14549)))

(declare-fun mapNonEmpty!12378 () Bool)

(declare-fun mapRes!12378 () Bool)

(declare-fun tp!25568 () Bool)

(declare-fun e!210713 () Bool)

(assert (=> mapNonEmpty!12378 (= mapRes!12378 (and tp!25568 e!210713))))

(declare-fun mapKey!12378 () (_ BitVec 32))

(declare-datatypes ((V!10701 0))(
  ( (V!10702 (val!3691 Int)) )
))
(declare-datatypes ((ValueCell!3303 0))(
  ( (ValueCellFull!3303 (v!5867 V!10701)) (EmptyCell!3303) )
))
(declare-fun mapValue!12378 () ValueCell!3303)

(declare-datatypes ((array!18179 0))(
  ( (array!18180 (arr!8606 (Array (_ BitVec 32) ValueCell!3303)) (size!8958 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18179)

(declare-fun mapRest!12378 () (Array (_ BitVec 32) ValueCell!3303))

(assert (=> mapNonEmpty!12378 (= (arr!8606 _values!1525) (store mapRest!12378 mapKey!12378 mapValue!12378))))

(declare-fun b!343652 () Bool)

(declare-fun e!210710 () Bool)

(assert (=> b!343652 (= e!210710 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3321 0))(
  ( (MissingZero!3321 (index!15463 (_ BitVec 32))) (Found!3321 (index!15464 (_ BitVec 32))) (Intermediate!3321 (undefined!4133 Bool) (index!15465 (_ BitVec 32)) (x!34203 (_ BitVec 32))) (Undefined!3321) (MissingVacant!3321 (index!15466 (_ BitVec 32))) )
))
(declare-fun lt!162586 () SeekEntryResult!3321)

(declare-datatypes ((array!18181 0))(
  ( (array!18182 (arr!8607 (Array (_ BitVec 32) (_ BitVec 64))) (size!8959 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18181)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18181 (_ BitVec 32)) SeekEntryResult!3321)

(assert (=> b!343652 (= lt!162586 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343653 () Bool)

(declare-fun res!189961 () Bool)

(assert (=> b!343653 (=> (not res!189961) (not e!210710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343653 (= res!189961 (validKeyInArray!0 k0!1348))))

(declare-fun b!343654 () Bool)

(declare-fun res!189962 () Bool)

(assert (=> b!343654 (=> (not res!189962) (not e!210710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18181 (_ BitVec 32)) Bool)

(assert (=> b!343654 (= res!189962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343655 () Bool)

(declare-fun res!189963 () Bool)

(assert (=> b!343655 (=> (not res!189963) (not e!210710))))

(declare-fun zeroValue!1467 () V!10701)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10701)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5346 0))(
  ( (tuple2!5347 (_1!2684 (_ BitVec 64)) (_2!2684 V!10701)) )
))
(declare-datatypes ((List!4965 0))(
  ( (Nil!4962) (Cons!4961 (h!5817 tuple2!5346) (t!10081 List!4965)) )
))
(declare-datatypes ((ListLongMap!4259 0))(
  ( (ListLongMap!4260 (toList!2145 List!4965)) )
))
(declare-fun contains!2203 (ListLongMap!4259 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1666 (array!18181 array!18179 (_ BitVec 32) (_ BitVec 32) V!10701 V!10701 (_ BitVec 32) Int) ListLongMap!4259)

(assert (=> b!343655 (= res!189963 (not (contains!2203 (getCurrentListMap!1666 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343656 () Bool)

(declare-fun res!189965 () Bool)

(assert (=> b!343656 (=> (not res!189965) (not e!210710))))

(declare-datatypes ((List!4966 0))(
  ( (Nil!4963) (Cons!4962 (h!5818 (_ BitVec 64)) (t!10082 List!4966)) )
))
(declare-fun arrayNoDuplicates!0 (array!18181 (_ BitVec 32) List!4966) Bool)

(assert (=> b!343656 (= res!189965 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4963))))

(declare-fun b!343657 () Bool)

(declare-fun tp_is_empty!7293 () Bool)

(assert (=> b!343657 (= e!210713 tp_is_empty!7293)))

(declare-fun mapIsEmpty!12378 () Bool)

(assert (=> mapIsEmpty!12378 mapRes!12378))

(declare-fun b!343651 () Bool)

(declare-fun res!189964 () Bool)

(assert (=> b!343651 (=> (not res!189964) (not e!210710))))

(assert (=> b!343651 (= res!189964 (and (= (size!8958 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8959 _keys!1895) (size!8958 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!189960 () Bool)

(assert (=> start!34418 (=> (not res!189960) (not e!210710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34418 (= res!189960 (validMask!0 mask!2385))))

(assert (=> start!34418 e!210710))

(assert (=> start!34418 true))

(assert (=> start!34418 tp_is_empty!7293))

(assert (=> start!34418 tp!25569))

(declare-fun e!210712 () Bool)

(declare-fun array_inv!6374 (array!18179) Bool)

(assert (=> start!34418 (and (array_inv!6374 _values!1525) e!210712)))

(declare-fun array_inv!6375 (array!18181) Bool)

(assert (=> start!34418 (array_inv!6375 _keys!1895)))

(declare-fun b!343658 () Bool)

(declare-fun e!210711 () Bool)

(assert (=> b!343658 (= e!210711 tp_is_empty!7293)))

(declare-fun b!343659 () Bool)

(assert (=> b!343659 (= e!210712 (and e!210711 mapRes!12378))))

(declare-fun condMapEmpty!12378 () Bool)

(declare-fun mapDefault!12378 () ValueCell!3303)

(assert (=> b!343659 (= condMapEmpty!12378 (= (arr!8606 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3303)) mapDefault!12378)))))

(assert (= (and start!34418 res!189960) b!343651))

(assert (= (and b!343651 res!189964) b!343654))

(assert (= (and b!343654 res!189962) b!343656))

(assert (= (and b!343656 res!189965) b!343653))

(assert (= (and b!343653 res!189961) b!343655))

(assert (= (and b!343655 res!189963) b!343652))

(assert (= (and b!343659 condMapEmpty!12378) mapIsEmpty!12378))

(assert (= (and b!343659 (not condMapEmpty!12378)) mapNonEmpty!12378))

(get-info :version)

(assert (= (and mapNonEmpty!12378 ((_ is ValueCellFull!3303) mapValue!12378)) b!343657))

(assert (= (and b!343659 ((_ is ValueCellFull!3303) mapDefault!12378)) b!343658))

(assert (= start!34418 b!343659))

(declare-fun m!345477 () Bool)

(assert (=> b!343652 m!345477))

(declare-fun m!345479 () Bool)

(assert (=> b!343654 m!345479))

(declare-fun m!345481 () Bool)

(assert (=> b!343656 m!345481))

(declare-fun m!345483 () Bool)

(assert (=> b!343655 m!345483))

(assert (=> b!343655 m!345483))

(declare-fun m!345485 () Bool)

(assert (=> b!343655 m!345485))

(declare-fun m!345487 () Bool)

(assert (=> b!343653 m!345487))

(declare-fun m!345489 () Bool)

(assert (=> mapNonEmpty!12378 m!345489))

(declare-fun m!345491 () Bool)

(assert (=> start!34418 m!345491))

(declare-fun m!345493 () Bool)

(assert (=> start!34418 m!345493))

(declare-fun m!345495 () Bool)

(assert (=> start!34418 m!345495))

(check-sat (not b!343654) (not b!343652) (not b!343653) (not b!343655) (not b_next!7341) (not mapNonEmpty!12378) tp_is_empty!7293 (not b!343656) (not start!34418) b_and!14549)
(check-sat b_and!14549 (not b_next!7341))
