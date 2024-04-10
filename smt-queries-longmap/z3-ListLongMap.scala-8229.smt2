; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100284 () Bool)

(assert start!100284)

(declare-fun b!1196412 () Bool)

(declare-fun res!796213 () Bool)

(declare-fun e!679758 () Bool)

(assert (=> b!1196412 (=> (not res!796213) (not e!679758))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196412 (= res!796213 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47363 () Bool)

(declare-fun mapRes!47363 () Bool)

(assert (=> mapIsEmpty!47363 mapRes!47363))

(declare-fun b!1196413 () Bool)

(declare-fun res!796216 () Bool)

(assert (=> b!1196413 (=> (not res!796216) (not e!679758))))

(declare-datatypes ((array!77481 0))(
  ( (array!77482 (arr!37387 (Array (_ BitVec 32) (_ BitVec 64))) (size!37923 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77481)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1196413 (= res!796216 (= (select (arr!37387 _keys!1208) i!673) k0!934))))

(declare-fun res!796211 () Bool)

(assert (=> start!100284 (=> (not res!796211) (not e!679758))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100284 (= res!796211 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37923 _keys!1208))))))

(assert (=> start!100284 e!679758))

(declare-fun array_inv!28496 (array!77481) Bool)

(assert (=> start!100284 (array_inv!28496 _keys!1208)))

(assert (=> start!100284 true))

(declare-datatypes ((V!45595 0))(
  ( (V!45596 (val!15232 Int)) )
))
(declare-datatypes ((ValueCell!14466 0))(
  ( (ValueCellFull!14466 (v!17870 V!45595)) (EmptyCell!14466) )
))
(declare-datatypes ((array!77483 0))(
  ( (array!77484 (arr!37388 (Array (_ BitVec 32) ValueCell!14466)) (size!37924 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77483)

(declare-fun e!679754 () Bool)

(declare-fun array_inv!28497 (array!77483) Bool)

(assert (=> start!100284 (and (array_inv!28497 _values!996) e!679754)))

(declare-fun b!1196414 () Bool)

(declare-fun res!796212 () Bool)

(assert (=> b!1196414 (=> (not res!796212) (not e!679758))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196414 (= res!796212 (and (= (size!37924 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37923 _keys!1208) (size!37924 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196415 () Bool)

(declare-fun res!796207 () Bool)

(assert (=> b!1196415 (=> (not res!796207) (not e!679758))))

(declare-datatypes ((List!26302 0))(
  ( (Nil!26299) (Cons!26298 (h!27507 (_ BitVec 64)) (t!38973 List!26302)) )
))
(declare-fun arrayNoDuplicates!0 (array!77481 (_ BitVec 32) List!26302) Bool)

(assert (=> b!1196415 (= res!796207 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26299))))

(declare-fun b!1196416 () Bool)

(declare-fun res!796210 () Bool)

(declare-fun e!679757 () Bool)

(assert (=> b!1196416 (=> (not res!796210) (not e!679757))))

(declare-fun lt!543077 () array!77481)

(assert (=> b!1196416 (= res!796210 (arrayNoDuplicates!0 lt!543077 #b00000000000000000000000000000000 Nil!26299))))

(declare-fun b!1196417 () Bool)

(declare-fun res!796208 () Bool)

(assert (=> b!1196417 (=> (not res!796208) (not e!679758))))

(assert (=> b!1196417 (= res!796208 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37923 _keys!1208))))))

(declare-fun b!1196418 () Bool)

(declare-fun e!679756 () Bool)

(assert (=> b!1196418 (= e!679754 (and e!679756 mapRes!47363))))

(declare-fun condMapEmpty!47363 () Bool)

(declare-fun mapDefault!47363 () ValueCell!14466)

(assert (=> b!1196418 (= condMapEmpty!47363 (= (arr!37388 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14466)) mapDefault!47363)))))

(declare-fun mapNonEmpty!47363 () Bool)

(declare-fun tp!89973 () Bool)

(declare-fun e!679759 () Bool)

(assert (=> mapNonEmpty!47363 (= mapRes!47363 (and tp!89973 e!679759))))

(declare-fun mapKey!47363 () (_ BitVec 32))

(declare-fun mapValue!47363 () ValueCell!14466)

(declare-fun mapRest!47363 () (Array (_ BitVec 32) ValueCell!14466))

(assert (=> mapNonEmpty!47363 (= (arr!37388 _values!996) (store mapRest!47363 mapKey!47363 mapValue!47363))))

(declare-fun b!1196419 () Bool)

(declare-fun tp_is_empty!30351 () Bool)

(assert (=> b!1196419 (= e!679756 tp_is_empty!30351)))

(declare-fun b!1196420 () Bool)

(declare-fun res!796214 () Bool)

(assert (=> b!1196420 (=> (not res!796214) (not e!679758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196420 (= res!796214 (validKeyInArray!0 k0!934))))

(declare-fun b!1196421 () Bool)

(declare-fun res!796209 () Bool)

(assert (=> b!1196421 (=> (not res!796209) (not e!679758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77481 (_ BitVec 32)) Bool)

(assert (=> b!1196421 (= res!796209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196422 () Bool)

(assert (=> b!1196422 (= e!679757 (not true))))

(declare-fun arrayContainsKey!0 (array!77481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196422 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39670 0))(
  ( (Unit!39671) )
))
(declare-fun lt!543078 () Unit!39670)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77481 (_ BitVec 64) (_ BitVec 32)) Unit!39670)

(assert (=> b!1196422 (= lt!543078 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196423 () Bool)

(assert (=> b!1196423 (= e!679758 e!679757)))

(declare-fun res!796215 () Bool)

(assert (=> b!1196423 (=> (not res!796215) (not e!679757))))

(assert (=> b!1196423 (= res!796215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543077 mask!1564))))

(assert (=> b!1196423 (= lt!543077 (array!77482 (store (arr!37387 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37923 _keys!1208)))))

(declare-fun b!1196424 () Bool)

(assert (=> b!1196424 (= e!679759 tp_is_empty!30351)))

(assert (= (and start!100284 res!796211) b!1196412))

(assert (= (and b!1196412 res!796213) b!1196414))

(assert (= (and b!1196414 res!796212) b!1196421))

(assert (= (and b!1196421 res!796209) b!1196415))

(assert (= (and b!1196415 res!796207) b!1196417))

(assert (= (and b!1196417 res!796208) b!1196420))

(assert (= (and b!1196420 res!796214) b!1196413))

(assert (= (and b!1196413 res!796216) b!1196423))

(assert (= (and b!1196423 res!796215) b!1196416))

(assert (= (and b!1196416 res!796210) b!1196422))

(assert (= (and b!1196418 condMapEmpty!47363) mapIsEmpty!47363))

(assert (= (and b!1196418 (not condMapEmpty!47363)) mapNonEmpty!47363))

(get-info :version)

(assert (= (and mapNonEmpty!47363 ((_ is ValueCellFull!14466) mapValue!47363)) b!1196424))

(assert (= (and b!1196418 ((_ is ValueCellFull!14466) mapDefault!47363)) b!1196419))

(assert (= start!100284 b!1196418))

(declare-fun m!1103657 () Bool)

(assert (=> b!1196413 m!1103657))

(declare-fun m!1103659 () Bool)

(assert (=> b!1196422 m!1103659))

(declare-fun m!1103661 () Bool)

(assert (=> b!1196422 m!1103661))

(declare-fun m!1103663 () Bool)

(assert (=> b!1196415 m!1103663))

(declare-fun m!1103665 () Bool)

(assert (=> b!1196416 m!1103665))

(declare-fun m!1103667 () Bool)

(assert (=> b!1196423 m!1103667))

(declare-fun m!1103669 () Bool)

(assert (=> b!1196423 m!1103669))

(declare-fun m!1103671 () Bool)

(assert (=> start!100284 m!1103671))

(declare-fun m!1103673 () Bool)

(assert (=> start!100284 m!1103673))

(declare-fun m!1103675 () Bool)

(assert (=> b!1196421 m!1103675))

(declare-fun m!1103677 () Bool)

(assert (=> b!1196412 m!1103677))

(declare-fun m!1103679 () Bool)

(assert (=> b!1196420 m!1103679))

(declare-fun m!1103681 () Bool)

(assert (=> mapNonEmpty!47363 m!1103681))

(check-sat (not b!1196412) (not b!1196422) (not start!100284) tp_is_empty!30351 (not mapNonEmpty!47363) (not b!1196421) (not b!1196423) (not b!1196415) (not b!1196420) (not b!1196416))
(check-sat)
