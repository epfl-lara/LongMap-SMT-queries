; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100360 () Bool)

(assert start!100360)

(declare-fun b!1197761 () Bool)

(declare-fun res!797120 () Bool)

(declare-fun e!680418 () Bool)

(assert (=> b!1197761 (=> (not res!797120) (not e!680418))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77587 0))(
  ( (array!77588 (arr!37439 (Array (_ BitVec 32) (_ BitVec 64))) (size!37975 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77587)

(assert (=> b!1197761 (= res!797120 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37975 _keys!1208))))))

(declare-fun b!1197762 () Bool)

(declare-fun e!680423 () Bool)

(assert (=> b!1197762 (= e!680418 e!680423)))

(declare-fun res!797122 () Bool)

(assert (=> b!1197762 (=> (not res!797122) (not e!680423))))

(declare-fun lt!543348 () array!77587)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77587 (_ BitVec 32)) Bool)

(assert (=> b!1197762 (= res!797122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543348 mask!1564))))

(assert (=> b!1197762 (= lt!543348 (array!77588 (store (arr!37439 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37975 _keys!1208)))))

(declare-fun b!1197763 () Bool)

(declare-fun res!797115 () Bool)

(assert (=> b!1197763 (=> (not res!797115) (not e!680418))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45667 0))(
  ( (V!45668 (val!15259 Int)) )
))
(declare-datatypes ((ValueCell!14493 0))(
  ( (ValueCellFull!14493 (v!17897 V!45667)) (EmptyCell!14493) )
))
(declare-datatypes ((array!77589 0))(
  ( (array!77590 (arr!37440 (Array (_ BitVec 32) ValueCell!14493)) (size!37976 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77589)

(assert (=> b!1197763 (= res!797115 (and (= (size!37976 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37975 _keys!1208) (size!37976 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197764 () Bool)

(declare-fun res!797116 () Bool)

(assert (=> b!1197764 (=> (not res!797116) (not e!680423))))

(declare-datatypes ((List!26339 0))(
  ( (Nil!26336) (Cons!26335 (h!27544 (_ BitVec 64)) (t!39040 List!26339)) )
))
(declare-fun arrayNoDuplicates!0 (array!77587 (_ BitVec 32) List!26339) Bool)

(assert (=> b!1197764 (= res!797116 (arrayNoDuplicates!0 lt!543348 #b00000000000000000000000000000000 Nil!26336))))

(declare-fun b!1197765 () Bool)

(declare-fun res!797121 () Bool)

(assert (=> b!1197765 (=> (not res!797121) (not e!680418))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197765 (= res!797121 (validKeyInArray!0 k0!934))))

(declare-fun b!1197766 () Bool)

(assert (=> b!1197766 (= e!680423 (not true))))

(declare-fun arrayContainsKey!0 (array!77587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197766 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39714 0))(
  ( (Unit!39715) )
))
(declare-fun lt!543347 () Unit!39714)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77587 (_ BitVec 64) (_ BitVec 32)) Unit!39714)

(assert (=> b!1197766 (= lt!543347 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197767 () Bool)

(declare-fun res!797117 () Bool)

(assert (=> b!1197767 (=> (not res!797117) (not e!680418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197767 (= res!797117 (validMask!0 mask!1564))))

(declare-fun b!1197768 () Bool)

(declare-fun res!797124 () Bool)

(assert (=> b!1197768 (=> (not res!797124) (not e!680418))))

(assert (=> b!1197768 (= res!797124 (= (select (arr!37439 _keys!1208) i!673) k0!934))))

(declare-fun res!797123 () Bool)

(assert (=> start!100360 (=> (not res!797123) (not e!680418))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100360 (= res!797123 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37975 _keys!1208))))))

(assert (=> start!100360 e!680418))

(declare-fun array_inv!28534 (array!77587) Bool)

(assert (=> start!100360 (array_inv!28534 _keys!1208)))

(assert (=> start!100360 true))

(declare-fun e!680422 () Bool)

(declare-fun array_inv!28535 (array!77589) Bool)

(assert (=> start!100360 (and (array_inv!28535 _values!996) e!680422)))

(declare-fun b!1197769 () Bool)

(declare-fun e!680421 () Bool)

(declare-fun tp_is_empty!30405 () Bool)

(assert (=> b!1197769 (= e!680421 tp_is_empty!30405)))

(declare-fun b!1197770 () Bool)

(declare-fun res!797119 () Bool)

(assert (=> b!1197770 (=> (not res!797119) (not e!680418))))

(assert (=> b!1197770 (= res!797119 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26336))))

(declare-fun mapNonEmpty!47447 () Bool)

(declare-fun mapRes!47447 () Bool)

(declare-fun tp!90102 () Bool)

(assert (=> mapNonEmpty!47447 (= mapRes!47447 (and tp!90102 e!680421))))

(declare-fun mapRest!47447 () (Array (_ BitVec 32) ValueCell!14493))

(declare-fun mapValue!47447 () ValueCell!14493)

(declare-fun mapKey!47447 () (_ BitVec 32))

(assert (=> mapNonEmpty!47447 (= (arr!37440 _values!996) (store mapRest!47447 mapKey!47447 mapValue!47447))))

(declare-fun b!1197771 () Bool)

(declare-fun e!680419 () Bool)

(assert (=> b!1197771 (= e!680419 tp_is_empty!30405)))

(declare-fun mapIsEmpty!47447 () Bool)

(assert (=> mapIsEmpty!47447 mapRes!47447))

(declare-fun b!1197772 () Bool)

(declare-fun res!797118 () Bool)

(assert (=> b!1197772 (=> (not res!797118) (not e!680418))))

(assert (=> b!1197772 (= res!797118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197773 () Bool)

(assert (=> b!1197773 (= e!680422 (and e!680419 mapRes!47447))))

(declare-fun condMapEmpty!47447 () Bool)

(declare-fun mapDefault!47447 () ValueCell!14493)

(assert (=> b!1197773 (= condMapEmpty!47447 (= (arr!37440 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14493)) mapDefault!47447)))))

(assert (= (and start!100360 res!797123) b!1197767))

(assert (= (and b!1197767 res!797117) b!1197763))

(assert (= (and b!1197763 res!797115) b!1197772))

(assert (= (and b!1197772 res!797118) b!1197770))

(assert (= (and b!1197770 res!797119) b!1197761))

(assert (= (and b!1197761 res!797120) b!1197765))

(assert (= (and b!1197765 res!797121) b!1197768))

(assert (= (and b!1197768 res!797124) b!1197762))

(assert (= (and b!1197762 res!797122) b!1197764))

(assert (= (and b!1197764 res!797116) b!1197766))

(assert (= (and b!1197773 condMapEmpty!47447) mapIsEmpty!47447))

(assert (= (and b!1197773 (not condMapEmpty!47447)) mapNonEmpty!47447))

(get-info :version)

(assert (= (and mapNonEmpty!47447 ((_ is ValueCellFull!14493) mapValue!47447)) b!1197769))

(assert (= (and b!1197773 ((_ is ValueCellFull!14493) mapDefault!47447)) b!1197771))

(assert (= start!100360 b!1197773))

(declare-fun m!1104711 () Bool)

(assert (=> b!1197765 m!1104711))

(declare-fun m!1104713 () Bool)

(assert (=> mapNonEmpty!47447 m!1104713))

(declare-fun m!1104715 () Bool)

(assert (=> b!1197768 m!1104715))

(declare-fun m!1104717 () Bool)

(assert (=> b!1197762 m!1104717))

(declare-fun m!1104719 () Bool)

(assert (=> b!1197762 m!1104719))

(declare-fun m!1104721 () Bool)

(assert (=> b!1197766 m!1104721))

(declare-fun m!1104723 () Bool)

(assert (=> b!1197766 m!1104723))

(declare-fun m!1104725 () Bool)

(assert (=> start!100360 m!1104725))

(declare-fun m!1104727 () Bool)

(assert (=> start!100360 m!1104727))

(declare-fun m!1104729 () Bool)

(assert (=> b!1197770 m!1104729))

(declare-fun m!1104731 () Bool)

(assert (=> b!1197764 m!1104731))

(declare-fun m!1104733 () Bool)

(assert (=> b!1197767 m!1104733))

(declare-fun m!1104735 () Bool)

(assert (=> b!1197772 m!1104735))

(check-sat (not mapNonEmpty!47447) (not b!1197770) (not b!1197765) (not b!1197766) (not b!1197767) (not b!1197772) (not start!100360) tp_is_empty!30405 (not b!1197764) (not b!1197762))
(check-sat)
