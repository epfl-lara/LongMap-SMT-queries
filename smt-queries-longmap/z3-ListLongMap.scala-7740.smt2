; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97420 () Bool)

(assert start!97420)

(declare-fun b!1106929 () Bool)

(declare-fun e!631848 () Bool)

(declare-fun tp_is_empty!27415 () Bool)

(assert (=> b!1106929 (= e!631848 tp_is_empty!27415)))

(declare-fun b!1106930 () Bool)

(declare-fun res!738242 () Bool)

(declare-fun e!631844 () Bool)

(assert (=> b!1106930 (=> (not res!738242) (not e!631844))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1106930 (= res!738242 (validMask!0 mask!1564))))

(declare-fun b!1106931 () Bool)

(declare-fun res!738246 () Bool)

(assert (=> b!1106931 (=> (not res!738246) (not e!631844))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71787 0))(
  ( (array!71788 (arr!34540 (Array (_ BitVec 32) (_ BitVec 64))) (size!35077 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71787)

(assert (=> b!1106931 (= res!738246 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35077 _keys!1208))))))

(declare-fun mapNonEmpty!42940 () Bool)

(declare-fun mapRes!42940 () Bool)

(declare-fun tp!81860 () Bool)

(declare-fun e!631846 () Bool)

(assert (=> mapNonEmpty!42940 (= mapRes!42940 (and tp!81860 e!631846))))

(declare-datatypes ((V!41681 0))(
  ( (V!41682 (val!13764 Int)) )
))
(declare-datatypes ((ValueCell!12998 0))(
  ( (ValueCellFull!12998 (v!16393 V!41681)) (EmptyCell!12998) )
))
(declare-fun mapRest!42940 () (Array (_ BitVec 32) ValueCell!12998))

(declare-datatypes ((array!71789 0))(
  ( (array!71790 (arr!34541 (Array (_ BitVec 32) ValueCell!12998)) (size!35078 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71789)

(declare-fun mapValue!42940 () ValueCell!12998)

(declare-fun mapKey!42940 () (_ BitVec 32))

(assert (=> mapNonEmpty!42940 (= (arr!34541 _values!996) (store mapRest!42940 mapKey!42940 mapValue!42940))))

(declare-fun res!738245 () Bool)

(assert (=> start!97420 (=> (not res!738245) (not e!631844))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97420 (= res!738245 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35077 _keys!1208))))))

(assert (=> start!97420 e!631844))

(declare-fun array_inv!26626 (array!71787) Bool)

(assert (=> start!97420 (array_inv!26626 _keys!1208)))

(assert (=> start!97420 true))

(declare-fun e!631845 () Bool)

(declare-fun array_inv!26627 (array!71789) Bool)

(assert (=> start!97420 (and (array_inv!26627 _values!996) e!631845)))

(declare-fun b!1106932 () Bool)

(declare-fun res!738249 () Bool)

(assert (=> b!1106932 (=> (not res!738249) (not e!631844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71787 (_ BitVec 32)) Bool)

(assert (=> b!1106932 (= res!738249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!42940 () Bool)

(assert (=> mapIsEmpty!42940 mapRes!42940))

(declare-fun b!1106933 () Bool)

(declare-fun res!738250 () Bool)

(assert (=> b!1106933 (=> (not res!738250) (not e!631844))))

(declare-datatypes ((List!24101 0))(
  ( (Nil!24098) (Cons!24097 (h!25315 (_ BitVec 64)) (t!34358 List!24101)) )
))
(declare-fun arrayNoDuplicates!0 (array!71787 (_ BitVec 32) List!24101) Bool)

(assert (=> b!1106933 (= res!738250 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24098))))

(declare-fun b!1106934 () Bool)

(declare-fun res!738248 () Bool)

(declare-fun e!631847 () Bool)

(assert (=> b!1106934 (=> (not res!738248) (not e!631847))))

(declare-fun lt!495846 () array!71787)

(assert (=> b!1106934 (= res!738248 (arrayNoDuplicates!0 lt!495846 #b00000000000000000000000000000000 Nil!24098))))

(declare-fun b!1106935 () Bool)

(assert (=> b!1106935 (= e!631844 e!631847)))

(declare-fun res!738243 () Bool)

(assert (=> b!1106935 (=> (not res!738243) (not e!631847))))

(assert (=> b!1106935 (= res!738243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495846 mask!1564))))

(assert (=> b!1106935 (= lt!495846 (array!71788 (store (arr!34540 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35077 _keys!1208)))))

(declare-fun b!1106936 () Bool)

(assert (=> b!1106936 (= e!631847 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71787 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1106936 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36271 0))(
  ( (Unit!36272) )
))
(declare-fun lt!495847 () Unit!36271)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71787 (_ BitVec 64) (_ BitVec 32)) Unit!36271)

(assert (=> b!1106936 (= lt!495847 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1106937 () Bool)

(assert (=> b!1106937 (= e!631845 (and e!631848 mapRes!42940))))

(declare-fun condMapEmpty!42940 () Bool)

(declare-fun mapDefault!42940 () ValueCell!12998)

(assert (=> b!1106937 (= condMapEmpty!42940 (= (arr!34541 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12998)) mapDefault!42940)))))

(declare-fun b!1106938 () Bool)

(declare-fun res!738241 () Bool)

(assert (=> b!1106938 (=> (not res!738241) (not e!631844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106938 (= res!738241 (validKeyInArray!0 k0!934))))

(declare-fun b!1106939 () Bool)

(assert (=> b!1106939 (= e!631846 tp_is_empty!27415)))

(declare-fun b!1106940 () Bool)

(declare-fun res!738244 () Bool)

(assert (=> b!1106940 (=> (not res!738244) (not e!631844))))

(assert (=> b!1106940 (= res!738244 (= (select (arr!34540 _keys!1208) i!673) k0!934))))

(declare-fun b!1106941 () Bool)

(declare-fun res!738247 () Bool)

(assert (=> b!1106941 (=> (not res!738247) (not e!631844))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1106941 (= res!738247 (and (= (size!35078 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35077 _keys!1208) (size!35078 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97420 res!738245) b!1106930))

(assert (= (and b!1106930 res!738242) b!1106941))

(assert (= (and b!1106941 res!738247) b!1106932))

(assert (= (and b!1106932 res!738249) b!1106933))

(assert (= (and b!1106933 res!738250) b!1106931))

(assert (= (and b!1106931 res!738246) b!1106938))

(assert (= (and b!1106938 res!738241) b!1106940))

(assert (= (and b!1106940 res!738244) b!1106935))

(assert (= (and b!1106935 res!738243) b!1106934))

(assert (= (and b!1106934 res!738248) b!1106936))

(assert (= (and b!1106937 condMapEmpty!42940) mapIsEmpty!42940))

(assert (= (and b!1106937 (not condMapEmpty!42940)) mapNonEmpty!42940))

(get-info :version)

(assert (= (and mapNonEmpty!42940 ((_ is ValueCellFull!12998) mapValue!42940)) b!1106939))

(assert (= (and b!1106937 ((_ is ValueCellFull!12998) mapDefault!42940)) b!1106929))

(assert (= start!97420 b!1106937))

(declare-fun m!1026615 () Bool)

(assert (=> b!1106932 m!1026615))

(declare-fun m!1026617 () Bool)

(assert (=> b!1106933 m!1026617))

(declare-fun m!1026619 () Bool)

(assert (=> b!1106938 m!1026619))

(declare-fun m!1026621 () Bool)

(assert (=> b!1106940 m!1026621))

(declare-fun m!1026623 () Bool)

(assert (=> mapNonEmpty!42940 m!1026623))

(declare-fun m!1026625 () Bool)

(assert (=> b!1106935 m!1026625))

(declare-fun m!1026627 () Bool)

(assert (=> b!1106935 m!1026627))

(declare-fun m!1026629 () Bool)

(assert (=> b!1106936 m!1026629))

(declare-fun m!1026631 () Bool)

(assert (=> b!1106936 m!1026631))

(declare-fun m!1026633 () Bool)

(assert (=> b!1106934 m!1026633))

(declare-fun m!1026635 () Bool)

(assert (=> b!1106930 m!1026635))

(declare-fun m!1026637 () Bool)

(assert (=> start!97420 m!1026637))

(declare-fun m!1026639 () Bool)

(assert (=> start!97420 m!1026639))

(check-sat (not b!1106935) (not b!1106936) tp_is_empty!27415 (not b!1106933) (not start!97420) (not mapNonEmpty!42940) (not b!1106930) (not b!1106932) (not b!1106934) (not b!1106938))
(check-sat)
