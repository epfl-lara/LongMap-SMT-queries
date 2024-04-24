; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113422 () Bool)

(assert start!113422)

(declare-fun b_free!31249 () Bool)

(declare-fun b_next!31249 () Bool)

(assert (=> start!113422 (= b_free!31249 (not b_next!31249))))

(declare-fun tp!109552 () Bool)

(declare-fun b_and!50407 () Bool)

(assert (=> start!113422 (= tp!109552 b_and!50407)))

(declare-fun b!1343924 () Bool)

(declare-fun res!891279 () Bool)

(declare-fun e!765190 () Bool)

(assert (=> b!1343924 (=> (not res!891279) (not e!765190))))

(declare-datatypes ((array!91461 0))(
  ( (array!91462 (arr!44182 (Array (_ BitVec 32) (_ BitVec 64))) (size!44733 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91461)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343924 (= res!891279 (validKeyInArray!0 (select (arr!44182 _keys!1571) from!1960)))))

(declare-fun b!1343925 () Bool)

(declare-fun res!891276 () Bool)

(assert (=> b!1343925 (=> (not res!891276) (not e!765190))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343925 (= res!891276 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57580 () Bool)

(declare-fun mapRes!57580 () Bool)

(declare-fun tp!109551 () Bool)

(declare-fun e!765189 () Bool)

(assert (=> mapNonEmpty!57580 (= mapRes!57580 (and tp!109551 e!765189))))

(declare-fun mapKey!57580 () (_ BitVec 32))

(declare-datatypes ((V!54769 0))(
  ( (V!54770 (val!18699 Int)) )
))
(declare-datatypes ((ValueCell!17726 0))(
  ( (ValueCellFull!17726 (v!21342 V!54769)) (EmptyCell!17726) )
))
(declare-fun mapValue!57580 () ValueCell!17726)

(declare-fun mapRest!57580 () (Array (_ BitVec 32) ValueCell!17726))

(declare-datatypes ((array!91463 0))(
  ( (array!91464 (arr!44183 (Array (_ BitVec 32) ValueCell!17726)) (size!44734 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91463)

(assert (=> mapNonEmpty!57580 (= (arr!44183 _values!1303) (store mapRest!57580 mapKey!57580 mapValue!57580))))

(declare-fun res!891281 () Bool)

(assert (=> start!113422 (=> (not res!891281) (not e!765190))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113422 (= res!891281 (validMask!0 mask!1977))))

(assert (=> start!113422 e!765190))

(declare-fun tp_is_empty!37249 () Bool)

(assert (=> start!113422 tp_is_empty!37249))

(assert (=> start!113422 true))

(declare-fun array_inv!33575 (array!91461) Bool)

(assert (=> start!113422 (array_inv!33575 _keys!1571)))

(declare-fun e!765191 () Bool)

(declare-fun array_inv!33576 (array!91463) Bool)

(assert (=> start!113422 (and (array_inv!33576 _values!1303) e!765191)))

(assert (=> start!113422 tp!109552))

(declare-fun b!1343926 () Bool)

(declare-fun res!891280 () Bool)

(assert (=> b!1343926 (=> (not res!891280) (not e!765190))))

(assert (=> b!1343926 (= res!891280 (and (= (size!44734 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44733 _keys!1571) (size!44734 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343927 () Bool)

(declare-fun e!765188 () Bool)

(assert (=> b!1343927 (= e!765188 tp_is_empty!37249)))

(declare-fun b!1343928 () Bool)

(declare-fun res!891283 () Bool)

(assert (=> b!1343928 (=> (not res!891283) (not e!765190))))

(declare-datatypes ((List!31283 0))(
  ( (Nil!31280) (Cons!31279 (h!32497 (_ BitVec 64)) (t!45735 List!31283)) )
))
(declare-fun arrayNoDuplicates!0 (array!91461 (_ BitVec 32) List!31283) Bool)

(assert (=> b!1343928 (= res!891283 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31280))))

(declare-fun mapIsEmpty!57580 () Bool)

(assert (=> mapIsEmpty!57580 mapRes!57580))

(declare-fun b!1343929 () Bool)

(assert (=> b!1343929 (= e!765191 (and e!765188 mapRes!57580))))

(declare-fun condMapEmpty!57580 () Bool)

(declare-fun mapDefault!57580 () ValueCell!17726)

(assert (=> b!1343929 (= condMapEmpty!57580 (= (arr!44183 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17726)) mapDefault!57580)))))

(declare-fun b!1343930 () Bool)

(declare-fun res!891278 () Bool)

(assert (=> b!1343930 (=> (not res!891278) (not e!765190))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1343930 (= res!891278 (not (= (select (arr!44182 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343931 () Bool)

(assert (=> b!1343931 (= e!765190 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!24134 0))(
  ( (tuple2!24135 (_1!12078 (_ BitVec 64)) (_2!12078 V!54769)) )
))
(declare-datatypes ((List!31284 0))(
  ( (Nil!31281) (Cons!31280 (h!32498 tuple2!24134) (t!45736 List!31284)) )
))
(declare-datatypes ((ListLongMap!21799 0))(
  ( (ListLongMap!21800 (toList!10915 List!31284)) )
))
(declare-fun lt!595032 () ListLongMap!21799)

(declare-fun contains!9103 (ListLongMap!21799 (_ BitVec 64)) Bool)

(assert (=> b!1343931 (contains!9103 lt!595032 k0!1142)))

(declare-fun lt!595034 () V!54769)

(declare-datatypes ((Unit!44002 0))(
  ( (Unit!44003) )
))
(declare-fun lt!595030 () Unit!44002)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!357 ((_ BitVec 64) (_ BitVec 64) V!54769 ListLongMap!21799) Unit!44002)

(assert (=> b!1343931 (= lt!595030 (lemmaInListMapAfterAddingDiffThenInBefore!357 k0!1142 (select (arr!44182 _keys!1571) from!1960) lt!595034 lt!595032))))

(declare-fun lt!595031 () ListLongMap!21799)

(assert (=> b!1343931 (contains!9103 lt!595031 k0!1142)))

(declare-fun lt!595033 () Unit!44002)

(declare-fun zeroValue!1245 () V!54769)

(assert (=> b!1343931 (= lt!595033 (lemmaInListMapAfterAddingDiffThenInBefore!357 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595031))))

(declare-fun +!4831 (ListLongMap!21799 tuple2!24134) ListLongMap!21799)

(assert (=> b!1343931 (= lt!595031 (+!4831 lt!595032 (tuple2!24135 (select (arr!44182 _keys!1571) from!1960) lt!595034)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22323 (ValueCell!17726 V!54769) V!54769)

(declare-fun dynLambda!3785 (Int (_ BitVec 64)) V!54769)

(assert (=> b!1343931 (= lt!595034 (get!22323 (select (arr!44183 _values!1303) from!1960) (dynLambda!3785 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54769)

(declare-fun getCurrentListMapNoExtraKeys!6480 (array!91461 array!91463 (_ BitVec 32) (_ BitVec 32) V!54769 V!54769 (_ BitVec 32) Int) ListLongMap!21799)

(assert (=> b!1343931 (= lt!595032 (getCurrentListMapNoExtraKeys!6480 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343932 () Bool)

(declare-fun res!891282 () Bool)

(assert (=> b!1343932 (=> (not res!891282) (not e!765190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91461 (_ BitVec 32)) Bool)

(assert (=> b!1343932 (= res!891282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343933 () Bool)

(declare-fun res!891284 () Bool)

(assert (=> b!1343933 (=> (not res!891284) (not e!765190))))

(declare-fun getCurrentListMap!5862 (array!91461 array!91463 (_ BitVec 32) (_ BitVec 32) V!54769 V!54769 (_ BitVec 32) Int) ListLongMap!21799)

(assert (=> b!1343933 (= res!891284 (contains!9103 (getCurrentListMap!5862 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343934 () Bool)

(assert (=> b!1343934 (= e!765189 tp_is_empty!37249)))

(declare-fun b!1343935 () Bool)

(declare-fun res!891277 () Bool)

(assert (=> b!1343935 (=> (not res!891277) (not e!765190))))

(assert (=> b!1343935 (= res!891277 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44733 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113422 res!891281) b!1343926))

(assert (= (and b!1343926 res!891280) b!1343932))

(assert (= (and b!1343932 res!891282) b!1343928))

(assert (= (and b!1343928 res!891283) b!1343935))

(assert (= (and b!1343935 res!891277) b!1343933))

(assert (= (and b!1343933 res!891284) b!1343930))

(assert (= (and b!1343930 res!891278) b!1343924))

(assert (= (and b!1343924 res!891279) b!1343925))

(assert (= (and b!1343925 res!891276) b!1343931))

(assert (= (and b!1343929 condMapEmpty!57580) mapIsEmpty!57580))

(assert (= (and b!1343929 (not condMapEmpty!57580)) mapNonEmpty!57580))

(get-info :version)

(assert (= (and mapNonEmpty!57580 ((_ is ValueCellFull!17726) mapValue!57580)) b!1343934))

(assert (= (and b!1343929 ((_ is ValueCellFull!17726) mapDefault!57580)) b!1343927))

(assert (= start!113422 b!1343929))

(declare-fun b_lambda!24419 () Bool)

(assert (=> (not b_lambda!24419) (not b!1343931)))

(declare-fun t!45734 () Bool)

(declare-fun tb!12255 () Bool)

(assert (=> (and start!113422 (= defaultEntry!1306 defaultEntry!1306) t!45734) tb!12255))

(declare-fun result!25609 () Bool)

(assert (=> tb!12255 (= result!25609 tp_is_empty!37249)))

(assert (=> b!1343931 t!45734))

(declare-fun b_and!50409 () Bool)

(assert (= b_and!50407 (and (=> t!45734 result!25609) b_and!50409)))

(declare-fun m!1231845 () Bool)

(assert (=> b!1343924 m!1231845))

(assert (=> b!1343924 m!1231845))

(declare-fun m!1231847 () Bool)

(assert (=> b!1343924 m!1231847))

(assert (=> b!1343930 m!1231845))

(declare-fun m!1231849 () Bool)

(assert (=> start!113422 m!1231849))

(declare-fun m!1231851 () Bool)

(assert (=> start!113422 m!1231851))

(declare-fun m!1231853 () Bool)

(assert (=> start!113422 m!1231853))

(declare-fun m!1231855 () Bool)

(assert (=> b!1343928 m!1231855))

(declare-fun m!1231857 () Bool)

(assert (=> b!1343933 m!1231857))

(assert (=> b!1343933 m!1231857))

(declare-fun m!1231859 () Bool)

(assert (=> b!1343933 m!1231859))

(declare-fun m!1231861 () Bool)

(assert (=> b!1343931 m!1231861))

(assert (=> b!1343931 m!1231845))

(declare-fun m!1231863 () Bool)

(assert (=> b!1343931 m!1231863))

(declare-fun m!1231865 () Bool)

(assert (=> b!1343931 m!1231865))

(declare-fun m!1231867 () Bool)

(assert (=> b!1343931 m!1231867))

(assert (=> b!1343931 m!1231845))

(declare-fun m!1231869 () Bool)

(assert (=> b!1343931 m!1231869))

(declare-fun m!1231871 () Bool)

(assert (=> b!1343931 m!1231871))

(declare-fun m!1231873 () Bool)

(assert (=> b!1343931 m!1231873))

(assert (=> b!1343931 m!1231865))

(declare-fun m!1231875 () Bool)

(assert (=> b!1343931 m!1231875))

(assert (=> b!1343931 m!1231873))

(declare-fun m!1231877 () Bool)

(assert (=> b!1343931 m!1231877))

(declare-fun m!1231879 () Bool)

(assert (=> mapNonEmpty!57580 m!1231879))

(declare-fun m!1231881 () Bool)

(assert (=> b!1343932 m!1231881))

(check-sat tp_is_empty!37249 (not b!1343933) (not b_lambda!24419) (not mapNonEmpty!57580) (not b!1343932) b_and!50409 (not b!1343924) (not b_next!31249) (not start!113422) (not b!1343928) (not b!1343931))
(check-sat b_and!50409 (not b_next!31249))
