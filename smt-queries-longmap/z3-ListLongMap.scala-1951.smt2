; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34438 () Bool)

(assert start!34438)

(declare-fun b_free!7375 () Bool)

(declare-fun b_next!7375 () Bool)

(assert (=> start!34438 (= b_free!7375 (not b_next!7375))))

(declare-fun tp!25670 () Bool)

(declare-fun b_and!14597 () Bool)

(assert (=> start!34438 (= tp!25670 b_and!14597)))

(declare-fun res!190267 () Bool)

(declare-fun e!210932 () Bool)

(assert (=> start!34438 (=> (not res!190267) (not e!210932))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34438 (= res!190267 (validMask!0 mask!2385))))

(assert (=> start!34438 e!210932))

(assert (=> start!34438 true))

(declare-fun tp_is_empty!7327 () Bool)

(assert (=> start!34438 tp_is_empty!7327))

(assert (=> start!34438 tp!25670))

(declare-datatypes ((V!10747 0))(
  ( (V!10748 (val!3708 Int)) )
))
(declare-datatypes ((ValueCell!3320 0))(
  ( (ValueCellFull!3320 (v!5885 V!10747)) (EmptyCell!3320) )
))
(declare-datatypes ((array!18240 0))(
  ( (array!18241 (arr!8636 (Array (_ BitVec 32) ValueCell!3320)) (size!8988 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18240)

(declare-fun e!210931 () Bool)

(declare-fun array_inv!6380 (array!18240) Bool)

(assert (=> start!34438 (and (array_inv!6380 _values!1525) e!210931)))

(declare-datatypes ((array!18242 0))(
  ( (array!18243 (arr!8637 (Array (_ BitVec 32) (_ BitVec 64))) (size!8989 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18242)

(declare-fun array_inv!6381 (array!18242) Bool)

(assert (=> start!34438 (array_inv!6381 _keys!1895)))

(declare-fun b!344057 () Bool)

(declare-fun res!190265 () Bool)

(assert (=> b!344057 (=> (not res!190265) (not e!210932))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10747)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10747)

(declare-datatypes ((tuple2!5292 0))(
  ( (tuple2!5293 (_1!2657 (_ BitVec 64)) (_2!2657 V!10747)) )
))
(declare-datatypes ((List!4894 0))(
  ( (Nil!4891) (Cons!4890 (h!5746 tuple2!5292) (t!10002 List!4894)) )
))
(declare-datatypes ((ListLongMap!4207 0))(
  ( (ListLongMap!4208 (toList!2119 List!4894)) )
))
(declare-fun contains!2196 (ListLongMap!4207 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1648 (array!18242 array!18240 (_ BitVec 32) (_ BitVec 32) V!10747 V!10747 (_ BitVec 32) Int) ListLongMap!4207)

(assert (=> b!344057 (= res!190265 (not (contains!2196 (getCurrentListMap!1648 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344058 () Bool)

(declare-fun e!210933 () Bool)

(declare-fun mapRes!12429 () Bool)

(assert (=> b!344058 (= e!210931 (and e!210933 mapRes!12429))))

(declare-fun condMapEmpty!12429 () Bool)

(declare-fun mapDefault!12429 () ValueCell!3320)

(assert (=> b!344058 (= condMapEmpty!12429 (= (arr!8636 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3320)) mapDefault!12429)))))

(declare-fun mapNonEmpty!12429 () Bool)

(declare-fun tp!25671 () Bool)

(declare-fun e!210934 () Bool)

(assert (=> mapNonEmpty!12429 (= mapRes!12429 (and tp!25671 e!210934))))

(declare-fun mapValue!12429 () ValueCell!3320)

(declare-fun mapKey!12429 () (_ BitVec 32))

(declare-fun mapRest!12429 () (Array (_ BitVec 32) ValueCell!3320))

(assert (=> mapNonEmpty!12429 (= (arr!8636 _values!1525) (store mapRest!12429 mapKey!12429 mapValue!12429))))

(declare-fun b!344059 () Bool)

(assert (=> b!344059 (= e!210932 false)))

(declare-datatypes ((SeekEntryResult!3283 0))(
  ( (MissingZero!3283 (index!15311 (_ BitVec 32))) (Found!3283 (index!15312 (_ BitVec 32))) (Intermediate!3283 (undefined!4095 Bool) (index!15313 (_ BitVec 32)) (x!34210 (_ BitVec 32))) (Undefined!3283) (MissingVacant!3283 (index!15314 (_ BitVec 32))) )
))
(declare-fun lt!162655 () SeekEntryResult!3283)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18242 (_ BitVec 32)) SeekEntryResult!3283)

(assert (=> b!344059 (= lt!162655 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344060 () Bool)

(declare-fun res!190264 () Bool)

(assert (=> b!344060 (=> (not res!190264) (not e!210932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344060 (= res!190264 (validKeyInArray!0 k0!1348))))

(declare-fun b!344061 () Bool)

(assert (=> b!344061 (= e!210934 tp_is_empty!7327)))

(declare-fun b!344062 () Bool)

(declare-fun res!190268 () Bool)

(assert (=> b!344062 (=> (not res!190268) (not e!210932))))

(assert (=> b!344062 (= res!190268 (and (= (size!8988 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8989 _keys!1895) (size!8988 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344063 () Bool)

(declare-fun res!190263 () Bool)

(assert (=> b!344063 (=> (not res!190263) (not e!210932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18242 (_ BitVec 32)) Bool)

(assert (=> b!344063 (= res!190263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344064 () Bool)

(assert (=> b!344064 (= e!210933 tp_is_empty!7327)))

(declare-fun mapIsEmpty!12429 () Bool)

(assert (=> mapIsEmpty!12429 mapRes!12429))

(declare-fun b!344065 () Bool)

(declare-fun res!190266 () Bool)

(assert (=> b!344065 (=> (not res!190266) (not e!210932))))

(declare-datatypes ((List!4895 0))(
  ( (Nil!4892) (Cons!4891 (h!5747 (_ BitVec 64)) (t!10003 List!4895)) )
))
(declare-fun arrayNoDuplicates!0 (array!18242 (_ BitVec 32) List!4895) Bool)

(assert (=> b!344065 (= res!190266 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4892))))

(assert (= (and start!34438 res!190267) b!344062))

(assert (= (and b!344062 res!190268) b!344063))

(assert (= (and b!344063 res!190263) b!344065))

(assert (= (and b!344065 res!190266) b!344060))

(assert (= (and b!344060 res!190264) b!344057))

(assert (= (and b!344057 res!190265) b!344059))

(assert (= (and b!344058 condMapEmpty!12429) mapIsEmpty!12429))

(assert (= (and b!344058 (not condMapEmpty!12429)) mapNonEmpty!12429))

(get-info :version)

(assert (= (and mapNonEmpty!12429 ((_ is ValueCellFull!3320) mapValue!12429)) b!344061))

(assert (= (and b!344058 ((_ is ValueCellFull!3320) mapDefault!12429)) b!344064))

(assert (= start!34438 b!344058))

(declare-fun m!346041 () Bool)

(assert (=> start!34438 m!346041))

(declare-fun m!346043 () Bool)

(assert (=> start!34438 m!346043))

(declare-fun m!346045 () Bool)

(assert (=> start!34438 m!346045))

(declare-fun m!346047 () Bool)

(assert (=> b!344065 m!346047))

(declare-fun m!346049 () Bool)

(assert (=> b!344057 m!346049))

(assert (=> b!344057 m!346049))

(declare-fun m!346051 () Bool)

(assert (=> b!344057 m!346051))

(declare-fun m!346053 () Bool)

(assert (=> b!344059 m!346053))

(declare-fun m!346055 () Bool)

(assert (=> b!344060 m!346055))

(declare-fun m!346057 () Bool)

(assert (=> mapNonEmpty!12429 m!346057))

(declare-fun m!346059 () Bool)

(assert (=> b!344063 m!346059))

(check-sat (not start!34438) b_and!14597 (not b!344063) (not b!344059) (not mapNonEmpty!12429) (not b!344065) (not b!344057) tp_is_empty!7327 (not b_next!7375) (not b!344060))
(check-sat b_and!14597 (not b_next!7375))
