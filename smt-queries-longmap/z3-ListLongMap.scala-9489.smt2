; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112544 () Bool)

(assert start!112544)

(declare-fun b_free!30939 () Bool)

(declare-fun b_next!30939 () Bool)

(assert (=> start!112544 (= b_free!30939 (not b_next!30939))))

(declare-fun tp!108453 () Bool)

(declare-fun b_and!49847 () Bool)

(assert (=> start!112544 (= tp!108453 b_and!49847)))

(declare-fun b!1334982 () Bool)

(declare-fun res!885998 () Bool)

(declare-fun e!760325 () Bool)

(assert (=> b!1334982 (=> (not res!885998) (not e!760325))))

(declare-datatypes ((array!90558 0))(
  ( (array!90559 (arr!43745 (Array (_ BitVec 32) (_ BitVec 64))) (size!44295 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90558)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90558 (_ BitVec 32)) Bool)

(assert (=> b!1334982 (= res!885998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56947 () Bool)

(declare-fun mapRes!56947 () Bool)

(assert (=> mapIsEmpty!56947 mapRes!56947))

(declare-fun res!886002 () Bool)

(assert (=> start!112544 (=> (not res!886002) (not e!760325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112544 (= res!886002 (validMask!0 mask!1998))))

(assert (=> start!112544 e!760325))

(declare-datatypes ((V!54235 0))(
  ( (V!54236 (val!18499 Int)) )
))
(declare-datatypes ((ValueCell!17526 0))(
  ( (ValueCellFull!17526 (v!21136 V!54235)) (EmptyCell!17526) )
))
(declare-datatypes ((array!90560 0))(
  ( (array!90561 (arr!43746 (Array (_ BitVec 32) ValueCell!17526)) (size!44296 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90560)

(declare-fun e!760324 () Bool)

(declare-fun array_inv!32989 (array!90560) Bool)

(assert (=> start!112544 (and (array_inv!32989 _values!1320) e!760324)))

(assert (=> start!112544 true))

(declare-fun array_inv!32990 (array!90558) Bool)

(assert (=> start!112544 (array_inv!32990 _keys!1590)))

(assert (=> start!112544 tp!108453))

(declare-fun tp_is_empty!36849 () Bool)

(assert (=> start!112544 tp_is_empty!36849))

(declare-fun b!1334983 () Bool)

(declare-fun res!886000 () Bool)

(assert (=> b!1334983 (=> (not res!886000) (not e!760325))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1334983 (= res!886000 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44295 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334984 () Bool)

(declare-fun res!885999 () Bool)

(assert (=> b!1334984 (=> (not res!885999) (not e!760325))))

(declare-datatypes ((List!30990 0))(
  ( (Nil!30987) (Cons!30986 (h!32195 (_ BitVec 64)) (t!45254 List!30990)) )
))
(declare-fun arrayNoDuplicates!0 (array!90558 (_ BitVec 32) List!30990) Bool)

(assert (=> b!1334984 (= res!885999 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30987))))

(declare-fun b!1334985 () Bool)

(declare-fun e!760323 () Bool)

(assert (=> b!1334985 (= e!760323 tp_is_empty!36849)))

(declare-fun b!1334986 () Bool)

(declare-fun e!760326 () Bool)

(assert (=> b!1334986 (= e!760326 tp_is_empty!36849)))

(declare-fun b!1334987 () Bool)

(assert (=> b!1334987 (= e!760324 (and e!760326 mapRes!56947))))

(declare-fun condMapEmpty!56947 () Bool)

(declare-fun mapDefault!56947 () ValueCell!17526)

(assert (=> b!1334987 (= condMapEmpty!56947 (= (arr!43746 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17526)) mapDefault!56947)))))

(declare-fun b!1334988 () Bool)

(declare-fun res!886001 () Bool)

(assert (=> b!1334988 (=> (not res!886001) (not e!760325))))

(assert (=> b!1334988 (= res!886001 (and (= (size!44296 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44295 _keys!1590) (size!44296 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56947 () Bool)

(declare-fun tp!108454 () Bool)

(assert (=> mapNonEmpty!56947 (= mapRes!56947 (and tp!108454 e!760323))))

(declare-fun mapKey!56947 () (_ BitVec 32))

(declare-fun mapValue!56947 () ValueCell!17526)

(declare-fun mapRest!56947 () (Array (_ BitVec 32) ValueCell!17526))

(assert (=> mapNonEmpty!56947 (= (arr!43746 _values!1320) (store mapRest!56947 mapKey!56947 mapValue!56947))))

(declare-fun b!1334989 () Bool)

(assert (=> b!1334989 (= e!760325 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54235)

(declare-fun lt!592414 () Bool)

(declare-fun zeroValue!1262 () V!54235)

(declare-datatypes ((tuple2!23852 0))(
  ( (tuple2!23853 (_1!11937 (_ BitVec 64)) (_2!11937 V!54235)) )
))
(declare-datatypes ((List!30991 0))(
  ( (Nil!30988) (Cons!30987 (h!32196 tuple2!23852) (t!45255 List!30991)) )
))
(declare-datatypes ((ListLongMap!21509 0))(
  ( (ListLongMap!21510 (toList!10770 List!30991)) )
))
(declare-fun contains!8934 (ListLongMap!21509 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5744 (array!90558 array!90560 (_ BitVec 32) (_ BitVec 32) V!54235 V!54235 (_ BitVec 32) Int) ListLongMap!21509)

(assert (=> b!1334989 (= lt!592414 (contains!8934 (getCurrentListMap!5744 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112544 res!886002) b!1334988))

(assert (= (and b!1334988 res!886001) b!1334982))

(assert (= (and b!1334982 res!885998) b!1334984))

(assert (= (and b!1334984 res!885999) b!1334983))

(assert (= (and b!1334983 res!886000) b!1334989))

(assert (= (and b!1334987 condMapEmpty!56947) mapIsEmpty!56947))

(assert (= (and b!1334987 (not condMapEmpty!56947)) mapNonEmpty!56947))

(get-info :version)

(assert (= (and mapNonEmpty!56947 ((_ is ValueCellFull!17526) mapValue!56947)) b!1334985))

(assert (= (and b!1334987 ((_ is ValueCellFull!17526) mapDefault!56947)) b!1334986))

(assert (= start!112544 b!1334987))

(declare-fun m!1223203 () Bool)

(assert (=> start!112544 m!1223203))

(declare-fun m!1223205 () Bool)

(assert (=> start!112544 m!1223205))

(declare-fun m!1223207 () Bool)

(assert (=> start!112544 m!1223207))

(declare-fun m!1223209 () Bool)

(assert (=> b!1334982 m!1223209))

(declare-fun m!1223211 () Bool)

(assert (=> b!1334989 m!1223211))

(assert (=> b!1334989 m!1223211))

(declare-fun m!1223213 () Bool)

(assert (=> b!1334989 m!1223213))

(declare-fun m!1223215 () Bool)

(assert (=> b!1334984 m!1223215))

(declare-fun m!1223217 () Bool)

(assert (=> mapNonEmpty!56947 m!1223217))

(check-sat (not start!112544) (not b!1334984) (not b_next!30939) (not b!1334989) (not mapNonEmpty!56947) tp_is_empty!36849 b_and!49847 (not b!1334982))
(check-sat b_and!49847 (not b_next!30939))
