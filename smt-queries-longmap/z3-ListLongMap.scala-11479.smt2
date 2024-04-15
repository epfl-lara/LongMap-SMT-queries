; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133622 () Bool)

(assert start!133622)

(declare-fun mapNonEmpty!59508 () Bool)

(declare-fun mapRes!59508 () Bool)

(declare-fun tp!113344 () Bool)

(declare-fun e!870804 () Bool)

(assert (=> mapNonEmpty!59508 (= mapRes!59508 (and tp!113344 e!870804))))

(declare-fun mapKey!59508 () (_ BitVec 32))

(declare-datatypes ((V!59881 0))(
  ( (V!59882 (val!19461 Int)) )
))
(declare-datatypes ((ValueCell!18347 0))(
  ( (ValueCellFull!18347 (v!22209 V!59881)) (EmptyCell!18347) )
))
(declare-fun mapValue!59508 () ValueCell!18347)

(declare-fun mapRest!59508 () (Array (_ BitVec 32) ValueCell!18347))

(declare-datatypes ((array!104132 0))(
  ( (array!104133 (arr!50259 (Array (_ BitVec 32) ValueCell!18347)) (size!50811 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104132)

(assert (=> mapNonEmpty!59508 (= (arr!50259 _values!487) (store mapRest!59508 mapKey!59508 mapValue!59508))))

(declare-fun mapIsEmpty!59508 () Bool)

(assert (=> mapIsEmpty!59508 mapRes!59508))

(declare-fun b!1562591 () Bool)

(declare-fun e!870803 () Bool)

(declare-fun tp_is_empty!38755 () Bool)

(assert (=> b!1562591 (= e!870803 tp_is_empty!38755)))

(declare-fun res!1068373 () Bool)

(declare-fun e!870802 () Bool)

(assert (=> start!133622 (=> (not res!1068373) (not e!870802))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133622 (= res!1068373 (validMask!0 mask!947))))

(assert (=> start!133622 e!870802))

(assert (=> start!133622 true))

(declare-fun e!870801 () Bool)

(declare-fun array_inv!39251 (array!104132) Bool)

(assert (=> start!133622 (and (array_inv!39251 _values!487) e!870801)))

(declare-datatypes ((array!104134 0))(
  ( (array!104135 (arr!50260 (Array (_ BitVec 32) (_ BitVec 64))) (size!50812 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104134)

(declare-fun array_inv!39252 (array!104134) Bool)

(assert (=> start!133622 (array_inv!39252 _keys!637)))

(declare-fun b!1562592 () Bool)

(declare-fun res!1068374 () Bool)

(assert (=> b!1562592 (=> (not res!1068374) (not e!870802))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1562592 (= res!1068374 (and (= (size!50811 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50812 _keys!637) (size!50811 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1562593 () Bool)

(assert (=> b!1562593 (= e!870802 false)))

(declare-fun lt!671516 () Bool)

(declare-datatypes ((List!36546 0))(
  ( (Nil!36543) (Cons!36542 (h!37989 (_ BitVec 64)) (t!51385 List!36546)) )
))
(declare-fun arrayNoDuplicates!0 (array!104134 (_ BitVec 32) List!36546) Bool)

(assert (=> b!1562593 (= lt!671516 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36543))))

(declare-fun b!1562594 () Bool)

(declare-fun res!1068375 () Bool)

(assert (=> b!1562594 (=> (not res!1068375) (not e!870802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104134 (_ BitVec 32)) Bool)

(assert (=> b!1562594 (= res!1068375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562595 () Bool)

(assert (=> b!1562595 (= e!870801 (and e!870803 mapRes!59508))))

(declare-fun condMapEmpty!59508 () Bool)

(declare-fun mapDefault!59508 () ValueCell!18347)

(assert (=> b!1562595 (= condMapEmpty!59508 (= (arr!50259 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18347)) mapDefault!59508)))))

(declare-fun b!1562596 () Bool)

(assert (=> b!1562596 (= e!870804 tp_is_empty!38755)))

(assert (= (and start!133622 res!1068373) b!1562592))

(assert (= (and b!1562592 res!1068374) b!1562594))

(assert (= (and b!1562594 res!1068375) b!1562593))

(assert (= (and b!1562595 condMapEmpty!59508) mapIsEmpty!59508))

(assert (= (and b!1562595 (not condMapEmpty!59508)) mapNonEmpty!59508))

(get-info :version)

(assert (= (and mapNonEmpty!59508 ((_ is ValueCellFull!18347) mapValue!59508)) b!1562596))

(assert (= (and b!1562595 ((_ is ValueCellFull!18347) mapDefault!59508)) b!1562591))

(assert (= start!133622 b!1562595))

(declare-fun m!1437705 () Bool)

(assert (=> mapNonEmpty!59508 m!1437705))

(declare-fun m!1437707 () Bool)

(assert (=> start!133622 m!1437707))

(declare-fun m!1437709 () Bool)

(assert (=> start!133622 m!1437709))

(declare-fun m!1437711 () Bool)

(assert (=> start!133622 m!1437711))

(declare-fun m!1437713 () Bool)

(assert (=> b!1562593 m!1437713))

(declare-fun m!1437715 () Bool)

(assert (=> b!1562594 m!1437715))

(check-sat (not b!1562594) (not start!133622) (not b!1562593) tp_is_empty!38755 (not mapNonEmpty!59508))
(check-sat)
