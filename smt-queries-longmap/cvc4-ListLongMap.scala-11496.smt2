; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133788 () Bool)

(assert start!133788)

(declare-fun mapIsEmpty!59670 () Bool)

(declare-fun mapRes!59670 () Bool)

(assert (=> mapIsEmpty!59670 mapRes!59670))

(declare-fun b!1564376 () Bool)

(declare-fun res!1069479 () Bool)

(declare-fun e!871912 () Bool)

(assert (=> b!1564376 (=> (not res!1069479) (not e!871912))))

(declare-datatypes ((array!104412 0))(
  ( (array!104413 (arr!50397 (Array (_ BitVec 32) (_ BitVec 64))) (size!50947 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104412)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104412 (_ BitVec 32)) Bool)

(assert (=> b!1564376 (= res!1069479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564377 () Bool)

(declare-fun e!871911 () Bool)

(declare-fun tp_is_empty!38861 () Bool)

(assert (=> b!1564377 (= e!871911 tp_is_empty!38861)))

(declare-fun b!1564378 () Bool)

(declare-fun res!1069482 () Bool)

(assert (=> b!1564378 (=> (not res!1069482) (not e!871912))))

(declare-datatypes ((List!36564 0))(
  ( (Nil!36561) (Cons!36560 (h!38006 (_ BitVec 64)) (t!51411 List!36564)) )
))
(declare-fun arrayNoDuplicates!0 (array!104412 (_ BitVec 32) List!36564) Bool)

(assert (=> b!1564378 (= res!1069482 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36561))))

(declare-fun mapNonEmpty!59670 () Bool)

(declare-fun tp!113595 () Bool)

(assert (=> mapNonEmpty!59670 (= mapRes!59670 (and tp!113595 e!871911))))

(declare-datatypes ((V!60021 0))(
  ( (V!60022 (val!19514 Int)) )
))
(declare-datatypes ((ValueCell!18400 0))(
  ( (ValueCellFull!18400 (v!22266 V!60021)) (EmptyCell!18400) )
))
(declare-fun mapValue!59670 () ValueCell!18400)

(declare-fun mapRest!59670 () (Array (_ BitVec 32) ValueCell!18400))

(declare-fun mapKey!59670 () (_ BitVec 32))

(declare-datatypes ((array!104414 0))(
  ( (array!104415 (arr!50398 (Array (_ BitVec 32) ValueCell!18400)) (size!50948 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104414)

(assert (=> mapNonEmpty!59670 (= (arr!50398 _values!487) (store mapRest!59670 mapKey!59670 mapValue!59670))))

(declare-fun b!1564379 () Bool)

(declare-fun res!1069477 () Bool)

(assert (=> b!1564379 (=> (not res!1069477) (not e!871912))))

(declare-datatypes ((tuple2!25176 0))(
  ( (tuple2!25177 (_1!12599 (_ BitVec 64)) (_2!12599 V!60021)) )
))
(declare-datatypes ((List!36565 0))(
  ( (Nil!36562) (Cons!36561 (h!38007 tuple2!25176) (t!51412 List!36565)) )
))
(declare-datatypes ((ListLongMap!22611 0))(
  ( (ListLongMap!22612 (toList!11321 List!36565)) )
))
(declare-fun contains!10312 (ListLongMap!22611 (_ BitVec 64)) Bool)

(assert (=> b!1564379 (= res!1069477 (not (contains!10312 (ListLongMap!22612 Nil!36562) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1069478 () Bool)

(assert (=> start!133788 (=> (not res!1069478) (not e!871912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133788 (= res!1069478 (validMask!0 mask!947))))

(assert (=> start!133788 e!871912))

(assert (=> start!133788 true))

(declare-fun array_inv!39167 (array!104412) Bool)

(assert (=> start!133788 (array_inv!39167 _keys!637)))

(declare-fun e!871914 () Bool)

(declare-fun array_inv!39168 (array!104414) Bool)

(assert (=> start!133788 (and (array_inv!39168 _values!487) e!871914)))

(declare-fun b!1564380 () Bool)

(declare-fun res!1069480 () Bool)

(assert (=> b!1564380 (=> (not res!1069480) (not e!871912))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564380 (= res!1069480 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50947 _keys!637)) (bvsge from!782 (size!50947 _keys!637))))))

(declare-fun b!1564381 () Bool)

(declare-fun e!871915 () Bool)

(assert (=> b!1564381 (= e!871915 tp_is_empty!38861)))

(declare-fun b!1564382 () Bool)

(declare-fun res!1069481 () Bool)

(assert (=> b!1564382 (=> (not res!1069481) (not e!871912))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564382 (= res!1069481 (and (= (size!50948 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50947 _keys!637) (size!50948 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564383 () Bool)

(assert (=> b!1564383 (= e!871912 false)))

(declare-fun lt!672033 () Bool)

(assert (=> b!1564383 (= lt!672033 (contains!10312 (ListLongMap!22612 Nil!36562) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564384 () Bool)

(assert (=> b!1564384 (= e!871914 (and e!871915 mapRes!59670))))

(declare-fun condMapEmpty!59670 () Bool)

(declare-fun mapDefault!59670 () ValueCell!18400)

