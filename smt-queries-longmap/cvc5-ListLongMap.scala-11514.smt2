; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134046 () Bool)

(assert start!134046)

(declare-fun mapIsEmpty!59844 () Bool)

(declare-fun mapRes!59844 () Bool)

(assert (=> mapIsEmpty!59844 mapRes!59844))

(declare-fun b!1566705 () Bool)

(declare-fun e!873296 () Bool)

(declare-fun tp_is_empty!38965 () Bool)

(assert (=> b!1566705 (= e!873296 tp_is_empty!38965)))

(declare-fun b!1566706 () Bool)

(declare-fun e!873297 () Bool)

(assert (=> b!1566706 (= e!873297 tp_is_empty!38965)))

(declare-fun mapNonEmpty!59844 () Bool)

(declare-fun tp!113877 () Bool)

(assert (=> mapNonEmpty!59844 (= mapRes!59844 (and tp!113877 e!873296))))

(declare-datatypes ((V!60161 0))(
  ( (V!60162 (val!19566 Int)) )
))
(declare-datatypes ((ValueCell!18452 0))(
  ( (ValueCellFull!18452 (v!22325 V!60161)) (EmptyCell!18452) )
))
(declare-fun mapRest!59844 () (Array (_ BitVec 32) ValueCell!18452))

(declare-datatypes ((array!104618 0))(
  ( (array!104619 (arr!50495 (Array (_ BitVec 32) ValueCell!18452)) (size!51045 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104618)

(declare-fun mapKey!59844 () (_ BitVec 32))

(declare-fun mapValue!59844 () ValueCell!18452)

(assert (=> mapNonEmpty!59844 (= (arr!50495 _values!487) (store mapRest!59844 mapKey!59844 mapValue!59844))))

(declare-fun b!1566707 () Bool)

(declare-fun e!873295 () Bool)

(declare-datatypes ((array!104620 0))(
  ( (array!104621 (arr!50496 (Array (_ BitVec 32) (_ BitVec 64))) (size!51046 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104620)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1566707 (= e!873295 (bvsge (bvsub (size!51046 _keys!637) from!782) (bvsub (bvadd #b00000000000000000000000000000001 (size!51046 _keys!637)) from!782)))))

(declare-fun b!1566708 () Bool)

(declare-fun res!1070782 () Bool)

(assert (=> b!1566708 (=> (not res!1070782) (not e!873295))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104620 (_ BitVec 32)) Bool)

(assert (=> b!1566708 (= res!1070782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566709 () Bool)

(declare-fun res!1070781 () Bool)

(assert (=> b!1566709 (=> (not res!1070781) (not e!873295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566709 (= res!1070781 (not (validKeyInArray!0 (select (arr!50496 _keys!637) from!782))))))

(declare-fun res!1070783 () Bool)

(assert (=> start!134046 (=> (not res!1070783) (not e!873295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134046 (= res!1070783 (validMask!0 mask!947))))

(assert (=> start!134046 e!873295))

(assert (=> start!134046 true))

(declare-fun array_inv!39233 (array!104620) Bool)

(assert (=> start!134046 (array_inv!39233 _keys!637)))

(declare-fun e!873298 () Bool)

(declare-fun array_inv!39234 (array!104618) Bool)

(assert (=> start!134046 (and (array_inv!39234 _values!487) e!873298)))

(declare-fun b!1566710 () Bool)

(declare-fun res!1070780 () Bool)

(assert (=> b!1566710 (=> (not res!1070780) (not e!873295))))

(assert (=> b!1566710 (= res!1070780 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51046 _keys!637)) (bvslt from!782 (size!51046 _keys!637))))))

(declare-fun b!1566711 () Bool)

(declare-fun res!1070784 () Bool)

(assert (=> b!1566711 (=> (not res!1070784) (not e!873295))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566711 (= res!1070784 (and (= (size!51045 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51046 _keys!637) (size!51045 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566712 () Bool)

(assert (=> b!1566712 (= e!873298 (and e!873297 mapRes!59844))))

(declare-fun condMapEmpty!59844 () Bool)

(declare-fun mapDefault!59844 () ValueCell!18452)

