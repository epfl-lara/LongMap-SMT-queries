; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33884 () Bool)

(assert start!33884)

(declare-fun b_free!7063 () Bool)

(declare-fun b_next!7063 () Bool)

(assert (=> start!33884 (= b_free!7063 (not b_next!7063))))

(declare-fun tp!24702 () Bool)

(declare-fun b_and!14249 () Bool)

(assert (=> start!33884 (= tp!24702 b_and!14249)))

(declare-fun b!337359 () Bool)

(declare-fun res!186344 () Bool)

(declare-fun e!207020 () Bool)

(assert (=> b!337359 (=> (not res!186344) (not e!207020))))

(declare-datatypes ((array!17625 0))(
  ( (array!17626 (arr!8340 (Array (_ BitVec 32) (_ BitVec 64))) (size!8692 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17625)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17625 (_ BitVec 32)) Bool)

(assert (=> b!337359 (= res!186344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337360 () Bool)

(declare-fun e!207021 () Bool)

(assert (=> b!337360 (= e!207021 false)))

(declare-fun lt!160420 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17625 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337360 (= lt!160420 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!337361 () Bool)

(declare-fun e!207023 () Bool)

(declare-fun e!207019 () Bool)

(declare-fun mapRes!11928 () Bool)

(assert (=> b!337361 (= e!207023 (and e!207019 mapRes!11928))))

(declare-fun condMapEmpty!11928 () Bool)

(declare-datatypes ((V!10331 0))(
  ( (V!10332 (val!3552 Int)) )
))
(declare-datatypes ((ValueCell!3164 0))(
  ( (ValueCellFull!3164 (v!5717 V!10331)) (EmptyCell!3164) )
))
(declare-datatypes ((array!17627 0))(
  ( (array!17628 (arr!8341 (Array (_ BitVec 32) ValueCell!3164)) (size!8693 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17627)

(declare-fun mapDefault!11928 () ValueCell!3164)

