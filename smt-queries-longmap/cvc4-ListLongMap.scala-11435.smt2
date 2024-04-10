; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133412 () Bool)

(assert start!133412)

(declare-fun b!1559628 () Bool)

(declare-fun res!1066511 () Bool)

(declare-fun e!869040 () Bool)

(assert (=> b!1559628 (=> (not res!1066511) (not e!869040))))

(declare-datatypes ((V!59533 0))(
  ( (V!59534 (val!19331 Int)) )
))
(declare-datatypes ((tuple2!25002 0))(
  ( (tuple2!25003 (_1!12512 (_ BitVec 64)) (_2!12512 V!59533)) )
))
(declare-datatypes ((List!36353 0))(
  ( (Nil!36350) (Cons!36349 (h!37795 tuple2!25002) (t!51086 List!36353)) )
))
(declare-datatypes ((ListLongMap!22437 0))(
  ( (ListLongMap!22438 (toList!11234 List!36353)) )
))
(declare-fun contains!10224 (ListLongMap!22437 (_ BitVec 64)) Bool)

(assert (=> b!1559628 (= res!1066511 (not (contains!10224 (ListLongMap!22438 Nil!36350) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559629 () Bool)

(declare-fun res!1066514 () Bool)

(assert (=> b!1559629 (=> (not res!1066514) (not e!869040))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103716 0))(
  ( (array!103717 (arr!50050 (Array (_ BitVec 32) (_ BitVec 64))) (size!50600 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103716)

(declare-datatypes ((ValueCell!18217 0))(
  ( (ValueCellFull!18217 (v!22083 V!59533)) (EmptyCell!18217) )
))
(declare-datatypes ((array!103718 0))(
  ( (array!103719 (arr!50051 (Array (_ BitVec 32) ValueCell!18217)) (size!50601 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103718)

(assert (=> b!1559629 (= res!1066514 (and (= (size!50601 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50600 _keys!637) (size!50601 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559630 () Bool)

(declare-fun res!1066512 () Bool)

(assert (=> b!1559630 (=> (not res!1066512) (not e!869040))))

(declare-datatypes ((List!36354 0))(
  ( (Nil!36351) (Cons!36350 (h!37796 (_ BitVec 64)) (t!51087 List!36354)) )
))
(declare-fun arrayNoDuplicates!0 (array!103716 (_ BitVec 32) List!36354) Bool)

(assert (=> b!1559630 (= res!1066512 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36351))))

(declare-fun b!1559631 () Bool)

(declare-fun e!869043 () Bool)

(declare-fun tp_is_empty!38495 () Bool)

(assert (=> b!1559631 (= e!869043 tp_is_empty!38495)))

(declare-fun mapNonEmpty!59118 () Bool)

(declare-fun mapRes!59118 () Bool)

(declare-fun tp!112773 () Bool)

(declare-fun e!869044 () Bool)

(assert (=> mapNonEmpty!59118 (= mapRes!59118 (and tp!112773 e!869044))))

(declare-fun mapRest!59118 () (Array (_ BitVec 32) ValueCell!18217))

(declare-fun mapKey!59118 () (_ BitVec 32))

(declare-fun mapValue!59118 () ValueCell!18217)

(assert (=> mapNonEmpty!59118 (= (arr!50051 _values!487) (store mapRest!59118 mapKey!59118 mapValue!59118))))

(declare-fun res!1066515 () Bool)

(assert (=> start!133412 (=> (not res!1066515) (not e!869040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133412 (= res!1066515 (validMask!0 mask!947))))

(assert (=> start!133412 e!869040))

(assert (=> start!133412 true))

(declare-fun array_inv!38907 (array!103716) Bool)

(assert (=> start!133412 (array_inv!38907 _keys!637)))

(declare-fun e!869041 () Bool)

(declare-fun array_inv!38908 (array!103718) Bool)

(assert (=> start!133412 (and (array_inv!38908 _values!487) e!869041)))

(declare-fun b!1559632 () Bool)

(assert (=> b!1559632 (= e!869041 (and e!869043 mapRes!59118))))

(declare-fun condMapEmpty!59118 () Bool)

(declare-fun mapDefault!59118 () ValueCell!18217)

