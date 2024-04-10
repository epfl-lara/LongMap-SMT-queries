; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36982 () Bool)

(assert start!36982)

(declare-fun b_free!8109 () Bool)

(declare-fun b_next!8109 () Bool)

(assert (=> start!36982 (= b_free!8109 (not b_next!8109))))

(declare-fun tp!29043 () Bool)

(declare-fun b_and!15351 () Bool)

(assert (=> start!36982 (= tp!29043 b_and!15351)))

(declare-fun b!371165 () Bool)

(declare-fun res!208588 () Bool)

(declare-fun e!226590 () Bool)

(assert (=> b!371165 (=> (not res!208588) (not e!226590))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21457 0))(
  ( (array!21458 (arr!10197 (Array (_ BitVec 32) (_ BitVec 64))) (size!10549 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21457)

(assert (=> b!371165 (= res!208588 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10549 _keys!658))))))

(declare-fun b!371166 () Bool)

(declare-fun res!208580 () Bool)

(assert (=> b!371166 (=> (not res!208580) (not e!226590))))

(assert (=> b!371166 (= res!208580 (or (= (select (arr!10197 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10197 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371167 () Bool)

(declare-fun e!226593 () Bool)

(declare-fun e!226595 () Bool)

(declare-fun mapRes!14700 () Bool)

(assert (=> b!371167 (= e!226593 (and e!226595 mapRes!14700))))

(declare-fun condMapEmpty!14700 () Bool)

(declare-datatypes ((V!12781 0))(
  ( (V!12782 (val!4423 Int)) )
))
(declare-datatypes ((ValueCell!4035 0))(
  ( (ValueCellFull!4035 (v!6620 V!12781)) (EmptyCell!4035) )
))
(declare-datatypes ((array!21459 0))(
  ( (array!21460 (arr!10198 (Array (_ BitVec 32) ValueCell!4035)) (size!10550 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21459)

(declare-fun mapDefault!14700 () ValueCell!4035)

(assert (=> b!371167 (= condMapEmpty!14700 (= (arr!10198 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4035)) mapDefault!14700)))))

(declare-fun mapIsEmpty!14700 () Bool)

(assert (=> mapIsEmpty!14700 mapRes!14700))

(declare-fun res!208582 () Bool)

(assert (=> start!36982 (=> (not res!208582) (not e!226590))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36982 (= res!208582 (validMask!0 mask!970))))

(assert (=> start!36982 e!226590))

(declare-fun array_inv!7530 (array!21459) Bool)

(assert (=> start!36982 (and (array_inv!7530 _values!506) e!226593)))

(assert (=> start!36982 tp!29043))

(assert (=> start!36982 true))

(declare-fun tp_is_empty!8757 () Bool)

(assert (=> start!36982 tp_is_empty!8757))

(declare-fun array_inv!7531 (array!21457) Bool)

(assert (=> start!36982 (array_inv!7531 _keys!658)))

(declare-fun b!371168 () Bool)

(declare-fun res!208589 () Bool)

(declare-fun e!226592 () Bool)

(assert (=> b!371168 (=> (not res!208589) (not e!226592))))

(declare-fun lt!170183 () array!21457)

(declare-datatypes ((List!5707 0))(
  ( (Nil!5704) (Cons!5703 (h!6559 (_ BitVec 64)) (t!10857 List!5707)) )
))
(declare-fun arrayNoDuplicates!0 (array!21457 (_ BitVec 32) List!5707) Bool)

(assert (=> b!371168 (= res!208589 (arrayNoDuplicates!0 lt!170183 #b00000000000000000000000000000000 Nil!5704))))

(declare-fun b!371169 () Bool)

(declare-fun res!208583 () Bool)

(assert (=> b!371169 (=> (not res!208583) (not e!226590))))

(assert (=> b!371169 (= res!208583 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5704))))

(declare-fun b!371170 () Bool)

(declare-fun res!208586 () Bool)

(assert (=> b!371170 (=> (not res!208586) (not e!226590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21457 (_ BitVec 32)) Bool)

(assert (=> b!371170 (= res!208586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371171 () Bool)

(declare-fun e!226591 () Bool)

(assert (=> b!371171 (= e!226591 tp_is_empty!8757)))

(declare-fun mapNonEmpty!14700 () Bool)

(declare-fun tp!29042 () Bool)

(assert (=> mapNonEmpty!14700 (= mapRes!14700 (and tp!29042 e!226591))))

(declare-fun mapKey!14700 () (_ BitVec 32))

(declare-fun mapValue!14700 () ValueCell!4035)

(declare-fun mapRest!14700 () (Array (_ BitVec 32) ValueCell!4035))

(assert (=> mapNonEmpty!14700 (= (arr!10198 _values!506) (store mapRest!14700 mapKey!14700 mapValue!14700))))

(declare-fun b!371172 () Bool)

(declare-fun res!208581 () Bool)

(assert (=> b!371172 (=> (not res!208581) (not e!226590))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371172 (= res!208581 (validKeyInArray!0 k0!778))))

(declare-fun b!371173 () Bool)

(declare-fun res!208585 () Bool)

(assert (=> b!371173 (=> (not res!208585) (not e!226590))))

(declare-fun arrayContainsKey!0 (array!21457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371173 (= res!208585 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371174 () Bool)

(declare-fun res!208584 () Bool)

(assert (=> b!371174 (=> (not res!208584) (not e!226590))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!371174 (= res!208584 (and (= (size!10550 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10549 _keys!658) (size!10550 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371175 () Bool)

(assert (=> b!371175 (= e!226590 e!226592)))

(declare-fun res!208587 () Bool)

(assert (=> b!371175 (=> (not res!208587) (not e!226592))))

(assert (=> b!371175 (= res!208587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170183 mask!970))))

(assert (=> b!371175 (= lt!170183 (array!21458 (store (arr!10197 _keys!658) i!548 k0!778) (size!10549 _keys!658)))))

(declare-fun b!371176 () Bool)

(assert (=> b!371176 (= e!226595 tp_is_empty!8757)))

(declare-fun b!371177 () Bool)

(assert (=> b!371177 (= e!226592 (not true))))

(declare-datatypes ((tuple2!5868 0))(
  ( (tuple2!5869 (_1!2945 (_ BitVec 64)) (_2!2945 V!12781)) )
))
(declare-datatypes ((List!5708 0))(
  ( (Nil!5705) (Cons!5704 (h!6560 tuple2!5868) (t!10858 List!5708)) )
))
(declare-datatypes ((ListLongMap!4781 0))(
  ( (ListLongMap!4782 (toList!2406 List!5708)) )
))
(declare-fun lt!170184 () ListLongMap!4781)

(declare-fun lt!170180 () ListLongMap!4781)

(assert (=> b!371177 (and (= lt!170184 lt!170180) (= lt!170180 lt!170184))))

(declare-fun v!373 () V!12781)

(declare-fun lt!170181 () ListLongMap!4781)

(declare-fun +!752 (ListLongMap!4781 tuple2!5868) ListLongMap!4781)

(assert (=> b!371177 (= lt!170180 (+!752 lt!170181 (tuple2!5869 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11410 0))(
  ( (Unit!11411) )
))
(declare-fun lt!170182 () Unit!11410)

(declare-fun zeroValue!472 () V!12781)

(declare-fun minValue!472 () V!12781)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!7 (array!21457 array!21459 (_ BitVec 32) (_ BitVec 32) V!12781 V!12781 (_ BitVec 32) (_ BitVec 64) V!12781 (_ BitVec 32) Int) Unit!11410)

(assert (=> b!371177 (= lt!170182 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!7 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!683 (array!21457 array!21459 (_ BitVec 32) (_ BitVec 32) V!12781 V!12781 (_ BitVec 32) Int) ListLongMap!4781)

(assert (=> b!371177 (= lt!170184 (getCurrentListMapNoExtraKeys!683 lt!170183 (array!21460 (store (arr!10198 _values!506) i!548 (ValueCellFull!4035 v!373)) (size!10550 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371177 (= lt!170181 (getCurrentListMapNoExtraKeys!683 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!36982 res!208582) b!371174))

(assert (= (and b!371174 res!208584) b!371170))

(assert (= (and b!371170 res!208586) b!371169))

(assert (= (and b!371169 res!208583) b!371165))

(assert (= (and b!371165 res!208588) b!371172))

(assert (= (and b!371172 res!208581) b!371166))

(assert (= (and b!371166 res!208580) b!371173))

(assert (= (and b!371173 res!208585) b!371175))

(assert (= (and b!371175 res!208587) b!371168))

(assert (= (and b!371168 res!208589) b!371177))

(assert (= (and b!371167 condMapEmpty!14700) mapIsEmpty!14700))

(assert (= (and b!371167 (not condMapEmpty!14700)) mapNonEmpty!14700))

(get-info :version)

(assert (= (and mapNonEmpty!14700 ((_ is ValueCellFull!4035) mapValue!14700)) b!371171))

(assert (= (and b!371167 ((_ is ValueCellFull!4035) mapDefault!14700)) b!371176))

(assert (= start!36982 b!371167))

(declare-fun m!367171 () Bool)

(assert (=> b!371172 m!367171))

(declare-fun m!367173 () Bool)

(assert (=> start!36982 m!367173))

(declare-fun m!367175 () Bool)

(assert (=> start!36982 m!367175))

(declare-fun m!367177 () Bool)

(assert (=> start!36982 m!367177))

(declare-fun m!367179 () Bool)

(assert (=> b!371177 m!367179))

(declare-fun m!367181 () Bool)

(assert (=> b!371177 m!367181))

(declare-fun m!367183 () Bool)

(assert (=> b!371177 m!367183))

(declare-fun m!367185 () Bool)

(assert (=> b!371177 m!367185))

(declare-fun m!367187 () Bool)

(assert (=> b!371177 m!367187))

(declare-fun m!367189 () Bool)

(assert (=> mapNonEmpty!14700 m!367189))

(declare-fun m!367191 () Bool)

(assert (=> b!371170 m!367191))

(declare-fun m!367193 () Bool)

(assert (=> b!371175 m!367193))

(declare-fun m!367195 () Bool)

(assert (=> b!371175 m!367195))

(declare-fun m!367197 () Bool)

(assert (=> b!371168 m!367197))

(declare-fun m!367199 () Bool)

(assert (=> b!371166 m!367199))

(declare-fun m!367201 () Bool)

(assert (=> b!371173 m!367201))

(declare-fun m!367203 () Bool)

(assert (=> b!371169 m!367203))

(check-sat (not b!371177) (not mapNonEmpty!14700) (not b_next!8109) b_and!15351 (not b!371170) (not b!371168) (not b!371169) (not b!371172) (not b!371173) (not start!36982) tp_is_empty!8757 (not b!371175))
(check-sat b_and!15351 (not b_next!8109))
