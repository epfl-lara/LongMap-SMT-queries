; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84194 () Bool)

(assert start!84194)

(declare-fun b_free!19895 () Bool)

(declare-fun b_next!19895 () Bool)

(assert (=> start!84194 (= b_free!19895 (not b_next!19895))))

(declare-fun tp!69289 () Bool)

(declare-fun b_and!31867 () Bool)

(assert (=> start!84194 (= tp!69289 b_and!31867)))

(declare-fun b!984702 () Bool)

(declare-fun res!658919 () Bool)

(declare-fun e!555099 () Bool)

(assert (=> b!984702 (=> (not res!658919) (not e!555099))))

(declare-datatypes ((array!61973 0))(
  ( (array!61974 (arr!29844 (Array (_ BitVec 32) (_ BitVec 64))) (size!30323 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61973)

(declare-datatypes ((List!20664 0))(
  ( (Nil!20661) (Cons!20660 (h!21822 (_ BitVec 64)) (t!29503 List!20664)) )
))
(declare-fun arrayNoDuplicates!0 (array!61973 (_ BitVec 32) List!20664) Bool)

(assert (=> b!984702 (= res!658919 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20661))))

(declare-fun mapIsEmpty!36524 () Bool)

(declare-fun mapRes!36524 () Bool)

(assert (=> mapIsEmpty!36524 mapRes!36524))

(declare-fun b!984703 () Bool)

(declare-fun e!555098 () Bool)

(declare-fun tp_is_empty!22997 () Bool)

(assert (=> b!984703 (= e!555098 tp_is_empty!22997)))

(declare-fun b!984705 () Bool)

(declare-fun e!555097 () Bool)

(assert (=> b!984705 (= e!555099 e!555097)))

(declare-fun res!658917 () Bool)

(assert (=> b!984705 (=> (not res!658917) (not e!555097))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984705 (= res!658917 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29844 _keys!1544) from!1932))))))

(declare-datatypes ((V!35645 0))(
  ( (V!35646 (val!11549 Int)) )
))
(declare-datatypes ((ValueCell!11017 0))(
  ( (ValueCellFull!11017 (v!14111 V!35645)) (EmptyCell!11017) )
))
(declare-datatypes ((array!61975 0))(
  ( (array!61976 (arr!29845 (Array (_ BitVec 32) ValueCell!11017)) (size!30324 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61975)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436930 () V!35645)

(declare-fun get!15482 (ValueCell!11017 V!35645) V!35645)

(declare-fun dynLambda!1823 (Int (_ BitVec 64)) V!35645)

(assert (=> b!984705 (= lt!436930 (get!15482 (select (arr!29845 _values!1278) from!1932) (dynLambda!1823 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35645)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35645)

(declare-datatypes ((tuple2!14772 0))(
  ( (tuple2!14773 (_1!7397 (_ BitVec 64)) (_2!7397 V!35645)) )
))
(declare-datatypes ((List!20665 0))(
  ( (Nil!20662) (Cons!20661 (h!21823 tuple2!14772) (t!29504 List!20665)) )
))
(declare-datatypes ((ListLongMap!13469 0))(
  ( (ListLongMap!13470 (toList!6750 List!20665)) )
))
(declare-fun lt!436928 () ListLongMap!13469)

(declare-fun getCurrentListMapNoExtraKeys!3443 (array!61973 array!61975 (_ BitVec 32) (_ BitVec 32) V!35645 V!35645 (_ BitVec 32) Int) ListLongMap!13469)

(assert (=> b!984705 (= lt!436928 (getCurrentListMapNoExtraKeys!3443 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984706 () Bool)

(declare-fun res!658915 () Bool)

(assert (=> b!984706 (=> (not res!658915) (not e!555099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984706 (= res!658915 (validKeyInArray!0 (select (arr!29844 _keys!1544) from!1932)))))

(declare-fun b!984707 () Bool)

(declare-fun e!555101 () Bool)

(assert (=> b!984707 (= e!555101 tp_is_empty!22997)))

(declare-fun b!984708 () Bool)

(declare-fun res!658914 () Bool)

(assert (=> b!984708 (=> (not res!658914) (not e!555099))))

(assert (=> b!984708 (= res!658914 (and (= (size!30324 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30323 _keys!1544) (size!30324 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984709 () Bool)

(declare-fun res!658912 () Bool)

(assert (=> b!984709 (=> (not res!658912) (not e!555099))))

(assert (=> b!984709 (= res!658912 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30323 _keys!1544))))))

(declare-fun res!658918 () Bool)

(assert (=> start!84194 (=> (not res!658918) (not e!555099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84194 (= res!658918 (validMask!0 mask!1948))))

(assert (=> start!84194 e!555099))

(assert (=> start!84194 true))

(assert (=> start!84194 tp_is_empty!22997))

(declare-fun e!555102 () Bool)

(declare-fun array_inv!23071 (array!61975) Bool)

(assert (=> start!84194 (and (array_inv!23071 _values!1278) e!555102)))

(assert (=> start!84194 tp!69289))

(declare-fun array_inv!23072 (array!61973) Bool)

(assert (=> start!84194 (array_inv!23072 _keys!1544)))

(declare-fun b!984704 () Bool)

(declare-fun res!658913 () Bool)

(assert (=> b!984704 (=> (not res!658913) (not e!555099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61973 (_ BitVec 32)) Bool)

(assert (=> b!984704 (= res!658913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36524 () Bool)

(declare-fun tp!69288 () Bool)

(assert (=> mapNonEmpty!36524 (= mapRes!36524 (and tp!69288 e!555101))))

(declare-fun mapKey!36524 () (_ BitVec 32))

(declare-fun mapRest!36524 () (Array (_ BitVec 32) ValueCell!11017))

(declare-fun mapValue!36524 () ValueCell!11017)

(assert (=> mapNonEmpty!36524 (= (arr!29845 _values!1278) (store mapRest!36524 mapKey!36524 mapValue!36524))))

(declare-fun b!984710 () Bool)

(declare-fun res!658916 () Bool)

(assert (=> b!984710 (=> (not res!658916) (not e!555099))))

(assert (=> b!984710 (= res!658916 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984711 () Bool)

(assert (=> b!984711 (= e!555097 (not true))))

(declare-fun lt!436931 () tuple2!14772)

(declare-fun lt!436927 () tuple2!14772)

(declare-fun +!3041 (ListLongMap!13469 tuple2!14772) ListLongMap!13469)

(assert (=> b!984711 (= (+!3041 (+!3041 lt!436928 lt!436931) lt!436927) (+!3041 (+!3041 lt!436928 lt!436927) lt!436931))))

(assert (=> b!984711 (= lt!436927 (tuple2!14773 (select (arr!29844 _keys!1544) from!1932) lt!436930))))

(assert (=> b!984711 (= lt!436931 (tuple2!14773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32721 0))(
  ( (Unit!32722) )
))
(declare-fun lt!436929 () Unit!32721)

(declare-fun addCommutativeForDiffKeys!669 (ListLongMap!13469 (_ BitVec 64) V!35645 (_ BitVec 64) V!35645) Unit!32721)

(assert (=> b!984711 (= lt!436929 (addCommutativeForDiffKeys!669 lt!436928 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29844 _keys!1544) from!1932) lt!436930))))

(declare-fun b!984712 () Bool)

(assert (=> b!984712 (= e!555102 (and e!555098 mapRes!36524))))

(declare-fun condMapEmpty!36524 () Bool)

(declare-fun mapDefault!36524 () ValueCell!11017)

