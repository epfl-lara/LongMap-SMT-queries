; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36816 () Bool)

(assert start!36816)

(declare-fun b_free!7957 () Bool)

(declare-fun b_next!7957 () Bool)

(assert (=> start!36816 (= b_free!7957 (not b_next!7957))))

(declare-fun tp!28587 () Bool)

(declare-fun b_and!15173 () Bool)

(assert (=> start!36816 (= tp!28587 b_and!15173)))

(declare-fun b!367930 () Bool)

(declare-fun res!206176 () Bool)

(declare-fun e!225051 () Bool)

(assert (=> b!367930 (=> (not res!206176) (not e!225051))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367930 (= res!206176 (validKeyInArray!0 k0!778))))

(declare-fun res!206171 () Bool)

(assert (=> start!36816 (=> (not res!206171) (not e!225051))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36816 (= res!206171 (validMask!0 mask!970))))

(assert (=> start!36816 e!225051))

(assert (=> start!36816 true))

(declare-datatypes ((V!12579 0))(
  ( (V!12580 (val!4347 Int)) )
))
(declare-datatypes ((ValueCell!3959 0))(
  ( (ValueCellFull!3959 (v!6538 V!12579)) (EmptyCell!3959) )
))
(declare-datatypes ((array!21147 0))(
  ( (array!21148 (arr!10042 (Array (_ BitVec 32) ValueCell!3959)) (size!10395 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21147)

(declare-fun e!225049 () Bool)

(declare-fun array_inv!7442 (array!21147) Bool)

(assert (=> start!36816 (and (array_inv!7442 _values!506) e!225049)))

(assert (=> start!36816 tp!28587))

(declare-fun tp_is_empty!8605 () Bool)

(assert (=> start!36816 tp_is_empty!8605))

(declare-datatypes ((array!21149 0))(
  ( (array!21150 (arr!10043 (Array (_ BitVec 32) (_ BitVec 64))) (size!10396 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21149)

(declare-fun array_inv!7443 (array!21149) Bool)

(assert (=> start!36816 (array_inv!7443 _keys!658)))

(declare-fun mapNonEmpty!14472 () Bool)

(declare-fun mapRes!14472 () Bool)

(declare-fun tp!28586 () Bool)

(declare-fun e!225052 () Bool)

(assert (=> mapNonEmpty!14472 (= mapRes!14472 (and tp!28586 e!225052))))

(declare-fun mapValue!14472 () ValueCell!3959)

(declare-fun mapKey!14472 () (_ BitVec 32))

(declare-fun mapRest!14472 () (Array (_ BitVec 32) ValueCell!3959))

(assert (=> mapNonEmpty!14472 (= (arr!10042 _values!506) (store mapRest!14472 mapKey!14472 mapValue!14472))))

(declare-fun b!367931 () Bool)

(declare-fun res!206173 () Bool)

(assert (=> b!367931 (=> (not res!206173) (not e!225051))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!367931 (= res!206173 (and (= (size!10395 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10396 _keys!658) (size!10395 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367932 () Bool)

(declare-fun e!225050 () Bool)

(assert (=> b!367932 (= e!225051 e!225050)))

(declare-fun res!206172 () Bool)

(assert (=> b!367932 (=> (not res!206172) (not e!225050))))

(declare-fun lt!169260 () array!21149)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21149 (_ BitVec 32)) Bool)

(assert (=> b!367932 (= res!206172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169260 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367932 (= lt!169260 (array!21150 (store (arr!10043 _keys!658) i!548 k0!778) (size!10396 _keys!658)))))

(declare-fun b!367933 () Bool)

(declare-fun res!206177 () Bool)

(assert (=> b!367933 (=> (not res!206177) (not e!225051))))

(declare-datatypes ((List!5558 0))(
  ( (Nil!5555) (Cons!5554 (h!6410 (_ BitVec 64)) (t!10699 List!5558)) )
))
(declare-fun arrayNoDuplicates!0 (array!21149 (_ BitVec 32) List!5558) Bool)

(assert (=> b!367933 (= res!206177 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5555))))

(declare-fun b!367934 () Bool)

(declare-fun res!206174 () Bool)

(assert (=> b!367934 (=> (not res!206174) (not e!225050))))

(assert (=> b!367934 (= res!206174 (arrayNoDuplicates!0 lt!169260 #b00000000000000000000000000000000 Nil!5555))))

(declare-fun b!367935 () Bool)

(declare-fun res!206179 () Bool)

(assert (=> b!367935 (=> (not res!206179) (not e!225051))))

(declare-fun arrayContainsKey!0 (array!21149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367935 (= res!206179 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!367936 () Bool)

(declare-fun e!225053 () Bool)

(assert (=> b!367936 (= e!225049 (and e!225053 mapRes!14472))))

(declare-fun condMapEmpty!14472 () Bool)

(declare-fun mapDefault!14472 () ValueCell!3959)

(assert (=> b!367936 (= condMapEmpty!14472 (= (arr!10042 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3959)) mapDefault!14472)))))

(declare-fun b!367937 () Bool)

(declare-fun res!206175 () Bool)

(assert (=> b!367937 (=> (not res!206175) (not e!225051))))

(assert (=> b!367937 (= res!206175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367938 () Bool)

(declare-fun res!206178 () Bool)

(assert (=> b!367938 (=> (not res!206178) (not e!225051))))

(assert (=> b!367938 (= res!206178 (or (= (select (arr!10043 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10043 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14472 () Bool)

(assert (=> mapIsEmpty!14472 mapRes!14472))

(declare-fun b!367939 () Bool)

(assert (=> b!367939 (= e!225050 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5728 0))(
  ( (tuple2!5729 (_1!2875 (_ BitVec 64)) (_2!2875 V!12579)) )
))
(declare-datatypes ((List!5559 0))(
  ( (Nil!5556) (Cons!5555 (h!6411 tuple2!5728) (t!10700 List!5559)) )
))
(declare-datatypes ((ListLongMap!4631 0))(
  ( (ListLongMap!4632 (toList!2331 List!5559)) )
))
(declare-fun lt!169259 () ListLongMap!4631)

(declare-fun zeroValue!472 () V!12579)

(declare-fun minValue!472 () V!12579)

(declare-fun getCurrentListMapNoExtraKeys!622 (array!21149 array!21147 (_ BitVec 32) (_ BitVec 32) V!12579 V!12579 (_ BitVec 32) Int) ListLongMap!4631)

(assert (=> b!367939 (= lt!169259 (getCurrentListMapNoExtraKeys!622 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!367940 () Bool)

(assert (=> b!367940 (= e!225053 tp_is_empty!8605)))

(declare-fun b!367941 () Bool)

(assert (=> b!367941 (= e!225052 tp_is_empty!8605)))

(declare-fun b!367942 () Bool)

(declare-fun res!206180 () Bool)

(assert (=> b!367942 (=> (not res!206180) (not e!225051))))

(assert (=> b!367942 (= res!206180 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10396 _keys!658))))))

(assert (= (and start!36816 res!206171) b!367931))

(assert (= (and b!367931 res!206173) b!367937))

(assert (= (and b!367937 res!206175) b!367933))

(assert (= (and b!367933 res!206177) b!367942))

(assert (= (and b!367942 res!206180) b!367930))

(assert (= (and b!367930 res!206176) b!367938))

(assert (= (and b!367938 res!206178) b!367935))

(assert (= (and b!367935 res!206179) b!367932))

(assert (= (and b!367932 res!206172) b!367934))

(assert (= (and b!367934 res!206174) b!367939))

(assert (= (and b!367936 condMapEmpty!14472) mapIsEmpty!14472))

(assert (= (and b!367936 (not condMapEmpty!14472)) mapNonEmpty!14472))

(get-info :version)

(assert (= (and mapNonEmpty!14472 ((_ is ValueCellFull!3959) mapValue!14472)) b!367941))

(assert (= (and b!367936 ((_ is ValueCellFull!3959) mapDefault!14472)) b!367940))

(assert (= start!36816 b!367936))

(declare-fun m!364199 () Bool)

(assert (=> start!36816 m!364199))

(declare-fun m!364201 () Bool)

(assert (=> start!36816 m!364201))

(declare-fun m!364203 () Bool)

(assert (=> start!36816 m!364203))

(declare-fun m!364205 () Bool)

(assert (=> b!367932 m!364205))

(declare-fun m!364207 () Bool)

(assert (=> b!367932 m!364207))

(declare-fun m!364209 () Bool)

(assert (=> b!367934 m!364209))

(declare-fun m!364211 () Bool)

(assert (=> b!367939 m!364211))

(declare-fun m!364213 () Bool)

(assert (=> b!367938 m!364213))

(declare-fun m!364215 () Bool)

(assert (=> b!367930 m!364215))

(declare-fun m!364217 () Bool)

(assert (=> b!367933 m!364217))

(declare-fun m!364219 () Bool)

(assert (=> b!367935 m!364219))

(declare-fun m!364221 () Bool)

(assert (=> b!367937 m!364221))

(declare-fun m!364223 () Bool)

(assert (=> mapNonEmpty!14472 m!364223))

(check-sat (not b_next!7957) (not b!367934) tp_is_empty!8605 (not b!367930) (not b!367939) (not b!367935) (not b!367937) (not b!367933) (not start!36816) b_and!15173 (not b!367932) (not mapNonEmpty!14472))
(check-sat b_and!15173 (not b_next!7957))
