; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134202 () Bool)

(assert start!134202)

(declare-fun b!1566839 () Bool)

(declare-fun res!1070360 () Bool)

(declare-fun e!873435 () Bool)

(assert (=> b!1566839 (=> (not res!1070360) (not e!873435))))

(declare-datatypes ((V!60025 0))(
  ( (V!60026 (val!19515 Int)) )
))
(declare-datatypes ((tuple2!25240 0))(
  ( (tuple2!25241 (_1!12631 (_ BitVec 64)) (_2!12631 V!60025)) )
))
(declare-datatypes ((List!36601 0))(
  ( (Nil!36598) (Cons!36597 (h!38061 tuple2!25240) (t!51440 List!36601)) )
))
(declare-datatypes ((ListLongMap!22683 0))(
  ( (ListLongMap!22684 (toList!11357 List!36601)) )
))
(declare-fun contains!10359 (ListLongMap!22683 (_ BitVec 64)) Bool)

(assert (=> b!1566839 (= res!1070360 (not (contains!10359 (ListLongMap!22684 Nil!36598) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1566840 () Bool)

(assert (=> b!1566840 (= e!873435 false)))

(declare-fun lt!672944 () Bool)

(assert (=> b!1566840 (= lt!672944 (contains!10359 (ListLongMap!22684 Nil!36598) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566841 () Bool)

(declare-fun res!1070358 () Bool)

(assert (=> b!1566841 (=> (not res!1070358) (not e!873435))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104542 0))(
  ( (array!104543 (arr!50455 (Array (_ BitVec 32) (_ BitVec 64))) (size!51006 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104542)

(assert (=> b!1566841 (= res!1070358 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51006 _keys!637)) (bvsge from!782 (size!51006 _keys!637))))))

(declare-fun mapIsEmpty!59673 () Bool)

(declare-fun mapRes!59673 () Bool)

(assert (=> mapIsEmpty!59673 mapRes!59673))

(declare-fun b!1566842 () Bool)

(declare-fun e!873436 () Bool)

(declare-fun e!873438 () Bool)

(assert (=> b!1566842 (= e!873436 (and e!873438 mapRes!59673))))

(declare-fun condMapEmpty!59673 () Bool)

(declare-datatypes ((ValueCell!18401 0))(
  ( (ValueCellFull!18401 (v!22259 V!60025)) (EmptyCell!18401) )
))
(declare-datatypes ((array!104544 0))(
  ( (array!104545 (arr!50456 (Array (_ BitVec 32) ValueCell!18401)) (size!51007 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104544)

(declare-fun mapDefault!59673 () ValueCell!18401)

(assert (=> b!1566842 (= condMapEmpty!59673 (= (arr!50456 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18401)) mapDefault!59673)))))

(declare-fun b!1566843 () Bool)

(declare-fun res!1070356 () Bool)

(assert (=> b!1566843 (=> (not res!1070356) (not e!873435))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566843 (= res!1070356 (and (= (size!51007 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51006 _keys!637) (size!51007 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566844 () Bool)

(declare-fun res!1070357 () Bool)

(assert (=> b!1566844 (=> (not res!1070357) (not e!873435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104542 (_ BitVec 32)) Bool)

(assert (=> b!1566844 (= res!1070357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566845 () Bool)

(declare-fun tp_is_empty!38863 () Bool)

(assert (=> b!1566845 (= e!873438 tp_is_empty!38863)))

(declare-fun res!1070355 () Bool)

(assert (=> start!134202 (=> (not res!1070355) (not e!873435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134202 (= res!1070355 (validMask!0 mask!947))))

(assert (=> start!134202 e!873435))

(assert (=> start!134202 true))

(declare-fun array_inv!39455 (array!104542) Bool)

(assert (=> start!134202 (array_inv!39455 _keys!637)))

(declare-fun array_inv!39456 (array!104544) Bool)

(assert (=> start!134202 (and (array_inv!39456 _values!487) e!873436)))

(declare-fun b!1566846 () Bool)

(declare-fun e!873437 () Bool)

(assert (=> b!1566846 (= e!873437 tp_is_empty!38863)))

(declare-fun b!1566847 () Bool)

(declare-fun res!1070359 () Bool)

(assert (=> b!1566847 (=> (not res!1070359) (not e!873435))))

(declare-datatypes ((List!36602 0))(
  ( (Nil!36599) (Cons!36598 (h!38062 (_ BitVec 64)) (t!51441 List!36602)) )
))
(declare-fun arrayNoDuplicates!0 (array!104542 (_ BitVec 32) List!36602) Bool)

(assert (=> b!1566847 (= res!1070359 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36599))))

(declare-fun mapNonEmpty!59673 () Bool)

(declare-fun tp!113598 () Bool)

(assert (=> mapNonEmpty!59673 (= mapRes!59673 (and tp!113598 e!873437))))

(declare-fun mapValue!59673 () ValueCell!18401)

(declare-fun mapRest!59673 () (Array (_ BitVec 32) ValueCell!18401))

(declare-fun mapKey!59673 () (_ BitVec 32))

(assert (=> mapNonEmpty!59673 (= (arr!50456 _values!487) (store mapRest!59673 mapKey!59673 mapValue!59673))))

(assert (= (and start!134202 res!1070355) b!1566843))

(assert (= (and b!1566843 res!1070356) b!1566844))

(assert (= (and b!1566844 res!1070357) b!1566847))

(assert (= (and b!1566847 res!1070359) b!1566841))

(assert (= (and b!1566841 res!1070358) b!1566839))

(assert (= (and b!1566839 res!1070360) b!1566840))

(assert (= (and b!1566842 condMapEmpty!59673) mapIsEmpty!59673))

(assert (= (and b!1566842 (not condMapEmpty!59673)) mapNonEmpty!59673))

(get-info :version)

(assert (= (and mapNonEmpty!59673 ((_ is ValueCellFull!18401) mapValue!59673)) b!1566846))

(assert (= (and b!1566842 ((_ is ValueCellFull!18401) mapDefault!59673)) b!1566845))

(assert (= start!134202 b!1566842))

(declare-fun m!1441869 () Bool)

(assert (=> mapNonEmpty!59673 m!1441869))

(declare-fun m!1441871 () Bool)

(assert (=> b!1566844 m!1441871))

(declare-fun m!1441873 () Bool)

(assert (=> b!1566847 m!1441873))

(declare-fun m!1441875 () Bool)

(assert (=> b!1566840 m!1441875))

(declare-fun m!1441877 () Bool)

(assert (=> start!134202 m!1441877))

(declare-fun m!1441879 () Bool)

(assert (=> start!134202 m!1441879))

(declare-fun m!1441881 () Bool)

(assert (=> start!134202 m!1441881))

(declare-fun m!1441883 () Bool)

(assert (=> b!1566839 m!1441883))

(check-sat (not b!1566840) (not b!1566839) (not start!134202) tp_is_empty!38863 (not b!1566847) (not b!1566844) (not mapNonEmpty!59673))
(check-sat)
