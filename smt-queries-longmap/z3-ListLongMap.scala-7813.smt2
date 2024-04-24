; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97858 () Bool)

(assert start!97858)

(declare-fun b!1116694 () Bool)

(declare-fun res!745140 () Bool)

(declare-fun e!636453 () Bool)

(assert (=> b!1116694 (=> (not res!745140) (not e!636453))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116694 (= res!745140 (validMask!0 mask!1564))))

(declare-fun b!1116695 () Bool)

(declare-fun res!745139 () Bool)

(assert (=> b!1116695 (=> (not res!745139) (not e!636453))))

(declare-datatypes ((array!72645 0))(
  ( (array!72646 (arr!34969 (Array (_ BitVec 32) (_ BitVec 64))) (size!35506 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72645)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1116695 (= res!745139 (= (select (arr!34969 _keys!1208) i!673) k0!934))))

(declare-fun b!1116696 () Bool)

(declare-fun res!745144 () Bool)

(assert (=> b!1116696 (=> (not res!745144) (not e!636453))))

(assert (=> b!1116696 (= res!745144 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35506 _keys!1208))))))

(declare-fun b!1116697 () Bool)

(declare-fun e!636455 () Bool)

(declare-fun tp_is_empty!27853 () Bool)

(assert (=> b!1116697 (= e!636455 tp_is_empty!27853)))

(declare-fun b!1116698 () Bool)

(declare-fun res!745135 () Bool)

(assert (=> b!1116698 (=> (not res!745135) (not e!636453))))

(declare-datatypes ((List!24365 0))(
  ( (Nil!24362) (Cons!24361 (h!25579 (_ BitVec 64)) (t!34838 List!24365)) )
))
(declare-fun arrayNoDuplicates!0 (array!72645 (_ BitVec 32) List!24365) Bool)

(assert (=> b!1116698 (= res!745135 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24362))))

(declare-fun b!1116699 () Bool)

(declare-fun e!636454 () Bool)

(assert (=> b!1116699 (= e!636453 e!636454)))

(declare-fun res!745142 () Bool)

(assert (=> b!1116699 (=> (not res!745142) (not e!636454))))

(declare-fun lt!497485 () array!72645)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72645 (_ BitVec 32)) Bool)

(assert (=> b!1116699 (= res!745142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497485 mask!1564))))

(assert (=> b!1116699 (= lt!497485 (array!72646 (store (arr!34969 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35506 _keys!1208)))))

(declare-fun b!1116700 () Bool)

(declare-fun e!636456 () Bool)

(assert (=> b!1116700 (= e!636456 tp_is_empty!27853)))

(declare-fun b!1116701 () Bool)

(declare-fun res!745137 () Bool)

(assert (=> b!1116701 (=> (not res!745137) (not e!636453))))

(assert (=> b!1116701 (= res!745137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116702 () Bool)

(assert (=> b!1116702 (= e!636454 (not true))))

(declare-fun arrayContainsKey!0 (array!72645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116702 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36573 0))(
  ( (Unit!36574) )
))
(declare-fun lt!497484 () Unit!36573)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72645 (_ BitVec 64) (_ BitVec 32)) Unit!36573)

(assert (=> b!1116702 (= lt!497484 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43597 () Bool)

(declare-fun mapRes!43597 () Bool)

(declare-fun tp!82841 () Bool)

(assert (=> mapNonEmpty!43597 (= mapRes!43597 (and tp!82841 e!636456))))

(declare-fun mapKey!43597 () (_ BitVec 32))

(declare-datatypes ((V!42265 0))(
  ( (V!42266 (val!13983 Int)) )
))
(declare-datatypes ((ValueCell!13217 0))(
  ( (ValueCellFull!13217 (v!16612 V!42265)) (EmptyCell!13217) )
))
(declare-datatypes ((array!72647 0))(
  ( (array!72648 (arr!34970 (Array (_ BitVec 32) ValueCell!13217)) (size!35507 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72647)

(declare-fun mapRest!43597 () (Array (_ BitVec 32) ValueCell!13217))

(declare-fun mapValue!43597 () ValueCell!13217)

(assert (=> mapNonEmpty!43597 (= (arr!34970 _values!996) (store mapRest!43597 mapKey!43597 mapValue!43597))))

(declare-fun mapIsEmpty!43597 () Bool)

(assert (=> mapIsEmpty!43597 mapRes!43597))

(declare-fun b!1116703 () Bool)

(declare-fun res!745141 () Bool)

(assert (=> b!1116703 (=> (not res!745141) (not e!636453))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116703 (= res!745141 (and (= (size!35507 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35506 _keys!1208) (size!35507 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116704 () Bool)

(declare-fun res!745143 () Bool)

(assert (=> b!1116704 (=> (not res!745143) (not e!636454))))

(assert (=> b!1116704 (= res!745143 (arrayNoDuplicates!0 lt!497485 #b00000000000000000000000000000000 Nil!24362))))

(declare-fun res!745138 () Bool)

(assert (=> start!97858 (=> (not res!745138) (not e!636453))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97858 (= res!745138 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35506 _keys!1208))))))

(assert (=> start!97858 e!636453))

(declare-fun array_inv!26944 (array!72645) Bool)

(assert (=> start!97858 (array_inv!26944 _keys!1208)))

(assert (=> start!97858 true))

(declare-fun e!636451 () Bool)

(declare-fun array_inv!26945 (array!72647) Bool)

(assert (=> start!97858 (and (array_inv!26945 _values!996) e!636451)))

(declare-fun b!1116705 () Bool)

(declare-fun res!745136 () Bool)

(assert (=> b!1116705 (=> (not res!745136) (not e!636453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116705 (= res!745136 (validKeyInArray!0 k0!934))))

(declare-fun b!1116706 () Bool)

(assert (=> b!1116706 (= e!636451 (and e!636455 mapRes!43597))))

(declare-fun condMapEmpty!43597 () Bool)

(declare-fun mapDefault!43597 () ValueCell!13217)

(assert (=> b!1116706 (= condMapEmpty!43597 (= (arr!34970 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13217)) mapDefault!43597)))))

(assert (= (and start!97858 res!745138) b!1116694))

(assert (= (and b!1116694 res!745140) b!1116703))

(assert (= (and b!1116703 res!745141) b!1116701))

(assert (= (and b!1116701 res!745137) b!1116698))

(assert (= (and b!1116698 res!745135) b!1116696))

(assert (= (and b!1116696 res!745144) b!1116705))

(assert (= (and b!1116705 res!745136) b!1116695))

(assert (= (and b!1116695 res!745139) b!1116699))

(assert (= (and b!1116699 res!745142) b!1116704))

(assert (= (and b!1116704 res!745143) b!1116702))

(assert (= (and b!1116706 condMapEmpty!43597) mapIsEmpty!43597))

(assert (= (and b!1116706 (not condMapEmpty!43597)) mapNonEmpty!43597))

(get-info :version)

(assert (= (and mapNonEmpty!43597 ((_ is ValueCellFull!13217) mapValue!43597)) b!1116700))

(assert (= (and b!1116706 ((_ is ValueCellFull!13217) mapDefault!43597)) b!1116697))

(assert (= start!97858 b!1116706))

(declare-fun m!1033605 () Bool)

(assert (=> b!1116694 m!1033605))

(declare-fun m!1033607 () Bool)

(assert (=> b!1116705 m!1033607))

(declare-fun m!1033609 () Bool)

(assert (=> mapNonEmpty!43597 m!1033609))

(declare-fun m!1033611 () Bool)

(assert (=> b!1116698 m!1033611))

(declare-fun m!1033613 () Bool)

(assert (=> b!1116702 m!1033613))

(declare-fun m!1033615 () Bool)

(assert (=> b!1116702 m!1033615))

(declare-fun m!1033617 () Bool)

(assert (=> b!1116701 m!1033617))

(declare-fun m!1033619 () Bool)

(assert (=> b!1116704 m!1033619))

(declare-fun m!1033621 () Bool)

(assert (=> b!1116695 m!1033621))

(declare-fun m!1033623 () Bool)

(assert (=> start!97858 m!1033623))

(declare-fun m!1033625 () Bool)

(assert (=> start!97858 m!1033625))

(declare-fun m!1033627 () Bool)

(assert (=> b!1116699 m!1033627))

(declare-fun m!1033629 () Bool)

(assert (=> b!1116699 m!1033629))

(check-sat (not b!1116704) (not b!1116699) (not b!1116701) tp_is_empty!27853 (not b!1116698) (not mapNonEmpty!43597) (not b!1116705) (not b!1116702) (not b!1116694) (not start!97858))
(check-sat)
