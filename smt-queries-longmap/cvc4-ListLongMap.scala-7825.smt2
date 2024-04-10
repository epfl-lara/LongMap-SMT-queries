; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97698 () Bool)

(assert start!97698)

(declare-fun b!1116849 () Bool)

(declare-fun res!745759 () Bool)

(declare-fun e!636280 () Bool)

(assert (=> b!1116849 (=> (not res!745759) (not e!636280))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116849 (= res!745759 (validKeyInArray!0 k!934))))

(declare-fun b!1116850 () Bool)

(declare-fun e!636283 () Bool)

(assert (=> b!1116850 (= e!636280 e!636283)))

(declare-fun res!745756 () Bool)

(assert (=> b!1116850 (=> (not res!745756) (not e!636283))))

(declare-datatypes ((array!72755 0))(
  ( (array!72756 (arr!35030 (Array (_ BitVec 32) (_ BitVec 64))) (size!35566 (_ BitVec 32))) )
))
(declare-fun lt!497197 () array!72755)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72755 (_ BitVec 32)) Bool)

(assert (=> b!1116850 (= res!745756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497197 mask!1564))))

(declare-fun _keys!1208 () array!72755)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116850 (= lt!497197 (array!72756 (store (arr!35030 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35566 _keys!1208)))))

(declare-fun res!745761 () Bool)

(assert (=> start!97698 (=> (not res!745761) (not e!636280))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97698 (= res!745761 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35566 _keys!1208))))))

(assert (=> start!97698 e!636280))

(declare-fun array_inv!26924 (array!72755) Bool)

(assert (=> start!97698 (array_inv!26924 _keys!1208)))

(assert (=> start!97698 true))

(declare-datatypes ((V!42365 0))(
  ( (V!42366 (val!14021 Int)) )
))
(declare-datatypes ((ValueCell!13255 0))(
  ( (ValueCellFull!13255 (v!16654 V!42365)) (EmptyCell!13255) )
))
(declare-datatypes ((array!72757 0))(
  ( (array!72758 (arr!35031 (Array (_ BitVec 32) ValueCell!13255)) (size!35567 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72757)

(declare-fun e!636285 () Bool)

(declare-fun array_inv!26925 (array!72757) Bool)

(assert (=> start!97698 (and (array_inv!26925 _values!996) e!636285)))

(declare-fun b!1116851 () Bool)

(declare-fun res!745758 () Bool)

(assert (=> b!1116851 (=> (not res!745758) (not e!636280))))

(assert (=> b!1116851 (= res!745758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116852 () Bool)

(declare-fun res!745753 () Bool)

(assert (=> b!1116852 (=> (not res!745753) (not e!636280))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116852 (= res!745753 (and (= (size!35567 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35566 _keys!1208) (size!35567 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116853 () Bool)

(declare-fun res!745760 () Bool)

(assert (=> b!1116853 (=> (not res!745760) (not e!636280))))

(assert (=> b!1116853 (= res!745760 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35566 _keys!1208))))))

(declare-fun b!1116854 () Bool)

(declare-fun res!745762 () Bool)

(assert (=> b!1116854 (=> (not res!745762) (not e!636280))))

(assert (=> b!1116854 (= res!745762 (= (select (arr!35030 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!43711 () Bool)

(declare-fun mapRes!43711 () Bool)

(assert (=> mapIsEmpty!43711 mapRes!43711))

(declare-fun b!1116855 () Bool)

(declare-fun res!745755 () Bool)

(assert (=> b!1116855 (=> (not res!745755) (not e!636280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116855 (= res!745755 (validMask!0 mask!1564))))

(declare-fun b!1116856 () Bool)

(declare-fun res!745757 () Bool)

(assert (=> b!1116856 (=> (not res!745757) (not e!636283))))

(declare-datatypes ((List!24377 0))(
  ( (Nil!24374) (Cons!24373 (h!25582 (_ BitVec 64)) (t!34858 List!24377)) )
))
(declare-fun arrayNoDuplicates!0 (array!72755 (_ BitVec 32) List!24377) Bool)

(assert (=> b!1116856 (= res!745757 (arrayNoDuplicates!0 lt!497197 #b00000000000000000000000000000000 Nil!24374))))

(declare-fun b!1116857 () Bool)

(assert (=> b!1116857 (= e!636283 (not true))))

(declare-fun arrayContainsKey!0 (array!72755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116857 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36652 0))(
  ( (Unit!36653) )
))
(declare-fun lt!497198 () Unit!36652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72755 (_ BitVec 64) (_ BitVec 32)) Unit!36652)

(assert (=> b!1116857 (= lt!497198 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!43711 () Bool)

(declare-fun tp!82955 () Bool)

(declare-fun e!636282 () Bool)

(assert (=> mapNonEmpty!43711 (= mapRes!43711 (and tp!82955 e!636282))))

(declare-fun mapRest!43711 () (Array (_ BitVec 32) ValueCell!13255))

(declare-fun mapKey!43711 () (_ BitVec 32))

(declare-fun mapValue!43711 () ValueCell!13255)

(assert (=> mapNonEmpty!43711 (= (arr!35031 _values!996) (store mapRest!43711 mapKey!43711 mapValue!43711))))

(declare-fun b!1116858 () Bool)

(declare-fun e!636281 () Bool)

(declare-fun tp_is_empty!27929 () Bool)

(assert (=> b!1116858 (= e!636281 tp_is_empty!27929)))

(declare-fun b!1116859 () Bool)

(assert (=> b!1116859 (= e!636285 (and e!636281 mapRes!43711))))

(declare-fun condMapEmpty!43711 () Bool)

(declare-fun mapDefault!43711 () ValueCell!13255)

