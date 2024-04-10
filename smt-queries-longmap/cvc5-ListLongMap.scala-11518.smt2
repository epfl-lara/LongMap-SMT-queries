; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134082 () Bool)

(assert start!134082)

(declare-fun b_free!32209 () Bool)

(declare-fun b_next!32209 () Bool)

(assert (=> start!134082 (= b_free!32209 (not b_next!32209))))

(declare-fun tp!113945 () Bool)

(declare-fun b_and!51853 () Bool)

(assert (=> start!134082 (= tp!113945 b_and!51853)))

(declare-fun mapNonEmpty!59883 () Bool)

(declare-fun mapRes!59883 () Bool)

(declare-fun tp!113946 () Bool)

(declare-fun e!873532 () Bool)

(assert (=> mapNonEmpty!59883 (= mapRes!59883 (and tp!113946 e!873532))))

(declare-datatypes ((V!60193 0))(
  ( (V!60194 (val!19578 Int)) )
))
(declare-datatypes ((ValueCell!18464 0))(
  ( (ValueCellFull!18464 (v!22337 V!60193)) (EmptyCell!18464) )
))
(declare-fun mapRest!59883 () (Array (_ BitVec 32) ValueCell!18464))

(declare-fun mapKey!59883 () (_ BitVec 32))

(declare-datatypes ((array!104668 0))(
  ( (array!104669 (arr!50519 (Array (_ BitVec 32) ValueCell!18464)) (size!51069 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104668)

(declare-fun mapValue!59883 () ValueCell!18464)

(assert (=> mapNonEmpty!59883 (= (arr!50519 _values!487) (store mapRest!59883 mapKey!59883 mapValue!59883))))

(declare-fun b!1567093 () Bool)

(declare-fun res!1071046 () Bool)

(declare-fun e!873531 () Bool)

(assert (=> b!1567093 (=> (not res!1071046) (not e!873531))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104670 0))(
  ( (array!104671 (arr!50520 (Array (_ BitVec 32) (_ BitVec 64))) (size!51070 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104670)

(assert (=> b!1567093 (= res!1071046 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51070 _keys!637)) (bvslt from!782 (size!51070 _keys!637))))))

(declare-fun res!1071042 () Bool)

(assert (=> start!134082 (=> (not res!1071042) (not e!873531))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134082 (= res!1071042 (validMask!0 mask!947))))

(assert (=> start!134082 e!873531))

(assert (=> start!134082 tp!113945))

(declare-fun tp_is_empty!38989 () Bool)

(assert (=> start!134082 tp_is_empty!38989))

(assert (=> start!134082 true))

(declare-fun array_inv!39251 (array!104670) Bool)

(assert (=> start!134082 (array_inv!39251 _keys!637)))

(declare-fun e!873535 () Bool)

(declare-fun array_inv!39252 (array!104668) Bool)

(assert (=> start!134082 (and (array_inv!39252 _values!487) e!873535)))

(declare-fun mapIsEmpty!59883 () Bool)

(assert (=> mapIsEmpty!59883 mapRes!59883))

(declare-fun b!1567094 () Bool)

(assert (=> b!1567094 (= e!873532 tp_is_empty!38989)))

(declare-fun b!1567095 () Bool)

(declare-fun res!1071040 () Bool)

(assert (=> b!1567095 (=> (not res!1071040) (not e!873531))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1567095 (= res!1071040 (and (= (size!51069 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51070 _keys!637) (size!51069 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1567096 () Bool)

(declare-fun e!873533 () Bool)

(assert (=> b!1567096 (= e!873533 tp_is_empty!38989)))

(declare-fun b!1567097 () Bool)

(assert (=> b!1567097 (= e!873535 (and e!873533 mapRes!59883))))

(declare-fun condMapEmpty!59883 () Bool)

(declare-fun mapDefault!59883 () ValueCell!18464)

