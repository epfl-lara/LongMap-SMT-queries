; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100524 () Bool)

(assert start!100524)

(declare-fun b!1197779 () Bool)

(declare-fun e!680622 () Bool)

(declare-fun tp_is_empty!30355 () Bool)

(assert (=> b!1197779 (= e!680622 tp_is_empty!30355)))

(declare-fun b!1197780 () Bool)

(declare-fun e!680624 () Bool)

(declare-fun e!680623 () Bool)

(declare-fun mapRes!47369 () Bool)

(assert (=> b!1197780 (= e!680624 (and e!680623 mapRes!47369))))

(declare-fun condMapEmpty!47369 () Bool)

(declare-datatypes ((V!45601 0))(
  ( (V!45602 (val!15234 Int)) )
))
(declare-datatypes ((ValueCell!14468 0))(
  ( (ValueCellFull!14468 (v!17868 V!45601)) (EmptyCell!14468) )
))
(declare-datatypes ((array!77527 0))(
  ( (array!77528 (arr!37404 (Array (_ BitVec 32) ValueCell!14468)) (size!37941 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77527)

(declare-fun mapDefault!47369 () ValueCell!14468)

(assert (=> b!1197780 (= condMapEmpty!47369 (= (arr!37404 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14468)) mapDefault!47369)))))

(declare-fun res!796777 () Bool)

(declare-fun e!680625 () Bool)

(assert (=> start!100524 (=> (not res!796777) (not e!680625))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77529 0))(
  ( (array!77530 (arr!37405 (Array (_ BitVec 32) (_ BitVec 64))) (size!37942 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77529)

(assert (=> start!100524 (= res!796777 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37942 _keys!1208))))))

(assert (=> start!100524 e!680625))

(declare-fun array_inv!28580 (array!77529) Bool)

(assert (=> start!100524 (array_inv!28580 _keys!1208)))

(assert (=> start!100524 true))

(declare-fun array_inv!28581 (array!77527) Bool)

(assert (=> start!100524 (and (array_inv!28581 _values!996) e!680624)))

(declare-fun b!1197781 () Bool)

(declare-fun res!796779 () Bool)

(assert (=> b!1197781 (=> (not res!796779) (not e!680625))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1197781 (= res!796779 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37942 _keys!1208))))))

(declare-fun b!1197782 () Bool)

(declare-fun res!796780 () Bool)

(assert (=> b!1197782 (=> (not res!796780) (not e!680625))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197782 (= res!796780 (validKeyInArray!0 k0!934))))

(declare-fun b!1197783 () Bool)

(declare-fun res!796784 () Bool)

(declare-fun e!680627 () Bool)

(assert (=> b!1197783 (=> (not res!796784) (not e!680627))))

(declare-fun lt!543573 () array!77529)

(declare-datatypes ((List!26331 0))(
  ( (Nil!26328) (Cons!26327 (h!27545 (_ BitVec 64)) (t!38994 List!26331)) )
))
(declare-fun arrayNoDuplicates!0 (array!77529 (_ BitVec 32) List!26331) Bool)

(assert (=> b!1197783 (= res!796784 (arrayNoDuplicates!0 lt!543573 #b00000000000000000000000000000000 Nil!26328))))

(declare-fun b!1197784 () Bool)

(declare-fun res!796775 () Bool)

(assert (=> b!1197784 (=> (not res!796775) (not e!680625))))

(assert (=> b!1197784 (= res!796775 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26328))))

(declare-fun b!1197785 () Bool)

(declare-fun res!796776 () Bool)

(assert (=> b!1197785 (=> (not res!796776) (not e!680625))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1197785 (= res!796776 (and (= (size!37941 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37942 _keys!1208) (size!37941 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197786 () Bool)

(assert (=> b!1197786 (= e!680627 (not (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37942 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvsub (size!37942 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!37942 _keys!1208) from!1455)))))))

(declare-fun arrayContainsKey!0 (array!77529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197786 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39641 0))(
  ( (Unit!39642) )
))
(declare-fun lt!543574 () Unit!39641)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77529 (_ BitVec 64) (_ BitVec 32)) Unit!39641)

(assert (=> b!1197786 (= lt!543574 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197787 () Bool)

(declare-fun res!796781 () Bool)

(assert (=> b!1197787 (=> (not res!796781) (not e!680625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77529 (_ BitVec 32)) Bool)

(assert (=> b!1197787 (= res!796781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47369 () Bool)

(assert (=> mapIsEmpty!47369 mapRes!47369))

(declare-fun b!1197788 () Bool)

(declare-fun res!796783 () Bool)

(assert (=> b!1197788 (=> (not res!796783) (not e!680625))))

(assert (=> b!1197788 (= res!796783 (= (select (arr!37405 _keys!1208) i!673) k0!934))))

(declare-fun b!1197789 () Bool)

(assert (=> b!1197789 (= e!680625 e!680627)))

(declare-fun res!796778 () Bool)

(assert (=> b!1197789 (=> (not res!796778) (not e!680627))))

(assert (=> b!1197789 (= res!796778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543573 mask!1564))))

(assert (=> b!1197789 (= lt!543573 (array!77530 (store (arr!37405 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37942 _keys!1208)))))

(declare-fun b!1197790 () Bool)

(assert (=> b!1197790 (= e!680623 tp_is_empty!30355)))

(declare-fun b!1197791 () Bool)

(declare-fun res!796782 () Bool)

(assert (=> b!1197791 (=> (not res!796782) (not e!680625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197791 (= res!796782 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47369 () Bool)

(declare-fun tp!89979 () Bool)

(assert (=> mapNonEmpty!47369 (= mapRes!47369 (and tp!89979 e!680622))))

(declare-fun mapValue!47369 () ValueCell!14468)

(declare-fun mapRest!47369 () (Array (_ BitVec 32) ValueCell!14468))

(declare-fun mapKey!47369 () (_ BitVec 32))

(assert (=> mapNonEmpty!47369 (= (arr!37404 _values!996) (store mapRest!47369 mapKey!47369 mapValue!47369))))

(assert (= (and start!100524 res!796777) b!1197791))

(assert (= (and b!1197791 res!796782) b!1197785))

(assert (= (and b!1197785 res!796776) b!1197787))

(assert (= (and b!1197787 res!796781) b!1197784))

(assert (= (and b!1197784 res!796775) b!1197781))

(assert (= (and b!1197781 res!796779) b!1197782))

(assert (= (and b!1197782 res!796780) b!1197788))

(assert (= (and b!1197788 res!796783) b!1197789))

(assert (= (and b!1197789 res!796778) b!1197783))

(assert (= (and b!1197783 res!796784) b!1197786))

(assert (= (and b!1197780 condMapEmpty!47369) mapIsEmpty!47369))

(assert (= (and b!1197780 (not condMapEmpty!47369)) mapNonEmpty!47369))

(get-info :version)

(assert (= (and mapNonEmpty!47369 ((_ is ValueCellFull!14468) mapValue!47369)) b!1197779))

(assert (= (and b!1197780 ((_ is ValueCellFull!14468) mapDefault!47369)) b!1197790))

(assert (= start!100524 b!1197780))

(declare-fun m!1105281 () Bool)

(assert (=> b!1197786 m!1105281))

(declare-fun m!1105283 () Bool)

(assert (=> b!1197786 m!1105283))

(declare-fun m!1105285 () Bool)

(assert (=> b!1197787 m!1105285))

(declare-fun m!1105287 () Bool)

(assert (=> b!1197789 m!1105287))

(declare-fun m!1105289 () Bool)

(assert (=> b!1197789 m!1105289))

(declare-fun m!1105291 () Bool)

(assert (=> mapNonEmpty!47369 m!1105291))

(declare-fun m!1105293 () Bool)

(assert (=> start!100524 m!1105293))

(declare-fun m!1105295 () Bool)

(assert (=> start!100524 m!1105295))

(declare-fun m!1105297 () Bool)

(assert (=> b!1197788 m!1105297))

(declare-fun m!1105299 () Bool)

(assert (=> b!1197791 m!1105299))

(declare-fun m!1105301 () Bool)

(assert (=> b!1197784 m!1105301))

(declare-fun m!1105303 () Bool)

(assert (=> b!1197783 m!1105303))

(declare-fun m!1105305 () Bool)

(assert (=> b!1197782 m!1105305))

(check-sat (not mapNonEmpty!47369) (not b!1197787) (not b!1197783) (not b!1197791) (not b!1197789) (not b!1197784) (not b!1197786) (not b!1197782) tp_is_empty!30355 (not start!100524))
(check-sat)
