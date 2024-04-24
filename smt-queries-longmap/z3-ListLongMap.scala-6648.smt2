; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84028 () Bool)

(assert start!84028)

(declare-fun b_free!19669 () Bool)

(declare-fun b_next!19669 () Bool)

(assert (=> start!84028 (= b_free!19669 (not b_next!19669))))

(declare-fun tp!68449 () Bool)

(declare-fun b_and!31437 () Bool)

(assert (=> start!84028 (= tp!68449 b_and!31437)))

(declare-fun b!980654 () Bool)

(declare-fun e!552857 () Bool)

(declare-fun tp_is_empty!22663 () Bool)

(assert (=> b!980654 (= e!552857 tp_is_empty!22663)))

(declare-fun b!980655 () Bool)

(declare-fun e!552856 () Bool)

(declare-fun mapRes!36023 () Bool)

(assert (=> b!980655 (= e!552856 (and e!552857 mapRes!36023))))

(declare-fun condMapEmpty!36023 () Bool)

(declare-datatypes ((V!35201 0))(
  ( (V!35202 (val!11382 Int)) )
))
(declare-datatypes ((ValueCell!10850 0))(
  ( (ValueCellFull!10850 (v!13941 V!35201)) (EmptyCell!10850) )
))
(declare-datatypes ((array!61370 0))(
  ( (array!61371 (arr!29538 (Array (_ BitVec 32) ValueCell!10850)) (size!30018 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61370)

(declare-fun mapDefault!36023 () ValueCell!10850)

(assert (=> b!980655 (= condMapEmpty!36023 (= (arr!29538 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10850)) mapDefault!36023)))))

(declare-fun mapNonEmpty!36023 () Bool)

(declare-fun tp!68450 () Bool)

(declare-fun e!552854 () Bool)

(assert (=> mapNonEmpty!36023 (= mapRes!36023 (and tp!68450 e!552854))))

(declare-fun mapKey!36023 () (_ BitVec 32))

(declare-fun mapValue!36023 () ValueCell!10850)

(declare-fun mapRest!36023 () (Array (_ BitVec 32) ValueCell!10850))

(assert (=> mapNonEmpty!36023 (= (arr!29538 _values!1278) (store mapRest!36023 mapKey!36023 mapValue!36023))))

(declare-fun res!656026 () Bool)

(declare-fun e!552853 () Bool)

(assert (=> start!84028 (=> (not res!656026) (not e!552853))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84028 (= res!656026 (validMask!0 mask!1948))))

(assert (=> start!84028 e!552853))

(assert (=> start!84028 true))

(assert (=> start!84028 tp_is_empty!22663))

(declare-fun array_inv!22873 (array!61370) Bool)

(assert (=> start!84028 (and (array_inv!22873 _values!1278) e!552856)))

(assert (=> start!84028 tp!68449))

(declare-datatypes ((array!61372 0))(
  ( (array!61373 (arr!29539 (Array (_ BitVec 32) (_ BitVec 64))) (size!30019 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61372)

(declare-fun array_inv!22874 (array!61372) Bool)

(assert (=> start!84028 (array_inv!22874 _keys!1544)))

(declare-fun mapIsEmpty!36023 () Bool)

(assert (=> mapIsEmpty!36023 mapRes!36023))

(declare-fun b!980656 () Bool)

(declare-fun res!656025 () Bool)

(assert (=> b!980656 (=> (not res!656025) (not e!552853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61372 (_ BitVec 32)) Bool)

(assert (=> b!980656 (= res!656025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980657 () Bool)

(declare-fun e!552855 () Bool)

(assert (=> b!980657 (= e!552853 (not e!552855))))

(declare-fun res!656024 () Bool)

(assert (=> b!980657 (=> res!656024 e!552855)))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980657 (= res!656024 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29539 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14612 0))(
  ( (tuple2!14613 (_1!7317 (_ BitVec 64)) (_2!7317 V!35201)) )
))
(declare-fun lt!435085 () tuple2!14612)

(declare-datatypes ((List!20471 0))(
  ( (Nil!20468) (Cons!20467 (h!21635 tuple2!14612) (t!29088 List!20471)) )
))
(declare-datatypes ((ListLongMap!13311 0))(
  ( (ListLongMap!13312 (toList!6671 List!20471)) )
))
(declare-fun lt!435082 () ListLongMap!13311)

(declare-fun lt!435084 () tuple2!14612)

(declare-fun lt!435089 () ListLongMap!13311)

(declare-fun +!2986 (ListLongMap!13311 tuple2!14612) ListLongMap!13311)

(assert (=> b!980657 (= (+!2986 lt!435089 lt!435084) (+!2986 lt!435082 lt!435085))))

(declare-fun lt!435081 () ListLongMap!13311)

(assert (=> b!980657 (= lt!435082 (+!2986 lt!435081 lt!435084))))

(declare-fun lt!435087 () V!35201)

(assert (=> b!980657 (= lt!435084 (tuple2!14613 (select (arr!29539 _keys!1544) from!1932) lt!435087))))

(assert (=> b!980657 (= lt!435089 (+!2986 lt!435081 lt!435085))))

(declare-fun minValue!1220 () V!35201)

(assert (=> b!980657 (= lt!435085 (tuple2!14613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32552 0))(
  ( (Unit!32553) )
))
(declare-fun lt!435086 () Unit!32552)

(declare-fun addCommutativeForDiffKeys!593 (ListLongMap!13311 (_ BitVec 64) V!35201 (_ BitVec 64) V!35201) Unit!32552)

(assert (=> b!980657 (= lt!435086 (addCommutativeForDiffKeys!593 lt!435081 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29539 _keys!1544) from!1932) lt!435087))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15334 (ValueCell!10850 V!35201) V!35201)

(declare-fun dynLambda!1781 (Int (_ BitVec 64)) V!35201)

(assert (=> b!980657 (= lt!435087 (get!15334 (select (arr!29538 _values!1278) from!1932) (dynLambda!1781 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435083 () ListLongMap!13311)

(declare-fun lt!435090 () tuple2!14612)

(assert (=> b!980657 (= lt!435081 (+!2986 lt!435083 lt!435090))))

(declare-fun zeroValue!1220 () V!35201)

(assert (=> b!980657 (= lt!435090 (tuple2!14613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3419 (array!61372 array!61370 (_ BitVec 32) (_ BitVec 32) V!35201 V!35201 (_ BitVec 32) Int) ListLongMap!13311)

(assert (=> b!980657 (= lt!435083 (getCurrentListMapNoExtraKeys!3419 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980658 () Bool)

(declare-fun res!656028 () Bool)

(assert (=> b!980658 (=> (not res!656028) (not e!552853))))

(assert (=> b!980658 (= res!656028 (and (= (size!30018 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30019 _keys!1544) (size!30018 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980659 () Bool)

(declare-fun res!656027 () Bool)

(assert (=> b!980659 (=> (not res!656027) (not e!552853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980659 (= res!656027 (validKeyInArray!0 (select (arr!29539 _keys!1544) from!1932)))))

(declare-fun b!980660 () Bool)

(declare-fun res!656023 () Bool)

(assert (=> b!980660 (=> (not res!656023) (not e!552853))))

(assert (=> b!980660 (= res!656023 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30019 _keys!1544))))))

(declare-fun b!980661 () Bool)

(declare-fun res!656022 () Bool)

(assert (=> b!980661 (=> (not res!656022) (not e!552853))))

(declare-datatypes ((List!20472 0))(
  ( (Nil!20469) (Cons!20468 (h!21636 (_ BitVec 64)) (t!29089 List!20472)) )
))
(declare-fun arrayNoDuplicates!0 (array!61372 (_ BitVec 32) List!20472) Bool)

(assert (=> b!980661 (= res!656022 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20469))))

(declare-fun b!980662 () Bool)

(declare-fun res!656029 () Bool)

(assert (=> b!980662 (=> (not res!656029) (not e!552853))))

(assert (=> b!980662 (= res!656029 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980663 () Bool)

(assert (=> b!980663 (= e!552854 tp_is_empty!22663)))

(declare-fun b!980664 () Bool)

(assert (=> b!980664 (= e!552855 (bvsle from!1932 (size!30019 _keys!1544)))))

(assert (=> b!980664 (= lt!435082 (+!2986 (+!2986 lt!435083 lt!435084) lt!435090))))

(declare-fun lt!435088 () Unit!32552)

(assert (=> b!980664 (= lt!435088 (addCommutativeForDiffKeys!593 lt!435083 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29539 _keys!1544) from!1932) lt!435087))))

(assert (= (and start!84028 res!656026) b!980658))

(assert (= (and b!980658 res!656028) b!980656))

(assert (= (and b!980656 res!656025) b!980661))

(assert (= (and b!980661 res!656022) b!980660))

(assert (= (and b!980660 res!656023) b!980659))

(assert (= (and b!980659 res!656027) b!980662))

(assert (= (and b!980662 res!656029) b!980657))

(assert (= (and b!980657 (not res!656024)) b!980664))

(assert (= (and b!980655 condMapEmpty!36023) mapIsEmpty!36023))

(assert (= (and b!980655 (not condMapEmpty!36023)) mapNonEmpty!36023))

(get-info :version)

(assert (= (and mapNonEmpty!36023 ((_ is ValueCellFull!10850) mapValue!36023)) b!980663))

(assert (= (and b!980655 ((_ is ValueCellFull!10850) mapDefault!36023)) b!980654))

(assert (= start!84028 b!980655))

(declare-fun b_lambda!14727 () Bool)

(assert (=> (not b_lambda!14727) (not b!980657)))

(declare-fun t!29087 () Bool)

(declare-fun tb!6467 () Bool)

(assert (=> (and start!84028 (= defaultEntry!1281 defaultEntry!1281) t!29087) tb!6467))

(declare-fun result!12931 () Bool)

(assert (=> tb!6467 (= result!12931 tp_is_empty!22663)))

(assert (=> b!980657 t!29087))

(declare-fun b_and!31439 () Bool)

(assert (= b_and!31437 (and (=> t!29087 result!12931) b_and!31439)))

(declare-fun m!908417 () Bool)

(assert (=> mapNonEmpty!36023 m!908417))

(declare-fun m!908419 () Bool)

(assert (=> start!84028 m!908419))

(declare-fun m!908421 () Bool)

(assert (=> start!84028 m!908421))

(declare-fun m!908423 () Bool)

(assert (=> start!84028 m!908423))

(declare-fun m!908425 () Bool)

(assert (=> b!980661 m!908425))

(declare-fun m!908427 () Bool)

(assert (=> b!980664 m!908427))

(assert (=> b!980664 m!908427))

(declare-fun m!908429 () Bool)

(assert (=> b!980664 m!908429))

(declare-fun m!908431 () Bool)

(assert (=> b!980664 m!908431))

(assert (=> b!980664 m!908431))

(declare-fun m!908433 () Bool)

(assert (=> b!980664 m!908433))

(assert (=> b!980657 m!908431))

(declare-fun m!908435 () Bool)

(assert (=> b!980657 m!908435))

(assert (=> b!980657 m!908431))

(declare-fun m!908437 () Bool)

(assert (=> b!980657 m!908437))

(declare-fun m!908439 () Bool)

(assert (=> b!980657 m!908439))

(declare-fun m!908441 () Bool)

(assert (=> b!980657 m!908441))

(declare-fun m!908443 () Bool)

(assert (=> b!980657 m!908443))

(declare-fun m!908445 () Bool)

(assert (=> b!980657 m!908445))

(declare-fun m!908447 () Bool)

(assert (=> b!980657 m!908447))

(declare-fun m!908449 () Bool)

(assert (=> b!980657 m!908449))

(declare-fun m!908451 () Bool)

(assert (=> b!980657 m!908451))

(assert (=> b!980657 m!908437))

(assert (=> b!980657 m!908451))

(declare-fun m!908453 () Bool)

(assert (=> b!980657 m!908453))

(declare-fun m!908455 () Bool)

(assert (=> b!980656 m!908455))

(assert (=> b!980659 m!908431))

(assert (=> b!980659 m!908431))

(declare-fun m!908457 () Bool)

(assert (=> b!980659 m!908457))

(check-sat (not b!980661) tp_is_empty!22663 (not b!980656) (not b!980664) (not b_next!19669) b_and!31439 (not b!980657) (not start!84028) (not b_lambda!14727) (not mapNonEmpty!36023) (not b!980659))
(check-sat b_and!31439 (not b_next!19669))
