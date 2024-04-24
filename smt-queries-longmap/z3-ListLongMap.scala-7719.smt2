; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97206 () Bool)

(assert start!97206)

(declare-fun b!1104517 () Bool)

(declare-fun res!736530 () Bool)

(declare-fun e!630574 () Bool)

(assert (=> b!1104517 (=> (not res!736530) (not e!630574))))

(declare-datatypes ((array!71537 0))(
  ( (array!71538 (arr!34422 (Array (_ BitVec 32) (_ BitVec 64))) (size!34959 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71537)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41513 0))(
  ( (V!41514 (val!13701 Int)) )
))
(declare-datatypes ((ValueCell!12935 0))(
  ( (ValueCellFull!12935 (v!16328 V!41513)) (EmptyCell!12935) )
))
(declare-datatypes ((array!71539 0))(
  ( (array!71540 (arr!34423 (Array (_ BitVec 32) ValueCell!12935)) (size!34960 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71539)

(assert (=> b!1104517 (= res!736530 (and (= (size!34960 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34959 _keys!1208) (size!34960 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104518 () Bool)

(declare-fun res!736531 () Bool)

(assert (=> b!1104518 (=> (not res!736531) (not e!630574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104518 (= res!736531 (validMask!0 mask!1564))))

(declare-fun b!1104519 () Bool)

(declare-fun e!630573 () Bool)

(declare-fun e!630577 () Bool)

(declare-fun mapRes!42730 () Bool)

(assert (=> b!1104519 (= e!630573 (and e!630577 mapRes!42730))))

(declare-fun condMapEmpty!42730 () Bool)

(declare-fun mapDefault!42730 () ValueCell!12935)

(assert (=> b!1104519 (= condMapEmpty!42730 (= (arr!34423 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12935)) mapDefault!42730)))))

(declare-fun b!1104520 () Bool)

(declare-fun tp_is_empty!27289 () Bool)

(assert (=> b!1104520 (= e!630577 tp_is_empty!27289)))

(declare-fun res!736529 () Bool)

(assert (=> start!97206 (=> (not res!736529) (not e!630574))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97206 (= res!736529 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34959 _keys!1208))))))

(assert (=> start!97206 e!630574))

(declare-fun array_inv!26542 (array!71537) Bool)

(assert (=> start!97206 (array_inv!26542 _keys!1208)))

(assert (=> start!97206 true))

(declare-fun array_inv!26543 (array!71539) Bool)

(assert (=> start!97206 (and (array_inv!26543 _values!996) e!630573)))

(declare-fun b!1104521 () Bool)

(declare-fun res!736528 () Bool)

(assert (=> b!1104521 (=> (not res!736528) (not e!630574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71537 (_ BitVec 32)) Bool)

(assert (=> b!1104521 (= res!736528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!42730 () Bool)

(assert (=> mapIsEmpty!42730 mapRes!42730))

(declare-fun b!1104522 () Bool)

(declare-fun e!630575 () Bool)

(assert (=> b!1104522 (= e!630575 tp_is_empty!27289)))

(declare-fun mapNonEmpty!42730 () Bool)

(declare-fun tp!81650 () Bool)

(assert (=> mapNonEmpty!42730 (= mapRes!42730 (and tp!81650 e!630575))))

(declare-fun mapValue!42730 () ValueCell!12935)

(declare-fun mapKey!42730 () (_ BitVec 32))

(declare-fun mapRest!42730 () (Array (_ BitVec 32) ValueCell!12935))

(assert (=> mapNonEmpty!42730 (= (arr!34423 _values!996) (store mapRest!42730 mapKey!42730 mapValue!42730))))

(declare-fun b!1104523 () Bool)

(assert (=> b!1104523 (= e!630574 (and (bvsle #b00000000000000000000000000000000 (size!34959 _keys!1208)) (bvsge (size!34959 _keys!1208) #b01111111111111111111111111111111)))))

(assert (= (and start!97206 res!736529) b!1104518))

(assert (= (and b!1104518 res!736531) b!1104517))

(assert (= (and b!1104517 res!736530) b!1104521))

(assert (= (and b!1104521 res!736528) b!1104523))

(assert (= (and b!1104519 condMapEmpty!42730) mapIsEmpty!42730))

(assert (= (and b!1104519 (not condMapEmpty!42730)) mapNonEmpty!42730))

(get-info :version)

(assert (= (and mapNonEmpty!42730 ((_ is ValueCellFull!12935) mapValue!42730)) b!1104522))

(assert (= (and b!1104519 ((_ is ValueCellFull!12935) mapDefault!42730)) b!1104520))

(assert (= start!97206 b!1104519))

(declare-fun m!1025131 () Bool)

(assert (=> b!1104518 m!1025131))

(declare-fun m!1025133 () Bool)

(assert (=> start!97206 m!1025133))

(declare-fun m!1025135 () Bool)

(assert (=> start!97206 m!1025135))

(declare-fun m!1025137 () Bool)

(assert (=> b!1104521 m!1025137))

(declare-fun m!1025139 () Bool)

(assert (=> mapNonEmpty!42730 m!1025139))

(check-sat (not b!1104521) tp_is_empty!27289 (not b!1104518) (not start!97206) (not mapNonEmpty!42730))
(check-sat)
(get-model)

(declare-fun b!1104574 () Bool)

(declare-fun e!630616 () Bool)

(declare-fun e!630614 () Bool)

(assert (=> b!1104574 (= e!630616 e!630614)))

(declare-fun lt!495566 () (_ BitVec 64))

(assert (=> b!1104574 (= lt!495566 (select (arr!34422 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36231 0))(
  ( (Unit!36232) )
))
(declare-fun lt!495565 () Unit!36231)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71537 (_ BitVec 64) (_ BitVec 32)) Unit!36231)

(assert (=> b!1104574 (= lt!495565 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495566 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104574 (arrayContainsKey!0 _keys!1208 lt!495566 #b00000000000000000000000000000000)))

(declare-fun lt!495564 () Unit!36231)

(assert (=> b!1104574 (= lt!495564 lt!495565)))

(declare-fun res!736561 () Bool)

(declare-datatypes ((SeekEntryResult!9874 0))(
  ( (MissingZero!9874 (index!41867 (_ BitVec 32))) (Found!9874 (index!41868 (_ BitVec 32))) (Intermediate!9874 (undefined!10686 Bool) (index!41869 (_ BitVec 32)) (x!99205 (_ BitVec 32))) (Undefined!9874) (MissingVacant!9874 (index!41870 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71537 (_ BitVec 32)) SeekEntryResult!9874)

(assert (=> b!1104574 (= res!736561 (= (seekEntryOrOpen!0 (select (arr!34422 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9874 #b00000000000000000000000000000000)))))

(assert (=> b!1104574 (=> (not res!736561) (not e!630614))))

(declare-fun d!131267 () Bool)

(declare-fun res!736560 () Bool)

(declare-fun e!630615 () Bool)

(assert (=> d!131267 (=> res!736560 e!630615)))

(assert (=> d!131267 (= res!736560 (bvsge #b00000000000000000000000000000000 (size!34959 _keys!1208)))))

(assert (=> d!131267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!630615)))

(declare-fun b!1104575 () Bool)

(assert (=> b!1104575 (= e!630615 e!630616)))

(declare-fun c!109383 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104575 (= c!109383 (validKeyInArray!0 (select (arr!34422 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1104576 () Bool)

(declare-fun call!46386 () Bool)

(assert (=> b!1104576 (= e!630616 call!46386)))

(declare-fun bm!46383 () Bool)

(assert (=> bm!46383 (= call!46386 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1104577 () Bool)

(assert (=> b!1104577 (= e!630614 call!46386)))

(assert (= (and d!131267 (not res!736560)) b!1104575))

(assert (= (and b!1104575 c!109383) b!1104574))

(assert (= (and b!1104575 (not c!109383)) b!1104576))

(assert (= (and b!1104574 res!736561) b!1104577))

(assert (= (or b!1104577 b!1104576) bm!46383))

(declare-fun m!1025161 () Bool)

(assert (=> b!1104574 m!1025161))

(declare-fun m!1025163 () Bool)

(assert (=> b!1104574 m!1025163))

(declare-fun m!1025165 () Bool)

(assert (=> b!1104574 m!1025165))

(assert (=> b!1104574 m!1025161))

(declare-fun m!1025167 () Bool)

(assert (=> b!1104574 m!1025167))

(assert (=> b!1104575 m!1025161))

(assert (=> b!1104575 m!1025161))

(declare-fun m!1025169 () Bool)

(assert (=> b!1104575 m!1025169))

(declare-fun m!1025171 () Bool)

(assert (=> bm!46383 m!1025171))

(assert (=> b!1104521 d!131267))

(declare-fun d!131269 () Bool)

(assert (=> d!131269 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1104518 d!131269))

(declare-fun d!131271 () Bool)

(assert (=> d!131271 (= (array_inv!26542 _keys!1208) (bvsge (size!34959 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97206 d!131271))

(declare-fun d!131273 () Bool)

(assert (=> d!131273 (= (array_inv!26543 _values!996) (bvsge (size!34960 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97206 d!131273))

(declare-fun condMapEmpty!42739 () Bool)

(declare-fun mapDefault!42739 () ValueCell!12935)

(assert (=> mapNonEmpty!42730 (= condMapEmpty!42739 (= mapRest!42730 ((as const (Array (_ BitVec 32) ValueCell!12935)) mapDefault!42739)))))

(declare-fun e!630621 () Bool)

(declare-fun mapRes!42739 () Bool)

(assert (=> mapNonEmpty!42730 (= tp!81650 (and e!630621 mapRes!42739))))

(declare-fun mapNonEmpty!42739 () Bool)

(declare-fun tp!81659 () Bool)

(declare-fun e!630622 () Bool)

(assert (=> mapNonEmpty!42739 (= mapRes!42739 (and tp!81659 e!630622))))

(declare-fun mapKey!42739 () (_ BitVec 32))

(declare-fun mapValue!42739 () ValueCell!12935)

(declare-fun mapRest!42739 () (Array (_ BitVec 32) ValueCell!12935))

(assert (=> mapNonEmpty!42739 (= mapRest!42730 (store mapRest!42739 mapKey!42739 mapValue!42739))))

(declare-fun mapIsEmpty!42739 () Bool)

(assert (=> mapIsEmpty!42739 mapRes!42739))

(declare-fun b!1104584 () Bool)

(assert (=> b!1104584 (= e!630622 tp_is_empty!27289)))

(declare-fun b!1104585 () Bool)

(assert (=> b!1104585 (= e!630621 tp_is_empty!27289)))

(assert (= (and mapNonEmpty!42730 condMapEmpty!42739) mapIsEmpty!42739))

(assert (= (and mapNonEmpty!42730 (not condMapEmpty!42739)) mapNonEmpty!42739))

(assert (= (and mapNonEmpty!42739 ((_ is ValueCellFull!12935) mapValue!42739)) b!1104584))

(assert (= (and mapNonEmpty!42730 ((_ is ValueCellFull!12935) mapDefault!42739)) b!1104585))

(declare-fun m!1025173 () Bool)

(assert (=> mapNonEmpty!42739 m!1025173))

(check-sat tp_is_empty!27289 (not b!1104574) (not b!1104575) (not bm!46383) (not mapNonEmpty!42739))
(check-sat)
