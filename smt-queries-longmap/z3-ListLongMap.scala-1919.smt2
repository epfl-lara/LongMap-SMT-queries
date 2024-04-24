; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34146 () Bool)

(assert start!34146)

(declare-fun b_free!7183 () Bool)

(declare-fun b_next!7183 () Bool)

(assert (=> start!34146 (= b_free!7183 (not b_next!7183))))

(declare-fun tp!25083 () Bool)

(declare-fun b_and!14397 () Bool)

(assert (=> start!34146 (= tp!25083 b_and!14397)))

(declare-fun b!340324 () Bool)

(declare-fun e!208781 () Bool)

(declare-fun tp_is_empty!7135 () Bool)

(assert (=> b!340324 (= e!208781 tp_is_empty!7135)))

(declare-fun b!340325 () Bool)

(declare-fun res!187984 () Bool)

(declare-fun e!208782 () Bool)

(assert (=> b!340325 (=> (not res!187984) (not e!208782))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10491 0))(
  ( (V!10492 (val!3612 Int)) )
))
(declare-datatypes ((ValueCell!3224 0))(
  ( (ValueCellFull!3224 (v!5785 V!10491)) (EmptyCell!3224) )
))
(declare-datatypes ((array!17856 0))(
  ( (array!17857 (arr!8448 (Array (_ BitVec 32) ValueCell!3224)) (size!8800 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17856)

(declare-datatypes ((array!17858 0))(
  ( (array!17859 (arr!8449 (Array (_ BitVec 32) (_ BitVec 64))) (size!8801 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17858)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340325 (= res!187984 (and (= (size!8800 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8801 _keys!1895) (size!8800 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!340326 () Bool)

(declare-fun res!187981 () Bool)

(assert (=> b!340326 (=> (not res!187981) (not e!208782))))

(declare-datatypes ((List!4759 0))(
  ( (Nil!4756) (Cons!4755 (h!5611 (_ BitVec 64)) (t!9859 List!4759)) )
))
(declare-fun arrayNoDuplicates!0 (array!17858 (_ BitVec 32) List!4759) Bool)

(assert (=> b!340326 (= res!187981 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4756))))

(declare-fun b!340327 () Bool)

(assert (=> b!340327 (= e!208782 false)))

(declare-datatypes ((SeekEntryResult!3220 0))(
  ( (MissingZero!3220 (index!15059 (_ BitVec 32))) (Found!3220 (index!15060 (_ BitVec 32))) (Intermediate!3220 (undefined!4032 Bool) (index!15061 (_ BitVec 32)) (x!33851 (_ BitVec 32))) (Undefined!3220) (MissingVacant!3220 (index!15062 (_ BitVec 32))) )
))
(declare-fun lt!161599 () SeekEntryResult!3220)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17858 (_ BitVec 32)) SeekEntryResult!3220)

(assert (=> b!340327 (= lt!161599 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340328 () Bool)

(declare-fun e!208783 () Bool)

(declare-fun mapRes!12129 () Bool)

(assert (=> b!340328 (= e!208783 (and e!208781 mapRes!12129))))

(declare-fun condMapEmpty!12129 () Bool)

(declare-fun mapDefault!12129 () ValueCell!3224)

(assert (=> b!340328 (= condMapEmpty!12129 (= (arr!8448 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3224)) mapDefault!12129)))))

(declare-fun res!187980 () Bool)

(assert (=> start!34146 (=> (not res!187980) (not e!208782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34146 (= res!187980 (validMask!0 mask!2385))))

(assert (=> start!34146 e!208782))

(assert (=> start!34146 true))

(assert (=> start!34146 tp_is_empty!7135))

(assert (=> start!34146 tp!25083))

(declare-fun array_inv!6260 (array!17856) Bool)

(assert (=> start!34146 (and (array_inv!6260 _values!1525) e!208783)))

(declare-fun array_inv!6261 (array!17858) Bool)

(assert (=> start!34146 (array_inv!6261 _keys!1895)))

(declare-fun b!340329 () Bool)

(declare-fun res!187983 () Bool)

(assert (=> b!340329 (=> (not res!187983) (not e!208782))))

(declare-fun zeroValue!1467 () V!10491)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10491)

(declare-datatypes ((tuple2!5150 0))(
  ( (tuple2!5151 (_1!2586 (_ BitVec 64)) (_2!2586 V!10491)) )
))
(declare-datatypes ((List!4760 0))(
  ( (Nil!4757) (Cons!4756 (h!5612 tuple2!5150) (t!9860 List!4760)) )
))
(declare-datatypes ((ListLongMap!4065 0))(
  ( (ListLongMap!4066 (toList!2048 List!4760)) )
))
(declare-fun contains!2121 (ListLongMap!4065 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1577 (array!17858 array!17856 (_ BitVec 32) (_ BitVec 32) V!10491 V!10491 (_ BitVec 32) Int) ListLongMap!4065)

(assert (=> b!340329 (= res!187983 (not (contains!2121 (getCurrentListMap!1577 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340330 () Bool)

(declare-fun res!187982 () Bool)

(assert (=> b!340330 (=> (not res!187982) (not e!208782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340330 (= res!187982 (validKeyInArray!0 k0!1348))))

(declare-fun b!340331 () Bool)

(declare-fun res!187985 () Bool)

(assert (=> b!340331 (=> (not res!187985) (not e!208782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17858 (_ BitVec 32)) Bool)

(assert (=> b!340331 (= res!187985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340332 () Bool)

(declare-fun e!208780 () Bool)

(assert (=> b!340332 (= e!208780 tp_is_empty!7135)))

(declare-fun mapIsEmpty!12129 () Bool)

(assert (=> mapIsEmpty!12129 mapRes!12129))

(declare-fun mapNonEmpty!12129 () Bool)

(declare-fun tp!25082 () Bool)

(assert (=> mapNonEmpty!12129 (= mapRes!12129 (and tp!25082 e!208780))))

(declare-fun mapValue!12129 () ValueCell!3224)

(declare-fun mapRest!12129 () (Array (_ BitVec 32) ValueCell!3224))

(declare-fun mapKey!12129 () (_ BitVec 32))

(assert (=> mapNonEmpty!12129 (= (arr!8448 _values!1525) (store mapRest!12129 mapKey!12129 mapValue!12129))))

(assert (= (and start!34146 res!187980) b!340325))

(assert (= (and b!340325 res!187984) b!340331))

(assert (= (and b!340331 res!187985) b!340326))

(assert (= (and b!340326 res!187981) b!340330))

(assert (= (and b!340330 res!187982) b!340329))

(assert (= (and b!340329 res!187983) b!340327))

(assert (= (and b!340328 condMapEmpty!12129) mapIsEmpty!12129))

(assert (= (and b!340328 (not condMapEmpty!12129)) mapNonEmpty!12129))

(get-info :version)

(assert (= (and mapNonEmpty!12129 ((_ is ValueCellFull!3224) mapValue!12129)) b!340332))

(assert (= (and b!340328 ((_ is ValueCellFull!3224) mapDefault!12129)) b!340324))

(assert (= start!34146 b!340328))

(declare-fun m!343323 () Bool)

(assert (=> start!34146 m!343323))

(declare-fun m!343325 () Bool)

(assert (=> start!34146 m!343325))

(declare-fun m!343327 () Bool)

(assert (=> start!34146 m!343327))

(declare-fun m!343329 () Bool)

(assert (=> b!340329 m!343329))

(assert (=> b!340329 m!343329))

(declare-fun m!343331 () Bool)

(assert (=> b!340329 m!343331))

(declare-fun m!343333 () Bool)

(assert (=> b!340331 m!343333))

(declare-fun m!343335 () Bool)

(assert (=> b!340330 m!343335))

(declare-fun m!343337 () Bool)

(assert (=> b!340326 m!343337))

(declare-fun m!343339 () Bool)

(assert (=> b!340327 m!343339))

(declare-fun m!343341 () Bool)

(assert (=> mapNonEmpty!12129 m!343341))

(check-sat (not mapNonEmpty!12129) (not start!34146) (not b!340331) (not b!340326) tp_is_empty!7135 (not b!340327) (not b!340329) b_and!14397 (not b!340330) (not b_next!7183))
(check-sat b_and!14397 (not b_next!7183))
