; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133376 () Bool)

(assert start!133376)

(declare-fun b!1559504 () Bool)

(declare-fun e!868950 () Bool)

(assert (=> b!1559504 (= e!868950 false)))

(declare-fun lt!670634 () Bool)

(declare-datatypes ((V!59553 0))(
  ( (V!59554 (val!19338 Int)) )
))
(declare-datatypes ((tuple2!25084 0))(
  ( (tuple2!25085 (_1!12553 (_ BitVec 64)) (_2!12553 V!59553)) )
))
(declare-datatypes ((List!36405 0))(
  ( (Nil!36402) (Cons!36401 (h!37848 tuple2!25084) (t!51130 List!36405)) )
))
(declare-datatypes ((ListLongMap!22519 0))(
  ( (ListLongMap!22520 (toList!11275 List!36405)) )
))
(declare-fun contains!10185 (ListLongMap!22519 (_ BitVec 64)) Bool)

(assert (=> b!1559504 (= lt!670634 (contains!10185 (ListLongMap!22520 Nil!36402) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!59139 () Bool)

(declare-fun mapRes!59139 () Bool)

(assert (=> mapIsEmpty!59139 mapRes!59139))

(declare-fun b!1559505 () Bool)

(declare-fun e!868948 () Bool)

(declare-fun tp_is_empty!38509 () Bool)

(assert (=> b!1559505 (= e!868948 tp_is_empty!38509)))

(declare-fun mapNonEmpty!59139 () Bool)

(declare-fun tp!112795 () Bool)

(assert (=> mapNonEmpty!59139 (= mapRes!59139 (and tp!112795 e!868948))))

(declare-datatypes ((ValueCell!18224 0))(
  ( (ValueCellFull!18224 (v!22086 V!59553)) (EmptyCell!18224) )
))
(declare-fun mapValue!59139 () ValueCell!18224)

(declare-datatypes ((array!103664 0))(
  ( (array!103665 (arr!50025 (Array (_ BitVec 32) ValueCell!18224)) (size!50577 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103664)

(declare-fun mapKey!59139 () (_ BitVec 32))

(declare-fun mapRest!59139 () (Array (_ BitVec 32) ValueCell!18224))

(assert (=> mapNonEmpty!59139 (= (arr!50025 _values!487) (store mapRest!59139 mapKey!59139 mapValue!59139))))

(declare-fun b!1559506 () Bool)

(declare-fun e!868951 () Bool)

(assert (=> b!1559506 (= e!868951 tp_is_empty!38509)))

(declare-fun res!1066511 () Bool)

(assert (=> start!133376 (=> (not res!1066511) (not e!868950))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133376 (= res!1066511 (validMask!0 mask!947))))

(assert (=> start!133376 e!868950))

(assert (=> start!133376 true))

(declare-datatypes ((array!103666 0))(
  ( (array!103667 (arr!50026 (Array (_ BitVec 32) (_ BitVec 64))) (size!50578 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103666)

(declare-fun array_inv!39091 (array!103666) Bool)

(assert (=> start!133376 (array_inv!39091 _keys!637)))

(declare-fun e!868947 () Bool)

(declare-fun array_inv!39092 (array!103664) Bool)

(assert (=> start!133376 (and (array_inv!39092 _values!487) e!868947)))

(declare-fun b!1559507 () Bool)

(declare-fun res!1066509 () Bool)

(assert (=> b!1559507 (=> (not res!1066509) (not e!868950))))

(assert (=> b!1559507 (= res!1066509 (not (contains!10185 (ListLongMap!22520 Nil!36402) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1559508 () Bool)

(declare-fun res!1066508 () Bool)

(assert (=> b!1559508 (=> (not res!1066508) (not e!868950))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1559508 (= res!1066508 (and (= (size!50577 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50578 _keys!637) (size!50577 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559509 () Bool)

(declare-fun res!1066510 () Bool)

(assert (=> b!1559509 (=> (not res!1066510) (not e!868950))))

(declare-datatypes ((List!36406 0))(
  ( (Nil!36403) (Cons!36402 (h!37849 (_ BitVec 64)) (t!51131 List!36406)) )
))
(declare-fun arrayNoDuplicates!0 (array!103666 (_ BitVec 32) List!36406) Bool)

(assert (=> b!1559509 (= res!1066510 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36403))))

(declare-fun b!1559510 () Bool)

(declare-fun res!1066512 () Bool)

(assert (=> b!1559510 (=> (not res!1066512) (not e!868950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103666 (_ BitVec 32)) Bool)

(assert (=> b!1559510 (= res!1066512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559511 () Bool)

(declare-fun res!1066507 () Bool)

(assert (=> b!1559511 (=> (not res!1066507) (not e!868950))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559511 (= res!1066507 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50578 _keys!637)) (bvsge from!782 (size!50578 _keys!637))))))

(declare-fun b!1559512 () Bool)

(assert (=> b!1559512 (= e!868947 (and e!868951 mapRes!59139))))

(declare-fun condMapEmpty!59139 () Bool)

(declare-fun mapDefault!59139 () ValueCell!18224)

(assert (=> b!1559512 (= condMapEmpty!59139 (= (arr!50025 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18224)) mapDefault!59139)))))

(assert (= (and start!133376 res!1066511) b!1559508))

(assert (= (and b!1559508 res!1066508) b!1559510))

(assert (= (and b!1559510 res!1066512) b!1559509))

(assert (= (and b!1559509 res!1066510) b!1559511))

(assert (= (and b!1559511 res!1066507) b!1559507))

(assert (= (and b!1559507 res!1066509) b!1559504))

(assert (= (and b!1559512 condMapEmpty!59139) mapIsEmpty!59139))

(assert (= (and b!1559512 (not condMapEmpty!59139)) mapNonEmpty!59139))

(get-info :version)

(assert (= (and mapNonEmpty!59139 ((_ is ValueCellFull!18224) mapValue!59139)) b!1559505))

(assert (= (and b!1559512 ((_ is ValueCellFull!18224) mapDefault!59139)) b!1559506))

(assert (= start!133376 b!1559512))

(declare-fun m!1435017 () Bool)

(assert (=> b!1559510 m!1435017))

(declare-fun m!1435019 () Bool)

(assert (=> mapNonEmpty!59139 m!1435019))

(declare-fun m!1435021 () Bool)

(assert (=> b!1559509 m!1435021))

(declare-fun m!1435023 () Bool)

(assert (=> start!133376 m!1435023))

(declare-fun m!1435025 () Bool)

(assert (=> start!133376 m!1435025))

(declare-fun m!1435027 () Bool)

(assert (=> start!133376 m!1435027))

(declare-fun m!1435029 () Bool)

(assert (=> b!1559504 m!1435029))

(declare-fun m!1435031 () Bool)

(assert (=> b!1559507 m!1435031))

(check-sat (not mapNonEmpty!59139) (not b!1559509) (not b!1559510) (not b!1559504) tp_is_empty!38509 (not b!1559507) (not start!133376))
(check-sat)
