; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83858 () Bool)

(assert start!83858)

(declare-fun b_free!19667 () Bool)

(declare-fun b_next!19667 () Bool)

(assert (=> start!83858 (= b_free!19667 (not b_next!19667))))

(declare-fun tp!68442 () Bool)

(declare-fun b_and!31423 () Bool)

(assert (=> start!83858 (= tp!68442 b_and!31423)))

(declare-fun b!979717 () Bool)

(declare-fun e!552253 () Bool)

(declare-fun e!552255 () Bool)

(declare-fun mapRes!36020 () Bool)

(assert (=> b!979717 (= e!552253 (and e!552255 mapRes!36020))))

(declare-fun condMapEmpty!36020 () Bool)

(declare-datatypes ((V!35197 0))(
  ( (V!35198 (val!11381 Int)) )
))
(declare-datatypes ((ValueCell!10849 0))(
  ( (ValueCellFull!10849 (v!13943 V!35197)) (EmptyCell!10849) )
))
(declare-datatypes ((array!61339 0))(
  ( (array!61340 (arr!29527 (Array (_ BitVec 32) ValueCell!10849)) (size!30006 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61339)

(declare-fun mapDefault!36020 () ValueCell!10849)

