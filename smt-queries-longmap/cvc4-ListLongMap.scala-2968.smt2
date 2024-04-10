; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42068 () Bool)

(assert start!42068)

(declare-fun b_free!11621 () Bool)

(declare-fun b_next!11621 () Bool)

(assert (=> start!42068 (= b_free!11621 (not b_next!11621))))

(declare-fun tp!40881 () Bool)

(declare-fun b_and!20031 () Bool)

(assert (=> start!42068 (= tp!40881 b_and!20031)))

(declare-fun b!469686 () Bool)

(declare-fun res!280678 () Bool)

(declare-fun e!275065 () Bool)

(assert (=> b!469686 (=> (not res!280678) (not e!275065))))

(declare-datatypes ((array!29869 0))(
  ( (array!29870 (arr!14359 (Array (_ BitVec 32) (_ BitVec 64))) (size!14711 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29869)

(declare-datatypes ((List!8727 0))(
  ( (Nil!8724) (Cons!8723 (h!9579 (_ BitVec 64)) (t!14687 List!8727)) )
))
(declare-fun arrayNoDuplicates!0 (array!29869 (_ BitVec 32) List!8727) Bool)

(assert (=> b!469686 (= res!280678 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8724))))

(declare-fun b!469687 () Bool)

(declare-fun e!275062 () Bool)

(declare-fun e!275066 () Bool)

(declare-fun mapRes!21271 () Bool)

(assert (=> b!469687 (= e!275062 (and e!275066 mapRes!21271))))

(declare-fun condMapEmpty!21271 () Bool)

(declare-datatypes ((V!18503 0))(
  ( (V!18504 (val!6569 Int)) )
))
(declare-datatypes ((ValueCell!6181 0))(
  ( (ValueCellFull!6181 (v!8859 V!18503)) (EmptyCell!6181) )
))
(declare-datatypes ((array!29871 0))(
  ( (array!29872 (arr!14360 (Array (_ BitVec 32) ValueCell!6181)) (size!14712 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29871)

(declare-fun mapDefault!21271 () ValueCell!6181)

