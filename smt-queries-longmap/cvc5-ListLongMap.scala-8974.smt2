; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108590 () Bool)

(assert start!108590)

(declare-fun b_free!28117 () Bool)

(declare-fun b_next!28117 () Bool)

(assert (=> start!108590 (= b_free!28117 (not b_next!28117))))

(declare-fun tp!99464 () Bool)

(declare-fun b_and!46181 () Bool)

(assert (=> start!108590 (= tp!99464 b_and!46181)))

(declare-fun b!1281823 () Bool)

(declare-fun res!851471 () Bool)

(declare-fun e!732366 () Bool)

(assert (=> b!1281823 (=> (not res!851471) (not e!732366))))

(declare-datatypes ((array!84584 0))(
  ( (array!84585 (arr!40795 (Array (_ BitVec 32) (_ BitVec 64))) (size!41345 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84584)

(declare-datatypes ((List!28901 0))(
  ( (Nil!28898) (Cons!28897 (h!30106 (_ BitVec 64)) (t!42443 List!28901)) )
))
(declare-fun arrayNoDuplicates!0 (array!84584 (_ BitVec 32) List!28901) Bool)

(assert (=> b!1281823 (= res!851471 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28898))))

(declare-fun b!1281824 () Bool)

(declare-fun res!851469 () Bool)

(assert (=> b!1281824 (=> (not res!851469) (not e!732366))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84584 (_ BitVec 32)) Bool)

(assert (=> b!1281824 (= res!851469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52190 () Bool)

(declare-fun mapRes!52190 () Bool)

(assert (=> mapIsEmpty!52190 mapRes!52190))

(declare-fun b!1281825 () Bool)

(declare-fun e!732364 () Bool)

(declare-fun e!732365 () Bool)

(assert (=> b!1281825 (= e!732364 (and e!732365 mapRes!52190))))

(declare-fun condMapEmpty!52190 () Bool)

(declare-datatypes ((V!50113 0))(
  ( (V!50114 (val!16953 Int)) )
))
(declare-datatypes ((ValueCell!15980 0))(
  ( (ValueCellFull!15980 (v!19554 V!50113)) (EmptyCell!15980) )
))
(declare-datatypes ((array!84586 0))(
  ( (array!84587 (arr!40796 (Array (_ BitVec 32) ValueCell!15980)) (size!41346 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84586)

(declare-fun mapDefault!52190 () ValueCell!15980)

