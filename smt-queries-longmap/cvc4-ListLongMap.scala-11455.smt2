; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133532 () Bool)

(assert start!133532)

(declare-fun b_free!31949 () Bool)

(declare-fun b_next!31949 () Bool)

(assert (=> start!133532 (= b_free!31949 (not b_next!31949))))

(declare-fun tp!112970 () Bool)

(declare-fun b_and!51409 () Bool)

(assert (=> start!133532 (= tp!112970 b_and!51409)))

(declare-fun mapIsEmpty!59298 () Bool)

(declare-fun mapRes!59298 () Bool)

(assert (=> mapIsEmpty!59298 mapRes!59298))

(declare-fun b!1561036 () Bool)

(declare-fun res!1067374 () Bool)

(declare-fun e!869944 () Bool)

(assert (=> b!1561036 (=> (not res!1067374) (not e!869944))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103948 0))(
  ( (array!103949 (arr!50166 (Array (_ BitVec 32) (_ BitVec 64))) (size!50716 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103948)

(assert (=> b!1561036 (= res!1067374 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50716 _keys!637)) (bvslt from!782 (size!50716 _keys!637))))))

(declare-fun b!1561037 () Bool)

(declare-fun res!1067375 () Bool)

(assert (=> b!1561037 (=> (not res!1067375) (not e!869944))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59693 0))(
  ( (V!59694 (val!19391 Int)) )
))
(declare-datatypes ((ValueCell!18277 0))(
  ( (ValueCellFull!18277 (v!22143 V!59693)) (EmptyCell!18277) )
))
(declare-datatypes ((array!103950 0))(
  ( (array!103951 (arr!50167 (Array (_ BitVec 32) ValueCell!18277)) (size!50717 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103950)

(assert (=> b!1561037 (= res!1067375 (and (= (size!50717 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50716 _keys!637) (size!50717 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59298 () Bool)

(declare-fun tp!112971 () Bool)

(declare-fun e!869941 () Bool)

(assert (=> mapNonEmpty!59298 (= mapRes!59298 (and tp!112971 e!869941))))

(declare-fun mapKey!59298 () (_ BitVec 32))

(declare-fun mapValue!59298 () ValueCell!18277)

(declare-fun mapRest!59298 () (Array (_ BitVec 32) ValueCell!18277))

(assert (=> mapNonEmpty!59298 (= (arr!50167 _values!487) (store mapRest!59298 mapKey!59298 mapValue!59298))))

(declare-fun b!1561039 () Bool)

(declare-fun e!869943 () Bool)

(declare-fun e!869942 () Bool)

(assert (=> b!1561039 (= e!869943 (and e!869942 mapRes!59298))))

(declare-fun condMapEmpty!59298 () Bool)

(declare-fun mapDefault!59298 () ValueCell!18277)

