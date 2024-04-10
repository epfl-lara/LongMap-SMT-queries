; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113012 () Bool)

(assert start!113012)

(declare-fun b!1339483 () Bool)

(declare-fun res!888580 () Bool)

(declare-fun e!762949 () Bool)

(assert (=> b!1339483 (=> (not res!888580) (not e!762949))))

(declare-datatypes ((array!90982 0))(
  ( (array!90983 (arr!43947 (Array (_ BitVec 32) (_ BitVec 64))) (size!44497 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90982)

(declare-datatypes ((List!31110 0))(
  ( (Nil!31107) (Cons!31106 (h!32315 (_ BitVec 64)) (t!45442 List!31110)) )
))
(declare-fun arrayNoDuplicates!0 (array!90982 (_ BitVec 32) List!31110) Bool)

(assert (=> b!1339483 (= res!888580 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31107))))

(declare-fun b!1339484 () Bool)

(declare-fun e!762951 () Bool)

(declare-fun tp_is_empty!37063 () Bool)

(assert (=> b!1339484 (= e!762951 tp_is_empty!37063)))

(declare-fun res!888579 () Bool)

(assert (=> start!113012 (=> (not res!888579) (not e!762949))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113012 (= res!888579 (validMask!0 mask!1977))))

(assert (=> start!113012 e!762949))

(assert (=> start!113012 true))

(declare-fun array_inv!33137 (array!90982) Bool)

(assert (=> start!113012 (array_inv!33137 _keys!1571)))

(declare-datatypes ((V!54521 0))(
  ( (V!54522 (val!18606 Int)) )
))
(declare-datatypes ((ValueCell!17633 0))(
  ( (ValueCellFull!17633 (v!21254 V!54521)) (EmptyCell!17633) )
))
(declare-datatypes ((array!90984 0))(
  ( (array!90985 (arr!43948 (Array (_ BitVec 32) ValueCell!17633)) (size!44498 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90984)

(declare-fun e!762952 () Bool)

(declare-fun array_inv!33138 (array!90984) Bool)

(assert (=> start!113012 (and (array_inv!33138 _values!1303) e!762952)))

(declare-fun b!1339485 () Bool)

(declare-fun res!888581 () Bool)

(assert (=> b!1339485 (=> (not res!888581) (not e!762949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90982 (_ BitVec 32)) Bool)

(assert (=> b!1339485 (= res!888581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57301 () Bool)

(declare-fun mapRes!57301 () Bool)

(declare-fun tp!109000 () Bool)

(assert (=> mapNonEmpty!57301 (= mapRes!57301 (and tp!109000 e!762951))))

(declare-fun mapValue!57301 () ValueCell!17633)

(declare-fun mapKey!57301 () (_ BitVec 32))

(declare-fun mapRest!57301 () (Array (_ BitVec 32) ValueCell!17633))

(assert (=> mapNonEmpty!57301 (= (arr!43948 _values!1303) (store mapRest!57301 mapKey!57301 mapValue!57301))))

(declare-fun mapIsEmpty!57301 () Bool)

(assert (=> mapIsEmpty!57301 mapRes!57301))

(declare-fun b!1339486 () Bool)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1339486 (= e!762949 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44497 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!1960 (size!44497 _keys!1571))))))

(declare-fun b!1339487 () Bool)

(declare-fun e!762953 () Bool)

(assert (=> b!1339487 (= e!762952 (and e!762953 mapRes!57301))))

(declare-fun condMapEmpty!57301 () Bool)

(declare-fun mapDefault!57301 () ValueCell!17633)

