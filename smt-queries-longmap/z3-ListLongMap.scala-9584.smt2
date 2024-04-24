; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113590 () Bool)

(assert start!113590)

(declare-fun b_free!31417 () Bool)

(declare-fun b_next!31417 () Bool)

(assert (=> start!113590 (= b_free!31417 (not b_next!31417))))

(declare-fun tp!110056 () Bool)

(declare-fun b_and!50689 () Bool)

(assert (=> start!113590 (= tp!110056 b_and!50689)))

(declare-fun b!1346877 () Bool)

(declare-fun e!766503 () Bool)

(declare-fun e!766505 () Bool)

(declare-fun mapRes!57832 () Bool)

(assert (=> b!1346877 (= e!766503 (and e!766505 mapRes!57832))))

(declare-fun condMapEmpty!57832 () Bool)

(declare-datatypes ((V!54993 0))(
  ( (V!54994 (val!18783 Int)) )
))
(declare-datatypes ((ValueCell!17810 0))(
  ( (ValueCellFull!17810 (v!21426 V!54993)) (EmptyCell!17810) )
))
(declare-datatypes ((array!91781 0))(
  ( (array!91782 (arr!44342 (Array (_ BitVec 32) ValueCell!17810)) (size!44893 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91781)

(declare-fun mapDefault!57832 () ValueCell!17810)

(assert (=> b!1346877 (= condMapEmpty!57832 (= (arr!44342 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17810)) mapDefault!57832)))))

(declare-fun b!1346878 () Bool)

(declare-fun tp_is_empty!37417 () Bool)

(assert (=> b!1346878 (= e!766505 tp_is_empty!37417)))

(declare-fun res!893361 () Bool)

(declare-fun e!766506 () Bool)

(assert (=> start!113590 (=> (not res!893361) (not e!766506))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113590 (= res!893361 (validMask!0 mask!1977))))

(assert (=> start!113590 e!766506))

(assert (=> start!113590 tp_is_empty!37417))

(assert (=> start!113590 true))

(declare-datatypes ((array!91783 0))(
  ( (array!91784 (arr!44343 (Array (_ BitVec 32) (_ BitVec 64))) (size!44894 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91783)

(declare-fun array_inv!33679 (array!91783) Bool)

(assert (=> start!113590 (array_inv!33679 _keys!1571)))

(declare-fun array_inv!33680 (array!91781) Bool)

(assert (=> start!113590 (and (array_inv!33680 _values!1303) e!766503)))

(assert (=> start!113590 tp!110056))

(declare-fun b!1346879 () Bool)

(declare-fun res!893367 () Bool)

(assert (=> b!1346879 (=> (not res!893367) (not e!766506))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346879 (= res!893367 (validKeyInArray!0 (select (arr!44343 _keys!1571) from!1960)))))

(declare-fun b!1346880 () Bool)

(declare-fun res!893363 () Bool)

(declare-fun e!766508 () Bool)

(assert (=> b!1346880 (=> (not res!893363) (not e!766508))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1346880 (= res!893363 (not (= k0!1142 (select (arr!44343 _keys!1571) from!1960))))))

(declare-fun b!1346881 () Bool)

(declare-fun res!893364 () Bool)

(assert (=> b!1346881 (=> (not res!893364) (not e!766506))))

(declare-datatypes ((List!31397 0))(
  ( (Nil!31394) (Cons!31393 (h!32611 (_ BitVec 64)) (t!45963 List!31397)) )
))
(declare-fun arrayNoDuplicates!0 (array!91783 (_ BitVec 32) List!31397) Bool)

(assert (=> b!1346881 (= res!893364 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31394))))

(declare-fun b!1346882 () Bool)

(declare-fun res!893368 () Bool)

(assert (=> b!1346882 (=> (not res!893368) (not e!766506))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346882 (= res!893368 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44894 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346883 () Bool)

(declare-fun res!893365 () Bool)

(assert (=> b!1346883 (=> (not res!893365) (not e!766506))))

(declare-fun minValue!1245 () V!54993)

(declare-fun zeroValue!1245 () V!54993)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24252 0))(
  ( (tuple2!24253 (_1!12137 (_ BitVec 64)) (_2!12137 V!54993)) )
))
(declare-datatypes ((List!31398 0))(
  ( (Nil!31395) (Cons!31394 (h!32612 tuple2!24252) (t!45964 List!31398)) )
))
(declare-datatypes ((ListLongMap!21917 0))(
  ( (ListLongMap!21918 (toList!10974 List!31398)) )
))
(declare-fun contains!9162 (ListLongMap!21917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5915 (array!91783 array!91781 (_ BitVec 32) (_ BitVec 32) V!54993 V!54993 (_ BitVec 32) Int) ListLongMap!21917)

(assert (=> b!1346883 (= res!893365 (contains!9162 (getCurrentListMap!5915 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346884 () Bool)

(declare-fun e!766504 () Bool)

(assert (=> b!1346884 (= e!766504 tp_is_empty!37417)))

(declare-fun b!1346885 () Bool)

(declare-fun res!893359 () Bool)

(assert (=> b!1346885 (=> (not res!893359) (not e!766506))))

(assert (=> b!1346885 (= res!893359 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1346886 () Bool)

(assert (=> b!1346886 (= e!766506 e!766508)))

(declare-fun res!893362 () Bool)

(assert (=> b!1346886 (=> (not res!893362) (not e!766508))))

(declare-fun lt!595856 () ListLongMap!21917)

(declare-fun lt!595855 () V!54993)

(declare-fun +!4865 (ListLongMap!21917 tuple2!24252) ListLongMap!21917)

(assert (=> b!1346886 (= res!893362 (contains!9162 (+!4865 lt!595856 (tuple2!24253 (select (arr!44343 _keys!1571) from!1960) lt!595855)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6514 (array!91783 array!91781 (_ BitVec 32) (_ BitVec 32) V!54993 V!54993 (_ BitVec 32) Int) ListLongMap!21917)

(assert (=> b!1346886 (= lt!595856 (getCurrentListMapNoExtraKeys!6514 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22413 (ValueCell!17810 V!54993) V!54993)

(declare-fun dynLambda!3819 (Int (_ BitVec 64)) V!54993)

(assert (=> b!1346886 (= lt!595855 (get!22413 (select (arr!44342 _values!1303) from!1960) (dynLambda!3819 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57832 () Bool)

(declare-fun tp!110055 () Bool)

(assert (=> mapNonEmpty!57832 (= mapRes!57832 (and tp!110055 e!766504))))

(declare-fun mapValue!57832 () ValueCell!17810)

(declare-fun mapRest!57832 () (Array (_ BitVec 32) ValueCell!17810))

(declare-fun mapKey!57832 () (_ BitVec 32))

(assert (=> mapNonEmpty!57832 (= (arr!44342 _values!1303) (store mapRest!57832 mapKey!57832 mapValue!57832))))

(declare-fun mapIsEmpty!57832 () Bool)

(assert (=> mapIsEmpty!57832 mapRes!57832))

(declare-fun b!1346887 () Bool)

(declare-fun res!893360 () Bool)

(assert (=> b!1346887 (=> (not res!893360) (not e!766506))))

(assert (=> b!1346887 (= res!893360 (and (= (size!44893 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44894 _keys!1571) (size!44893 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346888 () Bool)

(declare-fun res!893369 () Bool)

(assert (=> b!1346888 (=> (not res!893369) (not e!766506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91783 (_ BitVec 32)) Bool)

(assert (=> b!1346888 (= res!893369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346889 () Bool)

(declare-fun res!893366 () Bool)

(assert (=> b!1346889 (=> (not res!893366) (not e!766506))))

(assert (=> b!1346889 (= res!893366 (not (= (select (arr!44343 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346890 () Bool)

(assert (=> b!1346890 (= e!766508 (not true))))

(assert (=> b!1346890 (contains!9162 lt!595856 k0!1142)))

(declare-datatypes ((Unit!44066 0))(
  ( (Unit!44067) )
))
(declare-fun lt!595854 () Unit!44066)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!389 ((_ BitVec 64) (_ BitVec 64) V!54993 ListLongMap!21917) Unit!44066)

(assert (=> b!1346890 (= lt!595854 (lemmaInListMapAfterAddingDiffThenInBefore!389 k0!1142 (select (arr!44343 _keys!1571) from!1960) lt!595855 lt!595856))))

(assert (= (and start!113590 res!893361) b!1346887))

(assert (= (and b!1346887 res!893360) b!1346888))

(assert (= (and b!1346888 res!893369) b!1346881))

(assert (= (and b!1346881 res!893364) b!1346882))

(assert (= (and b!1346882 res!893368) b!1346883))

(assert (= (and b!1346883 res!893365) b!1346889))

(assert (= (and b!1346889 res!893366) b!1346879))

(assert (= (and b!1346879 res!893367) b!1346885))

(assert (= (and b!1346885 res!893359) b!1346886))

(assert (= (and b!1346886 res!893362) b!1346880))

(assert (= (and b!1346880 res!893363) b!1346890))

(assert (= (and b!1346877 condMapEmpty!57832) mapIsEmpty!57832))

(assert (= (and b!1346877 (not condMapEmpty!57832)) mapNonEmpty!57832))

(get-info :version)

(assert (= (and mapNonEmpty!57832 ((_ is ValueCellFull!17810) mapValue!57832)) b!1346884))

(assert (= (and b!1346877 ((_ is ValueCellFull!17810) mapDefault!57832)) b!1346878))

(assert (= start!113590 b!1346877))

(declare-fun b_lambda!24533 () Bool)

(assert (=> (not b_lambda!24533) (not b!1346886)))

(declare-fun t!45962 () Bool)

(declare-fun tb!12369 () Bool)

(assert (=> (and start!113590 (= defaultEntry!1306 defaultEntry!1306) t!45962) tb!12369))

(declare-fun result!25837 () Bool)

(assert (=> tb!12369 (= result!25837 tp_is_empty!37417)))

(assert (=> b!1346886 t!45962))

(declare-fun b_and!50691 () Bool)

(assert (= b_and!50689 (and (=> t!45962 result!25837) b_and!50691)))

(declare-fun m!1234545 () Bool)

(assert (=> b!1346889 m!1234545))

(declare-fun m!1234547 () Bool)

(assert (=> b!1346888 m!1234547))

(declare-fun m!1234549 () Bool)

(assert (=> b!1346890 m!1234549))

(assert (=> b!1346890 m!1234545))

(assert (=> b!1346890 m!1234545))

(declare-fun m!1234551 () Bool)

(assert (=> b!1346890 m!1234551))

(assert (=> b!1346880 m!1234545))

(declare-fun m!1234553 () Bool)

(assert (=> b!1346886 m!1234553))

(declare-fun m!1234555 () Bool)

(assert (=> b!1346886 m!1234555))

(declare-fun m!1234557 () Bool)

(assert (=> b!1346886 m!1234557))

(declare-fun m!1234559 () Bool)

(assert (=> b!1346886 m!1234559))

(assert (=> b!1346886 m!1234555))

(assert (=> b!1346886 m!1234557))

(declare-fun m!1234561 () Bool)

(assert (=> b!1346886 m!1234561))

(declare-fun m!1234563 () Bool)

(assert (=> b!1346886 m!1234563))

(assert (=> b!1346886 m!1234561))

(assert (=> b!1346886 m!1234545))

(assert (=> b!1346879 m!1234545))

(assert (=> b!1346879 m!1234545))

(declare-fun m!1234565 () Bool)

(assert (=> b!1346879 m!1234565))

(declare-fun m!1234567 () Bool)

(assert (=> b!1346881 m!1234567))

(declare-fun m!1234569 () Bool)

(assert (=> b!1346883 m!1234569))

(assert (=> b!1346883 m!1234569))

(declare-fun m!1234571 () Bool)

(assert (=> b!1346883 m!1234571))

(declare-fun m!1234573 () Bool)

(assert (=> start!113590 m!1234573))

(declare-fun m!1234575 () Bool)

(assert (=> start!113590 m!1234575))

(declare-fun m!1234577 () Bool)

(assert (=> start!113590 m!1234577))

(declare-fun m!1234579 () Bool)

(assert (=> mapNonEmpty!57832 m!1234579))

(check-sat (not start!113590) (not b!1346879) (not b!1346888) (not b_lambda!24533) (not b!1346886) (not b!1346881) b_and!50691 tp_is_empty!37417 (not b!1346883) (not b_next!31417) (not mapNonEmpty!57832) (not b!1346890))
(check-sat b_and!50691 (not b_next!31417))
