; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83824 () Bool)

(assert start!83824)

(declare-fun b_free!19633 () Bool)

(declare-fun b_next!19633 () Bool)

(assert (=> start!83824 (= b_free!19633 (not b_next!19633))))

(declare-fun tp!68340 () Bool)

(declare-fun b_and!31355 () Bool)

(assert (=> start!83824 (= tp!68340 b_and!31355)))

(declare-fun mapIsEmpty!35969 () Bool)

(declare-fun mapRes!35969 () Bool)

(assert (=> mapIsEmpty!35969 mapRes!35969))

(declare-fun b!979122 () Bool)

(declare-fun e!551950 () Bool)

(declare-fun tp_is_empty!22627 () Bool)

(assert (=> b!979122 (= e!551950 tp_is_empty!22627)))

(declare-fun b!979123 () Bool)

(declare-fun res!655249 () Bool)

(declare-fun e!551952 () Bool)

(assert (=> b!979123 (=> (not res!655249) (not e!551952))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979123 (= res!655249 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979124 () Bool)

(declare-fun e!551951 () Bool)

(declare-fun e!551947 () Bool)

(assert (=> b!979124 (= e!551951 (and e!551947 mapRes!35969))))

(declare-fun condMapEmpty!35969 () Bool)

(declare-datatypes ((V!35153 0))(
  ( (V!35154 (val!11364 Int)) )
))
(declare-datatypes ((ValueCell!10832 0))(
  ( (ValueCellFull!10832 (v!13926 V!35153)) (EmptyCell!10832) )
))
(declare-datatypes ((array!61275 0))(
  ( (array!61276 (arr!29495 (Array (_ BitVec 32) ValueCell!10832)) (size!29974 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61275)

(declare-fun mapDefault!35969 () ValueCell!10832)

