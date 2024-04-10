; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133840 () Bool)

(assert start!133840)

(declare-fun b!1564801 () Bool)

(declare-fun res!1069737 () Bool)

(declare-fun e!872185 () Bool)

(assert (=> b!1564801 (=> (not res!1069737) (not e!872185))))

(declare-datatypes ((array!104462 0))(
  ( (array!104463 (arr!50421 (Array (_ BitVec 32) (_ BitVec 64))) (size!50971 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104462)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104462 (_ BitVec 32)) Bool)

(assert (=> b!1564801 (= res!1069737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564803 () Bool)

(declare-fun res!1069735 () Bool)

(assert (=> b!1564803 (=> (not res!1069735) (not e!872185))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564803 (= res!1069735 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50971 _keys!637)) (bvslt from!782 (size!50971 _keys!637))))))

(declare-fun b!1564804 () Bool)

(declare-fun e!872187 () Bool)

(declare-fun tp_is_empty!38887 () Bool)

(assert (=> b!1564804 (= e!872187 tp_is_empty!38887)))

(declare-fun b!1564805 () Bool)

(declare-fun res!1069733 () Bool)

(assert (=> b!1564805 (=> (not res!1069733) (not e!872185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564805 (= res!1069733 (validKeyInArray!0 (select (arr!50421 _keys!637) from!782)))))

(declare-fun b!1564806 () Bool)

(declare-fun e!872184 () Bool)

(assert (=> b!1564806 (= e!872184 tp_is_empty!38887)))

(declare-fun b!1564807 () Bool)

(declare-fun res!1069738 () Bool)

(assert (=> b!1564807 (=> (not res!1069738) (not e!872185))))

(declare-datatypes ((List!36582 0))(
  ( (Nil!36579) (Cons!36578 (h!38024 (_ BitVec 64)) (t!51429 List!36582)) )
))
(declare-fun arrayNoDuplicates!0 (array!104462 (_ BitVec 32) List!36582) Bool)

(assert (=> b!1564807 (= res!1069738 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36579))))

(declare-fun mapNonEmpty!59713 () Bool)

(declare-fun mapRes!59713 () Bool)

(declare-fun tp!113638 () Bool)

(assert (=> mapNonEmpty!59713 (= mapRes!59713 (and tp!113638 e!872187))))

(declare-datatypes ((V!60057 0))(
  ( (V!60058 (val!19527 Int)) )
))
(declare-datatypes ((ValueCell!18413 0))(
  ( (ValueCellFull!18413 (v!22281 V!60057)) (EmptyCell!18413) )
))
(declare-fun mapValue!59713 () ValueCell!18413)

(declare-fun mapKey!59713 () (_ BitVec 32))

(declare-fun mapRest!59713 () (Array (_ BitVec 32) ValueCell!18413))

(declare-datatypes ((array!104464 0))(
  ( (array!104465 (arr!50422 (Array (_ BitVec 32) ValueCell!18413)) (size!50972 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104464)

(assert (=> mapNonEmpty!59713 (= (arr!50422 _values!487) (store mapRest!59713 mapKey!59713 mapValue!59713))))

(declare-fun b!1564808 () Bool)

(declare-fun e!872186 () Bool)

(assert (=> b!1564808 (= e!872186 (and e!872184 mapRes!59713))))

(declare-fun condMapEmpty!59713 () Bool)

(declare-fun mapDefault!59713 () ValueCell!18413)

