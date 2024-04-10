; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82516 () Bool)

(assert start!82516)

(declare-fun b!961622 () Bool)

(declare-fun res!643565 () Bool)

(declare-fun e!542251 () Bool)

(assert (=> b!961622 (=> (not res!643565) (not e!542251))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33585 0))(
  ( (V!33586 (val!10776 Int)) )
))
(declare-datatypes ((ValueCell!10244 0))(
  ( (ValueCellFull!10244 (v!13334 V!33585)) (EmptyCell!10244) )
))
(declare-datatypes ((array!58999 0))(
  ( (array!59000 (arr!28368 (Array (_ BitVec 32) ValueCell!10244)) (size!28847 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58999)

(declare-datatypes ((array!59001 0))(
  ( (array!59002 (arr!28369 (Array (_ BitVec 32) (_ BitVec 64))) (size!28848 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59001)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961622 (= res!643565 (and (= (size!28847 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28848 _keys!1686) (size!28847 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961623 () Bool)

(declare-fun e!542253 () Bool)

(declare-fun e!542255 () Bool)

(declare-fun mapRes!34171 () Bool)

(assert (=> b!961623 (= e!542253 (and e!542255 mapRes!34171))))

(declare-fun condMapEmpty!34171 () Bool)

(declare-fun mapDefault!34171 () ValueCell!10244)

