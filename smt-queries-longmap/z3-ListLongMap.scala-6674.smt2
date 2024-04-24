; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84184 () Bool)

(assert start!84184)

(declare-fun b_free!19771 () Bool)

(declare-fun b_next!19771 () Bool)

(assert (=> start!84184 (= b_free!19771 (not b_next!19771))))

(declare-fun tp!68836 () Bool)

(declare-fun b_and!31635 () Bool)

(assert (=> start!84184 (= tp!68836 b_and!31635)))

(declare-fun b!982937 () Bool)

(declare-fun res!657509 () Bool)

(declare-fun e!554170 () Bool)

(assert (=> b!982937 (=> (not res!657509) (not e!554170))))

(declare-datatypes ((array!61670 0))(
  ( (array!61671 (arr!29688 (Array (_ BitVec 32) (_ BitVec 64))) (size!30168 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61670)

(declare-datatypes ((List!20567 0))(
  ( (Nil!20564) (Cons!20563 (h!21731 (_ BitVec 64)) (t!29280 List!20567)) )
))
(declare-fun arrayNoDuplicates!0 (array!61670 (_ BitVec 32) List!20567) Bool)

(assert (=> b!982937 (= res!657509 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20564))))

(declare-fun b!982938 () Bool)

(declare-fun e!554168 () Bool)

(declare-fun e!554167 () Bool)

(declare-fun mapRes!36257 () Bool)

(assert (=> b!982938 (= e!554168 (and e!554167 mapRes!36257))))

(declare-fun condMapEmpty!36257 () Bool)

(declare-datatypes ((V!35409 0))(
  ( (V!35410 (val!11460 Int)) )
))
(declare-datatypes ((ValueCell!10928 0))(
  ( (ValueCellFull!10928 (v!14019 V!35409)) (EmptyCell!10928) )
))
(declare-datatypes ((array!61672 0))(
  ( (array!61673 (arr!29689 (Array (_ BitVec 32) ValueCell!10928)) (size!30169 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61672)

(declare-fun mapDefault!36257 () ValueCell!10928)

(assert (=> b!982938 (= condMapEmpty!36257 (= (arr!29689 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10928)) mapDefault!36257)))))

(declare-fun b!982939 () Bool)

(declare-fun res!657507 () Bool)

(assert (=> b!982939 (=> (not res!657507) (not e!554170))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982939 (= res!657507 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30168 _keys!1544))))))

(declare-fun b!982940 () Bool)

(declare-fun res!657512 () Bool)

(assert (=> b!982940 (=> (not res!657512) (not e!554170))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61670 (_ BitVec 32)) Bool)

(assert (=> b!982940 (= res!657512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982941 () Bool)

(declare-fun e!554171 () Bool)

(declare-fun tp_is_empty!22819 () Bool)

(assert (=> b!982941 (= e!554171 tp_is_empty!22819)))

(declare-fun b!982942 () Bool)

(declare-fun e!554169 () Bool)

(assert (=> b!982942 (= e!554170 e!554169)))

(declare-fun res!657514 () Bool)

(assert (=> b!982942 (=> (not res!657514) (not e!554169))))

(assert (=> b!982942 (= res!657514 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29688 _keys!1544) from!1932))))))

(declare-fun lt!436322 () V!35409)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15418 (ValueCell!10928 V!35409) V!35409)

(declare-fun dynLambda!1813 (Int (_ BitVec 64)) V!35409)

(assert (=> b!982942 (= lt!436322 (get!15418 (select (arr!29689 _values!1278) from!1932) (dynLambda!1813 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14690 0))(
  ( (tuple2!14691 (_1!7356 (_ BitVec 64)) (_2!7356 V!35409)) )
))
(declare-datatypes ((List!20568 0))(
  ( (Nil!20565) (Cons!20564 (h!21732 tuple2!14690) (t!29281 List!20568)) )
))
(declare-datatypes ((ListLongMap!13389 0))(
  ( (ListLongMap!13390 (toList!6710 List!20568)) )
))
(declare-fun lt!436324 () ListLongMap!13389)

(declare-fun minValue!1220 () V!35409)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35409)

(declare-fun getCurrentListMapNoExtraKeys!3454 (array!61670 array!61672 (_ BitVec 32) (_ BitVec 32) V!35409 V!35409 (_ BitVec 32) Int) ListLongMap!13389)

(assert (=> b!982942 (= lt!436324 (getCurrentListMapNoExtraKeys!3454 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982943 () Bool)

(assert (=> b!982943 (= e!554169 (not true))))

(declare-fun lt!436323 () tuple2!14690)

(declare-fun lt!436326 () tuple2!14690)

(declare-fun +!3020 (ListLongMap!13389 tuple2!14690) ListLongMap!13389)

(assert (=> b!982943 (= (+!3020 (+!3020 lt!436324 lt!436323) lt!436326) (+!3020 (+!3020 lt!436324 lt!436326) lt!436323))))

(assert (=> b!982943 (= lt!436326 (tuple2!14691 (select (arr!29688 _keys!1544) from!1932) lt!436322))))

(assert (=> b!982943 (= lt!436323 (tuple2!14691 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32620 0))(
  ( (Unit!32621) )
))
(declare-fun lt!436325 () Unit!32620)

(declare-fun addCommutativeForDiffKeys!627 (ListLongMap!13389 (_ BitVec 64) V!35409 (_ BitVec 64) V!35409) Unit!32620)

(assert (=> b!982943 (= lt!436325 (addCommutativeForDiffKeys!627 lt!436324 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29688 _keys!1544) from!1932) lt!436322))))

(declare-fun b!982944 () Bool)

(declare-fun res!657510 () Bool)

(assert (=> b!982944 (=> (not res!657510) (not e!554170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982944 (= res!657510 (validKeyInArray!0 (select (arr!29688 _keys!1544) from!1932)))))

(declare-fun res!657508 () Bool)

(assert (=> start!84184 (=> (not res!657508) (not e!554170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84184 (= res!657508 (validMask!0 mask!1948))))

(assert (=> start!84184 e!554170))

(assert (=> start!84184 true))

(assert (=> start!84184 tp_is_empty!22819))

(declare-fun array_inv!22977 (array!61672) Bool)

(assert (=> start!84184 (and (array_inv!22977 _values!1278) e!554168)))

(assert (=> start!84184 tp!68836))

(declare-fun array_inv!22978 (array!61670) Bool)

(assert (=> start!84184 (array_inv!22978 _keys!1544)))

(declare-fun mapIsEmpty!36257 () Bool)

(assert (=> mapIsEmpty!36257 mapRes!36257))

(declare-fun mapNonEmpty!36257 () Bool)

(declare-fun tp!68837 () Bool)

(assert (=> mapNonEmpty!36257 (= mapRes!36257 (and tp!68837 e!554171))))

(declare-fun mapKey!36257 () (_ BitVec 32))

(declare-fun mapRest!36257 () (Array (_ BitVec 32) ValueCell!10928))

(declare-fun mapValue!36257 () ValueCell!10928)

(assert (=> mapNonEmpty!36257 (= (arr!29689 _values!1278) (store mapRest!36257 mapKey!36257 mapValue!36257))))

(declare-fun b!982945 () Bool)

(declare-fun res!657513 () Bool)

(assert (=> b!982945 (=> (not res!657513) (not e!554170))))

(assert (=> b!982945 (= res!657513 (and (= (size!30169 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30168 _keys!1544) (size!30169 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982946 () Bool)

(assert (=> b!982946 (= e!554167 tp_is_empty!22819)))

(declare-fun b!982947 () Bool)

(declare-fun res!657511 () Bool)

(assert (=> b!982947 (=> (not res!657511) (not e!554170))))

(assert (=> b!982947 (= res!657511 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!84184 res!657508) b!982945))

(assert (= (and b!982945 res!657513) b!982940))

(assert (= (and b!982940 res!657512) b!982937))

(assert (= (and b!982937 res!657509) b!982939))

(assert (= (and b!982939 res!657507) b!982944))

(assert (= (and b!982944 res!657510) b!982947))

(assert (= (and b!982947 res!657511) b!982942))

(assert (= (and b!982942 res!657514) b!982943))

(assert (= (and b!982938 condMapEmpty!36257) mapIsEmpty!36257))

(assert (= (and b!982938 (not condMapEmpty!36257)) mapNonEmpty!36257))

(get-info :version)

(assert (= (and mapNonEmpty!36257 ((_ is ValueCellFull!10928) mapValue!36257)) b!982941))

(assert (= (and b!982938 ((_ is ValueCellFull!10928) mapDefault!36257)) b!982946))

(assert (= start!84184 b!982938))

(declare-fun b_lambda!14823 () Bool)

(assert (=> (not b_lambda!14823) (not b!982942)))

(declare-fun t!29279 () Bool)

(declare-fun tb!6563 () Bool)

(assert (=> (and start!84184 (= defaultEntry!1281 defaultEntry!1281) t!29279) tb!6563))

(declare-fun result!13123 () Bool)

(assert (=> tb!6563 (= result!13123 tp_is_empty!22819)))

(assert (=> b!982942 t!29279))

(declare-fun b_and!31637 () Bool)

(assert (= b_and!31635 (and (=> t!29279 result!13123) b_and!31637)))

(declare-fun m!910679 () Bool)

(assert (=> b!982943 m!910679))

(declare-fun m!910681 () Bool)

(assert (=> b!982943 m!910681))

(assert (=> b!982943 m!910681))

(declare-fun m!910683 () Bool)

(assert (=> b!982943 m!910683))

(declare-fun m!910685 () Bool)

(assert (=> b!982943 m!910685))

(declare-fun m!910687 () Bool)

(assert (=> b!982943 m!910687))

(assert (=> b!982943 m!910685))

(assert (=> b!982943 m!910679))

(declare-fun m!910689 () Bool)

(assert (=> b!982943 m!910689))

(declare-fun m!910691 () Bool)

(assert (=> b!982937 m!910691))

(declare-fun m!910693 () Bool)

(assert (=> mapNonEmpty!36257 m!910693))

(declare-fun m!910695 () Bool)

(assert (=> start!84184 m!910695))

(declare-fun m!910697 () Bool)

(assert (=> start!84184 m!910697))

(declare-fun m!910699 () Bool)

(assert (=> start!84184 m!910699))

(declare-fun m!910701 () Bool)

(assert (=> b!982940 m!910701))

(assert (=> b!982942 m!910681))

(declare-fun m!910703 () Bool)

(assert (=> b!982942 m!910703))

(declare-fun m!910705 () Bool)

(assert (=> b!982942 m!910705))

(declare-fun m!910707 () Bool)

(assert (=> b!982942 m!910707))

(assert (=> b!982942 m!910703))

(assert (=> b!982942 m!910707))

(declare-fun m!910709 () Bool)

(assert (=> b!982942 m!910709))

(assert (=> b!982944 m!910681))

(assert (=> b!982944 m!910681))

(declare-fun m!910711 () Bool)

(assert (=> b!982944 m!910711))

(check-sat b_and!31637 (not b!982937) (not b_next!19771) (not b!982942) (not start!84184) (not b!982943) (not b_lambda!14823) (not b!982944) tp_is_empty!22819 (not b!982940) (not mapNonEmpty!36257))
(check-sat b_and!31637 (not b_next!19771))
