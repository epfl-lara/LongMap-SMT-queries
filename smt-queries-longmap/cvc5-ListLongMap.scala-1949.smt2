; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34440 () Bool)

(assert start!34440)

(declare-fun b_free!7363 () Bool)

(declare-fun b_next!7363 () Bool)

(assert (=> start!34440 (= b_free!7363 (not b_next!7363))))

(declare-fun tp!25635 () Bool)

(declare-fun b_and!14571 () Bool)

(assert (=> start!34440 (= tp!25635 b_and!14571)))

(declare-fun b!343948 () Bool)

(declare-fun res!190162 () Bool)

(declare-fun e!210876 () Bool)

(assert (=> b!343948 (=> (not res!190162) (not e!210876))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10731 0))(
  ( (V!10732 (val!3702 Int)) )
))
(declare-datatypes ((ValueCell!3314 0))(
  ( (ValueCellFull!3314 (v!5878 V!10731)) (EmptyCell!3314) )
))
(declare-datatypes ((array!18221 0))(
  ( (array!18222 (arr!8627 (Array (_ BitVec 32) ValueCell!3314)) (size!8979 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18221)

(declare-datatypes ((array!18223 0))(
  ( (array!18224 (arr!8628 (Array (_ BitVec 32) (_ BitVec 64))) (size!8980 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18223)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343948 (= res!190162 (and (= (size!8979 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8980 _keys!1895) (size!8979 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343949 () Bool)

(declare-fun res!190161 () Bool)

(assert (=> b!343949 (=> (not res!190161) (not e!210876))))

(declare-datatypes ((List!4981 0))(
  ( (Nil!4978) (Cons!4977 (h!5833 (_ BitVec 64)) (t!10097 List!4981)) )
))
(declare-fun arrayNoDuplicates!0 (array!18223 (_ BitVec 32) List!4981) Bool)

(assert (=> b!343949 (= res!190161 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4978))))

(declare-fun mapNonEmpty!12411 () Bool)

(declare-fun mapRes!12411 () Bool)

(declare-fun tp!25634 () Bool)

(declare-fun e!210879 () Bool)

(assert (=> mapNonEmpty!12411 (= mapRes!12411 (and tp!25634 e!210879))))

(declare-fun mapKey!12411 () (_ BitVec 32))

(declare-fun mapValue!12411 () ValueCell!3314)

(declare-fun mapRest!12411 () (Array (_ BitVec 32) ValueCell!3314))

(assert (=> mapNonEmpty!12411 (= (arr!8627 _values!1525) (store mapRest!12411 mapKey!12411 mapValue!12411))))

(declare-fun res!190163 () Bool)

(assert (=> start!34440 (=> (not res!190163) (not e!210876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34440 (= res!190163 (validMask!0 mask!2385))))

(assert (=> start!34440 e!210876))

(assert (=> start!34440 true))

(declare-fun tp_is_empty!7315 () Bool)

(assert (=> start!34440 tp_is_empty!7315))

(assert (=> start!34440 tp!25635))

(declare-fun e!210875 () Bool)

(declare-fun array_inv!6394 (array!18221) Bool)

(assert (=> start!34440 (and (array_inv!6394 _values!1525) e!210875)))

(declare-fun array_inv!6395 (array!18223) Bool)

(assert (=> start!34440 (array_inv!6395 _keys!1895)))

(declare-fun b!343950 () Bool)

(assert (=> b!343950 (= e!210879 tp_is_empty!7315)))

(declare-fun b!343951 () Bool)

(assert (=> b!343951 (= e!210876 false)))

(declare-datatypes ((SeekEntryResult!3330 0))(
  ( (MissingZero!3330 (index!15499 (_ BitVec 32))) (Found!3330 (index!15500 (_ BitVec 32))) (Intermediate!3330 (undefined!4142 Bool) (index!15501 (_ BitVec 32)) (x!34244 (_ BitVec 32))) (Undefined!3330) (MissingVacant!3330 (index!15502 (_ BitVec 32))) )
))
(declare-fun lt!162619 () SeekEntryResult!3330)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18223 (_ BitVec 32)) SeekEntryResult!3330)

(assert (=> b!343951 (= lt!162619 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!343952 () Bool)

(declare-fun e!210878 () Bool)

(assert (=> b!343952 (= e!210875 (and e!210878 mapRes!12411))))

(declare-fun condMapEmpty!12411 () Bool)

(declare-fun mapDefault!12411 () ValueCell!3314)

