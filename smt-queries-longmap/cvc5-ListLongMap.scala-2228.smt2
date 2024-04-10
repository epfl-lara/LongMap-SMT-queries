; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36830 () Bool)

(assert start!36830)

(declare-fun b_free!7957 () Bool)

(declare-fun b_next!7957 () Bool)

(assert (=> start!36830 (= b_free!7957 (not b_next!7957))))

(declare-fun tp!28587 () Bool)

(declare-fun b_and!15199 () Bool)

(assert (=> start!36830 (= tp!28587 b_and!15199)))

(declare-fun b!368201 () Bool)

(declare-fun res!206306 () Bool)

(declare-fun e!225224 () Bool)

(assert (=> b!368201 (=> (not res!206306) (not e!225224))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21167 0))(
  ( (array!21168 (arr!10052 (Array (_ BitVec 32) (_ BitVec 64))) (size!10404 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21167)

(assert (=> b!368201 (= res!206306 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10404 _keys!658))))))

(declare-fun b!368202 () Bool)

(declare-fun res!206305 () Bool)

(assert (=> b!368202 (=> (not res!206305) (not e!225224))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21167 (_ BitVec 32)) Bool)

(assert (=> b!368202 (= res!206305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!206303 () Bool)

(assert (=> start!36830 (=> (not res!206303) (not e!225224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36830 (= res!206303 (validMask!0 mask!970))))

(assert (=> start!36830 e!225224))

(assert (=> start!36830 true))

(declare-datatypes ((V!12579 0))(
  ( (V!12580 (val!4347 Int)) )
))
(declare-datatypes ((ValueCell!3959 0))(
  ( (ValueCellFull!3959 (v!6544 V!12579)) (EmptyCell!3959) )
))
(declare-datatypes ((array!21169 0))(
  ( (array!21170 (arr!10053 (Array (_ BitVec 32) ValueCell!3959)) (size!10405 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21169)

(declare-fun e!225227 () Bool)

(declare-fun array_inv!7432 (array!21169) Bool)

(assert (=> start!36830 (and (array_inv!7432 _values!506) e!225227)))

(assert (=> start!36830 tp!28587))

(declare-fun tp_is_empty!8605 () Bool)

(assert (=> start!36830 tp_is_empty!8605))

(declare-fun array_inv!7433 (array!21167) Bool)

(assert (=> start!36830 (array_inv!7433 _keys!658)))

(declare-fun mapNonEmpty!14472 () Bool)

(declare-fun mapRes!14472 () Bool)

(declare-fun tp!28586 () Bool)

(declare-fun e!225225 () Bool)

(assert (=> mapNonEmpty!14472 (= mapRes!14472 (and tp!28586 e!225225))))

(declare-fun mapKey!14472 () (_ BitVec 32))

(declare-fun mapValue!14472 () ValueCell!3959)

(declare-fun mapRest!14472 () (Array (_ BitVec 32) ValueCell!3959))

(assert (=> mapNonEmpty!14472 (= (arr!10053 _values!506) (store mapRest!14472 mapKey!14472 mapValue!14472))))

(declare-fun b!368203 () Bool)

(declare-fun e!225226 () Bool)

(assert (=> b!368203 (= e!225226 tp_is_empty!8605)))

(declare-fun b!368204 () Bool)

(declare-fun res!206309 () Bool)

(assert (=> b!368204 (=> (not res!206309) (not e!225224))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368204 (= res!206309 (validKeyInArray!0 k!778))))

(declare-fun b!368205 () Bool)

(declare-fun e!225222 () Bool)

(assert (=> b!368205 (= e!225224 e!225222)))

(declare-fun res!206300 () Bool)

(assert (=> b!368205 (=> (not res!206300) (not e!225222))))

(declare-fun lt!169494 () array!21167)

(assert (=> b!368205 (= res!206300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169494 mask!970))))

(assert (=> b!368205 (= lt!169494 (array!21168 (store (arr!10052 _keys!658) i!548 k!778) (size!10404 _keys!658)))))

(declare-fun b!368206 () Bool)

(declare-fun res!206301 () Bool)

(assert (=> b!368206 (=> (not res!206301) (not e!225224))))

(declare-fun arrayContainsKey!0 (array!21167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368206 (= res!206301 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!368207 () Bool)

(declare-fun res!206307 () Bool)

(assert (=> b!368207 (=> (not res!206307) (not e!225224))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!368207 (= res!206307 (and (= (size!10405 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10404 _keys!658) (size!10405 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368208 () Bool)

(assert (=> b!368208 (= e!225222 false)))

(declare-datatypes ((tuple2!5758 0))(
  ( (tuple2!5759 (_1!2890 (_ BitVec 64)) (_2!2890 V!12579)) )
))
(declare-datatypes ((List!5590 0))(
  ( (Nil!5587) (Cons!5586 (h!6442 tuple2!5758) (t!10740 List!5590)) )
))
(declare-datatypes ((ListLongMap!4671 0))(
  ( (ListLongMap!4672 (toList!2351 List!5590)) )
))
(declare-fun lt!169493 () ListLongMap!4671)

(declare-fun zeroValue!472 () V!12579)

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!12579)

(declare-fun getCurrentListMapNoExtraKeys!628 (array!21167 array!21169 (_ BitVec 32) (_ BitVec 32) V!12579 V!12579 (_ BitVec 32) Int) ListLongMap!4671)

(assert (=> b!368208 (= lt!169493 (getCurrentListMapNoExtraKeys!628 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368209 () Bool)

(declare-fun res!206304 () Bool)

(assert (=> b!368209 (=> (not res!206304) (not e!225222))))

(declare-datatypes ((List!5591 0))(
  ( (Nil!5588) (Cons!5587 (h!6443 (_ BitVec 64)) (t!10741 List!5591)) )
))
(declare-fun arrayNoDuplicates!0 (array!21167 (_ BitVec 32) List!5591) Bool)

(assert (=> b!368209 (= res!206304 (arrayNoDuplicates!0 lt!169494 #b00000000000000000000000000000000 Nil!5588))))

(declare-fun b!368210 () Bool)

(assert (=> b!368210 (= e!225227 (and e!225226 mapRes!14472))))

(declare-fun condMapEmpty!14472 () Bool)

(declare-fun mapDefault!14472 () ValueCell!3959)

