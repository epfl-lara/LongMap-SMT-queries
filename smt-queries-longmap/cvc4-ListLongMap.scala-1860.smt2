; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33562 () Bool)

(assert start!33562)

(declare-fun b_free!6833 () Bool)

(declare-fun b_next!6833 () Bool)

(assert (=> start!33562 (= b_free!6833 (not b_next!6833))))

(declare-fun tp!23997 () Bool)

(declare-fun b_and!14009 () Bool)

(assert (=> start!33562 (= tp!23997 b_and!14009)))

(declare-fun b!333087 () Bool)

(declare-fun e!204534 () Bool)

(declare-fun tp_is_empty!6785 () Bool)

(assert (=> b!333087 (= e!204534 tp_is_empty!6785)))

(declare-fun mapNonEmpty!11568 () Bool)

(declare-fun mapRes!11568 () Bool)

(declare-fun tp!23996 () Bool)

(declare-fun e!204530 () Bool)

(assert (=> mapNonEmpty!11568 (= mapRes!11568 (and tp!23996 e!204530))))

(declare-datatypes ((V!10023 0))(
  ( (V!10024 (val!3437 Int)) )
))
(declare-datatypes ((ValueCell!3049 0))(
  ( (ValueCellFull!3049 (v!5597 V!10023)) (EmptyCell!3049) )
))
(declare-datatypes ((array!17165 0))(
  ( (array!17166 (arr!8115 (Array (_ BitVec 32) ValueCell!3049)) (size!8467 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17165)

(declare-fun mapValue!11568 () ValueCell!3049)

(declare-fun mapKey!11568 () (_ BitVec 32))

(declare-fun mapRest!11568 () (Array (_ BitVec 32) ValueCell!3049))

(assert (=> mapNonEmpty!11568 (= (arr!8115 _values!1525) (store mapRest!11568 mapKey!11568 mapValue!11568))))

(declare-fun e!204532 () Bool)

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3135 0))(
  ( (MissingZero!3135 (index!14719 (_ BitVec 32))) (Found!3135 (index!14720 (_ BitVec 32))) (Intermediate!3135 (undefined!3947 Bool) (index!14721 (_ BitVec 32)) (x!33177 (_ BitVec 32))) (Undefined!3135) (MissingVacant!3135 (index!14722 (_ BitVec 32))) )
))
(declare-fun lt!159160 () SeekEntryResult!3135)

(declare-datatypes ((array!17167 0))(
  ( (array!17168 (arr!8116 (Array (_ BitVec 32) (_ BitVec 64))) (size!8468 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17167)

(declare-fun b!333088 () Bool)

(assert (=> b!333088 (= e!204532 (and (is-Found!3135 lt!159160) (= (select (arr!8116 _keys!1895) (index!14720 lt!159160)) k!1348) (bvsge (index!14720 lt!159160) #b00000000000000000000000000000000) (bvsge (index!14720 lt!159160) (size!8468 _keys!1895))))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17167 (_ BitVec 32)) SeekEntryResult!3135)

(assert (=> b!333088 (= lt!159160 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!333089 () Bool)

(declare-fun res!183510 () Bool)

(assert (=> b!333089 (=> (not res!183510) (not e!204532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333089 (= res!183510 (validKeyInArray!0 k!1348))))

(declare-fun b!333090 () Bool)

(declare-fun res!183512 () Bool)

(assert (=> b!333090 (=> (not res!183512) (not e!204532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17167 (_ BitVec 32)) Bool)

(assert (=> b!333090 (= res!183512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!333091 () Bool)

(declare-fun res!183514 () Bool)

(assert (=> b!333091 (=> (not res!183514) (not e!204532))))

(declare-datatypes ((List!4619 0))(
  ( (Nil!4616) (Cons!4615 (h!5471 (_ BitVec 64)) (t!9703 List!4619)) )
))
(declare-fun arrayNoDuplicates!0 (array!17167 (_ BitVec 32) List!4619) Bool)

(assert (=> b!333091 (= res!183514 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4616))))

(declare-fun b!333092 () Bool)

(assert (=> b!333092 (= e!204530 tp_is_empty!6785)))

(declare-fun b!333093 () Bool)

(declare-fun e!204533 () Bool)

(assert (=> b!333093 (= e!204533 (and e!204534 mapRes!11568))))

(declare-fun condMapEmpty!11568 () Bool)

(declare-fun mapDefault!11568 () ValueCell!3049)

