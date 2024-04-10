; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34180 () Bool)

(assert start!34180)

(declare-fun b_free!7203 () Bool)

(declare-fun b_next!7203 () Bool)

(assert (=> start!34180 (= b_free!7203 (not b_next!7203))))

(declare-fun tp!25142 () Bool)

(declare-fun b_and!14403 () Bool)

(assert (=> start!34180 (= tp!25142 b_and!14403)))

(declare-fun b!340693 () Bool)

(declare-fun res!188212 () Bool)

(declare-fun e!208987 () Bool)

(assert (=> b!340693 (=> (not res!188212) (not e!208987))))

(declare-datatypes ((array!17913 0))(
  ( (array!17914 (arr!8477 (Array (_ BitVec 32) (_ BitVec 64))) (size!8829 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17913)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17913 (_ BitVec 32)) Bool)

(assert (=> b!340693 (= res!188212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340694 () Bool)

(declare-fun res!188211 () Bool)

(assert (=> b!340694 (=> (not res!188211) (not e!208987))))

(declare-datatypes ((V!10517 0))(
  ( (V!10518 (val!3622 Int)) )
))
(declare-datatypes ((ValueCell!3234 0))(
  ( (ValueCellFull!3234 (v!5794 V!10517)) (EmptyCell!3234) )
))
(declare-datatypes ((array!17915 0))(
  ( (array!17916 (arr!8478 (Array (_ BitVec 32) ValueCell!3234)) (size!8830 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17915)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340694 (= res!188211 (and (= (size!8830 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8829 _keys!1895) (size!8830 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12159 () Bool)

(declare-fun mapRes!12159 () Bool)

(assert (=> mapIsEmpty!12159 mapRes!12159))

(declare-fun b!340695 () Bool)

(declare-fun e!208989 () Bool)

(assert (=> b!340695 (= e!208987 e!208989)))

(declare-fun res!188209 () Bool)

(assert (=> b!340695 (=> (not res!188209) (not e!208989))))

(declare-datatypes ((SeekEntryResult!3276 0))(
  ( (MissingZero!3276 (index!15283 (_ BitVec 32))) (Found!3276 (index!15284 (_ BitVec 32))) (Intermediate!3276 (undefined!4088 Bool) (index!15285 (_ BitVec 32)) (x!33934 (_ BitVec 32))) (Undefined!3276) (MissingVacant!3276 (index!15286 (_ BitVec 32))) )
))
(declare-fun lt!161635 () SeekEntryResult!3276)

(get-info :version)

(assert (=> b!340695 (= res!188209 (and (not ((_ is Found!3276) lt!161635)) (not ((_ is MissingZero!3276) lt!161635)) ((_ is MissingVacant!3276) lt!161635)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17913 (_ BitVec 32)) SeekEntryResult!3276)

(assert (=> b!340695 (= lt!161635 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!340696 () Bool)

(declare-fun res!188213 () Bool)

(assert (=> b!340696 (=> (not res!188213) (not e!208987))))

(declare-datatypes ((List!4876 0))(
  ( (Nil!4873) (Cons!4872 (h!5728 (_ BitVec 64)) (t!9984 List!4876)) )
))
(declare-fun arrayNoDuplicates!0 (array!17913 (_ BitVec 32) List!4876) Bool)

(assert (=> b!340696 (= res!188213 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4873))))

(declare-fun b!340697 () Bool)

(declare-fun res!188216 () Bool)

(assert (=> b!340697 (=> (not res!188216) (not e!208989))))

(declare-fun arrayContainsKey!0 (array!17913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340697 (= res!188216 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340698 () Bool)

(declare-fun res!188210 () Bool)

(assert (=> b!340698 (=> (not res!188210) (not e!208987))))

(declare-fun zeroValue!1467 () V!10517)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10517)

(declare-datatypes ((tuple2!5258 0))(
  ( (tuple2!5259 (_1!2640 (_ BitVec 64)) (_2!2640 V!10517)) )
))
(declare-datatypes ((List!4877 0))(
  ( (Nil!4874) (Cons!4873 (h!5729 tuple2!5258) (t!9985 List!4877)) )
))
(declare-datatypes ((ListLongMap!4171 0))(
  ( (ListLongMap!4172 (toList!2101 List!4877)) )
))
(declare-fun contains!2155 (ListLongMap!4171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1622 (array!17913 array!17915 (_ BitVec 32) (_ BitVec 32) V!10517 V!10517 (_ BitVec 32) Int) ListLongMap!4171)

(assert (=> b!340698 (= res!188210 (not (contains!2155 (getCurrentListMap!1622 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!340699 () Bool)

(declare-fun e!208992 () Bool)

(declare-fun tp_is_empty!7155 () Bool)

(assert (=> b!340699 (= e!208992 tp_is_empty!7155)))

(declare-fun b!340700 () Bool)

(declare-fun e!208988 () Bool)

(declare-fun e!208991 () Bool)

(assert (=> b!340700 (= e!208988 (and e!208991 mapRes!12159))))

(declare-fun condMapEmpty!12159 () Bool)

(declare-fun mapDefault!12159 () ValueCell!3234)

(assert (=> b!340700 (= condMapEmpty!12159 (= (arr!8478 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3234)) mapDefault!12159)))))

(declare-fun b!340701 () Bool)

(assert (=> b!340701 (= e!208989 false)))

(declare-fun lt!161634 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17913 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340701 (= lt!161634 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!340702 () Bool)

(declare-fun res!188215 () Bool)

(assert (=> b!340702 (=> (not res!188215) (not e!208987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340702 (= res!188215 (validKeyInArray!0 k0!1348))))

(declare-fun res!188214 () Bool)

(assert (=> start!34180 (=> (not res!188214) (not e!208987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34180 (= res!188214 (validMask!0 mask!2385))))

(assert (=> start!34180 e!208987))

(assert (=> start!34180 true))

(assert (=> start!34180 tp_is_empty!7155))

(assert (=> start!34180 tp!25142))

(declare-fun array_inv!6280 (array!17915) Bool)

(assert (=> start!34180 (and (array_inv!6280 _values!1525) e!208988)))

(declare-fun array_inv!6281 (array!17913) Bool)

(assert (=> start!34180 (array_inv!6281 _keys!1895)))

(declare-fun mapNonEmpty!12159 () Bool)

(declare-fun tp!25143 () Bool)

(assert (=> mapNonEmpty!12159 (= mapRes!12159 (and tp!25143 e!208992))))

(declare-fun mapRest!12159 () (Array (_ BitVec 32) ValueCell!3234))

(declare-fun mapKey!12159 () (_ BitVec 32))

(declare-fun mapValue!12159 () ValueCell!3234)

(assert (=> mapNonEmpty!12159 (= (arr!8478 _values!1525) (store mapRest!12159 mapKey!12159 mapValue!12159))))

(declare-fun b!340703 () Bool)

(assert (=> b!340703 (= e!208991 tp_is_empty!7155)))

(assert (= (and start!34180 res!188214) b!340694))

(assert (= (and b!340694 res!188211) b!340693))

(assert (= (and b!340693 res!188212) b!340696))

(assert (= (and b!340696 res!188213) b!340702))

(assert (= (and b!340702 res!188215) b!340698))

(assert (= (and b!340698 res!188210) b!340695))

(assert (= (and b!340695 res!188209) b!340697))

(assert (= (and b!340697 res!188216) b!340701))

(assert (= (and b!340700 condMapEmpty!12159) mapIsEmpty!12159))

(assert (= (and b!340700 (not condMapEmpty!12159)) mapNonEmpty!12159))

(assert (= (and mapNonEmpty!12159 ((_ is ValueCellFull!3234) mapValue!12159)) b!340699))

(assert (= (and b!340700 ((_ is ValueCellFull!3234) mapDefault!12159)) b!340703))

(assert (= start!34180 b!340700))

(declare-fun m!343327 () Bool)

(assert (=> b!340698 m!343327))

(assert (=> b!340698 m!343327))

(declare-fun m!343329 () Bool)

(assert (=> b!340698 m!343329))

(declare-fun m!343331 () Bool)

(assert (=> start!34180 m!343331))

(declare-fun m!343333 () Bool)

(assert (=> start!34180 m!343333))

(declare-fun m!343335 () Bool)

(assert (=> start!34180 m!343335))

(declare-fun m!343337 () Bool)

(assert (=> b!340702 m!343337))

(declare-fun m!343339 () Bool)

(assert (=> mapNonEmpty!12159 m!343339))

(declare-fun m!343341 () Bool)

(assert (=> b!340696 m!343341))

(declare-fun m!343343 () Bool)

(assert (=> b!340701 m!343343))

(declare-fun m!343345 () Bool)

(assert (=> b!340695 m!343345))

(declare-fun m!343347 () Bool)

(assert (=> b!340697 m!343347))

(declare-fun m!343349 () Bool)

(assert (=> b!340693 m!343349))

(check-sat b_and!14403 (not b!340698) (not mapNonEmpty!12159) (not b!340701) (not b!340702) (not start!34180) (not b!340695) tp_is_empty!7155 (not b!340693) (not b!340697) (not b!340696) (not b_next!7203))
(check-sat b_and!14403 (not b_next!7203))
