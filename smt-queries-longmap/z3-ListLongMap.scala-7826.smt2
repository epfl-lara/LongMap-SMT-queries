; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97702 () Bool)

(assert start!97702)

(declare-fun b!1116927 () Bool)

(declare-fun res!745819 () Bool)

(declare-fun e!636317 () Bool)

(assert (=> b!1116927 (=> (not res!745819) (not e!636317))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116927 (= res!745819 (validKeyInArray!0 k0!934))))

(declare-fun b!1116928 () Bool)

(declare-fun e!636320 () Bool)

(declare-fun e!636316 () Bool)

(declare-fun mapRes!43717 () Bool)

(assert (=> b!1116928 (= e!636320 (and e!636316 mapRes!43717))))

(declare-fun condMapEmpty!43717 () Bool)

(declare-datatypes ((V!42371 0))(
  ( (V!42372 (val!14023 Int)) )
))
(declare-datatypes ((ValueCell!13257 0))(
  ( (ValueCellFull!13257 (v!16656 V!42371)) (EmptyCell!13257) )
))
(declare-datatypes ((array!72763 0))(
  ( (array!72764 (arr!35034 (Array (_ BitVec 32) ValueCell!13257)) (size!35570 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72763)

(declare-fun mapDefault!43717 () ValueCell!13257)

(assert (=> b!1116928 (= condMapEmpty!43717 (= (arr!35034 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13257)) mapDefault!43717)))))

(declare-fun res!745818 () Bool)

(assert (=> start!97702 (=> (not res!745818) (not e!636317))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72765 0))(
  ( (array!72766 (arr!35035 (Array (_ BitVec 32) (_ BitVec 64))) (size!35571 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72765)

(assert (=> start!97702 (= res!745818 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35571 _keys!1208))))))

(assert (=> start!97702 e!636317))

(declare-fun array_inv!26926 (array!72765) Bool)

(assert (=> start!97702 (array_inv!26926 _keys!1208)))

(assert (=> start!97702 true))

(declare-fun array_inv!26927 (array!72763) Bool)

(assert (=> start!97702 (and (array_inv!26927 _values!996) e!636320)))

(declare-fun b!1116929 () Bool)

(declare-fun res!745820 () Bool)

(declare-fun e!636319 () Bool)

(assert (=> b!1116929 (=> (not res!745820) (not e!636319))))

(declare-fun lt!497209 () array!72765)

(declare-datatypes ((List!24379 0))(
  ( (Nil!24376) (Cons!24375 (h!25584 (_ BitVec 64)) (t!34860 List!24379)) )
))
(declare-fun arrayNoDuplicates!0 (array!72765 (_ BitVec 32) List!24379) Bool)

(assert (=> b!1116929 (= res!745820 (arrayNoDuplicates!0 lt!497209 #b00000000000000000000000000000000 Nil!24376))))

(declare-fun b!1116930 () Bool)

(assert (=> b!1116930 (= e!636317 e!636319)))

(declare-fun res!745816 () Bool)

(assert (=> b!1116930 (=> (not res!745816) (not e!636319))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72765 (_ BitVec 32)) Bool)

(assert (=> b!1116930 (= res!745816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497209 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116930 (= lt!497209 (array!72766 (store (arr!35035 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35571 _keys!1208)))))

(declare-fun mapIsEmpty!43717 () Bool)

(assert (=> mapIsEmpty!43717 mapRes!43717))

(declare-fun b!1116931 () Bool)

(assert (=> b!1116931 (= e!636319 (not true))))

(declare-fun arrayContainsKey!0 (array!72765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116931 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36654 0))(
  ( (Unit!36655) )
))
(declare-fun lt!497210 () Unit!36654)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72765 (_ BitVec 64) (_ BitVec 32)) Unit!36654)

(assert (=> b!1116931 (= lt!497210 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116932 () Bool)

(declare-fun res!745813 () Bool)

(assert (=> b!1116932 (=> (not res!745813) (not e!636317))))

(assert (=> b!1116932 (= res!745813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116933 () Bool)

(declare-fun tp_is_empty!27933 () Bool)

(assert (=> b!1116933 (= e!636316 tp_is_empty!27933)))

(declare-fun b!1116934 () Bool)

(declare-fun res!745817 () Bool)

(assert (=> b!1116934 (=> (not res!745817) (not e!636317))))

(assert (=> b!1116934 (= res!745817 (= (select (arr!35035 _keys!1208) i!673) k0!934))))

(declare-fun b!1116935 () Bool)

(declare-fun res!745822 () Bool)

(assert (=> b!1116935 (=> (not res!745822) (not e!636317))))

(assert (=> b!1116935 (= res!745822 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24376))))

(declare-fun b!1116936 () Bool)

(declare-fun res!745815 () Bool)

(assert (=> b!1116936 (=> (not res!745815) (not e!636317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116936 (= res!745815 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43717 () Bool)

(declare-fun tp!82961 () Bool)

(declare-fun e!636318 () Bool)

(assert (=> mapNonEmpty!43717 (= mapRes!43717 (and tp!82961 e!636318))))

(declare-fun mapValue!43717 () ValueCell!13257)

(declare-fun mapRest!43717 () (Array (_ BitVec 32) ValueCell!13257))

(declare-fun mapKey!43717 () (_ BitVec 32))

(assert (=> mapNonEmpty!43717 (= (arr!35034 _values!996) (store mapRest!43717 mapKey!43717 mapValue!43717))))

(declare-fun b!1116937 () Bool)

(assert (=> b!1116937 (= e!636318 tp_is_empty!27933)))

(declare-fun b!1116938 () Bool)

(declare-fun res!745821 () Bool)

(assert (=> b!1116938 (=> (not res!745821) (not e!636317))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116938 (= res!745821 (and (= (size!35570 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35571 _keys!1208) (size!35570 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116939 () Bool)

(declare-fun res!745814 () Bool)

(assert (=> b!1116939 (=> (not res!745814) (not e!636317))))

(assert (=> b!1116939 (= res!745814 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35571 _keys!1208))))))

(assert (= (and start!97702 res!745818) b!1116936))

(assert (= (and b!1116936 res!745815) b!1116938))

(assert (= (and b!1116938 res!745821) b!1116932))

(assert (= (and b!1116932 res!745813) b!1116935))

(assert (= (and b!1116935 res!745822) b!1116939))

(assert (= (and b!1116939 res!745814) b!1116927))

(assert (= (and b!1116927 res!745819) b!1116934))

(assert (= (and b!1116934 res!745817) b!1116930))

(assert (= (and b!1116930 res!745816) b!1116929))

(assert (= (and b!1116929 res!745820) b!1116931))

(assert (= (and b!1116928 condMapEmpty!43717) mapIsEmpty!43717))

(assert (= (and b!1116928 (not condMapEmpty!43717)) mapNonEmpty!43717))

(get-info :version)

(assert (= (and mapNonEmpty!43717 ((_ is ValueCellFull!13257) mapValue!43717)) b!1116937))

(assert (= (and b!1116928 ((_ is ValueCellFull!13257) mapDefault!43717)) b!1116933))

(assert (= start!97702 b!1116928))

(declare-fun m!1032973 () Bool)

(assert (=> b!1116934 m!1032973))

(declare-fun m!1032975 () Bool)

(assert (=> start!97702 m!1032975))

(declare-fun m!1032977 () Bool)

(assert (=> start!97702 m!1032977))

(declare-fun m!1032979 () Bool)

(assert (=> mapNonEmpty!43717 m!1032979))

(declare-fun m!1032981 () Bool)

(assert (=> b!1116932 m!1032981))

(declare-fun m!1032983 () Bool)

(assert (=> b!1116935 m!1032983))

(declare-fun m!1032985 () Bool)

(assert (=> b!1116927 m!1032985))

(declare-fun m!1032987 () Bool)

(assert (=> b!1116931 m!1032987))

(declare-fun m!1032989 () Bool)

(assert (=> b!1116931 m!1032989))

(declare-fun m!1032991 () Bool)

(assert (=> b!1116930 m!1032991))

(declare-fun m!1032993 () Bool)

(assert (=> b!1116930 m!1032993))

(declare-fun m!1032995 () Bool)

(assert (=> b!1116936 m!1032995))

(declare-fun m!1032997 () Bool)

(assert (=> b!1116929 m!1032997))

(check-sat (not start!97702) tp_is_empty!27933 (not b!1116930) (not b!1116932) (not b!1116936) (not b!1116931) (not b!1116927) (not mapNonEmpty!43717) (not b!1116935) (not b!1116929))
(check-sat)
