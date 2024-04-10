; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84224 () Bool)

(assert start!84224)

(declare-fun b_free!19925 () Bool)

(declare-fun b_next!19925 () Bool)

(assert (=> start!84224 (= b_free!19925 (not b_next!19925))))

(declare-fun tp!69379 () Bool)

(declare-fun b_and!31927 () Bool)

(assert (=> start!84224 (= tp!69379 b_and!31927)))

(declare-fun b!985227 () Bool)

(declare-fun res!659279 () Bool)

(declare-fun e!555369 () Bool)

(assert (=> b!985227 (=> (not res!659279) (not e!555369))))

(declare-datatypes ((array!62029 0))(
  ( (array!62030 (arr!29872 (Array (_ BitVec 32) (_ BitVec 64))) (size!30351 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62029)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62029 (_ BitVec 32)) Bool)

(assert (=> b!985227 (= res!659279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985228 () Bool)

(declare-fun res!659275 () Bool)

(assert (=> b!985228 (=> (not res!659275) (not e!555369))))

(declare-datatypes ((V!35685 0))(
  ( (V!35686 (val!11564 Int)) )
))
(declare-datatypes ((ValueCell!11032 0))(
  ( (ValueCellFull!11032 (v!14126 V!35685)) (EmptyCell!11032) )
))
(declare-datatypes ((array!62031 0))(
  ( (array!62032 (arr!29873 (Array (_ BitVec 32) ValueCell!11032)) (size!30352 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62031)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985228 (= res!659275 (and (= (size!30352 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30351 _keys!1544) (size!30352 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985229 () Bool)

(declare-fun res!659273 () Bool)

(assert (=> b!985229 (=> (not res!659273) (not e!555369))))

(declare-datatypes ((List!20686 0))(
  ( (Nil!20683) (Cons!20682 (h!21844 (_ BitVec 64)) (t!29555 List!20686)) )
))
(declare-fun arrayNoDuplicates!0 (array!62029 (_ BitVec 32) List!20686) Bool)

(assert (=> b!985229 (= res!659273 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20683))))

(declare-fun b!985230 () Bool)

(declare-fun res!659278 () Bool)

(assert (=> b!985230 (=> (not res!659278) (not e!555369))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985230 (= res!659278 (validKeyInArray!0 (select (arr!29872 _keys!1544) from!1932)))))

(declare-fun res!659272 () Bool)

(assert (=> start!84224 (=> (not res!659272) (not e!555369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84224 (= res!659272 (validMask!0 mask!1948))))

(assert (=> start!84224 e!555369))

(assert (=> start!84224 true))

(declare-fun tp_is_empty!23027 () Bool)

(assert (=> start!84224 tp_is_empty!23027))

(declare-fun e!555367 () Bool)

(declare-fun array_inv!23093 (array!62031) Bool)

(assert (=> start!84224 (and (array_inv!23093 _values!1278) e!555367)))

(assert (=> start!84224 tp!69379))

(declare-fun array_inv!23094 (array!62029) Bool)

(assert (=> start!84224 (array_inv!23094 _keys!1544)))

(declare-fun b!985231 () Bool)

(declare-fun res!659276 () Bool)

(assert (=> b!985231 (=> (not res!659276) (not e!555369))))

(assert (=> b!985231 (= res!659276 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30351 _keys!1544))))))

(declare-fun b!985232 () Bool)

(declare-fun e!555371 () Bool)

(assert (=> b!985232 (= e!555371 tp_is_empty!23027)))

(declare-fun b!985233 () Bool)

(declare-fun e!555370 () Bool)

(assert (=> b!985233 (= e!555370 (not true))))

(declare-datatypes ((tuple2!14794 0))(
  ( (tuple2!14795 (_1!7408 (_ BitVec 64)) (_2!7408 V!35685)) )
))
(declare-datatypes ((List!20687 0))(
  ( (Nil!20684) (Cons!20683 (h!21845 tuple2!14794) (t!29556 List!20687)) )
))
(declare-datatypes ((ListLongMap!13491 0))(
  ( (ListLongMap!13492 (toList!6761 List!20687)) )
))
(declare-fun lt!437152 () ListLongMap!13491)

(declare-fun lt!437153 () tuple2!14794)

(declare-fun lt!437155 () tuple2!14794)

(declare-fun +!3051 (ListLongMap!13491 tuple2!14794) ListLongMap!13491)

(assert (=> b!985233 (= (+!3051 (+!3051 lt!437152 lt!437153) lt!437155) (+!3051 (+!3051 lt!437152 lt!437155) lt!437153))))

(declare-fun lt!437154 () V!35685)

(assert (=> b!985233 (= lt!437155 (tuple2!14795 (select (arr!29872 _keys!1544) from!1932) lt!437154))))

(declare-fun minValue!1220 () V!35685)

(assert (=> b!985233 (= lt!437153 (tuple2!14795 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32741 0))(
  ( (Unit!32742) )
))
(declare-fun lt!437156 () Unit!32741)

(declare-fun addCommutativeForDiffKeys!679 (ListLongMap!13491 (_ BitVec 64) V!35685 (_ BitVec 64) V!35685) Unit!32741)

(assert (=> b!985233 (= lt!437156 (addCommutativeForDiffKeys!679 lt!437152 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29872 _keys!1544) from!1932) lt!437154))))

(declare-fun b!985234 () Bool)

(assert (=> b!985234 (= e!555369 e!555370)))

(declare-fun res!659277 () Bool)

(assert (=> b!985234 (=> (not res!659277) (not e!555370))))

(assert (=> b!985234 (= res!659277 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29872 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15502 (ValueCell!11032 V!35685) V!35685)

(declare-fun dynLambda!1833 (Int (_ BitVec 64)) V!35685)

(assert (=> b!985234 (= lt!437154 (get!15502 (select (arr!29873 _values!1278) from!1932) (dynLambda!1833 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35685)

(declare-fun getCurrentListMapNoExtraKeys!3453 (array!62029 array!62031 (_ BitVec 32) (_ BitVec 32) V!35685 V!35685 (_ BitVec 32) Int) ListLongMap!13491)

(assert (=> b!985234 (= lt!437152 (getCurrentListMapNoExtraKeys!3453 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985235 () Bool)

(declare-fun e!555368 () Bool)

(assert (=> b!985235 (= e!555368 tp_is_empty!23027)))

(declare-fun mapNonEmpty!36569 () Bool)

(declare-fun mapRes!36569 () Bool)

(declare-fun tp!69378 () Bool)

(assert (=> mapNonEmpty!36569 (= mapRes!36569 (and tp!69378 e!555368))))

(declare-fun mapValue!36569 () ValueCell!11032)

(declare-fun mapKey!36569 () (_ BitVec 32))

(declare-fun mapRest!36569 () (Array (_ BitVec 32) ValueCell!11032))

(assert (=> mapNonEmpty!36569 (= (arr!29873 _values!1278) (store mapRest!36569 mapKey!36569 mapValue!36569))))

(declare-fun mapIsEmpty!36569 () Bool)

(assert (=> mapIsEmpty!36569 mapRes!36569))

(declare-fun b!985236 () Bool)

(assert (=> b!985236 (= e!555367 (and e!555371 mapRes!36569))))

(declare-fun condMapEmpty!36569 () Bool)

(declare-fun mapDefault!36569 () ValueCell!11032)

