; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40878 () Bool)

(assert start!40878)

(declare-fun b_free!10813 () Bool)

(declare-fun b_next!10813 () Bool)

(assert (=> start!40878 (= b_free!10813 (not b_next!10813))))

(declare-fun tp!38265 () Bool)

(declare-fun b_and!18955 () Bool)

(assert (=> start!40878 (= tp!38265 b_and!18955)))

(declare-fun b!453917 () Bool)

(declare-fun e!265671 () Bool)

(declare-fun e!265674 () Bool)

(declare-fun mapRes!19867 () Bool)

(assert (=> b!453917 (= e!265671 (and e!265674 mapRes!19867))))

(declare-fun condMapEmpty!19867 () Bool)

(declare-datatypes ((V!17307 0))(
  ( (V!17308 (val!6120 Int)) )
))
(declare-datatypes ((ValueCell!5732 0))(
  ( (ValueCellFull!5732 (v!8386 V!17307)) (EmptyCell!5732) )
))
(declare-datatypes ((array!28109 0))(
  ( (array!28110 (arr!13498 (Array (_ BitVec 32) ValueCell!5732)) (size!13850 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28109)

(declare-fun mapDefault!19867 () ValueCell!5732)

