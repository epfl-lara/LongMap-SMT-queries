; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42322 () Bool)

(assert start!42322)

(declare-fun b_free!11813 () Bool)

(declare-fun b_next!11813 () Bool)

(assert (=> start!42322 (= b_free!11813 (not b_next!11813))))

(declare-fun tp!41469 () Bool)

(declare-fun b_and!20259 () Bool)

(assert (=> start!42322 (= tp!41469 b_and!20259)))

(declare-fun mapIsEmpty!21571 () Bool)

(declare-fun mapRes!21571 () Bool)

(assert (=> mapIsEmpty!21571 mapRes!21571))

(declare-fun b!472180 () Bool)

(declare-fun e!276824 () Bool)

(declare-fun e!276826 () Bool)

(assert (=> b!472180 (= e!276824 (and e!276826 mapRes!21571))))

(declare-fun condMapEmpty!21571 () Bool)

(declare-datatypes ((V!18759 0))(
  ( (V!18760 (val!6665 Int)) )
))
(declare-datatypes ((ValueCell!6277 0))(
  ( (ValueCellFull!6277 (v!8956 V!18759)) (EmptyCell!6277) )
))
(declare-datatypes ((array!30241 0))(
  ( (array!30242 (arr!14541 (Array (_ BitVec 32) ValueCell!6277)) (size!14893 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30241)

(declare-fun mapDefault!21571 () ValueCell!6277)

