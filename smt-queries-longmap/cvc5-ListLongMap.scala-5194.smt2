; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70164 () Bool)

(assert start!70164)

(declare-fun b_free!12571 () Bool)

(declare-fun b_next!12571 () Bool)

(assert (=> start!70164 (= b_free!12571 (not b_next!12571))))

(declare-fun tp!44431 () Bool)

(declare-fun b_and!21351 () Bool)

(assert (=> start!70164 (= tp!44431 b_and!21351)))

(declare-fun b!815235 () Bool)

(declare-fun e!452021 () Bool)

(declare-fun tp_is_empty!14281 () Bool)

(assert (=> b!815235 (= e!452021 tp_is_empty!14281)))

(declare-fun b!815236 () Bool)

(declare-fun e!452023 () Bool)

(declare-fun mapRes!23005 () Bool)

(assert (=> b!815236 (= e!452023 (and e!452021 mapRes!23005))))

(declare-fun condMapEmpty!23005 () Bool)

(declare-datatypes ((V!24043 0))(
  ( (V!24044 (val!7188 Int)) )
))
(declare-datatypes ((ValueCell!6725 0))(
  ( (ValueCellFull!6725 (v!9615 V!24043)) (EmptyCell!6725) )
))
(declare-datatypes ((array!44766 0))(
  ( (array!44767 (arr!21442 (Array (_ BitVec 32) ValueCell!6725)) (size!21863 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44766)

(declare-fun mapDefault!23005 () ValueCell!6725)

