; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37524 () Bool)

(assert start!37524)

(declare-fun b_free!8665 () Bool)

(declare-fun b_next!8665 () Bool)

(assert (=> start!37524 (= b_free!8665 (not b_next!8665))))

(declare-fun tp!30711 () Bool)

(declare-fun b_and!15921 () Bool)

(assert (=> start!37524 (= tp!30711 b_and!15921)))

(declare-fun b!383193 () Bool)

(declare-fun res!218161 () Bool)

(declare-fun e!232775 () Bool)

(assert (=> b!383193 (=> (not res!218161) (not e!232775))))

(declare-datatypes ((array!22522 0))(
  ( (array!22523 (arr!10729 (Array (_ BitVec 32) (_ BitVec 64))) (size!11081 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22522)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383193 (= res!218161 (or (= (select (arr!10729 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10729 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!218160 () Bool)

(assert (=> start!37524 (=> (not res!218160) (not e!232775))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37524 (= res!218160 (validMask!0 mask!970))))

(assert (=> start!37524 e!232775))

(declare-datatypes ((V!13523 0))(
  ( (V!13524 (val!4701 Int)) )
))
(declare-datatypes ((ValueCell!4313 0))(
  ( (ValueCellFull!4313 (v!6899 V!13523)) (EmptyCell!4313) )
))
(declare-datatypes ((array!22524 0))(
  ( (array!22525 (arr!10730 (Array (_ BitVec 32) ValueCell!4313)) (size!11082 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22524)

(declare-fun e!232774 () Bool)

(declare-fun array_inv!7938 (array!22524) Bool)

(assert (=> start!37524 (and (array_inv!7938 _values!506) e!232774)))

(assert (=> start!37524 tp!30711))

(assert (=> start!37524 true))

(declare-fun tp_is_empty!9313 () Bool)

(assert (=> start!37524 tp_is_empty!9313))

(declare-fun array_inv!7939 (array!22522) Bool)

(assert (=> start!37524 (array_inv!7939 _keys!658)))

(declare-fun mapNonEmpty!15534 () Bool)

(declare-fun mapRes!15534 () Bool)

(declare-fun tp!30710 () Bool)

(declare-fun e!232773 () Bool)

(assert (=> mapNonEmpty!15534 (= mapRes!15534 (and tp!30710 e!232773))))

(declare-fun mapRest!15534 () (Array (_ BitVec 32) ValueCell!4313))

(declare-fun mapValue!15534 () ValueCell!4313)

(declare-fun mapKey!15534 () (_ BitVec 32))

(assert (=> mapNonEmpty!15534 (= (arr!10730 _values!506) (store mapRest!15534 mapKey!15534 mapValue!15534))))

(declare-fun b!383194 () Bool)

(declare-fun res!218157 () Bool)

(assert (=> b!383194 (=> (not res!218157) (not e!232775))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383194 (= res!218157 (validKeyInArray!0 k0!778))))

(declare-fun b!383195 () Bool)

(declare-fun res!218154 () Bool)

(assert (=> b!383195 (=> (not res!218154) (not e!232775))))

(declare-fun arrayContainsKey!0 (array!22522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383195 (= res!218154 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383196 () Bool)

(declare-fun e!232776 () Bool)

(assert (=> b!383196 (= e!232776 tp_is_empty!9313)))

(declare-fun b!383197 () Bool)

(declare-fun res!218153 () Bool)

(assert (=> b!383197 (=> (not res!218153) (not e!232775))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383197 (= res!218153 (and (= (size!11082 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11081 _keys!658) (size!11082 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383198 () Bool)

(declare-fun res!218155 () Bool)

(assert (=> b!383198 (=> (not res!218155) (not e!232775))))

(assert (=> b!383198 (= res!218155 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11081 _keys!658))))))

(declare-fun b!383199 () Bool)

(declare-fun res!218159 () Bool)

(assert (=> b!383199 (=> (not res!218159) (not e!232775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22522 (_ BitVec 32)) Bool)

(assert (=> b!383199 (= res!218159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383200 () Bool)

(declare-fun res!218158 () Bool)

(assert (=> b!383200 (=> (not res!218158) (not e!232775))))

(declare-datatypes ((List!6036 0))(
  ( (Nil!6033) (Cons!6032 (h!6888 (_ BitVec 64)) (t!11178 List!6036)) )
))
(declare-fun arrayNoDuplicates!0 (array!22522 (_ BitVec 32) List!6036) Bool)

(assert (=> b!383200 (= res!218158 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6033))))

(declare-fun b!383201 () Bool)

(declare-fun e!232772 () Bool)

(assert (=> b!383201 (= e!232775 e!232772)))

(declare-fun res!218152 () Bool)

(assert (=> b!383201 (=> (not res!218152) (not e!232772))))

(declare-fun lt!179986 () array!22522)

(assert (=> b!383201 (= res!218152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179986 mask!970))))

(assert (=> b!383201 (= lt!179986 (array!22523 (store (arr!10729 _keys!658) i!548 k0!778) (size!11081 _keys!658)))))

(declare-fun b!383202 () Bool)

(assert (=> b!383202 (= e!232774 (and e!232776 mapRes!15534))))

(declare-fun condMapEmpty!15534 () Bool)

(declare-fun mapDefault!15534 () ValueCell!4313)

(assert (=> b!383202 (= condMapEmpty!15534 (= (arr!10730 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4313)) mapDefault!15534)))))

(declare-fun b!383203 () Bool)

(declare-fun res!218156 () Bool)

(assert (=> b!383203 (=> (not res!218156) (not e!232772))))

(assert (=> b!383203 (= res!218156 (arrayNoDuplicates!0 lt!179986 #b00000000000000000000000000000000 Nil!6033))))

(declare-fun mapIsEmpty!15534 () Bool)

(assert (=> mapIsEmpty!15534 mapRes!15534))

(declare-fun b!383204 () Bool)

(declare-fun e!232770 () Bool)

(assert (=> b!383204 (= e!232770 true)))

(declare-datatypes ((tuple2!6200 0))(
  ( (tuple2!6201 (_1!3111 (_ BitVec 64)) (_2!3111 V!13523)) )
))
(declare-datatypes ((List!6037 0))(
  ( (Nil!6034) (Cons!6033 (h!6889 tuple2!6200) (t!11179 List!6037)) )
))
(declare-datatypes ((ListLongMap!5115 0))(
  ( (ListLongMap!5116 (toList!2573 List!6037)) )
))
(declare-fun lt!179979 () ListLongMap!5115)

(declare-fun lt!179980 () ListLongMap!5115)

(declare-fun lt!179988 () tuple2!6200)

(declare-fun +!965 (ListLongMap!5115 tuple2!6200) ListLongMap!5115)

(assert (=> b!383204 (= lt!179979 (+!965 lt!179980 lt!179988))))

(declare-fun lt!179985 () ListLongMap!5115)

(declare-fun lt!179989 () ListLongMap!5115)

(assert (=> b!383204 (= lt!179985 lt!179989)))

(declare-fun b!383205 () Bool)

(assert (=> b!383205 (= e!232773 tp_is_empty!9313)))

(declare-fun b!383206 () Bool)

(assert (=> b!383206 (= e!232772 (not e!232770))))

(declare-fun res!218162 () Bool)

(assert (=> b!383206 (=> res!218162 e!232770)))

(declare-fun lt!179983 () Bool)

(assert (=> b!383206 (= res!218162 (or (and (not lt!179983) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179983) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179983)))))

(assert (=> b!383206 (= lt!179983 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!472 () V!13523)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13523)

(declare-fun getCurrentListMap!2006 (array!22522 array!22524 (_ BitVec 32) (_ BitVec 32) V!13523 V!13523 (_ BitVec 32) Int) ListLongMap!5115)

(assert (=> b!383206 (= lt!179980 (getCurrentListMap!2006 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179984 () array!22524)

(assert (=> b!383206 (= lt!179985 (getCurrentListMap!2006 lt!179986 lt!179984 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179982 () ListLongMap!5115)

(assert (=> b!383206 (and (= lt!179989 lt!179982) (= lt!179982 lt!179989))))

(declare-fun lt!179981 () ListLongMap!5115)

(assert (=> b!383206 (= lt!179982 (+!965 lt!179981 lt!179988))))

(declare-fun v!373 () V!13523)

(assert (=> b!383206 (= lt!179988 (tuple2!6201 k0!778 v!373))))

(declare-datatypes ((Unit!11807 0))(
  ( (Unit!11808) )
))
(declare-fun lt!179987 () Unit!11807)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!193 (array!22522 array!22524 (_ BitVec 32) (_ BitVec 32) V!13523 V!13523 (_ BitVec 32) (_ BitVec 64) V!13523 (_ BitVec 32) Int) Unit!11807)

(assert (=> b!383206 (= lt!179987 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!193 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!853 (array!22522 array!22524 (_ BitVec 32) (_ BitVec 32) V!13523 V!13523 (_ BitVec 32) Int) ListLongMap!5115)

(assert (=> b!383206 (= lt!179989 (getCurrentListMapNoExtraKeys!853 lt!179986 lt!179984 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383206 (= lt!179984 (array!22525 (store (arr!10730 _values!506) i!548 (ValueCellFull!4313 v!373)) (size!11082 _values!506)))))

(assert (=> b!383206 (= lt!179981 (getCurrentListMapNoExtraKeys!853 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37524 res!218160) b!383197))

(assert (= (and b!383197 res!218153) b!383199))

(assert (= (and b!383199 res!218159) b!383200))

(assert (= (and b!383200 res!218158) b!383198))

(assert (= (and b!383198 res!218155) b!383194))

(assert (= (and b!383194 res!218157) b!383193))

(assert (= (and b!383193 res!218161) b!383195))

(assert (= (and b!383195 res!218154) b!383201))

(assert (= (and b!383201 res!218152) b!383203))

(assert (= (and b!383203 res!218156) b!383206))

(assert (= (and b!383206 (not res!218162)) b!383204))

(assert (= (and b!383202 condMapEmpty!15534) mapIsEmpty!15534))

(assert (= (and b!383202 (not condMapEmpty!15534)) mapNonEmpty!15534))

(get-info :version)

(assert (= (and mapNonEmpty!15534 ((_ is ValueCellFull!4313) mapValue!15534)) b!383205))

(assert (= (and b!383202 ((_ is ValueCellFull!4313) mapDefault!15534)) b!383196))

(assert (= start!37524 b!383202))

(declare-fun m!380225 () Bool)

(assert (=> b!383206 m!380225))

(declare-fun m!380227 () Bool)

(assert (=> b!383206 m!380227))

(declare-fun m!380229 () Bool)

(assert (=> b!383206 m!380229))

(declare-fun m!380231 () Bool)

(assert (=> b!383206 m!380231))

(declare-fun m!380233 () Bool)

(assert (=> b!383206 m!380233))

(declare-fun m!380235 () Bool)

(assert (=> b!383206 m!380235))

(declare-fun m!380237 () Bool)

(assert (=> b!383206 m!380237))

(declare-fun m!380239 () Bool)

(assert (=> b!383204 m!380239))

(declare-fun m!380241 () Bool)

(assert (=> b!383195 m!380241))

(declare-fun m!380243 () Bool)

(assert (=> b!383203 m!380243))

(declare-fun m!380245 () Bool)

(assert (=> b!383194 m!380245))

(declare-fun m!380247 () Bool)

(assert (=> b!383193 m!380247))

(declare-fun m!380249 () Bool)

(assert (=> b!383201 m!380249))

(declare-fun m!380251 () Bool)

(assert (=> b!383201 m!380251))

(declare-fun m!380253 () Bool)

(assert (=> b!383199 m!380253))

(declare-fun m!380255 () Bool)

(assert (=> b!383200 m!380255))

(declare-fun m!380257 () Bool)

(assert (=> mapNonEmpty!15534 m!380257))

(declare-fun m!380259 () Bool)

(assert (=> start!37524 m!380259))

(declare-fun m!380261 () Bool)

(assert (=> start!37524 m!380261))

(declare-fun m!380263 () Bool)

(assert (=> start!37524 m!380263))

(check-sat (not mapNonEmpty!15534) (not b!383199) (not b!383201) (not b!383195) (not start!37524) (not b!383206) (not b!383194) tp_is_empty!9313 (not b!383204) (not b_next!8665) (not b!383200) b_and!15921 (not b!383203))
(check-sat b_and!15921 (not b_next!8665))
