; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35014 () Bool)

(assert start!35014)

(declare-fun b_free!7703 () Bool)

(declare-fun b_next!7703 () Bool)

(assert (=> start!35014 (= b_free!7703 (not b_next!7703))))

(declare-fun tp!26688 () Bool)

(declare-fun b_and!14933 () Bool)

(assert (=> start!35014 (= tp!26688 b_and!14933)))

(declare-fun b!350843 () Bool)

(declare-fun res!194493 () Bool)

(declare-fun e!214880 () Bool)

(assert (=> b!350843 (=> (not res!194493) (not e!214880))))

(declare-datatypes ((array!18897 0))(
  ( (array!18898 (arr!8954 (Array (_ BitVec 32) (_ BitVec 64))) (size!9306 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18897)

(declare-datatypes ((List!5209 0))(
  ( (Nil!5206) (Cons!5205 (h!6061 (_ BitVec 64)) (t!10347 List!5209)) )
))
(declare-fun arrayNoDuplicates!0 (array!18897 (_ BitVec 32) List!5209) Bool)

(assert (=> b!350843 (= res!194493 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5206))))

(declare-fun b!350844 () Bool)

(declare-fun e!214883 () Bool)

(assert (=> b!350844 (= e!214883 false)))

(declare-fun lt!164655 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18897 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350844 (= lt!164655 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!350846 () Bool)

(declare-fun res!194490 () Bool)

(assert (=> b!350846 (=> (not res!194490) (not e!214880))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11183 0))(
  ( (V!11184 (val!3872 Int)) )
))
(declare-fun zeroValue!1467 () V!11183)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3484 0))(
  ( (ValueCellFull!3484 (v!6059 V!11183)) (EmptyCell!3484) )
))
(declare-datatypes ((array!18899 0))(
  ( (array!18900 (arr!8955 (Array (_ BitVec 32) ValueCell!3484)) (size!9307 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18899)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11183)

(declare-datatypes ((tuple2!5588 0))(
  ( (tuple2!5589 (_1!2805 (_ BitVec 64)) (_2!2805 V!11183)) )
))
(declare-datatypes ((List!5210 0))(
  ( (Nil!5207) (Cons!5206 (h!6062 tuple2!5588) (t!10348 List!5210)) )
))
(declare-datatypes ((ListLongMap!4501 0))(
  ( (ListLongMap!4502 (toList!2266 List!5210)) )
))
(declare-fun contains!2335 (ListLongMap!4501 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1787 (array!18897 array!18899 (_ BitVec 32) (_ BitVec 32) V!11183 V!11183 (_ BitVec 32) Int) ListLongMap!4501)

(assert (=> b!350846 (= res!194490 (not (contains!2335 (getCurrentListMap!1787 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!350847 () Bool)

(declare-fun res!194495 () Bool)

(assert (=> b!350847 (=> (not res!194495) (not e!214880))))

(assert (=> b!350847 (= res!194495 (and (= (size!9307 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9306 _keys!1895) (size!9307 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350848 () Bool)

(declare-fun res!194489 () Bool)

(assert (=> b!350848 (=> (not res!194489) (not e!214883))))

(declare-fun arrayContainsKey!0 (array!18897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350848 (= res!194489 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!350849 () Bool)

(assert (=> b!350849 (= e!214880 e!214883)))

(declare-fun res!194491 () Bool)

(assert (=> b!350849 (=> (not res!194491) (not e!214883))))

(declare-datatypes ((SeekEntryResult!3445 0))(
  ( (MissingZero!3445 (index!15959 (_ BitVec 32))) (Found!3445 (index!15960 (_ BitVec 32))) (Intermediate!3445 (undefined!4257 Bool) (index!15961 (_ BitVec 32)) (x!34917 (_ BitVec 32))) (Undefined!3445) (MissingVacant!3445 (index!15962 (_ BitVec 32))) )
))
(declare-fun lt!164656 () SeekEntryResult!3445)

(assert (=> b!350849 (= res!194491 (and (not (is-Found!3445 lt!164656)) (not (is-MissingZero!3445 lt!164656)) (is-MissingVacant!3445 lt!164656)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18897 (_ BitVec 32)) SeekEntryResult!3445)

(assert (=> b!350849 (= lt!164656 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12954 () Bool)

(declare-fun mapRes!12954 () Bool)

(assert (=> mapIsEmpty!12954 mapRes!12954))

(declare-fun b!350850 () Bool)

(declare-fun res!194494 () Bool)

(assert (=> b!350850 (=> (not res!194494) (not e!214880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350850 (= res!194494 (validKeyInArray!0 k!1348))))

(declare-fun b!350845 () Bool)

(declare-fun res!194496 () Bool)

(assert (=> b!350845 (=> (not res!194496) (not e!214880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18897 (_ BitVec 32)) Bool)

(assert (=> b!350845 (= res!194496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!194492 () Bool)

(assert (=> start!35014 (=> (not res!194492) (not e!214880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35014 (= res!194492 (validMask!0 mask!2385))))

(assert (=> start!35014 e!214880))

(assert (=> start!35014 true))

(declare-fun tp_is_empty!7655 () Bool)

(assert (=> start!35014 tp_is_empty!7655))

(assert (=> start!35014 tp!26688))

(declare-fun e!214885 () Bool)

(declare-fun array_inv!6608 (array!18899) Bool)

(assert (=> start!35014 (and (array_inv!6608 _values!1525) e!214885)))

(declare-fun array_inv!6609 (array!18897) Bool)

(assert (=> start!35014 (array_inv!6609 _keys!1895)))

(declare-fun b!350851 () Bool)

(declare-fun e!214884 () Bool)

(assert (=> b!350851 (= e!214885 (and e!214884 mapRes!12954))))

(declare-fun condMapEmpty!12954 () Bool)

(declare-fun mapDefault!12954 () ValueCell!3484)

