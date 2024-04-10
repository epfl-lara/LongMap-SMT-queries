; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104644 () Bool)

(assert start!104644)

(declare-fun b!1247737 () Bool)

(declare-fun e!707917 () Bool)

(declare-fun e!707916 () Bool)

(declare-fun mapRes!48814 () Bool)

(assert (=> b!1247737 (= e!707917 (and e!707916 mapRes!48814))))

(declare-fun condMapEmpty!48814 () Bool)

(declare-datatypes ((V!47195 0))(
  ( (V!47196 (val!15749 Int)) )
))
(declare-datatypes ((ValueCell!14923 0))(
  ( (ValueCellFull!14923 (v!18445 V!47195)) (EmptyCell!14923) )
))
(declare-datatypes ((array!80440 0))(
  ( (array!80441 (arr!38789 (Array (_ BitVec 32) ValueCell!14923)) (size!39325 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80440)

(declare-fun mapDefault!48814 () ValueCell!14923)

