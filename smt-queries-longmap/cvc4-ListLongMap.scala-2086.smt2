; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35688 () Bool)

(assert start!35688)

(declare-fun b!358481 () Bool)

(declare-fun e!219435 () Bool)

(assert (=> b!358481 (= e!219435 false)))

(declare-fun lt!166199 () Bool)

(declare-datatypes ((array!19847 0))(
  ( (array!19848 (arr!9417 (Array (_ BitVec 32) (_ BitVec 64))) (size!9769 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19847)

(declare-datatypes ((List!5433 0))(
  ( (Nil!5430) (Cons!5429 (h!6285 (_ BitVec 64)) (t!10583 List!5433)) )
))
(declare-fun arrayNoDuplicates!0 (array!19847 (_ BitVec 32) List!5433) Bool)

(assert (=> b!358481 (= lt!166199 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5430))))

(declare-fun b!358482 () Bool)

(declare-fun e!219434 () Bool)

(declare-fun tp_is_empty!8141 () Bool)

(assert (=> b!358482 (= e!219434 tp_is_empty!8141)))

(declare-fun b!358483 () Bool)

(declare-fun e!219433 () Bool)

(assert (=> b!358483 (= e!219433 tp_is_empty!8141)))

(declare-fun b!358484 () Bool)

(declare-fun e!219436 () Bool)

(declare-fun mapRes!13719 () Bool)

(assert (=> b!358484 (= e!219436 (and e!219434 mapRes!13719))))

(declare-fun condMapEmpty!13719 () Bool)

(declare-datatypes ((V!11831 0))(
  ( (V!11832 (val!4115 Int)) )
))
(declare-datatypes ((ValueCell!3727 0))(
  ( (ValueCellFull!3727 (v!6309 V!11831)) (EmptyCell!3727) )
))
(declare-datatypes ((array!19849 0))(
  ( (array!19850 (arr!9418 (Array (_ BitVec 32) ValueCell!3727)) (size!9770 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19849)

(declare-fun mapDefault!13719 () ValueCell!3727)

