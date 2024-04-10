; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83100 () Bool)

(assert start!83100)

(declare-fun b!969350 () Bool)

(declare-fun e!546495 () Bool)

(declare-fun tp_is_empty!21991 () Bool)

(assert (=> b!969350 (= e!546495 tp_is_empty!21991)))

(declare-fun b!969351 () Bool)

(declare-fun e!546496 () Bool)

(declare-fun e!546499 () Bool)

(declare-fun mapRes!34996 () Bool)

(assert (=> b!969351 (= e!546496 (and e!546499 mapRes!34996))))

(declare-fun condMapEmpty!34996 () Bool)

(declare-datatypes ((V!34305 0))(
  ( (V!34306 (val!11046 Int)) )
))
(declare-datatypes ((ValueCell!10514 0))(
  ( (ValueCellFull!10514 (v!13605 V!34305)) (EmptyCell!10514) )
))
(declare-datatypes ((array!60049 0))(
  ( (array!60050 (arr!28888 (Array (_ BitVec 32) ValueCell!10514)) (size!29367 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60049)

(declare-fun mapDefault!34996 () ValueCell!10514)

