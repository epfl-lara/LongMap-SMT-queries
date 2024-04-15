; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33676 () Bool)

(assert start!33676)

(declare-fun b_free!6925 () Bool)

(declare-fun b_next!6925 () Bool)

(assert (=> start!33676 (= b_free!6925 (not b_next!6925))))

(declare-fun tp!24279 () Bool)

(declare-fun b_and!14079 () Bool)

(assert (=> start!33676 (= tp!24279 b_and!14079)))

(declare-fun b!334492 () Bool)

(declare-fun e!205306 () Bool)

(declare-fun tp_is_empty!6877 () Bool)

(assert (=> b!334492 (= e!205306 tp_is_empty!6877)))

(declare-fun b!334493 () Bool)

(declare-fun res!184488 () Bool)

(declare-fun e!205301 () Bool)

(assert (=> b!334493 (=> (not res!184488) (not e!205301))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334493 (= res!184488 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!11712 () Bool)

(declare-fun mapRes!11712 () Bool)

(declare-fun tp!24278 () Bool)

(assert (=> mapNonEmpty!11712 (= mapRes!11712 (and tp!24278 e!205306))))

(declare-datatypes ((V!10147 0))(
  ( (V!10148 (val!3483 Int)) )
))
(declare-datatypes ((ValueCell!3095 0))(
  ( (ValueCellFull!3095 (v!5639 V!10147)) (EmptyCell!3095) )
))
(declare-fun mapRest!11712 () (Array (_ BitVec 32) ValueCell!3095))

(declare-datatypes ((array!17327 0))(
  ( (array!17328 (arr!8194 (Array (_ BitVec 32) ValueCell!3095)) (size!8547 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17327)

(declare-fun mapValue!11712 () ValueCell!3095)

(declare-fun mapKey!11712 () (_ BitVec 32))

(assert (=> mapNonEmpty!11712 (= (arr!8194 _values!1525) (store mapRest!11712 mapKey!11712 mapValue!11712))))

(declare-fun b!334494 () Bool)

(declare-fun e!205303 () Bool)

(declare-fun e!205300 () Bool)

(assert (=> b!334494 (= e!205303 (and e!205300 mapRes!11712))))

(declare-fun condMapEmpty!11712 () Bool)

(declare-fun mapDefault!11712 () ValueCell!3095)

(assert (=> b!334494 (= condMapEmpty!11712 (= (arr!8194 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3095)) mapDefault!11712)))))

(declare-fun b!334495 () Bool)

(declare-fun e!205305 () Bool)

(assert (=> b!334495 (= e!205301 e!205305)))

(declare-fun res!184490 () Bool)

(assert (=> b!334495 (=> (not res!184490) (not e!205305))))

(declare-datatypes ((tuple2!5002 0))(
  ( (tuple2!5003 (_1!2512 (_ BitVec 64)) (_2!2512 V!10147)) )
))
(declare-datatypes ((List!4642 0))(
  ( (Nil!4639) (Cons!4638 (h!5494 tuple2!5002) (t!9721 List!4642)) )
))
(declare-datatypes ((ListLongMap!3905 0))(
  ( (ListLongMap!3906 (toList!1968 List!4642)) )
))
(declare-fun lt!159352 () ListLongMap!3905)

(declare-fun contains!2023 (ListLongMap!3905 (_ BitVec 64)) Bool)

(assert (=> b!334495 (= res!184490 (not (contains!2023 lt!159352 k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10147)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!17329 0))(
  ( (array!17330 (arr!8195 (Array (_ BitVec 32) (_ BitVec 64))) (size!8548 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17329)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10147)

(declare-fun getCurrentListMap!1477 (array!17329 array!17327 (_ BitVec 32) (_ BitVec 32) V!10147 V!10147 (_ BitVec 32) Int) ListLongMap!3905)

(assert (=> b!334495 (= lt!159352 (getCurrentListMap!1477 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334496 () Bool)

(declare-fun res!184486 () Bool)

(declare-fun e!205302 () Bool)

(assert (=> b!334496 (=> (not res!184486) (not e!205302))))

(declare-datatypes ((SeekEntryResult!3168 0))(
  ( (MissingZero!3168 (index!14851 (_ BitVec 32))) (Found!3168 (index!14852 (_ BitVec 32))) (Intermediate!3168 (undefined!3980 Bool) (index!14853 (_ BitVec 32)) (x!33353 (_ BitVec 32))) (Undefined!3168) (MissingVacant!3168 (index!14854 (_ BitVec 32))) )
))
(declare-fun lt!159351 () SeekEntryResult!3168)

(declare-fun arrayContainsKey!0 (array!17329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334496 (= res!184486 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14852 lt!159351)))))

(declare-fun res!184489 () Bool)

(assert (=> start!33676 (=> (not res!184489) (not e!205301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33676 (= res!184489 (validMask!0 mask!2385))))

(assert (=> start!33676 e!205301))

(assert (=> start!33676 true))

(assert (=> start!33676 tp_is_empty!6877))

(assert (=> start!33676 tp!24279))

(declare-fun array_inv!6110 (array!17327) Bool)

(assert (=> start!33676 (and (array_inv!6110 _values!1525) e!205303)))

(declare-fun array_inv!6111 (array!17329) Bool)

(assert (=> start!33676 (array_inv!6111 _keys!1895)))

(declare-fun b!334497 () Bool)

(declare-fun res!184483 () Bool)

(assert (=> b!334497 (=> (not res!184483) (not e!205301))))

(assert (=> b!334497 (= res!184483 (and (= (size!8547 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8548 _keys!1895) (size!8547 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11712 () Bool)

(assert (=> mapIsEmpty!11712 mapRes!11712))

(declare-fun b!334498 () Bool)

(assert (=> b!334498 (= e!205305 e!205302)))

(declare-fun res!184487 () Bool)

(assert (=> b!334498 (=> (not res!184487) (not e!205302))))

(get-info :version)

(assert (=> b!334498 (= res!184487 (and ((_ is Found!3168) lt!159351) (= (select (arr!8195 _keys!1895) (index!14852 lt!159351)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17329 (_ BitVec 32)) SeekEntryResult!3168)

(assert (=> b!334498 (= lt!159351 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334499 () Bool)

(assert (=> b!334499 (= e!205302 (not true))))

(assert (=> b!334499 (contains!2023 lt!159352 (select (arr!8195 _keys!1895) (index!14852 lt!159351)))))

(declare-datatypes ((Unit!10394 0))(
  ( (Unit!10395) )
))
(declare-fun lt!159353 () Unit!10394)

(declare-fun lemmaValidKeyInArrayIsInListMap!154 (array!17329 array!17327 (_ BitVec 32) (_ BitVec 32) V!10147 V!10147 (_ BitVec 32) Int) Unit!10394)

(assert (=> b!334499 (= lt!159353 (lemmaValidKeyInArrayIsInListMap!154 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14852 lt!159351) defaultEntry!1528))))

(assert (=> b!334499 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159354 () Unit!10394)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17329 (_ BitVec 64) (_ BitVec 32)) Unit!10394)

(assert (=> b!334499 (= lt!159354 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14852 lt!159351)))))

(declare-fun b!334500 () Bool)

(declare-fun res!184485 () Bool)

(assert (=> b!334500 (=> (not res!184485) (not e!205301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17329 (_ BitVec 32)) Bool)

(assert (=> b!334500 (= res!184485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334501 () Bool)

(declare-fun res!184484 () Bool)

(assert (=> b!334501 (=> (not res!184484) (not e!205301))))

(declare-datatypes ((List!4643 0))(
  ( (Nil!4640) (Cons!4639 (h!5495 (_ BitVec 64)) (t!9722 List!4643)) )
))
(declare-fun arrayNoDuplicates!0 (array!17329 (_ BitVec 32) List!4643) Bool)

(assert (=> b!334501 (= res!184484 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4640))))

(declare-fun b!334502 () Bool)

(assert (=> b!334502 (= e!205300 tp_is_empty!6877)))

(assert (= (and start!33676 res!184489) b!334497))

(assert (= (and b!334497 res!184483) b!334500))

(assert (= (and b!334500 res!184485) b!334501))

(assert (= (and b!334501 res!184484) b!334493))

(assert (= (and b!334493 res!184488) b!334495))

(assert (= (and b!334495 res!184490) b!334498))

(assert (= (and b!334498 res!184487) b!334496))

(assert (= (and b!334496 res!184486) b!334499))

(assert (= (and b!334494 condMapEmpty!11712) mapIsEmpty!11712))

(assert (= (and b!334494 (not condMapEmpty!11712)) mapNonEmpty!11712))

(assert (= (and mapNonEmpty!11712 ((_ is ValueCellFull!3095) mapValue!11712)) b!334492))

(assert (= (and b!334494 ((_ is ValueCellFull!3095) mapDefault!11712)) b!334502))

(assert (= start!33676 b!334494))

(declare-fun m!338051 () Bool)

(assert (=> b!334496 m!338051))

(declare-fun m!338053 () Bool)

(assert (=> b!334493 m!338053))

(declare-fun m!338055 () Bool)

(assert (=> b!334501 m!338055))

(declare-fun m!338057 () Bool)

(assert (=> b!334499 m!338057))

(declare-fun m!338059 () Bool)

(assert (=> b!334499 m!338059))

(declare-fun m!338061 () Bool)

(assert (=> b!334499 m!338061))

(declare-fun m!338063 () Bool)

(assert (=> b!334499 m!338063))

(assert (=> b!334499 m!338063))

(declare-fun m!338065 () Bool)

(assert (=> b!334499 m!338065))

(declare-fun m!338067 () Bool)

(assert (=> mapNonEmpty!11712 m!338067))

(declare-fun m!338069 () Bool)

(assert (=> start!33676 m!338069))

(declare-fun m!338071 () Bool)

(assert (=> start!33676 m!338071))

(declare-fun m!338073 () Bool)

(assert (=> start!33676 m!338073))

(declare-fun m!338075 () Bool)

(assert (=> b!334500 m!338075))

(assert (=> b!334498 m!338063))

(declare-fun m!338077 () Bool)

(assert (=> b!334498 m!338077))

(declare-fun m!338079 () Bool)

(assert (=> b!334495 m!338079))

(declare-fun m!338081 () Bool)

(assert (=> b!334495 m!338081))

(check-sat (not b_next!6925) (not b!334498) b_and!14079 (not b!334501) tp_is_empty!6877 (not start!33676) (not b!334496) (not b!334493) (not b!334499) (not b!334495) (not b!334500) (not mapNonEmpty!11712))
(check-sat b_and!14079 (not b_next!6925))
