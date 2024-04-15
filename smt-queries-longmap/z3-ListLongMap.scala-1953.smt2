; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34450 () Bool)

(assert start!34450)

(declare-fun b_free!7387 () Bool)

(declare-fun b_next!7387 () Bool)

(assert (=> start!34450 (= b_free!7387 (not b_next!7387))))

(declare-fun tp!25707 () Bool)

(declare-fun b_and!14569 () Bool)

(assert (=> start!34450 (= tp!25707 b_and!14569)))

(declare-fun mapNonEmpty!12447 () Bool)

(declare-fun mapRes!12447 () Bool)

(declare-fun tp!25706 () Bool)

(declare-fun e!210879 () Bool)

(assert (=> mapNonEmpty!12447 (= mapRes!12447 (and tp!25706 e!210879))))

(declare-fun mapKey!12447 () (_ BitVec 32))

(declare-datatypes ((V!10763 0))(
  ( (V!10764 (val!3714 Int)) )
))
(declare-datatypes ((ValueCell!3326 0))(
  ( (ValueCellFull!3326 (v!5884 V!10763)) (EmptyCell!3326) )
))
(declare-fun mapValue!12447 () ValueCell!3326)

(declare-datatypes ((array!18257 0))(
  ( (array!18258 (arr!8645 (Array (_ BitVec 32) ValueCell!3326)) (size!8998 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18257)

(declare-fun mapRest!12447 () (Array (_ BitVec 32) ValueCell!3326))

(assert (=> mapNonEmpty!12447 (= (arr!8645 _values!1525) (store mapRest!12447 mapKey!12447 mapValue!12447))))

(declare-fun b!343997 () Bool)

(declare-fun e!210880 () Bool)

(declare-fun e!210883 () Bool)

(assert (=> b!343997 (= e!210880 (and e!210883 mapRes!12447))))

(declare-fun condMapEmpty!12447 () Bool)

(declare-fun mapDefault!12447 () ValueCell!3326)

(assert (=> b!343997 (= condMapEmpty!12447 (= (arr!8645 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3326)) mapDefault!12447)))))

(declare-fun b!343998 () Bool)

(declare-fun res!190250 () Bool)

(declare-fun e!210882 () Bool)

(assert (=> b!343998 (=> (not res!190250) (not e!210882))))

(declare-datatypes ((array!18259 0))(
  ( (array!18260 (arr!8646 (Array (_ BitVec 32) (_ BitVec 64))) (size!8999 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18259)

(declare-datatypes ((List!4953 0))(
  ( (Nil!4950) (Cons!4949 (h!5805 (_ BitVec 64)) (t!10060 List!4953)) )
))
(declare-fun arrayNoDuplicates!0 (array!18259 (_ BitVec 32) List!4953) Bool)

(assert (=> b!343998 (= res!190250 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4950))))

(declare-fun b!343999 () Bool)

(declare-fun res!190249 () Bool)

(assert (=> b!343999 (=> (not res!190249) (not e!210882))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18259 (_ BitVec 32)) Bool)

(assert (=> b!343999 (= res!190249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!344000 () Bool)

(declare-fun res!190247 () Bool)

(assert (=> b!344000 (=> (not res!190247) (not e!210882))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10763)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10763)

(declare-datatypes ((tuple2!5330 0))(
  ( (tuple2!5331 (_1!2676 (_ BitVec 64)) (_2!2676 V!10763)) )
))
(declare-datatypes ((List!4954 0))(
  ( (Nil!4951) (Cons!4950 (h!5806 tuple2!5330) (t!10061 List!4954)) )
))
(declare-datatypes ((ListLongMap!4233 0))(
  ( (ListLongMap!4234 (toList!2132 List!4954)) )
))
(declare-fun contains!2201 (ListLongMap!4233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1638 (array!18259 array!18257 (_ BitVec 32) (_ BitVec 32) V!10763 V!10763 (_ BitVec 32) Int) ListLongMap!4233)

(assert (=> b!344000 (= res!190247 (not (contains!2201 (getCurrentListMap!1638 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!344002 () Bool)

(declare-fun res!190246 () Bool)

(assert (=> b!344002 (=> (not res!190246) (not e!210882))))

(assert (=> b!344002 (= res!190246 (and (= (size!8998 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8999 _keys!1895) (size!8998 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12447 () Bool)

(assert (=> mapIsEmpty!12447 mapRes!12447))

(declare-fun b!344003 () Bool)

(declare-fun res!190248 () Bool)

(assert (=> b!344003 (=> (not res!190248) (not e!210882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344003 (= res!190248 (validKeyInArray!0 k0!1348))))

(declare-fun b!344004 () Bool)

(declare-fun tp_is_empty!7339 () Bool)

(assert (=> b!344004 (= e!210883 tp_is_empty!7339)))

(declare-fun b!344005 () Bool)

(assert (=> b!344005 (= e!210879 tp_is_empty!7339)))

(declare-fun res!190245 () Bool)

(assert (=> start!34450 (=> (not res!190245) (not e!210882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34450 (= res!190245 (validMask!0 mask!2385))))

(assert (=> start!34450 e!210882))

(assert (=> start!34450 true))

(assert (=> start!34450 tp_is_empty!7339))

(assert (=> start!34450 tp!25707))

(declare-fun array_inv!6426 (array!18257) Bool)

(assert (=> start!34450 (and (array_inv!6426 _values!1525) e!210880)))

(declare-fun array_inv!6427 (array!18259) Bool)

(assert (=> start!34450 (array_inv!6427 _keys!1895)))

(declare-fun b!344001 () Bool)

(assert (=> b!344001 (= e!210882 false)))

(declare-datatypes ((SeekEntryResult!3332 0))(
  ( (MissingZero!3332 (index!15507 (_ BitVec 32))) (Found!3332 (index!15508 (_ BitVec 32))) (Intermediate!3332 (undefined!4144 Bool) (index!15509 (_ BitVec 32)) (x!34273 (_ BitVec 32))) (Undefined!3332) (MissingVacant!3332 (index!15510 (_ BitVec 32))) )
))
(declare-fun lt!162420 () SeekEntryResult!3332)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18259 (_ BitVec 32)) SeekEntryResult!3332)

(assert (=> b!344001 (= lt!162420 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!34450 res!190245) b!344002))

(assert (= (and b!344002 res!190246) b!343999))

(assert (= (and b!343999 res!190249) b!343998))

(assert (= (and b!343998 res!190250) b!344003))

(assert (= (and b!344003 res!190248) b!344000))

(assert (= (and b!344000 res!190247) b!344001))

(assert (= (and b!343997 condMapEmpty!12447) mapIsEmpty!12447))

(assert (= (and b!343997 (not condMapEmpty!12447)) mapNonEmpty!12447))

(get-info :version)

(assert (= (and mapNonEmpty!12447 ((_ is ValueCellFull!3326) mapValue!12447)) b!344005))

(assert (= (and b!343997 ((_ is ValueCellFull!3326) mapDefault!12447)) b!344004))

(assert (= start!34450 b!343997))

(declare-fun m!345207 () Bool)

(assert (=> b!344001 m!345207))

(declare-fun m!345209 () Bool)

(assert (=> b!343998 m!345209))

(declare-fun m!345211 () Bool)

(assert (=> start!34450 m!345211))

(declare-fun m!345213 () Bool)

(assert (=> start!34450 m!345213))

(declare-fun m!345215 () Bool)

(assert (=> start!34450 m!345215))

(declare-fun m!345217 () Bool)

(assert (=> b!344003 m!345217))

(declare-fun m!345219 () Bool)

(assert (=> b!343999 m!345219))

(declare-fun m!345221 () Bool)

(assert (=> mapNonEmpty!12447 m!345221))

(declare-fun m!345223 () Bool)

(assert (=> b!344000 m!345223))

(assert (=> b!344000 m!345223))

(declare-fun m!345225 () Bool)

(assert (=> b!344000 m!345225))

(check-sat (not start!34450) b_and!14569 (not b!343999) (not b!344001) (not b_next!7387) (not mapNonEmpty!12447) (not b!344003) tp_is_empty!7339 (not b!343998) (not b!344000))
(check-sat b_and!14569 (not b_next!7387))
