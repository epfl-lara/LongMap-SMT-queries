; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34774 () Bool)

(assert start!34774)

(declare-fun b_free!7573 () Bool)

(declare-fun b_next!7573 () Bool)

(assert (=> start!34774 (= b_free!7573 (not b_next!7573))))

(declare-fun tp!26285 () Bool)

(declare-fun b_and!14809 () Bool)

(assert (=> start!34774 (= tp!26285 b_and!14809)))

(declare-fun mapIsEmpty!12747 () Bool)

(declare-fun mapRes!12747 () Bool)

(assert (=> mapIsEmpty!12747 mapRes!12747))

(declare-fun b!347961 () Bool)

(declare-fun e!213211 () Bool)

(declare-fun e!213214 () Bool)

(assert (=> b!347961 (= e!213211 e!213214)))

(declare-fun res!192705 () Bool)

(assert (=> b!347961 (=> (not res!192705) (not e!213214))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!18632 0))(
  ( (array!18633 (arr!8825 (Array (_ BitVec 32) (_ BitVec 64))) (size!9177 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18632)

(declare-datatypes ((SeekEntryResult!3358 0))(
  ( (MissingZero!3358 (index!15611 (_ BitVec 32))) (Found!3358 (index!15612 (_ BitVec 32))) (Intermediate!3358 (undefined!4170 Bool) (index!15613 (_ BitVec 32)) (x!34619 (_ BitVec 32))) (Undefined!3358) (MissingVacant!3358 (index!15614 (_ BitVec 32))) )
))
(declare-fun lt!163804 () SeekEntryResult!3358)

(get-info :version)

(assert (=> b!347961 (= res!192705 (and ((_ is Found!3358) lt!163804) (= (select (arr!8825 _keys!1895) (index!15612 lt!163804)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18632 (_ BitVec 32)) SeekEntryResult!3358)

(assert (=> b!347961 (= lt!163804 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347962 () Bool)

(declare-fun e!213212 () Bool)

(declare-fun tp_is_empty!7525 () Bool)

(assert (=> b!347962 (= e!213212 tp_is_empty!7525)))

(declare-fun mapNonEmpty!12747 () Bool)

(declare-fun tp!26286 () Bool)

(assert (=> mapNonEmpty!12747 (= mapRes!12747 (and tp!26286 e!213212))))

(declare-datatypes ((V!11011 0))(
  ( (V!11012 (val!3807 Int)) )
))
(declare-datatypes ((ValueCell!3419 0))(
  ( (ValueCellFull!3419 (v!5991 V!11011)) (EmptyCell!3419) )
))
(declare-fun mapValue!12747 () ValueCell!3419)

(declare-datatypes ((array!18634 0))(
  ( (array!18635 (arr!8826 (Array (_ BitVec 32) ValueCell!3419)) (size!9178 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18634)

(declare-fun mapKey!12747 () (_ BitVec 32))

(declare-fun mapRest!12747 () (Array (_ BitVec 32) ValueCell!3419))

(assert (=> mapNonEmpty!12747 (= (arr!8826 _values!1525) (store mapRest!12747 mapKey!12747 mapValue!12747))))

(declare-fun b!347963 () Bool)

(declare-fun res!192709 () Bool)

(declare-fun e!213213 () Bool)

(assert (=> b!347963 (=> (not res!192709) (not e!213213))))

(declare-datatypes ((List!5027 0))(
  ( (Nil!5024) (Cons!5023 (h!5879 (_ BitVec 64)) (t!10149 List!5027)) )
))
(declare-fun arrayNoDuplicates!0 (array!18632 (_ BitVec 32) List!5027) Bool)

(assert (=> b!347963 (= res!192709 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5024))))

(declare-fun b!347964 () Bool)

(declare-fun res!192706 () Bool)

(assert (=> b!347964 (=> (not res!192706) (not e!213213))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!347964 (= res!192706 (and (= (size!9178 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9177 _keys!1895) (size!9178 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347965 () Bool)

(declare-fun res!192703 () Bool)

(assert (=> b!347965 (=> (not res!192703) (not e!213213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18632 (_ BitVec 32)) Bool)

(assert (=> b!347965 (= res!192703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347967 () Bool)

(declare-fun res!192704 () Bool)

(assert (=> b!347967 (=> (not res!192704) (not e!213213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347967 (= res!192704 (validKeyInArray!0 k0!1348))))

(declare-fun b!347968 () Bool)

(declare-fun res!192702 () Bool)

(assert (=> b!347968 (=> (not res!192702) (not e!213214))))

(declare-fun arrayContainsKey!0 (array!18632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347968 (= res!192702 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15612 lt!163804)))))

(declare-fun b!347969 () Bool)

(declare-fun e!213210 () Bool)

(declare-fun e!213208 () Bool)

(assert (=> b!347969 (= e!213210 (and e!213208 mapRes!12747))))

(declare-fun condMapEmpty!12747 () Bool)

(declare-fun mapDefault!12747 () ValueCell!3419)

(assert (=> b!347969 (= condMapEmpty!12747 (= (arr!8826 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3419)) mapDefault!12747)))))

(declare-fun b!347966 () Bool)

(assert (=> b!347966 (= e!213213 e!213211)))

(declare-fun res!192708 () Bool)

(assert (=> b!347966 (=> (not res!192708) (not e!213211))))

(declare-datatypes ((tuple2!5420 0))(
  ( (tuple2!5421 (_1!2721 (_ BitVec 64)) (_2!2721 V!11011)) )
))
(declare-datatypes ((List!5028 0))(
  ( (Nil!5025) (Cons!5024 (h!5880 tuple2!5420) (t!10150 List!5028)) )
))
(declare-datatypes ((ListLongMap!4335 0))(
  ( (ListLongMap!4336 (toList!2183 List!5028)) )
))
(declare-fun lt!163806 () ListLongMap!4335)

(declare-fun contains!2267 (ListLongMap!4335 (_ BitVec 64)) Bool)

(assert (=> b!347966 (= res!192708 (not (contains!2267 lt!163806 k0!1348)))))

(declare-fun zeroValue!1467 () V!11011)

(declare-fun minValue!1467 () V!11011)

(declare-fun defaultEntry!1528 () Int)

(declare-fun getCurrentListMap!1711 (array!18632 array!18634 (_ BitVec 32) (_ BitVec 32) V!11011 V!11011 (_ BitVec 32) Int) ListLongMap!4335)

(assert (=> b!347966 (= lt!163806 (getCurrentListMap!1711 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun res!192707 () Bool)

(assert (=> start!34774 (=> (not res!192707) (not e!213213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34774 (= res!192707 (validMask!0 mask!2385))))

(assert (=> start!34774 e!213213))

(assert (=> start!34774 true))

(assert (=> start!34774 tp_is_empty!7525))

(assert (=> start!34774 tp!26285))

(declare-fun array_inv!6522 (array!18634) Bool)

(assert (=> start!34774 (and (array_inv!6522 _values!1525) e!213210)))

(declare-fun array_inv!6523 (array!18632) Bool)

(assert (=> start!34774 (array_inv!6523 _keys!1895)))

(declare-fun b!347970 () Bool)

(assert (=> b!347970 (= e!213214 (not true))))

(assert (=> b!347970 (contains!2267 lt!163806 (select (arr!8825 _keys!1895) (index!15612 lt!163804)))))

(declare-datatypes ((Unit!10773 0))(
  ( (Unit!10774) )
))
(declare-fun lt!163805 () Unit!10773)

(declare-fun lemmaValidKeyInArrayIsInListMap!176 (array!18632 array!18634 (_ BitVec 32) (_ BitVec 32) V!11011 V!11011 (_ BitVec 32) Int) Unit!10773)

(assert (=> b!347970 (= lt!163805 (lemmaValidKeyInArrayIsInListMap!176 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!15612 lt!163804) defaultEntry!1528))))

(assert (=> b!347970 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!163807 () Unit!10773)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18632 (_ BitVec 64) (_ BitVec 32)) Unit!10773)

(assert (=> b!347970 (= lt!163807 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15612 lt!163804)))))

(declare-fun b!347971 () Bool)

(assert (=> b!347971 (= e!213208 tp_is_empty!7525)))

(assert (= (and start!34774 res!192707) b!347964))

(assert (= (and b!347964 res!192706) b!347965))

(assert (= (and b!347965 res!192703) b!347963))

(assert (= (and b!347963 res!192709) b!347967))

(assert (= (and b!347967 res!192704) b!347966))

(assert (= (and b!347966 res!192708) b!347961))

(assert (= (and b!347961 res!192705) b!347968))

(assert (= (and b!347968 res!192702) b!347970))

(assert (= (and b!347969 condMapEmpty!12747) mapIsEmpty!12747))

(assert (= (and b!347969 (not condMapEmpty!12747)) mapNonEmpty!12747))

(assert (= (and mapNonEmpty!12747 ((_ is ValueCellFull!3419) mapValue!12747)) b!347962))

(assert (= (and b!347969 ((_ is ValueCellFull!3419) mapDefault!12747)) b!347971))

(assert (= start!34774 b!347969))

(declare-fun m!349101 () Bool)

(assert (=> b!347968 m!349101))

(declare-fun m!349103 () Bool)

(assert (=> b!347963 m!349103))

(declare-fun m!349105 () Bool)

(assert (=> start!34774 m!349105))

(declare-fun m!349107 () Bool)

(assert (=> start!34774 m!349107))

(declare-fun m!349109 () Bool)

(assert (=> start!34774 m!349109))

(declare-fun m!349111 () Bool)

(assert (=> mapNonEmpty!12747 m!349111))

(declare-fun m!349113 () Bool)

(assert (=> b!347966 m!349113))

(declare-fun m!349115 () Bool)

(assert (=> b!347966 m!349115))

(declare-fun m!349117 () Bool)

(assert (=> b!347967 m!349117))

(declare-fun m!349119 () Bool)

(assert (=> b!347970 m!349119))

(declare-fun m!349121 () Bool)

(assert (=> b!347970 m!349121))

(declare-fun m!349123 () Bool)

(assert (=> b!347970 m!349123))

(declare-fun m!349125 () Bool)

(assert (=> b!347970 m!349125))

(declare-fun m!349127 () Bool)

(assert (=> b!347970 m!349127))

(assert (=> b!347970 m!349123))

(assert (=> b!347961 m!349123))

(declare-fun m!349129 () Bool)

(assert (=> b!347961 m!349129))

(declare-fun m!349131 () Bool)

(assert (=> b!347965 m!349131))

(check-sat (not start!34774) (not b!347963) (not b!347965) (not b!347968) tp_is_empty!7525 (not mapNonEmpty!12747) (not b!347961) b_and!14809 (not b_next!7573) (not b!347970) (not b!347967) (not b!347966))
(check-sat b_and!14809 (not b_next!7573))
