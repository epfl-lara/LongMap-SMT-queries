; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100282 () Bool)

(assert start!100282)

(declare-fun mapIsEmpty!47360 () Bool)

(declare-fun mapRes!47360 () Bool)

(assert (=> mapIsEmpty!47360 mapRes!47360))

(declare-fun b!1196373 () Bool)

(declare-fun e!679741 () Bool)

(declare-fun e!679740 () Bool)

(assert (=> b!1196373 (= e!679741 (and e!679740 mapRes!47360))))

(declare-fun condMapEmpty!47360 () Bool)

(declare-datatypes ((V!45593 0))(
  ( (V!45594 (val!15231 Int)) )
))
(declare-datatypes ((ValueCell!14465 0))(
  ( (ValueCellFull!14465 (v!17869 V!45593)) (EmptyCell!14465) )
))
(declare-datatypes ((array!77479 0))(
  ( (array!77480 (arr!37386 (Array (_ BitVec 32) ValueCell!14465)) (size!37922 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77479)

(declare-fun mapDefault!47360 () ValueCell!14465)

