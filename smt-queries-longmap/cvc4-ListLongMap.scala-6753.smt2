; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84670 () Bool)

(assert start!84670)

(declare-fun b_free!20081 () Bool)

(declare-fun b_next!20081 () Bool)

(assert (=> start!84670 (= b_free!20081 (not b_next!20081))))

(declare-fun tp!70038 () Bool)

(declare-fun b_and!32233 () Bool)

(assert (=> start!84670 (= tp!70038 b_and!32233)))

(declare-fun b!990270 () Bool)

(declare-fun res!662189 () Bool)

(declare-fun e!558381 () Bool)

(assert (=> b!990270 (=> (not res!662189) (not e!558381))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62555 0))(
  ( (array!62556 (arr!30129 (Array (_ BitVec 32) (_ BitVec 64))) (size!30608 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62555)

(assert (=> b!990270 (= res!662189 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30608 _keys!1544))))))

(declare-fun b!990271 () Bool)

(declare-fun res!662192 () Bool)

(assert (=> b!990271 (=> (not res!662192) (not e!558381))))

(declare-datatypes ((List!20847 0))(
  ( (Nil!20844) (Cons!20843 (h!22005 (_ BitVec 64)) (t!29824 List!20847)) )
))
(declare-fun arrayNoDuplicates!0 (array!62555 (_ BitVec 32) List!20847) Bool)

(assert (=> b!990271 (= res!662192 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20844))))

(declare-fun b!990272 () Bool)

(declare-fun res!662186 () Bool)

(assert (=> b!990272 (=> (not res!662186) (not e!558381))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62555 (_ BitVec 32)) Bool)

(assert (=> b!990272 (= res!662186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36994 () Bool)

(declare-fun mapRes!36994 () Bool)

(declare-fun tp!70037 () Bool)

(declare-fun e!558380 () Bool)

(assert (=> mapNonEmpty!36994 (= mapRes!36994 (and tp!70037 e!558380))))

(declare-datatypes ((V!36045 0))(
  ( (V!36046 (val!11699 Int)) )
))
(declare-datatypes ((ValueCell!11167 0))(
  ( (ValueCellFull!11167 (v!14269 V!36045)) (EmptyCell!11167) )
))
(declare-fun mapRest!36994 () (Array (_ BitVec 32) ValueCell!11167))

(declare-datatypes ((array!62557 0))(
  ( (array!62558 (arr!30130 (Array (_ BitVec 32) ValueCell!11167)) (size!30609 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62557)

(declare-fun mapKey!36994 () (_ BitVec 32))

(declare-fun mapValue!36994 () ValueCell!11167)

(assert (=> mapNonEmpty!36994 (= (arr!30130 _values!1278) (store mapRest!36994 mapKey!36994 mapValue!36994))))

(declare-fun b!990273 () Bool)

(declare-fun e!558377 () Bool)

(assert (=> b!990273 (= e!558381 e!558377)))

(declare-fun res!662191 () Bool)

(assert (=> b!990273 (=> (not res!662191) (not e!558377))))

(assert (=> b!990273 (= res!662191 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30129 _keys!1544) from!1932))))))

(declare-fun lt!439303 () V!36045)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15641 (ValueCell!11167 V!36045) V!36045)

(declare-fun dynLambda!1874 (Int (_ BitVec 64)) V!36045)

(assert (=> b!990273 (= lt!439303 (get!15641 (select (arr!30130 _values!1278) from!1932) (dynLambda!1874 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!36045)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14918 0))(
  ( (tuple2!14919 (_1!7470 (_ BitVec 64)) (_2!7470 V!36045)) )
))
(declare-datatypes ((List!20848 0))(
  ( (Nil!20845) (Cons!20844 (h!22006 tuple2!14918) (t!29825 List!20848)) )
))
(declare-datatypes ((ListLongMap!13615 0))(
  ( (ListLongMap!13616 (toList!6823 List!20848)) )
))
(declare-fun lt!439302 () ListLongMap!13615)

(declare-fun zeroValue!1220 () V!36045)

(declare-fun getCurrentListMapNoExtraKeys!3511 (array!62555 array!62557 (_ BitVec 32) (_ BitVec 32) V!36045 V!36045 (_ BitVec 32) Int) ListLongMap!13615)

(assert (=> b!990273 (= lt!439302 (getCurrentListMapNoExtraKeys!3511 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!662188 () Bool)

(assert (=> start!84670 (=> (not res!662188) (not e!558381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84670 (= res!662188 (validMask!0 mask!1948))))

(assert (=> start!84670 e!558381))

(assert (=> start!84670 true))

(declare-fun tp_is_empty!23297 () Bool)

(assert (=> start!84670 tp_is_empty!23297))

(declare-fun e!558376 () Bool)

(declare-fun array_inv!23269 (array!62557) Bool)

(assert (=> start!84670 (and (array_inv!23269 _values!1278) e!558376)))

(assert (=> start!84670 tp!70038))

(declare-fun array_inv!23270 (array!62555) Bool)

(assert (=> start!84670 (array_inv!23270 _keys!1544)))

(declare-fun b!990274 () Bool)

(declare-fun lt!439305 () tuple2!14918)

(declare-fun getCurrentListMap!3873 (array!62555 array!62557 (_ BitVec 32) (_ BitVec 32) V!36045 V!36045 (_ BitVec 32) Int) ListLongMap!13615)

(declare-fun +!3093 (ListLongMap!13615 tuple2!14918) ListLongMap!13615)

(assert (=> b!990274 (= e!558377 (not (= (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3093 (getCurrentListMap!3873 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!439305))))))

(declare-fun lt!439301 () tuple2!14918)

(assert (=> b!990274 (= (+!3093 (+!3093 lt!439302 lt!439301) lt!439305) (+!3093 (+!3093 lt!439302 lt!439305) lt!439301))))

(assert (=> b!990274 (= lt!439305 (tuple2!14919 (select (arr!30129 _keys!1544) from!1932) lt!439303))))

(assert (=> b!990274 (= lt!439301 (tuple2!14919 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32860 0))(
  ( (Unit!32861) )
))
(declare-fun lt!439304 () Unit!32860)

(declare-fun addCommutativeForDiffKeys!715 (ListLongMap!13615 (_ BitVec 64) V!36045 (_ BitVec 64) V!36045) Unit!32860)

(assert (=> b!990274 (= lt!439304 (addCommutativeForDiffKeys!715 lt!439302 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30129 _keys!1544) from!1932) lt!439303))))

(declare-fun b!990275 () Bool)

(declare-fun e!558378 () Bool)

(assert (=> b!990275 (= e!558378 tp_is_empty!23297)))

(declare-fun b!990276 () Bool)

(declare-fun res!662193 () Bool)

(assert (=> b!990276 (=> (not res!662193) (not e!558381))))

(assert (=> b!990276 (= res!662193 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!990277 () Bool)

(assert (=> b!990277 (= e!558376 (and e!558378 mapRes!36994))))

(declare-fun condMapEmpty!36994 () Bool)

(declare-fun mapDefault!36994 () ValueCell!11167)

