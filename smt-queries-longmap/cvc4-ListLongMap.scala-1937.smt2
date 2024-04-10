; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34320 () Bool)

(assert start!34320)

(declare-fun b_free!7295 () Bool)

(declare-fun b_next!7295 () Bool)

(assert (=> start!34320 (= b_free!7295 (not b_next!7295))))

(declare-fun tp!25425 () Bool)

(declare-fun b_and!14499 () Bool)

(assert (=> start!34320 (= tp!25425 b_and!14499)))

(declare-fun b!342551 () Bool)

(declare-fun res!189356 () Bool)

(declare-fun e!210057 () Bool)

(assert (=> b!342551 (=> (not res!189356) (not e!210057))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10639 0))(
  ( (V!10640 (val!3668 Int)) )
))
(declare-datatypes ((ValueCell!3280 0))(
  ( (ValueCellFull!3280 (v!5842 V!10639)) (EmptyCell!3280) )
))
(declare-datatypes ((array!18087 0))(
  ( (array!18088 (arr!8562 (Array (_ BitVec 32) ValueCell!3280)) (size!8914 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18087)

(declare-datatypes ((array!18089 0))(
  ( (array!18090 (arr!8563 (Array (_ BitVec 32) (_ BitVec 64))) (size!8915 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18089)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!342551 (= res!189356 (and (= (size!8914 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8915 _keys!1895) (size!8914 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12303 () Bool)

(declare-fun mapRes!12303 () Bool)

(assert (=> mapIsEmpty!12303 mapRes!12303))

(declare-fun b!342552 () Bool)

(declare-fun res!189354 () Bool)

(assert (=> b!342552 (=> (not res!189354) (not e!210057))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10639)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10639)

(declare-datatypes ((tuple2!5316 0))(
  ( (tuple2!5317 (_1!2669 (_ BitVec 64)) (_2!2669 V!10639)) )
))
(declare-datatypes ((List!4934 0))(
  ( (Nil!4931) (Cons!4930 (h!5786 tuple2!5316) (t!10046 List!4934)) )
))
(declare-datatypes ((ListLongMap!4229 0))(
  ( (ListLongMap!4230 (toList!2130 List!4934)) )
))
(declare-fun contains!2186 (ListLongMap!4229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1651 (array!18089 array!18087 (_ BitVec 32) (_ BitVec 32) V!10639 V!10639 (_ BitVec 32) Int) ListLongMap!4229)

(assert (=> b!342552 (= res!189354 (not (contains!2186 (getCurrentListMap!1651 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!342553 () Bool)

(declare-datatypes ((Unit!10670 0))(
  ( (Unit!10671) )
))
(declare-fun e!210060 () Unit!10670)

(declare-fun Unit!10672 () Unit!10670)

(assert (=> b!342553 (= e!210060 Unit!10672)))

(declare-fun lt!162185 () Unit!10670)

(declare-fun lemmaArrayContainsKeyThenInListMap!303 (array!18089 array!18087 (_ BitVec 32) (_ BitVec 32) V!10639 V!10639 (_ BitVec 64) (_ BitVec 32) Int) Unit!10670)

(declare-fun arrayScanForKey!0 (array!18089 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342553 (= lt!162185 (lemmaArrayContainsKeyThenInListMap!303 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342553 false))

(declare-fun b!342554 () Bool)

(declare-fun e!210062 () Bool)

(declare-fun tp_is_empty!7247 () Bool)

(assert (=> b!342554 (= e!210062 tp_is_empty!7247)))

(declare-fun b!342555 () Bool)

(declare-fun e!210058 () Bool)

(assert (=> b!342555 (= e!210057 e!210058)))

(declare-fun res!189357 () Bool)

(assert (=> b!342555 (=> (not res!189357) (not e!210058))))

(declare-datatypes ((SeekEntryResult!3304 0))(
  ( (MissingZero!3304 (index!15395 (_ BitVec 32))) (Found!3304 (index!15396 (_ BitVec 32))) (Intermediate!3304 (undefined!4116 Bool) (index!15397 (_ BitVec 32)) (x!34102 (_ BitVec 32))) (Undefined!3304) (MissingVacant!3304 (index!15398 (_ BitVec 32))) )
))
(declare-fun lt!162186 () SeekEntryResult!3304)

(assert (=> b!342555 (= res!189357 (and (not (is-Found!3304 lt!162186)) (not (is-MissingZero!3304 lt!162186)) (is-MissingVacant!3304 lt!162186)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18089 (_ BitVec 32)) SeekEntryResult!3304)

(assert (=> b!342555 (= lt!162186 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!189353 () Bool)

(assert (=> start!34320 (=> (not res!189353) (not e!210057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34320 (= res!189353 (validMask!0 mask!2385))))

(assert (=> start!34320 e!210057))

(assert (=> start!34320 true))

(assert (=> start!34320 tp_is_empty!7247))

(assert (=> start!34320 tp!25425))

(declare-fun e!210061 () Bool)

(declare-fun array_inv!6340 (array!18087) Bool)

(assert (=> start!34320 (and (array_inv!6340 _values!1525) e!210061)))

(declare-fun array_inv!6341 (array!18089) Bool)

(assert (=> start!34320 (array_inv!6341 _keys!1895)))

(declare-fun b!342556 () Bool)

(assert (=> b!342556 (= e!210058 false)))

(declare-fun lt!162187 () Unit!10670)

(assert (=> b!342556 (= lt!162187 e!210060)))

(declare-fun c!52824 () Bool)

(declare-fun arrayContainsKey!0 (array!18089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342556 (= c!52824 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!342557 () Bool)

(declare-fun e!210059 () Bool)

(assert (=> b!342557 (= e!210059 tp_is_empty!7247)))

(declare-fun b!342558 () Bool)

(declare-fun Unit!10673 () Unit!10670)

(assert (=> b!342558 (= e!210060 Unit!10673)))

(declare-fun b!342559 () Bool)

(declare-fun res!189355 () Bool)

(assert (=> b!342559 (=> (not res!189355) (not e!210057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342559 (= res!189355 (validKeyInArray!0 k!1348))))

(declare-fun b!342560 () Bool)

(declare-fun res!189359 () Bool)

(assert (=> b!342560 (=> (not res!189359) (not e!210057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18089 (_ BitVec 32)) Bool)

(assert (=> b!342560 (= res!189359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342561 () Bool)

(declare-fun res!189358 () Bool)

(assert (=> b!342561 (=> (not res!189358) (not e!210057))))

(declare-datatypes ((List!4935 0))(
  ( (Nil!4932) (Cons!4931 (h!5787 (_ BitVec 64)) (t!10047 List!4935)) )
))
(declare-fun arrayNoDuplicates!0 (array!18089 (_ BitVec 32) List!4935) Bool)

(assert (=> b!342561 (= res!189358 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4932))))

(declare-fun b!342562 () Bool)

(assert (=> b!342562 (= e!210061 (and e!210062 mapRes!12303))))

(declare-fun condMapEmpty!12303 () Bool)

(declare-fun mapDefault!12303 () ValueCell!3280)

