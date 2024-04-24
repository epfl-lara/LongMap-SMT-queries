; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34704 () Bool)

(assert start!34704)

(declare-fun b_free!7525 () Bool)

(declare-fun b_next!7525 () Bool)

(assert (=> start!34704 (= b_free!7525 (not b_next!7525))))

(declare-fun tp!26139 () Bool)

(declare-fun b_and!14759 () Bool)

(assert (=> start!34704 (= tp!26139 b_and!14759)))

(declare-fun b!347025 () Bool)

(declare-fun res!192067 () Bool)

(declare-fun e!212653 () Bool)

(assert (=> b!347025 (=> (not res!192067) (not e!212653))))

(declare-datatypes ((SeekEntryResult!3340 0))(
  ( (MissingZero!3340 (index!15539 (_ BitVec 32))) (Found!3340 (index!15540 (_ BitVec 32))) (Intermediate!3340 (undefined!4152 Bool) (index!15541 (_ BitVec 32)) (x!34527 (_ BitVec 32))) (Undefined!3340) (MissingVacant!3340 (index!15542 (_ BitVec 32))) )
))
(declare-fun lt!163503 () SeekEntryResult!3340)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18536 0))(
  ( (array!18537 (arr!8778 (Array (_ BitVec 32) (_ BitVec 64))) (size!9130 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18536)

(declare-fun arrayContainsKey!0 (array!18536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347025 (= res!192067 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15540 lt!163503)))))

(declare-fun b!347026 () Bool)

(declare-fun res!192068 () Bool)

(declare-fun e!212654 () Bool)

(assert (=> b!347026 (=> (not res!192068) (not e!212654))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18536 (_ BitVec 32)) Bool)

(assert (=> b!347026 (= res!192068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347027 () Bool)

(declare-fun res!192069 () Bool)

(assert (=> b!347027 (=> (not res!192069) (not e!212654))))

(declare-datatypes ((List!4994 0))(
  ( (Nil!4991) (Cons!4990 (h!5846 (_ BitVec 64)) (t!10114 List!4994)) )
))
(declare-fun arrayNoDuplicates!0 (array!18536 (_ BitVec 32) List!4994) Bool)

(assert (=> b!347027 (= res!192069 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4991))))

(declare-fun b!347028 () Bool)

(assert (=> b!347028 (= e!212654 e!212653)))

(declare-fun res!192070 () Bool)

(assert (=> b!347028 (=> (not res!192070) (not e!212653))))

(get-info :version)

(assert (=> b!347028 (= res!192070 (and ((_ is Found!3340) lt!163503) (= (select (arr!8778 _keys!1895) (index!15540 lt!163503)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18536 (_ BitVec 32)) SeekEntryResult!3340)

(assert (=> b!347028 (= lt!163503 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347029 () Bool)

(declare-fun e!212649 () Bool)

(declare-fun tp_is_empty!7477 () Bool)

(assert (=> b!347029 (= e!212649 tp_is_empty!7477)))

(declare-fun mapNonEmpty!12672 () Bool)

(declare-fun mapRes!12672 () Bool)

(declare-fun tp!26138 () Bool)

(assert (=> mapNonEmpty!12672 (= mapRes!12672 (and tp!26138 e!212649))))

(declare-datatypes ((V!10947 0))(
  ( (V!10948 (val!3783 Int)) )
))
(declare-datatypes ((ValueCell!3395 0))(
  ( (ValueCellFull!3395 (v!5966 V!10947)) (EmptyCell!3395) )
))
(declare-fun mapRest!12672 () (Array (_ BitVec 32) ValueCell!3395))

(declare-fun mapKey!12672 () (_ BitVec 32))

(declare-fun mapValue!12672 () ValueCell!3395)

(declare-datatypes ((array!18538 0))(
  ( (array!18539 (arr!8779 (Array (_ BitVec 32) ValueCell!3395)) (size!9131 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18538)

(assert (=> mapNonEmpty!12672 (= (arr!8779 _values!1525) (store mapRest!12672 mapKey!12672 mapValue!12672))))

(declare-fun b!347030 () Bool)

(declare-fun e!212652 () Bool)

(assert (=> b!347030 (= e!212652 tp_is_empty!7477)))

(declare-fun b!347031 () Bool)

(assert (=> b!347031 (= e!212653 (not true))))

(assert (=> b!347031 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10741 0))(
  ( (Unit!10742) )
))
(declare-fun lt!163504 () Unit!10741)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18536 (_ BitVec 64) (_ BitVec 32)) Unit!10741)

(assert (=> b!347031 (= lt!163504 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15540 lt!163503)))))

(declare-fun mapIsEmpty!12672 () Bool)

(assert (=> mapIsEmpty!12672 mapRes!12672))

(declare-fun b!347033 () Bool)

(declare-fun res!192064 () Bool)

(assert (=> b!347033 (=> (not res!192064) (not e!212654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347033 (= res!192064 (validKeyInArray!0 k0!1348))))

(declare-fun b!347034 () Bool)

(declare-fun res!192066 () Bool)

(assert (=> b!347034 (=> (not res!192066) (not e!212654))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347034 (= res!192066 (and (= (size!9131 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9130 _keys!1895) (size!9131 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347035 () Bool)

(declare-fun e!212651 () Bool)

(assert (=> b!347035 (= e!212651 (and e!212652 mapRes!12672))))

(declare-fun condMapEmpty!12672 () Bool)

(declare-fun mapDefault!12672 () ValueCell!3395)

(assert (=> b!347035 (= condMapEmpty!12672 (= (arr!8779 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3395)) mapDefault!12672)))))

(declare-fun b!347032 () Bool)

(declare-fun res!192071 () Bool)

(assert (=> b!347032 (=> (not res!192071) (not e!212654))))

(declare-fun zeroValue!1467 () V!10947)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10947)

(declare-datatypes ((tuple2!5388 0))(
  ( (tuple2!5389 (_1!2705 (_ BitVec 64)) (_2!2705 V!10947)) )
))
(declare-datatypes ((List!4995 0))(
  ( (Nil!4992) (Cons!4991 (h!5847 tuple2!5388) (t!10115 List!4995)) )
))
(declare-datatypes ((ListLongMap!4303 0))(
  ( (ListLongMap!4304 (toList!2167 List!4995)) )
))
(declare-fun contains!2250 (ListLongMap!4303 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1696 (array!18536 array!18538 (_ BitVec 32) (_ BitVec 32) V!10947 V!10947 (_ BitVec 32) Int) ListLongMap!4303)

(assert (=> b!347032 (= res!192071 (not (contains!2250 (getCurrentListMap!1696 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!192065 () Bool)

(assert (=> start!34704 (=> (not res!192065) (not e!212654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34704 (= res!192065 (validMask!0 mask!2385))))

(assert (=> start!34704 e!212654))

(assert (=> start!34704 true))

(assert (=> start!34704 tp_is_empty!7477))

(assert (=> start!34704 tp!26139))

(declare-fun array_inv!6488 (array!18538) Bool)

(assert (=> start!34704 (and (array_inv!6488 _values!1525) e!212651)))

(declare-fun array_inv!6489 (array!18536) Bool)

(assert (=> start!34704 (array_inv!6489 _keys!1895)))

(assert (= (and start!34704 res!192065) b!347034))

(assert (= (and b!347034 res!192066) b!347026))

(assert (= (and b!347026 res!192068) b!347027))

(assert (= (and b!347027 res!192069) b!347033))

(assert (= (and b!347033 res!192064) b!347032))

(assert (= (and b!347032 res!192071) b!347028))

(assert (= (and b!347028 res!192070) b!347025))

(assert (= (and b!347025 res!192067) b!347031))

(assert (= (and b!347035 condMapEmpty!12672) mapIsEmpty!12672))

(assert (= (and b!347035 (not condMapEmpty!12672)) mapNonEmpty!12672))

(assert (= (and mapNonEmpty!12672 ((_ is ValueCellFull!3395) mapValue!12672)) b!347029))

(assert (= (and b!347035 ((_ is ValueCellFull!3395) mapDefault!12672)) b!347030))

(assert (= start!34704 b!347035))

(declare-fun m!348287 () Bool)

(assert (=> b!347031 m!348287))

(declare-fun m!348289 () Bool)

(assert (=> b!347031 m!348289))

(declare-fun m!348291 () Bool)

(assert (=> b!347027 m!348291))

(declare-fun m!348293 () Bool)

(assert (=> b!347033 m!348293))

(declare-fun m!348295 () Bool)

(assert (=> b!347026 m!348295))

(declare-fun m!348297 () Bool)

(assert (=> b!347028 m!348297))

(declare-fun m!348299 () Bool)

(assert (=> b!347028 m!348299))

(declare-fun m!348301 () Bool)

(assert (=> mapNonEmpty!12672 m!348301))

(declare-fun m!348303 () Bool)

(assert (=> b!347032 m!348303))

(assert (=> b!347032 m!348303))

(declare-fun m!348305 () Bool)

(assert (=> b!347032 m!348305))

(declare-fun m!348307 () Bool)

(assert (=> b!347025 m!348307))

(declare-fun m!348309 () Bool)

(assert (=> start!34704 m!348309))

(declare-fun m!348311 () Bool)

(assert (=> start!34704 m!348311))

(declare-fun m!348313 () Bool)

(assert (=> start!34704 m!348313))

(check-sat (not b_next!7525) (not b!347025) (not b!347028) (not b!347031) b_and!14759 (not start!34704) (not b!347026) (not b!347032) (not b!347027) (not b!347033) (not mapNonEmpty!12672) tp_is_empty!7477)
(check-sat b_and!14759 (not b_next!7525))
