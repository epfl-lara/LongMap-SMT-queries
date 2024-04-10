; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34720 () Bool)

(assert start!34720)

(declare-fun b_free!7527 () Bool)

(declare-fun b_next!7527 () Bool)

(assert (=> start!34720 (= b_free!7527 (not b_next!7527))))

(declare-fun tp!26144 () Bool)

(declare-fun b_and!14747 () Bool)

(assert (=> start!34720 (= tp!26144 b_and!14747)))

(declare-fun b!347111 () Bool)

(declare-fun e!212702 () Bool)

(declare-fun e!212705 () Bool)

(assert (=> b!347111 (= e!212702 e!212705)))

(declare-fun res!192095 () Bool)

(assert (=> b!347111 (=> (not res!192095) (not e!212705))))

(declare-datatypes ((SeekEntryResult!3389 0))(
  ( (MissingZero!3389 (index!15735 (_ BitVec 32))) (Found!3389 (index!15736 (_ BitVec 32))) (Intermediate!3389 (undefined!4201 Bool) (index!15737 (_ BitVec 32)) (x!34579 (_ BitVec 32))) (Undefined!3389) (MissingVacant!3389 (index!15738 (_ BitVec 32))) )
))
(declare-fun lt!163491 () SeekEntryResult!3389)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18549 0))(
  ( (array!18550 (arr!8785 (Array (_ BitVec 32) (_ BitVec 64))) (size!9137 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18549)

(get-info :version)

(assert (=> b!347111 (= res!192095 (and ((_ is Found!3389) lt!163491) (= (select (arr!8785 _keys!1895) (index!15736 lt!163491)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18549 (_ BitVec 32)) SeekEntryResult!3389)

(assert (=> b!347111 (= lt!163491 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347112 () Bool)

(declare-fun res!192092 () Bool)

(assert (=> b!347112 (=> (not res!192092) (not e!212702))))

(declare-datatypes ((V!10949 0))(
  ( (V!10950 (val!3784 Int)) )
))
(declare-fun zeroValue!1467 () V!10949)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3396 0))(
  ( (ValueCellFull!3396 (v!5966 V!10949)) (EmptyCell!3396) )
))
(declare-datatypes ((array!18551 0))(
  ( (array!18552 (arr!8786 (Array (_ BitVec 32) ValueCell!3396)) (size!9138 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18551)

(declare-fun minValue!1467 () V!10949)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5478 0))(
  ( (tuple2!5479 (_1!2750 (_ BitVec 64)) (_2!2750 V!10949)) )
))
(declare-datatypes ((List!5099 0))(
  ( (Nil!5096) (Cons!5095 (h!5951 tuple2!5478) (t!10227 List!5099)) )
))
(declare-datatypes ((ListLongMap!4391 0))(
  ( (ListLongMap!4392 (toList!2211 List!5099)) )
))
(declare-fun contains!2275 (ListLongMap!4391 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1732 (array!18549 array!18551 (_ BitVec 32) (_ BitVec 32) V!10949 V!10949 (_ BitVec 32) Int) ListLongMap!4391)

(assert (=> b!347112 (= res!192092 (not (contains!2275 (getCurrentListMap!1732 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!192097 () Bool)

(assert (=> start!34720 (=> (not res!192097) (not e!212702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34720 (= res!192097 (validMask!0 mask!2385))))

(assert (=> start!34720 e!212702))

(assert (=> start!34720 true))

(declare-fun tp_is_empty!7479 () Bool)

(assert (=> start!34720 tp_is_empty!7479))

(assert (=> start!34720 tp!26144))

(declare-fun e!212706 () Bool)

(declare-fun array_inv!6506 (array!18551) Bool)

(assert (=> start!34720 (and (array_inv!6506 _values!1525) e!212706)))

(declare-fun array_inv!6507 (array!18549) Bool)

(assert (=> start!34720 (array_inv!6507 _keys!1895)))

(declare-fun b!347113 () Bool)

(declare-fun e!212701 () Bool)

(declare-fun mapRes!12675 () Bool)

(assert (=> b!347113 (= e!212706 (and e!212701 mapRes!12675))))

(declare-fun condMapEmpty!12675 () Bool)

(declare-fun mapDefault!12675 () ValueCell!3396)

(assert (=> b!347113 (= condMapEmpty!12675 (= (arr!8786 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3396)) mapDefault!12675)))))

(declare-fun b!347114 () Bool)

(declare-fun e!212703 () Bool)

(assert (=> b!347114 (= e!212703 tp_is_empty!7479)))

(declare-fun b!347115 () Bool)

(assert (=> b!347115 (= e!212705 (not true))))

(declare-fun arrayContainsKey!0 (array!18549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347115 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10775 0))(
  ( (Unit!10776) )
))
(declare-fun lt!163492 () Unit!10775)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18549 (_ BitVec 64) (_ BitVec 32)) Unit!10775)

(assert (=> b!347115 (= lt!163492 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15736 lt!163491)))))

(declare-fun b!347116 () Bool)

(declare-fun res!192094 () Bool)

(assert (=> b!347116 (=> (not res!192094) (not e!212702))))

(assert (=> b!347116 (= res!192094 (and (= (size!9138 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9137 _keys!1895) (size!9138 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12675 () Bool)

(assert (=> mapIsEmpty!12675 mapRes!12675))

(declare-fun b!347117 () Bool)

(declare-fun res!192096 () Bool)

(assert (=> b!347117 (=> (not res!192096) (not e!212705))))

(assert (=> b!347117 (= res!192096 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15736 lt!163491)))))

(declare-fun b!347118 () Bool)

(declare-fun res!192098 () Bool)

(assert (=> b!347118 (=> (not res!192098) (not e!212702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347118 (= res!192098 (validKeyInArray!0 k0!1348))))

(declare-fun b!347119 () Bool)

(declare-fun res!192093 () Bool)

(assert (=> b!347119 (=> (not res!192093) (not e!212702))))

(declare-datatypes ((List!5100 0))(
  ( (Nil!5097) (Cons!5096 (h!5952 (_ BitVec 64)) (t!10228 List!5100)) )
))
(declare-fun arrayNoDuplicates!0 (array!18549 (_ BitVec 32) List!5100) Bool)

(assert (=> b!347119 (= res!192093 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5097))))

(declare-fun b!347120 () Bool)

(declare-fun res!192091 () Bool)

(assert (=> b!347120 (=> (not res!192091) (not e!212702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18549 (_ BitVec 32)) Bool)

(assert (=> b!347120 (= res!192091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12675 () Bool)

(declare-fun tp!26145 () Bool)

(assert (=> mapNonEmpty!12675 (= mapRes!12675 (and tp!26145 e!212703))))

(declare-fun mapValue!12675 () ValueCell!3396)

(declare-fun mapKey!12675 () (_ BitVec 32))

(declare-fun mapRest!12675 () (Array (_ BitVec 32) ValueCell!3396))

(assert (=> mapNonEmpty!12675 (= (arr!8786 _values!1525) (store mapRest!12675 mapKey!12675 mapValue!12675))))

(declare-fun b!347121 () Bool)

(assert (=> b!347121 (= e!212701 tp_is_empty!7479)))

(assert (= (and start!34720 res!192097) b!347116))

(assert (= (and b!347116 res!192094) b!347120))

(assert (= (and b!347120 res!192091) b!347119))

(assert (= (and b!347119 res!192093) b!347118))

(assert (= (and b!347118 res!192098) b!347112))

(assert (= (and b!347112 res!192092) b!347111))

(assert (= (and b!347111 res!192095) b!347117))

(assert (= (and b!347117 res!192096) b!347115))

(assert (= (and b!347113 condMapEmpty!12675) mapIsEmpty!12675))

(assert (= (and b!347113 (not condMapEmpty!12675)) mapNonEmpty!12675))

(assert (= (and mapNonEmpty!12675 ((_ is ValueCellFull!3396) mapValue!12675)) b!347114))

(assert (= (and b!347113 ((_ is ValueCellFull!3396) mapDefault!12675)) b!347121))

(assert (= start!34720 b!347113))

(declare-fun m!348091 () Bool)

(assert (=> b!347119 m!348091))

(declare-fun m!348093 () Bool)

(assert (=> b!347117 m!348093))

(declare-fun m!348095 () Bool)

(assert (=> start!34720 m!348095))

(declare-fun m!348097 () Bool)

(assert (=> start!34720 m!348097))

(declare-fun m!348099 () Bool)

(assert (=> start!34720 m!348099))

(declare-fun m!348101 () Bool)

(assert (=> mapNonEmpty!12675 m!348101))

(declare-fun m!348103 () Bool)

(assert (=> b!347111 m!348103))

(declare-fun m!348105 () Bool)

(assert (=> b!347111 m!348105))

(declare-fun m!348107 () Bool)

(assert (=> b!347118 m!348107))

(declare-fun m!348109 () Bool)

(assert (=> b!347115 m!348109))

(declare-fun m!348111 () Bool)

(assert (=> b!347115 m!348111))

(declare-fun m!348113 () Bool)

(assert (=> b!347120 m!348113))

(declare-fun m!348115 () Bool)

(assert (=> b!347112 m!348115))

(assert (=> b!347112 m!348115))

(declare-fun m!348117 () Bool)

(assert (=> b!347112 m!348117))

(check-sat tp_is_empty!7479 (not b!347115) (not b!347118) (not b!347117) (not b!347111) (not b!347112) (not b!347120) (not mapNonEmpty!12675) (not b_next!7527) (not start!34720) b_and!14747 (not b!347119))
(check-sat b_and!14747 (not b_next!7527))
