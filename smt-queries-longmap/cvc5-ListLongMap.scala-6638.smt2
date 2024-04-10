; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83800 () Bool)

(assert start!83800)

(declare-fun b_free!19609 () Bool)

(declare-fun b_next!19609 () Bool)

(assert (=> start!83800 (= b_free!19609 (not b_next!19609))))

(declare-fun tp!68269 () Bool)

(declare-fun b_and!31307 () Bool)

(assert (=> start!83800 (= tp!68269 b_and!31307)))

(declare-fun res!654980 () Bool)

(declare-fun e!551747 () Bool)

(assert (=> start!83800 (=> (not res!654980) (not e!551747))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83800 (= res!654980 (validMask!0 mask!1948))))

(assert (=> start!83800 e!551747))

(assert (=> start!83800 true))

(declare-fun tp_is_empty!22603 () Bool)

(assert (=> start!83800 tp_is_empty!22603))

(declare-datatypes ((V!35121 0))(
  ( (V!35122 (val!11352 Int)) )
))
(declare-datatypes ((ValueCell!10820 0))(
  ( (ValueCellFull!10820 (v!13914 V!35121)) (EmptyCell!10820) )
))
(declare-datatypes ((array!61231 0))(
  ( (array!61232 (arr!29473 (Array (_ BitVec 32) ValueCell!10820)) (size!29952 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61231)

(declare-fun e!551749 () Bool)

(declare-fun array_inv!22785 (array!61231) Bool)

(assert (=> start!83800 (and (array_inv!22785 _values!1278) e!551749)))

(assert (=> start!83800 tp!68269))

(declare-datatypes ((array!61233 0))(
  ( (array!61234 (arr!29474 (Array (_ BitVec 32) (_ BitVec 64))) (size!29953 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61233)

(declare-fun array_inv!22786 (array!61233) Bool)

(assert (=> start!83800 (array_inv!22786 _keys!1544)))

(declare-fun b!978717 () Bool)

(declare-fun res!654974 () Bool)

(assert (=> b!978717 (=> (not res!654974) (not e!551747))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!978717 (= res!654974 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29953 _keys!1544))))))

(declare-fun b!978718 () Bool)

(declare-fun e!551751 () Bool)

(assert (=> b!978718 (= e!551751 tp_is_empty!22603)))

(declare-fun b!978719 () Bool)

(declare-fun res!654975 () Bool)

(assert (=> b!978719 (=> (not res!654975) (not e!551747))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978719 (= res!654975 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978720 () Bool)

(declare-fun res!654978 () Bool)

(assert (=> b!978720 (=> (not res!654978) (not e!551747))))

(assert (=> b!978720 (= res!654978 (and (= (size!29952 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29953 _keys!1544) (size!29952 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978721 () Bool)

(declare-fun e!551750 () Bool)

(assert (=> b!978721 (= e!551750 tp_is_empty!22603)))

(declare-fun b!978722 () Bool)

(declare-fun res!654977 () Bool)

(assert (=> b!978722 (=> (not res!654977) (not e!551747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61233 (_ BitVec 32)) Bool)

(assert (=> b!978722 (= res!654977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978723 () Bool)

(declare-fun res!654979 () Bool)

(assert (=> b!978723 (=> (not res!654979) (not e!551747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978723 (= res!654979 (validKeyInArray!0 (select (arr!29474 _keys!1544) from!1932)))))

(declare-fun b!978724 () Bool)

(assert (=> b!978724 (= e!551747 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14560 0))(
  ( (tuple2!14561 (_1!7291 (_ BitVec 64)) (_2!7291 V!35121)) )
))
(declare-datatypes ((List!20431 0))(
  ( (Nil!20428) (Cons!20427 (h!21589 tuple2!14560) (t!28996 List!20431)) )
))
(declare-datatypes ((ListLongMap!13257 0))(
  ( (ListLongMap!13258 (toList!6644 List!20431)) )
))
(declare-fun lt!433904 () ListLongMap!13257)

(declare-fun lt!433903 () tuple2!14560)

(declare-fun lt!433901 () tuple2!14560)

(declare-fun +!2949 (ListLongMap!13257 tuple2!14560) ListLongMap!13257)

(assert (=> b!978724 (= (+!2949 (+!2949 lt!433904 lt!433903) lt!433901) (+!2949 (+!2949 lt!433904 lt!433901) lt!433903))))

(declare-fun lt!433902 () V!35121)

(assert (=> b!978724 (= lt!433901 (tuple2!14561 (select (arr!29474 _keys!1544) from!1932) lt!433902))))

(declare-fun minValue!1220 () V!35121)

(assert (=> b!978724 (= lt!433903 (tuple2!14561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32537 0))(
  ( (Unit!32538) )
))
(declare-fun lt!433900 () Unit!32537)

(declare-fun addCommutativeForDiffKeys!577 (ListLongMap!13257 (_ BitVec 64) V!35121 (_ BitVec 64) V!35121) Unit!32537)

(assert (=> b!978724 (= lt!433900 (addCommutativeForDiffKeys!577 lt!433904 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29474 _keys!1544) from!1932) lt!433902))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15266 (ValueCell!10820 V!35121) V!35121)

(declare-fun dynLambda!1737 (Int (_ BitVec 64)) V!35121)

(assert (=> b!978724 (= lt!433902 (get!15266 (select (arr!29473 _values!1278) from!1932) (dynLambda!1737 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35121)

(declare-fun getCurrentListMapNoExtraKeys!3351 (array!61233 array!61231 (_ BitVec 32) (_ BitVec 32) V!35121 V!35121 (_ BitVec 32) Int) ListLongMap!13257)

(assert (=> b!978724 (= lt!433904 (+!2949 (getCurrentListMapNoExtraKeys!3351 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapNonEmpty!35933 () Bool)

(declare-fun mapRes!35933 () Bool)

(declare-fun tp!68268 () Bool)

(assert (=> mapNonEmpty!35933 (= mapRes!35933 (and tp!68268 e!551750))))

(declare-fun mapRest!35933 () (Array (_ BitVec 32) ValueCell!10820))

(declare-fun mapValue!35933 () ValueCell!10820)

(declare-fun mapKey!35933 () (_ BitVec 32))

(assert (=> mapNonEmpty!35933 (= (arr!29473 _values!1278) (store mapRest!35933 mapKey!35933 mapValue!35933))))

(declare-fun b!978725 () Bool)

(assert (=> b!978725 (= e!551749 (and e!551751 mapRes!35933))))

(declare-fun condMapEmpty!35933 () Bool)

(declare-fun mapDefault!35933 () ValueCell!10820)

