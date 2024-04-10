; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100354 () Bool)

(assert start!100354)

(declare-fun mapIsEmpty!47438 () Bool)

(declare-fun mapRes!47438 () Bool)

(assert (=> mapIsEmpty!47438 mapRes!47438))

(declare-fun res!797030 () Bool)

(declare-fun e!680365 () Bool)

(assert (=> start!100354 (=> (not res!797030) (not e!680365))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77575 0))(
  ( (array!77576 (arr!37433 (Array (_ BitVec 32) (_ BitVec 64))) (size!37969 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77575)

(assert (=> start!100354 (= res!797030 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37969 _keys!1208))))))

(assert (=> start!100354 e!680365))

(declare-fun array_inv!28530 (array!77575) Bool)

(assert (=> start!100354 (array_inv!28530 _keys!1208)))

(assert (=> start!100354 true))

(declare-datatypes ((V!45659 0))(
  ( (V!45660 (val!15256 Int)) )
))
(declare-datatypes ((ValueCell!14490 0))(
  ( (ValueCellFull!14490 (v!17894 V!45659)) (EmptyCell!14490) )
))
(declare-datatypes ((array!77577 0))(
  ( (array!77578 (arr!37434 (Array (_ BitVec 32) ValueCell!14490)) (size!37970 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77577)

(declare-fun e!680366 () Bool)

(declare-fun array_inv!28531 (array!77577) Bool)

(assert (=> start!100354 (and (array_inv!28531 _values!996) e!680366)))

(declare-fun b!1197644 () Bool)

(declare-fun res!797029 () Bool)

(assert (=> b!1197644 (=> (not res!797029) (not e!680365))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197644 (= res!797029 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37969 _keys!1208))))))

(declare-fun b!1197645 () Bool)

(declare-fun res!797025 () Bool)

(assert (=> b!1197645 (=> (not res!797025) (not e!680365))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197645 (= res!797025 (validMask!0 mask!1564))))

(declare-fun b!1197646 () Bool)

(declare-fun e!680369 () Bool)

(assert (=> b!1197646 (= e!680365 e!680369)))

(declare-fun res!797028 () Bool)

(assert (=> b!1197646 (=> (not res!797028) (not e!680369))))

(declare-fun lt!543330 () array!77575)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77575 (_ BitVec 32)) Bool)

(assert (=> b!1197646 (= res!797028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543330 mask!1564))))

(assert (=> b!1197646 (= lt!543330 (array!77576 (store (arr!37433 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37969 _keys!1208)))))

(declare-fun b!1197647 () Bool)

(declare-fun res!797032 () Bool)

(assert (=> b!1197647 (=> (not res!797032) (not e!680365))))

(assert (=> b!1197647 (= res!797032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197648 () Bool)

(assert (=> b!1197648 (= e!680369 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197648 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39708 0))(
  ( (Unit!39709) )
))
(declare-fun lt!543329 () Unit!39708)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77575 (_ BitVec 64) (_ BitVec 32)) Unit!39708)

(assert (=> b!1197648 (= lt!543329 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197649 () Bool)

(declare-fun e!680364 () Bool)

(assert (=> b!1197649 (= e!680366 (and e!680364 mapRes!47438))))

(declare-fun condMapEmpty!47438 () Bool)

(declare-fun mapDefault!47438 () ValueCell!14490)

(assert (=> b!1197649 (= condMapEmpty!47438 (= (arr!37434 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14490)) mapDefault!47438)))))

(declare-fun mapNonEmpty!47438 () Bool)

(declare-fun tp!90093 () Bool)

(declare-fun e!680367 () Bool)

(assert (=> mapNonEmpty!47438 (= mapRes!47438 (and tp!90093 e!680367))))

(declare-fun mapValue!47438 () ValueCell!14490)

(declare-fun mapRest!47438 () (Array (_ BitVec 32) ValueCell!14490))

(declare-fun mapKey!47438 () (_ BitVec 32))

(assert (=> mapNonEmpty!47438 (= (arr!37434 _values!996) (store mapRest!47438 mapKey!47438 mapValue!47438))))

(declare-fun b!1197650 () Bool)

(declare-fun res!797033 () Bool)

(assert (=> b!1197650 (=> (not res!797033) (not e!680365))))

(declare-datatypes ((List!26337 0))(
  ( (Nil!26334) (Cons!26333 (h!27542 (_ BitVec 64)) (t!39038 List!26337)) )
))
(declare-fun arrayNoDuplicates!0 (array!77575 (_ BitVec 32) List!26337) Bool)

(assert (=> b!1197650 (= res!797033 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26334))))

(declare-fun b!1197651 () Bool)

(declare-fun res!797027 () Bool)

(assert (=> b!1197651 (=> (not res!797027) (not e!680369))))

(assert (=> b!1197651 (= res!797027 (arrayNoDuplicates!0 lt!543330 #b00000000000000000000000000000000 Nil!26334))))

(declare-fun b!1197652 () Bool)

(declare-fun res!797031 () Bool)

(assert (=> b!1197652 (=> (not res!797031) (not e!680365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197652 (= res!797031 (validKeyInArray!0 k0!934))))

(declare-fun b!1197653 () Bool)

(declare-fun tp_is_empty!30399 () Bool)

(assert (=> b!1197653 (= e!680367 tp_is_empty!30399)))

(declare-fun b!1197654 () Bool)

(assert (=> b!1197654 (= e!680364 tp_is_empty!30399)))

(declare-fun b!1197655 () Bool)

(declare-fun res!797034 () Bool)

(assert (=> b!1197655 (=> (not res!797034) (not e!680365))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197655 (= res!797034 (and (= (size!37970 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37969 _keys!1208) (size!37970 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197656 () Bool)

(declare-fun res!797026 () Bool)

(assert (=> b!1197656 (=> (not res!797026) (not e!680365))))

(assert (=> b!1197656 (= res!797026 (= (select (arr!37433 _keys!1208) i!673) k0!934))))

(assert (= (and start!100354 res!797030) b!1197645))

(assert (= (and b!1197645 res!797025) b!1197655))

(assert (= (and b!1197655 res!797034) b!1197647))

(assert (= (and b!1197647 res!797032) b!1197650))

(assert (= (and b!1197650 res!797033) b!1197644))

(assert (= (and b!1197644 res!797029) b!1197652))

(assert (= (and b!1197652 res!797031) b!1197656))

(assert (= (and b!1197656 res!797026) b!1197646))

(assert (= (and b!1197646 res!797028) b!1197651))

(assert (= (and b!1197651 res!797027) b!1197648))

(assert (= (and b!1197649 condMapEmpty!47438) mapIsEmpty!47438))

(assert (= (and b!1197649 (not condMapEmpty!47438)) mapNonEmpty!47438))

(get-info :version)

(assert (= (and mapNonEmpty!47438 ((_ is ValueCellFull!14490) mapValue!47438)) b!1197653))

(assert (= (and b!1197649 ((_ is ValueCellFull!14490) mapDefault!47438)) b!1197654))

(assert (= start!100354 b!1197649))

(declare-fun m!1104633 () Bool)

(assert (=> b!1197647 m!1104633))

(declare-fun m!1104635 () Bool)

(assert (=> b!1197648 m!1104635))

(declare-fun m!1104637 () Bool)

(assert (=> b!1197648 m!1104637))

(declare-fun m!1104639 () Bool)

(assert (=> b!1197652 m!1104639))

(declare-fun m!1104641 () Bool)

(assert (=> b!1197651 m!1104641))

(declare-fun m!1104643 () Bool)

(assert (=> b!1197645 m!1104643))

(declare-fun m!1104645 () Bool)

(assert (=> start!100354 m!1104645))

(declare-fun m!1104647 () Bool)

(assert (=> start!100354 m!1104647))

(declare-fun m!1104649 () Bool)

(assert (=> b!1197656 m!1104649))

(declare-fun m!1104651 () Bool)

(assert (=> b!1197650 m!1104651))

(declare-fun m!1104653 () Bool)

(assert (=> b!1197646 m!1104653))

(declare-fun m!1104655 () Bool)

(assert (=> b!1197646 m!1104655))

(declare-fun m!1104657 () Bool)

(assert (=> mapNonEmpty!47438 m!1104657))

(check-sat (not b!1197647) (not b!1197646) (not b!1197648) (not b!1197645) (not b!1197651) (not start!100354) (not b!1197652) (not mapNonEmpty!47438) tp_is_empty!30399 (not b!1197650))
(check-sat)
