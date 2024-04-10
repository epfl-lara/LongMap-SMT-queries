; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97140 () Bool)

(assert start!97140)

(declare-fun b!1105006 () Bool)

(declare-fun res!737278 () Bool)

(declare-fun e!630701 () Bool)

(assert (=> b!1105006 (=> (not res!737278) (not e!630701))))

(declare-datatypes ((array!71695 0))(
  ( (array!71696 (arr!34501 (Array (_ BitVec 32) (_ BitVec 64))) (size!35037 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71695)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1105006 (= res!737278 (= (select (arr!34501 _keys!1208) i!673) k0!934))))

(declare-fun b!1105007 () Bool)

(declare-fun e!630698 () Bool)

(declare-fun e!630700 () Bool)

(declare-fun mapRes!42895 () Bool)

(assert (=> b!1105007 (= e!630698 (and e!630700 mapRes!42895))))

(declare-fun condMapEmpty!42895 () Bool)

(declare-datatypes ((V!41643 0))(
  ( (V!41644 (val!13750 Int)) )
))
(declare-datatypes ((ValueCell!12984 0))(
  ( (ValueCellFull!12984 (v!16383 V!41643)) (EmptyCell!12984) )
))
(declare-datatypes ((array!71697 0))(
  ( (array!71698 (arr!34502 (Array (_ BitVec 32) ValueCell!12984)) (size!35038 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71697)

(declare-fun mapDefault!42895 () ValueCell!12984)

(assert (=> b!1105007 (= condMapEmpty!42895 (= (arr!34502 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12984)) mapDefault!42895)))))

(declare-fun b!1105008 () Bool)

(declare-fun res!737279 () Bool)

(declare-fun e!630696 () Bool)

(assert (=> b!1105008 (=> (not res!737279) (not e!630696))))

(declare-fun lt!495232 () array!71695)

(declare-datatypes ((List!24067 0))(
  ( (Nil!24064) (Cons!24063 (h!25272 (_ BitVec 64)) (t!34332 List!24067)) )
))
(declare-fun arrayNoDuplicates!0 (array!71695 (_ BitVec 32) List!24067) Bool)

(assert (=> b!1105008 (= res!737279 (arrayNoDuplicates!0 lt!495232 #b00000000000000000000000000000000 Nil!24064))))

(declare-fun b!1105009 () Bool)

(assert (=> b!1105009 (= e!630696 (not (bvslt #b00000000000000000000000000000000 (size!35037 _keys!1208))))))

(declare-fun arrayContainsKey!0 (array!71695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105009 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36258 0))(
  ( (Unit!36259) )
))
(declare-fun lt!495233 () Unit!36258)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71695 (_ BitVec 64) (_ BitVec 32)) Unit!36258)

(assert (=> b!1105009 (= lt!495233 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1105010 () Bool)

(declare-fun res!737282 () Bool)

(assert (=> b!1105010 (=> (not res!737282) (not e!630701))))

(assert (=> b!1105010 (= res!737282 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24064))))

(declare-fun mapIsEmpty!42895 () Bool)

(assert (=> mapIsEmpty!42895 mapRes!42895))

(declare-fun b!1105012 () Bool)

(declare-fun tp_is_empty!27387 () Bool)

(assert (=> b!1105012 (= e!630700 tp_is_empty!27387)))

(declare-fun b!1105013 () Bool)

(declare-fun res!737274 () Bool)

(assert (=> b!1105013 (=> (not res!737274) (not e!630701))))

(assert (=> b!1105013 (= res!737274 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35037 _keys!1208))))))

(declare-fun b!1105014 () Bool)

(declare-fun res!737280 () Bool)

(assert (=> b!1105014 (=> (not res!737280) (not e!630701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105014 (= res!737280 (validKeyInArray!0 k0!934))))

(declare-fun b!1105015 () Bool)

(declare-fun e!630697 () Bool)

(assert (=> b!1105015 (= e!630697 tp_is_empty!27387)))

(declare-fun b!1105016 () Bool)

(declare-fun res!737281 () Bool)

(assert (=> b!1105016 (=> (not res!737281) (not e!630701))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105016 (= res!737281 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!42895 () Bool)

(declare-fun tp!81815 () Bool)

(assert (=> mapNonEmpty!42895 (= mapRes!42895 (and tp!81815 e!630697))))

(declare-fun mapValue!42895 () ValueCell!12984)

(declare-fun mapRest!42895 () (Array (_ BitVec 32) ValueCell!12984))

(declare-fun mapKey!42895 () (_ BitVec 32))

(assert (=> mapNonEmpty!42895 (= (arr!34502 _values!996) (store mapRest!42895 mapKey!42895 mapValue!42895))))

(declare-fun b!1105017 () Bool)

(declare-fun res!737273 () Bool)

(assert (=> b!1105017 (=> (not res!737273) (not e!630701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71695 (_ BitVec 32)) Bool)

(assert (=> b!1105017 (= res!737273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105018 () Bool)

(declare-fun res!737277 () Bool)

(assert (=> b!1105018 (=> (not res!737277) (not e!630701))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1105018 (= res!737277 (and (= (size!35038 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35037 _keys!1208) (size!35038 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!737276 () Bool)

(assert (=> start!97140 (=> (not res!737276) (not e!630701))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97140 (= res!737276 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35037 _keys!1208))))))

(assert (=> start!97140 e!630701))

(declare-fun array_inv!26560 (array!71695) Bool)

(assert (=> start!97140 (array_inv!26560 _keys!1208)))

(assert (=> start!97140 true))

(declare-fun array_inv!26561 (array!71697) Bool)

(assert (=> start!97140 (and (array_inv!26561 _values!996) e!630698)))

(declare-fun b!1105011 () Bool)

(assert (=> b!1105011 (= e!630701 e!630696)))

(declare-fun res!737275 () Bool)

(assert (=> b!1105011 (=> (not res!737275) (not e!630696))))

(assert (=> b!1105011 (= res!737275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495232 mask!1564))))

(assert (=> b!1105011 (= lt!495232 (array!71696 (store (arr!34501 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35037 _keys!1208)))))

(assert (= (and start!97140 res!737276) b!1105016))

(assert (= (and b!1105016 res!737281) b!1105018))

(assert (= (and b!1105018 res!737277) b!1105017))

(assert (= (and b!1105017 res!737273) b!1105010))

(assert (= (and b!1105010 res!737282) b!1105013))

(assert (= (and b!1105013 res!737274) b!1105014))

(assert (= (and b!1105014 res!737280) b!1105006))

(assert (= (and b!1105006 res!737278) b!1105011))

(assert (= (and b!1105011 res!737275) b!1105008))

(assert (= (and b!1105008 res!737279) b!1105009))

(assert (= (and b!1105007 condMapEmpty!42895) mapIsEmpty!42895))

(assert (= (and b!1105007 (not condMapEmpty!42895)) mapNonEmpty!42895))

(get-info :version)

(assert (= (and mapNonEmpty!42895 ((_ is ValueCellFull!12984) mapValue!42895)) b!1105015))

(assert (= (and b!1105007 ((_ is ValueCellFull!12984) mapDefault!42895)) b!1105012))

(assert (= start!97140 b!1105007))

(declare-fun m!1024541 () Bool)

(assert (=> mapNonEmpty!42895 m!1024541))

(declare-fun m!1024543 () Bool)

(assert (=> b!1105011 m!1024543))

(declare-fun m!1024545 () Bool)

(assert (=> b!1105011 m!1024545))

(declare-fun m!1024547 () Bool)

(assert (=> b!1105014 m!1024547))

(declare-fun m!1024549 () Bool)

(assert (=> start!97140 m!1024549))

(declare-fun m!1024551 () Bool)

(assert (=> start!97140 m!1024551))

(declare-fun m!1024553 () Bool)

(assert (=> b!1105009 m!1024553))

(declare-fun m!1024555 () Bool)

(assert (=> b!1105009 m!1024555))

(declare-fun m!1024557 () Bool)

(assert (=> b!1105010 m!1024557))

(declare-fun m!1024559 () Bool)

(assert (=> b!1105016 m!1024559))

(declare-fun m!1024561 () Bool)

(assert (=> b!1105017 m!1024561))

(declare-fun m!1024563 () Bool)

(assert (=> b!1105008 m!1024563))

(declare-fun m!1024565 () Bool)

(assert (=> b!1105006 m!1024565))

(check-sat (not b!1105014) (not b!1105011) (not b!1105010) (not start!97140) (not b!1105017) (not b!1105009) (not mapNonEmpty!42895) (not b!1105008) tp_is_empty!27387 (not b!1105016))
(check-sat)
