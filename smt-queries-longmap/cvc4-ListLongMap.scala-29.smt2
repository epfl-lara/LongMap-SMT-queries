; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!610 () Bool)

(assert start!610)

(declare-fun b_free!83 () Bool)

(declare-fun b_next!83 () Bool)

(assert (=> start!610 (= b_free!83 (not b_next!83))))

(declare-fun tp!466 () Bool)

(declare-fun b_and!221 () Bool)

(assert (=> start!610 (= tp!466 b_and!221)))

(declare-fun b!3805 () Bool)

(declare-fun e!1924 () Bool)

(declare-fun tp_is_empty!161 () Bool)

(assert (=> b!3805 (= e!1924 tp_is_empty!161)))

(declare-fun b!3806 () Bool)

(declare-fun res!5379 () Bool)

(declare-fun e!1925 () Bool)

(assert (=> b!3806 (=> (not res!5379) (not e!1925))))

(declare-datatypes ((array!257 0))(
  ( (array!258 (arr!121 (Array (_ BitVec 32) (_ BitVec 64))) (size!183 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!257)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!257 (_ BitVec 32)) Bool)

(assert (=> b!3806 (= res!5379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3807 () Bool)

(declare-fun e!1922 () Bool)

(declare-fun e!1921 () Bool)

(declare-fun mapRes!200 () Bool)

(assert (=> b!3807 (= e!1922 (and e!1921 mapRes!200))))

(declare-fun condMapEmpty!200 () Bool)

(declare-datatypes ((V!391 0))(
  ( (V!392 (val!86 Int)) )
))
(declare-datatypes ((ValueCell!64 0))(
  ( (ValueCellFull!64 (v!1173 V!391)) (EmptyCell!64) )
))
(declare-datatypes ((array!259 0))(
  ( (array!260 (arr!122 (Array (_ BitVec 32) ValueCell!64)) (size!184 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!259)

(declare-fun mapDefault!200 () ValueCell!64)

