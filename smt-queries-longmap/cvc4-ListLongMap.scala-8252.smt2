; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100464 () Bool)

(assert start!100464)

(declare-fun b_free!25787 () Bool)

(declare-fun b_next!25787 () Bool)

(assert (=> start!100464 (= b_free!25787 (not b_next!25787))))

(declare-fun tp!90350 () Bool)

(declare-fun b_and!42461 () Bool)

(assert (=> start!100464 (= tp!90350 b_and!42461)))

(declare-fun res!798566 () Bool)

(declare-fun e!681381 () Bool)

(assert (=> start!100464 (=> (not res!798566) (not e!681381))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77757 0))(
  ( (array!77758 (arr!37523 (Array (_ BitVec 32) (_ BitVec 64))) (size!38059 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77757)

(assert (=> start!100464 (= res!798566 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38059 _keys!1208))))))

(assert (=> start!100464 e!681381))

(declare-fun tp_is_empty!30491 () Bool)

(assert (=> start!100464 tp_is_empty!30491))

(declare-fun array_inv!28594 (array!77757) Bool)

(assert (=> start!100464 (array_inv!28594 _keys!1208)))

(assert (=> start!100464 true))

(assert (=> start!100464 tp!90350))

(declare-datatypes ((V!45781 0))(
  ( (V!45782 (val!15302 Int)) )
))
(declare-datatypes ((ValueCell!14536 0))(
  ( (ValueCellFull!14536 (v!17940 V!45781)) (EmptyCell!14536) )
))
(declare-datatypes ((array!77759 0))(
  ( (array!77760 (arr!37524 (Array (_ BitVec 32) ValueCell!14536)) (size!38060 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77759)

(declare-fun e!681379 () Bool)

(declare-fun array_inv!28595 (array!77759) Bool)

(assert (=> start!100464 (and (array_inv!28595 _values!996) e!681379)))

(declare-fun b!1199716 () Bool)

(declare-fun res!798570 () Bool)

(assert (=> b!1199716 (=> (not res!798570) (not e!681381))))

(declare-datatypes ((List!26406 0))(
  ( (Nil!26403) (Cons!26402 (h!27611 (_ BitVec 64)) (t!39173 List!26406)) )
))
(declare-fun arrayNoDuplicates!0 (array!77757 (_ BitVec 32) List!26406) Bool)

(assert (=> b!1199716 (= res!798570 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26403))))

(declare-fun b!1199717 () Bool)

(declare-fun e!681378 () Bool)

(declare-fun mapRes!47579 () Bool)

(assert (=> b!1199717 (= e!681379 (and e!681378 mapRes!47579))))

(declare-fun condMapEmpty!47579 () Bool)

(declare-fun mapDefault!47579 () ValueCell!14536)

