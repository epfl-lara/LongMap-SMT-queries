; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100358 () Bool)

(assert start!100358)

(declare-fun b!1197715 () Bool)

(declare-fun e!680378 () Bool)

(declare-fun e!680381 () Bool)

(assert (=> b!1197715 (= e!680378 e!680381)))

(declare-fun res!797114 () Bool)

(assert (=> b!1197715 (=> (not res!797114) (not e!680381))))

(declare-datatypes ((array!77526 0))(
  ( (array!77527 (arr!37409 (Array (_ BitVec 32) (_ BitVec 64))) (size!37947 (_ BitVec 32))) )
))
(declare-fun lt!543167 () array!77526)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77526 (_ BitVec 32)) Bool)

(assert (=> b!1197715 (= res!797114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543167 mask!1564))))

(declare-fun _keys!1208 () array!77526)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197715 (= lt!543167 (array!77527 (store (arr!37409 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37947 _keys!1208)))))

(declare-fun mapIsEmpty!47453 () Bool)

(declare-fun mapRes!47453 () Bool)

(assert (=> mapIsEmpty!47453 mapRes!47453))

(declare-fun b!1197716 () Bool)

(declare-fun res!797117 () Bool)

(assert (=> b!1197716 (=> (not res!797117) (not e!680378))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197716 (= res!797117 (validKeyInArray!0 k0!934))))

(declare-fun b!1197717 () Bool)

(declare-fun res!797113 () Bool)

(assert (=> b!1197717 (=> (not res!797113) (not e!680378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197717 (= res!797113 (validMask!0 mask!1564))))

(declare-fun b!1197718 () Bool)

(declare-fun res!797118 () Bool)

(assert (=> b!1197718 (=> (not res!797118) (not e!680378))))

(assert (=> b!1197718 (= res!797118 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37947 _keys!1208))))))

(declare-fun b!1197719 () Bool)

(declare-fun e!680377 () Bool)

(declare-fun tp_is_empty!30409 () Bool)

(assert (=> b!1197719 (= e!680377 tp_is_empty!30409)))

(declare-fun res!797111 () Bool)

(assert (=> start!100358 (=> (not res!797111) (not e!680378))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100358 (= res!797111 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37947 _keys!1208))))))

(assert (=> start!100358 e!680378))

(declare-fun array_inv!28630 (array!77526) Bool)

(assert (=> start!100358 (array_inv!28630 _keys!1208)))

(assert (=> start!100358 true))

(declare-datatypes ((V!45673 0))(
  ( (V!45674 (val!15261 Int)) )
))
(declare-datatypes ((ValueCell!14495 0))(
  ( (ValueCellFull!14495 (v!17898 V!45673)) (EmptyCell!14495) )
))
(declare-datatypes ((array!77528 0))(
  ( (array!77529 (arr!37410 (Array (_ BitVec 32) ValueCell!14495)) (size!37948 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77528)

(declare-fun e!680380 () Bool)

(declare-fun array_inv!28631 (array!77528) Bool)

(assert (=> start!100358 (and (array_inv!28631 _values!996) e!680380)))

(declare-fun b!1197720 () Bool)

(declare-fun e!680379 () Bool)

(assert (=> b!1197720 (= e!680379 tp_is_empty!30409)))

(declare-fun b!1197721 () Bool)

(declare-fun res!797112 () Bool)

(assert (=> b!1197721 (=> (not res!797112) (not e!680378))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197721 (= res!797112 (and (= (size!37948 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37947 _keys!1208) (size!37948 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47453 () Bool)

(declare-fun tp!90108 () Bool)

(assert (=> mapNonEmpty!47453 (= mapRes!47453 (and tp!90108 e!680377))))

(declare-fun mapValue!47453 () ValueCell!14495)

(declare-fun mapKey!47453 () (_ BitVec 32))

(declare-fun mapRest!47453 () (Array (_ BitVec 32) ValueCell!14495))

(assert (=> mapNonEmpty!47453 (= (arr!37410 _values!996) (store mapRest!47453 mapKey!47453 mapValue!47453))))

(declare-fun b!1197722 () Bool)

(assert (=> b!1197722 (= e!680381 (not (or (bvsle from!1455 i!673) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37947 _keys!1208)) (bvslt i!673 (size!37948 _values!996)))))))

(declare-fun arrayContainsKey!0 (array!77526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197722 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39575 0))(
  ( (Unit!39576) )
))
(declare-fun lt!543168 () Unit!39575)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77526 (_ BitVec 64) (_ BitVec 32)) Unit!39575)

(assert (=> b!1197722 (= lt!543168 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197723 () Bool)

(declare-fun res!797115 () Bool)

(assert (=> b!1197723 (=> (not res!797115) (not e!680378))))

(assert (=> b!1197723 (= res!797115 (= (select (arr!37409 _keys!1208) i!673) k0!934))))

(declare-fun b!1197724 () Bool)

(assert (=> b!1197724 (= e!680380 (and e!680379 mapRes!47453))))

(declare-fun condMapEmpty!47453 () Bool)

(declare-fun mapDefault!47453 () ValueCell!14495)

(assert (=> b!1197724 (= condMapEmpty!47453 (= (arr!37410 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14495)) mapDefault!47453)))))

(declare-fun b!1197725 () Bool)

(declare-fun res!797110 () Bool)

(assert (=> b!1197725 (=> (not res!797110) (not e!680381))))

(declare-datatypes ((List!26408 0))(
  ( (Nil!26405) (Cons!26404 (h!27613 (_ BitVec 64)) (t!39100 List!26408)) )
))
(declare-fun arrayNoDuplicates!0 (array!77526 (_ BitVec 32) List!26408) Bool)

(assert (=> b!1197725 (= res!797110 (arrayNoDuplicates!0 lt!543167 #b00000000000000000000000000000000 Nil!26405))))

(declare-fun b!1197726 () Bool)

(declare-fun res!797116 () Bool)

(assert (=> b!1197726 (=> (not res!797116) (not e!680378))))

(assert (=> b!1197726 (= res!797116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197727 () Bool)

(declare-fun res!797109 () Bool)

(assert (=> b!1197727 (=> (not res!797109) (not e!680378))))

(assert (=> b!1197727 (= res!797109 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26405))))

(assert (= (and start!100358 res!797111) b!1197717))

(assert (= (and b!1197717 res!797113) b!1197721))

(assert (= (and b!1197721 res!797112) b!1197726))

(assert (= (and b!1197726 res!797116) b!1197727))

(assert (= (and b!1197727 res!797109) b!1197718))

(assert (= (and b!1197718 res!797118) b!1197716))

(assert (= (and b!1197716 res!797117) b!1197723))

(assert (= (and b!1197723 res!797115) b!1197715))

(assert (= (and b!1197715 res!797114) b!1197725))

(assert (= (and b!1197725 res!797110) b!1197722))

(assert (= (and b!1197724 condMapEmpty!47453) mapIsEmpty!47453))

(assert (= (and b!1197724 (not condMapEmpty!47453)) mapNonEmpty!47453))

(get-info :version)

(assert (= (and mapNonEmpty!47453 ((_ is ValueCellFull!14495) mapValue!47453)) b!1197719))

(assert (= (and b!1197724 ((_ is ValueCellFull!14495) mapDefault!47453)) b!1197720))

(assert (= start!100358 b!1197724))

(declare-fun m!1104153 () Bool)

(assert (=> b!1197717 m!1104153))

(declare-fun m!1104155 () Bool)

(assert (=> b!1197725 m!1104155))

(declare-fun m!1104157 () Bool)

(assert (=> b!1197726 m!1104157))

(declare-fun m!1104159 () Bool)

(assert (=> mapNonEmpty!47453 m!1104159))

(declare-fun m!1104161 () Bool)

(assert (=> b!1197715 m!1104161))

(declare-fun m!1104163 () Bool)

(assert (=> b!1197715 m!1104163))

(declare-fun m!1104165 () Bool)

(assert (=> b!1197727 m!1104165))

(declare-fun m!1104167 () Bool)

(assert (=> b!1197716 m!1104167))

(declare-fun m!1104169 () Bool)

(assert (=> start!100358 m!1104169))

(declare-fun m!1104171 () Bool)

(assert (=> start!100358 m!1104171))

(declare-fun m!1104173 () Bool)

(assert (=> b!1197722 m!1104173))

(declare-fun m!1104175 () Bool)

(assert (=> b!1197722 m!1104175))

(declare-fun m!1104177 () Bool)

(assert (=> b!1197723 m!1104177))

(check-sat (not b!1197716) (not b!1197722) (not b!1197725) (not b!1197727) tp_is_empty!30409 (not b!1197715) (not mapNonEmpty!47453) (not b!1197717) (not start!100358) (not b!1197726))
(check-sat)
