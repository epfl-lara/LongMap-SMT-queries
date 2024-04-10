; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83022 () Bool)

(assert start!83022)

(declare-fun b!968752 () Bool)

(declare-fun e!546017 () Bool)

(declare-fun e!546020 () Bool)

(declare-fun mapRes!34906 () Bool)

(assert (=> b!968752 (= e!546017 (and e!546020 mapRes!34906))))

(declare-fun condMapEmpty!34906 () Bool)

(declare-datatypes ((V!34229 0))(
  ( (V!34230 (val!11018 Int)) )
))
(declare-datatypes ((ValueCell!10486 0))(
  ( (ValueCellFull!10486 (v!13576 V!34229)) (EmptyCell!10486) )
))
(declare-datatypes ((array!59945 0))(
  ( (array!59946 (arr!28838 (Array (_ BitVec 32) ValueCell!10486)) (size!29317 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59945)

(declare-fun mapDefault!34906 () ValueCell!10486)

