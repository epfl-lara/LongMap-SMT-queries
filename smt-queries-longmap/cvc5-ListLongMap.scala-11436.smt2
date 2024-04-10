; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133414 () Bool)

(assert start!133414)

(declare-fun b!1559655 () Bool)

(declare-fun res!1066532 () Bool)

(declare-fun e!869057 () Bool)

(assert (=> b!1559655 (=> (not res!1066532) (not e!869057))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103720 0))(
  ( (array!103721 (arr!50052 (Array (_ BitVec 32) (_ BitVec 64))) (size!50602 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103720)

(assert (=> b!1559655 (= res!1066532 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50602 _keys!637)) (bvsge from!782 (size!50602 _keys!637))))))

(declare-fun b!1559656 () Bool)

(declare-fun res!1066531 () Bool)

(assert (=> b!1559656 (=> (not res!1066531) (not e!869057))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59537 0))(
  ( (V!59538 (val!19332 Int)) )
))
(declare-datatypes ((ValueCell!18218 0))(
  ( (ValueCellFull!18218 (v!22084 V!59537)) (EmptyCell!18218) )
))
(declare-datatypes ((array!103722 0))(
  ( (array!103723 (arr!50053 (Array (_ BitVec 32) ValueCell!18218)) (size!50603 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103722)

(assert (=> b!1559656 (= res!1066531 (and (= (size!50603 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50602 _keys!637) (size!50603 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559657 () Bool)

(declare-fun e!869055 () Bool)

(declare-fun tp_is_empty!38497 () Bool)

(assert (=> b!1559657 (= e!869055 tp_is_empty!38497)))

(declare-fun b!1559658 () Bool)

(declare-fun e!869058 () Bool)

(assert (=> b!1559658 (= e!869058 tp_is_empty!38497)))

(declare-fun mapIsEmpty!59121 () Bool)

(declare-fun mapRes!59121 () Bool)

(assert (=> mapIsEmpty!59121 mapRes!59121))

(declare-fun b!1559659 () Bool)

(assert (=> b!1559659 (= e!869057 false)))

(declare-fun lt!670902 () Bool)

(declare-datatypes ((tuple2!25004 0))(
  ( (tuple2!25005 (_1!12513 (_ BitVec 64)) (_2!12513 V!59537)) )
))
(declare-datatypes ((List!36355 0))(
  ( (Nil!36352) (Cons!36351 (h!37797 tuple2!25004) (t!51088 List!36355)) )
))
(declare-datatypes ((ListLongMap!22439 0))(
  ( (ListLongMap!22440 (toList!11235 List!36355)) )
))
(declare-fun contains!10225 (ListLongMap!22439 (_ BitVec 64)) Bool)

(assert (=> b!1559659 (= lt!670902 (contains!10225 (ListLongMap!22440 Nil!36352) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559660 () Bool)

(declare-fun res!1066529 () Bool)

(assert (=> b!1559660 (=> (not res!1066529) (not e!869057))))

(declare-datatypes ((List!36356 0))(
  ( (Nil!36353) (Cons!36352 (h!37798 (_ BitVec 64)) (t!51089 List!36356)) )
))
(declare-fun arrayNoDuplicates!0 (array!103720 (_ BitVec 32) List!36356) Bool)

(assert (=> b!1559660 (= res!1066529 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36353))))

(declare-fun b!1559661 () Bool)

(declare-fun res!1066528 () Bool)

(assert (=> b!1559661 (=> (not res!1066528) (not e!869057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103720 (_ BitVec 32)) Bool)

(assert (=> b!1559661 (= res!1066528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559662 () Bool)

(declare-fun e!869056 () Bool)

(assert (=> b!1559662 (= e!869056 (and e!869055 mapRes!59121))))

(declare-fun condMapEmpty!59121 () Bool)

(declare-fun mapDefault!59121 () ValueCell!18218)

