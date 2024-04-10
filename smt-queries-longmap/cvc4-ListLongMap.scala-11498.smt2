; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133800 () Bool)

(assert start!133800)

(declare-fun b!1564538 () Bool)

(declare-fun res!1069586 () Bool)

(declare-fun e!872005 () Bool)

(assert (=> b!1564538 (=> (not res!1069586) (not e!872005))))

(declare-datatypes ((V!60037 0))(
  ( (V!60038 (val!19520 Int)) )
))
(declare-datatypes ((tuple2!25188 0))(
  ( (tuple2!25189 (_1!12605 (_ BitVec 64)) (_2!12605 V!60037)) )
))
(declare-datatypes ((List!36574 0))(
  ( (Nil!36571) (Cons!36570 (h!38016 tuple2!25188) (t!51421 List!36574)) )
))
(declare-datatypes ((ListLongMap!22623 0))(
  ( (ListLongMap!22624 (toList!11327 List!36574)) )
))
(declare-fun contains!10318 (ListLongMap!22623 (_ BitVec 64)) Bool)

(assert (=> b!1564538 (= res!1069586 (not (contains!10318 (ListLongMap!22624 Nil!36571) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!59688 () Bool)

(declare-fun mapRes!59688 () Bool)

(declare-fun tp!113613 () Bool)

(declare-fun e!872003 () Bool)

(assert (=> mapNonEmpty!59688 (= mapRes!59688 (and tp!113613 e!872003))))

(declare-datatypes ((ValueCell!18406 0))(
  ( (ValueCellFull!18406 (v!22272 V!60037)) (EmptyCell!18406) )
))
(declare-fun mapValue!59688 () ValueCell!18406)

(declare-fun mapRest!59688 () (Array (_ BitVec 32) ValueCell!18406))

(declare-fun mapKey!59688 () (_ BitVec 32))

(declare-datatypes ((array!104436 0))(
  ( (array!104437 (arr!50409 (Array (_ BitVec 32) ValueCell!18406)) (size!50959 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104436)

(assert (=> mapNonEmpty!59688 (= (arr!50409 _values!487) (store mapRest!59688 mapKey!59688 mapValue!59688))))

(declare-fun res!1069587 () Bool)

(assert (=> start!133800 (=> (not res!1069587) (not e!872005))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133800 (= res!1069587 (validMask!0 mask!947))))

(assert (=> start!133800 e!872005))

(assert (=> start!133800 true))

(declare-datatypes ((array!104438 0))(
  ( (array!104439 (arr!50410 (Array (_ BitVec 32) (_ BitVec 64))) (size!50960 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104438)

(declare-fun array_inv!39177 (array!104438) Bool)

(assert (=> start!133800 (array_inv!39177 _keys!637)))

(declare-fun e!872002 () Bool)

(declare-fun array_inv!39178 (array!104436) Bool)

(assert (=> start!133800 (and (array_inv!39178 _values!487) e!872002)))

(declare-fun b!1564539 () Bool)

(declare-fun res!1069590 () Bool)

(assert (=> b!1564539 (=> (not res!1069590) (not e!872005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104438 (_ BitVec 32)) Bool)

(assert (=> b!1564539 (= res!1069590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564540 () Bool)

(declare-fun res!1069585 () Bool)

(assert (=> b!1564540 (=> (not res!1069585) (not e!872005))))

(declare-datatypes ((List!36575 0))(
  ( (Nil!36572) (Cons!36571 (h!38017 (_ BitVec 64)) (t!51422 List!36575)) )
))
(declare-fun arrayNoDuplicates!0 (array!104438 (_ BitVec 32) List!36575) Bool)

(assert (=> b!1564540 (= res!1069585 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36572))))

(declare-fun b!1564541 () Bool)

(declare-fun tp_is_empty!38873 () Bool)

(assert (=> b!1564541 (= e!872003 tp_is_empty!38873)))

(declare-fun mapIsEmpty!59688 () Bool)

(assert (=> mapIsEmpty!59688 mapRes!59688))

(declare-fun b!1564542 () Bool)

(declare-fun e!872001 () Bool)

(assert (=> b!1564542 (= e!872001 tp_is_empty!38873)))

(declare-fun b!1564543 () Bool)

(assert (=> b!1564543 (= e!872005 false)))

(declare-fun lt!672051 () Bool)

(assert (=> b!1564543 (= lt!672051 (contains!10318 (ListLongMap!22624 Nil!36571) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564544 () Bool)

(declare-fun res!1069589 () Bool)

(assert (=> b!1564544 (=> (not res!1069589) (not e!872005))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564544 (= res!1069589 (and (= (size!50959 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50960 _keys!637) (size!50959 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564545 () Bool)

(declare-fun res!1069588 () Bool)

(assert (=> b!1564545 (=> (not res!1069588) (not e!872005))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564545 (= res!1069588 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50960 _keys!637)) (bvsge from!782 (size!50960 _keys!637))))))

(declare-fun b!1564546 () Bool)

(assert (=> b!1564546 (= e!872002 (and e!872001 mapRes!59688))))

(declare-fun condMapEmpty!59688 () Bool)

(declare-fun mapDefault!59688 () ValueCell!18406)

