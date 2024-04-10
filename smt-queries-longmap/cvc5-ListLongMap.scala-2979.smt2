; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42150 () Bool)

(assert start!42150)

(declare-fun b_free!11683 () Bool)

(declare-fun b_next!11683 () Bool)

(assert (=> start!42150 (= b_free!11683 (not b_next!11683))))

(declare-fun tp!41070 () Bool)

(declare-fun b_and!20105 () Bool)

(assert (=> start!42150 (= tp!41070 b_and!20105)))

(declare-fun b!470552 () Bool)

(declare-fun e!275679 () Bool)

(declare-fun e!275676 () Bool)

(declare-fun mapRes!21367 () Bool)

(assert (=> b!470552 (= e!275679 (and e!275676 mapRes!21367))))

(declare-fun condMapEmpty!21367 () Bool)

(declare-datatypes ((V!18587 0))(
  ( (V!18588 (val!6600 Int)) )
))
(declare-datatypes ((ValueCell!6212 0))(
  ( (ValueCellFull!6212 (v!8891 V!18587)) (EmptyCell!6212) )
))
(declare-datatypes ((array!29993 0))(
  ( (array!29994 (arr!14420 (Array (_ BitVec 32) ValueCell!6212)) (size!14772 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29993)

(declare-fun mapDefault!21367 () ValueCell!6212)

