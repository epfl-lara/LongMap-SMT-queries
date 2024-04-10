; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37860 () Bool)

(assert start!37860)

(declare-fun b_free!8919 () Bool)

(declare-fun b_next!8919 () Bool)

(assert (=> start!37860 (= b_free!8919 (not b_next!8919))))

(declare-fun tp!31515 () Bool)

(declare-fun b_and!16185 () Bool)

(assert (=> start!37860 (= tp!31515 b_and!16185)))

(declare-fun b!389063 () Bool)

(declare-fun res!222511 () Bool)

(declare-fun e!235729 () Bool)

(assert (=> b!389063 (=> (not res!222511) (not e!235729))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23077 0))(
  ( (array!23078 (arr!11005 (Array (_ BitVec 32) (_ BitVec 64))) (size!11357 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23077)

(assert (=> b!389063 (= res!222511 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11357 _keys!658))))))

(declare-fun b!389064 () Bool)

(declare-fun res!222504 () Bool)

(assert (=> b!389064 (=> (not res!222504) (not e!235729))))

(assert (=> b!389064 (= res!222504 (or (= (select (arr!11005 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11005 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15957 () Bool)

(declare-fun mapRes!15957 () Bool)

(assert (=> mapIsEmpty!15957 mapRes!15957))

(declare-fun b!389065 () Bool)

(declare-fun e!235733 () Bool)

(declare-fun e!235731 () Bool)

(assert (=> b!389065 (= e!235733 (not e!235731))))

(declare-fun res!222506 () Bool)

(assert (=> b!389065 (=> res!222506 e!235731)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389065 (= res!222506 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13893 0))(
  ( (V!13894 (val!4840 Int)) )
))
(declare-datatypes ((ValueCell!4452 0))(
  ( (ValueCellFull!4452 (v!7045 V!13893)) (EmptyCell!4452) )
))
(declare-datatypes ((array!23079 0))(
  ( (array!23080 (arr!11006 (Array (_ BitVec 32) ValueCell!4452)) (size!11358 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23079)

(declare-datatypes ((tuple2!6510 0))(
  ( (tuple2!6511 (_1!3266 (_ BitVec 64)) (_2!3266 V!13893)) )
))
(declare-datatypes ((List!6363 0))(
  ( (Nil!6360) (Cons!6359 (h!7215 tuple2!6510) (t!11517 List!6363)) )
))
(declare-datatypes ((ListLongMap!5423 0))(
  ( (ListLongMap!5424 (toList!2727 List!6363)) )
))
(declare-fun lt!182826 () ListLongMap!5423)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13893)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13893)

(declare-fun getCurrentListMap!2076 (array!23077 array!23079 (_ BitVec 32) (_ BitVec 32) V!13893 V!13893 (_ BitVec 32) Int) ListLongMap!5423)

(assert (=> b!389065 (= lt!182826 (getCurrentListMap!2076 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182818 () array!23079)

(declare-fun lt!182819 () ListLongMap!5423)

(declare-fun lt!182823 () array!23077)

(assert (=> b!389065 (= lt!182819 (getCurrentListMap!2076 lt!182823 lt!182818 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182824 () ListLongMap!5423)

(declare-fun lt!182820 () ListLongMap!5423)

(assert (=> b!389065 (and (= lt!182824 lt!182820) (= lt!182820 lt!182824))))

(declare-fun v!373 () V!13893)

(declare-fun lt!182822 () ListLongMap!5423)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!1022 (ListLongMap!5423 tuple2!6510) ListLongMap!5423)

(assert (=> b!389065 (= lt!182820 (+!1022 lt!182822 (tuple2!6511 k0!778 v!373)))))

(declare-datatypes ((Unit!11922 0))(
  ( (Unit!11923) )
))
(declare-fun lt!182825 () Unit!11922)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!240 (array!23077 array!23079 (_ BitVec 32) (_ BitVec 32) V!13893 V!13893 (_ BitVec 32) (_ BitVec 64) V!13893 (_ BitVec 32) Int) Unit!11922)

(assert (=> b!389065 (= lt!182825 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!240 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!956 (array!23077 array!23079 (_ BitVec 32) (_ BitVec 32) V!13893 V!13893 (_ BitVec 32) Int) ListLongMap!5423)

(assert (=> b!389065 (= lt!182824 (getCurrentListMapNoExtraKeys!956 lt!182823 lt!182818 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389065 (= lt!182818 (array!23080 (store (arr!11006 _values!506) i!548 (ValueCellFull!4452 v!373)) (size!11358 _values!506)))))

(assert (=> b!389065 (= lt!182822 (getCurrentListMapNoExtraKeys!956 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389066 () Bool)

(declare-fun e!235735 () Bool)

(declare-fun e!235730 () Bool)

(assert (=> b!389066 (= e!235735 (and e!235730 mapRes!15957))))

(declare-fun condMapEmpty!15957 () Bool)

(declare-fun mapDefault!15957 () ValueCell!4452)

(assert (=> b!389066 (= condMapEmpty!15957 (= (arr!11006 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4452)) mapDefault!15957)))))

(declare-fun b!389067 () Bool)

(declare-fun res!222507 () Bool)

(assert (=> b!389067 (=> (not res!222507) (not e!235729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389067 (= res!222507 (validKeyInArray!0 k0!778))))

(declare-fun b!389068 () Bool)

(declare-fun res!222502 () Bool)

(assert (=> b!389068 (=> (not res!222502) (not e!235729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23077 (_ BitVec 32)) Bool)

(assert (=> b!389068 (= res!222502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!222508 () Bool)

(assert (=> start!37860 (=> (not res!222508) (not e!235729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37860 (= res!222508 (validMask!0 mask!970))))

(assert (=> start!37860 e!235729))

(declare-fun array_inv!8092 (array!23079) Bool)

(assert (=> start!37860 (and (array_inv!8092 _values!506) e!235735)))

(assert (=> start!37860 tp!31515))

(assert (=> start!37860 true))

(declare-fun tp_is_empty!9591 () Bool)

(assert (=> start!37860 tp_is_empty!9591))

(declare-fun array_inv!8093 (array!23077) Bool)

(assert (=> start!37860 (array_inv!8093 _keys!658)))

(declare-fun b!389069 () Bool)

(declare-fun res!222509 () Bool)

(assert (=> b!389069 (=> (not res!222509) (not e!235729))))

(declare-fun arrayContainsKey!0 (array!23077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389069 (= res!222509 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389070 () Bool)

(declare-fun res!222505 () Bool)

(assert (=> b!389070 (=> (not res!222505) (not e!235729))))

(assert (=> b!389070 (= res!222505 (and (= (size!11358 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11357 _keys!658) (size!11358 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun lt!182821 () tuple2!6510)

(declare-fun lt!182827 () tuple2!6510)

(declare-fun e!235732 () Bool)

(declare-fun b!389071 () Bool)

(assert (=> b!389071 (= e!235732 (= lt!182826 (+!1022 (+!1022 lt!182822 lt!182821) lt!182827)))))

(declare-fun b!389072 () Bool)

(declare-fun res!222510 () Bool)

(assert (=> b!389072 (=> (not res!222510) (not e!235729))))

(declare-datatypes ((List!6364 0))(
  ( (Nil!6361) (Cons!6360 (h!7216 (_ BitVec 64)) (t!11518 List!6364)) )
))
(declare-fun arrayNoDuplicates!0 (array!23077 (_ BitVec 32) List!6364) Bool)

(assert (=> b!389072 (= res!222510 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6361))))

(declare-fun b!389073 () Bool)

(assert (=> b!389073 (= e!235729 e!235733)))

(declare-fun res!222501 () Bool)

(assert (=> b!389073 (=> (not res!222501) (not e!235733))))

(assert (=> b!389073 (= res!222501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182823 mask!970))))

(assert (=> b!389073 (= lt!182823 (array!23078 (store (arr!11005 _keys!658) i!548 k0!778) (size!11357 _keys!658)))))

(declare-fun b!389074 () Bool)

(assert (=> b!389074 (= e!235731 (= lt!182819 (+!1022 (+!1022 lt!182820 lt!182821) lt!182827)))))

(assert (=> b!389074 e!235732))

(declare-fun res!222503 () Bool)

(assert (=> b!389074 (=> (not res!222503) (not e!235732))))

(assert (=> b!389074 (= res!222503 (= lt!182819 (+!1022 (+!1022 lt!182824 lt!182821) lt!182827)))))

(assert (=> b!389074 (= lt!182827 (tuple2!6511 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389074 (= lt!182821 (tuple2!6511 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!389075 () Bool)

(declare-fun res!222512 () Bool)

(assert (=> b!389075 (=> (not res!222512) (not e!235733))))

(assert (=> b!389075 (= res!222512 (arrayNoDuplicates!0 lt!182823 #b00000000000000000000000000000000 Nil!6361))))

(declare-fun b!389076 () Bool)

(declare-fun e!235736 () Bool)

(assert (=> b!389076 (= e!235736 tp_is_empty!9591)))

(declare-fun mapNonEmpty!15957 () Bool)

(declare-fun tp!31514 () Bool)

(assert (=> mapNonEmpty!15957 (= mapRes!15957 (and tp!31514 e!235736))))

(declare-fun mapValue!15957 () ValueCell!4452)

(declare-fun mapRest!15957 () (Array (_ BitVec 32) ValueCell!4452))

(declare-fun mapKey!15957 () (_ BitVec 32))

(assert (=> mapNonEmpty!15957 (= (arr!11006 _values!506) (store mapRest!15957 mapKey!15957 mapValue!15957))))

(declare-fun b!389077 () Bool)

(assert (=> b!389077 (= e!235730 tp_is_empty!9591)))

(assert (= (and start!37860 res!222508) b!389070))

(assert (= (and b!389070 res!222505) b!389068))

(assert (= (and b!389068 res!222502) b!389072))

(assert (= (and b!389072 res!222510) b!389063))

(assert (= (and b!389063 res!222511) b!389067))

(assert (= (and b!389067 res!222507) b!389064))

(assert (= (and b!389064 res!222504) b!389069))

(assert (= (and b!389069 res!222509) b!389073))

(assert (= (and b!389073 res!222501) b!389075))

(assert (= (and b!389075 res!222512) b!389065))

(assert (= (and b!389065 (not res!222506)) b!389074))

(assert (= (and b!389074 res!222503) b!389071))

(assert (= (and b!389066 condMapEmpty!15957) mapIsEmpty!15957))

(assert (= (and b!389066 (not condMapEmpty!15957)) mapNonEmpty!15957))

(get-info :version)

(assert (= (and mapNonEmpty!15957 ((_ is ValueCellFull!4452) mapValue!15957)) b!389076))

(assert (= (and b!389066 ((_ is ValueCellFull!4452) mapDefault!15957)) b!389077))

(assert (= start!37860 b!389066))

(declare-fun m!385069 () Bool)

(assert (=> b!389072 m!385069))

(declare-fun m!385071 () Bool)

(assert (=> b!389067 m!385071))

(declare-fun m!385073 () Bool)

(assert (=> b!389069 m!385073))

(declare-fun m!385075 () Bool)

(assert (=> start!37860 m!385075))

(declare-fun m!385077 () Bool)

(assert (=> start!37860 m!385077))

(declare-fun m!385079 () Bool)

(assert (=> start!37860 m!385079))

(declare-fun m!385081 () Bool)

(assert (=> b!389068 m!385081))

(declare-fun m!385083 () Bool)

(assert (=> b!389075 m!385083))

(declare-fun m!385085 () Bool)

(assert (=> b!389073 m!385085))

(declare-fun m!385087 () Bool)

(assert (=> b!389073 m!385087))

(declare-fun m!385089 () Bool)

(assert (=> mapNonEmpty!15957 m!385089))

(declare-fun m!385091 () Bool)

(assert (=> b!389074 m!385091))

(assert (=> b!389074 m!385091))

(declare-fun m!385093 () Bool)

(assert (=> b!389074 m!385093))

(declare-fun m!385095 () Bool)

(assert (=> b!389074 m!385095))

(assert (=> b!389074 m!385095))

(declare-fun m!385097 () Bool)

(assert (=> b!389074 m!385097))

(declare-fun m!385099 () Bool)

(assert (=> b!389071 m!385099))

(assert (=> b!389071 m!385099))

(declare-fun m!385101 () Bool)

(assert (=> b!389071 m!385101))

(declare-fun m!385103 () Bool)

(assert (=> b!389064 m!385103))

(declare-fun m!385105 () Bool)

(assert (=> b!389065 m!385105))

(declare-fun m!385107 () Bool)

(assert (=> b!389065 m!385107))

(declare-fun m!385109 () Bool)

(assert (=> b!389065 m!385109))

(declare-fun m!385111 () Bool)

(assert (=> b!389065 m!385111))

(declare-fun m!385113 () Bool)

(assert (=> b!389065 m!385113))

(declare-fun m!385115 () Bool)

(assert (=> b!389065 m!385115))

(declare-fun m!385117 () Bool)

(assert (=> b!389065 m!385117))

(check-sat (not b!389074) (not b!389073) (not b!389075) b_and!16185 (not mapNonEmpty!15957) (not b!389071) tp_is_empty!9591 (not b_next!8919) (not b!389067) (not b!389065) (not b!389068) (not start!37860) (not b!389072) (not b!389069))
(check-sat b_and!16185 (not b_next!8919))
