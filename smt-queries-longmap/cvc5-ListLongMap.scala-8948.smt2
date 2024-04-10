; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108414 () Bool)

(assert start!108414)

(declare-fun b_free!27961 () Bool)

(declare-fun b_next!27961 () Bool)

(assert (=> start!108414 (= b_free!27961 (not b_next!27961))))

(declare-fun tp!98993 () Bool)

(declare-fun b_and!46021 () Bool)

(assert (=> start!108414 (= tp!98993 b_and!46021)))

(declare-fun res!849969 () Bool)

(declare-fun e!731075 () Bool)

(assert (=> start!108414 (=> (not res!849969) (not e!731075))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108414 (= res!849969 (validMask!0 mask!2175))))

(assert (=> start!108414 e!731075))

(declare-fun tp_is_empty!33601 () Bool)

(assert (=> start!108414 tp_is_empty!33601))

(assert (=> start!108414 true))

(declare-datatypes ((V!49905 0))(
  ( (V!49906 (val!16875 Int)) )
))
(declare-datatypes ((ValueCell!15902 0))(
  ( (ValueCellFull!15902 (v!19475 V!49905)) (EmptyCell!15902) )
))
(declare-datatypes ((array!84288 0))(
  ( (array!84289 (arr!40648 (Array (_ BitVec 32) ValueCell!15902)) (size!41198 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84288)

(declare-fun e!731072 () Bool)

(declare-fun array_inv!30859 (array!84288) Bool)

(assert (=> start!108414 (and (array_inv!30859 _values!1445) e!731072)))

(declare-datatypes ((array!84290 0))(
  ( (array!84291 (arr!40649 (Array (_ BitVec 32) (_ BitVec 64))) (size!41199 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84290)

(declare-fun array_inv!30860 (array!84290) Bool)

(assert (=> start!108414 (array_inv!30860 _keys!1741)))

(assert (=> start!108414 tp!98993))

(declare-fun b!1279536 () Bool)

(declare-fun e!731071 () Bool)

(assert (=> b!1279536 (= e!731071 tp_is_empty!33601)))

(declare-fun b!1279537 () Bool)

(declare-fun res!849970 () Bool)

(assert (=> b!1279537 (=> (not res!849970) (not e!731075))))

(declare-datatypes ((List!28791 0))(
  ( (Nil!28788) (Cons!28787 (h!29996 (_ BitVec 64)) (t!42331 List!28791)) )
))
(declare-fun arrayNoDuplicates!0 (array!84290 (_ BitVec 32) List!28791) Bool)

(assert (=> b!1279537 (= res!849970 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28788))))

(declare-fun b!1279538 () Bool)

(declare-fun mapRes!51953 () Bool)

(assert (=> b!1279538 (= e!731072 (and e!731071 mapRes!51953))))

(declare-fun condMapEmpty!51953 () Bool)

(declare-fun mapDefault!51953 () ValueCell!15902)

