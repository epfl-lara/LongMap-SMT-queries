; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84498 () Bool)

(assert start!84498)

(declare-fun b_free!20011 () Bool)

(declare-fun b_next!20011 () Bool)

(assert (=> start!84498 (= b_free!20011 (not b_next!20011))))

(declare-fun tp!69819 () Bool)

(declare-fun b_and!32079 () Bool)

(assert (=> start!84498 (= tp!69819 b_and!32079)))

(declare-fun b!988253 () Bool)

(declare-fun e!557255 () Bool)

(declare-fun e!557254 () Bool)

(declare-fun mapRes!36879 () Bool)

(assert (=> b!988253 (= e!557255 (and e!557254 mapRes!36879))))

(declare-fun condMapEmpty!36879 () Bool)

(declare-datatypes ((V!35953 0))(
  ( (V!35954 (val!11664 Int)) )
))
(declare-datatypes ((ValueCell!11132 0))(
  ( (ValueCellFull!11132 (v!14230 V!35953)) (EmptyCell!11132) )
))
(declare-datatypes ((array!62348 0))(
  ( (array!62349 (arr!30029 (Array (_ BitVec 32) ValueCell!11132)) (size!30510 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62348)

(declare-fun mapDefault!36879 () ValueCell!11132)

(assert (=> b!988253 (= condMapEmpty!36879 (= (arr!30029 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11132)) mapDefault!36879)))))

(declare-fun b!988254 () Bool)

(declare-fun res!661030 () Bool)

(declare-fun e!557252 () Bool)

(assert (=> b!988254 (=> (not res!661030) (not e!557252))))

(declare-datatypes ((array!62350 0))(
  ( (array!62351 (arr!30030 (Array (_ BitVec 32) (_ BitVec 64))) (size!30511 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62350)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988254 (= res!661030 (validKeyInArray!0 (select (arr!30030 _keys!1544) from!1932)))))

(declare-fun b!988255 () Bool)

(declare-fun res!661025 () Bool)

(assert (=> b!988255 (=> (not res!661025) (not e!557252))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62350 (_ BitVec 32)) Bool)

(assert (=> b!988255 (= res!661025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36879 () Bool)

(declare-fun tp!69818 () Bool)

(declare-fun e!557256 () Bool)

(assert (=> mapNonEmpty!36879 (= mapRes!36879 (and tp!69818 e!557256))))

(declare-fun mapRest!36879 () (Array (_ BitVec 32) ValueCell!11132))

(declare-fun mapKey!36879 () (_ BitVec 32))

(declare-fun mapValue!36879 () ValueCell!11132)

(assert (=> mapNonEmpty!36879 (= (arr!30029 _values!1278) (store mapRest!36879 mapKey!36879 mapValue!36879))))

(declare-fun b!988256 () Bool)

(declare-fun res!661029 () Bool)

(assert (=> b!988256 (=> (not res!661029) (not e!557252))))

(declare-datatypes ((List!20827 0))(
  ( (Nil!20824) (Cons!20823 (h!21985 (_ BitVec 64)) (t!29755 List!20827)) )
))
(declare-fun arrayNoDuplicates!0 (array!62350 (_ BitVec 32) List!20827) Bool)

(assert (=> b!988256 (= res!661029 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20824))))

(declare-fun b!988257 () Bool)

(declare-fun tp_is_empty!23227 () Bool)

(assert (=> b!988257 (= e!557256 tp_is_empty!23227)))

(declare-fun b!988258 () Bool)

(declare-fun res!661027 () Bool)

(assert (=> b!988258 (=> (not res!661027) (not e!557252))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!988258 (= res!661027 (and (= (size!30510 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30511 _keys!1544) (size!30510 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!661024 () Bool)

(assert (=> start!84498 (=> (not res!661024) (not e!557252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84498 (= res!661024 (validMask!0 mask!1948))))

(assert (=> start!84498 e!557252))

(assert (=> start!84498 true))

(assert (=> start!84498 tp_is_empty!23227))

(declare-fun array_inv!23207 (array!62348) Bool)

(assert (=> start!84498 (and (array_inv!23207 _values!1278) e!557255)))

(assert (=> start!84498 tp!69819))

(declare-fun array_inv!23208 (array!62350) Bool)

(assert (=> start!84498 (array_inv!23208 _keys!1544)))

(declare-fun b!988259 () Bool)

(assert (=> b!988259 (= e!557252 false)))

(declare-fun minValue!1220 () V!35953)

(declare-fun zeroValue!1220 () V!35953)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14938 0))(
  ( (tuple2!14939 (_1!7480 (_ BitVec 64)) (_2!7480 V!35953)) )
))
(declare-datatypes ((List!20828 0))(
  ( (Nil!20825) (Cons!20824 (h!21986 tuple2!14938) (t!29756 List!20828)) )
))
(declare-datatypes ((ListLongMap!13625 0))(
  ( (ListLongMap!13626 (toList!6828 List!20828)) )
))
(declare-fun lt!438287 () ListLongMap!13625)

(declare-fun getCurrentListMapNoExtraKeys!3531 (array!62350 array!62348 (_ BitVec 32) (_ BitVec 32) V!35953 V!35953 (_ BitVec 32) Int) ListLongMap!13625)

(assert (=> b!988259 (= lt!438287 (getCurrentListMapNoExtraKeys!3531 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988260 () Bool)

(declare-fun res!661026 () Bool)

(assert (=> b!988260 (=> (not res!661026) (not e!557252))))

(assert (=> b!988260 (= res!661026 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988261 () Bool)

(assert (=> b!988261 (= e!557254 tp_is_empty!23227)))

(declare-fun mapIsEmpty!36879 () Bool)

(assert (=> mapIsEmpty!36879 mapRes!36879))

(declare-fun b!988262 () Bool)

(declare-fun res!661028 () Bool)

(assert (=> b!988262 (=> (not res!661028) (not e!557252))))

(assert (=> b!988262 (= res!661028 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30511 _keys!1544))))))

(assert (= (and start!84498 res!661024) b!988258))

(assert (= (and b!988258 res!661027) b!988255))

(assert (= (and b!988255 res!661025) b!988256))

(assert (= (and b!988256 res!661029) b!988262))

(assert (= (and b!988262 res!661028) b!988254))

(assert (= (and b!988254 res!661030) b!988260))

(assert (= (and b!988260 res!661026) b!988259))

(assert (= (and b!988253 condMapEmpty!36879) mapIsEmpty!36879))

(assert (= (and b!988253 (not condMapEmpty!36879)) mapNonEmpty!36879))

(get-info :version)

(assert (= (and mapNonEmpty!36879 ((_ is ValueCellFull!11132) mapValue!36879)) b!988257))

(assert (= (and b!988253 ((_ is ValueCellFull!11132) mapDefault!36879)) b!988261))

(assert (= start!84498 b!988253))

(declare-fun m!914975 () Bool)

(assert (=> b!988254 m!914975))

(assert (=> b!988254 m!914975))

(declare-fun m!914977 () Bool)

(assert (=> b!988254 m!914977))

(declare-fun m!914979 () Bool)

(assert (=> mapNonEmpty!36879 m!914979))

(declare-fun m!914981 () Bool)

(assert (=> b!988256 m!914981))

(declare-fun m!914983 () Bool)

(assert (=> b!988259 m!914983))

(declare-fun m!914985 () Bool)

(assert (=> start!84498 m!914985))

(declare-fun m!914987 () Bool)

(assert (=> start!84498 m!914987))

(declare-fun m!914989 () Bool)

(assert (=> start!84498 m!914989))

(declare-fun m!914991 () Bool)

(assert (=> b!988255 m!914991))

(check-sat (not start!84498) (not b!988254) (not b!988256) (not mapNonEmpty!36879) b_and!32079 tp_is_empty!23227 (not b_next!20011) (not b!988255) (not b!988259))
(check-sat b_and!32079 (not b_next!20011))
