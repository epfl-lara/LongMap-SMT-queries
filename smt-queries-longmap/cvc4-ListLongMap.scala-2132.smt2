; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36058 () Bool)

(assert start!36058)

(declare-fun mapNonEmpty!14160 () Bool)

(declare-fun mapRes!14160 () Bool)

(declare-fun tp!28236 () Bool)

(declare-fun e!221736 () Bool)

(assert (=> mapNonEmpty!14160 (= mapRes!14160 (and tp!28236 e!221736))))

(declare-datatypes ((V!12199 0))(
  ( (V!12200 (val!4253 Int)) )
))
(declare-datatypes ((ValueCell!3865 0))(
  ( (ValueCellFull!3865 (v!6448 V!12199)) (EmptyCell!3865) )
))
(declare-datatypes ((array!20391 0))(
  ( (array!20392 (arr!9680 (Array (_ BitVec 32) ValueCell!3865)) (size!10032 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20391)

(declare-fun mapKey!14160 () (_ BitVec 32))

(declare-fun mapRest!14160 () (Array (_ BitVec 32) ValueCell!3865))

(declare-fun mapValue!14160 () ValueCell!3865)

(assert (=> mapNonEmpty!14160 (= (arr!9680 _values!1277) (store mapRest!14160 mapKey!14160 mapValue!14160))))

(declare-fun b!362016 () Bool)

(declare-fun res!201399 () Bool)

(declare-fun e!221735 () Bool)

(assert (=> b!362016 (=> (not res!201399) (not e!221735))))

(declare-datatypes ((array!20393 0))(
  ( (array!20394 (arr!9681 (Array (_ BitVec 32) (_ BitVec 64))) (size!10033 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20393)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20393 (_ BitVec 32)) Bool)

(assert (=> b!362016 (= res!201399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!362017 () Bool)

(declare-fun e!221739 () Bool)

(declare-fun e!221737 () Bool)

(assert (=> b!362017 (= e!221739 (and e!221737 mapRes!14160))))

(declare-fun condMapEmpty!14160 () Bool)

(declare-fun mapDefault!14160 () ValueCell!3865)

