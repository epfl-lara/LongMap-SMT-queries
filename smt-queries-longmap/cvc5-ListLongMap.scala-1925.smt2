; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34196 () Bool)

(assert start!34196)

(declare-fun b_free!7219 () Bool)

(declare-fun b_next!7219 () Bool)

(assert (=> start!34196 (= b_free!7219 (not b_next!7219))))

(declare-fun tp!25191 () Bool)

(declare-fun b_and!14419 () Bool)

(assert (=> start!34196 (= tp!25191 b_and!14419)))

(declare-fun b!340957 () Bool)

(declare-fun res!188402 () Bool)

(declare-fun e!209132 () Bool)

(assert (=> b!340957 (=> (not res!188402) (not e!209132))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10539 0))(
  ( (V!10540 (val!3630 Int)) )
))
(declare-fun zeroValue!1467 () V!10539)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3242 0))(
  ( (ValueCellFull!3242 (v!5802 V!10539)) (EmptyCell!3242) )
))
(declare-datatypes ((array!17941 0))(
  ( (array!17942 (arr!8491 (Array (_ BitVec 32) ValueCell!3242)) (size!8843 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17941)

(declare-datatypes ((array!17943 0))(
  ( (array!17944 (arr!8492 (Array (_ BitVec 32) (_ BitVec 64))) (size!8844 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17943)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10539)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((tuple2!5266 0))(
  ( (tuple2!5267 (_1!2644 (_ BitVec 64)) (_2!2644 V!10539)) )
))
(declare-datatypes ((List!4886 0))(
  ( (Nil!4883) (Cons!4882 (h!5738 tuple2!5266) (t!9994 List!4886)) )
))
(declare-datatypes ((ListLongMap!4179 0))(
  ( (ListLongMap!4180 (toList!2105 List!4886)) )
))
(declare-fun contains!2159 (ListLongMap!4179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1626 (array!17943 array!17941 (_ BitVec 32) (_ BitVec 32) V!10539 V!10539 (_ BitVec 32) Int) ListLongMap!4179)

(assert (=> b!340957 (= res!188402 (not (contains!2159 (getCurrentListMap!1626 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!340958 () Bool)

(declare-fun e!209134 () Bool)

(assert (=> b!340958 (= e!209132 e!209134)))

(declare-fun res!188406 () Bool)

(assert (=> b!340958 (=> (not res!188406) (not e!209134))))

(declare-datatypes ((SeekEntryResult!3281 0))(
  ( (MissingZero!3281 (index!15303 (_ BitVec 32))) (Found!3281 (index!15304 (_ BitVec 32))) (Intermediate!3281 (undefined!4093 Bool) (index!15305 (_ BitVec 32)) (x!33963 (_ BitVec 32))) (Undefined!3281) (MissingVacant!3281 (index!15306 (_ BitVec 32))) )
))
(declare-fun lt!161683 () SeekEntryResult!3281)

(assert (=> b!340958 (= res!188406 (and (not (is-Found!3281 lt!161683)) (not (is-MissingZero!3281 lt!161683)) (is-MissingVacant!3281 lt!161683)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17943 (_ BitVec 32)) SeekEntryResult!3281)

(assert (=> b!340958 (= lt!161683 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!340959 () Bool)

(declare-fun e!209131 () Bool)

(declare-fun tp_is_empty!7171 () Bool)

(assert (=> b!340959 (= e!209131 tp_is_empty!7171)))

(declare-fun b!340960 () Bool)

(assert (=> b!340960 (= e!209134 false)))

(declare-fun lt!161682 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17943 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340960 (= lt!161682 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12183 () Bool)

(declare-fun mapRes!12183 () Bool)

(assert (=> mapIsEmpty!12183 mapRes!12183))

(declare-fun b!340961 () Bool)

(declare-fun e!209133 () Bool)

(assert (=> b!340961 (= e!209133 tp_is_empty!7171)))

(declare-fun b!340962 () Bool)

(declare-fun res!188407 () Bool)

(assert (=> b!340962 (=> (not res!188407) (not e!209132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340962 (= res!188407 (validKeyInArray!0 k!1348))))

(declare-fun b!340963 () Bool)

(declare-fun res!188404 () Bool)

(assert (=> b!340963 (=> (not res!188404) (not e!209132))))

(assert (=> b!340963 (= res!188404 (and (= (size!8843 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8844 _keys!1895) (size!8843 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!188403 () Bool)

(assert (=> start!34196 (=> (not res!188403) (not e!209132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34196 (= res!188403 (validMask!0 mask!2385))))

(assert (=> start!34196 e!209132))

(assert (=> start!34196 true))

(assert (=> start!34196 tp_is_empty!7171))

(assert (=> start!34196 tp!25191))

(declare-fun e!209135 () Bool)

(declare-fun array_inv!6290 (array!17941) Bool)

(assert (=> start!34196 (and (array_inv!6290 _values!1525) e!209135)))

(declare-fun array_inv!6291 (array!17943) Bool)

(assert (=> start!34196 (array_inv!6291 _keys!1895)))

(declare-fun b!340964 () Bool)

(declare-fun res!188401 () Bool)

(assert (=> b!340964 (=> (not res!188401) (not e!209134))))

(declare-fun arrayContainsKey!0 (array!17943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340964 (= res!188401 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!340965 () Bool)

(declare-fun res!188408 () Bool)

(assert (=> b!340965 (=> (not res!188408) (not e!209132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17943 (_ BitVec 32)) Bool)

(assert (=> b!340965 (= res!188408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340966 () Bool)

(assert (=> b!340966 (= e!209135 (and e!209133 mapRes!12183))))

(declare-fun condMapEmpty!12183 () Bool)

(declare-fun mapDefault!12183 () ValueCell!3242)

