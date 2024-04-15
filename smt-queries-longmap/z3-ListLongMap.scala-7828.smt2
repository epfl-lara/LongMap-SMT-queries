; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97706 () Bool)

(assert start!97706)

(declare-fun res!745901 () Bool)

(declare-fun e!636328 () Bool)

(assert (=> start!97706 (=> (not res!745901) (not e!636328))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72682 0))(
  ( (array!72683 (arr!34994 (Array (_ BitVec 32) (_ BitVec 64))) (size!35532 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72682)

(assert (=> start!97706 (= res!745901 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35532 _keys!1208))))))

(assert (=> start!97706 e!636328))

(declare-fun array_inv!26966 (array!72682) Bool)

(assert (=> start!97706 (array_inv!26966 _keys!1208)))

(assert (=> start!97706 true))

(declare-datatypes ((V!42385 0))(
  ( (V!42386 (val!14028 Int)) )
))
(declare-datatypes ((ValueCell!13262 0))(
  ( (ValueCellFull!13262 (v!16660 V!42385)) (EmptyCell!13262) )
))
(declare-datatypes ((array!72684 0))(
  ( (array!72685 (arr!34995 (Array (_ BitVec 32) ValueCell!13262)) (size!35533 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72684)

(declare-fun e!636326 () Bool)

(declare-fun array_inv!26967 (array!72684) Bool)

(assert (=> start!97706 (and (array_inv!26967 _values!996) e!636326)))

(declare-fun b!1116993 () Bool)

(declare-fun res!745899 () Bool)

(declare-fun e!636330 () Bool)

(assert (=> b!1116993 (=> (not res!745899) (not e!636330))))

(declare-fun lt!497039 () array!72682)

(declare-datatypes ((List!24418 0))(
  ( (Nil!24415) (Cons!24414 (h!25623 (_ BitVec 64)) (t!34890 List!24418)) )
))
(declare-fun arrayNoDuplicates!0 (array!72682 (_ BitVec 32) List!24418) Bool)

(assert (=> b!1116993 (= res!745899 (arrayNoDuplicates!0 lt!497039 #b00000000000000000000000000000000 Nil!24415))))

(declare-fun b!1116994 () Bool)

(declare-fun e!636329 () Bool)

(declare-fun tp_is_empty!27943 () Bool)

(assert (=> b!1116994 (= e!636329 tp_is_empty!27943)))

(declare-fun b!1116995 () Bool)

(declare-fun res!745898 () Bool)

(assert (=> b!1116995 (=> (not res!745898) (not e!636328))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72682 (_ BitVec 32)) Bool)

(assert (=> b!1116995 (= res!745898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116996 () Bool)

(declare-fun res!745900 () Bool)

(assert (=> b!1116996 (=> (not res!745900) (not e!636328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116996 (= res!745900 (validMask!0 mask!1564))))

(declare-fun b!1116997 () Bool)

(declare-fun e!636327 () Bool)

(declare-fun mapRes!43732 () Bool)

(assert (=> b!1116997 (= e!636326 (and e!636327 mapRes!43732))))

(declare-fun condMapEmpty!43732 () Bool)

(declare-fun mapDefault!43732 () ValueCell!13262)

(assert (=> b!1116997 (= condMapEmpty!43732 (= (arr!34995 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13262)) mapDefault!43732)))))

(declare-fun b!1116998 () Bool)

(declare-fun res!745896 () Bool)

(assert (=> b!1116998 (=> (not res!745896) (not e!636328))))

(assert (=> b!1116998 (= res!745896 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24415))))

(declare-fun b!1116999 () Bool)

(declare-fun res!745894 () Bool)

(assert (=> b!1116999 (=> (not res!745894) (not e!636328))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116999 (= res!745894 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35532 _keys!1208))))))

(declare-fun b!1117000 () Bool)

(assert (=> b!1117000 (= e!636328 e!636330)))

(declare-fun res!745903 () Bool)

(assert (=> b!1117000 (=> (not res!745903) (not e!636330))))

(assert (=> b!1117000 (= res!745903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497039 mask!1564))))

(assert (=> b!1117000 (= lt!497039 (array!72683 (store (arr!34994 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35532 _keys!1208)))))

(declare-fun mapIsEmpty!43732 () Bool)

(assert (=> mapIsEmpty!43732 mapRes!43732))

(declare-fun b!1117001 () Bool)

(assert (=> b!1117001 (= e!636327 tp_is_empty!27943)))

(declare-fun mapNonEmpty!43732 () Bool)

(declare-fun tp!82976 () Bool)

(assert (=> mapNonEmpty!43732 (= mapRes!43732 (and tp!82976 e!636329))))

(declare-fun mapKey!43732 () (_ BitVec 32))

(declare-fun mapValue!43732 () ValueCell!13262)

(declare-fun mapRest!43732 () (Array (_ BitVec 32) ValueCell!13262))

(assert (=> mapNonEmpty!43732 (= (arr!34995 _values!996) (store mapRest!43732 mapKey!43732 mapValue!43732))))

(declare-fun b!1117002 () Bool)

(declare-fun res!745897 () Bool)

(assert (=> b!1117002 (=> (not res!745897) (not e!636328))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117002 (= res!745897 (= (select (arr!34994 _keys!1208) i!673) k0!934))))

(declare-fun b!1117003 () Bool)

(declare-fun res!745895 () Bool)

(assert (=> b!1117003 (=> (not res!745895) (not e!636328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117003 (= res!745895 (validKeyInArray!0 k0!934))))

(declare-fun b!1117004 () Bool)

(declare-fun res!745902 () Bool)

(assert (=> b!1117004 (=> (not res!745902) (not e!636328))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1117004 (= res!745902 (and (= (size!35533 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35532 _keys!1208) (size!35533 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117005 () Bool)

(assert (=> b!1117005 (= e!636330 (not true))))

(declare-fun arrayContainsKey!0 (array!72682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117005 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36487 0))(
  ( (Unit!36488) )
))
(declare-fun lt!497040 () Unit!36487)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72682 (_ BitVec 64) (_ BitVec 32)) Unit!36487)

(assert (=> b!1117005 (= lt!497040 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!97706 res!745901) b!1116996))

(assert (= (and b!1116996 res!745900) b!1117004))

(assert (= (and b!1117004 res!745902) b!1116995))

(assert (= (and b!1116995 res!745898) b!1116998))

(assert (= (and b!1116998 res!745896) b!1116999))

(assert (= (and b!1116999 res!745894) b!1117003))

(assert (= (and b!1117003 res!745895) b!1117002))

(assert (= (and b!1117002 res!745897) b!1117000))

(assert (= (and b!1117000 res!745903) b!1116993))

(assert (= (and b!1116993 res!745899) b!1117005))

(assert (= (and b!1116997 condMapEmpty!43732) mapIsEmpty!43732))

(assert (= (and b!1116997 (not condMapEmpty!43732)) mapNonEmpty!43732))

(get-info :version)

(assert (= (and mapNonEmpty!43732 ((_ is ValueCellFull!13262) mapValue!43732)) b!1116994))

(assert (= (and b!1116997 ((_ is ValueCellFull!13262) mapDefault!43732)) b!1117001))

(assert (= start!97706 b!1116997))

(declare-fun m!1032477 () Bool)

(assert (=> b!1117002 m!1032477))

(declare-fun m!1032479 () Bool)

(assert (=> b!1117005 m!1032479))

(declare-fun m!1032481 () Bool)

(assert (=> b!1117005 m!1032481))

(declare-fun m!1032483 () Bool)

(assert (=> b!1117003 m!1032483))

(declare-fun m!1032485 () Bool)

(assert (=> b!1116995 m!1032485))

(declare-fun m!1032487 () Bool)

(assert (=> start!97706 m!1032487))

(declare-fun m!1032489 () Bool)

(assert (=> start!97706 m!1032489))

(declare-fun m!1032491 () Bool)

(assert (=> b!1116993 m!1032491))

(declare-fun m!1032493 () Bool)

(assert (=> b!1116996 m!1032493))

(declare-fun m!1032495 () Bool)

(assert (=> mapNonEmpty!43732 m!1032495))

(declare-fun m!1032497 () Bool)

(assert (=> b!1117000 m!1032497))

(declare-fun m!1032499 () Bool)

(assert (=> b!1117000 m!1032499))

(declare-fun m!1032501 () Bool)

(assert (=> b!1116998 m!1032501))

(check-sat (not b!1116998) (not mapNonEmpty!43732) tp_is_empty!27943 (not start!97706) (not b!1117000) (not b!1116993) (not b!1117005) (not b!1117003) (not b!1116996) (not b!1116995))
(check-sat)
