; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34138 () Bool)

(assert start!34138)

(declare-fun b_free!7181 () Bool)

(declare-fun b_next!7181 () Bool)

(assert (=> start!34138 (= b_free!7181 (not b_next!7181))))

(declare-fun tp!25074 () Bool)

(declare-fun b_and!14379 () Bool)

(assert (=> start!34138 (= tp!25074 b_and!14379)))

(declare-fun mapNonEmpty!12123 () Bool)

(declare-fun mapRes!12123 () Bool)

(declare-fun tp!25073 () Bool)

(declare-fun e!208711 () Bool)

(assert (=> mapNonEmpty!12123 (= mapRes!12123 (and tp!25073 e!208711))))

(declare-datatypes ((V!10487 0))(
  ( (V!10488 (val!3611 Int)) )
))
(declare-datatypes ((ValueCell!3223 0))(
  ( (ValueCellFull!3223 (v!5782 V!10487)) (EmptyCell!3223) )
))
(declare-fun mapRest!12123 () (Array (_ BitVec 32) ValueCell!3223))

(declare-fun mapKey!12123 () (_ BitVec 32))

(declare-fun mapValue!12123 () ValueCell!3223)

(declare-datatypes ((array!17869 0))(
  ( (array!17870 (arr!8456 (Array (_ BitVec 32) ValueCell!3223)) (size!8808 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17869)

(assert (=> mapNonEmpty!12123 (= (arr!8456 _values!1525) (store mapRest!12123 mapKey!12123 mapValue!12123))))

(declare-fun b!340215 () Bool)

(declare-fun res!187912 () Bool)

(declare-fun e!208713 () Bool)

(assert (=> b!340215 (=> (not res!187912) (not e!208713))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340215 (= res!187912 (validKeyInArray!0 k!1348))))

(declare-fun b!340216 () Bool)

(declare-fun e!208716 () Bool)

(assert (=> b!340216 (= e!208713 e!208716)))

(declare-fun res!187916 () Bool)

(assert (=> b!340216 (=> (not res!187916) (not e!208716))))

(declare-datatypes ((SeekEntryResult!3267 0))(
  ( (MissingZero!3267 (index!15247 (_ BitVec 32))) (Found!3267 (index!15248 (_ BitVec 32))) (Intermediate!3267 (undefined!4079 Bool) (index!15249 (_ BitVec 32)) (x!33883 (_ BitVec 32))) (Undefined!3267) (MissingVacant!3267 (index!15250 (_ BitVec 32))) )
))
(declare-fun lt!161482 () SeekEntryResult!3267)

(assert (=> b!340216 (= res!187916 (and (not (is-Found!3267 lt!161482)) (not (is-MissingZero!3267 lt!161482)) (is-MissingVacant!3267 lt!161482)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17871 0))(
  ( (array!17872 (arr!8457 (Array (_ BitVec 32) (_ BitVec 64))) (size!8809 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17871)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17871 (_ BitVec 32)) SeekEntryResult!3267)

(assert (=> b!340216 (= lt!161482 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!340217 () Bool)

(declare-fun res!187913 () Bool)

(assert (=> b!340217 (=> (not res!187913) (not e!208713))))

(declare-fun zeroValue!1467 () V!10487)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10487)

(declare-datatypes ((tuple2!5244 0))(
  ( (tuple2!5245 (_1!2633 (_ BitVec 64)) (_2!2633 V!10487)) )
))
(declare-datatypes ((List!4862 0))(
  ( (Nil!4859) (Cons!4858 (h!5714 tuple2!5244) (t!9968 List!4862)) )
))
(declare-datatypes ((ListLongMap!4157 0))(
  ( (ListLongMap!4158 (toList!2094 List!4862)) )
))
(declare-fun contains!2147 (ListLongMap!4157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1615 (array!17871 array!17869 (_ BitVec 32) (_ BitVec 32) V!10487 V!10487 (_ BitVec 32) Int) ListLongMap!4157)

(assert (=> b!340217 (= res!187913 (not (contains!2147 (getCurrentListMap!1615 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!187918 () Bool)

(assert (=> start!34138 (=> (not res!187918) (not e!208713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34138 (= res!187918 (validMask!0 mask!2385))))

(assert (=> start!34138 e!208713))

(assert (=> start!34138 true))

(declare-fun tp_is_empty!7133 () Bool)

(assert (=> start!34138 tp_is_empty!7133))

(assert (=> start!34138 tp!25074))

(declare-fun e!208714 () Bool)

(declare-fun array_inv!6266 (array!17869) Bool)

(assert (=> start!34138 (and (array_inv!6266 _values!1525) e!208714)))

(declare-fun array_inv!6267 (array!17871) Bool)

(assert (=> start!34138 (array_inv!6267 _keys!1895)))

(declare-fun b!340218 () Bool)

(declare-fun e!208712 () Bool)

(assert (=> b!340218 (= e!208714 (and e!208712 mapRes!12123))))

(declare-fun condMapEmpty!12123 () Bool)

(declare-fun mapDefault!12123 () ValueCell!3223)

