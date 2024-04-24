; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34492 () Bool)

(assert start!34492)

(declare-fun b_free!7429 () Bool)

(declare-fun b_next!7429 () Bool)

(assert (=> start!34492 (= b_free!7429 (not b_next!7429))))

(declare-fun tp!25832 () Bool)

(declare-fun b_and!14651 () Bool)

(assert (=> start!34492 (= tp!25832 b_and!14651)))

(declare-fun b!344786 () Bool)

(declare-fun e!211339 () Bool)

(assert (=> b!344786 (= e!211339 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18344 0))(
  ( (array!18345 (arr!8688 (Array (_ BitVec 32) (_ BitVec 64))) (size!9040 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18344)

(declare-datatypes ((SeekEntryResult!3302 0))(
  ( (MissingZero!3302 (index!15387 (_ BitVec 32))) (Found!3302 (index!15388 (_ BitVec 32))) (Intermediate!3302 (undefined!4114 Bool) (index!15389 (_ BitVec 32)) (x!34301 (_ BitVec 32))) (Undefined!3302) (MissingVacant!3302 (index!15390 (_ BitVec 32))) )
))
(declare-fun lt!162736 () SeekEntryResult!3302)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18344 (_ BitVec 32)) SeekEntryResult!3302)

(assert (=> b!344786 (= lt!162736 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344787 () Bool)

(declare-fun e!211336 () Bool)

(declare-fun tp_is_empty!7381 () Bool)

(assert (=> b!344787 (= e!211336 tp_is_empty!7381)))

(declare-fun mapNonEmpty!12510 () Bool)

(declare-fun mapRes!12510 () Bool)

(declare-fun tp!25833 () Bool)

(assert (=> mapNonEmpty!12510 (= mapRes!12510 (and tp!25833 e!211336))))

(declare-datatypes ((V!10819 0))(
  ( (V!10820 (val!3735 Int)) )
))
(declare-datatypes ((ValueCell!3347 0))(
  ( (ValueCellFull!3347 (v!5912 V!10819)) (EmptyCell!3347) )
))
(declare-datatypes ((array!18346 0))(
  ( (array!18347 (arr!8689 (Array (_ BitVec 32) ValueCell!3347)) (size!9041 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18346)

(declare-fun mapValue!12510 () ValueCell!3347)

(declare-fun mapKey!12510 () (_ BitVec 32))

(declare-fun mapRest!12510 () (Array (_ BitVec 32) ValueCell!3347))

(assert (=> mapNonEmpty!12510 (= (arr!8689 _values!1525) (store mapRest!12510 mapKey!12510 mapValue!12510))))

(declare-fun b!344788 () Bool)

(declare-fun res!190750 () Bool)

(assert (=> b!344788 (=> (not res!190750) (not e!211339))))

(declare-datatypes ((List!4927 0))(
  ( (Nil!4924) (Cons!4923 (h!5779 (_ BitVec 64)) (t!10035 List!4927)) )
))
(declare-fun arrayNoDuplicates!0 (array!18344 (_ BitVec 32) List!4927) Bool)

(assert (=> b!344788 (= res!190750 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4924))))

(declare-fun res!190751 () Bool)

(assert (=> start!34492 (=> (not res!190751) (not e!211339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34492 (= res!190751 (validMask!0 mask!2385))))

(assert (=> start!34492 e!211339))

(assert (=> start!34492 true))

(assert (=> start!34492 tp_is_empty!7381))

(assert (=> start!34492 tp!25832))

(declare-fun e!211340 () Bool)

(declare-fun array_inv!6416 (array!18346) Bool)

(assert (=> start!34492 (and (array_inv!6416 _values!1525) e!211340)))

(declare-fun array_inv!6417 (array!18344) Bool)

(assert (=> start!34492 (array_inv!6417 _keys!1895)))

(declare-fun b!344789 () Bool)

(declare-fun e!211337 () Bool)

(assert (=> b!344789 (= e!211337 tp_is_empty!7381)))

(declare-fun b!344790 () Bool)

(declare-fun res!190753 () Bool)

(assert (=> b!344790 (=> (not res!190753) (not e!211339))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344790 (= res!190753 (and (= (size!9041 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9040 _keys!1895) (size!9041 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344791 () Bool)

(declare-fun res!190754 () Bool)

(assert (=> b!344791 (=> (not res!190754) (not e!211339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344791 (= res!190754 (validKeyInArray!0 k0!1348))))

(declare-fun b!344792 () Bool)

(declare-fun res!190749 () Bool)

(assert (=> b!344792 (=> (not res!190749) (not e!211339))))

(declare-fun zeroValue!1467 () V!10819)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10819)

(declare-datatypes ((tuple2!5322 0))(
  ( (tuple2!5323 (_1!2672 (_ BitVec 64)) (_2!2672 V!10819)) )
))
(declare-datatypes ((List!4928 0))(
  ( (Nil!4925) (Cons!4924 (h!5780 tuple2!5322) (t!10036 List!4928)) )
))
(declare-datatypes ((ListLongMap!4237 0))(
  ( (ListLongMap!4238 (toList!2134 List!4928)) )
))
(declare-fun contains!2211 (ListLongMap!4237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1663 (array!18344 array!18346 (_ BitVec 32) (_ BitVec 32) V!10819 V!10819 (_ BitVec 32) Int) ListLongMap!4237)

(assert (=> b!344792 (= res!190749 (not (contains!2211 (getCurrentListMap!1663 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344793 () Bool)

(declare-fun res!190752 () Bool)

(assert (=> b!344793 (=> (not res!190752) (not e!211339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18344 (_ BitVec 32)) Bool)

(assert (=> b!344793 (= res!190752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344794 () Bool)

(assert (=> b!344794 (= e!211340 (and e!211337 mapRes!12510))))

(declare-fun condMapEmpty!12510 () Bool)

(declare-fun mapDefault!12510 () ValueCell!3347)

(assert (=> b!344794 (= condMapEmpty!12510 (= (arr!8689 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3347)) mapDefault!12510)))))

(declare-fun mapIsEmpty!12510 () Bool)

(assert (=> mapIsEmpty!12510 mapRes!12510))

(assert (= (and start!34492 res!190751) b!344790))

(assert (= (and b!344790 res!190753) b!344793))

(assert (= (and b!344793 res!190752) b!344788))

(assert (= (and b!344788 res!190750) b!344791))

(assert (= (and b!344791 res!190754) b!344792))

(assert (= (and b!344792 res!190749) b!344786))

(assert (= (and b!344794 condMapEmpty!12510) mapIsEmpty!12510))

(assert (= (and b!344794 (not condMapEmpty!12510)) mapNonEmpty!12510))

(get-info :version)

(assert (= (and mapNonEmpty!12510 ((_ is ValueCellFull!3347) mapValue!12510)) b!344787))

(assert (= (and b!344794 ((_ is ValueCellFull!3347) mapDefault!12510)) b!344789))

(assert (= start!34492 b!344794))

(declare-fun m!346581 () Bool)

(assert (=> b!344791 m!346581))

(declare-fun m!346583 () Bool)

(assert (=> mapNonEmpty!12510 m!346583))

(declare-fun m!346585 () Bool)

(assert (=> b!344786 m!346585))

(declare-fun m!346587 () Bool)

(assert (=> b!344792 m!346587))

(assert (=> b!344792 m!346587))

(declare-fun m!346589 () Bool)

(assert (=> b!344792 m!346589))

(declare-fun m!346591 () Bool)

(assert (=> b!344793 m!346591))

(declare-fun m!346593 () Bool)

(assert (=> start!34492 m!346593))

(declare-fun m!346595 () Bool)

(assert (=> start!34492 m!346595))

(declare-fun m!346597 () Bool)

(assert (=> start!34492 m!346597))

(declare-fun m!346599 () Bool)

(assert (=> b!344788 m!346599))

(check-sat (not mapNonEmpty!12510) (not b!344786) (not b!344793) (not b_next!7429) b_and!14651 (not start!34492) (not b!344791) tp_is_empty!7381 (not b!344788) (not b!344792))
(check-sat b_and!14651 (not b_next!7429))
