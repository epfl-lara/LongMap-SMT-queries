; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78672 () Bool)

(assert start!78672)

(declare-fun b_free!16885 () Bool)

(declare-fun b_next!16885 () Bool)

(assert (=> start!78672 (= b_free!16885 (not b_next!16885))))

(declare-fun tp!59096 () Bool)

(declare-fun b_and!27507 () Bool)

(assert (=> start!78672 (= tp!59096 b_and!27507)))

(declare-fun b!917222 () Bool)

(declare-fun e!514951 () Bool)

(declare-fun e!514955 () Bool)

(assert (=> b!917222 (= e!514951 e!514955)))

(declare-fun res!618343 () Bool)

(assert (=> b!917222 (=> (not res!618343) (not e!514955))))

(declare-datatypes ((V!30823 0))(
  ( (V!30824 (val!9747 Int)) )
))
(declare-datatypes ((tuple2!12656 0))(
  ( (tuple2!12657 (_1!6339 (_ BitVec 64)) (_2!6339 V!30823)) )
))
(declare-datatypes ((List!18466 0))(
  ( (Nil!18463) (Cons!18462 (h!19608 tuple2!12656) (t!26081 List!18466)) )
))
(declare-datatypes ((ListLongMap!11353 0))(
  ( (ListLongMap!11354 (toList!5692 List!18466)) )
))
(declare-fun lt!411967 () ListLongMap!11353)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4744 (ListLongMap!11353 (_ BitVec 64)) Bool)

(assert (=> b!917222 (= res!618343 (contains!4744 lt!411967 k!1099))))

(declare-datatypes ((array!54772 0))(
  ( (array!54773 (arr!26331 (Array (_ BitVec 32) (_ BitVec 64))) (size!26790 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54772)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9215 0))(
  ( (ValueCellFull!9215 (v!12265 V!30823)) (EmptyCell!9215) )
))
(declare-datatypes ((array!54774 0))(
  ( (array!54775 (arr!26332 (Array (_ BitVec 32) ValueCell!9215)) (size!26791 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54774)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30823)

(declare-fun minValue!1173 () V!30823)

(declare-fun getCurrentListMap!2951 (array!54772 array!54774 (_ BitVec 32) (_ BitVec 32) V!30823 V!30823 (_ BitVec 32) Int) ListLongMap!11353)

(assert (=> b!917222 (= lt!411967 (getCurrentListMap!2951 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917224 () Bool)

(declare-fun res!618344 () Bool)

(assert (=> b!917224 (=> (not res!618344) (not e!514951))))

(assert (=> b!917224 (= res!618344 (and (= (size!26791 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26790 _keys!1487) (size!26791 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917225 () Bool)

(declare-fun e!514954 () Bool)

(declare-fun tp_is_empty!19393 () Bool)

(assert (=> b!917225 (= e!514954 tp_is_empty!19393)))

(declare-fun b!917226 () Bool)

(declare-fun res!618340 () Bool)

(assert (=> b!917226 (=> (not res!618340) (not e!514951))))

(declare-datatypes ((List!18467 0))(
  ( (Nil!18464) (Cons!18463 (h!19609 (_ BitVec 64)) (t!26082 List!18467)) )
))
(declare-fun arrayNoDuplicates!0 (array!54772 (_ BitVec 32) List!18467) Bool)

(assert (=> b!917226 (= res!618340 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18464))))

(declare-fun mapIsEmpty!30846 () Bool)

(declare-fun mapRes!30846 () Bool)

(assert (=> mapIsEmpty!30846 mapRes!30846))

(declare-fun b!917227 () Bool)

(declare-fun res!618346 () Bool)

(assert (=> b!917227 (=> (not res!618346) (not e!514955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917227 (= res!618346 (validKeyInArray!0 k!1099))))

(declare-fun b!917228 () Bool)

(declare-fun e!514956 () Bool)

(assert (=> b!917228 (= e!514956 tp_is_empty!19393)))

(declare-fun b!917229 () Bool)

(declare-fun res!618341 () Bool)

(assert (=> b!917229 (=> (not res!618341) (not e!514951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54772 (_ BitVec 32)) Bool)

(assert (=> b!917229 (= res!618341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!618342 () Bool)

(assert (=> start!78672 (=> (not res!618342) (not e!514951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78672 (= res!618342 (validMask!0 mask!1881))))

(assert (=> start!78672 e!514951))

(assert (=> start!78672 true))

(assert (=> start!78672 tp_is_empty!19393))

(declare-fun e!514957 () Bool)

(declare-fun array_inv!20534 (array!54774) Bool)

(assert (=> start!78672 (and (array_inv!20534 _values!1231) e!514957)))

(assert (=> start!78672 tp!59096))

(declare-fun array_inv!20535 (array!54772) Bool)

(assert (=> start!78672 (array_inv!20535 _keys!1487)))

(declare-fun b!917223 () Bool)

(declare-fun e!514953 () Bool)

(assert (=> b!917223 (= e!514955 e!514953)))

(declare-fun res!618348 () Bool)

(assert (=> b!917223 (=> (not res!618348) (not e!514953))))

(declare-fun lt!411965 () (_ BitVec 64))

(assert (=> b!917223 (= res!618348 (validKeyInArray!0 lt!411965))))

(assert (=> b!917223 (= lt!411965 (select (arr!26331 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917230 () Bool)

(declare-fun res!618345 () Bool)

(assert (=> b!917230 (=> (not res!618345) (not e!514955))))

(assert (=> b!917230 (= res!618345 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917231 () Bool)

(declare-fun res!618349 () Bool)

(assert (=> b!917231 (=> (not res!618349) (not e!514951))))

(assert (=> b!917231 (= res!618349 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26790 _keys!1487))))))

(declare-fun b!917232 () Bool)

(declare-fun res!618347 () Bool)

(assert (=> b!917232 (=> (not res!618347) (not e!514955))))

(declare-fun v!791 () V!30823)

(declare-fun apply!547 (ListLongMap!11353 (_ BitVec 64)) V!30823)

(assert (=> b!917232 (= res!618347 (= (apply!547 lt!411967 k!1099) v!791))))

(declare-fun mapNonEmpty!30846 () Bool)

(declare-fun tp!59095 () Bool)

(assert (=> mapNonEmpty!30846 (= mapRes!30846 (and tp!59095 e!514956))))

(declare-fun mapRest!30846 () (Array (_ BitVec 32) ValueCell!9215))

(declare-fun mapKey!30846 () (_ BitVec 32))

(declare-fun mapValue!30846 () ValueCell!9215)

(assert (=> mapNonEmpty!30846 (= (arr!26332 _values!1231) (store mapRest!30846 mapKey!30846 mapValue!30846))))

(declare-fun b!917233 () Bool)

(assert (=> b!917233 (= e!514957 (and e!514954 mapRes!30846))))

(declare-fun condMapEmpty!30846 () Bool)

(declare-fun mapDefault!30846 () ValueCell!9215)

