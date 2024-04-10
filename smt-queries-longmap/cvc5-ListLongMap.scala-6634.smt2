; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83776 () Bool)

(assert start!83776)

(declare-fun b_free!19585 () Bool)

(declare-fun b_next!19585 () Bool)

(assert (=> start!83776 (= b_free!19585 (not b_next!19585))))

(declare-fun tp!68197 () Bool)

(declare-fun b_and!31259 () Bool)

(assert (=> start!83776 (= tp!68197 b_and!31259)))

(declare-fun mapNonEmpty!35897 () Bool)

(declare-fun mapRes!35897 () Bool)

(declare-fun tp!68196 () Bool)

(declare-fun e!551571 () Bool)

(assert (=> mapNonEmpty!35897 (= mapRes!35897 (and tp!68196 e!551571))))

(declare-datatypes ((V!35089 0))(
  ( (V!35090 (val!11340 Int)) )
))
(declare-datatypes ((ValueCell!10808 0))(
  ( (ValueCellFull!10808 (v!13902 V!35089)) (EmptyCell!10808) )
))
(declare-datatypes ((array!61185 0))(
  ( (array!61186 (arr!29450 (Array (_ BitVec 32) ValueCell!10808)) (size!29929 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61185)

(declare-fun mapRest!35897 () (Array (_ BitVec 32) ValueCell!10808))

(declare-fun mapValue!35897 () ValueCell!10808)

(declare-fun mapKey!35897 () (_ BitVec 32))

(assert (=> mapNonEmpty!35897 (= (arr!29450 _values!1278) (store mapRest!35897 mapKey!35897 mapValue!35897))))

(declare-fun b!978333 () Bool)

(declare-fun res!654728 () Bool)

(declare-fun e!551569 () Bool)

(assert (=> b!978333 (=> (not res!654728) (not e!551569))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61187 0))(
  ( (array!61188 (arr!29451 (Array (_ BitVec 32) (_ BitVec 64))) (size!29930 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61187)

(assert (=> b!978333 (= res!654728 (and (= (size!29929 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29930 _keys!1544) (size!29929 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978334 () Bool)

(declare-fun res!654726 () Bool)

(assert (=> b!978334 (=> (not res!654726) (not e!551569))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!978334 (= res!654726 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29930 _keys!1544))))))

(declare-fun res!654725 () Bool)

(assert (=> start!83776 (=> (not res!654725) (not e!551569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83776 (= res!654725 (validMask!0 mask!1948))))

(assert (=> start!83776 e!551569))

(assert (=> start!83776 true))

(declare-fun tp_is_empty!22579 () Bool)

(assert (=> start!83776 tp_is_empty!22579))

(declare-fun e!551568 () Bool)

(declare-fun array_inv!22767 (array!61185) Bool)

(assert (=> start!83776 (and (array_inv!22767 _values!1278) e!551568)))

(assert (=> start!83776 tp!68197))

(declare-fun array_inv!22768 (array!61187) Bool)

(assert (=> start!83776 (array_inv!22768 _keys!1544)))

(declare-fun b!978335 () Bool)

(assert (=> b!978335 (= e!551571 tp_is_empty!22579)))

(declare-fun b!978336 () Bool)

(declare-fun res!654722 () Bool)

(assert (=> b!978336 (=> (not res!654722) (not e!551569))))

(assert (=> b!978336 (= res!654722 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978337 () Bool)

(declare-fun res!654727 () Bool)

(assert (=> b!978337 (=> (not res!654727) (not e!551569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978337 (= res!654727 (validKeyInArray!0 (select (arr!29451 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!35897 () Bool)

(assert (=> mapIsEmpty!35897 mapRes!35897))

(declare-fun b!978338 () Bool)

(assert (=> b!978338 (= e!551569 (not true))))

(declare-datatypes ((tuple2!14540 0))(
  ( (tuple2!14541 (_1!7281 (_ BitVec 64)) (_2!7281 V!35089)) )
))
(declare-datatypes ((List!20412 0))(
  ( (Nil!20409) (Cons!20408 (h!21570 tuple2!14540) (t!28953 List!20412)) )
))
(declare-datatypes ((ListLongMap!13237 0))(
  ( (ListLongMap!13238 (toList!6634 List!20412)) )
))
(declare-fun lt!433724 () ListLongMap!13237)

(declare-fun lt!433720 () tuple2!14540)

(declare-fun lt!433722 () tuple2!14540)

(declare-fun +!2939 (ListLongMap!13237 tuple2!14540) ListLongMap!13237)

(assert (=> b!978338 (= (+!2939 (+!2939 lt!433724 lt!433720) lt!433722) (+!2939 (+!2939 lt!433724 lt!433722) lt!433720))))

(declare-fun lt!433721 () V!35089)

(assert (=> b!978338 (= lt!433722 (tuple2!14541 (select (arr!29451 _keys!1544) from!1932) lt!433721))))

(declare-fun minValue!1220 () V!35089)

(assert (=> b!978338 (= lt!433720 (tuple2!14541 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32517 0))(
  ( (Unit!32518) )
))
(declare-fun lt!433723 () Unit!32517)

(declare-fun addCommutativeForDiffKeys!567 (ListLongMap!13237 (_ BitVec 64) V!35089 (_ BitVec 64) V!35089) Unit!32517)

(assert (=> b!978338 (= lt!433723 (addCommutativeForDiffKeys!567 lt!433724 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29451 _keys!1544) from!1932) lt!433721))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15248 (ValueCell!10808 V!35089) V!35089)

(declare-fun dynLambda!1727 (Int (_ BitVec 64)) V!35089)

(assert (=> b!978338 (= lt!433721 (get!15248 (select (arr!29450 _values!1278) from!1932) (dynLambda!1727 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35089)

(declare-fun getCurrentListMapNoExtraKeys!3341 (array!61187 array!61185 (_ BitVec 32) (_ BitVec 32) V!35089 V!35089 (_ BitVec 32) Int) ListLongMap!13237)

(assert (=> b!978338 (= lt!433724 (+!2939 (getCurrentListMapNoExtraKeys!3341 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978339 () Bool)

(declare-fun res!654724 () Bool)

(assert (=> b!978339 (=> (not res!654724) (not e!551569))))

(declare-datatypes ((List!20413 0))(
  ( (Nil!20410) (Cons!20409 (h!21571 (_ BitVec 64)) (t!28954 List!20413)) )
))
(declare-fun arrayNoDuplicates!0 (array!61187 (_ BitVec 32) List!20413) Bool)

(assert (=> b!978339 (= res!654724 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20410))))

(declare-fun b!978340 () Bool)

(declare-fun res!654723 () Bool)

(assert (=> b!978340 (=> (not res!654723) (not e!551569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61187 (_ BitVec 32)) Bool)

(assert (=> b!978340 (= res!654723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978341 () Bool)

(declare-fun e!551567 () Bool)

(assert (=> b!978341 (= e!551567 tp_is_empty!22579)))

(declare-fun b!978342 () Bool)

(assert (=> b!978342 (= e!551568 (and e!551567 mapRes!35897))))

(declare-fun condMapEmpty!35897 () Bool)

(declare-fun mapDefault!35897 () ValueCell!10808)

