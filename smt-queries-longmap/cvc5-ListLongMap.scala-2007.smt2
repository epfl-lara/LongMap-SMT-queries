; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35022 () Bool)

(assert start!35022)

(declare-fun b_free!7711 () Bool)

(declare-fun b_next!7711 () Bool)

(assert (=> start!35022 (= b_free!7711 (not b_next!7711))))

(declare-fun tp!26712 () Bool)

(declare-fun b_and!14941 () Bool)

(assert (=> start!35022 (= tp!26712 b_and!14941)))

(declare-fun b!350975 () Bool)

(declare-fun res!194592 () Bool)

(declare-fun e!214954 () Bool)

(assert (=> b!350975 (=> (not res!194592) (not e!214954))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11195 0))(
  ( (V!11196 (val!3876 Int)) )
))
(declare-fun zeroValue!1467 () V!11195)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3488 0))(
  ( (ValueCellFull!3488 (v!6063 V!11195)) (EmptyCell!3488) )
))
(declare-datatypes ((array!18913 0))(
  ( (array!18914 (arr!8962 (Array (_ BitVec 32) ValueCell!3488)) (size!9314 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18913)

(declare-datatypes ((array!18915 0))(
  ( (array!18916 (arr!8963 (Array (_ BitVec 32) (_ BitVec 64))) (size!9315 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18915)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11195)

(declare-datatypes ((tuple2!5594 0))(
  ( (tuple2!5595 (_1!2808 (_ BitVec 64)) (_2!2808 V!11195)) )
))
(declare-datatypes ((List!5214 0))(
  ( (Nil!5211) (Cons!5210 (h!6066 tuple2!5594) (t!10352 List!5214)) )
))
(declare-datatypes ((ListLongMap!4507 0))(
  ( (ListLongMap!4508 (toList!2269 List!5214)) )
))
(declare-fun contains!2338 (ListLongMap!4507 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1790 (array!18915 array!18913 (_ BitVec 32) (_ BitVec 32) V!11195 V!11195 (_ BitVec 32) Int) ListLongMap!4507)

(assert (=> b!350975 (= res!194592 (not (contains!2338 (getCurrentListMap!1790 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!350976 () Bool)

(declare-fun e!214953 () Bool)

(declare-fun tp_is_empty!7663 () Bool)

(assert (=> b!350976 (= e!214953 tp_is_empty!7663)))

(declare-fun b!350977 () Bool)

(declare-fun e!214957 () Bool)

(assert (=> b!350977 (= e!214957 tp_is_empty!7663)))

(declare-fun b!350978 () Bool)

(declare-fun res!194585 () Bool)

(assert (=> b!350978 (=> (not res!194585) (not e!214954))))

(assert (=> b!350978 (= res!194585 (and (= (size!9314 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9315 _keys!1895) (size!9314 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350979 () Bool)

(declare-fun e!214956 () Bool)

(assert (=> b!350979 (= e!214954 e!214956)))

(declare-fun res!194586 () Bool)

(assert (=> b!350979 (=> (not res!194586) (not e!214956))))

(declare-datatypes ((SeekEntryResult!3448 0))(
  ( (MissingZero!3448 (index!15971 (_ BitVec 32))) (Found!3448 (index!15972 (_ BitVec 32))) (Intermediate!3448 (undefined!4260 Bool) (index!15973 (_ BitVec 32)) (x!34936 (_ BitVec 32))) (Undefined!3448) (MissingVacant!3448 (index!15974 (_ BitVec 32))) )
))
(declare-fun lt!164679 () SeekEntryResult!3448)

(assert (=> b!350979 (= res!194586 (and (not (is-Found!3448 lt!164679)) (not (is-MissingZero!3448 lt!164679)) (is-MissingVacant!3448 lt!164679)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18915 (_ BitVec 32)) SeekEntryResult!3448)

(assert (=> b!350979 (= lt!164679 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!194590 () Bool)

(assert (=> start!35022 (=> (not res!194590) (not e!214954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35022 (= res!194590 (validMask!0 mask!2385))))

(assert (=> start!35022 e!214954))

(assert (=> start!35022 true))

(assert (=> start!35022 tp_is_empty!7663))

(assert (=> start!35022 tp!26712))

(declare-fun e!214952 () Bool)

(declare-fun array_inv!6616 (array!18913) Bool)

(assert (=> start!35022 (and (array_inv!6616 _values!1525) e!214952)))

(declare-fun array_inv!6617 (array!18915) Bool)

(assert (=> start!35022 (array_inv!6617 _keys!1895)))

(declare-fun b!350980 () Bool)

(declare-fun res!194591 () Bool)

(assert (=> b!350980 (=> (not res!194591) (not e!214954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18915 (_ BitVec 32)) Bool)

(assert (=> b!350980 (= res!194591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350981 () Bool)

(assert (=> b!350981 (= e!214956 false)))

(declare-fun lt!164680 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18915 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350981 (= lt!164680 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!350982 () Bool)

(declare-fun mapRes!12966 () Bool)

(assert (=> b!350982 (= e!214952 (and e!214953 mapRes!12966))))

(declare-fun condMapEmpty!12966 () Bool)

(declare-fun mapDefault!12966 () ValueCell!3488)

