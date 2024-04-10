; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82904 () Bool)

(assert start!82904)

(declare-fun b_free!19031 () Bool)

(declare-fun b_next!19031 () Bool)

(assert (=> start!82904 (= b_free!19031 (not b_next!19031))))

(declare-fun tp!66221 () Bool)

(declare-fun b_and!30519 () Bool)

(assert (=> start!82904 (= tp!66221 b_and!30519)))

(declare-fun b!967350 () Bool)

(declare-fun e!545245 () Bool)

(declare-fun e!545244 () Bool)

(declare-fun mapRes!34753 () Bool)

(assert (=> b!967350 (= e!545245 (and e!545244 mapRes!34753))))

(declare-fun condMapEmpty!34753 () Bool)

(declare-datatypes ((V!34101 0))(
  ( (V!34102 (val!10970 Int)) )
))
(declare-datatypes ((ValueCell!10438 0))(
  ( (ValueCellFull!10438 (v!13528 V!34101)) (EmptyCell!10438) )
))
(declare-datatypes ((array!59753 0))(
  ( (array!59754 (arr!28745 (Array (_ BitVec 32) ValueCell!10438)) (size!29224 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59753)

(declare-fun mapDefault!34753 () ValueCell!10438)

