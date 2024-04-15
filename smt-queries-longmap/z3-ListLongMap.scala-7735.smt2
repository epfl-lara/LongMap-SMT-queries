; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97132 () Bool)

(assert start!97132)

(declare-fun b!1104814 () Bool)

(declare-fun res!737180 () Bool)

(declare-fun e!630588 () Bool)

(assert (=> b!1104814 (=> (not res!737180) (not e!630588))))

(declare-datatypes ((array!71602 0))(
  ( (array!71603 (arr!34455 (Array (_ BitVec 32) (_ BitVec 64))) (size!34993 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71602)

(declare-datatypes ((List!24099 0))(
  ( (Nil!24096) (Cons!24095 (h!25304 (_ BitVec 64)) (t!34355 List!24099)) )
))
(declare-fun arrayNoDuplicates!0 (array!71602 (_ BitVec 32) List!24099) Bool)

(assert (=> b!1104814 (= res!737180 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24096))))

(declare-fun b!1104815 () Bool)

(declare-fun res!737175 () Bool)

(assert (=> b!1104815 (=> (not res!737175) (not e!630588))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104815 (= res!737175 (validMask!0 mask!1564))))

(declare-fun b!1104816 () Bool)

(declare-fun e!630586 () Bool)

(assert (=> b!1104816 (= e!630588 e!630586)))

(declare-fun res!737174 () Bool)

(assert (=> b!1104816 (=> (not res!737174) (not e!630586))))

(declare-fun lt!495027 () array!71602)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71602 (_ BitVec 32)) Bool)

(assert (=> b!1104816 (= res!737174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495027 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104816 (= lt!495027 (array!71603 (store (arr!34455 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34993 _keys!1208)))))

(declare-fun mapIsEmpty!42892 () Bool)

(declare-fun mapRes!42892 () Bool)

(assert (=> mapIsEmpty!42892 mapRes!42892))

(declare-fun b!1104817 () Bool)

(assert (=> b!1104817 (= e!630586 (not (bvslt #b00000000000000000000000000000000 (size!34993 _keys!1208))))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104817 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36075 0))(
  ( (Unit!36076) )
))
(declare-fun lt!495026 () Unit!36075)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71602 (_ BitVec 64) (_ BitVec 32)) Unit!36075)

(assert (=> b!1104817 (= lt!495026 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1104818 () Bool)

(declare-fun e!630585 () Bool)

(declare-fun e!630587 () Bool)

(assert (=> b!1104818 (= e!630585 (and e!630587 mapRes!42892))))

(declare-fun condMapEmpty!42892 () Bool)

(declare-datatypes ((V!41641 0))(
  ( (V!41642 (val!13749 Int)) )
))
(declare-datatypes ((ValueCell!12983 0))(
  ( (ValueCellFull!12983 (v!16381 V!41641)) (EmptyCell!12983) )
))
(declare-datatypes ((array!71604 0))(
  ( (array!71605 (arr!34456 (Array (_ BitVec 32) ValueCell!12983)) (size!34994 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71604)

(declare-fun mapDefault!42892 () ValueCell!12983)

(assert (=> b!1104818 (= condMapEmpty!42892 (= (arr!34456 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12983)) mapDefault!42892)))))

(declare-fun b!1104819 () Bool)

(declare-fun e!630589 () Bool)

(declare-fun tp_is_empty!27385 () Bool)

(assert (=> b!1104819 (= e!630589 tp_is_empty!27385)))

(declare-fun res!737176 () Bool)

(assert (=> start!97132 (=> (not res!737176) (not e!630588))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97132 (= res!737176 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34993 _keys!1208))))))

(assert (=> start!97132 e!630588))

(declare-fun array_inv!26568 (array!71602) Bool)

(assert (=> start!97132 (array_inv!26568 _keys!1208)))

(assert (=> start!97132 true))

(declare-fun array_inv!26569 (array!71604) Bool)

(assert (=> start!97132 (and (array_inv!26569 _values!996) e!630585)))

(declare-fun b!1104820 () Bool)

(declare-fun res!737177 () Bool)

(assert (=> b!1104820 (=> (not res!737177) (not e!630588))))

(assert (=> b!1104820 (= res!737177 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34993 _keys!1208))))))

(declare-fun b!1104821 () Bool)

(declare-fun res!737178 () Bool)

(assert (=> b!1104821 (=> (not res!737178) (not e!630588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104821 (= res!737178 (validKeyInArray!0 k0!934))))

(declare-fun b!1104822 () Bool)

(declare-fun res!737182 () Bool)

(assert (=> b!1104822 (=> (not res!737182) (not e!630586))))

(assert (=> b!1104822 (= res!737182 (arrayNoDuplicates!0 lt!495027 #b00000000000000000000000000000000 Nil!24096))))

(declare-fun b!1104823 () Bool)

(declare-fun res!737183 () Bool)

(assert (=> b!1104823 (=> (not res!737183) (not e!630588))))

(assert (=> b!1104823 (= res!737183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104824 () Bool)

(declare-fun res!737181 () Bool)

(assert (=> b!1104824 (=> (not res!737181) (not e!630588))))

(assert (=> b!1104824 (= res!737181 (= (select (arr!34455 _keys!1208) i!673) k0!934))))

(declare-fun b!1104825 () Bool)

(assert (=> b!1104825 (= e!630587 tp_is_empty!27385)))

(declare-fun mapNonEmpty!42892 () Bool)

(declare-fun tp!81812 () Bool)

(assert (=> mapNonEmpty!42892 (= mapRes!42892 (and tp!81812 e!630589))))

(declare-fun mapRest!42892 () (Array (_ BitVec 32) ValueCell!12983))

(declare-fun mapValue!42892 () ValueCell!12983)

(declare-fun mapKey!42892 () (_ BitVec 32))

(assert (=> mapNonEmpty!42892 (= (arr!34456 _values!996) (store mapRest!42892 mapKey!42892 mapValue!42892))))

(declare-fun b!1104826 () Bool)

(declare-fun res!737179 () Bool)

(assert (=> b!1104826 (=> (not res!737179) (not e!630588))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104826 (= res!737179 (and (= (size!34994 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34993 _keys!1208) (size!34994 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97132 res!737176) b!1104815))

(assert (= (and b!1104815 res!737175) b!1104826))

(assert (= (and b!1104826 res!737179) b!1104823))

(assert (= (and b!1104823 res!737183) b!1104814))

(assert (= (and b!1104814 res!737180) b!1104820))

(assert (= (and b!1104820 res!737177) b!1104821))

(assert (= (and b!1104821 res!737178) b!1104824))

(assert (= (and b!1104824 res!737181) b!1104816))

(assert (= (and b!1104816 res!737174) b!1104822))

(assert (= (and b!1104822 res!737182) b!1104817))

(assert (= (and b!1104818 condMapEmpty!42892) mapIsEmpty!42892))

(assert (= (and b!1104818 (not condMapEmpty!42892)) mapNonEmpty!42892))

(get-info :version)

(assert (= (and mapNonEmpty!42892 ((_ is ValueCellFull!12983) mapValue!42892)) b!1104819))

(assert (= (and b!1104818 ((_ is ValueCellFull!12983) mapDefault!42892)) b!1104825))

(assert (= start!97132 b!1104818))

(declare-fun m!1023889 () Bool)

(assert (=> b!1104814 m!1023889))

(declare-fun m!1023891 () Bool)

(assert (=> mapNonEmpty!42892 m!1023891))

(declare-fun m!1023893 () Bool)

(assert (=> b!1104824 m!1023893))

(declare-fun m!1023895 () Bool)

(assert (=> b!1104817 m!1023895))

(declare-fun m!1023897 () Bool)

(assert (=> b!1104817 m!1023897))

(declare-fun m!1023899 () Bool)

(assert (=> b!1104816 m!1023899))

(declare-fun m!1023901 () Bool)

(assert (=> b!1104816 m!1023901))

(declare-fun m!1023903 () Bool)

(assert (=> b!1104822 m!1023903))

(declare-fun m!1023905 () Bool)

(assert (=> b!1104821 m!1023905))

(declare-fun m!1023907 () Bool)

(assert (=> start!97132 m!1023907))

(declare-fun m!1023909 () Bool)

(assert (=> start!97132 m!1023909))

(declare-fun m!1023911 () Bool)

(assert (=> b!1104823 m!1023911))

(declare-fun m!1023913 () Bool)

(assert (=> b!1104815 m!1023913))

(check-sat (not b!1104823) (not start!97132) (not b!1104822) (not b!1104816) (not b!1104817) (not b!1104821) tp_is_empty!27385 (not b!1104814) (not b!1104815) (not mapNonEmpty!42892))
(check-sat)
