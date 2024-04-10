; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133466 () Bool)

(assert start!133466)

(declare-fun b!1560357 () Bool)

(declare-fun e!869449 () Bool)

(declare-fun tp_is_empty!38549 () Bool)

(assert (=> b!1560357 (= e!869449 tp_is_empty!38549)))

(declare-fun b!1560358 () Bool)

(declare-fun res!1067001 () Bool)

(declare-fun e!869445 () Bool)

(assert (=> b!1560358 (=> (not res!1067001) (not e!869445))))

(declare-datatypes ((array!103822 0))(
  ( (array!103823 (arr!50103 (Array (_ BitVec 32) (_ BitVec 64))) (size!50653 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103822)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103822 (_ BitVec 32)) Bool)

(assert (=> b!1560358 (= res!1067001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560359 () Bool)

(assert (=> b!1560359 (= e!869445 false)))

(declare-fun lt!670980 () Bool)

(declare-datatypes ((V!59605 0))(
  ( (V!59606 (val!19358 Int)) )
))
(declare-datatypes ((tuple2!25038 0))(
  ( (tuple2!25039 (_1!12530 (_ BitVec 64)) (_2!12530 V!59605)) )
))
(declare-datatypes ((List!36393 0))(
  ( (Nil!36390) (Cons!36389 (h!37835 tuple2!25038) (t!51126 List!36393)) )
))
(declare-datatypes ((ListLongMap!22473 0))(
  ( (ListLongMap!22474 (toList!11252 List!36393)) )
))
(declare-fun contains!10242 (ListLongMap!22473 (_ BitVec 64)) Bool)

(assert (=> b!1560359 (= lt!670980 (contains!10242 (ListLongMap!22474 Nil!36390) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1066997 () Bool)

(assert (=> start!133466 (=> (not res!1066997) (not e!869445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133466 (= res!1066997 (validMask!0 mask!947))))

(assert (=> start!133466 e!869445))

(assert (=> start!133466 true))

(declare-fun array_inv!38947 (array!103822) Bool)

(assert (=> start!133466 (array_inv!38947 _keys!637)))

(declare-datatypes ((ValueCell!18244 0))(
  ( (ValueCellFull!18244 (v!22110 V!59605)) (EmptyCell!18244) )
))
(declare-datatypes ((array!103824 0))(
  ( (array!103825 (arr!50104 (Array (_ BitVec 32) ValueCell!18244)) (size!50654 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103824)

(declare-fun e!869447 () Bool)

(declare-fun array_inv!38948 (array!103824) Bool)

(assert (=> start!133466 (and (array_inv!38948 _values!487) e!869447)))

(declare-fun b!1560360 () Bool)

(declare-fun res!1066996 () Bool)

(assert (=> b!1560360 (=> (not res!1066996) (not e!869445))))

(assert (=> b!1560360 (= res!1066996 (not (contains!10242 (ListLongMap!22474 Nil!36390) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1560361 () Bool)

(declare-fun res!1066999 () Bool)

(assert (=> b!1560361 (=> (not res!1066999) (not e!869445))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560361 (= res!1066999 (and (= (size!50654 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50653 _keys!637) (size!50654 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560362 () Bool)

(declare-fun mapRes!59199 () Bool)

(assert (=> b!1560362 (= e!869447 (and e!869449 mapRes!59199))))

(declare-fun condMapEmpty!59199 () Bool)

(declare-fun mapDefault!59199 () ValueCell!18244)

