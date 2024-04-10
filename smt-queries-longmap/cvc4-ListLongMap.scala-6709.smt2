; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84230 () Bool)

(assert start!84230)

(declare-fun b_free!19931 () Bool)

(declare-fun b_next!19931 () Bool)

(assert (=> start!84230 (= b_free!19931 (not b_next!19931))))

(declare-fun tp!69396 () Bool)

(declare-fun b_and!31939 () Bool)

(assert (=> start!84230 (= tp!69396 b_and!31939)))

(declare-fun b!985332 () Bool)

(declare-fun res!659350 () Bool)

(declare-fun e!555422 () Bool)

(assert (=> b!985332 (=> (not res!659350) (not e!555422))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985332 (= res!659350 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36578 () Bool)

(declare-fun mapRes!36578 () Bool)

(assert (=> mapIsEmpty!36578 mapRes!36578))

(declare-fun b!985333 () Bool)

(declare-fun res!659346 () Bool)

(assert (=> b!985333 (=> (not res!659346) (not e!555422))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62041 0))(
  ( (array!62042 (arr!29878 (Array (_ BitVec 32) (_ BitVec 64))) (size!30357 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62041)

(assert (=> b!985333 (= res!659346 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30357 _keys!1544))))))

(declare-fun b!985334 () Bool)

(declare-fun res!659345 () Bool)

(assert (=> b!985334 (=> (not res!659345) (not e!555422))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62041 (_ BitVec 32)) Bool)

(assert (=> b!985334 (= res!659345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985335 () Bool)

(declare-fun e!555423 () Bool)

(declare-fun tp_is_empty!23033 () Bool)

(assert (=> b!985335 (= e!555423 tp_is_empty!23033)))

(declare-fun b!985336 () Bool)

(declare-fun e!555424 () Bool)

(assert (=> b!985336 (= e!555424 (not true))))

(declare-datatypes ((V!35693 0))(
  ( (V!35694 (val!11567 Int)) )
))
(declare-datatypes ((tuple2!14800 0))(
  ( (tuple2!14801 (_1!7411 (_ BitVec 64)) (_2!7411 V!35693)) )
))
(declare-datatypes ((List!20692 0))(
  ( (Nil!20689) (Cons!20688 (h!21850 tuple2!14800) (t!29567 List!20692)) )
))
(declare-datatypes ((ListLongMap!13497 0))(
  ( (ListLongMap!13498 (toList!6764 List!20692)) )
))
(declare-fun lt!437197 () ListLongMap!13497)

(declare-fun lt!437199 () tuple2!14800)

(declare-fun lt!437200 () tuple2!14800)

(declare-fun +!3054 (ListLongMap!13497 tuple2!14800) ListLongMap!13497)

(assert (=> b!985336 (= (+!3054 (+!3054 lt!437197 lt!437199) lt!437200) (+!3054 (+!3054 lt!437197 lt!437200) lt!437199))))

(declare-fun lt!437198 () V!35693)

(assert (=> b!985336 (= lt!437200 (tuple2!14801 (select (arr!29878 _keys!1544) from!1932) lt!437198))))

(declare-fun minValue!1220 () V!35693)

(assert (=> b!985336 (= lt!437199 (tuple2!14801 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32747 0))(
  ( (Unit!32748) )
))
(declare-fun lt!437201 () Unit!32747)

(declare-fun addCommutativeForDiffKeys!682 (ListLongMap!13497 (_ BitVec 64) V!35693 (_ BitVec 64) V!35693) Unit!32747)

(assert (=> b!985336 (= lt!437201 (addCommutativeForDiffKeys!682 lt!437197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29878 _keys!1544) from!1932) lt!437198))))

(declare-fun res!659347 () Bool)

(assert (=> start!84230 (=> (not res!659347) (not e!555422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84230 (= res!659347 (validMask!0 mask!1948))))

(assert (=> start!84230 e!555422))

(assert (=> start!84230 true))

(assert (=> start!84230 tp_is_empty!23033))

(declare-datatypes ((ValueCell!11035 0))(
  ( (ValueCellFull!11035 (v!14129 V!35693)) (EmptyCell!11035) )
))
(declare-datatypes ((array!62043 0))(
  ( (array!62044 (arr!29879 (Array (_ BitVec 32) ValueCell!11035)) (size!30358 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62043)

(declare-fun e!555421 () Bool)

(declare-fun array_inv!23097 (array!62043) Bool)

(assert (=> start!84230 (and (array_inv!23097 _values!1278) e!555421)))

(assert (=> start!84230 tp!69396))

(declare-fun array_inv!23098 (array!62041) Bool)

(assert (=> start!84230 (array_inv!23098 _keys!1544)))

(declare-fun b!985337 () Bool)

(declare-fun e!555425 () Bool)

(assert (=> b!985337 (= e!555425 tp_is_empty!23033)))

(declare-fun mapNonEmpty!36578 () Bool)

(declare-fun tp!69397 () Bool)

(assert (=> mapNonEmpty!36578 (= mapRes!36578 (and tp!69397 e!555423))))

(declare-fun mapValue!36578 () ValueCell!11035)

(declare-fun mapRest!36578 () (Array (_ BitVec 32) ValueCell!11035))

(declare-fun mapKey!36578 () (_ BitVec 32))

(assert (=> mapNonEmpty!36578 (= (arr!29879 _values!1278) (store mapRest!36578 mapKey!36578 mapValue!36578))))

(declare-fun b!985338 () Bool)

(declare-fun res!659349 () Bool)

(assert (=> b!985338 (=> (not res!659349) (not e!555422))))

(assert (=> b!985338 (= res!659349 (and (= (size!30358 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30357 _keys!1544) (size!30358 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985339 () Bool)

(declare-fun res!659348 () Bool)

(assert (=> b!985339 (=> (not res!659348) (not e!555422))))

(declare-datatypes ((List!20693 0))(
  ( (Nil!20690) (Cons!20689 (h!21851 (_ BitVec 64)) (t!29568 List!20693)) )
))
(declare-fun arrayNoDuplicates!0 (array!62041 (_ BitVec 32) List!20693) Bool)

(assert (=> b!985339 (= res!659348 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20690))))

(declare-fun b!985340 () Bool)

(assert (=> b!985340 (= e!555421 (and e!555425 mapRes!36578))))

(declare-fun condMapEmpty!36578 () Bool)

(declare-fun mapDefault!36578 () ValueCell!11035)

