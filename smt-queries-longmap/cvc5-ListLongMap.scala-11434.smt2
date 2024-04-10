; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133390 () Bool)

(assert start!133390)

(declare-fun b!1559459 () Bool)

(declare-fun e!868930 () Bool)

(declare-fun e!868933 () Bool)

(assert (=> b!1559459 (= e!868930 e!868933)))

(declare-fun res!1066402 () Bool)

(assert (=> b!1559459 (=> res!1066402 e!868933)))

(declare-datatypes ((List!36346 0))(
  ( (Nil!36343) (Cons!36342 (h!37788 (_ BitVec 64)) (t!51079 List!36346)) )
))
(declare-fun contains!10219 (List!36346 (_ BitVec 64)) Bool)

(assert (=> b!1559459 (= res!1066402 (contains!10219 Nil!36343 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559460 () Bool)

(declare-fun res!1066403 () Bool)

(assert (=> b!1559460 (=> (not res!1066403) (not e!868930))))

(declare-datatypes ((array!103694 0))(
  ( (array!103695 (arr!50040 (Array (_ BitVec 32) (_ BitVec 64))) (size!50590 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103694)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103694 (_ BitVec 32)) Bool)

(assert (=> b!1559460 (= res!1066403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59100 () Bool)

(declare-fun mapRes!59100 () Bool)

(assert (=> mapIsEmpty!59100 mapRes!59100))

(declare-fun b!1559462 () Bool)

(declare-fun e!868929 () Bool)

(declare-fun tp_is_empty!38485 () Bool)

(assert (=> b!1559462 (= e!868929 tp_is_empty!38485)))

(declare-fun b!1559463 () Bool)

(assert (=> b!1559463 (= e!868933 (contains!10219 Nil!36343 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559464 () Bool)

(declare-fun res!1066400 () Bool)

(assert (=> b!1559464 (=> (not res!1066400) (not e!868930))))

(assert (=> b!1559464 (= res!1066400 (and (bvsle #b00000000000000000000000000000000 (size!50590 _keys!637)) (bvslt (size!50590 _keys!637) #b01111111111111111111111111111111)))))

(declare-fun b!1559465 () Bool)

(declare-fun e!868932 () Bool)

(assert (=> b!1559465 (= e!868932 tp_is_empty!38485)))

(declare-fun mapNonEmpty!59100 () Bool)

(declare-fun tp!112755 () Bool)

(assert (=> mapNonEmpty!59100 (= mapRes!59100 (and tp!112755 e!868932))))

(declare-datatypes ((V!59521 0))(
  ( (V!59522 (val!19326 Int)) )
))
(declare-datatypes ((ValueCell!18212 0))(
  ( (ValueCellFull!18212 (v!22077 V!59521)) (EmptyCell!18212) )
))
(declare-fun mapValue!59100 () ValueCell!18212)

(declare-datatypes ((array!103696 0))(
  ( (array!103697 (arr!50041 (Array (_ BitVec 32) ValueCell!18212)) (size!50591 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103696)

(declare-fun mapRest!59100 () (Array (_ BitVec 32) ValueCell!18212))

(declare-fun mapKey!59100 () (_ BitVec 32))

(assert (=> mapNonEmpty!59100 (= (arr!50041 _values!487) (store mapRest!59100 mapKey!59100 mapValue!59100))))

(declare-fun b!1559461 () Bool)

(declare-fun e!868934 () Bool)

(assert (=> b!1559461 (= e!868934 (and e!868929 mapRes!59100))))

(declare-fun condMapEmpty!59100 () Bool)

(declare-fun mapDefault!59100 () ValueCell!18212)

