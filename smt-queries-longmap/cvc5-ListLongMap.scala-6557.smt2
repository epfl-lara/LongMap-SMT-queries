; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83226 () Bool)

(assert start!83226)

(declare-fun b_free!19219 () Bool)

(declare-fun b_next!19219 () Bool)

(assert (=> start!83226 (= b_free!19219 (not b_next!19219))))

(declare-fun tp!66935 () Bool)

(declare-fun b_and!30707 () Bool)

(assert (=> start!83226 (= tp!66935 b_and!30707)))

(declare-fun mapIsEmpty!35185 () Bool)

(declare-fun mapRes!35185 () Bool)

(assert (=> mapIsEmpty!35185 mapRes!35185))

(declare-fun b!971089 () Bool)

(declare-fun res!649977 () Bool)

(declare-fun e!547443 () Bool)

(assert (=> b!971089 (=> (not res!649977) (not e!547443))))

(declare-datatypes ((array!60287 0))(
  ( (array!60288 (arr!29007 (Array (_ BitVec 32) (_ BitVec 64))) (size!29486 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60287)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60287 (_ BitVec 32)) Bool)

(assert (=> b!971089 (= res!649977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!649973 () Bool)

(assert (=> start!83226 (=> (not res!649973) (not e!547443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83226 (= res!649973 (validMask!0 mask!2147))))

(assert (=> start!83226 e!547443))

(assert (=> start!83226 true))

(declare-datatypes ((V!34473 0))(
  ( (V!34474 (val!11109 Int)) )
))
(declare-datatypes ((ValueCell!10577 0))(
  ( (ValueCellFull!10577 (v!13668 V!34473)) (EmptyCell!10577) )
))
(declare-datatypes ((array!60289 0))(
  ( (array!60290 (arr!29008 (Array (_ BitVec 32) ValueCell!10577)) (size!29487 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60289)

(declare-fun e!547442 () Bool)

(declare-fun array_inv!22449 (array!60289) Bool)

(assert (=> start!83226 (and (array_inv!22449 _values!1425) e!547442)))

(declare-fun tp_is_empty!22117 () Bool)

(assert (=> start!83226 tp_is_empty!22117))

(assert (=> start!83226 tp!66935))

(declare-fun array_inv!22450 (array!60287) Bool)

(assert (=> start!83226 (array_inv!22450 _keys!1717)))

(declare-fun b!971090 () Bool)

(declare-fun res!649974 () Bool)

(assert (=> b!971090 (=> (not res!649974) (not e!547443))))

(declare-fun zeroValue!1367 () V!34473)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34473)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14238 0))(
  ( (tuple2!14239 (_1!7130 (_ BitVec 64)) (_2!7130 V!34473)) )
))
(declare-datatypes ((List!20106 0))(
  ( (Nil!20103) (Cons!20102 (h!21264 tuple2!14238) (t!28469 List!20106)) )
))
(declare-datatypes ((ListLongMap!12935 0))(
  ( (ListLongMap!12936 (toList!6483 List!20106)) )
))
(declare-fun contains!5585 (ListLongMap!12935 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3716 (array!60287 array!60289 (_ BitVec 32) (_ BitVec 32) V!34473 V!34473 (_ BitVec 32) Int) ListLongMap!12935)

(assert (=> b!971090 (= res!649974 (contains!5585 (getCurrentListMap!3716 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29007 _keys!1717) i!822)))))

(declare-fun b!971091 () Bool)

(declare-fun res!649975 () Bool)

(assert (=> b!971091 (=> (not res!649975) (not e!547443))))

(declare-datatypes ((List!20107 0))(
  ( (Nil!20104) (Cons!20103 (h!21265 (_ BitVec 64)) (t!28470 List!20107)) )
))
(declare-fun arrayNoDuplicates!0 (array!60287 (_ BitVec 32) List!20107) Bool)

(assert (=> b!971091 (= res!649975 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20104))))

(declare-fun b!971092 () Bool)

(assert (=> b!971092 (= e!547443 false)))

(declare-fun lt!431798 () ListLongMap!12935)

(assert (=> b!971092 (= lt!431798 (getCurrentListMap!3716 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971093 () Bool)

(declare-fun res!649972 () Bool)

(assert (=> b!971093 (=> (not res!649972) (not e!547443))))

(assert (=> b!971093 (= res!649972 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29486 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29486 _keys!1717))))))

(declare-fun b!971094 () Bool)

(declare-fun e!547440 () Bool)

(assert (=> b!971094 (= e!547440 tp_is_empty!22117)))

(declare-fun b!971095 () Bool)

(declare-fun res!649971 () Bool)

(assert (=> b!971095 (=> (not res!649971) (not e!547443))))

(assert (=> b!971095 (= res!649971 (and (= (size!29487 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29486 _keys!1717) (size!29487 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971096 () Bool)

(assert (=> b!971096 (= e!547442 (and e!547440 mapRes!35185))))

(declare-fun condMapEmpty!35185 () Bool)

(declare-fun mapDefault!35185 () ValueCell!10577)

