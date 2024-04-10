; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97198 () Bool)

(assert start!97198)

(declare-fun res!737929 () Bool)

(declare-fun e!631116 () Bool)

(assert (=> start!97198 (=> (not res!737929) (not e!631116))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71775 0))(
  ( (array!71776 (arr!34540 (Array (_ BitVec 32) (_ BitVec 64))) (size!35076 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71775)

(assert (=> start!97198 (= res!737929 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35076 _keys!1208))))))

(assert (=> start!97198 e!631116))

(declare-fun array_inv!26584 (array!71775) Bool)

(assert (=> start!97198 (array_inv!26584 _keys!1208)))

(assert (=> start!97198 true))

(declare-datatypes ((V!41699 0))(
  ( (V!41700 (val!13771 Int)) )
))
(declare-datatypes ((ValueCell!13005 0))(
  ( (ValueCellFull!13005 (v!16404 V!41699)) (EmptyCell!13005) )
))
(declare-datatypes ((array!71777 0))(
  ( (array!71778 (arr!34541 (Array (_ BitVec 32) ValueCell!13005)) (size!35077 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71777)

(declare-fun e!631114 () Bool)

(declare-fun array_inv!26585 (array!71777) Bool)

(assert (=> start!97198 (and (array_inv!26585 _values!996) e!631114)))

(declare-fun b!1105875 () Bool)

(declare-fun e!631119 () Bool)

(declare-fun mapRes!42961 () Bool)

(assert (=> b!1105875 (= e!631114 (and e!631119 mapRes!42961))))

(declare-fun condMapEmpty!42961 () Bool)

(declare-fun mapDefault!42961 () ValueCell!13005)

(assert (=> b!1105875 (= condMapEmpty!42961 (= (arr!34541 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13005)) mapDefault!42961)))))

(declare-fun b!1105876 () Bool)

(declare-fun tp_is_empty!27429 () Bool)

(assert (=> b!1105876 (= e!631119 tp_is_empty!27429)))

(declare-fun b!1105877 () Bool)

(declare-fun res!737934 () Bool)

(assert (=> b!1105877 (=> (not res!737934) (not e!631116))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1105877 (= res!737934 (and (= (size!35077 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35076 _keys!1208) (size!35077 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42961 () Bool)

(declare-fun tp!81881 () Bool)

(declare-fun e!631115 () Bool)

(assert (=> mapNonEmpty!42961 (= mapRes!42961 (and tp!81881 e!631115))))

(declare-fun mapRest!42961 () (Array (_ BitVec 32) ValueCell!13005))

(declare-fun mapValue!42961 () ValueCell!13005)

(declare-fun mapKey!42961 () (_ BitVec 32))

(assert (=> mapNonEmpty!42961 (= (arr!34541 _values!996) (store mapRest!42961 mapKey!42961 mapValue!42961))))

(declare-fun mapIsEmpty!42961 () Bool)

(assert (=> mapIsEmpty!42961 mapRes!42961))

(declare-fun b!1105878 () Bool)

(declare-fun res!737931 () Bool)

(declare-fun e!631117 () Bool)

(assert (=> b!1105878 (=> (not res!737931) (not e!631117))))

(declare-fun lt!495374 () array!71775)

(declare-datatypes ((List!24082 0))(
  ( (Nil!24079) (Cons!24078 (h!25287 (_ BitVec 64)) (t!34347 List!24082)) )
))
(declare-fun arrayNoDuplicates!0 (array!71775 (_ BitVec 32) List!24082) Bool)

(assert (=> b!1105878 (= res!737931 (arrayNoDuplicates!0 lt!495374 #b00000000000000000000000000000000 Nil!24079))))

(declare-fun b!1105879 () Bool)

(declare-fun res!737932 () Bool)

(assert (=> b!1105879 (=> (not res!737932) (not e!631116))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105879 (= res!737932 (validKeyInArray!0 k0!934))))

(declare-fun b!1105880 () Bool)

(assert (=> b!1105880 (= e!631115 tp_is_empty!27429)))

(declare-fun b!1105881 () Bool)

(assert (=> b!1105881 (= e!631117 (not true))))

(declare-fun arrayContainsKey!0 (array!71775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105881 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36284 0))(
  ( (Unit!36285) )
))
(declare-fun lt!495373 () Unit!36284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71775 (_ BitVec 64) (_ BitVec 32)) Unit!36284)

(assert (=> b!1105881 (= lt!495373 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105882 () Bool)

(declare-fun res!737938 () Bool)

(assert (=> b!1105882 (=> (not res!737938) (not e!631116))))

(assert (=> b!1105882 (= res!737938 (= (select (arr!34540 _keys!1208) i!673) k0!934))))

(declare-fun b!1105883 () Bool)

(declare-fun res!737936 () Bool)

(assert (=> b!1105883 (=> (not res!737936) (not e!631116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105883 (= res!737936 (validMask!0 mask!1564))))

(declare-fun b!1105884 () Bool)

(declare-fun res!737937 () Bool)

(assert (=> b!1105884 (=> (not res!737937) (not e!631116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71775 (_ BitVec 32)) Bool)

(assert (=> b!1105884 (= res!737937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105885 () Bool)

(declare-fun res!737930 () Bool)

(assert (=> b!1105885 (=> (not res!737930) (not e!631116))))

(assert (=> b!1105885 (= res!737930 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35076 _keys!1208))))))

(declare-fun b!1105886 () Bool)

(assert (=> b!1105886 (= e!631116 e!631117)))

(declare-fun res!737935 () Bool)

(assert (=> b!1105886 (=> (not res!737935) (not e!631117))))

(assert (=> b!1105886 (= res!737935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495374 mask!1564))))

(assert (=> b!1105886 (= lt!495374 (array!71776 (store (arr!34540 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35076 _keys!1208)))))

(declare-fun b!1105887 () Bool)

(declare-fun res!737933 () Bool)

(assert (=> b!1105887 (=> (not res!737933) (not e!631116))))

(assert (=> b!1105887 (= res!737933 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24079))))

(assert (= (and start!97198 res!737929) b!1105883))

(assert (= (and b!1105883 res!737936) b!1105877))

(assert (= (and b!1105877 res!737934) b!1105884))

(assert (= (and b!1105884 res!737937) b!1105887))

(assert (= (and b!1105887 res!737933) b!1105885))

(assert (= (and b!1105885 res!737930) b!1105879))

(assert (= (and b!1105879 res!737932) b!1105882))

(assert (= (and b!1105882 res!737938) b!1105886))

(assert (= (and b!1105886 res!737935) b!1105878))

(assert (= (and b!1105878 res!737931) b!1105881))

(assert (= (and b!1105875 condMapEmpty!42961) mapIsEmpty!42961))

(assert (= (and b!1105875 (not condMapEmpty!42961)) mapNonEmpty!42961))

(get-info :version)

(assert (= (and mapNonEmpty!42961 ((_ is ValueCellFull!13005) mapValue!42961)) b!1105880))

(assert (= (and b!1105875 ((_ is ValueCellFull!13005) mapDefault!42961)) b!1105876))

(assert (= start!97198 b!1105875))

(declare-fun m!1025125 () Bool)

(assert (=> b!1105882 m!1025125))

(declare-fun m!1025127 () Bool)

(assert (=> b!1105881 m!1025127))

(declare-fun m!1025129 () Bool)

(assert (=> b!1105881 m!1025129))

(declare-fun m!1025131 () Bool)

(assert (=> start!97198 m!1025131))

(declare-fun m!1025133 () Bool)

(assert (=> start!97198 m!1025133))

(declare-fun m!1025135 () Bool)

(assert (=> b!1105887 m!1025135))

(declare-fun m!1025137 () Bool)

(assert (=> b!1105886 m!1025137))

(declare-fun m!1025139 () Bool)

(assert (=> b!1105886 m!1025139))

(declare-fun m!1025141 () Bool)

(assert (=> b!1105884 m!1025141))

(declare-fun m!1025143 () Bool)

(assert (=> b!1105879 m!1025143))

(declare-fun m!1025145 () Bool)

(assert (=> mapNonEmpty!42961 m!1025145))

(declare-fun m!1025147 () Bool)

(assert (=> b!1105883 m!1025147))

(declare-fun m!1025149 () Bool)

(assert (=> b!1105878 m!1025149))

(check-sat (not b!1105884) (not mapNonEmpty!42961) (not b!1105886) (not start!97198) (not b!1105879) (not b!1105887) tp_is_empty!27429 (not b!1105878) (not b!1105881) (not b!1105883))
(check-sat)
