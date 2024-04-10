; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15194 () Bool)

(assert start!15194)

(declare-fun b!145960 () Bool)

(declare-fun b_free!3093 () Bool)

(declare-fun b_next!3093 () Bool)

(assert (=> b!145960 (= b_free!3093 (not b_next!3093))))

(declare-fun tp!11783 () Bool)

(declare-fun b_and!9103 () Bool)

(assert (=> b!145960 (= tp!11783 b_and!9103)))

(declare-fun b!145949 () Bool)

(declare-fun b_free!3095 () Bool)

(declare-fun b_next!3095 () Bool)

(assert (=> b!145949 (= b_free!3095 (not b_next!3095))))

(declare-fun tp!11784 () Bool)

(declare-fun b_and!9105 () Bool)

(assert (=> b!145949 (= tp!11784 b_and!9105)))

(declare-fun tp_is_empty!2963 () Bool)

(declare-fun e!95146 () Bool)

(declare-fun e!95142 () Bool)

(declare-datatypes ((V!3597 0))(
  ( (V!3598 (val!1526 Int)) )
))
(declare-datatypes ((array!4971 0))(
  ( (array!4972 (arr!2347 (Array (_ BitVec 32) (_ BitVec 64))) (size!2623 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1138 0))(
  ( (ValueCellFull!1138 (v!3342 V!3597)) (EmptyCell!1138) )
))
(declare-datatypes ((array!4973 0))(
  ( (array!4974 (arr!2348 (Array (_ BitVec 32) ValueCell!1138)) (size!2624 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1184 0))(
  ( (LongMapFixedSize!1185 (defaultEntry!3008 Int) (mask!7380 (_ BitVec 32)) (extraKeys!2753 (_ BitVec 32)) (zeroValue!2853 V!3597) (minValue!2853 V!3597) (_size!641 (_ BitVec 32)) (_keys!4777 array!4971) (_values!2991 array!4973) (_vacant!641 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1184)

(declare-fun array_inv!1477 (array!4971) Bool)

(declare-fun array_inv!1478 (array!4973) Bool)

(assert (=> b!145949 (= e!95146 (and tp!11784 tp_is_empty!2963 (array_inv!1477 (_keys!4777 newMap!16)) (array_inv!1478 (_values!2991 newMap!16)) e!95142))))

(declare-fun b!145950 () Bool)

(declare-fun e!95137 () Bool)

(declare-fun e!95147 () Bool)

(assert (=> b!145950 (= e!95137 e!95147)))

(declare-fun res!69495 () Bool)

(assert (=> b!145950 (=> (not res!69495) (not e!95147))))

(declare-datatypes ((Cell!968 0))(
  ( (Cell!969 (v!3343 LongMapFixedSize!1184)) )
))
(declare-datatypes ((LongMap!968 0))(
  ( (LongMap!969 (underlying!495 Cell!968)) )
))
(declare-fun thiss!992 () LongMap!968)

(declare-datatypes ((tuple2!2750 0))(
  ( (tuple2!2751 (_1!1386 (_ BitVec 64)) (_2!1386 V!3597)) )
))
(declare-datatypes ((List!1772 0))(
  ( (Nil!1769) (Cons!1768 (h!2376 tuple2!2750) (t!6449 List!1772)) )
))
(declare-datatypes ((ListLongMap!1771 0))(
  ( (ListLongMap!1772 (toList!901 List!1772)) )
))
(declare-fun lt!76747 () ListLongMap!1771)

(declare-fun lt!76746 () ListLongMap!1771)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!145950 (= res!69495 (and (= lt!76746 lt!76747) (not (= (select (arr!2347 (_keys!4777 (v!3343 (underlying!495 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2347 (_keys!4777 (v!3343 (underlying!495 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1461 (LongMapFixedSize!1184) ListLongMap!1771)

(assert (=> b!145950 (= lt!76747 (map!1461 newMap!16))))

(declare-fun getCurrentListMap!570 (array!4971 array!4973 (_ BitVec 32) (_ BitVec 32) V!3597 V!3597 (_ BitVec 32) Int) ListLongMap!1771)

(assert (=> b!145950 (= lt!76746 (getCurrentListMap!570 (_keys!4777 (v!3343 (underlying!495 thiss!992))) (_values!2991 (v!3343 (underlying!495 thiss!992))) (mask!7380 (v!3343 (underlying!495 thiss!992))) (extraKeys!2753 (v!3343 (underlying!495 thiss!992))) (zeroValue!2853 (v!3343 (underlying!495 thiss!992))) (minValue!2853 (v!3343 (underlying!495 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3008 (v!3343 (underlying!495 thiss!992)))))))

(declare-fun b!145951 () Bool)

(declare-fun res!69497 () Bool)

(assert (=> b!145951 (=> (not res!69497) (not e!95137))))

(assert (=> b!145951 (= res!69497 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2623 (_keys!4777 (v!3343 (underlying!495 thiss!992)))))))))

(declare-fun b!145952 () Bool)

(declare-fun e!95136 () Bool)

(declare-fun e!95149 () Bool)

(assert (=> b!145952 (= e!95136 e!95149)))

(declare-fun mapIsEmpty!4961 () Bool)

(declare-fun mapRes!4961 () Bool)

(assert (=> mapIsEmpty!4961 mapRes!4961))

(declare-fun b!145953 () Bool)

(declare-fun res!69493 () Bool)

(assert (=> b!145953 (=> (not res!69493) (not e!95137))))

(assert (=> b!145953 (= res!69493 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7380 newMap!16)) (_size!641 (v!3343 (underlying!495 thiss!992)))))))

(declare-fun res!69494 () Bool)

(assert (=> start!15194 (=> (not res!69494) (not e!95137))))

(declare-fun valid!575 (LongMap!968) Bool)

(assert (=> start!15194 (= res!69494 (valid!575 thiss!992))))

(assert (=> start!15194 e!95137))

(assert (=> start!15194 e!95136))

(assert (=> start!15194 true))

(assert (=> start!15194 e!95146))

(declare-fun b!145954 () Bool)

(declare-fun e!95143 () Bool)

(declare-fun e!95145 () Bool)

(declare-fun mapRes!4962 () Bool)

(assert (=> b!145954 (= e!95143 (and e!95145 mapRes!4962))))

(declare-fun condMapEmpty!4962 () Bool)

(declare-fun mapDefault!4961 () ValueCell!1138)

