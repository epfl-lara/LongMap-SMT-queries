; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83822 () Bool)

(assert start!83822)

(declare-fun b_free!19631 () Bool)

(declare-fun b_next!19631 () Bool)

(assert (=> start!83822 (= b_free!19631 (not b_next!19631))))

(declare-fun tp!68334 () Bool)

(declare-fun b_and!31351 () Bool)

(assert (=> start!83822 (= tp!68334 b_and!31351)))

(declare-fun b!979086 () Bool)

(declare-fun e!551930 () Bool)

(assert (=> b!979086 (= e!551930 true)))

(declare-datatypes ((V!35149 0))(
  ( (V!35150 (val!11363 Int)) )
))
(declare-datatypes ((tuple2!14576 0))(
  ( (tuple2!14577 (_1!7299 (_ BitVec 64)) (_2!7299 V!35149)) )
))
(declare-fun lt!434155 () tuple2!14576)

(declare-fun lt!434157 () tuple2!14576)

(declare-datatypes ((List!20446 0))(
  ( (Nil!20443) (Cons!20442 (h!21604 tuple2!14576) (t!29033 List!20446)) )
))
(declare-datatypes ((ListLongMap!13273 0))(
  ( (ListLongMap!13274 (toList!6652 List!20446)) )
))
(declare-fun lt!434159 () ListLongMap!13273)

(declare-fun lt!434153 () ListLongMap!13273)

(declare-fun +!2957 (ListLongMap!13273 tuple2!14576) ListLongMap!13273)

(assert (=> b!979086 (= lt!434153 (+!2957 (+!2957 lt!434159 lt!434157) lt!434155))))

(declare-fun zeroValue!1220 () V!35149)

(declare-datatypes ((Unit!32553 0))(
  ( (Unit!32554) )
))
(declare-fun lt!434156 () Unit!32553)

(declare-datatypes ((array!61271 0))(
  ( (array!61272 (arr!29493 (Array (_ BitVec 32) (_ BitVec 64))) (size!29972 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61271)

(declare-fun lt!434151 () V!35149)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!585 (ListLongMap!13273 (_ BitVec 64) V!35149 (_ BitVec 64) V!35149) Unit!32553)

(assert (=> b!979086 (= lt!434156 (addCommutativeForDiffKeys!585 lt!434159 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29493 _keys!1544) from!1932) lt!434151))))

(declare-fun b!979087 () Bool)

(declare-fun res!655223 () Bool)

(declare-fun e!551931 () Bool)

(assert (=> b!979087 (=> (not res!655223) (not e!551931))))

(assert (=> b!979087 (= res!655223 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29972 _keys!1544))))))

(declare-fun b!979088 () Bool)

(declare-fun e!551934 () Bool)

(declare-fun tp_is_empty!22625 () Bool)

(assert (=> b!979088 (= e!551934 tp_is_empty!22625)))

(declare-fun b!979089 () Bool)

(declare-fun e!551932 () Bool)

(assert (=> b!979089 (= e!551932 tp_is_empty!22625)))

(declare-fun res!655222 () Bool)

(assert (=> start!83822 (=> (not res!655222) (not e!551931))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83822 (= res!655222 (validMask!0 mask!1948))))

(assert (=> start!83822 e!551931))

(assert (=> start!83822 true))

(assert (=> start!83822 tp_is_empty!22625))

(declare-datatypes ((ValueCell!10831 0))(
  ( (ValueCellFull!10831 (v!13925 V!35149)) (EmptyCell!10831) )
))
(declare-datatypes ((array!61273 0))(
  ( (array!61274 (arr!29494 (Array (_ BitVec 32) ValueCell!10831)) (size!29973 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61273)

(declare-fun e!551929 () Bool)

(declare-fun array_inv!22803 (array!61273) Bool)

(assert (=> start!83822 (and (array_inv!22803 _values!1278) e!551929)))

(assert (=> start!83822 tp!68334))

(declare-fun array_inv!22804 (array!61271) Bool)

(assert (=> start!83822 (array_inv!22804 _keys!1544)))

(declare-fun b!979090 () Bool)

(declare-fun res!655229 () Bool)

(assert (=> b!979090 (=> (not res!655229) (not e!551931))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979090 (= res!655229 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!979091 () Bool)

(declare-fun res!655225 () Bool)

(assert (=> b!979091 (=> (not res!655225) (not e!551931))))

(assert (=> b!979091 (= res!655225 (and (= (size!29973 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29972 _keys!1544) (size!29973 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979092 () Bool)

(declare-fun res!655226 () Bool)

(assert (=> b!979092 (=> (not res!655226) (not e!551931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979092 (= res!655226 (validKeyInArray!0 (select (arr!29493 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!35966 () Bool)

(declare-fun mapRes!35966 () Bool)

(assert (=> mapIsEmpty!35966 mapRes!35966))

(declare-fun b!979093 () Bool)

(declare-fun res!655228 () Bool)

(assert (=> b!979093 (=> (not res!655228) (not e!551931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61271 (_ BitVec 32)) Bool)

(assert (=> b!979093 (= res!655228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979094 () Bool)

(declare-fun res!655227 () Bool)

(assert (=> b!979094 (=> (not res!655227) (not e!551931))))

(declare-datatypes ((List!20447 0))(
  ( (Nil!20444) (Cons!20443 (h!21605 (_ BitVec 64)) (t!29034 List!20447)) )
))
(declare-fun arrayNoDuplicates!0 (array!61271 (_ BitVec 32) List!20447) Bool)

(assert (=> b!979094 (= res!655227 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20444))))

(declare-fun b!979095 () Bool)

(assert (=> b!979095 (= e!551929 (and e!551932 mapRes!35966))))

(declare-fun condMapEmpty!35966 () Bool)

(declare-fun mapDefault!35966 () ValueCell!10831)

