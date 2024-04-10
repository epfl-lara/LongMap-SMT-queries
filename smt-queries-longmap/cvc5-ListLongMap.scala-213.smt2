; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3960 () Bool)

(assert start!3960)

(declare-fun b_free!865 () Bool)

(declare-fun b_next!865 () Bool)

(assert (=> start!3960 (= b_free!865 (not b_next!865))))

(declare-fun tp!4015 () Bool)

(declare-fun b_and!1675 () Bool)

(assert (=> start!3960 (= tp!4015 b_and!1675)))

(declare-fun b!28359 () Bool)

(declare-fun e!18344 () Bool)

(declare-fun tp_is_empty!1219 () Bool)

(assert (=> b!28359 (= e!18344 tp_is_empty!1219)))

(declare-fun b!28360 () Bool)

(declare-fun e!18341 () Bool)

(declare-fun e!18343 () Bool)

(declare-fun mapRes!1357 () Bool)

(assert (=> b!28360 (= e!18341 (and e!18343 mapRes!1357))))

(declare-fun condMapEmpty!1357 () Bool)

(declare-datatypes ((V!1451 0))(
  ( (V!1452 (val!636 Int)) )
))
(declare-datatypes ((ValueCell!410 0))(
  ( (ValueCellFull!410 (v!1725 V!1451)) (EmptyCell!410) )
))
(declare-datatypes ((array!1677 0))(
  ( (array!1678 (arr!792 (Array (_ BitVec 32) ValueCell!410)) (size!893 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1677)

(declare-fun mapDefault!1357 () ValueCell!410)

