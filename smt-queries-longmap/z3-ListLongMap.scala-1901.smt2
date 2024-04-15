; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33882 () Bool)

(assert start!33882)

(declare-fun b_free!7075 () Bool)

(declare-fun b_next!7075 () Bool)

(assert (=> start!33882 (= b_free!7075 (not b_next!7075))))

(declare-fun tp!24738 () Bool)

(declare-fun b_and!14235 () Bool)

(assert (=> start!33882 (= tp!24738 b_and!14235)))

(declare-fun b!337282 () Bool)

(declare-fun e!206955 () Bool)

(assert (=> b!337282 (= e!206955 false)))

(declare-fun lt!160221 () (_ BitVec 32))

(declare-datatypes ((array!17629 0))(
  ( (array!17630 (arr!8342 (Array (_ BitVec 32) (_ BitVec 64))) (size!8695 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17629)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17629 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337282 (= lt!160221 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!186357 () Bool)

(declare-fun e!206954 () Bool)

(assert (=> start!33882 (=> (not res!186357) (not e!206954))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33882 (= res!186357 (validMask!0 mask!2385))))

(assert (=> start!33882 e!206954))

(assert (=> start!33882 true))

(declare-fun tp_is_empty!7027 () Bool)

(assert (=> start!33882 tp_is_empty!7027))

(assert (=> start!33882 tp!24738))

(declare-datatypes ((V!10347 0))(
  ( (V!10348 (val!3558 Int)) )
))
(declare-datatypes ((ValueCell!3170 0))(
  ( (ValueCellFull!3170 (v!5717 V!10347)) (EmptyCell!3170) )
))
(declare-datatypes ((array!17631 0))(
  ( (array!17632 (arr!8343 (Array (_ BitVec 32) ValueCell!3170)) (size!8696 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17631)

(declare-fun e!206953 () Bool)

(declare-fun array_inv!6220 (array!17631) Bool)

(assert (=> start!33882 (and (array_inv!6220 _values!1525) e!206953)))

(declare-fun array_inv!6221 (array!17629) Bool)

(assert (=> start!33882 (array_inv!6221 _keys!1895)))

(declare-fun b!337283 () Bool)

(declare-fun e!206956 () Bool)

(assert (=> b!337283 (= e!206956 tp_is_empty!7027)))

(declare-fun b!337284 () Bool)

(declare-fun mapRes!11946 () Bool)

(assert (=> b!337284 (= e!206953 (and e!206956 mapRes!11946))))

(declare-fun condMapEmpty!11946 () Bool)

(declare-fun mapDefault!11946 () ValueCell!3170)

(assert (=> b!337284 (= condMapEmpty!11946 (= (arr!8343 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3170)) mapDefault!11946)))))

(declare-fun b!337285 () Bool)

(declare-fun res!186353 () Bool)

(assert (=> b!337285 (=> (not res!186353) (not e!206954))))

(declare-fun zeroValue!1467 () V!10347)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10347)

(declare-datatypes ((tuple2!5110 0))(
  ( (tuple2!5111 (_1!2566 (_ BitVec 64)) (_2!2566 V!10347)) )
))
(declare-datatypes ((List!4744 0))(
  ( (Nil!4741) (Cons!4740 (h!5596 tuple2!5110) (t!9829 List!4744)) )
))
(declare-datatypes ((ListLongMap!4013 0))(
  ( (ListLongMap!4014 (toList!2022 List!4744)) )
))
(declare-fun contains!2080 (ListLongMap!4013 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1528 (array!17629 array!17631 (_ BitVec 32) (_ BitVec 32) V!10347 V!10347 (_ BitVec 32) Int) ListLongMap!4013)

(assert (=> b!337285 (= res!186353 (not (contains!2080 (getCurrentListMap!1528 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337286 () Bool)

(declare-fun e!206952 () Bool)

(assert (=> b!337286 (= e!206952 tp_is_empty!7027)))

(declare-fun mapNonEmpty!11946 () Bool)

(declare-fun tp!24737 () Bool)

(assert (=> mapNonEmpty!11946 (= mapRes!11946 (and tp!24737 e!206952))))

(declare-fun mapValue!11946 () ValueCell!3170)

(declare-fun mapRest!11946 () (Array (_ BitVec 32) ValueCell!3170))

(declare-fun mapKey!11946 () (_ BitVec 32))

(assert (=> mapNonEmpty!11946 (= (arr!8343 _values!1525) (store mapRest!11946 mapKey!11946 mapValue!11946))))

(declare-fun b!337287 () Bool)

(declare-fun res!186356 () Bool)

(assert (=> b!337287 (=> (not res!186356) (not e!206954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17629 (_ BitVec 32)) Bool)

(assert (=> b!337287 (= res!186356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337288 () Bool)

(declare-fun res!186355 () Bool)

(assert (=> b!337288 (=> (not res!186355) (not e!206954))))

(assert (=> b!337288 (= res!186355 (and (= (size!8696 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8695 _keys!1895) (size!8696 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11946 () Bool)

(assert (=> mapIsEmpty!11946 mapRes!11946))

(declare-fun b!337289 () Bool)

(declare-fun res!186359 () Bool)

(assert (=> b!337289 (=> (not res!186359) (not e!206954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337289 (= res!186359 (validKeyInArray!0 k0!1348))))

(declare-fun b!337290 () Bool)

(assert (=> b!337290 (= e!206954 e!206955)))

(declare-fun res!186352 () Bool)

(assert (=> b!337290 (=> (not res!186352) (not e!206955))))

(declare-datatypes ((SeekEntryResult!3224 0))(
  ( (MissingZero!3224 (index!15075 (_ BitVec 32))) (Found!3224 (index!15076 (_ BitVec 32))) (Intermediate!3224 (undefined!4036 Bool) (index!15077 (_ BitVec 32)) (x!33639 (_ BitVec 32))) (Undefined!3224) (MissingVacant!3224 (index!15078 (_ BitVec 32))) )
))
(declare-fun lt!160220 () SeekEntryResult!3224)

(get-info :version)

(assert (=> b!337290 (= res!186352 (and (not ((_ is Found!3224) lt!160220)) ((_ is MissingZero!3224) lt!160220)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17629 (_ BitVec 32)) SeekEntryResult!3224)

(assert (=> b!337290 (= lt!160220 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337291 () Bool)

(declare-fun res!186358 () Bool)

(assert (=> b!337291 (=> (not res!186358) (not e!206955))))

(declare-fun arrayContainsKey!0 (array!17629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337291 (= res!186358 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337292 () Bool)

(declare-fun res!186354 () Bool)

(assert (=> b!337292 (=> (not res!186354) (not e!206954))))

(declare-datatypes ((List!4745 0))(
  ( (Nil!4742) (Cons!4741 (h!5597 (_ BitVec 64)) (t!9830 List!4745)) )
))
(declare-fun arrayNoDuplicates!0 (array!17629 (_ BitVec 32) List!4745) Bool)

(assert (=> b!337292 (= res!186354 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4742))))

(assert (= (and start!33882 res!186357) b!337288))

(assert (= (and b!337288 res!186355) b!337287))

(assert (= (and b!337287 res!186356) b!337292))

(assert (= (and b!337292 res!186354) b!337289))

(assert (= (and b!337289 res!186359) b!337285))

(assert (= (and b!337285 res!186353) b!337290))

(assert (= (and b!337290 res!186352) b!337291))

(assert (= (and b!337291 res!186358) b!337282))

(assert (= (and b!337284 condMapEmpty!11946) mapIsEmpty!11946))

(assert (= (and b!337284 (not condMapEmpty!11946)) mapNonEmpty!11946))

(assert (= (and mapNonEmpty!11946 ((_ is ValueCellFull!3170) mapValue!11946)) b!337286))

(assert (= (and b!337284 ((_ is ValueCellFull!3170) mapDefault!11946)) b!337283))

(assert (= start!33882 b!337284))

(declare-fun m!340321 () Bool)

(assert (=> b!337289 m!340321))

(declare-fun m!340323 () Bool)

(assert (=> b!337290 m!340323))

(declare-fun m!340325 () Bool)

(assert (=> start!33882 m!340325))

(declare-fun m!340327 () Bool)

(assert (=> start!33882 m!340327))

(declare-fun m!340329 () Bool)

(assert (=> start!33882 m!340329))

(declare-fun m!340331 () Bool)

(assert (=> b!337291 m!340331))

(declare-fun m!340333 () Bool)

(assert (=> b!337285 m!340333))

(assert (=> b!337285 m!340333))

(declare-fun m!340335 () Bool)

(assert (=> b!337285 m!340335))

(declare-fun m!340337 () Bool)

(assert (=> mapNonEmpty!11946 m!340337))

(declare-fun m!340339 () Bool)

(assert (=> b!337287 m!340339))

(declare-fun m!340341 () Bool)

(assert (=> b!337282 m!340341))

(declare-fun m!340343 () Bool)

(assert (=> b!337292 m!340343))

(check-sat tp_is_empty!7027 b_and!14235 (not b!337285) (not b_next!7075) (not start!33882) (not b!337287) (not b!337290) (not b!337291) (not b!337289) (not mapNonEmpty!11946) (not b!337282) (not b!337292))
(check-sat b_and!14235 (not b_next!7075))
