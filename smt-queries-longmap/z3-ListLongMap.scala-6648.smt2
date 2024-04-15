; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83842 () Bool)

(assert start!83842)

(declare-fun b_free!19669 () Bool)

(declare-fun b_next!19669 () Bool)

(assert (=> start!83842 (= b_free!19669 (not b_next!19669))))

(declare-fun tp!68449 () Bool)

(declare-fun b_and!31401 () Bool)

(assert (=> start!83842 (= tp!68449 b_and!31401)))

(declare-fun b!979512 () Bool)

(declare-fun res!655570 () Bool)

(declare-fun e!552123 () Bool)

(assert (=> b!979512 (=> (not res!655570) (not e!552123))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61262 0))(
  ( (array!61263 (arr!29489 (Array (_ BitVec 32) (_ BitVec 64))) (size!29970 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61262)

(assert (=> b!979512 (= res!655570 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29970 _keys!1544))))))

(declare-fun b!979513 () Bool)

(declare-fun res!655571 () Bool)

(assert (=> b!979513 (=> (not res!655571) (not e!552123))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35201 0))(
  ( (V!35202 (val!11382 Int)) )
))
(declare-datatypes ((ValueCell!10850 0))(
  ( (ValueCellFull!10850 (v!13943 V!35201)) (EmptyCell!10850) )
))
(declare-datatypes ((array!61264 0))(
  ( (array!61265 (arr!29490 (Array (_ BitVec 32) ValueCell!10850)) (size!29971 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61264)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979513 (= res!655571 (and (= (size!29971 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29970 _keys!1544) (size!29971 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36023 () Bool)

(declare-fun mapRes!36023 () Bool)

(declare-fun tp!68450 () Bool)

(declare-fun e!552127 () Bool)

(assert (=> mapNonEmpty!36023 (= mapRes!36023 (and tp!68450 e!552127))))

(declare-fun mapRest!36023 () (Array (_ BitVec 32) ValueCell!10850))

(declare-fun mapValue!36023 () ValueCell!10850)

(declare-fun mapKey!36023 () (_ BitVec 32))

(assert (=> mapNonEmpty!36023 (= (arr!29490 _values!1278) (store mapRest!36023 mapKey!36023 mapValue!36023))))

(declare-fun b!979514 () Bool)

(declare-fun res!655575 () Bool)

(assert (=> b!979514 (=> (not res!655575) (not e!552123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61262 (_ BitVec 32)) Bool)

(assert (=> b!979514 (= res!655575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979515 () Bool)

(declare-fun res!655573 () Bool)

(assert (=> b!979515 (=> (not res!655573) (not e!552123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979515 (= res!655573 (validKeyInArray!0 (select (arr!29489 _keys!1544) from!1932)))))

(declare-fun b!979516 () Bool)

(declare-fun tp_is_empty!22663 () Bool)

(assert (=> b!979516 (= e!552127 tp_is_empty!22663)))

(declare-fun b!979517 () Bool)

(declare-fun e!552128 () Bool)

(assert (=> b!979517 (= e!552123 (not e!552128))))

(declare-fun res!655568 () Bool)

(assert (=> b!979517 (=> res!655568 e!552128)))

(assert (=> b!979517 (= res!655568 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29489 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14664 0))(
  ( (tuple2!14665 (_1!7343 (_ BitVec 64)) (_2!7343 V!35201)) )
))
(declare-datatypes ((List!20489 0))(
  ( (Nil!20486) (Cons!20485 (h!21647 tuple2!14664) (t!29105 List!20489)) )
))
(declare-datatypes ((ListLongMap!13351 0))(
  ( (ListLongMap!13352 (toList!6691 List!20489)) )
))
(declare-fun lt!434488 () ListLongMap!13351)

(declare-fun lt!434491 () tuple2!14664)

(declare-fun lt!434492 () tuple2!14664)

(declare-fun lt!434485 () ListLongMap!13351)

(declare-fun +!2991 (ListLongMap!13351 tuple2!14664) ListLongMap!13351)

(assert (=> b!979517 (= (+!2991 lt!434485 lt!434491) (+!2991 lt!434488 lt!434492))))

(declare-fun lt!434493 () ListLongMap!13351)

(assert (=> b!979517 (= lt!434488 (+!2991 lt!434493 lt!434491))))

(declare-fun lt!434484 () V!35201)

(assert (=> b!979517 (= lt!434491 (tuple2!14665 (select (arr!29489 _keys!1544) from!1932) lt!434484))))

(assert (=> b!979517 (= lt!434485 (+!2991 lt!434493 lt!434492))))

(declare-fun minValue!1220 () V!35201)

(assert (=> b!979517 (= lt!434492 (tuple2!14665 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32448 0))(
  ( (Unit!32449) )
))
(declare-fun lt!434489 () Unit!32448)

(declare-fun addCommutativeForDiffKeys!595 (ListLongMap!13351 (_ BitVec 64) V!35201 (_ BitVec 64) V!35201) Unit!32448)

(assert (=> b!979517 (= lt!434489 (addCommutativeForDiffKeys!595 lt!434493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29489 _keys!1544) from!1932) lt!434484))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15295 (ValueCell!10850 V!35201) V!35201)

(declare-fun dynLambda!1741 (Int (_ BitVec 64)) V!35201)

(assert (=> b!979517 (= lt!434484 (get!15295 (select (arr!29490 _values!1278) from!1932) (dynLambda!1741 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434490 () ListLongMap!13351)

(declare-fun lt!434487 () tuple2!14664)

(assert (=> b!979517 (= lt!434493 (+!2991 lt!434490 lt!434487))))

(declare-fun zeroValue!1220 () V!35201)

(assert (=> b!979517 (= lt!434487 (tuple2!14665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3408 (array!61262 array!61264 (_ BitVec 32) (_ BitVec 32) V!35201 V!35201 (_ BitVec 32) Int) ListLongMap!13351)

(assert (=> b!979517 (= lt!434490 (getCurrentListMapNoExtraKeys!3408 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!979518 () Bool)

(assert (=> b!979518 (= e!552128 (bvsle from!1932 (size!29970 _keys!1544)))))

(assert (=> b!979518 (= lt!434488 (+!2991 (+!2991 lt!434490 lt!434491) lt!434487))))

(declare-fun lt!434486 () Unit!32448)

(assert (=> b!979518 (= lt!434486 (addCommutativeForDiffKeys!595 lt!434490 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29489 _keys!1544) from!1932) lt!434484))))

(declare-fun b!979519 () Bool)

(declare-fun e!552125 () Bool)

(assert (=> b!979519 (= e!552125 tp_is_empty!22663)))

(declare-fun b!979520 () Bool)

(declare-fun res!655574 () Bool)

(assert (=> b!979520 (=> (not res!655574) (not e!552123))))

(declare-datatypes ((List!20490 0))(
  ( (Nil!20487) (Cons!20486 (h!21648 (_ BitVec 64)) (t!29106 List!20490)) )
))
(declare-fun arrayNoDuplicates!0 (array!61262 (_ BitVec 32) List!20490) Bool)

(assert (=> b!979520 (= res!655574 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20487))))

(declare-fun res!655572 () Bool)

(assert (=> start!83842 (=> (not res!655572) (not e!552123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83842 (= res!655572 (validMask!0 mask!1948))))

(assert (=> start!83842 e!552123))

(assert (=> start!83842 true))

(assert (=> start!83842 tp_is_empty!22663))

(declare-fun e!552124 () Bool)

(declare-fun array_inv!22831 (array!61264) Bool)

(assert (=> start!83842 (and (array_inv!22831 _values!1278) e!552124)))

(assert (=> start!83842 tp!68449))

(declare-fun array_inv!22832 (array!61262) Bool)

(assert (=> start!83842 (array_inv!22832 _keys!1544)))

(declare-fun b!979521 () Bool)

(assert (=> b!979521 (= e!552124 (and e!552125 mapRes!36023))))

(declare-fun condMapEmpty!36023 () Bool)

(declare-fun mapDefault!36023 () ValueCell!10850)

(assert (=> b!979521 (= condMapEmpty!36023 (= (arr!29490 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10850)) mapDefault!36023)))))

(declare-fun mapIsEmpty!36023 () Bool)

(assert (=> mapIsEmpty!36023 mapRes!36023))

(declare-fun b!979522 () Bool)

(declare-fun res!655569 () Bool)

(assert (=> b!979522 (=> (not res!655569) (not e!552123))))

(assert (=> b!979522 (= res!655569 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!83842 res!655572) b!979513))

(assert (= (and b!979513 res!655571) b!979514))

(assert (= (and b!979514 res!655575) b!979520))

(assert (= (and b!979520 res!655574) b!979512))

(assert (= (and b!979512 res!655570) b!979515))

(assert (= (and b!979515 res!655573) b!979522))

(assert (= (and b!979522 res!655569) b!979517))

(assert (= (and b!979517 (not res!655568)) b!979518))

(assert (= (and b!979521 condMapEmpty!36023) mapIsEmpty!36023))

(assert (= (and b!979521 (not condMapEmpty!36023)) mapNonEmpty!36023))

(get-info :version)

(assert (= (and mapNonEmpty!36023 ((_ is ValueCellFull!10850) mapValue!36023)) b!979516))

(assert (= (and b!979521 ((_ is ValueCellFull!10850) mapDefault!36023)) b!979519))

(assert (= start!83842 b!979521))

(declare-fun b_lambda!14695 () Bool)

(assert (=> (not b_lambda!14695) (not b!979517)))

(declare-fun t!29104 () Bool)

(declare-fun tb!6467 () Bool)

(assert (=> (and start!83842 (= defaultEntry!1281 defaultEntry!1281) t!29104) tb!6467))

(declare-fun result!12931 () Bool)

(assert (=> tb!6467 (= result!12931 tp_is_empty!22663)))

(assert (=> b!979517 t!29104))

(declare-fun b_and!31403 () Bool)

(assert (= b_and!31401 (and (=> t!29104 result!12931) b_and!31403)))

(declare-fun m!906365 () Bool)

(assert (=> b!979518 m!906365))

(assert (=> b!979518 m!906365))

(declare-fun m!906367 () Bool)

(assert (=> b!979518 m!906367))

(declare-fun m!906369 () Bool)

(assert (=> b!979518 m!906369))

(assert (=> b!979518 m!906369))

(declare-fun m!906371 () Bool)

(assert (=> b!979518 m!906371))

(assert (=> b!979515 m!906369))

(assert (=> b!979515 m!906369))

(declare-fun m!906373 () Bool)

(assert (=> b!979515 m!906373))

(assert (=> b!979517 m!906369))

(declare-fun m!906375 () Bool)

(assert (=> b!979517 m!906375))

(declare-fun m!906377 () Bool)

(assert (=> b!979517 m!906377))

(declare-fun m!906379 () Bool)

(assert (=> b!979517 m!906379))

(declare-fun m!906381 () Bool)

(assert (=> b!979517 m!906381))

(declare-fun m!906383 () Bool)

(assert (=> b!979517 m!906383))

(declare-fun m!906385 () Bool)

(assert (=> b!979517 m!906385))

(assert (=> b!979517 m!906369))

(declare-fun m!906387 () Bool)

(assert (=> b!979517 m!906387))

(declare-fun m!906389 () Bool)

(assert (=> b!979517 m!906389))

(declare-fun m!906391 () Bool)

(assert (=> b!979517 m!906391))

(assert (=> b!979517 m!906375))

(assert (=> b!979517 m!906391))

(declare-fun m!906393 () Bool)

(assert (=> b!979517 m!906393))

(declare-fun m!906395 () Bool)

(assert (=> b!979520 m!906395))

(declare-fun m!906397 () Bool)

(assert (=> b!979514 m!906397))

(declare-fun m!906399 () Bool)

(assert (=> start!83842 m!906399))

(declare-fun m!906401 () Bool)

(assert (=> start!83842 m!906401))

(declare-fun m!906403 () Bool)

(assert (=> start!83842 m!906403))

(declare-fun m!906405 () Bool)

(assert (=> mapNonEmpty!36023 m!906405))

(check-sat (not b!979514) (not b_lambda!14695) (not b!979520) (not b!979515) tp_is_empty!22663 (not b!979518) (not b_next!19669) b_and!31403 (not b!979517) (not start!83842) (not mapNonEmpty!36023))
(check-sat b_and!31403 (not b_next!19669))
