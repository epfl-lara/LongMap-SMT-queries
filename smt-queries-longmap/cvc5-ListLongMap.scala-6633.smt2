; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83770 () Bool)

(assert start!83770)

(declare-fun b_free!19579 () Bool)

(declare-fun b_next!19579 () Bool)

(assert (=> start!83770 (= b_free!19579 (not b_next!19579))))

(declare-fun tp!68178 () Bool)

(declare-fun b_and!31247 () Bool)

(assert (=> start!83770 (= tp!68178 b_and!31247)))

(declare-fun b!978237 () Bool)

(declare-fun res!654662 () Bool)

(declare-fun e!551524 () Bool)

(assert (=> b!978237 (=> (not res!654662) (not e!551524))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61173 0))(
  ( (array!61174 (arr!29444 (Array (_ BitVec 32) (_ BitVec 64))) (size!29923 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61173)

(assert (=> b!978237 (= res!654662 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29923 _keys!1544))))))

(declare-fun b!978238 () Bool)

(declare-fun res!654661 () Bool)

(assert (=> b!978238 (=> (not res!654661) (not e!551524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978238 (= res!654661 (validKeyInArray!0 (select (arr!29444 _keys!1544) from!1932)))))

(declare-fun b!978239 () Bool)

(declare-fun e!551523 () Bool)

(declare-fun tp_is_empty!22573 () Bool)

(assert (=> b!978239 (= e!551523 tp_is_empty!22573)))

(declare-fun b!978240 () Bool)

(declare-fun res!654665 () Bool)

(assert (=> b!978240 (=> (not res!654665) (not e!551524))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61173 (_ BitVec 32)) Bool)

(assert (=> b!978240 (= res!654665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!35888 () Bool)

(declare-fun mapRes!35888 () Bool)

(assert (=> mapIsEmpty!35888 mapRes!35888))

(declare-fun b!978241 () Bool)

(declare-fun e!551522 () Bool)

(assert (=> b!978241 (= e!551522 tp_is_empty!22573)))

(declare-fun b!978242 () Bool)

(declare-fun res!654660 () Bool)

(assert (=> b!978242 (=> (not res!654660) (not e!551524))))

(declare-datatypes ((V!35081 0))(
  ( (V!35082 (val!11337 Int)) )
))
(declare-datatypes ((ValueCell!10805 0))(
  ( (ValueCellFull!10805 (v!13899 V!35081)) (EmptyCell!10805) )
))
(declare-datatypes ((array!61175 0))(
  ( (array!61176 (arr!29445 (Array (_ BitVec 32) ValueCell!10805)) (size!29924 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61175)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978242 (= res!654660 (and (= (size!29924 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29923 _keys!1544) (size!29924 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!654664 () Bool)

(assert (=> start!83770 (=> (not res!654664) (not e!551524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83770 (= res!654664 (validMask!0 mask!1948))))

(assert (=> start!83770 e!551524))

(assert (=> start!83770 true))

(assert (=> start!83770 tp_is_empty!22573))

(declare-fun e!551526 () Bool)

(declare-fun array_inv!22761 (array!61175) Bool)

(assert (=> start!83770 (and (array_inv!22761 _values!1278) e!551526)))

(assert (=> start!83770 tp!68178))

(declare-fun array_inv!22762 (array!61173) Bool)

(assert (=> start!83770 (array_inv!22762 _keys!1544)))

(declare-fun b!978243 () Bool)

(assert (=> b!978243 (= e!551524 (not true))))

(declare-datatypes ((tuple2!14534 0))(
  ( (tuple2!14535 (_1!7278 (_ BitVec 64)) (_2!7278 V!35081)) )
))
(declare-datatypes ((List!20406 0))(
  ( (Nil!20403) (Cons!20402 (h!21564 tuple2!14534) (t!28941 List!20406)) )
))
(declare-datatypes ((ListLongMap!13231 0))(
  ( (ListLongMap!13232 (toList!6631 List!20406)) )
))
(declare-fun lt!433679 () ListLongMap!13231)

(declare-fun lt!433676 () tuple2!14534)

(declare-fun lt!433677 () tuple2!14534)

(declare-fun +!2936 (ListLongMap!13231 tuple2!14534) ListLongMap!13231)

(assert (=> b!978243 (= (+!2936 (+!2936 lt!433679 lt!433676) lt!433677) (+!2936 (+!2936 lt!433679 lt!433677) lt!433676))))

(declare-fun lt!433678 () V!35081)

(assert (=> b!978243 (= lt!433677 (tuple2!14535 (select (arr!29444 _keys!1544) from!1932) lt!433678))))

(declare-fun minValue!1220 () V!35081)

(assert (=> b!978243 (= lt!433676 (tuple2!14535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32511 0))(
  ( (Unit!32512) )
))
(declare-fun lt!433675 () Unit!32511)

(declare-fun addCommutativeForDiffKeys!564 (ListLongMap!13231 (_ BitVec 64) V!35081 (_ BitVec 64) V!35081) Unit!32511)

(assert (=> b!978243 (= lt!433675 (addCommutativeForDiffKeys!564 lt!433679 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29444 _keys!1544) from!1932) lt!433678))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15243 (ValueCell!10805 V!35081) V!35081)

(declare-fun dynLambda!1724 (Int (_ BitVec 64)) V!35081)

(assert (=> b!978243 (= lt!433678 (get!15243 (select (arr!29445 _values!1278) from!1932) (dynLambda!1724 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35081)

(declare-fun getCurrentListMapNoExtraKeys!3338 (array!61173 array!61175 (_ BitVec 32) (_ BitVec 32) V!35081 V!35081 (_ BitVec 32) Int) ListLongMap!13231)

(assert (=> b!978243 (= lt!433679 (+!2936 (getCurrentListMapNoExtraKeys!3338 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapNonEmpty!35888 () Bool)

(declare-fun tp!68179 () Bool)

(assert (=> mapNonEmpty!35888 (= mapRes!35888 (and tp!68179 e!551523))))

(declare-fun mapRest!35888 () (Array (_ BitVec 32) ValueCell!10805))

(declare-fun mapKey!35888 () (_ BitVec 32))

(declare-fun mapValue!35888 () ValueCell!10805)

(assert (=> mapNonEmpty!35888 (= (arr!29445 _values!1278) (store mapRest!35888 mapKey!35888 mapValue!35888))))

(declare-fun b!978244 () Bool)

(declare-fun res!654663 () Bool)

(assert (=> b!978244 (=> (not res!654663) (not e!551524))))

(assert (=> b!978244 (= res!654663 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978245 () Bool)

(declare-fun res!654659 () Bool)

(assert (=> b!978245 (=> (not res!654659) (not e!551524))))

(declare-datatypes ((List!20407 0))(
  ( (Nil!20404) (Cons!20403 (h!21565 (_ BitVec 64)) (t!28942 List!20407)) )
))
(declare-fun arrayNoDuplicates!0 (array!61173 (_ BitVec 32) List!20407) Bool)

(assert (=> b!978245 (= res!654659 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20404))))

(declare-fun b!978246 () Bool)

(assert (=> b!978246 (= e!551526 (and e!551522 mapRes!35888))))

(declare-fun condMapEmpty!35888 () Bool)

(declare-fun mapDefault!35888 () ValueCell!10805)

