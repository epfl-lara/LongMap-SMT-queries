; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34508 () Bool)

(assert start!34508)

(declare-fun b_free!7431 () Bool)

(declare-fun b_next!7431 () Bool)

(assert (=> start!34508 (= b_free!7431 (not b_next!7431))))

(declare-fun tp!25839 () Bool)

(declare-fun b_and!14639 () Bool)

(assert (=> start!34508 (= tp!25839 b_and!14639)))

(declare-fun b!344866 () Bool)

(declare-fun res!190775 () Bool)

(declare-fun e!211387 () Bool)

(assert (=> b!344866 (=> (not res!190775) (not e!211387))))

(declare-datatypes ((array!18349 0))(
  ( (array!18350 (arr!8691 (Array (_ BitVec 32) (_ BitVec 64))) (size!9043 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18349)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18349 (_ BitVec 32)) Bool)

(assert (=> b!344866 (= res!190775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!190773 () Bool)

(assert (=> start!34508 (=> (not res!190773) (not e!211387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34508 (= res!190773 (validMask!0 mask!2385))))

(assert (=> start!34508 e!211387))

(assert (=> start!34508 true))

(declare-fun tp_is_empty!7383 () Bool)

(assert (=> start!34508 tp_is_empty!7383))

(assert (=> start!34508 tp!25839))

(declare-datatypes ((V!10821 0))(
  ( (V!10822 (val!3736 Int)) )
))
(declare-datatypes ((ValueCell!3348 0))(
  ( (ValueCellFull!3348 (v!5912 V!10821)) (EmptyCell!3348) )
))
(declare-datatypes ((array!18351 0))(
  ( (array!18352 (arr!8692 (Array (_ BitVec 32) ValueCell!3348)) (size!9044 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18351)

(declare-fun e!211386 () Bool)

(declare-fun array_inv!6432 (array!18351) Bool)

(assert (=> start!34508 (and (array_inv!6432 _values!1525) e!211386)))

(declare-fun array_inv!6433 (array!18349) Bool)

(assert (=> start!34508 (array_inv!6433 _keys!1895)))

(declare-fun b!344867 () Bool)

(assert (=> b!344867 (= e!211387 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3349 0))(
  ( (MissingZero!3349 (index!15575 (_ BitVec 32))) (Found!3349 (index!15576 (_ BitVec 32))) (Intermediate!3349 (undefined!4161 Bool) (index!15577 (_ BitVec 32)) (x!34351 (_ BitVec 32))) (Undefined!3349) (MissingVacant!3349 (index!15578 (_ BitVec 32))) )
))
(declare-fun lt!162721 () SeekEntryResult!3349)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18349 (_ BitVec 32)) SeekEntryResult!3349)

(assert (=> b!344867 (= lt!162721 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344868 () Bool)

(declare-fun res!190770 () Bool)

(assert (=> b!344868 (=> (not res!190770) (not e!211387))))

(declare-datatypes ((List!5027 0))(
  ( (Nil!5024) (Cons!5023 (h!5879 (_ BitVec 64)) (t!10143 List!5027)) )
))
(declare-fun arrayNoDuplicates!0 (array!18349 (_ BitVec 32) List!5027) Bool)

(assert (=> b!344868 (= res!190770 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5024))))

(declare-fun b!344869 () Bool)

(declare-fun res!190774 () Bool)

(assert (=> b!344869 (=> (not res!190774) (not e!211387))))

(declare-fun zeroValue!1467 () V!10821)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10821)

(declare-datatypes ((tuple2!5404 0))(
  ( (tuple2!5405 (_1!2713 (_ BitVec 64)) (_2!2713 V!10821)) )
))
(declare-datatypes ((List!5028 0))(
  ( (Nil!5025) (Cons!5024 (h!5880 tuple2!5404) (t!10144 List!5028)) )
))
(declare-datatypes ((ListLongMap!4317 0))(
  ( (ListLongMap!4318 (toList!2174 List!5028)) )
))
(declare-fun contains!2232 (ListLongMap!4317 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1695 (array!18349 array!18351 (_ BitVec 32) (_ BitVec 32) V!10821 V!10821 (_ BitVec 32) Int) ListLongMap!4317)

(assert (=> b!344869 (= res!190774 (not (contains!2232 (getCurrentListMap!1695 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344870 () Bool)

(declare-fun res!190771 () Bool)

(assert (=> b!344870 (=> (not res!190771) (not e!211387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344870 (= res!190771 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12513 () Bool)

(declare-fun mapRes!12513 () Bool)

(assert (=> mapIsEmpty!12513 mapRes!12513))

(declare-fun b!344871 () Bool)

(declare-fun e!211389 () Bool)

(assert (=> b!344871 (= e!211386 (and e!211389 mapRes!12513))))

(declare-fun condMapEmpty!12513 () Bool)

(declare-fun mapDefault!12513 () ValueCell!3348)

(assert (=> b!344871 (= condMapEmpty!12513 (= (arr!8692 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3348)) mapDefault!12513)))))

(declare-fun b!344872 () Bool)

(declare-fun res!190772 () Bool)

(assert (=> b!344872 (=> (not res!190772) (not e!211387))))

(assert (=> b!344872 (= res!190772 (and (= (size!9044 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9043 _keys!1895) (size!9044 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12513 () Bool)

(declare-fun tp!25838 () Bool)

(declare-fun e!211385 () Bool)

(assert (=> mapNonEmpty!12513 (= mapRes!12513 (and tp!25838 e!211385))))

(declare-fun mapKey!12513 () (_ BitVec 32))

(declare-fun mapRest!12513 () (Array (_ BitVec 32) ValueCell!3348))

(declare-fun mapValue!12513 () ValueCell!3348)

(assert (=> mapNonEmpty!12513 (= (arr!8692 _values!1525) (store mapRest!12513 mapKey!12513 mapValue!12513))))

(declare-fun b!344873 () Bool)

(assert (=> b!344873 (= e!211389 tp_is_empty!7383)))

(declare-fun b!344874 () Bool)

(assert (=> b!344874 (= e!211385 tp_is_empty!7383)))

(assert (= (and start!34508 res!190773) b!344872))

(assert (= (and b!344872 res!190772) b!344866))

(assert (= (and b!344866 res!190775) b!344868))

(assert (= (and b!344868 res!190770) b!344870))

(assert (= (and b!344870 res!190771) b!344869))

(assert (= (and b!344869 res!190774) b!344867))

(assert (= (and b!344871 condMapEmpty!12513) mapIsEmpty!12513))

(assert (= (and b!344871 (not condMapEmpty!12513)) mapNonEmpty!12513))

(get-info :version)

(assert (= (and mapNonEmpty!12513 ((_ is ValueCellFull!3348) mapValue!12513)) b!344874))

(assert (= (and b!344871 ((_ is ValueCellFull!3348) mapDefault!12513)) b!344873))

(assert (= start!34508 b!344871))

(declare-fun m!346377 () Bool)

(assert (=> b!344867 m!346377))

(declare-fun m!346379 () Bool)

(assert (=> b!344866 m!346379))

(declare-fun m!346381 () Bool)

(assert (=> mapNonEmpty!12513 m!346381))

(declare-fun m!346383 () Bool)

(assert (=> start!34508 m!346383))

(declare-fun m!346385 () Bool)

(assert (=> start!34508 m!346385))

(declare-fun m!346387 () Bool)

(assert (=> start!34508 m!346387))

(declare-fun m!346389 () Bool)

(assert (=> b!344870 m!346389))

(declare-fun m!346391 () Bool)

(assert (=> b!344869 m!346391))

(assert (=> b!344869 m!346391))

(declare-fun m!346393 () Bool)

(assert (=> b!344869 m!346393))

(declare-fun m!346395 () Bool)

(assert (=> b!344868 m!346395))

(check-sat (not b!344868) b_and!14639 (not b!344869) (not b!344866) (not start!34508) (not b!344870) (not mapNonEmpty!12513) (not b_next!7431) tp_is_empty!7383 (not b!344867))
(check-sat b_and!14639 (not b_next!7431))
