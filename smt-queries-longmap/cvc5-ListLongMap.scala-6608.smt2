; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83532 () Bool)

(assert start!83532)

(declare-fun b_free!19519 () Bool)

(declare-fun b_next!19519 () Bool)

(assert (=> start!83532 (= b_free!19519 (not b_next!19519))))

(declare-fun tp!67844 () Bool)

(declare-fun b_and!31133 () Bool)

(assert (=> start!83532 (= tp!67844 b_and!31133)))

(declare-fun b!975979 () Bool)

(declare-fun res!653362 () Bool)

(declare-fun e!550025 () Bool)

(assert (=> b!975979 (=> (not res!653362) (not e!550025))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34881 0))(
  ( (V!34882 (val!11262 Int)) )
))
(declare-datatypes ((ValueCell!10730 0))(
  ( (ValueCellFull!10730 (v!13821 V!34881)) (EmptyCell!10730) )
))
(declare-datatypes ((array!60875 0))(
  ( (array!60876 (arr!29301 (Array (_ BitVec 32) ValueCell!10730)) (size!29780 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60875)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60877 0))(
  ( (array!60878 (arr!29302 (Array (_ BitVec 32) (_ BitVec 64))) (size!29781 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60877)

(assert (=> b!975979 (= res!653362 (and (= (size!29780 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29781 _keys!1717) (size!29780 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975980 () Bool)

(declare-fun res!653359 () Bool)

(assert (=> b!975980 (=> (not res!653359) (not e!550025))))

(declare-datatypes ((List!20339 0))(
  ( (Nil!20336) (Cons!20335 (h!21497 (_ BitVec 64)) (t!28830 List!20339)) )
))
(declare-fun arrayNoDuplicates!0 (array!60877 (_ BitVec 32) List!20339) Bool)

(assert (=> b!975980 (= res!653359 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20336))))

(declare-fun b!975981 () Bool)

(declare-fun e!550029 () Bool)

(declare-fun tp_is_empty!22423 () Bool)

(assert (=> b!975981 (= e!550029 tp_is_empty!22423)))

(declare-fun mapIsEmpty!35644 () Bool)

(declare-fun mapRes!35644 () Bool)

(assert (=> mapIsEmpty!35644 mapRes!35644))

(declare-fun b!975982 () Bool)

(declare-fun e!550027 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975982 (= e!550027 (not (bvsge i!822 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14486 0))(
  ( (tuple2!14487 (_1!7254 (_ BitVec 64)) (_2!7254 V!34881)) )
))
(declare-datatypes ((List!20340 0))(
  ( (Nil!20337) (Cons!20336 (h!21498 tuple2!14486) (t!28831 List!20340)) )
))
(declare-datatypes ((ListLongMap!13183 0))(
  ( (ListLongMap!13184 (toList!6607 List!20340)) )
))
(declare-fun lt!432954 () ListLongMap!13183)

(declare-fun zeroValue!1367 () V!34881)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34881)

(declare-fun lt!432955 () (_ BitVec 64))

(declare-fun +!2918 (ListLongMap!13183 tuple2!14486) ListLongMap!13183)

(declare-fun getCurrentListMap!3840 (array!60877 array!60875 (_ BitVec 32) (_ BitVec 32) V!34881 V!34881 (_ BitVec 32) Int) ListLongMap!13183)

(declare-fun get!15173 (ValueCell!10730 V!34881) V!34881)

(declare-fun dynLambda!1707 (Int (_ BitVec 64)) V!34881)

(assert (=> b!975982 (= lt!432954 (+!2918 (getCurrentListMap!3840 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14487 lt!432955 (get!15173 (select (arr!29301 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1707 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32457 0))(
  ( (Unit!32458) )
))
(declare-fun lt!432956 () Unit!32457)

(declare-fun lemmaListMapRecursiveValidKeyArray!284 (array!60877 array!60875 (_ BitVec 32) (_ BitVec 32) V!34881 V!34881 (_ BitVec 32) Int) Unit!32457)

(assert (=> b!975982 (= lt!432956 (lemmaListMapRecursiveValidKeyArray!284 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975983 () Bool)

(declare-fun e!550028 () Bool)

(declare-fun e!550030 () Bool)

(assert (=> b!975983 (= e!550028 (and e!550030 mapRes!35644))))

(declare-fun condMapEmpty!35644 () Bool)

(declare-fun mapDefault!35644 () ValueCell!10730)

