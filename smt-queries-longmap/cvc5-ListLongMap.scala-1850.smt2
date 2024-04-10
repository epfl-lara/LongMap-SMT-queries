; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33468 () Bool)

(assert start!33468)

(declare-fun b!332199 () Bool)

(declare-fun e!203943 () Bool)

(declare-fun tp_is_empty!6721 () Bool)

(assert (=> b!332199 (= e!203943 tp_is_empty!6721)))

(declare-fun b!332200 () Bool)

(declare-fun res!183014 () Bool)

(declare-fun e!203945 () Bool)

(assert (=> b!332200 (=> (not res!183014) (not e!203945))))

(declare-datatypes ((array!17037 0))(
  ( (array!17038 (arr!8053 (Array (_ BitVec 32) (_ BitVec 64))) (size!8405 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17037)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17037 (_ BitVec 32)) Bool)

(assert (=> b!332200 (= res!183014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332201 () Bool)

(declare-fun res!183012 () Bool)

(assert (=> b!332201 (=> (not res!183012) (not e!203945))))

(declare-datatypes ((V!9939 0))(
  ( (V!9940 (val!3405 Int)) )
))
(declare-datatypes ((ValueCell!3017 0))(
  ( (ValueCellFull!3017 (v!5564 V!9939)) (EmptyCell!3017) )
))
(declare-datatypes ((array!17039 0))(
  ( (array!17040 (arr!8054 (Array (_ BitVec 32) ValueCell!3017)) (size!8406 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17039)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332201 (= res!183012 (and (= (size!8406 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8405 _keys!1895) (size!8406 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11466 () Bool)

(declare-fun mapRes!11466 () Bool)

(declare-fun tp!23841 () Bool)

(assert (=> mapNonEmpty!11466 (= mapRes!11466 (and tp!23841 e!203943))))

(declare-fun mapValue!11466 () ValueCell!3017)

(declare-fun mapRest!11466 () (Array (_ BitVec 32) ValueCell!3017))

(declare-fun mapKey!11466 () (_ BitVec 32))

(assert (=> mapNonEmpty!11466 (= (arr!8054 _values!1525) (store mapRest!11466 mapKey!11466 mapValue!11466))))

(declare-fun res!183013 () Bool)

(assert (=> start!33468 (=> (not res!183013) (not e!203945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33468 (= res!183013 (validMask!0 mask!2385))))

(assert (=> start!33468 e!203945))

(assert (=> start!33468 true))

(declare-fun e!203946 () Bool)

(declare-fun array_inv!5996 (array!17039) Bool)

(assert (=> start!33468 (and (array_inv!5996 _values!1525) e!203946)))

(declare-fun array_inv!5997 (array!17037) Bool)

(assert (=> start!33468 (array_inv!5997 _keys!1895)))

(declare-fun b!332202 () Bool)

(declare-fun e!203944 () Bool)

(assert (=> b!332202 (= e!203946 (and e!203944 mapRes!11466))))

(declare-fun condMapEmpty!11466 () Bool)

(declare-fun mapDefault!11466 () ValueCell!3017)

