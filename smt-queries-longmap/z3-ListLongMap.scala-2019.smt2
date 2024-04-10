; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35192 () Bool)

(assert start!35192)

(declare-fun b_free!7785 () Bool)

(declare-fun b_next!7785 () Bool)

(assert (=> start!35192 (= b_free!7785 (not b_next!7785))))

(declare-fun tp!26945 () Bool)

(declare-fun b_and!15023 () Bool)

(assert (=> start!35192 (= tp!26945 b_and!15023)))

(declare-fun b!352807 () Bool)

(declare-fun res!195642 () Bool)

(declare-fun e!216039 () Bool)

(assert (=> b!352807 (=> (not res!195642) (not e!216039))))

(declare-datatypes ((array!19063 0))(
  ( (array!19064 (arr!9033 (Array (_ BitVec 32) (_ BitVec 64))) (size!9385 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19063)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19063 (_ BitVec 32)) Bool)

(assert (=> b!352807 (= res!195642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!352808 () Bool)

(declare-fun e!216040 () Bool)

(declare-fun tp_is_empty!7737 () Bool)

(assert (=> b!352808 (= e!216040 tp_is_empty!7737)))

(declare-fun b!352809 () Bool)

(declare-fun res!195645 () Bool)

(assert (=> b!352809 (=> (not res!195645) (not e!216039))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11293 0))(
  ( (V!11294 (val!3913 Int)) )
))
(declare-fun zeroValue!1467 () V!11293)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3525 0))(
  ( (ValueCellFull!3525 (v!6104 V!11293)) (EmptyCell!3525) )
))
(declare-datatypes ((array!19065 0))(
  ( (array!19066 (arr!9034 (Array (_ BitVec 32) ValueCell!3525)) (size!9386 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19065)

(declare-fun minValue!1467 () V!11293)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((tuple2!5638 0))(
  ( (tuple2!5639 (_1!2830 (_ BitVec 64)) (_2!2830 V!11293)) )
))
(declare-datatypes ((List!5257 0))(
  ( (Nil!5254) (Cons!5253 (h!6109 tuple2!5638) (t!10403 List!5257)) )
))
(declare-datatypes ((ListLongMap!4551 0))(
  ( (ListLongMap!4552 (toList!2291 List!5257)) )
))
(declare-fun contains!2364 (ListLongMap!4551 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1812 (array!19063 array!19065 (_ BitVec 32) (_ BitVec 32) V!11293 V!11293 (_ BitVec 32) Int) ListLongMap!4551)

(assert (=> b!352809 (= res!195645 (not (contains!2364 (getCurrentListMap!1812 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352810 () Bool)

(declare-datatypes ((SeekEntryResult!3475 0))(
  ( (MissingZero!3475 (index!16079 (_ BitVec 32))) (Found!3475 (index!16080 (_ BitVec 32))) (Intermediate!3475 (undefined!4287 Bool) (index!16081 (_ BitVec 32)) (x!35099 (_ BitVec 32))) (Undefined!3475) (MissingVacant!3475 (index!16082 (_ BitVec 32))) )
))
(declare-fun lt!165343 () SeekEntryResult!3475)

(get-info :version)

(assert (=> b!352810 (= e!216039 (and (not ((_ is Found!3475) lt!165343)) (not ((_ is MissingZero!3475) lt!165343)) (not ((_ is MissingVacant!3475) lt!165343)) ((_ is Undefined!3475) lt!165343) (not ((_ is Undefined!3475) lt!165343))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19063 (_ BitVec 32)) SeekEntryResult!3475)

(assert (=> b!352810 (= lt!165343 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352811 () Bool)

(declare-fun res!195647 () Bool)

(assert (=> b!352811 (=> (not res!195647) (not e!216039))))

(assert (=> b!352811 (= res!195647 (and (= (size!9386 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9385 _keys!1895) (size!9386 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352812 () Bool)

(declare-fun res!195646 () Bool)

(assert (=> b!352812 (=> (not res!195646) (not e!216039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352812 (= res!195646 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!13089 () Bool)

(declare-fun mapRes!13089 () Bool)

(declare-fun tp!26946 () Bool)

(assert (=> mapNonEmpty!13089 (= mapRes!13089 (and tp!26946 e!216040))))

(declare-fun mapRest!13089 () (Array (_ BitVec 32) ValueCell!3525))

(declare-fun mapValue!13089 () ValueCell!3525)

(declare-fun mapKey!13089 () (_ BitVec 32))

(assert (=> mapNonEmpty!13089 (= (arr!9034 _values!1525) (store mapRest!13089 mapKey!13089 mapValue!13089))))

(declare-fun res!195644 () Bool)

(assert (=> start!35192 (=> (not res!195644) (not e!216039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35192 (= res!195644 (validMask!0 mask!2385))))

(assert (=> start!35192 e!216039))

(assert (=> start!35192 true))

(assert (=> start!35192 tp_is_empty!7737))

(assert (=> start!35192 tp!26945))

(declare-fun e!216038 () Bool)

(declare-fun array_inv!6658 (array!19065) Bool)

(assert (=> start!35192 (and (array_inv!6658 _values!1525) e!216038)))

(declare-fun array_inv!6659 (array!19063) Bool)

(assert (=> start!35192 (array_inv!6659 _keys!1895)))

(declare-fun mapIsEmpty!13089 () Bool)

(assert (=> mapIsEmpty!13089 mapRes!13089))

(declare-fun b!352813 () Bool)

(declare-fun e!216042 () Bool)

(assert (=> b!352813 (= e!216038 (and e!216042 mapRes!13089))))

(declare-fun condMapEmpty!13089 () Bool)

(declare-fun mapDefault!13089 () ValueCell!3525)

(assert (=> b!352813 (= condMapEmpty!13089 (= (arr!9034 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3525)) mapDefault!13089)))))

(declare-fun b!352814 () Bool)

(declare-fun res!195643 () Bool)

(assert (=> b!352814 (=> (not res!195643) (not e!216039))))

(declare-datatypes ((List!5258 0))(
  ( (Nil!5255) (Cons!5254 (h!6110 (_ BitVec 64)) (t!10404 List!5258)) )
))
(declare-fun arrayNoDuplicates!0 (array!19063 (_ BitVec 32) List!5258) Bool)

(assert (=> b!352814 (= res!195643 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5255))))

(declare-fun b!352815 () Bool)

(assert (=> b!352815 (= e!216042 tp_is_empty!7737)))

(assert (= (and start!35192 res!195644) b!352811))

(assert (= (and b!352811 res!195647) b!352807))

(assert (= (and b!352807 res!195642) b!352814))

(assert (= (and b!352814 res!195643) b!352812))

(assert (= (and b!352812 res!195646) b!352809))

(assert (= (and b!352809 res!195645) b!352810))

(assert (= (and b!352813 condMapEmpty!13089) mapIsEmpty!13089))

(assert (= (and b!352813 (not condMapEmpty!13089)) mapNonEmpty!13089))

(assert (= (and mapNonEmpty!13089 ((_ is ValueCellFull!3525) mapValue!13089)) b!352808))

(assert (= (and b!352813 ((_ is ValueCellFull!3525) mapDefault!13089)) b!352815))

(assert (= start!35192 b!352813))

(declare-fun m!352347 () Bool)

(assert (=> b!352807 m!352347))

(declare-fun m!352349 () Bool)

(assert (=> mapNonEmpty!13089 m!352349))

(declare-fun m!352351 () Bool)

(assert (=> b!352812 m!352351))

(declare-fun m!352353 () Bool)

(assert (=> b!352814 m!352353))

(declare-fun m!352355 () Bool)

(assert (=> start!35192 m!352355))

(declare-fun m!352357 () Bool)

(assert (=> start!35192 m!352357))

(declare-fun m!352359 () Bool)

(assert (=> start!35192 m!352359))

(declare-fun m!352361 () Bool)

(assert (=> b!352809 m!352361))

(assert (=> b!352809 m!352361))

(declare-fun m!352363 () Bool)

(assert (=> b!352809 m!352363))

(declare-fun m!352365 () Bool)

(assert (=> b!352810 m!352365))

(check-sat (not b!352807) (not b!352809) (not b!352812) (not b_next!7785) (not mapNonEmpty!13089) tp_is_empty!7737 b_and!15023 (not b!352810) (not b!352814) (not start!35192))
(check-sat b_and!15023 (not b_next!7785))
