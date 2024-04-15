; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100176 () Bool)

(assert start!100176)

(declare-fun b!1194561 () Bool)

(declare-fun res!794825 () Bool)

(declare-fun e!678865 () Bool)

(assert (=> b!1194561 (=> (not res!794825) (not e!678865))))

(declare-datatypes ((array!77244 0))(
  ( (array!77245 (arr!37270 (Array (_ BitVec 32) (_ BitVec 64))) (size!37808 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77244)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1194561 (= res!794825 (= (select (arr!37270 _keys!1208) i!673) k0!934))))

(declare-fun b!1194562 () Bool)

(declare-fun res!794827 () Bool)

(assert (=> b!1194562 (=> (not res!794827) (not e!678865))))

(declare-datatypes ((List!26339 0))(
  ( (Nil!26336) (Cons!26335 (h!27544 (_ BitVec 64)) (t!39001 List!26339)) )
))
(declare-fun arrayNoDuplicates!0 (array!77244 (_ BitVec 32) List!26339) Bool)

(assert (=> b!1194562 (= res!794827 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26336))))

(declare-fun b!1194563 () Bool)

(declare-fun e!678864 () Bool)

(assert (=> b!1194563 (= e!678865 e!678864)))

(declare-fun res!794830 () Bool)

(assert (=> b!1194563 (=> (not res!794830) (not e!678864))))

(declare-fun lt!542612 () array!77244)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77244 (_ BitVec 32)) Bool)

(assert (=> b!1194563 (= res!794830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542612 mask!1564))))

(assert (=> b!1194563 (= lt!542612 (array!77245 (store (arr!37270 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37808 _keys!1208)))))

(declare-fun res!794828 () Bool)

(assert (=> start!100176 (=> (not res!794828) (not e!678865))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100176 (= res!794828 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37808 _keys!1208))))))

(assert (=> start!100176 e!678865))

(declare-fun array_inv!28532 (array!77244) Bool)

(assert (=> start!100176 (array_inv!28532 _keys!1208)))

(assert (=> start!100176 true))

(declare-datatypes ((V!45481 0))(
  ( (V!45482 (val!15189 Int)) )
))
(declare-datatypes ((ValueCell!14423 0))(
  ( (ValueCellFull!14423 (v!17826 V!45481)) (EmptyCell!14423) )
))
(declare-datatypes ((array!77246 0))(
  ( (array!77247 (arr!37271 (Array (_ BitVec 32) ValueCell!14423)) (size!37809 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77246)

(declare-fun e!678863 () Bool)

(declare-fun array_inv!28533 (array!77246) Bool)

(assert (=> start!100176 (and (array_inv!28533 _values!996) e!678863)))

(declare-fun b!1194564 () Bool)

(declare-fun res!794833 () Bool)

(assert (=> b!1194564 (=> (not res!794833) (not e!678865))))

(assert (=> b!1194564 (= res!794833 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37808 _keys!1208))))))

(declare-fun b!1194565 () Bool)

(declare-fun res!794826 () Bool)

(assert (=> b!1194565 (=> (not res!794826) (not e!678865))))

(assert (=> b!1194565 (= res!794826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47231 () Bool)

(declare-fun mapRes!47231 () Bool)

(assert (=> mapIsEmpty!47231 mapRes!47231))

(declare-fun b!1194566 () Bool)

(declare-fun e!678867 () Bool)

(declare-fun tp_is_empty!30265 () Bool)

(assert (=> b!1194566 (= e!678867 tp_is_empty!30265)))

(declare-fun mapNonEmpty!47231 () Bool)

(declare-fun tp!89841 () Bool)

(assert (=> mapNonEmpty!47231 (= mapRes!47231 (and tp!89841 e!678867))))

(declare-fun mapKey!47231 () (_ BitVec 32))

(declare-fun mapRest!47231 () (Array (_ BitVec 32) ValueCell!14423))

(declare-fun mapValue!47231 () ValueCell!14423)

(assert (=> mapNonEmpty!47231 (= (arr!37271 _values!996) (store mapRest!47231 mapKey!47231 mapValue!47231))))

(declare-fun b!1194567 () Bool)

(declare-fun e!678862 () Bool)

(assert (=> b!1194567 (= e!678862 tp_is_empty!30265)))

(declare-fun b!1194568 () Bool)

(declare-fun res!794832 () Bool)

(assert (=> b!1194568 (=> (not res!794832) (not e!678865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194568 (= res!794832 (validMask!0 mask!1564))))

(declare-fun b!1194569 () Bool)

(declare-fun res!794831 () Bool)

(assert (=> b!1194569 (=> (not res!794831) (not e!678864))))

(assert (=> b!1194569 (= res!794831 (arrayNoDuplicates!0 lt!542612 #b00000000000000000000000000000000 Nil!26336))))

(declare-fun b!1194570 () Bool)

(declare-fun res!794834 () Bool)

(assert (=> b!1194570 (=> (not res!794834) (not e!678865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194570 (= res!794834 (validKeyInArray!0 k0!934))))

(declare-fun b!1194571 () Bool)

(declare-fun res!794829 () Bool)

(assert (=> b!1194571 (=> (not res!794829) (not e!678865))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194571 (= res!794829 (and (= (size!37809 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37808 _keys!1208) (size!37809 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194572 () Bool)

(assert (=> b!1194572 (= e!678864 (not true))))

(declare-fun arrayContainsKey!0 (array!77244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194572 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39479 0))(
  ( (Unit!39480) )
))
(declare-fun lt!542613 () Unit!39479)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77244 (_ BitVec 64) (_ BitVec 32)) Unit!39479)

(assert (=> b!1194572 (= lt!542613 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1194573 () Bool)

(assert (=> b!1194573 (= e!678863 (and e!678862 mapRes!47231))))

(declare-fun condMapEmpty!47231 () Bool)

(declare-fun mapDefault!47231 () ValueCell!14423)

(assert (=> b!1194573 (= condMapEmpty!47231 (= (arr!37271 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14423)) mapDefault!47231)))))

(assert (= (and start!100176 res!794828) b!1194568))

(assert (= (and b!1194568 res!794832) b!1194571))

(assert (= (and b!1194571 res!794829) b!1194565))

(assert (= (and b!1194565 res!794826) b!1194562))

(assert (= (and b!1194562 res!794827) b!1194564))

(assert (= (and b!1194564 res!794833) b!1194570))

(assert (= (and b!1194570 res!794834) b!1194561))

(assert (= (and b!1194561 res!794825) b!1194563))

(assert (= (and b!1194563 res!794830) b!1194569))

(assert (= (and b!1194569 res!794831) b!1194572))

(assert (= (and b!1194573 condMapEmpty!47231) mapIsEmpty!47231))

(assert (= (and b!1194573 (not condMapEmpty!47231)) mapNonEmpty!47231))

(get-info :version)

(assert (= (and mapNonEmpty!47231 ((_ is ValueCellFull!14423) mapValue!47231)) b!1194566))

(assert (= (and b!1194573 ((_ is ValueCellFull!14423) mapDefault!47231)) b!1194567))

(assert (= start!100176 b!1194573))

(declare-fun m!1101891 () Bool)

(assert (=> b!1194565 m!1101891))

(declare-fun m!1101893 () Bool)

(assert (=> b!1194561 m!1101893))

(declare-fun m!1101895 () Bool)

(assert (=> b!1194572 m!1101895))

(declare-fun m!1101897 () Bool)

(assert (=> b!1194572 m!1101897))

(declare-fun m!1101899 () Bool)

(assert (=> b!1194569 m!1101899))

(declare-fun m!1101901 () Bool)

(assert (=> b!1194570 m!1101901))

(declare-fun m!1101903 () Bool)

(assert (=> b!1194563 m!1101903))

(declare-fun m!1101905 () Bool)

(assert (=> b!1194563 m!1101905))

(declare-fun m!1101907 () Bool)

(assert (=> b!1194568 m!1101907))

(declare-fun m!1101909 () Bool)

(assert (=> start!100176 m!1101909))

(declare-fun m!1101911 () Bool)

(assert (=> start!100176 m!1101911))

(declare-fun m!1101913 () Bool)

(assert (=> mapNonEmpty!47231 m!1101913))

(declare-fun m!1101915 () Bool)

(assert (=> b!1194562 m!1101915))

(check-sat (not b!1194569) (not start!100176) (not b!1194572) (not mapNonEmpty!47231) (not b!1194568) (not b!1194570) (not b!1194562) (not b!1194563) (not b!1194565) tp_is_empty!30265)
(check-sat)
