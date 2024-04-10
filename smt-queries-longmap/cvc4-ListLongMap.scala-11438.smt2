; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133430 () Bool)

(assert start!133430)

(declare-fun b!1559871 () Bool)

(declare-fun res!1066676 () Bool)

(declare-fun e!869175 () Bool)

(assert (=> b!1559871 (=> (not res!1066676) (not e!869175))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103752 0))(
  ( (array!103753 (arr!50068 (Array (_ BitVec 32) (_ BitVec 64))) (size!50618 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103752)

(declare-datatypes ((V!59557 0))(
  ( (V!59558 (val!19340 Int)) )
))
(declare-datatypes ((ValueCell!18226 0))(
  ( (ValueCellFull!18226 (v!22092 V!59557)) (EmptyCell!18226) )
))
(declare-datatypes ((array!103754 0))(
  ( (array!103755 (arr!50069 (Array (_ BitVec 32) ValueCell!18226)) (size!50619 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103754)

(assert (=> b!1559871 (= res!1066676 (and (= (size!50619 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50618 _keys!637) (size!50619 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559872 () Bool)

(declare-fun e!869176 () Bool)

(declare-fun tp_is_empty!38513 () Bool)

(assert (=> b!1559872 (= e!869176 tp_is_empty!38513)))

(declare-fun b!1559873 () Bool)

(declare-fun res!1066672 () Bool)

(assert (=> b!1559873 (=> (not res!1066672) (not e!869175))))

(declare-datatypes ((tuple2!25014 0))(
  ( (tuple2!25015 (_1!12518 (_ BitVec 64)) (_2!12518 V!59557)) )
))
(declare-datatypes ((List!36367 0))(
  ( (Nil!36364) (Cons!36363 (h!37809 tuple2!25014) (t!51100 List!36367)) )
))
(declare-datatypes ((ListLongMap!22449 0))(
  ( (ListLongMap!22450 (toList!11240 List!36367)) )
))
(declare-fun contains!10230 (ListLongMap!22449 (_ BitVec 64)) Bool)

(assert (=> b!1559873 (= res!1066672 (not (contains!10230 (ListLongMap!22450 Nil!36364) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559874 () Bool)

(declare-fun res!1066673 () Bool)

(assert (=> b!1559874 (=> (not res!1066673) (not e!869175))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559874 (= res!1066673 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50618 _keys!637)) (bvsge from!782 (size!50618 _keys!637))))))

(declare-fun mapNonEmpty!59145 () Bool)

(declare-fun mapRes!59145 () Bool)

(declare-fun tp!112800 () Bool)

(assert (=> mapNonEmpty!59145 (= mapRes!59145 (and tp!112800 e!869176))))

(declare-fun mapRest!59145 () (Array (_ BitVec 32) ValueCell!18226))

(declare-fun mapKey!59145 () (_ BitVec 32))

(declare-fun mapValue!59145 () ValueCell!18226)

(assert (=> mapNonEmpty!59145 (= (arr!50069 _values!487) (store mapRest!59145 mapKey!59145 mapValue!59145))))

(declare-fun b!1559875 () Bool)

(assert (=> b!1559875 (= e!869175 false)))

(declare-fun lt!670926 () Bool)

(assert (=> b!1559875 (= lt!670926 (contains!10230 (ListLongMap!22450 Nil!36364) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559876 () Bool)

(declare-fun e!869179 () Bool)

(assert (=> b!1559876 (= e!869179 tp_is_empty!38513)))

(declare-fun b!1559878 () Bool)

(declare-fun res!1066674 () Bool)

(assert (=> b!1559878 (=> (not res!1066674) (not e!869175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103752 (_ BitVec 32)) Bool)

(assert (=> b!1559878 (= res!1066674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559879 () Bool)

(declare-fun res!1066675 () Bool)

(assert (=> b!1559879 (=> (not res!1066675) (not e!869175))))

(declare-datatypes ((List!36368 0))(
  ( (Nil!36365) (Cons!36364 (h!37810 (_ BitVec 64)) (t!51101 List!36368)) )
))
(declare-fun arrayNoDuplicates!0 (array!103752 (_ BitVec 32) List!36368) Bool)

(assert (=> b!1559879 (= res!1066675 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36365))))

(declare-fun mapIsEmpty!59145 () Bool)

(assert (=> mapIsEmpty!59145 mapRes!59145))

(declare-fun res!1066677 () Bool)

(assert (=> start!133430 (=> (not res!1066677) (not e!869175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133430 (= res!1066677 (validMask!0 mask!947))))

(assert (=> start!133430 e!869175))

(assert (=> start!133430 true))

(declare-fun array_inv!38919 (array!103752) Bool)

(assert (=> start!133430 (array_inv!38919 _keys!637)))

(declare-fun e!869178 () Bool)

(declare-fun array_inv!38920 (array!103754) Bool)

(assert (=> start!133430 (and (array_inv!38920 _values!487) e!869178)))

(declare-fun b!1559877 () Bool)

(assert (=> b!1559877 (= e!869178 (and e!869179 mapRes!59145))))

(declare-fun condMapEmpty!59145 () Bool)

(declare-fun mapDefault!59145 () ValueCell!18226)

