; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96964 () Bool)

(assert start!96964)

(declare-fun mapNonEmpty!42730 () Bool)

(declare-fun mapRes!42730 () Bool)

(declare-fun tp!81650 () Bool)

(declare-fun e!629627 () Bool)

(assert (=> mapNonEmpty!42730 (= mapRes!42730 (and tp!81650 e!629627))))

(declare-fun mapKey!42730 () (_ BitVec 32))

(declare-datatypes ((V!41513 0))(
  ( (V!41514 (val!13701 Int)) )
))
(declare-datatypes ((ValueCell!12935 0))(
  ( (ValueCellFull!12935 (v!16331 V!41513)) (EmptyCell!12935) )
))
(declare-fun mapValue!42730 () ValueCell!12935)

(declare-fun mapRest!42730 () (Array (_ BitVec 32) ValueCell!12935))

(declare-datatypes ((array!71410 0))(
  ( (array!71411 (arr!34365 (Array (_ BitVec 32) ValueCell!12935)) (size!34903 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71410)

(assert (=> mapNonEmpty!42730 (= (arr!34365 _values!996) (store mapRest!42730 mapKey!42730 mapValue!42730))))

(declare-fun res!735940 () Bool)

(declare-fun e!629625 () Bool)

(assert (=> start!96964 (=> (not res!735940) (not e!629625))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71412 0))(
  ( (array!71413 (arr!34366 (Array (_ BitVec 32) (_ BitVec 64))) (size!34904 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71412)

(assert (=> start!96964 (= res!735940 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34904 _keys!1208))))))

(assert (=> start!96964 e!629625))

(declare-fun array_inv!26502 (array!71412) Bool)

(assert (=> start!96964 (array_inv!26502 _keys!1208)))

(assert (=> start!96964 true))

(declare-fun e!629628 () Bool)

(declare-fun array_inv!26503 (array!71410) Bool)

(assert (=> start!96964 (and (array_inv!26503 _values!996) e!629628)))

(declare-fun b!1103037 () Bool)

(declare-fun res!735938 () Bool)

(assert (=> b!1103037 (=> (not res!735938) (not e!629625))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103037 (= res!735938 (validMask!0 mask!1564))))

(declare-fun b!1103038 () Bool)

(declare-fun e!629629 () Bool)

(declare-fun tp_is_empty!27289 () Bool)

(assert (=> b!1103038 (= e!629629 tp_is_empty!27289)))

(declare-fun b!1103039 () Bool)

(assert (=> b!1103039 (= e!629628 (and e!629629 mapRes!42730))))

(declare-fun condMapEmpty!42730 () Bool)

(declare-fun mapDefault!42730 () ValueCell!12935)

(assert (=> b!1103039 (= condMapEmpty!42730 (= (arr!34365 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12935)) mapDefault!42730)))))

(declare-fun b!1103040 () Bool)

(declare-fun res!735939 () Bool)

(assert (=> b!1103040 (=> (not res!735939) (not e!629625))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103040 (= res!735939 (and (= (size!34903 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34904 _keys!1208) (size!34903 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103041 () Bool)

(assert (=> b!1103041 (= e!629627 tp_is_empty!27289)))

(declare-fun mapIsEmpty!42730 () Bool)

(assert (=> mapIsEmpty!42730 mapRes!42730))

(declare-fun b!1103042 () Bool)

(declare-fun res!735937 () Bool)

(assert (=> b!1103042 (=> (not res!735937) (not e!629625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71412 (_ BitVec 32)) Bool)

(assert (=> b!1103042 (= res!735937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103043 () Bool)

(assert (=> b!1103043 (= e!629625 (and (bvsle #b00000000000000000000000000000000 (size!34904 _keys!1208)) (bvsge (size!34904 _keys!1208) #b01111111111111111111111111111111)))))

(assert (= (and start!96964 res!735940) b!1103037))

(assert (= (and b!1103037 res!735938) b!1103040))

(assert (= (and b!1103040 res!735939) b!1103042))

(assert (= (and b!1103042 res!735937) b!1103043))

(assert (= (and b!1103039 condMapEmpty!42730) mapIsEmpty!42730))

(assert (= (and b!1103039 (not condMapEmpty!42730)) mapNonEmpty!42730))

(get-info :version)

(assert (= (and mapNonEmpty!42730 ((_ is ValueCellFull!12935) mapValue!42730)) b!1103041))

(assert (= (and b!1103039 ((_ is ValueCellFull!12935) mapDefault!42730)) b!1103038))

(assert (= start!96964 b!1103039))

(declare-fun m!1022833 () Bool)

(assert (=> mapNonEmpty!42730 m!1022833))

(declare-fun m!1022835 () Bool)

(assert (=> start!96964 m!1022835))

(declare-fun m!1022837 () Bool)

(assert (=> start!96964 m!1022837))

(declare-fun m!1022839 () Bool)

(assert (=> b!1103037 m!1022839))

(declare-fun m!1022841 () Bool)

(assert (=> b!1103042 m!1022841))

(check-sat (not b!1103037) (not start!96964) tp_is_empty!27289 (not b!1103042) (not mapNonEmpty!42730))
(check-sat)
(get-model)

(declare-fun bm!46293 () Bool)

(declare-fun call!46296 () Bool)

(assert (=> bm!46293 (= call!46296 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1103094 () Bool)

(declare-fun e!629668 () Bool)

(assert (=> b!1103094 (= e!629668 call!46296)))

(declare-fun b!1103095 () Bool)

(declare-fun e!629666 () Bool)

(assert (=> b!1103095 (= e!629666 call!46296)))

(declare-fun d!130647 () Bool)

(declare-fun res!735969 () Bool)

(declare-fun e!629667 () Bool)

(assert (=> d!130647 (=> res!735969 e!629667)))

(assert (=> d!130647 (= res!735969 (bvsge #b00000000000000000000000000000000 (size!34904 _keys!1208)))))

(assert (=> d!130647 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!629667)))

(declare-fun b!1103096 () Bool)

(assert (=> b!1103096 (= e!629666 e!629668)))

(declare-fun lt!494851 () (_ BitVec 64))

(assert (=> b!1103096 (= lt!494851 (select (arr!34366 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36061 0))(
  ( (Unit!36062) )
))
(declare-fun lt!494849 () Unit!36061)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71412 (_ BitVec 64) (_ BitVec 32)) Unit!36061)

(assert (=> b!1103096 (= lt!494849 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!494851 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103096 (arrayContainsKey!0 _keys!1208 lt!494851 #b00000000000000000000000000000000)))

(declare-fun lt!494850 () Unit!36061)

(assert (=> b!1103096 (= lt!494850 lt!494849)))

(declare-fun res!735970 () Bool)

(declare-datatypes ((SeekEntryResult!9917 0))(
  ( (MissingZero!9917 (index!42039 (_ BitVec 32))) (Found!9917 (index!42040 (_ BitVec 32))) (Intermediate!9917 (undefined!10729 Bool) (index!42041 (_ BitVec 32)) (x!99223 (_ BitVec 32))) (Undefined!9917) (MissingVacant!9917 (index!42042 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71412 (_ BitVec 32)) SeekEntryResult!9917)

(assert (=> b!1103096 (= res!735970 (= (seekEntryOrOpen!0 (select (arr!34366 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9917 #b00000000000000000000000000000000)))))

(assert (=> b!1103096 (=> (not res!735970) (not e!629668))))

(declare-fun b!1103097 () Bool)

(assert (=> b!1103097 (= e!629667 e!629666)))

(declare-fun c!108934 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103097 (= c!108934 (validKeyInArray!0 (select (arr!34366 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!130647 (not res!735969)) b!1103097))

(assert (= (and b!1103097 c!108934) b!1103096))

(assert (= (and b!1103097 (not c!108934)) b!1103095))

(assert (= (and b!1103096 res!735970) b!1103094))

(assert (= (or b!1103094 b!1103095) bm!46293))

(declare-fun m!1022863 () Bool)

(assert (=> bm!46293 m!1022863))

(declare-fun m!1022865 () Bool)

(assert (=> b!1103096 m!1022865))

(declare-fun m!1022867 () Bool)

(assert (=> b!1103096 m!1022867))

(declare-fun m!1022869 () Bool)

(assert (=> b!1103096 m!1022869))

(assert (=> b!1103096 m!1022865))

(declare-fun m!1022871 () Bool)

(assert (=> b!1103096 m!1022871))

(assert (=> b!1103097 m!1022865))

(assert (=> b!1103097 m!1022865))

(declare-fun m!1022873 () Bool)

(assert (=> b!1103097 m!1022873))

(assert (=> b!1103042 d!130647))

(declare-fun d!130649 () Bool)

(assert (=> d!130649 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1103037 d!130649))

(declare-fun d!130651 () Bool)

(assert (=> d!130651 (= (array_inv!26502 _keys!1208) (bvsge (size!34904 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!96964 d!130651))

(declare-fun d!130653 () Bool)

(assert (=> d!130653 (= (array_inv!26503 _values!996) (bvsge (size!34903 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!96964 d!130653))

(declare-fun mapIsEmpty!42739 () Bool)

(declare-fun mapRes!42739 () Bool)

(assert (=> mapIsEmpty!42739 mapRes!42739))

(declare-fun b!1103104 () Bool)

(declare-fun e!629673 () Bool)

(assert (=> b!1103104 (= e!629673 tp_is_empty!27289)))

(declare-fun mapNonEmpty!42739 () Bool)

(declare-fun tp!81659 () Bool)

(assert (=> mapNonEmpty!42739 (= mapRes!42739 (and tp!81659 e!629673))))

(declare-fun mapRest!42739 () (Array (_ BitVec 32) ValueCell!12935))

(declare-fun mapKey!42739 () (_ BitVec 32))

(declare-fun mapValue!42739 () ValueCell!12935)

(assert (=> mapNonEmpty!42739 (= mapRest!42730 (store mapRest!42739 mapKey!42739 mapValue!42739))))

(declare-fun b!1103105 () Bool)

(declare-fun e!629674 () Bool)

(assert (=> b!1103105 (= e!629674 tp_is_empty!27289)))

(declare-fun condMapEmpty!42739 () Bool)

(declare-fun mapDefault!42739 () ValueCell!12935)

(assert (=> mapNonEmpty!42730 (= condMapEmpty!42739 (= mapRest!42730 ((as const (Array (_ BitVec 32) ValueCell!12935)) mapDefault!42739)))))

(assert (=> mapNonEmpty!42730 (= tp!81650 (and e!629674 mapRes!42739))))

(assert (= (and mapNonEmpty!42730 condMapEmpty!42739) mapIsEmpty!42739))

(assert (= (and mapNonEmpty!42730 (not condMapEmpty!42739)) mapNonEmpty!42739))

(assert (= (and mapNonEmpty!42739 ((_ is ValueCellFull!12935) mapValue!42739)) b!1103104))

(assert (= (and mapNonEmpty!42730 ((_ is ValueCellFull!12935) mapDefault!42739)) b!1103105))

(declare-fun m!1022875 () Bool)

(assert (=> mapNonEmpty!42739 m!1022875))

(check-sat (not b!1103097) (not b!1103096) (not bm!46293) tp_is_empty!27289 (not mapNonEmpty!42739))
(check-sat)
