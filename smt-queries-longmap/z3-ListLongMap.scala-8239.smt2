; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100600 () Bool)

(assert start!100600)

(declare-fun b!1199128 () Bool)

(declare-fun res!797691 () Bool)

(declare-fun e!681291 () Bool)

(assert (=> b!1199128 (=> (not res!797691) (not e!681291))))

(declare-datatypes ((array!77631 0))(
  ( (array!77632 (arr!37455 (Array (_ BitVec 32) (_ BitVec 64))) (size!37992 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77631)

(declare-datatypes ((List!26363 0))(
  ( (Nil!26360) (Cons!26359 (h!27577 (_ BitVec 64)) (t!39056 List!26363)) )
))
(declare-fun arrayNoDuplicates!0 (array!77631 (_ BitVec 32) List!26363) Bool)

(assert (=> b!1199128 (= res!797691 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26360))))

(declare-fun b!1199129 () Bool)

(declare-fun e!681290 () Bool)

(declare-fun tp_is_empty!30409 () Bool)

(assert (=> b!1199129 (= e!681290 tp_is_empty!30409)))

(declare-fun mapNonEmpty!47453 () Bool)

(declare-fun mapRes!47453 () Bool)

(declare-fun tp!90108 () Bool)

(assert (=> mapNonEmpty!47453 (= mapRes!47453 (and tp!90108 e!681290))))

(declare-datatypes ((V!45673 0))(
  ( (V!45674 (val!15261 Int)) )
))
(declare-datatypes ((ValueCell!14495 0))(
  ( (ValueCellFull!14495 (v!17895 V!45673)) (EmptyCell!14495) )
))
(declare-fun mapRest!47453 () (Array (_ BitVec 32) ValueCell!14495))

(declare-fun mapValue!47453 () ValueCell!14495)

(declare-fun mapKey!47453 () (_ BitVec 32))

(declare-datatypes ((array!77633 0))(
  ( (array!77634 (arr!37456 (Array (_ BitVec 32) ValueCell!14495)) (size!37993 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77633)

(assert (=> mapNonEmpty!47453 (= (arr!37456 _values!996) (store mapRest!47453 mapKey!47453 mapValue!47453))))

(declare-fun b!1199130 () Bool)

(declare-fun res!797688 () Bool)

(assert (=> b!1199130 (=> (not res!797688) (not e!681291))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199130 (= res!797688 (validMask!0 mask!1564))))

(declare-fun b!1199131 () Bool)

(declare-fun e!681286 () Bool)

(declare-fun e!681287 () Bool)

(assert (=> b!1199131 (= e!681286 (and e!681287 mapRes!47453))))

(declare-fun condMapEmpty!47453 () Bool)

(declare-fun mapDefault!47453 () ValueCell!14495)

(assert (=> b!1199131 (= condMapEmpty!47453 (= (arr!37456 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14495)) mapDefault!47453)))))

(declare-fun b!1199132 () Bool)

(declare-fun res!797686 () Bool)

(assert (=> b!1199132 (=> (not res!797686) (not e!681291))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199132 (= res!797686 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37992 _keys!1208))))))

(declare-fun b!1199133 () Bool)

(declare-fun res!797692 () Bool)

(assert (=> b!1199133 (=> (not res!797692) (not e!681291))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1199133 (= res!797692 (and (= (size!37993 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37992 _keys!1208) (size!37993 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!797684 () Bool)

(assert (=> start!100600 (=> (not res!797684) (not e!681291))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100600 (= res!797684 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37992 _keys!1208))))))

(assert (=> start!100600 e!681291))

(declare-fun array_inv!28616 (array!77631) Bool)

(assert (=> start!100600 (array_inv!28616 _keys!1208)))

(assert (=> start!100600 true))

(declare-fun array_inv!28617 (array!77633) Bool)

(assert (=> start!100600 (and (array_inv!28617 _values!996) e!681286)))

(declare-fun b!1199134 () Bool)

(declare-fun res!797690 () Bool)

(assert (=> b!1199134 (=> (not res!797690) (not e!681291))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1199134 (= res!797690 (= (select (arr!37455 _keys!1208) i!673) k0!934))))

(declare-fun b!1199135 () Bool)

(declare-fun e!681289 () Bool)

(assert (=> b!1199135 (= e!681291 e!681289)))

(declare-fun res!797687 () Bool)

(assert (=> b!1199135 (=> (not res!797687) (not e!681289))))

(declare-fun lt!543844 () array!77631)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77631 (_ BitVec 32)) Bool)

(assert (=> b!1199135 (= res!797687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543844 mask!1564))))

(assert (=> b!1199135 (= lt!543844 (array!77632 (store (arr!37455 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37992 _keys!1208)))))

(declare-fun b!1199136 () Bool)

(declare-fun res!797685 () Bool)

(assert (=> b!1199136 (=> (not res!797685) (not e!681291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199136 (= res!797685 (validKeyInArray!0 k0!934))))

(declare-fun b!1199137 () Bool)

(declare-fun res!797683 () Bool)

(assert (=> b!1199137 (=> (not res!797683) (not e!681289))))

(assert (=> b!1199137 (= res!797683 (arrayNoDuplicates!0 lt!543844 #b00000000000000000000000000000000 Nil!26360))))

(declare-fun b!1199138 () Bool)

(declare-fun res!797689 () Bool)

(assert (=> b!1199138 (=> (not res!797689) (not e!681291))))

(assert (=> b!1199138 (= res!797689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199139 () Bool)

(assert (=> b!1199139 (= e!681287 tp_is_empty!30409)))

(declare-fun mapIsEmpty!47453 () Bool)

(assert (=> mapIsEmpty!47453 mapRes!47453))

(declare-fun b!1199140 () Bool)

(assert (=> b!1199140 (= e!681289 (not (or (bvsle from!1455 i!673) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37992 _keys!1208)) (bvslt i!673 (size!37993 _values!996)))))))

(declare-fun arrayContainsKey!0 (array!77631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199140 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39685 0))(
  ( (Unit!39686) )
))
(declare-fun lt!543843 () Unit!39685)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77631 (_ BitVec 64) (_ BitVec 32)) Unit!39685)

(assert (=> b!1199140 (= lt!543843 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100600 res!797684) b!1199130))

(assert (= (and b!1199130 res!797688) b!1199133))

(assert (= (and b!1199133 res!797692) b!1199138))

(assert (= (and b!1199138 res!797689) b!1199128))

(assert (= (and b!1199128 res!797691) b!1199132))

(assert (= (and b!1199132 res!797686) b!1199136))

(assert (= (and b!1199136 res!797685) b!1199134))

(assert (= (and b!1199134 res!797690) b!1199135))

(assert (= (and b!1199135 res!797687) b!1199137))

(assert (= (and b!1199137 res!797683) b!1199140))

(assert (= (and b!1199131 condMapEmpty!47453) mapIsEmpty!47453))

(assert (= (and b!1199131 (not condMapEmpty!47453)) mapNonEmpty!47453))

(get-info :version)

(assert (= (and mapNonEmpty!47453 ((_ is ValueCellFull!14495) mapValue!47453)) b!1199129))

(assert (= (and b!1199131 ((_ is ValueCellFull!14495) mapDefault!47453)) b!1199139))

(assert (= start!100600 b!1199131))

(declare-fun m!1106335 () Bool)

(assert (=> b!1199136 m!1106335))

(declare-fun m!1106337 () Bool)

(assert (=> b!1199140 m!1106337))

(declare-fun m!1106339 () Bool)

(assert (=> b!1199140 m!1106339))

(declare-fun m!1106341 () Bool)

(assert (=> b!1199134 m!1106341))

(declare-fun m!1106343 () Bool)

(assert (=> b!1199138 m!1106343))

(declare-fun m!1106345 () Bool)

(assert (=> b!1199130 m!1106345))

(declare-fun m!1106347 () Bool)

(assert (=> b!1199135 m!1106347))

(declare-fun m!1106349 () Bool)

(assert (=> b!1199135 m!1106349))

(declare-fun m!1106351 () Bool)

(assert (=> b!1199128 m!1106351))

(declare-fun m!1106353 () Bool)

(assert (=> b!1199137 m!1106353))

(declare-fun m!1106355 () Bool)

(assert (=> mapNonEmpty!47453 m!1106355))

(declare-fun m!1106357 () Bool)

(assert (=> start!100600 m!1106357))

(declare-fun m!1106359 () Bool)

(assert (=> start!100600 m!1106359))

(check-sat tp_is_empty!30409 (not b!1199130) (not b!1199140) (not b!1199136) (not b!1199138) (not mapNonEmpty!47453) (not b!1199137) (not b!1199135) (not start!100600) (not b!1199128))
(check-sat)
