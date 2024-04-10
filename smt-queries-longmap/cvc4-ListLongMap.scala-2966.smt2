; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42056 () Bool)

(assert start!42056)

(declare-fun b_free!11609 () Bool)

(declare-fun b_next!11609 () Bool)

(assert (=> start!42056 (= b_free!11609 (not b_next!11609))))

(declare-fun tp!40845 () Bool)

(declare-fun b_and!20019 () Bool)

(assert (=> start!42056 (= tp!40845 b_and!20019)))

(declare-fun b!469541 () Bool)

(declare-fun e!274958 () Bool)

(declare-fun e!274956 () Bool)

(declare-fun mapRes!21253 () Bool)

(assert (=> b!469541 (= e!274958 (and e!274956 mapRes!21253))))

(declare-fun condMapEmpty!21253 () Bool)

(declare-datatypes ((V!18487 0))(
  ( (V!18488 (val!6563 Int)) )
))
(declare-datatypes ((ValueCell!6175 0))(
  ( (ValueCellFull!6175 (v!8853 V!18487)) (EmptyCell!6175) )
))
(declare-datatypes ((array!29847 0))(
  ( (array!29848 (arr!14348 (Array (_ BitVec 32) ValueCell!6175)) (size!14700 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29847)

(declare-fun mapDefault!21253 () ValueCell!6175)

