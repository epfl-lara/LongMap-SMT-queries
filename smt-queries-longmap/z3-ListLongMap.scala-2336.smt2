; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37464 () Bool)

(assert start!37464)

(declare-fun b_free!8605 () Bool)

(declare-fun b_next!8605 () Bool)

(assert (=> start!37464 (= b_free!8605 (not b_next!8605))))

(declare-fun tp!30531 () Bool)

(declare-fun b_and!15861 () Bool)

(assert (=> start!37464 (= tp!30531 b_and!15861)))

(declare-fun b!381933 () Bool)

(declare-fun res!217165 () Bool)

(declare-fun e!232146 () Bool)

(assert (=> b!381933 (=> (not res!217165) (not e!232146))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13443 0))(
  ( (V!13444 (val!4671 Int)) )
))
(declare-datatypes ((ValueCell!4283 0))(
  ( (ValueCellFull!4283 (v!6869 V!13443)) (EmptyCell!4283) )
))
(declare-datatypes ((array!22404 0))(
  ( (array!22405 (arr!10670 (Array (_ BitVec 32) ValueCell!4283)) (size!11022 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22404)

(declare-datatypes ((array!22406 0))(
  ( (array!22407 (arr!10671 (Array (_ BitVec 32) (_ BitVec 64))) (size!11023 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22406)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!381933 (= res!217165 (and (= (size!11022 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11023 _keys!658) (size!11022 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381934 () Bool)

(declare-fun e!232143 () Bool)

(declare-fun tp_is_empty!9253 () Bool)

(assert (=> b!381934 (= e!232143 tp_is_empty!9253)))

(declare-fun b!381936 () Bool)

(declare-fun res!217168 () Bool)

(assert (=> b!381936 (=> (not res!217168) (not e!232146))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381936 (= res!217168 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381937 () Bool)

(declare-fun res!217167 () Bool)

(assert (=> b!381937 (=> (not res!217167) (not e!232146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381937 (= res!217167 (validKeyInArray!0 k0!778))))

(declare-fun b!381938 () Bool)

(declare-fun res!217163 () Bool)

(assert (=> b!381938 (=> (not res!217163) (not e!232146))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381938 (= res!217163 (or (= (select (arr!10671 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10671 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381939 () Bool)

(declare-fun res!217162 () Bool)

(assert (=> b!381939 (=> (not res!217162) (not e!232146))))

(assert (=> b!381939 (= res!217162 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11023 _keys!658))))))

(declare-fun mapNonEmpty!15444 () Bool)

(declare-fun mapRes!15444 () Bool)

(declare-fun tp!30530 () Bool)

(declare-fun e!232141 () Bool)

(assert (=> mapNonEmpty!15444 (= mapRes!15444 (and tp!30530 e!232141))))

(declare-fun mapRest!15444 () (Array (_ BitVec 32) ValueCell!4283))

(declare-fun mapKey!15444 () (_ BitVec 32))

(declare-fun mapValue!15444 () ValueCell!4283)

(assert (=> mapNonEmpty!15444 (= (arr!10670 _values!506) (store mapRest!15444 mapKey!15444 mapValue!15444))))

(declare-fun b!381940 () Bool)

(declare-fun e!232144 () Bool)

(assert (=> b!381940 (= e!232144 true)))

(declare-datatypes ((tuple2!6152 0))(
  ( (tuple2!6153 (_1!3087 (_ BitVec 64)) (_2!3087 V!13443)) )
))
(declare-datatypes ((List!5987 0))(
  ( (Nil!5984) (Cons!5983 (h!6839 tuple2!6152) (t!11129 List!5987)) )
))
(declare-datatypes ((ListLongMap!5067 0))(
  ( (ListLongMap!5068 (toList!2549 List!5987)) )
))
(declare-fun lt!179147 () ListLongMap!5067)

(declare-fun lt!179150 () ListLongMap!5067)

(assert (=> b!381940 (= lt!179147 lt!179150)))

(declare-fun res!217164 () Bool)

(assert (=> start!37464 (=> (not res!217164) (not e!232146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37464 (= res!217164 (validMask!0 mask!970))))

(assert (=> start!37464 e!232146))

(declare-fun e!232140 () Bool)

(declare-fun array_inv!7896 (array!22404) Bool)

(assert (=> start!37464 (and (array_inv!7896 _values!506) e!232140)))

(assert (=> start!37464 tp!30531))

(assert (=> start!37464 true))

(assert (=> start!37464 tp_is_empty!9253))

(declare-fun array_inv!7897 (array!22406) Bool)

(assert (=> start!37464 (array_inv!7897 _keys!658)))

(declare-fun b!381935 () Bool)

(assert (=> b!381935 (= e!232141 tp_is_empty!9253)))

(declare-fun b!381941 () Bool)

(declare-fun res!217172 () Bool)

(assert (=> b!381941 (=> (not res!217172) (not e!232146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22406 (_ BitVec 32)) Bool)

(assert (=> b!381941 (= res!217172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381942 () Bool)

(assert (=> b!381942 (= e!232140 (and e!232143 mapRes!15444))))

(declare-fun condMapEmpty!15444 () Bool)

(declare-fun mapDefault!15444 () ValueCell!4283)

(assert (=> b!381942 (= condMapEmpty!15444 (= (arr!10670 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4283)) mapDefault!15444)))))

(declare-fun b!381943 () Bool)

(declare-fun e!232142 () Bool)

(assert (=> b!381943 (= e!232142 (not e!232144))))

(declare-fun res!217166 () Bool)

(assert (=> b!381943 (=> res!217166 e!232144)))

(declare-fun lt!179154 () Bool)

(assert (=> b!381943 (= res!217166 (or (and (not lt!179154) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179154) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179154)))))

(assert (=> b!381943 (= lt!179154 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13443)

(declare-fun lt!179148 () ListLongMap!5067)

(declare-fun minValue!472 () V!13443)

(declare-fun getCurrentListMap!1986 (array!22406 array!22404 (_ BitVec 32) (_ BitVec 32) V!13443 V!13443 (_ BitVec 32) Int) ListLongMap!5067)

(assert (=> b!381943 (= lt!179148 (getCurrentListMap!1986 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179152 () array!22406)

(declare-fun lt!179149 () array!22404)

(assert (=> b!381943 (= lt!179147 (getCurrentListMap!1986 lt!179152 lt!179149 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179153 () ListLongMap!5067)

(assert (=> b!381943 (and (= lt!179150 lt!179153) (= lt!179153 lt!179150))))

(declare-fun v!373 () V!13443)

(declare-fun lt!179151 () ListLongMap!5067)

(declare-fun +!944 (ListLongMap!5067 tuple2!6152) ListLongMap!5067)

(assert (=> b!381943 (= lt!179153 (+!944 lt!179151 (tuple2!6153 k0!778 v!373)))))

(declare-datatypes ((Unit!11767 0))(
  ( (Unit!11768) )
))
(declare-fun lt!179155 () Unit!11767)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!173 (array!22406 array!22404 (_ BitVec 32) (_ BitVec 32) V!13443 V!13443 (_ BitVec 32) (_ BitVec 64) V!13443 (_ BitVec 32) Int) Unit!11767)

(assert (=> b!381943 (= lt!179155 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!173 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!833 (array!22406 array!22404 (_ BitVec 32) (_ BitVec 32) V!13443 V!13443 (_ BitVec 32) Int) ListLongMap!5067)

(assert (=> b!381943 (= lt!179150 (getCurrentListMapNoExtraKeys!833 lt!179152 lt!179149 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381943 (= lt!179149 (array!22405 (store (arr!10670 _values!506) i!548 (ValueCellFull!4283 v!373)) (size!11022 _values!506)))))

(assert (=> b!381943 (= lt!179151 (getCurrentListMapNoExtraKeys!833 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381944 () Bool)

(declare-fun res!217169 () Bool)

(assert (=> b!381944 (=> (not res!217169) (not e!232146))))

(declare-datatypes ((List!5988 0))(
  ( (Nil!5985) (Cons!5984 (h!6840 (_ BitVec 64)) (t!11130 List!5988)) )
))
(declare-fun arrayNoDuplicates!0 (array!22406 (_ BitVec 32) List!5988) Bool)

(assert (=> b!381944 (= res!217169 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5985))))

(declare-fun b!381945 () Bool)

(declare-fun res!217170 () Bool)

(assert (=> b!381945 (=> (not res!217170) (not e!232142))))

(assert (=> b!381945 (= res!217170 (arrayNoDuplicates!0 lt!179152 #b00000000000000000000000000000000 Nil!5985))))

(declare-fun b!381946 () Bool)

(assert (=> b!381946 (= e!232146 e!232142)))

(declare-fun res!217171 () Bool)

(assert (=> b!381946 (=> (not res!217171) (not e!232142))))

(assert (=> b!381946 (= res!217171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179152 mask!970))))

(assert (=> b!381946 (= lt!179152 (array!22407 (store (arr!10671 _keys!658) i!548 k0!778) (size!11023 _keys!658)))))

(declare-fun mapIsEmpty!15444 () Bool)

(assert (=> mapIsEmpty!15444 mapRes!15444))

(assert (= (and start!37464 res!217164) b!381933))

(assert (= (and b!381933 res!217165) b!381941))

(assert (= (and b!381941 res!217172) b!381944))

(assert (= (and b!381944 res!217169) b!381939))

(assert (= (and b!381939 res!217162) b!381937))

(assert (= (and b!381937 res!217167) b!381938))

(assert (= (and b!381938 res!217163) b!381936))

(assert (= (and b!381936 res!217168) b!381946))

(assert (= (and b!381946 res!217171) b!381945))

(assert (= (and b!381945 res!217170) b!381943))

(assert (= (and b!381943 (not res!217166)) b!381940))

(assert (= (and b!381942 condMapEmpty!15444) mapIsEmpty!15444))

(assert (= (and b!381942 (not condMapEmpty!15444)) mapNonEmpty!15444))

(get-info :version)

(assert (= (and mapNonEmpty!15444 ((_ is ValueCellFull!4283) mapValue!15444)) b!381935))

(assert (= (and b!381942 ((_ is ValueCellFull!4283) mapDefault!15444)) b!381934))

(assert (= start!37464 b!381942))

(declare-fun m!379079 () Bool)

(assert (=> b!381946 m!379079))

(declare-fun m!379081 () Bool)

(assert (=> b!381946 m!379081))

(declare-fun m!379083 () Bool)

(assert (=> start!37464 m!379083))

(declare-fun m!379085 () Bool)

(assert (=> start!37464 m!379085))

(declare-fun m!379087 () Bool)

(assert (=> start!37464 m!379087))

(declare-fun m!379089 () Bool)

(assert (=> b!381945 m!379089))

(declare-fun m!379091 () Bool)

(assert (=> b!381944 m!379091))

(declare-fun m!379093 () Bool)

(assert (=> b!381941 m!379093))

(declare-fun m!379095 () Bool)

(assert (=> b!381937 m!379095))

(declare-fun m!379097 () Bool)

(assert (=> b!381943 m!379097))

(declare-fun m!379099 () Bool)

(assert (=> b!381943 m!379099))

(declare-fun m!379101 () Bool)

(assert (=> b!381943 m!379101))

(declare-fun m!379103 () Bool)

(assert (=> b!381943 m!379103))

(declare-fun m!379105 () Bool)

(assert (=> b!381943 m!379105))

(declare-fun m!379107 () Bool)

(assert (=> b!381943 m!379107))

(declare-fun m!379109 () Bool)

(assert (=> b!381943 m!379109))

(declare-fun m!379111 () Bool)

(assert (=> b!381936 m!379111))

(declare-fun m!379113 () Bool)

(assert (=> b!381938 m!379113))

(declare-fun m!379115 () Bool)

(assert (=> mapNonEmpty!15444 m!379115))

(check-sat (not b!381944) (not b!381937) (not b!381945) (not mapNonEmpty!15444) (not b_next!8605) (not b!381946) b_and!15861 (not b!381936) tp_is_empty!9253 (not b!381941) (not b!381943) (not start!37464))
(check-sat b_and!15861 (not b_next!8605))
