; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133526 () Bool)

(assert start!133526)

(declare-fun b_free!31943 () Bool)

(declare-fun b_next!31943 () Bool)

(assert (=> start!133526 (= b_free!31943 (not b_next!31943))))

(declare-fun tp!112953 () Bool)

(declare-fun b_and!51399 () Bool)

(assert (=> start!133526 (= tp!112953 b_and!51399)))

(declare-fun b!1560951 () Bool)

(declare-fun res!1067325 () Bool)

(declare-fun e!869898 () Bool)

(assert (=> b!1560951 (=> (not res!1067325) (not e!869898))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103936 0))(
  ( (array!103937 (arr!50160 (Array (_ BitVec 32) (_ BitVec 64))) (size!50710 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103936)

(declare-datatypes ((V!59685 0))(
  ( (V!59686 (val!19388 Int)) )
))
(declare-datatypes ((ValueCell!18274 0))(
  ( (ValueCellFull!18274 (v!22140 V!59685)) (EmptyCell!18274) )
))
(declare-datatypes ((array!103938 0))(
  ( (array!103939 (arr!50161 (Array (_ BitVec 32) ValueCell!18274)) (size!50711 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103938)

(assert (=> b!1560951 (= res!1067325 (and (= (size!50711 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50710 _keys!637) (size!50711 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560952 () Bool)

(declare-fun e!869896 () Bool)

(declare-fun tp_is_empty!38609 () Bool)

(assert (=> b!1560952 (= e!869896 tp_is_empty!38609)))

(declare-fun mapNonEmpty!59289 () Bool)

(declare-fun mapRes!59289 () Bool)

(declare-fun tp!112952 () Bool)

(assert (=> mapNonEmpty!59289 (= mapRes!59289 (and tp!112952 e!869896))))

(declare-fun mapRest!59289 () (Array (_ BitVec 32) ValueCell!18274))

(declare-fun mapKey!59289 () (_ BitVec 32))

(declare-fun mapValue!59289 () ValueCell!18274)

(assert (=> mapNonEmpty!59289 (= (arr!50161 _values!487) (store mapRest!59289 mapKey!59289 mapValue!59289))))

(declare-fun res!1067320 () Bool)

(assert (=> start!133526 (=> (not res!1067320) (not e!869898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133526 (= res!1067320 (validMask!0 mask!947))))

(assert (=> start!133526 e!869898))

(assert (=> start!133526 tp!112953))

(assert (=> start!133526 tp_is_empty!38609))

(assert (=> start!133526 true))

(declare-fun array_inv!38991 (array!103936) Bool)

(assert (=> start!133526 (array_inv!38991 _keys!637)))

(declare-fun e!869897 () Bool)

(declare-fun array_inv!38992 (array!103938) Bool)

(assert (=> start!133526 (and (array_inv!38992 _values!487) e!869897)))

(declare-fun b!1560953 () Bool)

(declare-fun e!869895 () Bool)

(assert (=> b!1560953 (= e!869897 (and e!869895 mapRes!59289))))

(declare-fun condMapEmpty!59289 () Bool)

(declare-fun mapDefault!59289 () ValueCell!18274)

