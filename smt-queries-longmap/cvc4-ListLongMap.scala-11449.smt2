; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133496 () Bool)

(assert start!133496)

(declare-fun mapIsEmpty!59244 () Bool)

(declare-fun mapRes!59244 () Bool)

(assert (=> mapIsEmpty!59244 mapRes!59244))

(declare-fun b!1560631 () Bool)

(declare-fun e!869671 () Bool)

(declare-fun tp_is_empty!38579 () Bool)

(assert (=> b!1560631 (= e!869671 tp_is_empty!38579)))

(declare-fun mapNonEmpty!59244 () Bool)

(declare-fun tp!112899 () Bool)

(declare-fun e!869670 () Bool)

(assert (=> mapNonEmpty!59244 (= mapRes!59244 (and tp!112899 e!869670))))

(declare-datatypes ((V!59645 0))(
  ( (V!59646 (val!19373 Int)) )
))
(declare-datatypes ((ValueCell!18259 0))(
  ( (ValueCellFull!18259 (v!22125 V!59645)) (EmptyCell!18259) )
))
(declare-fun mapRest!59244 () (Array (_ BitVec 32) ValueCell!18259))

(declare-fun mapKey!59244 () (_ BitVec 32))

(declare-datatypes ((array!103880 0))(
  ( (array!103881 (arr!50132 (Array (_ BitVec 32) ValueCell!18259)) (size!50682 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103880)

(declare-fun mapValue!59244 () ValueCell!18259)

(assert (=> mapNonEmpty!59244 (= (arr!50132 _values!487) (store mapRest!59244 mapKey!59244 mapValue!59244))))

(declare-fun b!1560632 () Bool)

(assert (=> b!1560632 (= e!869670 tp_is_empty!38579)))

(declare-fun b!1560633 () Bool)

(declare-fun res!1067134 () Bool)

(declare-fun e!869674 () Bool)

(assert (=> b!1560633 (=> (not res!1067134) (not e!869674))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103882 0))(
  ( (array!103883 (arr!50133 (Array (_ BitVec 32) (_ BitVec 64))) (size!50683 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103882)

(assert (=> b!1560633 (= res!1067134 (and (= (size!50682 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50683 _keys!637) (size!50682 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560630 () Bool)

(declare-fun res!1067135 () Bool)

(assert (=> b!1560630 (=> (not res!1067135) (not e!869674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103882 (_ BitVec 32)) Bool)

(assert (=> b!1560630 (= res!1067135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1067136 () Bool)

(assert (=> start!133496 (=> (not res!1067136) (not e!869674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133496 (= res!1067136 (validMask!0 mask!947))))

(assert (=> start!133496 e!869674))

(assert (=> start!133496 true))

(declare-fun e!869672 () Bool)

(declare-fun array_inv!38971 (array!103880) Bool)

(assert (=> start!133496 (and (array_inv!38971 _values!487) e!869672)))

(declare-fun array_inv!38972 (array!103882) Bool)

(assert (=> start!133496 (array_inv!38972 _keys!637)))

(declare-fun b!1560634 () Bool)

(assert (=> b!1560634 (= e!869674 false)))

(declare-fun lt!671025 () Bool)

(declare-datatypes ((List!36404 0))(
  ( (Nil!36401) (Cons!36400 (h!37846 (_ BitVec 64)) (t!51137 List!36404)) )
))
(declare-fun arrayNoDuplicates!0 (array!103882 (_ BitVec 32) List!36404) Bool)

(assert (=> b!1560634 (= lt!671025 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36401))))

(declare-fun b!1560635 () Bool)

(assert (=> b!1560635 (= e!869672 (and e!869671 mapRes!59244))))

(declare-fun condMapEmpty!59244 () Bool)

(declare-fun mapDefault!59244 () ValueCell!18259)

