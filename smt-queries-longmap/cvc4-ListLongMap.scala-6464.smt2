; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82628 () Bool)

(assert start!82628)

(declare-fun b_free!18761 () Bool)

(declare-fun b_next!18761 () Bool)

(assert (=> start!82628 (= b_free!18761 (not b_next!18761))))

(declare-fun tp!65403 () Bool)

(declare-fun b_and!30249 () Bool)

(assert (=> start!82628 (= tp!65403 b_and!30249)))

(declare-fun mapNonEmpty!34339 () Bool)

(declare-fun mapRes!34339 () Bool)

(declare-fun tp!65402 () Bool)

(declare-fun e!543094 () Bool)

(assert (=> mapNonEmpty!34339 (= mapRes!34339 (and tp!65402 e!543094))))

(declare-datatypes ((V!33733 0))(
  ( (V!33734 (val!10832 Int)) )
))
(declare-datatypes ((ValueCell!10300 0))(
  ( (ValueCellFull!10300 (v!13390 V!33733)) (EmptyCell!10300) )
))
(declare-datatypes ((array!59221 0))(
  ( (array!59222 (arr!28479 (Array (_ BitVec 32) ValueCell!10300)) (size!28958 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59221)

(declare-fun mapKey!34339 () (_ BitVec 32))

(declare-fun mapValue!34339 () ValueCell!10300)

(declare-fun mapRest!34339 () (Array (_ BitVec 32) ValueCell!10300))

(assert (=> mapNonEmpty!34339 (= (arr!28479 _values!1400) (store mapRest!34339 mapKey!34339 mapValue!34339))))

(declare-fun b!963129 () Bool)

(declare-fun res!644574 () Bool)

(declare-fun e!543093 () Bool)

(assert (=> b!963129 (=> (not res!644574) (not e!543093))))

(declare-datatypes ((array!59223 0))(
  ( (array!59224 (arr!28480 (Array (_ BitVec 32) (_ BitVec 64))) (size!28959 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59223)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59223 (_ BitVec 32)) Bool)

(assert (=> b!963129 (= res!644574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963130 () Bool)

(declare-fun e!543092 () Bool)

(declare-fun e!543095 () Bool)

(assert (=> b!963130 (= e!543092 (and e!543095 mapRes!34339))))

(declare-fun condMapEmpty!34339 () Bool)

(declare-fun mapDefault!34339 () ValueCell!10300)

