; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112722 () Bool)

(assert start!112722)

(declare-fun b_free!31033 () Bool)

(declare-fun b_next!31033 () Bool)

(assert (=> start!112722 (= b_free!31033 (not b_next!31033))))

(declare-fun tp!108742 () Bool)

(declare-fun b_and!50011 () Bool)

(assert (=> start!112722 (= tp!108742 b_and!50011)))

(declare-fun b!1337120 () Bool)

(declare-fun e!761393 () Bool)

(declare-fun tp_is_empty!36943 () Bool)

(assert (=> b!1337120 (= e!761393 tp_is_empty!36943)))

(declare-fun mapIsEmpty!57095 () Bool)

(declare-fun mapRes!57095 () Bool)

(assert (=> mapIsEmpty!57095 mapRes!57095))

(declare-fun b!1337122 () Bool)

(declare-fun res!887332 () Bool)

(declare-fun e!761395 () Bool)

(assert (=> b!1337122 (=> (not res!887332) (not e!761395))))

(declare-datatypes ((array!90746 0))(
  ( (array!90747 (arr!43837 (Array (_ BitVec 32) (_ BitVec 64))) (size!44387 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90746)

(declare-datatypes ((List!31065 0))(
  ( (Nil!31062) (Cons!31061 (h!32270 (_ BitVec 64)) (t!45377 List!31065)) )
))
(declare-fun arrayNoDuplicates!0 (array!90746 (_ BitVec 32) List!31065) Bool)

(assert (=> b!1337122 (= res!887332 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31062))))

(declare-fun mapNonEmpty!57095 () Bool)

(declare-fun tp!108743 () Bool)

(assert (=> mapNonEmpty!57095 (= mapRes!57095 (and tp!108743 e!761393))))

(declare-fun mapKey!57095 () (_ BitVec 32))

(declare-datatypes ((V!54361 0))(
  ( (V!54362 (val!18546 Int)) )
))
(declare-datatypes ((ValueCell!17573 0))(
  ( (ValueCellFull!17573 (v!21187 V!54361)) (EmptyCell!17573) )
))
(declare-fun mapRest!57095 () (Array (_ BitVec 32) ValueCell!17573))

(declare-fun mapValue!57095 () ValueCell!17573)

(declare-datatypes ((array!90748 0))(
  ( (array!90749 (arr!43838 (Array (_ BitVec 32) ValueCell!17573)) (size!44388 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90748)

(assert (=> mapNonEmpty!57095 (= (arr!43838 _values!1320) (store mapRest!57095 mapKey!57095 mapValue!57095))))

(declare-fun b!1337123 () Bool)

(declare-fun e!761396 () Bool)

(assert (=> b!1337123 (= e!761396 tp_is_empty!36943)))

(declare-fun b!1337124 () Bool)

(declare-fun res!887331 () Bool)

(assert (=> b!1337124 (=> (not res!887331) (not e!761395))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90746 (_ BitVec 32)) Bool)

(assert (=> b!1337124 (= res!887331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1337125 () Bool)

(declare-fun res!887330 () Bool)

(assert (=> b!1337125 (=> (not res!887330) (not e!761395))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1337125 (= res!887330 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44387 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!887333 () Bool)

(assert (=> start!112722 (=> (not res!887333) (not e!761395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112722 (= res!887333 (validMask!0 mask!1998))))

(assert (=> start!112722 e!761395))

(declare-fun e!761394 () Bool)

(declare-fun array_inv!33061 (array!90748) Bool)

(assert (=> start!112722 (and (array_inv!33061 _values!1320) e!761394)))

(assert (=> start!112722 true))

(declare-fun array_inv!33062 (array!90746) Bool)

(assert (=> start!112722 (array_inv!33062 _keys!1590)))

(assert (=> start!112722 tp!108742))

(assert (=> start!112722 tp_is_empty!36943))

(declare-fun b!1337121 () Bool)

(declare-fun res!887329 () Bool)

(assert (=> b!1337121 (=> (not res!887329) (not e!761395))))

(assert (=> b!1337121 (= res!887329 (and (= (size!44388 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44387 _keys!1590) (size!44388 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337126 () Bool)

(assert (=> b!1337126 (= e!761394 (and e!761396 mapRes!57095))))

(declare-fun condMapEmpty!57095 () Bool)

(declare-fun mapDefault!57095 () ValueCell!17573)

