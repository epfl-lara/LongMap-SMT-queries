; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100326 () Bool)

(assert start!100326)

(declare-fun b!1194680 () Bool)

(declare-fun res!794481 () Bool)

(declare-fun e!679100 () Bool)

(assert (=> b!1194680 (=> (not res!794481) (not e!679100))))

(declare-datatypes ((array!77221 0))(
  ( (array!77222 (arr!37254 (Array (_ BitVec 32) (_ BitVec 64))) (size!37791 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77221)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77221 (_ BitVec 32)) Bool)

(assert (=> b!1194680 (= res!794481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194681 () Bool)

(declare-fun res!794487 () Bool)

(assert (=> b!1194681 (=> (not res!794487) (not e!679100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194681 (= res!794487 (validMask!0 mask!1564))))

(declare-fun b!1194682 () Bool)

(declare-fun e!679096 () Bool)

(assert (=> b!1194682 (= e!679096 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194682 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39571 0))(
  ( (Unit!39572) )
))
(declare-fun lt!543057 () Unit!39571)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77221 (_ BitVec 64) (_ BitVec 32)) Unit!39571)

(assert (=> b!1194682 (= lt!543057 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1194683 () Bool)

(declare-fun res!794486 () Bool)

(assert (=> b!1194683 (=> (not res!794486) (not e!679100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194683 (= res!794486 (validKeyInArray!0 k0!934))))

(declare-fun b!1194685 () Bool)

(assert (=> b!1194685 (= e!679100 e!679096)))

(declare-fun res!794484 () Bool)

(assert (=> b!1194685 (=> (not res!794484) (not e!679096))))

(declare-fun lt!543058 () array!77221)

(assert (=> b!1194685 (= res!794484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543058 mask!1564))))

(assert (=> b!1194685 (= lt!543058 (array!77222 (store (arr!37254 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37791 _keys!1208)))))

(declare-fun b!1194686 () Bool)

(declare-fun res!794488 () Bool)

(assert (=> b!1194686 (=> (not res!794488) (not e!679096))))

(declare-datatypes ((List!26265 0))(
  ( (Nil!26262) (Cons!26261 (h!27479 (_ BitVec 64)) (t!38916 List!26265)) )
))
(declare-fun arrayNoDuplicates!0 (array!77221 (_ BitVec 32) List!26265) Bool)

(assert (=> b!1194686 (= res!794488 (arrayNoDuplicates!0 lt!543058 #b00000000000000000000000000000000 Nil!26262))))

(declare-fun b!1194687 () Bool)

(declare-fun e!679099 () Bool)

(declare-fun tp_is_empty!30199 () Bool)

(assert (=> b!1194687 (= e!679099 tp_is_empty!30199)))

(declare-fun mapIsEmpty!47126 () Bool)

(declare-fun mapRes!47126 () Bool)

(assert (=> mapIsEmpty!47126 mapRes!47126))

(declare-fun b!1194688 () Bool)

(declare-fun res!794489 () Bool)

(assert (=> b!1194688 (=> (not res!794489) (not e!679100))))

(assert (=> b!1194688 (= res!794489 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37791 _keys!1208))))))

(declare-fun b!1194689 () Bool)

(declare-fun e!679095 () Bool)

(assert (=> b!1194689 (= e!679095 (and e!679099 mapRes!47126))))

(declare-fun condMapEmpty!47126 () Bool)

(declare-datatypes ((V!45393 0))(
  ( (V!45394 (val!15156 Int)) )
))
(declare-datatypes ((ValueCell!14390 0))(
  ( (ValueCellFull!14390 (v!17790 V!45393)) (EmptyCell!14390) )
))
(declare-datatypes ((array!77223 0))(
  ( (array!77224 (arr!37255 (Array (_ BitVec 32) ValueCell!14390)) (size!37792 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77223)

(declare-fun mapDefault!47126 () ValueCell!14390)

(assert (=> b!1194689 (= condMapEmpty!47126 (= (arr!37255 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14390)) mapDefault!47126)))))

(declare-fun b!1194684 () Bool)

(declare-fun res!794485 () Bool)

(assert (=> b!1194684 (=> (not res!794485) (not e!679100))))

(assert (=> b!1194684 (= res!794485 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26262))))

(declare-fun res!794480 () Bool)

(assert (=> start!100326 (=> (not res!794480) (not e!679100))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100326 (= res!794480 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37791 _keys!1208))))))

(assert (=> start!100326 e!679100))

(declare-fun array_inv!28472 (array!77221) Bool)

(assert (=> start!100326 (array_inv!28472 _keys!1208)))

(assert (=> start!100326 true))

(declare-fun array_inv!28473 (array!77223) Bool)

(assert (=> start!100326 (and (array_inv!28473 _values!996) e!679095)))

(declare-fun b!1194690 () Bool)

(declare-fun res!794483 () Bool)

(assert (=> b!1194690 (=> (not res!794483) (not e!679100))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194690 (= res!794483 (and (= (size!37792 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37791 _keys!1208) (size!37792 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47126 () Bool)

(declare-fun tp!89718 () Bool)

(declare-fun e!679098 () Bool)

(assert (=> mapNonEmpty!47126 (= mapRes!47126 (and tp!89718 e!679098))))

(declare-fun mapKey!47126 () (_ BitVec 32))

(declare-fun mapValue!47126 () ValueCell!14390)

(declare-fun mapRest!47126 () (Array (_ BitVec 32) ValueCell!14390))

(assert (=> mapNonEmpty!47126 (= (arr!37255 _values!996) (store mapRest!47126 mapKey!47126 mapValue!47126))))

(declare-fun b!1194691 () Bool)

(assert (=> b!1194691 (= e!679098 tp_is_empty!30199)))

(declare-fun b!1194692 () Bool)

(declare-fun res!794482 () Bool)

(assert (=> b!1194692 (=> (not res!794482) (not e!679100))))

(assert (=> b!1194692 (= res!794482 (= (select (arr!37254 _keys!1208) i!673) k0!934))))

(assert (= (and start!100326 res!794480) b!1194681))

(assert (= (and b!1194681 res!794487) b!1194690))

(assert (= (and b!1194690 res!794483) b!1194680))

(assert (= (and b!1194680 res!794481) b!1194684))

(assert (= (and b!1194684 res!794485) b!1194688))

(assert (= (and b!1194688 res!794489) b!1194683))

(assert (= (and b!1194683 res!794486) b!1194692))

(assert (= (and b!1194692 res!794482) b!1194685))

(assert (= (and b!1194685 res!794484) b!1194686))

(assert (= (and b!1194686 res!794488) b!1194682))

(assert (= (and b!1194689 condMapEmpty!47126) mapIsEmpty!47126))

(assert (= (and b!1194689 (not condMapEmpty!47126)) mapNonEmpty!47126))

(get-info :version)

(assert (= (and mapNonEmpty!47126 ((_ is ValueCellFull!14390) mapValue!47126)) b!1194691))

(assert (= (and b!1194689 ((_ is ValueCellFull!14390) mapDefault!47126)) b!1194687))

(assert (= start!100326 b!1194689))

(declare-fun m!1103223 () Bool)

(assert (=> b!1194684 m!1103223))

(declare-fun m!1103225 () Bool)

(assert (=> b!1194681 m!1103225))

(declare-fun m!1103227 () Bool)

(assert (=> start!100326 m!1103227))

(declare-fun m!1103229 () Bool)

(assert (=> start!100326 m!1103229))

(declare-fun m!1103231 () Bool)

(assert (=> b!1194680 m!1103231))

(declare-fun m!1103233 () Bool)

(assert (=> b!1194692 m!1103233))

(declare-fun m!1103235 () Bool)

(assert (=> b!1194683 m!1103235))

(declare-fun m!1103237 () Bool)

(assert (=> b!1194685 m!1103237))

(declare-fun m!1103239 () Bool)

(assert (=> b!1194685 m!1103239))

(declare-fun m!1103241 () Bool)

(assert (=> b!1194686 m!1103241))

(declare-fun m!1103243 () Bool)

(assert (=> b!1194682 m!1103243))

(declare-fun m!1103245 () Bool)

(assert (=> b!1194682 m!1103245))

(declare-fun m!1103247 () Bool)

(assert (=> mapNonEmpty!47126 m!1103247))

(check-sat (not b!1194684) (not b!1194680) (not b!1194683) (not b!1194682) tp_is_empty!30199 (not mapNonEmpty!47126) (not b!1194686) (not b!1194685) (not b!1194681) (not start!100326))
(check-sat)
