; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83188 () Bool)

(assert start!83188)

(declare-fun b_free!19181 () Bool)

(declare-fun b_next!19181 () Bool)

(assert (=> start!83188 (= b_free!19181 (not b_next!19181))))

(declare-fun tp!66821 () Bool)

(declare-fun b_and!30669 () Bool)

(assert (=> start!83188 (= tp!66821 b_and!30669)))

(declare-fun b!970547 () Bool)

(declare-fun res!649600 () Bool)

(declare-fun e!547159 () Bool)

(assert (=> b!970547 (=> (not res!649600) (not e!547159))))

(declare-datatypes ((array!60213 0))(
  ( (array!60214 (arr!28970 (Array (_ BitVec 32) (_ BitVec 64))) (size!29449 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60213)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970547 (= res!649600 (validKeyInArray!0 (select (arr!28970 _keys!1717) i!822)))))

(declare-fun res!649601 () Bool)

(assert (=> start!83188 (=> (not res!649601) (not e!547159))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83188 (= res!649601 (validMask!0 mask!2147))))

(assert (=> start!83188 e!547159))

(assert (=> start!83188 true))

(declare-datatypes ((V!34421 0))(
  ( (V!34422 (val!11090 Int)) )
))
(declare-datatypes ((ValueCell!10558 0))(
  ( (ValueCellFull!10558 (v!13649 V!34421)) (EmptyCell!10558) )
))
(declare-datatypes ((array!60215 0))(
  ( (array!60216 (arr!28971 (Array (_ BitVec 32) ValueCell!10558)) (size!29450 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60215)

(declare-fun e!547158 () Bool)

(declare-fun array_inv!22423 (array!60215) Bool)

(assert (=> start!83188 (and (array_inv!22423 _values!1425) e!547158)))

(declare-fun tp_is_empty!22079 () Bool)

(assert (=> start!83188 tp_is_empty!22079))

(assert (=> start!83188 tp!66821))

(declare-fun array_inv!22424 (array!60213) Bool)

(assert (=> start!83188 (array_inv!22424 _keys!1717)))

(declare-fun b!970548 () Bool)

(declare-fun e!547157 () Bool)

(assert (=> b!970548 (= e!547157 tp_is_empty!22079)))

(declare-fun mapIsEmpty!35128 () Bool)

(declare-fun mapRes!35128 () Bool)

(assert (=> mapIsEmpty!35128 mapRes!35128))

(declare-fun b!970549 () Bool)

(assert (=> b!970549 (= e!547159 false)))

(declare-fun lt!431750 () Bool)

(declare-fun zeroValue!1367 () V!34421)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34421)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14210 0))(
  ( (tuple2!14211 (_1!7116 (_ BitVec 64)) (_2!7116 V!34421)) )
))
(declare-datatypes ((List!20079 0))(
  ( (Nil!20076) (Cons!20075 (h!21237 tuple2!14210) (t!28442 List!20079)) )
))
(declare-datatypes ((ListLongMap!12907 0))(
  ( (ListLongMap!12908 (toList!6469 List!20079)) )
))
(declare-fun contains!5573 (ListLongMap!12907 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3702 (array!60213 array!60215 (_ BitVec 32) (_ BitVec 32) V!34421 V!34421 (_ BitVec 32) Int) ListLongMap!12907)

(assert (=> b!970549 (= lt!431750 (contains!5573 (getCurrentListMap!3702 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28970 _keys!1717) i!822)))))

(declare-fun b!970550 () Bool)

(declare-fun res!649603 () Bool)

(assert (=> b!970550 (=> (not res!649603) (not e!547159))))

(declare-datatypes ((List!20080 0))(
  ( (Nil!20077) (Cons!20076 (h!21238 (_ BitVec 64)) (t!28443 List!20080)) )
))
(declare-fun arrayNoDuplicates!0 (array!60213 (_ BitVec 32) List!20080) Bool)

(assert (=> b!970550 (= res!649603 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20077))))

(declare-fun b!970551 () Bool)

(declare-fun e!547155 () Bool)

(assert (=> b!970551 (= e!547158 (and e!547155 mapRes!35128))))

(declare-fun condMapEmpty!35128 () Bool)

(declare-fun mapDefault!35128 () ValueCell!10558)

