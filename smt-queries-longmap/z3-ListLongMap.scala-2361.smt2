; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37614 () Bool)

(assert start!37614)

(declare-fun b_free!8755 () Bool)

(declare-fun b_next!8755 () Bool)

(assert (=> start!37614 (= b_free!8755 (not b_next!8755))))

(declare-fun tp!30980 () Bool)

(declare-fun b_and!15971 () Bool)

(assert (=> start!37614 (= tp!30980 b_and!15971)))

(declare-fun b!384870 () Bool)

(declare-fun res!219528 () Bool)

(declare-fun e!233584 () Bool)

(assert (=> b!384870 (=> (not res!219528) (not e!233584))))

(declare-datatypes ((array!22693 0))(
  ( (array!22694 (arr!10815 (Array (_ BitVec 32) (_ BitVec 64))) (size!11168 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22693)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384870 (= res!219528 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384871 () Bool)

(declare-fun e!233586 () Bool)

(declare-fun e!233585 () Bool)

(declare-fun mapRes!15669 () Bool)

(assert (=> b!384871 (= e!233586 (and e!233585 mapRes!15669))))

(declare-fun condMapEmpty!15669 () Bool)

(declare-datatypes ((V!13643 0))(
  ( (V!13644 (val!4746 Int)) )
))
(declare-datatypes ((ValueCell!4358 0))(
  ( (ValueCellFull!4358 (v!6937 V!13643)) (EmptyCell!4358) )
))
(declare-datatypes ((array!22695 0))(
  ( (array!22696 (arr!10816 (Array (_ BitVec 32) ValueCell!4358)) (size!11169 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22695)

(declare-fun mapDefault!15669 () ValueCell!4358)

(assert (=> b!384871 (= condMapEmpty!15669 (= (arr!10816 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4358)) mapDefault!15669)))))

(declare-fun b!384872 () Bool)

(declare-fun e!233587 () Bool)

(declare-fun e!233582 () Bool)

(assert (=> b!384872 (= e!233587 (not e!233582))))

(declare-fun res!219520 () Bool)

(assert (=> b!384872 (=> res!219520 e!233582)))

(declare-fun lt!181211 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384872 (= res!219520 (or (and (not lt!181211) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181211) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181211)))))

(assert (=> b!384872 (= lt!181211 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6374 0))(
  ( (tuple2!6375 (_1!3198 (_ BitVec 64)) (_2!3198 V!13643)) )
))
(declare-datatypes ((List!6198 0))(
  ( (Nil!6195) (Cons!6194 (h!7050 tuple2!6374) (t!11339 List!6198)) )
))
(declare-datatypes ((ListLongMap!5277 0))(
  ( (ListLongMap!5278 (toList!2654 List!6198)) )
))
(declare-fun lt!181207 () ListLongMap!5277)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13643)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13643)

(declare-fun getCurrentListMap!2030 (array!22693 array!22695 (_ BitVec 32) (_ BitVec 32) V!13643 V!13643 (_ BitVec 32) Int) ListLongMap!5277)

(assert (=> b!384872 (= lt!181207 (getCurrentListMap!2030 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181206 () ListLongMap!5277)

(declare-fun lt!181203 () array!22695)

(declare-fun lt!181210 () array!22693)

(assert (=> b!384872 (= lt!181206 (getCurrentListMap!2030 lt!181210 lt!181203 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181205 () ListLongMap!5277)

(declare-fun lt!181202 () ListLongMap!5277)

(assert (=> b!384872 (and (= lt!181205 lt!181202) (= lt!181202 lt!181205))))

(declare-fun lt!181212 () ListLongMap!5277)

(declare-fun lt!181208 () tuple2!6374)

(declare-fun +!1011 (ListLongMap!5277 tuple2!6374) ListLongMap!5277)

(assert (=> b!384872 (= lt!181202 (+!1011 lt!181212 lt!181208))))

(declare-fun v!373 () V!13643)

(assert (=> b!384872 (= lt!181208 (tuple2!6375 k0!778 v!373))))

(declare-datatypes ((Unit!11866 0))(
  ( (Unit!11867) )
))
(declare-fun lt!181204 () Unit!11866)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!223 (array!22693 array!22695 (_ BitVec 32) (_ BitVec 32) V!13643 V!13643 (_ BitVec 32) (_ BitVec 64) V!13643 (_ BitVec 32) Int) Unit!11866)

(assert (=> b!384872 (= lt!181204 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!223 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!895 (array!22693 array!22695 (_ BitVec 32) (_ BitVec 32) V!13643 V!13643 (_ BitVec 32) Int) ListLongMap!5277)

(assert (=> b!384872 (= lt!181205 (getCurrentListMapNoExtraKeys!895 lt!181210 lt!181203 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384872 (= lt!181203 (array!22696 (store (arr!10816 _values!506) i!548 (ValueCellFull!4358 v!373)) (size!11169 _values!506)))))

(assert (=> b!384872 (= lt!181212 (getCurrentListMapNoExtraKeys!895 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384873 () Bool)

(declare-fun res!219525 () Bool)

(assert (=> b!384873 (=> (not res!219525) (not e!233584))))

(assert (=> b!384873 (= res!219525 (or (= (select (arr!10815 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10815 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384874 () Bool)

(declare-fun res!219521 () Bool)

(assert (=> b!384874 (=> (not res!219521) (not e!233584))))

(declare-datatypes ((List!6199 0))(
  ( (Nil!6196) (Cons!6195 (h!7051 (_ BitVec 64)) (t!11340 List!6199)) )
))
(declare-fun arrayNoDuplicates!0 (array!22693 (_ BitVec 32) List!6199) Bool)

(assert (=> b!384874 (= res!219521 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6196))))

(declare-fun b!384875 () Bool)

(declare-fun e!233583 () Bool)

(declare-fun tp_is_empty!9403 () Bool)

(assert (=> b!384875 (= e!233583 tp_is_empty!9403)))

(declare-fun b!384876 () Bool)

(assert (=> b!384876 (= e!233582 true)))

(declare-fun lt!181209 () ListLongMap!5277)

(assert (=> b!384876 (= lt!181209 (+!1011 lt!181207 lt!181208))))

(assert (=> b!384876 (= lt!181206 lt!181205)))

(declare-fun b!384877 () Bool)

(declare-fun res!219524 () Bool)

(assert (=> b!384877 (=> (not res!219524) (not e!233584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22693 (_ BitVec 32)) Bool)

(assert (=> b!384877 (= res!219524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!384878 () Bool)

(declare-fun res!219523 () Bool)

(assert (=> b!384878 (=> (not res!219523) (not e!233587))))

(assert (=> b!384878 (= res!219523 (arrayNoDuplicates!0 lt!181210 #b00000000000000000000000000000000 Nil!6196))))

(declare-fun b!384879 () Bool)

(declare-fun res!219526 () Bool)

(assert (=> b!384879 (=> (not res!219526) (not e!233584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384879 (= res!219526 (validKeyInArray!0 k0!778))))

(declare-fun res!219530 () Bool)

(assert (=> start!37614 (=> (not res!219530) (not e!233584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37614 (= res!219530 (validMask!0 mask!970))))

(assert (=> start!37614 e!233584))

(declare-fun array_inv!7960 (array!22695) Bool)

(assert (=> start!37614 (and (array_inv!7960 _values!506) e!233586)))

(assert (=> start!37614 tp!30980))

(assert (=> start!37614 true))

(assert (=> start!37614 tp_is_empty!9403))

(declare-fun array_inv!7961 (array!22693) Bool)

(assert (=> start!37614 (array_inv!7961 _keys!658)))

(declare-fun b!384880 () Bool)

(declare-fun res!219527 () Bool)

(assert (=> b!384880 (=> (not res!219527) (not e!233584))))

(assert (=> b!384880 (= res!219527 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11168 _keys!658))))))

(declare-fun b!384881 () Bool)

(declare-fun res!219529 () Bool)

(assert (=> b!384881 (=> (not res!219529) (not e!233584))))

(assert (=> b!384881 (= res!219529 (and (= (size!11169 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11168 _keys!658) (size!11169 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15669 () Bool)

(declare-fun tp!30981 () Bool)

(assert (=> mapNonEmpty!15669 (= mapRes!15669 (and tp!30981 e!233583))))

(declare-fun mapRest!15669 () (Array (_ BitVec 32) ValueCell!4358))

(declare-fun mapValue!15669 () ValueCell!4358)

(declare-fun mapKey!15669 () (_ BitVec 32))

(assert (=> mapNonEmpty!15669 (= (arr!10816 _values!506) (store mapRest!15669 mapKey!15669 mapValue!15669))))

(declare-fun b!384882 () Bool)

(assert (=> b!384882 (= e!233585 tp_is_empty!9403)))

(declare-fun b!384883 () Bool)

(assert (=> b!384883 (= e!233584 e!233587)))

(declare-fun res!219522 () Bool)

(assert (=> b!384883 (=> (not res!219522) (not e!233587))))

(assert (=> b!384883 (= res!219522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181210 mask!970))))

(assert (=> b!384883 (= lt!181210 (array!22694 (store (arr!10815 _keys!658) i!548 k0!778) (size!11168 _keys!658)))))

(declare-fun mapIsEmpty!15669 () Bool)

(assert (=> mapIsEmpty!15669 mapRes!15669))

(assert (= (and start!37614 res!219530) b!384881))

(assert (= (and b!384881 res!219529) b!384877))

(assert (= (and b!384877 res!219524) b!384874))

(assert (= (and b!384874 res!219521) b!384880))

(assert (= (and b!384880 res!219527) b!384879))

(assert (= (and b!384879 res!219526) b!384873))

(assert (= (and b!384873 res!219525) b!384870))

(assert (= (and b!384870 res!219528) b!384883))

(assert (= (and b!384883 res!219522) b!384878))

(assert (= (and b!384878 res!219523) b!384872))

(assert (= (and b!384872 (not res!219520)) b!384876))

(assert (= (and b!384871 condMapEmpty!15669) mapIsEmpty!15669))

(assert (= (and b!384871 (not condMapEmpty!15669)) mapNonEmpty!15669))

(get-info :version)

(assert (= (and mapNonEmpty!15669 ((_ is ValueCellFull!4358) mapValue!15669)) b!384875))

(assert (= (and b!384871 ((_ is ValueCellFull!4358) mapDefault!15669)) b!384882))

(assert (= start!37614 b!384871))

(declare-fun m!381071 () Bool)

(assert (=> b!384876 m!381071))

(declare-fun m!381073 () Bool)

(assert (=> b!384870 m!381073))

(declare-fun m!381075 () Bool)

(assert (=> b!384883 m!381075))

(declare-fun m!381077 () Bool)

(assert (=> b!384883 m!381077))

(declare-fun m!381079 () Bool)

(assert (=> b!384872 m!381079))

(declare-fun m!381081 () Bool)

(assert (=> b!384872 m!381081))

(declare-fun m!381083 () Bool)

(assert (=> b!384872 m!381083))

(declare-fun m!381085 () Bool)

(assert (=> b!384872 m!381085))

(declare-fun m!381087 () Bool)

(assert (=> b!384872 m!381087))

(declare-fun m!381089 () Bool)

(assert (=> b!384872 m!381089))

(declare-fun m!381091 () Bool)

(assert (=> b!384872 m!381091))

(declare-fun m!381093 () Bool)

(assert (=> start!37614 m!381093))

(declare-fun m!381095 () Bool)

(assert (=> start!37614 m!381095))

(declare-fun m!381097 () Bool)

(assert (=> start!37614 m!381097))

(declare-fun m!381099 () Bool)

(assert (=> b!384874 m!381099))

(declare-fun m!381101 () Bool)

(assert (=> mapNonEmpty!15669 m!381101))

(declare-fun m!381103 () Bool)

(assert (=> b!384877 m!381103))

(declare-fun m!381105 () Bool)

(assert (=> b!384879 m!381105))

(declare-fun m!381107 () Bool)

(assert (=> b!384873 m!381107))

(declare-fun m!381109 () Bool)

(assert (=> b!384878 m!381109))

(check-sat (not b!384876) (not b!384874) (not b_next!8755) (not mapNonEmpty!15669) (not b!384883) tp_is_empty!9403 (not start!37614) (not b!384870) (not b!384879) (not b!384877) b_and!15971 (not b!384872) (not b!384878))
(check-sat b_and!15971 (not b_next!8755))
