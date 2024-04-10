; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133742 () Bool)

(assert start!133742)

(declare-fun b_free!32105 () Bool)

(declare-fun b_next!32105 () Bool)

(assert (=> start!133742 (= b_free!32105 (not b_next!32105))))

(declare-fun tp!113520 () Bool)

(declare-fun b_and!51675 () Bool)

(assert (=> start!133742 (= tp!113520 b_and!51675)))

(declare-fun b!1563845 () Bool)

(declare-fun e!871597 () Bool)

(assert (=> b!1563845 (= e!871597 false)))

(declare-fun lt!671970 () Bool)

(declare-datatypes ((V!59973 0))(
  ( (V!59974 (val!19496 Int)) )
))
(declare-datatypes ((tuple2!25152 0))(
  ( (tuple2!25153 (_1!12587 (_ BitVec 64)) (_2!12587 V!59973)) )
))
(declare-datatypes ((List!36538 0))(
  ( (Nil!36535) (Cons!36534 (h!37980 tuple2!25152) (t!51385 List!36538)) )
))
(declare-datatypes ((ListLongMap!22587 0))(
  ( (ListLongMap!22588 (toList!11309 List!36538)) )
))
(declare-fun lt!671969 () ListLongMap!22587)

(declare-fun contains!10299 (ListLongMap!22587 (_ BitVec 64)) Bool)

(assert (=> b!1563845 (= lt!671970 (contains!10299 lt!671969 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1069133 () Bool)

(declare-fun e!871600 () Bool)

(assert (=> start!133742 (=> (not res!1069133) (not e!871600))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133742 (= res!1069133 (validMask!0 mask!947))))

(assert (=> start!133742 e!871600))

(assert (=> start!133742 tp!113520))

(declare-fun tp_is_empty!38825 () Bool)

(assert (=> start!133742 tp_is_empty!38825))

(assert (=> start!133742 true))

(declare-datatypes ((array!104342 0))(
  ( (array!104343 (arr!50363 (Array (_ BitVec 32) (_ BitVec 64))) (size!50913 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104342)

(declare-fun array_inv!39137 (array!104342) Bool)

(assert (=> start!133742 (array_inv!39137 _keys!637)))

(declare-datatypes ((ValueCell!18382 0))(
  ( (ValueCellFull!18382 (v!22248 V!59973)) (EmptyCell!18382) )
))
(declare-datatypes ((array!104344 0))(
  ( (array!104345 (arr!50364 (Array (_ BitVec 32) ValueCell!18382)) (size!50914 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104344)

(declare-fun e!871598 () Bool)

(declare-fun array_inv!39138 (array!104344) Bool)

(assert (=> start!133742 (and (array_inv!39138 _values!487) e!871598)))

(declare-fun b!1563846 () Bool)

(declare-fun res!1069129 () Bool)

(assert (=> b!1563846 (=> (not res!1069129) (not e!871600))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1563846 (= res!1069129 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50913 _keys!637)) (bvslt from!782 (size!50913 _keys!637))))))

(declare-fun b!1563847 () Bool)

(declare-fun res!1069132 () Bool)

(assert (=> b!1563847 (=> (not res!1069132) (not e!871600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104342 (_ BitVec 32)) Bool)

(assert (=> b!1563847 (= res!1069132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563848 () Bool)

(declare-fun res!1069131 () Bool)

(assert (=> b!1563848 (=> (not res!1069131) (not e!871600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563848 (= res!1069131 (not (validKeyInArray!0 (select (arr!50363 _keys!637) from!782))))))

(declare-fun mapIsEmpty!59613 () Bool)

(declare-fun mapRes!59613 () Bool)

(assert (=> mapIsEmpty!59613 mapRes!59613))

(declare-fun b!1563849 () Bool)

(declare-fun e!871599 () Bool)

(assert (=> b!1563849 (= e!871599 tp_is_empty!38825)))

(declare-fun b!1563850 () Bool)

(declare-fun e!871596 () Bool)

(assert (=> b!1563850 (= e!871596 tp_is_empty!38825)))

(declare-fun mapNonEmpty!59613 () Bool)

(declare-fun tp!113519 () Bool)

(assert (=> mapNonEmpty!59613 (= mapRes!59613 (and tp!113519 e!871596))))

(declare-fun mapRest!59613 () (Array (_ BitVec 32) ValueCell!18382))

(declare-fun mapKey!59613 () (_ BitVec 32))

(declare-fun mapValue!59613 () ValueCell!18382)

(assert (=> mapNonEmpty!59613 (= (arr!50364 _values!487) (store mapRest!59613 mapKey!59613 mapValue!59613))))

(declare-fun b!1563851 () Bool)

(assert (=> b!1563851 (= e!871600 e!871597)))

(declare-fun res!1069130 () Bool)

(assert (=> b!1563851 (=> (not res!1069130) (not e!871597))))

(assert (=> b!1563851 (= res!1069130 (not (contains!10299 lt!671969 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59973)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59973)

(declare-fun getCurrentListMapNoExtraKeys!6692 (array!104342 array!104344 (_ BitVec 32) (_ BitVec 32) V!59973 V!59973 (_ BitVec 32) Int) ListLongMap!22587)

(assert (=> b!1563851 (= lt!671969 (getCurrentListMapNoExtraKeys!6692 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563852 () Bool)

(declare-fun res!1069128 () Bool)

(assert (=> b!1563852 (=> (not res!1069128) (not e!871600))))

(assert (=> b!1563852 (= res!1069128 (and (= (size!50914 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50913 _keys!637) (size!50914 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563853 () Bool)

(declare-fun res!1069134 () Bool)

(assert (=> b!1563853 (=> (not res!1069134) (not e!871600))))

(declare-datatypes ((List!36539 0))(
  ( (Nil!36536) (Cons!36535 (h!37981 (_ BitVec 64)) (t!51386 List!36539)) )
))
(declare-fun arrayNoDuplicates!0 (array!104342 (_ BitVec 32) List!36539) Bool)

(assert (=> b!1563853 (= res!1069134 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36536))))

(declare-fun b!1563854 () Bool)

(assert (=> b!1563854 (= e!871598 (and e!871599 mapRes!59613))))

(declare-fun condMapEmpty!59613 () Bool)

(declare-fun mapDefault!59613 () ValueCell!18382)

