; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83844 () Bool)

(assert start!83844)

(declare-fun b_free!19653 () Bool)

(declare-fun b_next!19653 () Bool)

(assert (=> start!83844 (= b_free!19653 (not b_next!19653))))

(declare-fun tp!68401 () Bool)

(declare-fun b_and!31395 () Bool)

(assert (=> start!83844 (= tp!68401 b_and!31395)))

(declare-fun b!979471 () Bool)

(declare-fun res!655489 () Bool)

(declare-fun e!552127 () Bool)

(assert (=> b!979471 (=> (not res!655489) (not e!552127))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35179 0))(
  ( (V!35180 (val!11374 Int)) )
))
(declare-datatypes ((ValueCell!10842 0))(
  ( (ValueCellFull!10842 (v!13936 V!35179)) (EmptyCell!10842) )
))
(declare-datatypes ((array!61311 0))(
  ( (array!61312 (arr!29513 (Array (_ BitVec 32) ValueCell!10842)) (size!29992 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61311)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61313 0))(
  ( (array!61314 (arr!29514 (Array (_ BitVec 32) (_ BitVec 64))) (size!29993 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61313)

(assert (=> b!979471 (= res!655489 (and (= (size!29992 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29993 _keys!1544) (size!29992 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979472 () Bool)

(declare-fun res!655490 () Bool)

(assert (=> b!979472 (=> (not res!655490) (not e!552127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61313 (_ BitVec 32)) Bool)

(assert (=> b!979472 (= res!655490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979473 () Bool)

(declare-fun res!655487 () Bool)

(assert (=> b!979473 (=> (not res!655487) (not e!552127))))

(assert (=> b!979473 (= res!655487 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979474 () Bool)

(declare-fun e!552129 () Bool)

(declare-fun e!552128 () Bool)

(declare-fun mapRes!35999 () Bool)

(assert (=> b!979474 (= e!552129 (and e!552128 mapRes!35999))))

(declare-fun condMapEmpty!35999 () Bool)

(declare-fun mapDefault!35999 () ValueCell!10842)

(assert (=> b!979474 (= condMapEmpty!35999 (= (arr!29513 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10842)) mapDefault!35999)))))

(declare-fun b!979475 () Bool)

(declare-fun e!552132 () Bool)

(assert (=> b!979475 (= e!552132 true)))

(declare-datatypes ((tuple2!14590 0))(
  ( (tuple2!14591 (_1!7306 (_ BitVec 64)) (_2!7306 V!35179)) )
))
(declare-datatypes ((List!20460 0))(
  ( (Nil!20457) (Cons!20456 (h!21618 tuple2!14590) (t!29069 List!20460)) )
))
(declare-datatypes ((ListLongMap!13287 0))(
  ( (ListLongMap!13288 (toList!6659 List!20460)) )
))
(declare-fun lt!434480 () ListLongMap!13287)

(declare-fun lt!434481 () ListLongMap!13287)

(declare-fun lt!434485 () tuple2!14590)

(declare-fun lt!434489 () tuple2!14590)

(declare-fun +!2964 (ListLongMap!13287 tuple2!14590) ListLongMap!13287)

(assert (=> b!979475 (= lt!434481 (+!2964 (+!2964 lt!434480 lt!434489) lt!434485))))

(declare-fun lt!434482 () V!35179)

(declare-datatypes ((Unit!32567 0))(
  ( (Unit!32568) )
))
(declare-fun lt!434486 () Unit!32567)

(declare-fun zeroValue!1220 () V!35179)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!592 (ListLongMap!13287 (_ BitVec 64) V!35179 (_ BitVec 64) V!35179) Unit!32567)

(assert (=> b!979475 (= lt!434486 (addCommutativeForDiffKeys!592 lt!434480 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29514 _keys!1544) from!1932) lt!434482))))

(declare-fun b!979476 () Bool)

(declare-fun res!655488 () Bool)

(assert (=> b!979476 (=> (not res!655488) (not e!552127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979476 (= res!655488 (validKeyInArray!0 (select (arr!29514 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!35999 () Bool)

(declare-fun tp!68400 () Bool)

(declare-fun e!552130 () Bool)

(assert (=> mapNonEmpty!35999 (= mapRes!35999 (and tp!68400 e!552130))))

(declare-fun mapKey!35999 () (_ BitVec 32))

(declare-fun mapValue!35999 () ValueCell!10842)

(declare-fun mapRest!35999 () (Array (_ BitVec 32) ValueCell!10842))

(assert (=> mapNonEmpty!35999 (= (arr!29513 _values!1278) (store mapRest!35999 mapKey!35999 mapValue!35999))))

(declare-fun b!979478 () Bool)

(declare-fun res!655491 () Bool)

(assert (=> b!979478 (=> (not res!655491) (not e!552127))))

(declare-datatypes ((List!20461 0))(
  ( (Nil!20458) (Cons!20457 (h!21619 (_ BitVec 64)) (t!29070 List!20461)) )
))
(declare-fun arrayNoDuplicates!0 (array!61313 (_ BitVec 32) List!20461) Bool)

(assert (=> b!979478 (= res!655491 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20458))))

(declare-fun mapIsEmpty!35999 () Bool)

(assert (=> mapIsEmpty!35999 mapRes!35999))

(declare-fun b!979479 () Bool)

(assert (=> b!979479 (= e!552127 (not e!552132))))

(declare-fun res!655493 () Bool)

(assert (=> b!979479 (=> res!655493 e!552132)))

(assert (=> b!979479 (= res!655493 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29514 _keys!1544) from!1932)))))

(declare-fun lt!434488 () ListLongMap!13287)

(declare-fun lt!434484 () tuple2!14590)

(assert (=> b!979479 (= (+!2964 lt!434488 lt!434489) (+!2964 lt!434481 lt!434484))))

(declare-fun lt!434487 () ListLongMap!13287)

(assert (=> b!979479 (= lt!434481 (+!2964 lt!434487 lt!434489))))

(assert (=> b!979479 (= lt!434489 (tuple2!14591 (select (arr!29514 _keys!1544) from!1932) lt!434482))))

(assert (=> b!979479 (= lt!434488 (+!2964 lt!434487 lt!434484))))

(declare-fun minValue!1220 () V!35179)

(assert (=> b!979479 (= lt!434484 (tuple2!14591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434483 () Unit!32567)

(assert (=> b!979479 (= lt!434483 (addCommutativeForDiffKeys!592 lt!434487 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29514 _keys!1544) from!1932) lt!434482))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15294 (ValueCell!10842 V!35179) V!35179)

(declare-fun dynLambda!1751 (Int (_ BitVec 64)) V!35179)

(assert (=> b!979479 (= lt!434482 (get!15294 (select (arr!29513 _values!1278) from!1932) (dynLambda!1751 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979479 (= lt!434487 (+!2964 lt!434480 lt!434485))))

(assert (=> b!979479 (= lt!434485 (tuple2!14591 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3365 (array!61313 array!61311 (_ BitVec 32) (_ BitVec 32) V!35179 V!35179 (_ BitVec 32) Int) ListLongMap!13287)

(assert (=> b!979479 (= lt!434480 (getCurrentListMapNoExtraKeys!3365 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!655486 () Bool)

(assert (=> start!83844 (=> (not res!655486) (not e!552127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83844 (= res!655486 (validMask!0 mask!1948))))

(assert (=> start!83844 e!552127))

(assert (=> start!83844 true))

(declare-fun tp_is_empty!22647 () Bool)

(assert (=> start!83844 tp_is_empty!22647))

(declare-fun array_inv!22817 (array!61311) Bool)

(assert (=> start!83844 (and (array_inv!22817 _values!1278) e!552129)))

(assert (=> start!83844 tp!68401))

(declare-fun array_inv!22818 (array!61313) Bool)

(assert (=> start!83844 (array_inv!22818 _keys!1544)))

(declare-fun b!979477 () Bool)

(assert (=> b!979477 (= e!552128 tp_is_empty!22647)))

(declare-fun b!979480 () Bool)

(declare-fun res!655492 () Bool)

(assert (=> b!979480 (=> (not res!655492) (not e!552127))))

(assert (=> b!979480 (= res!655492 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29993 _keys!1544))))))

(declare-fun b!979481 () Bool)

(assert (=> b!979481 (= e!552130 tp_is_empty!22647)))

(assert (= (and start!83844 res!655486) b!979471))

(assert (= (and b!979471 res!655489) b!979472))

(assert (= (and b!979472 res!655490) b!979478))

(assert (= (and b!979478 res!655491) b!979480))

(assert (= (and b!979480 res!655492) b!979476))

(assert (= (and b!979476 res!655488) b!979473))

(assert (= (and b!979473 res!655487) b!979479))

(assert (= (and b!979479 (not res!655493)) b!979475))

(assert (= (and b!979474 condMapEmpty!35999) mapIsEmpty!35999))

(assert (= (and b!979474 (not condMapEmpty!35999)) mapNonEmpty!35999))

(get-info :version)

(assert (= (and mapNonEmpty!35999 ((_ is ValueCellFull!10842) mapValue!35999)) b!979481))

(assert (= (and b!979474 ((_ is ValueCellFull!10842) mapDefault!35999)) b!979477))

(assert (= start!83844 b!979474))

(declare-fun b_lambda!14697 () Bool)

(assert (=> (not b_lambda!14697) (not b!979479)))

(declare-fun t!29068 () Bool)

(declare-fun tb!6459 () Bool)

(assert (=> (and start!83844 (= defaultEntry!1281 defaultEntry!1281) t!29068) tb!6459))

(declare-fun result!12907 () Bool)

(assert (=> tb!6459 (= result!12907 tp_is_empty!22647)))

(assert (=> b!979479 t!29068))

(declare-fun b_and!31397 () Bool)

(assert (= b_and!31395 (and (=> t!29068 result!12907) b_and!31397)))

(declare-fun m!906787 () Bool)

(assert (=> b!979475 m!906787))

(assert (=> b!979475 m!906787))

(declare-fun m!906789 () Bool)

(assert (=> b!979475 m!906789))

(declare-fun m!906791 () Bool)

(assert (=> b!979475 m!906791))

(assert (=> b!979475 m!906791))

(declare-fun m!906793 () Bool)

(assert (=> b!979475 m!906793))

(declare-fun m!906795 () Bool)

(assert (=> mapNonEmpty!35999 m!906795))

(declare-fun m!906797 () Bool)

(assert (=> start!83844 m!906797))

(declare-fun m!906799 () Bool)

(assert (=> start!83844 m!906799))

(declare-fun m!906801 () Bool)

(assert (=> start!83844 m!906801))

(declare-fun m!906803 () Bool)

(assert (=> b!979478 m!906803))

(declare-fun m!906805 () Bool)

(assert (=> b!979472 m!906805))

(assert (=> b!979476 m!906791))

(assert (=> b!979476 m!906791))

(declare-fun m!906807 () Bool)

(assert (=> b!979476 m!906807))

(assert (=> b!979479 m!906791))

(declare-fun m!906809 () Bool)

(assert (=> b!979479 m!906809))

(assert (=> b!979479 m!906791))

(declare-fun m!906811 () Bool)

(assert (=> b!979479 m!906811))

(declare-fun m!906813 () Bool)

(assert (=> b!979479 m!906813))

(declare-fun m!906815 () Bool)

(assert (=> b!979479 m!906815))

(declare-fun m!906817 () Bool)

(assert (=> b!979479 m!906817))

(declare-fun m!906819 () Bool)

(assert (=> b!979479 m!906819))

(declare-fun m!906821 () Bool)

(assert (=> b!979479 m!906821))

(declare-fun m!906823 () Bool)

(assert (=> b!979479 m!906823))

(declare-fun m!906825 () Bool)

(assert (=> b!979479 m!906825))

(assert (=> b!979479 m!906811))

(assert (=> b!979479 m!906825))

(declare-fun m!906827 () Bool)

(assert (=> b!979479 m!906827))

(check-sat tp_is_empty!22647 (not b!979472) (not b_next!19653) (not b!979475) (not mapNonEmpty!35999) (not b!979476) (not b_lambda!14697) b_and!31397 (not b!979478) (not start!83844) (not b!979479))
(check-sat b_and!31397 (not b_next!19653))
