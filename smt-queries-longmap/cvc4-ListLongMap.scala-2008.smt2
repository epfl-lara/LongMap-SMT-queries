; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35032 () Bool)

(assert start!35032)

(declare-fun b_free!7721 () Bool)

(declare-fun b_next!7721 () Bool)

(assert (=> start!35032 (= b_free!7721 (not b_next!7721))))

(declare-fun tp!26741 () Bool)

(declare-fun b_and!14951 () Bool)

(assert (=> start!35032 (= tp!26741 b_and!14951)))

(declare-fun b!351140 () Bool)

(declare-fun res!194710 () Bool)

(declare-fun e!215044 () Bool)

(assert (=> b!351140 (=> (not res!194710) (not e!215044))))

(declare-datatypes ((array!18933 0))(
  ( (array!18934 (arr!8972 (Array (_ BitVec 32) (_ BitVec 64))) (size!9324 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18933)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18933 (_ BitVec 32)) Bool)

(assert (=> b!351140 (= res!194710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12981 () Bool)

(declare-fun mapRes!12981 () Bool)

(declare-fun tp!26742 () Bool)

(declare-fun e!215042 () Bool)

(assert (=> mapNonEmpty!12981 (= mapRes!12981 (and tp!26742 e!215042))))

(declare-datatypes ((V!11207 0))(
  ( (V!11208 (val!3881 Int)) )
))
(declare-datatypes ((ValueCell!3493 0))(
  ( (ValueCellFull!3493 (v!6068 V!11207)) (EmptyCell!3493) )
))
(declare-fun mapRest!12981 () (Array (_ BitVec 32) ValueCell!3493))

(declare-fun mapKey!12981 () (_ BitVec 32))

(declare-fun mapValue!12981 () ValueCell!3493)

(declare-datatypes ((array!18935 0))(
  ( (array!18936 (arr!8973 (Array (_ BitVec 32) ValueCell!3493)) (size!9325 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18935)

(assert (=> mapNonEmpty!12981 (= (arr!8973 _values!1525) (store mapRest!12981 mapKey!12981 mapValue!12981))))

(declare-fun b!351142 () Bool)

(declare-fun e!215043 () Bool)

(assert (=> b!351142 (= e!215044 e!215043)))

(declare-fun res!194712 () Bool)

(assert (=> b!351142 (=> (not res!194712) (not e!215043))))

(declare-datatypes ((SeekEntryResult!3453 0))(
  ( (MissingZero!3453 (index!15991 (_ BitVec 32))) (Found!3453 (index!15992 (_ BitVec 32))) (Intermediate!3453 (undefined!4265 Bool) (index!15993 (_ BitVec 32)) (x!34949 (_ BitVec 32))) (Undefined!3453) (MissingVacant!3453 (index!15994 (_ BitVec 32))) )
))
(declare-fun lt!164709 () SeekEntryResult!3453)

(assert (=> b!351142 (= res!194712 (and (not (is-Found!3453 lt!164709)) (not (is-MissingZero!3453 lt!164709)) (is-MissingVacant!3453 lt!164709)))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18933 (_ BitVec 32)) SeekEntryResult!3453)

(assert (=> b!351142 (= lt!164709 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!351143 () Bool)

(declare-fun res!194707 () Bool)

(assert (=> b!351143 (=> (not res!194707) (not e!215044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351143 (= res!194707 (validKeyInArray!0 k!1348))))

(declare-fun b!351144 () Bool)

(declare-fun tp_is_empty!7673 () Bool)

(assert (=> b!351144 (= e!215042 tp_is_empty!7673)))

(declare-fun b!351145 () Bool)

(declare-fun res!194708 () Bool)

(assert (=> b!351145 (=> (not res!194708) (not e!215044))))

(declare-datatypes ((List!5221 0))(
  ( (Nil!5218) (Cons!5217 (h!6073 (_ BitVec 64)) (t!10359 List!5221)) )
))
(declare-fun arrayNoDuplicates!0 (array!18933 (_ BitVec 32) List!5221) Bool)

(assert (=> b!351145 (= res!194708 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5218))))

(declare-fun b!351146 () Bool)

(declare-fun res!194709 () Bool)

(assert (=> b!351146 (=> (not res!194709) (not e!215044))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!351146 (= res!194709 (and (= (size!9325 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9324 _keys!1895) (size!9325 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12981 () Bool)

(assert (=> mapIsEmpty!12981 mapRes!12981))

(declare-fun b!351147 () Bool)

(declare-fun e!215045 () Bool)

(declare-fun e!215047 () Bool)

(assert (=> b!351147 (= e!215045 (and e!215047 mapRes!12981))))

(declare-fun condMapEmpty!12981 () Bool)

(declare-fun mapDefault!12981 () ValueCell!3493)

