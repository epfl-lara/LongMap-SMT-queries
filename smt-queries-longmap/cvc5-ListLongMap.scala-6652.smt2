; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83884 () Bool)

(assert start!83884)

(declare-fun b_free!19693 () Bool)

(declare-fun b_next!19693 () Bool)

(assert (=> start!83884 (= b_free!19693 (not b_next!19693))))

(declare-fun tp!68520 () Bool)

(declare-fun b_and!31475 () Bool)

(assert (=> start!83884 (= tp!68520 b_and!31475)))

(declare-fun mapNonEmpty!36059 () Bool)

(declare-fun mapRes!36059 () Bool)

(declare-fun tp!68521 () Bool)

(declare-fun e!552487 () Bool)

(assert (=> mapNonEmpty!36059 (= mapRes!36059 (and tp!68521 e!552487))))

(declare-datatypes ((V!35233 0))(
  ( (V!35234 (val!11394 Int)) )
))
(declare-datatypes ((ValueCell!10862 0))(
  ( (ValueCellFull!10862 (v!13956 V!35233)) (EmptyCell!10862) )
))
(declare-datatypes ((array!61383 0))(
  ( (array!61384 (arr!29549 (Array (_ BitVec 32) ValueCell!10862)) (size!30028 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61383)

(declare-fun mapRest!36059 () (Array (_ BitVec 32) ValueCell!10862))

(declare-fun mapValue!36059 () ValueCell!10862)

(declare-fun mapKey!36059 () (_ BitVec 32))

(assert (=> mapNonEmpty!36059 (= (arr!29549 _values!1278) (store mapRest!36059 mapKey!36059 mapValue!36059))))

(declare-fun b!980171 () Bool)

(declare-fun e!552490 () Bool)

(declare-fun tp_is_empty!22687 () Bool)

(assert (=> b!980171 (= e!552490 tp_is_empty!22687)))

(declare-fun b!980172 () Bool)

(assert (=> b!980172 (= e!552487 tp_is_empty!22687)))

(declare-fun b!980174 () Bool)

(declare-fun res!655973 () Bool)

(declare-fun e!552491 () Bool)

(assert (=> b!980174 (=> (not res!655973) (not e!552491))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980174 (= res!655973 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980175 () Bool)

(declare-fun res!655966 () Bool)

(assert (=> b!980175 (=> (not res!655966) (not e!552491))))

(declare-datatypes ((array!61385 0))(
  ( (array!61386 (arr!29550 (Array (_ BitVec 32) (_ BitVec 64))) (size!30029 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61385)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61385 (_ BitVec 32)) Bool)

(assert (=> b!980175 (= res!655966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980176 () Bool)

(declare-fun res!655970 () Bool)

(assert (=> b!980176 (=> (not res!655970) (not e!552491))))

(assert (=> b!980176 (= res!655970 (and (= (size!30028 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30029 _keys!1544) (size!30028 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980177 () Bool)

(declare-fun res!655972 () Bool)

(assert (=> b!980177 (=> (not res!655972) (not e!552491))))

(declare-datatypes ((List!20481 0))(
  ( (Nil!20478) (Cons!20477 (h!21639 (_ BitVec 64)) (t!29130 List!20481)) )
))
(declare-fun arrayNoDuplicates!0 (array!61385 (_ BitVec 32) List!20481) Bool)

(assert (=> b!980177 (= res!655972 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20478))))

(declare-fun mapIsEmpty!36059 () Bool)

(assert (=> mapIsEmpty!36059 mapRes!36059))

(declare-fun b!980178 () Bool)

(declare-fun e!552489 () Bool)

(assert (=> b!980178 (= e!552491 (not e!552489))))

(declare-fun res!655967 () Bool)

(assert (=> b!980178 (=> res!655967 e!552489)))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980178 (= res!655967 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29550 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14614 0))(
  ( (tuple2!14615 (_1!7318 (_ BitVec 64)) (_2!7318 V!35233)) )
))
(declare-datatypes ((List!20482 0))(
  ( (Nil!20479) (Cons!20478 (h!21640 tuple2!14614) (t!29131 List!20482)) )
))
(declare-datatypes ((ListLongMap!13311 0))(
  ( (ListLongMap!13312 (toList!6671 List!20482)) )
))
(declare-fun lt!435083 () ListLongMap!13311)

(declare-fun lt!435087 () ListLongMap!13311)

(declare-fun lt!435081 () tuple2!14614)

(declare-fun lt!435086 () tuple2!14614)

(declare-fun +!2976 (ListLongMap!13311 tuple2!14614) ListLongMap!13311)

(assert (=> b!980178 (= (+!2976 lt!435083 lt!435081) (+!2976 lt!435087 lt!435086))))

(declare-fun lt!435084 () ListLongMap!13311)

(assert (=> b!980178 (= lt!435087 (+!2976 lt!435084 lt!435081))))

(declare-fun lt!435088 () V!35233)

(assert (=> b!980178 (= lt!435081 (tuple2!14615 (select (arr!29550 _keys!1544) from!1932) lt!435088))))

(assert (=> b!980178 (= lt!435083 (+!2976 lt!435084 lt!435086))))

(declare-fun minValue!1220 () V!35233)

(assert (=> b!980178 (= lt!435086 (tuple2!14615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32591 0))(
  ( (Unit!32592) )
))
(declare-fun lt!435085 () Unit!32591)

(declare-fun addCommutativeForDiffKeys!604 (ListLongMap!13311 (_ BitVec 64) V!35233 (_ BitVec 64) V!35233) Unit!32591)

(assert (=> b!980178 (= lt!435085 (addCommutativeForDiffKeys!604 lt!435084 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29550 _keys!1544) from!1932) lt!435088))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15319 (ValueCell!10862 V!35233) V!35233)

(declare-fun dynLambda!1762 (Int (_ BitVec 64)) V!35233)

(assert (=> b!980178 (= lt!435088 (get!15319 (select (arr!29549 _values!1278) from!1932) (dynLambda!1762 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!435089 () ListLongMap!13311)

(declare-fun lt!435082 () tuple2!14614)

(assert (=> b!980178 (= lt!435084 (+!2976 lt!435089 lt!435082))))

(declare-fun zeroValue!1220 () V!35233)

(assert (=> b!980178 (= lt!435082 (tuple2!14615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3376 (array!61385 array!61383 (_ BitVec 32) (_ BitVec 32) V!35233 V!35233 (_ BitVec 32) Int) ListLongMap!13311)

(assert (=> b!980178 (= lt!435089 (getCurrentListMapNoExtraKeys!3376 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!980179 () Bool)

(assert (=> b!980179 (= e!552489 true)))

(assert (=> b!980179 (= lt!435087 (+!2976 (+!2976 lt!435089 lt!435081) lt!435082))))

(declare-fun lt!435080 () Unit!32591)

(assert (=> b!980179 (= lt!435080 (addCommutativeForDiffKeys!604 lt!435089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29550 _keys!1544) from!1932) lt!435088))))

(declare-fun b!980173 () Bool)

(declare-fun res!655971 () Bool)

(assert (=> b!980173 (=> (not res!655971) (not e!552491))))

(assert (=> b!980173 (= res!655971 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30029 _keys!1544))))))

(declare-fun res!655969 () Bool)

(assert (=> start!83884 (=> (not res!655969) (not e!552491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83884 (= res!655969 (validMask!0 mask!1948))))

(assert (=> start!83884 e!552491))

(assert (=> start!83884 true))

(assert (=> start!83884 tp_is_empty!22687))

(declare-fun e!552492 () Bool)

(declare-fun array_inv!22845 (array!61383) Bool)

(assert (=> start!83884 (and (array_inv!22845 _values!1278) e!552492)))

(assert (=> start!83884 tp!68520))

(declare-fun array_inv!22846 (array!61385) Bool)

(assert (=> start!83884 (array_inv!22846 _keys!1544)))

(declare-fun b!980180 () Bool)

(declare-fun res!655968 () Bool)

(assert (=> b!980180 (=> (not res!655968) (not e!552491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980180 (= res!655968 (validKeyInArray!0 (select (arr!29550 _keys!1544) from!1932)))))

(declare-fun b!980181 () Bool)

(assert (=> b!980181 (= e!552492 (and e!552490 mapRes!36059))))

(declare-fun condMapEmpty!36059 () Bool)

(declare-fun mapDefault!36059 () ValueCell!10862)

