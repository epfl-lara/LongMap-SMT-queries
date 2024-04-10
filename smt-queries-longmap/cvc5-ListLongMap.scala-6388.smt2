; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82112 () Bool)

(assert start!82112)

(declare-fun b!957220 () Bool)

(declare-fun res!640812 () Bool)

(declare-fun e!539515 () Bool)

(assert (=> b!957220 (=> (not res!640812) (not e!539515))))

(declare-datatypes ((array!58311 0))(
  ( (array!58312 (arr!28030 (Array (_ BitVec 32) (_ BitVec 64))) (size!28509 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58311)

(assert (=> b!957220 (= res!640812 (and (bvsle #b00000000000000000000000000000000 (size!28509 _keys!1668)) (bvslt (size!28509 _keys!1668) #b01111111111111111111111111111111)))))

(declare-fun b!957222 () Bool)

(declare-fun e!539511 () Bool)

(declare-fun e!539510 () Bool)

(declare-fun mapRes!33631 () Bool)

(assert (=> b!957222 (= e!539511 (and e!539510 mapRes!33631))))

(declare-fun condMapEmpty!33631 () Bool)

(declare-datatypes ((V!33121 0))(
  ( (V!33122 (val!10602 Int)) )
))
(declare-datatypes ((ValueCell!10070 0))(
  ( (ValueCellFull!10070 (v!13158 V!33121)) (EmptyCell!10070) )
))
(declare-datatypes ((array!58313 0))(
  ( (array!58314 (arr!28031 (Array (_ BitVec 32) ValueCell!10070)) (size!28510 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58313)

(declare-fun mapDefault!33631 () ValueCell!10070)

