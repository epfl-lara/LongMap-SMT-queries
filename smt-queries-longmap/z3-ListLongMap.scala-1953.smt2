; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34466 () Bool)

(assert start!34466)

(declare-fun b_free!7389 () Bool)

(declare-fun b_next!7389 () Bool)

(assert (=> start!34466 (= b_free!7389 (not b_next!7389))))

(declare-fun tp!25713 () Bool)

(declare-fun b_and!14597 () Bool)

(assert (=> start!34466 (= tp!25713 b_and!14597)))

(declare-fun b!344299 () Bool)

(declare-fun res!190392 () Bool)

(declare-fun e!211074 () Bool)

(assert (=> b!344299 (=> (not res!190392) (not e!211074))))

(declare-datatypes ((array!18273 0))(
  ( (array!18274 (arr!8653 (Array (_ BitVec 32) (_ BitVec 64))) (size!9005 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18273)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18273 (_ BitVec 32)) Bool)

(assert (=> b!344299 (= res!190392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344300 () Bool)

(declare-fun res!190396 () Bool)

(assert (=> b!344300 (=> (not res!190396) (not e!211074))))

(declare-datatypes ((V!10765 0))(
  ( (V!10766 (val!3715 Int)) )
))
(declare-datatypes ((ValueCell!3327 0))(
  ( (ValueCellFull!3327 (v!5891 V!10765)) (EmptyCell!3327) )
))
(declare-datatypes ((array!18275 0))(
  ( (array!18276 (arr!8654 (Array (_ BitVec 32) ValueCell!3327)) (size!9006 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18275)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344300 (= res!190396 (and (= (size!9006 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9005 _keys!1895) (size!9006 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344301 () Bool)

(declare-fun res!190394 () Bool)

(assert (=> b!344301 (=> (not res!190394) (not e!211074))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10765)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10765)

(declare-datatypes ((tuple2!5380 0))(
  ( (tuple2!5381 (_1!2701 (_ BitVec 64)) (_2!2701 V!10765)) )
))
(declare-datatypes ((List!5000 0))(
  ( (Nil!4997) (Cons!4996 (h!5852 tuple2!5380) (t!10116 List!5000)) )
))
(declare-datatypes ((ListLongMap!4293 0))(
  ( (ListLongMap!4294 (toList!2162 List!5000)) )
))
(declare-fun contains!2220 (ListLongMap!4293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1683 (array!18273 array!18275 (_ BitVec 32) (_ BitVec 32) V!10765 V!10765 (_ BitVec 32) Int) ListLongMap!4293)

(assert (=> b!344301 (= res!190394 (not (contains!2220 (getCurrentListMap!1683 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12450 () Bool)

(declare-fun mapRes!12450 () Bool)

(declare-fun tp!25712 () Bool)

(declare-fun e!211073 () Bool)

(assert (=> mapNonEmpty!12450 (= mapRes!12450 (and tp!25712 e!211073))))

(declare-fun mapRest!12450 () (Array (_ BitVec 32) ValueCell!3327))

(declare-fun mapKey!12450 () (_ BitVec 32))

(declare-fun mapValue!12450 () ValueCell!3327)

(assert (=> mapNonEmpty!12450 (= (arr!8654 _values!1525) (store mapRest!12450 mapKey!12450 mapValue!12450))))

(declare-fun b!344302 () Bool)

(declare-fun e!211070 () Bool)

(declare-fun e!211072 () Bool)

(assert (=> b!344302 (= e!211070 (and e!211072 mapRes!12450))))

(declare-fun condMapEmpty!12450 () Bool)

(declare-fun mapDefault!12450 () ValueCell!3327)

(assert (=> b!344302 (= condMapEmpty!12450 (= (arr!8654 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3327)) mapDefault!12450)))))

(declare-fun res!190393 () Bool)

(assert (=> start!34466 (=> (not res!190393) (not e!211074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34466 (= res!190393 (validMask!0 mask!2385))))

(assert (=> start!34466 e!211074))

(assert (=> start!34466 true))

(declare-fun tp_is_empty!7341 () Bool)

(assert (=> start!34466 tp_is_empty!7341))

(assert (=> start!34466 tp!25713))

(declare-fun array_inv!6408 (array!18275) Bool)

(assert (=> start!34466 (and (array_inv!6408 _values!1525) e!211070)))

(declare-fun array_inv!6409 (array!18273) Bool)

(assert (=> start!34466 (array_inv!6409 _keys!1895)))

(declare-fun b!344303 () Bool)

(assert (=> b!344303 (= e!211072 tp_is_empty!7341)))

(declare-fun b!344304 () Bool)

(assert (=> b!344304 (= e!211073 tp_is_empty!7341)))

(declare-fun b!344305 () Bool)

(declare-fun res!190397 () Bool)

(assert (=> b!344305 (=> (not res!190397) (not e!211074))))

(declare-datatypes ((List!5001 0))(
  ( (Nil!4998) (Cons!4997 (h!5853 (_ BitVec 64)) (t!10117 List!5001)) )
))
(declare-fun arrayNoDuplicates!0 (array!18273 (_ BitVec 32) List!5001) Bool)

(assert (=> b!344305 (= res!190397 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4998))))

(declare-fun b!344306 () Bool)

(declare-fun res!190395 () Bool)

(assert (=> b!344306 (=> (not res!190395) (not e!211074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344306 (= res!190395 (validKeyInArray!0 k0!1348))))

(declare-fun b!344307 () Bool)

(assert (=> b!344307 (= e!211074 false)))

(declare-datatypes ((SeekEntryResult!3338 0))(
  ( (MissingZero!3338 (index!15531 (_ BitVec 32))) (Found!3338 (index!15532 (_ BitVec 32))) (Intermediate!3338 (undefined!4150 Bool) (index!15533 (_ BitVec 32)) (x!34284 (_ BitVec 32))) (Undefined!3338) (MissingVacant!3338 (index!15534 (_ BitVec 32))) )
))
(declare-fun lt!162658 () SeekEntryResult!3338)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18273 (_ BitVec 32)) SeekEntryResult!3338)

(assert (=> b!344307 (= lt!162658 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12450 () Bool)

(assert (=> mapIsEmpty!12450 mapRes!12450))

(assert (= (and start!34466 res!190393) b!344300))

(assert (= (and b!344300 res!190396) b!344299))

(assert (= (and b!344299 res!190392) b!344305))

(assert (= (and b!344305 res!190397) b!344306))

(assert (= (and b!344306 res!190395) b!344301))

(assert (= (and b!344301 res!190394) b!344307))

(assert (= (and b!344302 condMapEmpty!12450) mapIsEmpty!12450))

(assert (= (and b!344302 (not condMapEmpty!12450)) mapNonEmpty!12450))

(get-info :version)

(assert (= (and mapNonEmpty!12450 ((_ is ValueCellFull!3327) mapValue!12450)) b!344304))

(assert (= (and b!344302 ((_ is ValueCellFull!3327) mapDefault!12450)) b!344303))

(assert (= start!34466 b!344302))

(declare-fun m!345957 () Bool)

(assert (=> b!344305 m!345957))

(declare-fun m!345959 () Bool)

(assert (=> mapNonEmpty!12450 m!345959))

(declare-fun m!345961 () Bool)

(assert (=> b!344299 m!345961))

(declare-fun m!345963 () Bool)

(assert (=> b!344301 m!345963))

(assert (=> b!344301 m!345963))

(declare-fun m!345965 () Bool)

(assert (=> b!344301 m!345965))

(declare-fun m!345967 () Bool)

(assert (=> start!34466 m!345967))

(declare-fun m!345969 () Bool)

(assert (=> start!34466 m!345969))

(declare-fun m!345971 () Bool)

(assert (=> start!34466 m!345971))

(declare-fun m!345973 () Bool)

(assert (=> b!344307 m!345973))

(declare-fun m!345975 () Bool)

(assert (=> b!344306 m!345975))

(check-sat (not b!344307) (not b!344299) (not start!34466) b_and!14597 (not b!344301) (not b!344305) (not mapNonEmpty!12450) (not b!344306) (not b_next!7389) tp_is_empty!7341)
(check-sat b_and!14597 (not b_next!7389))
