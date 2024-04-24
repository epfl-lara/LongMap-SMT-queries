; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97344 () Bool)

(assert start!97344)

(declare-fun b!1105743 () Bool)

(declare-fun e!631264 () Bool)

(declare-fun e!631263 () Bool)

(declare-fun mapRes!42847 () Bool)

(assert (=> b!1105743 (= e!631264 (and e!631263 mapRes!42847))))

(declare-fun condMapEmpty!42847 () Bool)

(declare-datatypes ((V!41601 0))(
  ( (V!41602 (val!13734 Int)) )
))
(declare-datatypes ((ValueCell!12968 0))(
  ( (ValueCellFull!12968 (v!16363 V!41601)) (EmptyCell!12968) )
))
(declare-datatypes ((array!71669 0))(
  ( (array!71670 (arr!34482 (Array (_ BitVec 32) ValueCell!12968)) (size!35019 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71669)

(declare-fun mapDefault!42847 () ValueCell!12968)

(assert (=> b!1105743 (= condMapEmpty!42847 (= (arr!34482 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12968)) mapDefault!42847)))))

(declare-fun b!1105744 () Bool)

(declare-fun tp_is_empty!27355 () Bool)

(assert (=> b!1105744 (= e!631263 tp_is_empty!27355)))

(declare-fun mapNonEmpty!42847 () Bool)

(declare-fun tp!81767 () Bool)

(declare-fun e!631267 () Bool)

(assert (=> mapNonEmpty!42847 (= mapRes!42847 (and tp!81767 e!631267))))

(declare-fun mapKey!42847 () (_ BitVec 32))

(declare-fun mapRest!42847 () (Array (_ BitVec 32) ValueCell!12968))

(declare-fun mapValue!42847 () ValueCell!12968)

(assert (=> mapNonEmpty!42847 (= (arr!34482 _values!996) (store mapRest!42847 mapKey!42847 mapValue!42847))))

(declare-fun b!1105745 () Bool)

(declare-fun e!631265 () Bool)

(declare-fun e!631268 () Bool)

(assert (=> b!1105745 (= e!631265 e!631268)))

(declare-fun res!737351 () Bool)

(assert (=> b!1105745 (=> (not res!737351) (not e!631268))))

(declare-datatypes ((array!71671 0))(
  ( (array!71672 (arr!34483 (Array (_ BitVec 32) (_ BitVec 64))) (size!35020 (_ BitVec 32))) )
))
(declare-fun lt!495651 () array!71671)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71671 (_ BitVec 32)) Bool)

(assert (=> b!1105745 (= res!737351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495651 mask!1564))))

(declare-fun _keys!1208 () array!71671)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1105745 (= lt!495651 (array!71672 (store (arr!34483 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35020 _keys!1208)))))

(declare-fun b!1105746 () Bool)

(declare-fun res!737356 () Bool)

(assert (=> b!1105746 (=> (not res!737356) (not e!631265))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105746 (= res!737356 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!42847 () Bool)

(assert (=> mapIsEmpty!42847 mapRes!42847))

(declare-fun b!1105747 () Bool)

(declare-fun res!737357 () Bool)

(assert (=> b!1105747 (=> (not res!737357) (not e!631265))))

(assert (=> b!1105747 (= res!737357 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35020 _keys!1208))))))

(declare-fun b!1105748 () Bool)

(declare-fun res!737354 () Bool)

(assert (=> b!1105748 (=> (not res!737354) (not e!631265))))

(declare-datatypes ((List!24077 0))(
  ( (Nil!24074) (Cons!24073 (h!25291 (_ BitVec 64)) (t!34334 List!24077)) )
))
(declare-fun arrayNoDuplicates!0 (array!71671 (_ BitVec 32) List!24077) Bool)

(assert (=> b!1105748 (= res!737354 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24074))))

(declare-fun b!1105749 () Bool)

(assert (=> b!1105749 (= e!631267 tp_is_empty!27355)))

(declare-fun b!1105750 () Bool)

(declare-fun res!737352 () Bool)

(assert (=> b!1105750 (=> (not res!737352) (not e!631265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105750 (= res!737352 (validMask!0 mask!1564))))

(declare-fun b!1105751 () Bool)

(declare-fun res!737353 () Bool)

(assert (=> b!1105751 (=> (not res!737353) (not e!631265))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105751 (= res!737353 (and (= (size!35019 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35020 _keys!1208) (size!35019 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105752 () Bool)

(declare-fun res!737349 () Bool)

(assert (=> b!1105752 (=> (not res!737349) (not e!631265))))

(assert (=> b!1105752 (= res!737349 (= (select (arr!34483 _keys!1208) i!673) k0!934))))

(declare-fun b!1105753 () Bool)

(assert (=> b!1105753 (= e!631268 false)))

(declare-fun lt!495652 () Bool)

(assert (=> b!1105753 (= lt!495652 (arrayNoDuplicates!0 lt!495651 #b00000000000000000000000000000000 Nil!24074))))

(declare-fun b!1105754 () Bool)

(declare-fun res!737350 () Bool)

(assert (=> b!1105754 (=> (not res!737350) (not e!631265))))

(assert (=> b!1105754 (= res!737350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!737355 () Bool)

(assert (=> start!97344 (=> (not res!737355) (not e!631265))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97344 (= res!737355 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35020 _keys!1208))))))

(assert (=> start!97344 e!631265))

(declare-fun array_inv!26582 (array!71671) Bool)

(assert (=> start!97344 (array_inv!26582 _keys!1208)))

(assert (=> start!97344 true))

(declare-fun array_inv!26583 (array!71669) Bool)

(assert (=> start!97344 (and (array_inv!26583 _values!996) e!631264)))

(assert (= (and start!97344 res!737355) b!1105750))

(assert (= (and b!1105750 res!737352) b!1105751))

(assert (= (and b!1105751 res!737353) b!1105754))

(assert (= (and b!1105754 res!737350) b!1105748))

(assert (= (and b!1105748 res!737354) b!1105747))

(assert (= (and b!1105747 res!737357) b!1105746))

(assert (= (and b!1105746 res!737356) b!1105752))

(assert (= (and b!1105752 res!737349) b!1105745))

(assert (= (and b!1105745 res!737351) b!1105753))

(assert (= (and b!1105743 condMapEmpty!42847) mapIsEmpty!42847))

(assert (= (and b!1105743 (not condMapEmpty!42847)) mapNonEmpty!42847))

(get-info :version)

(assert (= (and mapNonEmpty!42847 ((_ is ValueCellFull!12968) mapValue!42847)) b!1105749))

(assert (= (and b!1105743 ((_ is ValueCellFull!12968) mapDefault!42847)) b!1105744))

(assert (= start!97344 b!1105743))

(declare-fun m!1025845 () Bool)

(assert (=> b!1105753 m!1025845))

(declare-fun m!1025847 () Bool)

(assert (=> b!1105748 m!1025847))

(declare-fun m!1025849 () Bool)

(assert (=> b!1105750 m!1025849))

(declare-fun m!1025851 () Bool)

(assert (=> b!1105754 m!1025851))

(declare-fun m!1025853 () Bool)

(assert (=> mapNonEmpty!42847 m!1025853))

(declare-fun m!1025855 () Bool)

(assert (=> b!1105745 m!1025855))

(declare-fun m!1025857 () Bool)

(assert (=> b!1105745 m!1025857))

(declare-fun m!1025859 () Bool)

(assert (=> start!97344 m!1025859))

(declare-fun m!1025861 () Bool)

(assert (=> start!97344 m!1025861))

(declare-fun m!1025863 () Bool)

(assert (=> b!1105746 m!1025863))

(declare-fun m!1025865 () Bool)

(assert (=> b!1105752 m!1025865))

(check-sat (not start!97344) tp_is_empty!27355 (not b!1105748) (not b!1105745) (not b!1105753) (not b!1105750) (not mapNonEmpty!42847) (not b!1105754) (not b!1105746))
(check-sat)
