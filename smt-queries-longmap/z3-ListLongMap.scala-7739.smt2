; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97414 () Bool)

(assert start!97414)

(declare-fun b!1106812 () Bool)

(declare-fun res!738152 () Bool)

(declare-fun e!631790 () Bool)

(assert (=> b!1106812 (=> (not res!738152) (not e!631790))))

(declare-datatypes ((array!71775 0))(
  ( (array!71776 (arr!34534 (Array (_ BitVec 32) (_ BitVec 64))) (size!35071 (_ BitVec 32))) )
))
(declare-fun lt!495828 () array!71775)

(declare-datatypes ((List!24099 0))(
  ( (Nil!24096) (Cons!24095 (h!25313 (_ BitVec 64)) (t!34356 List!24099)) )
))
(declare-fun arrayNoDuplicates!0 (array!71775 (_ BitVec 32) List!24099) Bool)

(assert (=> b!1106812 (= res!738152 (arrayNoDuplicates!0 lt!495828 #b00000000000000000000000000000000 Nil!24096))))

(declare-fun b!1106813 () Bool)

(declare-fun res!738154 () Bool)

(declare-fun e!631794 () Bool)

(assert (=> b!1106813 (=> (not res!738154) (not e!631794))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106813 (= res!738154 (validKeyInArray!0 k0!934))))

(declare-fun b!1106814 () Bool)

(declare-fun res!738157 () Bool)

(assert (=> b!1106814 (=> (not res!738157) (not e!631794))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!71775)

(assert (=> b!1106814 (= res!738157 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35071 _keys!1208))))))

(declare-fun b!1106815 () Bool)

(declare-fun res!738153 () Bool)

(assert (=> b!1106815 (=> (not res!738153) (not e!631794))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106815 (= res!738153 (validMask!0 mask!1564))))

(declare-fun b!1106816 () Bool)

(declare-fun res!738155 () Bool)

(assert (=> b!1106816 (=> (not res!738155) (not e!631794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71775 (_ BitVec 32)) Bool)

(assert (=> b!1106816 (= res!738155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106817 () Bool)

(assert (=> b!1106817 (= e!631794 e!631790)))

(declare-fun res!738160 () Bool)

(assert (=> b!1106817 (=> (not res!738160) (not e!631790))))

(assert (=> b!1106817 (= res!738160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495828 mask!1564))))

(assert (=> b!1106817 (= lt!495828 (array!71776 (store (arr!34534 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35071 _keys!1208)))))

(declare-fun b!1106818 () Bool)

(assert (=> b!1106818 (= e!631790 (not true))))

(declare-fun arrayContainsKey!0 (array!71775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106818 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36265 0))(
  ( (Unit!36266) )
))
(declare-fun lt!495829 () Unit!36265)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71775 (_ BitVec 64) (_ BitVec 32)) Unit!36265)

(assert (=> b!1106818 (= lt!495829 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106819 () Bool)

(declare-fun e!631789 () Bool)

(declare-fun e!631792 () Bool)

(declare-fun mapRes!42931 () Bool)

(assert (=> b!1106819 (= e!631789 (and e!631792 mapRes!42931))))

(declare-fun condMapEmpty!42931 () Bool)

(declare-datatypes ((V!41673 0))(
  ( (V!41674 (val!13761 Int)) )
))
(declare-datatypes ((ValueCell!12995 0))(
  ( (ValueCellFull!12995 (v!16390 V!41673)) (EmptyCell!12995) )
))
(declare-datatypes ((array!71777 0))(
  ( (array!71778 (arr!34535 (Array (_ BitVec 32) ValueCell!12995)) (size!35072 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71777)

(declare-fun mapDefault!42931 () ValueCell!12995)

(assert (=> b!1106819 (= condMapEmpty!42931 (= (arr!34535 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12995)) mapDefault!42931)))))

(declare-fun b!1106820 () Bool)

(declare-fun res!738158 () Bool)

(assert (=> b!1106820 (=> (not res!738158) (not e!631794))))

(assert (=> b!1106820 (= res!738158 (= (select (arr!34534 _keys!1208) i!673) k0!934))))

(declare-fun b!1106821 () Bool)

(declare-fun tp_is_empty!27409 () Bool)

(assert (=> b!1106821 (= e!631792 tp_is_empty!27409)))

(declare-fun b!1106822 () Bool)

(declare-fun e!631791 () Bool)

(assert (=> b!1106822 (= e!631791 tp_is_empty!27409)))

(declare-fun res!738156 () Bool)

(assert (=> start!97414 (=> (not res!738156) (not e!631794))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97414 (= res!738156 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35071 _keys!1208))))))

(assert (=> start!97414 e!631794))

(declare-fun array_inv!26622 (array!71775) Bool)

(assert (=> start!97414 (array_inv!26622 _keys!1208)))

(assert (=> start!97414 true))

(declare-fun array_inv!26623 (array!71777) Bool)

(assert (=> start!97414 (and (array_inv!26623 _values!996) e!631789)))

(declare-fun b!1106823 () Bool)

(declare-fun res!738151 () Bool)

(assert (=> b!1106823 (=> (not res!738151) (not e!631794))))

(assert (=> b!1106823 (= res!738151 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24096))))

(declare-fun b!1106824 () Bool)

(declare-fun res!738159 () Bool)

(assert (=> b!1106824 (=> (not res!738159) (not e!631794))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106824 (= res!738159 (and (= (size!35072 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35071 _keys!1208) (size!35072 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42931 () Bool)

(assert (=> mapIsEmpty!42931 mapRes!42931))

(declare-fun mapNonEmpty!42931 () Bool)

(declare-fun tp!81851 () Bool)

(assert (=> mapNonEmpty!42931 (= mapRes!42931 (and tp!81851 e!631791))))

(declare-fun mapKey!42931 () (_ BitVec 32))

(declare-fun mapValue!42931 () ValueCell!12995)

(declare-fun mapRest!42931 () (Array (_ BitVec 32) ValueCell!12995))

(assert (=> mapNonEmpty!42931 (= (arr!34535 _values!996) (store mapRest!42931 mapKey!42931 mapValue!42931))))

(assert (= (and start!97414 res!738156) b!1106815))

(assert (= (and b!1106815 res!738153) b!1106824))

(assert (= (and b!1106824 res!738159) b!1106816))

(assert (= (and b!1106816 res!738155) b!1106823))

(assert (= (and b!1106823 res!738151) b!1106814))

(assert (= (and b!1106814 res!738157) b!1106813))

(assert (= (and b!1106813 res!738154) b!1106820))

(assert (= (and b!1106820 res!738158) b!1106817))

(assert (= (and b!1106817 res!738160) b!1106812))

(assert (= (and b!1106812 res!738152) b!1106818))

(assert (= (and b!1106819 condMapEmpty!42931) mapIsEmpty!42931))

(assert (= (and b!1106819 (not condMapEmpty!42931)) mapNonEmpty!42931))

(get-info :version)

(assert (= (and mapNonEmpty!42931 ((_ is ValueCellFull!12995) mapValue!42931)) b!1106822))

(assert (= (and b!1106819 ((_ is ValueCellFull!12995) mapDefault!42931)) b!1106821))

(assert (= start!97414 b!1106819))

(declare-fun m!1026537 () Bool)

(assert (=> b!1106823 m!1026537))

(declare-fun m!1026539 () Bool)

(assert (=> b!1106818 m!1026539))

(declare-fun m!1026541 () Bool)

(assert (=> b!1106818 m!1026541))

(declare-fun m!1026543 () Bool)

(assert (=> b!1106812 m!1026543))

(declare-fun m!1026545 () Bool)

(assert (=> b!1106816 m!1026545))

(declare-fun m!1026547 () Bool)

(assert (=> mapNonEmpty!42931 m!1026547))

(declare-fun m!1026549 () Bool)

(assert (=> b!1106817 m!1026549))

(declare-fun m!1026551 () Bool)

(assert (=> b!1106817 m!1026551))

(declare-fun m!1026553 () Bool)

(assert (=> b!1106820 m!1026553))

(declare-fun m!1026555 () Bool)

(assert (=> b!1106815 m!1026555))

(declare-fun m!1026557 () Bool)

(assert (=> start!97414 m!1026557))

(declare-fun m!1026559 () Bool)

(assert (=> start!97414 m!1026559))

(declare-fun m!1026561 () Bool)

(assert (=> b!1106813 m!1026561))

(check-sat (not b!1106816) (not start!97414) (not b!1106813) (not b!1106818) (not b!1106815) (not mapNonEmpty!42931) (not b!1106823) (not b!1106812) (not b!1106817) tp_is_empty!27409)
(check-sat)
