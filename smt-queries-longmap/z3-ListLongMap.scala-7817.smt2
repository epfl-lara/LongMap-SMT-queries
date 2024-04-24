; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97882 () Bool)

(assert start!97882)

(declare-fun b!1117162 () Bool)

(declare-fun res!745496 () Bool)

(declare-fun e!636671 () Bool)

(assert (=> b!1117162 (=> (not res!745496) (not e!636671))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117162 (= res!745496 (validKeyInArray!0 k0!934))))

(declare-fun b!1117163 () Bool)

(declare-fun e!636669 () Bool)

(declare-fun tp_is_empty!27877 () Bool)

(assert (=> b!1117163 (= e!636669 tp_is_empty!27877)))

(declare-fun b!1117164 () Bool)

(declare-fun res!745498 () Bool)

(assert (=> b!1117164 (=> (not res!745498) (not e!636671))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72693 0))(
  ( (array!72694 (arr!34993 (Array (_ BitVec 32) (_ BitVec 64))) (size!35530 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72693)

(assert (=> b!1117164 (= res!745498 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35530 _keys!1208))))))

(declare-fun b!1117165 () Bool)

(declare-fun e!636670 () Bool)

(assert (=> b!1117165 (= e!636671 e!636670)))

(declare-fun res!745499 () Bool)

(assert (=> b!1117165 (=> (not res!745499) (not e!636670))))

(declare-fun lt!497556 () array!72693)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72693 (_ BitVec 32)) Bool)

(assert (=> b!1117165 (= res!745499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497556 mask!1564))))

(assert (=> b!1117165 (= lt!497556 (array!72694 (store (arr!34993 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35530 _keys!1208)))))

(declare-fun b!1117166 () Bool)

(assert (=> b!1117166 (= e!636670 (not true))))

(declare-fun arrayContainsKey!0 (array!72693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117166 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36591 0))(
  ( (Unit!36592) )
))
(declare-fun lt!497557 () Unit!36591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72693 (_ BitVec 64) (_ BitVec 32)) Unit!36591)

(assert (=> b!1117166 (= lt!497557 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117167 () Bool)

(declare-fun e!636667 () Bool)

(declare-fun e!636672 () Bool)

(declare-fun mapRes!43633 () Bool)

(assert (=> b!1117167 (= e!636667 (and e!636672 mapRes!43633))))

(declare-fun condMapEmpty!43633 () Bool)

(declare-datatypes ((V!42297 0))(
  ( (V!42298 (val!13995 Int)) )
))
(declare-datatypes ((ValueCell!13229 0))(
  ( (ValueCellFull!13229 (v!16624 V!42297)) (EmptyCell!13229) )
))
(declare-datatypes ((array!72695 0))(
  ( (array!72696 (arr!34994 (Array (_ BitVec 32) ValueCell!13229)) (size!35531 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72695)

(declare-fun mapDefault!43633 () ValueCell!13229)

(assert (=> b!1117167 (= condMapEmpty!43633 (= (arr!34994 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13229)) mapDefault!43633)))))

(declare-fun b!1117168 () Bool)

(declare-fun res!745500 () Bool)

(assert (=> b!1117168 (=> (not res!745500) (not e!636671))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117168 (= res!745500 (and (= (size!35531 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35530 _keys!1208) (size!35531 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117169 () Bool)

(declare-fun res!745503 () Bool)

(assert (=> b!1117169 (=> (not res!745503) (not e!636671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117169 (= res!745503 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43633 () Bool)

(declare-fun tp!82877 () Bool)

(assert (=> mapNonEmpty!43633 (= mapRes!43633 (and tp!82877 e!636669))))

(declare-fun mapRest!43633 () (Array (_ BitVec 32) ValueCell!13229))

(declare-fun mapValue!43633 () ValueCell!13229)

(declare-fun mapKey!43633 () (_ BitVec 32))

(assert (=> mapNonEmpty!43633 (= (arr!34994 _values!996) (store mapRest!43633 mapKey!43633 mapValue!43633))))

(declare-fun b!1117170 () Bool)

(declare-fun res!745495 () Bool)

(assert (=> b!1117170 (=> (not res!745495) (not e!636670))))

(declare-datatypes ((List!24375 0))(
  ( (Nil!24372) (Cons!24371 (h!25589 (_ BitVec 64)) (t!34848 List!24375)) )
))
(declare-fun arrayNoDuplicates!0 (array!72693 (_ BitVec 32) List!24375) Bool)

(assert (=> b!1117170 (= res!745495 (arrayNoDuplicates!0 lt!497556 #b00000000000000000000000000000000 Nil!24372))))

(declare-fun b!1117171 () Bool)

(declare-fun res!745497 () Bool)

(assert (=> b!1117171 (=> (not res!745497) (not e!636671))))

(assert (=> b!1117171 (= res!745497 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24372))))

(declare-fun res!745504 () Bool)

(assert (=> start!97882 (=> (not res!745504) (not e!636671))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97882 (= res!745504 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35530 _keys!1208))))))

(assert (=> start!97882 e!636671))

(declare-fun array_inv!26962 (array!72693) Bool)

(assert (=> start!97882 (array_inv!26962 _keys!1208)))

(assert (=> start!97882 true))

(declare-fun array_inv!26963 (array!72695) Bool)

(assert (=> start!97882 (and (array_inv!26963 _values!996) e!636667)))

(declare-fun mapIsEmpty!43633 () Bool)

(assert (=> mapIsEmpty!43633 mapRes!43633))

(declare-fun b!1117172 () Bool)

(declare-fun res!745501 () Bool)

(assert (=> b!1117172 (=> (not res!745501) (not e!636671))))

(assert (=> b!1117172 (= res!745501 (= (select (arr!34993 _keys!1208) i!673) k0!934))))

(declare-fun b!1117173 () Bool)

(declare-fun res!745502 () Bool)

(assert (=> b!1117173 (=> (not res!745502) (not e!636671))))

(assert (=> b!1117173 (= res!745502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117174 () Bool)

(assert (=> b!1117174 (= e!636672 tp_is_empty!27877)))

(assert (= (and start!97882 res!745504) b!1117169))

(assert (= (and b!1117169 res!745503) b!1117168))

(assert (= (and b!1117168 res!745500) b!1117173))

(assert (= (and b!1117173 res!745502) b!1117171))

(assert (= (and b!1117171 res!745497) b!1117164))

(assert (= (and b!1117164 res!745498) b!1117162))

(assert (= (and b!1117162 res!745496) b!1117172))

(assert (= (and b!1117172 res!745501) b!1117165))

(assert (= (and b!1117165 res!745499) b!1117170))

(assert (= (and b!1117170 res!745495) b!1117166))

(assert (= (and b!1117167 condMapEmpty!43633) mapIsEmpty!43633))

(assert (= (and b!1117167 (not condMapEmpty!43633)) mapNonEmpty!43633))

(get-info :version)

(assert (= (and mapNonEmpty!43633 ((_ is ValueCellFull!13229) mapValue!43633)) b!1117163))

(assert (= (and b!1117167 ((_ is ValueCellFull!13229) mapDefault!43633)) b!1117174))

(assert (= start!97882 b!1117167))

(declare-fun m!1033917 () Bool)

(assert (=> b!1117170 m!1033917))

(declare-fun m!1033919 () Bool)

(assert (=> b!1117173 m!1033919))

(declare-fun m!1033921 () Bool)

(assert (=> b!1117162 m!1033921))

(declare-fun m!1033923 () Bool)

(assert (=> b!1117166 m!1033923))

(declare-fun m!1033925 () Bool)

(assert (=> b!1117166 m!1033925))

(declare-fun m!1033927 () Bool)

(assert (=> b!1117171 m!1033927))

(declare-fun m!1033929 () Bool)

(assert (=> mapNonEmpty!43633 m!1033929))

(declare-fun m!1033931 () Bool)

(assert (=> b!1117165 m!1033931))

(declare-fun m!1033933 () Bool)

(assert (=> b!1117165 m!1033933))

(declare-fun m!1033935 () Bool)

(assert (=> b!1117169 m!1033935))

(declare-fun m!1033937 () Bool)

(assert (=> start!97882 m!1033937))

(declare-fun m!1033939 () Bool)

(assert (=> start!97882 m!1033939))

(declare-fun m!1033941 () Bool)

(assert (=> b!1117172 m!1033941))

(check-sat (not b!1117162) (not b!1117166) (not b!1117171) (not b!1117165) (not b!1117173) (not mapNonEmpty!43633) (not b!1117170) (not start!97882) tp_is_empty!27877 (not b!1117169))
(check-sat)
