; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113546 () Bool)

(assert start!113546)

(declare-fun b_free!31539 () Bool)

(declare-fun b_next!31539 () Bool)

(assert (=> start!113546 (= b_free!31539 (not b_next!31539))))

(declare-fun tp!110426 () Bool)

(declare-fun b_and!50867 () Bool)

(assert (=> start!113546 (= tp!110426 b_and!50867)))

(declare-fun b!1347883 () Bool)

(declare-fun e!766845 () Bool)

(declare-fun tp_is_empty!37539 () Bool)

(assert (=> b!1347883 (= e!766845 tp_is_empty!37539)))

(declare-fun b!1347884 () Bool)

(declare-fun res!894338 () Bool)

(declare-fun e!766847 () Bool)

(assert (=> b!1347884 (=> (not res!894338) (not e!766847))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91910 0))(
  ( (array!91911 (arr!44410 (Array (_ BitVec 32) (_ BitVec 64))) (size!44960 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91910)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55155 0))(
  ( (V!55156 (val!18844 Int)) )
))
(declare-datatypes ((ValueCell!17871 0))(
  ( (ValueCellFull!17871 (v!21495 V!55155)) (EmptyCell!17871) )
))
(declare-datatypes ((array!91912 0))(
  ( (array!91913 (arr!44411 (Array (_ BitVec 32) ValueCell!17871)) (size!44961 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91912)

(assert (=> b!1347884 (= res!894338 (and (= (size!44961 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44960 _keys!1571) (size!44961 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!894337 () Bool)

(assert (=> start!113546 (=> (not res!894337) (not e!766847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113546 (= res!894337 (validMask!0 mask!1977))))

(assert (=> start!113546 e!766847))

(assert (=> start!113546 tp_is_empty!37539))

(assert (=> start!113546 true))

(declare-fun array_inv!33457 (array!91910) Bool)

(assert (=> start!113546 (array_inv!33457 _keys!1571)))

(declare-fun e!766843 () Bool)

(declare-fun array_inv!33458 (array!91912) Bool)

(assert (=> start!113546 (and (array_inv!33458 _values!1303) e!766843)))

(assert (=> start!113546 tp!110426))

(declare-fun b!1347885 () Bool)

(declare-fun res!894331 () Bool)

(assert (=> b!1347885 (=> (not res!894331) (not e!766847))))

(declare-fun minValue!1245 () V!55155)

(declare-fun zeroValue!1245 () V!55155)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24294 0))(
  ( (tuple2!24295 (_1!12158 (_ BitVec 64)) (_2!12158 V!55155)) )
))
(declare-datatypes ((List!31449 0))(
  ( (Nil!31446) (Cons!31445 (h!32654 tuple2!24294) (t!46067 List!31449)) )
))
(declare-datatypes ((ListLongMap!21951 0))(
  ( (ListLongMap!21952 (toList!10991 List!31449)) )
))
(declare-fun contains!9169 (ListLongMap!21951 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5942 (array!91910 array!91912 (_ BitVec 32) (_ BitVec 32) V!55155 V!55155 (_ BitVec 32) Int) ListLongMap!21951)

(assert (=> b!1347885 (= res!894331 (contains!9169 (getCurrentListMap!5942 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347886 () Bool)

(declare-fun res!894335 () Bool)

(assert (=> b!1347886 (=> (not res!894335) (not e!766847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91910 (_ BitVec 32)) Bool)

(assert (=> b!1347886 (= res!894335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1347887 () Bool)

(declare-fun res!894336 () Bool)

(assert (=> b!1347887 (=> (not res!894336) (not e!766847))))

(assert (=> b!1347887 (= res!894336 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44960 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347888 () Bool)

(declare-fun res!894333 () Bool)

(assert (=> b!1347888 (=> (not res!894333) (not e!766847))))

(declare-datatypes ((List!31450 0))(
  ( (Nil!31447) (Cons!31446 (h!32655 (_ BitVec 64)) (t!46068 List!31450)) )
))
(declare-fun arrayNoDuplicates!0 (array!91910 (_ BitVec 32) List!31450) Bool)

(assert (=> b!1347888 (= res!894333 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31447))))

(declare-fun b!1347889 () Bool)

(declare-fun e!766846 () Bool)

(declare-fun mapRes!58019 () Bool)

(assert (=> b!1347889 (= e!766843 (and e!766846 mapRes!58019))))

(declare-fun condMapEmpty!58019 () Bool)

(declare-fun mapDefault!58019 () ValueCell!17871)

(assert (=> b!1347889 (= condMapEmpty!58019 (= (arr!44411 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17871)) mapDefault!58019)))))

(declare-fun mapIsEmpty!58019 () Bool)

(assert (=> mapIsEmpty!58019 mapRes!58019))

(declare-fun mapNonEmpty!58019 () Bool)

(declare-fun tp!110425 () Bool)

(assert (=> mapNonEmpty!58019 (= mapRes!58019 (and tp!110425 e!766845))))

(declare-fun mapKey!58019 () (_ BitVec 32))

(declare-fun mapValue!58019 () ValueCell!17871)

(declare-fun mapRest!58019 () (Array (_ BitVec 32) ValueCell!17871))

(assert (=> mapNonEmpty!58019 (= (arr!44411 _values!1303) (store mapRest!58019 mapKey!58019 mapValue!58019))))

(declare-fun b!1347890 () Bool)

(declare-fun res!894334 () Bool)

(assert (=> b!1347890 (=> (not res!894334) (not e!766847))))

(assert (=> b!1347890 (= res!894334 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1347891 () Bool)

(declare-fun res!894330 () Bool)

(assert (=> b!1347891 (=> (not res!894330) (not e!766847))))

(assert (=> b!1347891 (= res!894330 (not (= (select (arr!44410 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1347892 () Bool)

(assert (=> b!1347892 (= e!766846 tp_is_empty!37539)))

(declare-fun b!1347893 () Bool)

(declare-fun res!894332 () Bool)

(assert (=> b!1347893 (=> (not res!894332) (not e!766847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1347893 (= res!894332 (validKeyInArray!0 (select (arr!44410 _keys!1571) from!1960)))))

(declare-fun b!1347894 () Bool)

(assert (=> b!1347894 (= e!766847 (not true))))

(declare-fun lt!595875 () ListLongMap!21951)

(assert (=> b!1347894 (contains!9169 lt!595875 k0!1142)))

(declare-datatypes ((Unit!44162 0))(
  ( (Unit!44163) )
))
(declare-fun lt!595876 () Unit!44162)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!404 ((_ BitVec 64) (_ BitVec 64) V!55155 ListLongMap!21951) Unit!44162)

(assert (=> b!1347894 (= lt!595876 (lemmaInListMapAfterAddingDiffThenInBefore!404 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595875))))

(declare-fun +!4843 (ListLongMap!21951 tuple2!24294) ListLongMap!21951)

(declare-fun getCurrentListMapNoExtraKeys!6489 (array!91910 array!91912 (_ BitVec 32) (_ BitVec 32) V!55155 V!55155 (_ BitVec 32) Int) ListLongMap!21951)

(declare-fun get!22431 (ValueCell!17871 V!55155) V!55155)

(declare-fun dynLambda!3782 (Int (_ BitVec 64)) V!55155)

(assert (=> b!1347894 (= lt!595875 (+!4843 (getCurrentListMapNoExtraKeys!6489 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24295 (select (arr!44410 _keys!1571) from!1960) (get!22431 (select (arr!44411 _values!1303) from!1960) (dynLambda!3782 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!113546 res!894337) b!1347884))

(assert (= (and b!1347884 res!894338) b!1347886))

(assert (= (and b!1347886 res!894335) b!1347888))

(assert (= (and b!1347888 res!894333) b!1347887))

(assert (= (and b!1347887 res!894336) b!1347885))

(assert (= (and b!1347885 res!894331) b!1347891))

(assert (= (and b!1347891 res!894330) b!1347893))

(assert (= (and b!1347893 res!894332) b!1347890))

(assert (= (and b!1347890 res!894334) b!1347894))

(assert (= (and b!1347889 condMapEmpty!58019) mapIsEmpty!58019))

(assert (= (and b!1347889 (not condMapEmpty!58019)) mapNonEmpty!58019))

(get-info :version)

(assert (= (and mapNonEmpty!58019 ((_ is ValueCellFull!17871) mapValue!58019)) b!1347883))

(assert (= (and b!1347889 ((_ is ValueCellFull!17871) mapDefault!58019)) b!1347892))

(assert (= start!113546 b!1347889))

(declare-fun b_lambda!24613 () Bool)

(assert (=> (not b_lambda!24613) (not b!1347894)))

(declare-fun t!46066 () Bool)

(declare-fun tb!12421 () Bool)

(assert (=> (and start!113546 (= defaultEntry!1306 defaultEntry!1306) t!46066) tb!12421))

(declare-fun result!25935 () Bool)

(assert (=> tb!12421 (= result!25935 tp_is_empty!37539)))

(assert (=> b!1347894 t!46066))

(declare-fun b_and!50869 () Bool)

(assert (= b_and!50867 (and (=> t!46066 result!25935) b_and!50869)))

(declare-fun m!1234923 () Bool)

(assert (=> b!1347886 m!1234923))

(declare-fun m!1234925 () Bool)

(assert (=> b!1347894 m!1234925))

(declare-fun m!1234927 () Bool)

(assert (=> b!1347894 m!1234927))

(declare-fun m!1234929 () Bool)

(assert (=> b!1347894 m!1234929))

(declare-fun m!1234931 () Bool)

(assert (=> b!1347894 m!1234931))

(assert (=> b!1347894 m!1234925))

(declare-fun m!1234933 () Bool)

(assert (=> b!1347894 m!1234933))

(assert (=> b!1347894 m!1234927))

(declare-fun m!1234935 () Bool)

(assert (=> b!1347894 m!1234935))

(declare-fun m!1234937 () Bool)

(assert (=> b!1347894 m!1234937))

(assert (=> b!1347894 m!1234929))

(declare-fun m!1234939 () Bool)

(assert (=> b!1347894 m!1234939))

(assert (=> b!1347891 m!1234937))

(declare-fun m!1234941 () Bool)

(assert (=> mapNonEmpty!58019 m!1234941))

(declare-fun m!1234943 () Bool)

(assert (=> b!1347885 m!1234943))

(assert (=> b!1347885 m!1234943))

(declare-fun m!1234945 () Bool)

(assert (=> b!1347885 m!1234945))

(declare-fun m!1234947 () Bool)

(assert (=> start!113546 m!1234947))

(declare-fun m!1234949 () Bool)

(assert (=> start!113546 m!1234949))

(declare-fun m!1234951 () Bool)

(assert (=> start!113546 m!1234951))

(declare-fun m!1234953 () Bool)

(assert (=> b!1347888 m!1234953))

(assert (=> b!1347893 m!1234937))

(assert (=> b!1347893 m!1234937))

(declare-fun m!1234955 () Bool)

(assert (=> b!1347893 m!1234955))

(check-sat (not b!1347886) (not b_next!31539) tp_is_empty!37539 (not start!113546) (not b!1347894) b_and!50869 (not b_lambda!24613) (not mapNonEmpty!58019) (not b!1347893) (not b!1347888) (not b!1347885))
(check-sat b_and!50869 (not b_next!31539))
