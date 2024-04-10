; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13686 () Bool)

(assert start!13686)

(declare-fun b!125983 () Bool)

(declare-fun b_free!2853 () Bool)

(declare-fun b_next!2853 () Bool)

(assert (=> b!125983 (= b_free!2853 (not b_next!2853))))

(declare-fun tp!10966 () Bool)

(declare-fun b_and!7759 () Bool)

(assert (=> b!125983 (= tp!10966 b_and!7759)))

(declare-fun b!125982 () Bool)

(declare-fun b_free!2855 () Bool)

(declare-fun b_next!2855 () Bool)

(assert (=> b!125982 (= b_free!2855 (not b_next!2855))))

(declare-fun tp!10967 () Bool)

(declare-fun b_and!7761 () Bool)

(assert (=> b!125982 (= tp!10967 b_and!7761)))

(declare-fun mapIsEmpty!4505 () Bool)

(declare-fun mapRes!4505 () Bool)

(assert (=> mapIsEmpty!4505 mapRes!4505))

(declare-fun e!82331 () Bool)

(declare-fun tp_is_empty!2843 () Bool)

(declare-fun e!82324 () Bool)

(declare-datatypes ((V!3437 0))(
  ( (V!3438 (val!1466 Int)) )
))
(declare-datatypes ((array!4703 0))(
  ( (array!4704 (arr!2227 (Array (_ BitVec 32) (_ BitVec 64))) (size!2491 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1078 0))(
  ( (ValueCellFull!1078 (v!3125 V!3437)) (EmptyCell!1078) )
))
(declare-datatypes ((array!4705 0))(
  ( (array!4706 (arr!2228 (Array (_ BitVec 32) ValueCell!1078)) (size!2492 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1064 0))(
  ( (LongMapFixedSize!1065 (defaultEntry!2784 Int) (mask!7040 (_ BitVec 32)) (extraKeys!2565 (_ BitVec 32)) (zeroValue!2647 V!3437) (minValue!2647 V!3437) (_size!581 (_ BitVec 32)) (_keys!4517 array!4703) (_values!2767 array!4705) (_vacant!581 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1064)

(declare-fun array_inv!1399 (array!4703) Bool)

(declare-fun array_inv!1400 (array!4705) Bool)

(assert (=> b!125982 (= e!82331 (and tp!10967 tp_is_empty!2843 (array_inv!1399 (_keys!4517 newMap!16)) (array_inv!1400 (_values!2767 newMap!16)) e!82324))))

(declare-datatypes ((Cell!858 0))(
  ( (Cell!859 (v!3126 LongMapFixedSize!1064)) )
))
(declare-datatypes ((LongMap!858 0))(
  ( (LongMap!859 (underlying!440 Cell!858)) )
))
(declare-fun thiss!992 () LongMap!858)

(declare-fun e!82325 () Bool)

(declare-fun e!82319 () Bool)

(assert (=> b!125983 (= e!82319 (and tp!10966 tp_is_empty!2843 (array_inv!1399 (_keys!4517 (v!3126 (underlying!440 thiss!992)))) (array_inv!1400 (_values!2767 (v!3126 (underlying!440 thiss!992)))) e!82325))))

(declare-fun b!125984 () Bool)

(declare-fun e!82330 () Bool)

(assert (=> b!125984 (= e!82330 tp_is_empty!2843)))

(declare-fun mapNonEmpty!4505 () Bool)

(declare-fun tp!10965 () Bool)

(declare-fun e!82333 () Bool)

(assert (=> mapNonEmpty!4505 (= mapRes!4505 (and tp!10965 e!82333))))

(declare-fun mapValue!4505 () ValueCell!1078)

(declare-fun mapKey!4505 () (_ BitVec 32))

(declare-fun mapRest!4506 () (Array (_ BitVec 32) ValueCell!1078))

(assert (=> mapNonEmpty!4505 (= (arr!2228 (_values!2767 newMap!16)) (store mapRest!4506 mapKey!4505 mapValue!4505))))

(declare-fun b!125985 () Bool)

(declare-fun e!82322 () Bool)

(assert (=> b!125985 (= e!82322 (and (= (size!2492 (_values!2767 (v!3126 (underlying!440 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7040 (v!3126 (underlying!440 thiss!992))))) (not (= (size!2491 (_keys!4517 (v!3126 (underlying!440 thiss!992)))) (size!2492 (_values!2767 (v!3126 (underlying!440 thiss!992))))))))))

(declare-fun mapNonEmpty!4506 () Bool)

(declare-fun mapRes!4506 () Bool)

(declare-fun tp!10968 () Bool)

(declare-fun e!82329 () Bool)

(assert (=> mapNonEmpty!4506 (= mapRes!4506 (and tp!10968 e!82329))))

(declare-fun mapValue!4506 () ValueCell!1078)

(declare-fun mapRest!4505 () (Array (_ BitVec 32) ValueCell!1078))

(declare-fun mapKey!4506 () (_ BitVec 32))

(assert (=> mapNonEmpty!4506 (= (arr!2228 (_values!2767 (v!3126 (underlying!440 thiss!992)))) (store mapRest!4505 mapKey!4506 mapValue!4506))))

(declare-fun b!125986 () Bool)

(declare-fun res!60986 () Bool)

(declare-fun e!82332 () Bool)

(assert (=> b!125986 (=> (not res!60986) (not e!82332))))

(declare-fun valid!506 (LongMapFixedSize!1064) Bool)

(assert (=> b!125986 (= res!60986 (valid!506 newMap!16))))

(declare-fun b!125987 () Bool)

(declare-fun res!60980 () Bool)

(assert (=> b!125987 (=> (not res!60980) (not e!82332))))

(assert (=> b!125987 (= res!60980 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7040 newMap!16)) (_size!581 (v!3126 (underlying!440 thiss!992)))))))

(declare-fun b!125988 () Bool)

(declare-fun e!82320 () Bool)

(assert (=> b!125988 (= e!82320 e!82322)))

(declare-fun res!60985 () Bool)

(assert (=> b!125988 (=> (not res!60985) (not e!82322))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!2580 0))(
  ( (tuple2!2581 (_1!1301 (_ BitVec 64)) (_2!1301 V!3437)) )
))
(declare-datatypes ((List!1699 0))(
  ( (Nil!1696) (Cons!1695 (h!2297 tuple2!2580) (t!6050 List!1699)) )
))
(declare-datatypes ((ListLongMap!1683 0))(
  ( (ListLongMap!1684 (toList!857 List!1699)) )
))
(declare-fun lt!64963 () ListLongMap!1683)

(declare-fun contains!878 (ListLongMap!1683 (_ BitVec 64)) Bool)

(assert (=> b!125988 (= res!60985 (contains!878 lt!64963 (select (arr!2227 (_keys!4517 (v!3126 (underlying!440 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2582 0))(
  ( (tuple2!2583 (_1!1302 Bool) (_2!1302 LongMapFixedSize!1064)) )
))
(declare-fun lt!64961 () tuple2!2582)

(declare-fun update!183 (LongMapFixedSize!1064 (_ BitVec 64) V!3437) tuple2!2582)

(declare-fun get!1444 (ValueCell!1078 V!3437) V!3437)

(declare-fun dynLambda!414 (Int (_ BitVec 64)) V!3437)

(assert (=> b!125988 (= lt!64961 (update!183 newMap!16 (select (arr!2227 (_keys!4517 (v!3126 (underlying!440 thiss!992)))) from!355) (get!1444 (select (arr!2228 (_values!2767 (v!3126 (underlying!440 thiss!992)))) from!355) (dynLambda!414 (defaultEntry!2784 (v!3126 (underlying!440 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!125989 () Bool)

(declare-fun e!82323 () Bool)

(assert (=> b!125989 (= e!82325 (and e!82323 mapRes!4506))))

(declare-fun condMapEmpty!4505 () Bool)

(declare-fun mapDefault!4506 () ValueCell!1078)

