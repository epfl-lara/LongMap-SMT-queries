; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100348 () Bool)

(assert start!100348)

(declare-fun b!1197527 () Bool)

(declare-fun e!680311 () Bool)

(declare-fun e!680315 () Bool)

(assert (=> b!1197527 (= e!680311 e!680315)))

(declare-fun res!796942 () Bool)

(assert (=> b!1197527 (=> (not res!796942) (not e!680315))))

(declare-datatypes ((array!77565 0))(
  ( (array!77566 (arr!37428 (Array (_ BitVec 32) (_ BitVec 64))) (size!37964 (_ BitVec 32))) )
))
(declare-fun lt!543311 () array!77565)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77565 (_ BitVec 32)) Bool)

(assert (=> b!1197527 (= res!796942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543311 mask!1564))))

(declare-fun _keys!1208 () array!77565)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197527 (= lt!543311 (array!77566 (store (arr!37428 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37964 _keys!1208)))))

(declare-fun b!1197528 () Bool)

(declare-fun e!680314 () Bool)

(declare-fun e!680313 () Bool)

(declare-fun mapRes!47429 () Bool)

(assert (=> b!1197528 (= e!680314 (and e!680313 mapRes!47429))))

(declare-fun condMapEmpty!47429 () Bool)

(declare-datatypes ((V!45651 0))(
  ( (V!45652 (val!15253 Int)) )
))
(declare-datatypes ((ValueCell!14487 0))(
  ( (ValueCellFull!14487 (v!17891 V!45651)) (EmptyCell!14487) )
))
(declare-datatypes ((array!77567 0))(
  ( (array!77568 (arr!37429 (Array (_ BitVec 32) ValueCell!14487)) (size!37965 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77567)

(declare-fun mapDefault!47429 () ValueCell!14487)

(assert (=> b!1197528 (= condMapEmpty!47429 (= (arr!37429 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14487)) mapDefault!47429)))))

(declare-fun mapNonEmpty!47429 () Bool)

(declare-fun tp!90084 () Bool)

(declare-fun e!680312 () Bool)

(assert (=> mapNonEmpty!47429 (= mapRes!47429 (and tp!90084 e!680312))))

(declare-fun mapKey!47429 () (_ BitVec 32))

(declare-fun mapRest!47429 () (Array (_ BitVec 32) ValueCell!14487))

(declare-fun mapValue!47429 () ValueCell!14487)

(assert (=> mapNonEmpty!47429 (= (arr!37429 _values!996) (store mapRest!47429 mapKey!47429 mapValue!47429))))

(declare-fun b!1197529 () Bool)

(declare-fun res!796935 () Bool)

(assert (=> b!1197529 (=> (not res!796935) (not e!680311))))

(assert (=> b!1197529 (= res!796935 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37964 _keys!1208))))))

(declare-fun b!1197530 () Bool)

(declare-fun res!796939 () Bool)

(assert (=> b!1197530 (=> (not res!796939) (not e!680311))))

(assert (=> b!1197530 (= res!796939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197531 () Bool)

(declare-fun tp_is_empty!30393 () Bool)

(assert (=> b!1197531 (= e!680313 tp_is_empty!30393)))

(declare-fun b!1197532 () Bool)

(declare-fun res!796943 () Bool)

(assert (=> b!1197532 (=> (not res!796943) (not e!680311))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197532 (= res!796943 (validKeyInArray!0 k0!934))))

(declare-fun b!1197533 () Bool)

(assert (=> b!1197533 (= e!680315 (not true))))

(declare-fun arrayContainsKey!0 (array!77565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197533 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39704 0))(
  ( (Unit!39705) )
))
(declare-fun lt!543312 () Unit!39704)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77565 (_ BitVec 64) (_ BitVec 32)) Unit!39704)

(assert (=> b!1197533 (= lt!543312 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!796938 () Bool)

(assert (=> start!100348 (=> (not res!796938) (not e!680311))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100348 (= res!796938 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37964 _keys!1208))))))

(assert (=> start!100348 e!680311))

(declare-fun array_inv!28526 (array!77565) Bool)

(assert (=> start!100348 (array_inv!28526 _keys!1208)))

(assert (=> start!100348 true))

(declare-fun array_inv!28527 (array!77567) Bool)

(assert (=> start!100348 (and (array_inv!28527 _values!996) e!680314)))

(declare-fun mapIsEmpty!47429 () Bool)

(assert (=> mapIsEmpty!47429 mapRes!47429))

(declare-fun b!1197534 () Bool)

(declare-fun res!796944 () Bool)

(assert (=> b!1197534 (=> (not res!796944) (not e!680315))))

(declare-datatypes ((List!26335 0))(
  ( (Nil!26332) (Cons!26331 (h!27540 (_ BitVec 64)) (t!39036 List!26335)) )
))
(declare-fun arrayNoDuplicates!0 (array!77565 (_ BitVec 32) List!26335) Bool)

(assert (=> b!1197534 (= res!796944 (arrayNoDuplicates!0 lt!543311 #b00000000000000000000000000000000 Nil!26332))))

(declare-fun b!1197535 () Bool)

(declare-fun res!796937 () Bool)

(assert (=> b!1197535 (=> (not res!796937) (not e!680311))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197535 (= res!796937 (and (= (size!37965 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37964 _keys!1208) (size!37965 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197536 () Bool)

(assert (=> b!1197536 (= e!680312 tp_is_empty!30393)))

(declare-fun b!1197537 () Bool)

(declare-fun res!796940 () Bool)

(assert (=> b!1197537 (=> (not res!796940) (not e!680311))))

(assert (=> b!1197537 (= res!796940 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26332))))

(declare-fun b!1197538 () Bool)

(declare-fun res!796941 () Bool)

(assert (=> b!1197538 (=> (not res!796941) (not e!680311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197538 (= res!796941 (validMask!0 mask!1564))))

(declare-fun b!1197539 () Bool)

(declare-fun res!796936 () Bool)

(assert (=> b!1197539 (=> (not res!796936) (not e!680311))))

(assert (=> b!1197539 (= res!796936 (= (select (arr!37428 _keys!1208) i!673) k0!934))))

(assert (= (and start!100348 res!796938) b!1197538))

(assert (= (and b!1197538 res!796941) b!1197535))

(assert (= (and b!1197535 res!796937) b!1197530))

(assert (= (and b!1197530 res!796939) b!1197537))

(assert (= (and b!1197537 res!796940) b!1197529))

(assert (= (and b!1197529 res!796935) b!1197532))

(assert (= (and b!1197532 res!796943) b!1197539))

(assert (= (and b!1197539 res!796936) b!1197527))

(assert (= (and b!1197527 res!796942) b!1197534))

(assert (= (and b!1197534 res!796944) b!1197533))

(assert (= (and b!1197528 condMapEmpty!47429) mapIsEmpty!47429))

(assert (= (and b!1197528 (not condMapEmpty!47429)) mapNonEmpty!47429))

(get-info :version)

(assert (= (and mapNonEmpty!47429 ((_ is ValueCellFull!14487) mapValue!47429)) b!1197536))

(assert (= (and b!1197528 ((_ is ValueCellFull!14487) mapDefault!47429)) b!1197531))

(assert (= start!100348 b!1197528))

(declare-fun m!1104555 () Bool)

(assert (=> b!1197533 m!1104555))

(declare-fun m!1104557 () Bool)

(assert (=> b!1197533 m!1104557))

(declare-fun m!1104559 () Bool)

(assert (=> b!1197530 m!1104559))

(declare-fun m!1104561 () Bool)

(assert (=> mapNonEmpty!47429 m!1104561))

(declare-fun m!1104563 () Bool)

(assert (=> b!1197534 m!1104563))

(declare-fun m!1104565 () Bool)

(assert (=> start!100348 m!1104565))

(declare-fun m!1104567 () Bool)

(assert (=> start!100348 m!1104567))

(declare-fun m!1104569 () Bool)

(assert (=> b!1197539 m!1104569))

(declare-fun m!1104571 () Bool)

(assert (=> b!1197537 m!1104571))

(declare-fun m!1104573 () Bool)

(assert (=> b!1197532 m!1104573))

(declare-fun m!1104575 () Bool)

(assert (=> b!1197538 m!1104575))

(declare-fun m!1104577 () Bool)

(assert (=> b!1197527 m!1104577))

(declare-fun m!1104579 () Bool)

(assert (=> b!1197527 m!1104579))

(check-sat (not b!1197538) (not start!100348) tp_is_empty!30393 (not mapNonEmpty!47429) (not b!1197537) (not b!1197530) (not b!1197534) (not b!1197527) (not b!1197532) (not b!1197533))
(check-sat)
