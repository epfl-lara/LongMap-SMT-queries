; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34450 () Bool)

(assert start!34450)

(declare-fun b_free!7387 () Bool)

(declare-fun b_next!7387 () Bool)

(assert (=> start!34450 (= b_free!7387 (not b_next!7387))))

(declare-fun tp!25707 () Bool)

(declare-fun b_and!14609 () Bool)

(assert (=> start!34450 (= tp!25707 b_and!14609)))

(declare-fun b!344219 () Bool)

(declare-fun e!211025 () Bool)

(declare-fun e!211024 () Bool)

(declare-fun mapRes!12447 () Bool)

(assert (=> b!344219 (= e!211025 (and e!211024 mapRes!12447))))

(declare-fun condMapEmpty!12447 () Bool)

(declare-datatypes ((V!10763 0))(
  ( (V!10764 (val!3714 Int)) )
))
(declare-datatypes ((ValueCell!3326 0))(
  ( (ValueCellFull!3326 (v!5891 V!10763)) (EmptyCell!3326) )
))
(declare-datatypes ((array!18262 0))(
  ( (array!18263 (arr!8647 (Array (_ BitVec 32) ValueCell!3326)) (size!8999 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18262)

(declare-fun mapDefault!12447 () ValueCell!3326)

(assert (=> b!344219 (= condMapEmpty!12447 (= (arr!8647 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3326)) mapDefault!12447)))))

(declare-fun res!190375 () Bool)

(declare-fun e!211021 () Bool)

(assert (=> start!34450 (=> (not res!190375) (not e!211021))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34450 (= res!190375 (validMask!0 mask!2385))))

(assert (=> start!34450 e!211021))

(assert (=> start!34450 true))

(declare-fun tp_is_empty!7339 () Bool)

(assert (=> start!34450 tp_is_empty!7339))

(assert (=> start!34450 tp!25707))

(declare-fun array_inv!6388 (array!18262) Bool)

(assert (=> start!34450 (and (array_inv!6388 _values!1525) e!211025)))

(declare-datatypes ((array!18264 0))(
  ( (array!18265 (arr!8648 (Array (_ BitVec 32) (_ BitVec 64))) (size!9000 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18264)

(declare-fun array_inv!6389 (array!18264) Bool)

(assert (=> start!34450 (array_inv!6389 _keys!1895)))

(declare-fun mapIsEmpty!12447 () Bool)

(assert (=> mapIsEmpty!12447 mapRes!12447))

(declare-fun b!344220 () Bool)

(assert (=> b!344220 (= e!211021 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3288 0))(
  ( (MissingZero!3288 (index!15331 (_ BitVec 32))) (Found!3288 (index!15332 (_ BitVec 32))) (Intermediate!3288 (undefined!4100 Bool) (index!15333 (_ BitVec 32)) (x!34231 (_ BitVec 32))) (Undefined!3288) (MissingVacant!3288 (index!15334 (_ BitVec 32))) )
))
(declare-fun lt!162673 () SeekEntryResult!3288)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18264 (_ BitVec 32)) SeekEntryResult!3288)

(assert (=> b!344220 (= lt!162673 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!344221 () Bool)

(declare-fun res!190374 () Bool)

(assert (=> b!344221 (=> (not res!190374) (not e!211021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344221 (= res!190374 (validKeyInArray!0 k0!1348))))

(declare-fun b!344222 () Bool)

(declare-fun res!190376 () Bool)

(assert (=> b!344222 (=> (not res!190376) (not e!211021))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!344222 (= res!190376 (and (= (size!8999 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9000 _keys!1895) (size!8999 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344223 () Bool)

(declare-fun e!211023 () Bool)

(assert (=> b!344223 (= e!211023 tp_is_empty!7339)))

(declare-fun b!344224 () Bool)

(declare-fun res!190373 () Bool)

(assert (=> b!344224 (=> (not res!190373) (not e!211021))))

(declare-datatypes ((List!4899 0))(
  ( (Nil!4896) (Cons!4895 (h!5751 (_ BitVec 64)) (t!10007 List!4899)) )
))
(declare-fun arrayNoDuplicates!0 (array!18264 (_ BitVec 32) List!4899) Bool)

(assert (=> b!344224 (= res!190373 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4896))))

(declare-fun b!344225 () Bool)

(declare-fun res!190372 () Bool)

(assert (=> b!344225 (=> (not res!190372) (not e!211021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18264 (_ BitVec 32)) Bool)

(assert (=> b!344225 (= res!190372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344226 () Bool)

(declare-fun res!190371 () Bool)

(assert (=> b!344226 (=> (not res!190371) (not e!211021))))

(declare-fun zeroValue!1467 () V!10763)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10763)

(declare-datatypes ((tuple2!5298 0))(
  ( (tuple2!5299 (_1!2660 (_ BitVec 64)) (_2!2660 V!10763)) )
))
(declare-datatypes ((List!4900 0))(
  ( (Nil!4897) (Cons!4896 (h!5752 tuple2!5298) (t!10008 List!4900)) )
))
(declare-datatypes ((ListLongMap!4213 0))(
  ( (ListLongMap!4214 (toList!2122 List!4900)) )
))
(declare-fun contains!2199 (ListLongMap!4213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1651 (array!18264 array!18262 (_ BitVec 32) (_ BitVec 32) V!10763 V!10763 (_ BitVec 32) Int) ListLongMap!4213)

(assert (=> b!344226 (= res!190371 (not (contains!2199 (getCurrentListMap!1651 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344227 () Bool)

(assert (=> b!344227 (= e!211024 tp_is_empty!7339)))

(declare-fun mapNonEmpty!12447 () Bool)

(declare-fun tp!25706 () Bool)

(assert (=> mapNonEmpty!12447 (= mapRes!12447 (and tp!25706 e!211023))))

(declare-fun mapRest!12447 () (Array (_ BitVec 32) ValueCell!3326))

(declare-fun mapValue!12447 () ValueCell!3326)

(declare-fun mapKey!12447 () (_ BitVec 32))

(assert (=> mapNonEmpty!12447 (= (arr!8647 _values!1525) (store mapRest!12447 mapKey!12447 mapValue!12447))))

(assert (= (and start!34450 res!190375) b!344222))

(assert (= (and b!344222 res!190376) b!344225))

(assert (= (and b!344225 res!190372) b!344224))

(assert (= (and b!344224 res!190373) b!344221))

(assert (= (and b!344221 res!190374) b!344226))

(assert (= (and b!344226 res!190371) b!344220))

(assert (= (and b!344219 condMapEmpty!12447) mapIsEmpty!12447))

(assert (= (and b!344219 (not condMapEmpty!12447)) mapNonEmpty!12447))

(get-info :version)

(assert (= (and mapNonEmpty!12447 ((_ is ValueCellFull!3326) mapValue!12447)) b!344223))

(assert (= (and b!344219 ((_ is ValueCellFull!3326) mapDefault!12447)) b!344227))

(assert (= start!34450 b!344219))

(declare-fun m!346161 () Bool)

(assert (=> mapNonEmpty!12447 m!346161))

(declare-fun m!346163 () Bool)

(assert (=> b!344221 m!346163))

(declare-fun m!346165 () Bool)

(assert (=> b!344220 m!346165))

(declare-fun m!346167 () Bool)

(assert (=> b!344226 m!346167))

(assert (=> b!344226 m!346167))

(declare-fun m!346169 () Bool)

(assert (=> b!344226 m!346169))

(declare-fun m!346171 () Bool)

(assert (=> b!344224 m!346171))

(declare-fun m!346173 () Bool)

(assert (=> start!34450 m!346173))

(declare-fun m!346175 () Bool)

(assert (=> start!34450 m!346175))

(declare-fun m!346177 () Bool)

(assert (=> start!34450 m!346177))

(declare-fun m!346179 () Bool)

(assert (=> b!344225 m!346179))

(check-sat (not b_next!7387) (not mapNonEmpty!12447) (not b!344221) (not b!344226) (not start!34450) (not b!344225) (not b!344220) b_and!14609 tp_is_empty!7339 (not b!344224))
(check-sat b_and!14609 (not b_next!7387))
