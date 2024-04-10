; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41308 () Bool)

(assert start!41308)

(declare-fun b!461997 () Bool)

(declare-fun e!269499 () Bool)

(declare-datatypes ((array!28707 0))(
  ( (array!28708 (arr!13790 (Array (_ BitVec 32) (_ BitVec 64))) (size!14142 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28707)

(assert (=> b!461997 (= e!269499 (and (bvsle #b00000000000000000000000000000000 (size!14142 _keys!1025)) (bvsge (size!14142 _keys!1025) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!20344 () Bool)

(declare-fun mapRes!20344 () Bool)

(assert (=> mapIsEmpty!20344 mapRes!20344))

(declare-fun b!461998 () Bool)

(declare-fun e!269502 () Bool)

(declare-fun e!269500 () Bool)

(assert (=> b!461998 (= e!269502 (and e!269500 mapRes!20344))))

(declare-fun condMapEmpty!20344 () Bool)

(declare-datatypes ((V!17711 0))(
  ( (V!17712 (val!6272 Int)) )
))
(declare-datatypes ((ValueCell!5884 0))(
  ( (ValueCellFull!5884 (v!8558 V!17711)) (EmptyCell!5884) )
))
(declare-datatypes ((array!28709 0))(
  ( (array!28710 (arr!13791 (Array (_ BitVec 32) ValueCell!5884)) (size!14143 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28709)

(declare-fun mapDefault!20344 () ValueCell!5884)

