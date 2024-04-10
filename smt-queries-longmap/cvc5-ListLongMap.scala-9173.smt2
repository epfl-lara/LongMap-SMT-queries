; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110328 () Bool)

(assert start!110328)

(declare-fun b_free!29311 () Bool)

(declare-fun b_next!29311 () Bool)

(assert (=> start!110328 (= b_free!29311 (not b_next!29311))))

(declare-fun tp!103102 () Bool)

(declare-fun b_and!47517 () Bool)

(assert (=> start!110328 (= tp!103102 b_and!47517)))

(declare-fun b!1305763 () Bool)

(declare-fun call!64514 () Bool)

(assert (=> b!1305763 call!64514))

(declare-datatypes ((Unit!43254 0))(
  ( (Unit!43255) )
))
(declare-fun lt!584705 () Unit!43254)

(declare-fun call!64521 () Unit!43254)

(assert (=> b!1305763 (= lt!584705 call!64521)))

(declare-fun call!64520 () Bool)

(assert (=> b!1305763 (not call!64520)))

(declare-fun lt!584697 () Unit!43254)

(declare-fun call!64515 () Unit!43254)

(assert (=> b!1305763 (= lt!584697 call!64515)))

(declare-datatypes ((V!51705 0))(
  ( (V!51706 (val!17550 Int)) )
))
(declare-datatypes ((tuple2!22658 0))(
  ( (tuple2!22659 (_1!11340 (_ BitVec 64)) (_2!11340 V!51705)) )
))
(declare-datatypes ((List!29778 0))(
  ( (Nil!29775) (Cons!29774 (h!30983 tuple2!22658) (t!43382 List!29778)) )
))
(declare-datatypes ((ListLongMap!20315 0))(
  ( (ListLongMap!20316 (toList!10173 List!29778)) )
))
(declare-fun lt!584700 () ListLongMap!20315)

(declare-fun call!64512 () ListLongMap!20315)

(assert (=> b!1305763 (= lt!584700 call!64512)))

(declare-fun e!744831 () Unit!43254)

(assert (=> b!1305763 (= e!744831 lt!584705)))

(declare-fun b!1305764 () Bool)

(declare-fun e!744837 () Bool)

(declare-fun e!744830 () Bool)

(declare-fun mapRes!54037 () Bool)

(assert (=> b!1305764 (= e!744837 (and e!744830 mapRes!54037))))

(declare-fun condMapEmpty!54037 () Bool)

(declare-datatypes ((ValueCell!16577 0))(
  ( (ValueCellFull!16577 (v!20175 V!51705)) (EmptyCell!16577) )
))
(declare-datatypes ((array!86920 0))(
  ( (array!86921 (arr!41946 (Array (_ BitVec 32) ValueCell!16577)) (size!42496 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86920)

(declare-fun mapDefault!54037 () ValueCell!16577)

