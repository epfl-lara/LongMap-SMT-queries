; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133628 () Bool)

(assert start!133628)

(declare-fun b!1562645 () Bool)

(declare-fun e!870846 () Bool)

(declare-fun tp_is_empty!38761 () Bool)

(assert (=> b!1562645 (= e!870846 tp_is_empty!38761)))

(declare-fun res!1068401 () Bool)

(declare-fun e!870850 () Bool)

(assert (=> start!133628 (=> (not res!1068401) (not e!870850))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133628 (= res!1068401 (validMask!0 mask!947))))

(assert (=> start!133628 e!870850))

(assert (=> start!133628 true))

(declare-datatypes ((V!59889 0))(
  ( (V!59890 (val!19464 Int)) )
))
(declare-datatypes ((ValueCell!18350 0))(
  ( (ValueCellFull!18350 (v!22212 V!59889)) (EmptyCell!18350) )
))
(declare-datatypes ((array!104142 0))(
  ( (array!104143 (arr!50264 (Array (_ BitVec 32) ValueCell!18350)) (size!50816 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104142)

(declare-fun e!870849 () Bool)

(declare-fun array_inv!39255 (array!104142) Bool)

(assert (=> start!133628 (and (array_inv!39255 _values!487) e!870849)))

(declare-datatypes ((array!104144 0))(
  ( (array!104145 (arr!50265 (Array (_ BitVec 32) (_ BitVec 64))) (size!50817 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104144)

(declare-fun array_inv!39256 (array!104144) Bool)

(assert (=> start!133628 (array_inv!39256 _keys!637)))

(declare-fun b!1562646 () Bool)

(declare-fun mapRes!59517 () Bool)

(assert (=> b!1562646 (= e!870849 (and e!870846 mapRes!59517))))

(declare-fun condMapEmpty!59517 () Bool)

(declare-fun mapDefault!59517 () ValueCell!18350)

(assert (=> b!1562646 (= condMapEmpty!59517 (= (arr!50264 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18350)) mapDefault!59517)))))

(declare-fun mapIsEmpty!59517 () Bool)

(assert (=> mapIsEmpty!59517 mapRes!59517))

(declare-fun b!1562647 () Bool)

(declare-fun e!870848 () Bool)

(assert (=> b!1562647 (= e!870848 tp_is_empty!38761)))

(declare-fun b!1562648 () Bool)

(declare-fun res!1068400 () Bool)

(assert (=> b!1562648 (=> (not res!1068400) (not e!870850))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562648 (= res!1068400 (and (= (size!50816 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50817 _keys!637) (size!50816 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562649 () Bool)

(assert (=> b!1562649 (= e!870850 false)))

(declare-fun lt!671525 () Bool)

(declare-datatypes ((List!36548 0))(
  ( (Nil!36545) (Cons!36544 (h!37991 (_ BitVec 64)) (t!51387 List!36548)) )
))
(declare-fun arrayNoDuplicates!0 (array!104144 (_ BitVec 32) List!36548) Bool)

(assert (=> b!1562649 (= lt!671525 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36545))))

(declare-fun b!1562650 () Bool)

(declare-fun res!1068402 () Bool)

(assert (=> b!1562650 (=> (not res!1068402) (not e!870850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104144 (_ BitVec 32)) Bool)

(assert (=> b!1562650 (= res!1068402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59517 () Bool)

(declare-fun tp!113353 () Bool)

(assert (=> mapNonEmpty!59517 (= mapRes!59517 (and tp!113353 e!870848))))

(declare-fun mapKey!59517 () (_ BitVec 32))

(declare-fun mapValue!59517 () ValueCell!18350)

(declare-fun mapRest!59517 () (Array (_ BitVec 32) ValueCell!18350))

(assert (=> mapNonEmpty!59517 (= (arr!50264 _values!487) (store mapRest!59517 mapKey!59517 mapValue!59517))))

(assert (= (and start!133628 res!1068401) b!1562648))

(assert (= (and b!1562648 res!1068400) b!1562650))

(assert (= (and b!1562650 res!1068402) b!1562649))

(assert (= (and b!1562646 condMapEmpty!59517) mapIsEmpty!59517))

(assert (= (and b!1562646 (not condMapEmpty!59517)) mapNonEmpty!59517))

(get-info :version)

(assert (= (and mapNonEmpty!59517 ((_ is ValueCellFull!18350) mapValue!59517)) b!1562647))

(assert (= (and b!1562646 ((_ is ValueCellFull!18350) mapDefault!59517)) b!1562645))

(assert (= start!133628 b!1562646))

(declare-fun m!1437741 () Bool)

(assert (=> start!133628 m!1437741))

(declare-fun m!1437743 () Bool)

(assert (=> start!133628 m!1437743))

(declare-fun m!1437745 () Bool)

(assert (=> start!133628 m!1437745))

(declare-fun m!1437747 () Bool)

(assert (=> b!1562649 m!1437747))

(declare-fun m!1437749 () Bool)

(assert (=> b!1562650 m!1437749))

(declare-fun m!1437751 () Bool)

(assert (=> mapNonEmpty!59517 m!1437751))

(check-sat (not mapNonEmpty!59517) (not start!133628) (not b!1562649) tp_is_empty!38761 (not b!1562650))
(check-sat)
