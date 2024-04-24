; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38900 () Bool)

(assert start!38900)

(declare-fun b!406966 () Bool)

(declare-fun e!244472 () Bool)

(declare-fun e!244469 () Bool)

(declare-fun mapRes!17121 () Bool)

(assert (=> b!406966 (= e!244472 (and e!244469 mapRes!17121))))

(declare-fun condMapEmpty!17121 () Bool)

(declare-datatypes ((V!14883 0))(
  ( (V!14884 (val!5211 Int)) )
))
(declare-datatypes ((ValueCell!4823 0))(
  ( (ValueCellFull!4823 (v!7459 V!14883)) (EmptyCell!4823) )
))
(declare-datatypes ((array!24544 0))(
  ( (array!24545 (arr!11721 (Array (_ BitVec 32) ValueCell!4823)) (size!12073 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24544)

(declare-fun mapDefault!17121 () ValueCell!4823)

(assert (=> b!406966 (= condMapEmpty!17121 (= (arr!11721 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4823)) mapDefault!17121)))))

(declare-fun b!406967 () Bool)

(declare-fun res!235215 () Bool)

(declare-fun e!244470 () Bool)

(assert (=> b!406967 (=> (not res!235215) (not e!244470))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24546 0))(
  ( (array!24547 (arr!11722 (Array (_ BitVec 32) (_ BitVec 64))) (size!12074 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24546)

(assert (=> b!406967 (= res!235215 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12074 _keys!709))))))

(declare-fun mapIsEmpty!17121 () Bool)

(assert (=> mapIsEmpty!17121 mapRes!17121))

(declare-fun b!406968 () Bool)

(declare-fun res!235219 () Bool)

(assert (=> b!406968 (=> (not res!235219) (not e!244470))))

(assert (=> b!406968 (= res!235219 (or (= (select (arr!11722 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11722 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406969 () Bool)

(declare-fun res!235216 () Bool)

(assert (=> b!406969 (=> (not res!235216) (not e!244470))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!406969 (= res!235216 (and (= (size!12073 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12074 _keys!709) (size!12073 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406970 () Bool)

(declare-fun e!244471 () Bool)

(assert (=> b!406970 (= e!244470 e!244471)))

(declare-fun res!235218 () Bool)

(assert (=> b!406970 (=> (not res!235218) (not e!244471))))

(declare-fun lt!188597 () array!24546)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24546 (_ BitVec 32)) Bool)

(assert (=> b!406970 (= res!235218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188597 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!406970 (= lt!188597 (array!24547 (store (arr!11722 _keys!709) i!563 k0!794) (size!12074 _keys!709)))))

(declare-fun b!406971 () Bool)

(declare-fun res!235221 () Bool)

(assert (=> b!406971 (=> (not res!235221) (not e!244470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406971 (= res!235221 (validKeyInArray!0 k0!794))))

(declare-fun b!406972 () Bool)

(assert (=> b!406972 (= e!244471 false)))

(declare-fun lt!188598 () Bool)

(declare-datatypes ((List!6680 0))(
  ( (Nil!6677) (Cons!6676 (h!7532 (_ BitVec 64)) (t!11846 List!6680)) )
))
(declare-fun arrayNoDuplicates!0 (array!24546 (_ BitVec 32) List!6680) Bool)

(assert (=> b!406972 (= lt!188598 (arrayNoDuplicates!0 lt!188597 #b00000000000000000000000000000000 Nil!6677))))

(declare-fun b!406973 () Bool)

(declare-fun e!244474 () Bool)

(declare-fun tp_is_empty!10333 () Bool)

(assert (=> b!406973 (= e!244474 tp_is_empty!10333)))

(declare-fun b!406974 () Bool)

(declare-fun res!235222 () Bool)

(assert (=> b!406974 (=> (not res!235222) (not e!244470))))

(assert (=> b!406974 (= res!235222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406975 () Bool)

(declare-fun res!235223 () Bool)

(assert (=> b!406975 (=> (not res!235223) (not e!244470))))

(assert (=> b!406975 (= res!235223 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6677))))

(declare-fun mapNonEmpty!17121 () Bool)

(declare-fun tp!33240 () Bool)

(assert (=> mapNonEmpty!17121 (= mapRes!17121 (and tp!33240 e!244474))))

(declare-fun mapRest!17121 () (Array (_ BitVec 32) ValueCell!4823))

(declare-fun mapKey!17121 () (_ BitVec 32))

(declare-fun mapValue!17121 () ValueCell!4823)

(assert (=> mapNonEmpty!17121 (= (arr!11721 _values!549) (store mapRest!17121 mapKey!17121 mapValue!17121))))

(declare-fun b!406976 () Bool)

(assert (=> b!406976 (= e!244469 tp_is_empty!10333)))

(declare-fun res!235217 () Bool)

(assert (=> start!38900 (=> (not res!235217) (not e!244470))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38900 (= res!235217 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12074 _keys!709))))))

(assert (=> start!38900 e!244470))

(assert (=> start!38900 true))

(declare-fun array_inv!8642 (array!24544) Bool)

(assert (=> start!38900 (and (array_inv!8642 _values!549) e!244472)))

(declare-fun array_inv!8643 (array!24546) Bool)

(assert (=> start!38900 (array_inv!8643 _keys!709)))

(declare-fun b!406977 () Bool)

(declare-fun res!235224 () Bool)

(assert (=> b!406977 (=> (not res!235224) (not e!244470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406977 (= res!235224 (validMask!0 mask!1025))))

(declare-fun b!406978 () Bool)

(declare-fun res!235220 () Bool)

(assert (=> b!406978 (=> (not res!235220) (not e!244470))))

(declare-fun arrayContainsKey!0 (array!24546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406978 (= res!235220 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38900 res!235217) b!406977))

(assert (= (and b!406977 res!235224) b!406969))

(assert (= (and b!406969 res!235216) b!406974))

(assert (= (and b!406974 res!235222) b!406975))

(assert (= (and b!406975 res!235223) b!406967))

(assert (= (and b!406967 res!235215) b!406971))

(assert (= (and b!406971 res!235221) b!406968))

(assert (= (and b!406968 res!235219) b!406978))

(assert (= (and b!406978 res!235220) b!406970))

(assert (= (and b!406970 res!235218) b!406972))

(assert (= (and b!406966 condMapEmpty!17121) mapIsEmpty!17121))

(assert (= (and b!406966 (not condMapEmpty!17121)) mapNonEmpty!17121))

(get-info :version)

(assert (= (and mapNonEmpty!17121 ((_ is ValueCellFull!4823) mapValue!17121)) b!406973))

(assert (= (and b!406966 ((_ is ValueCellFull!4823) mapDefault!17121)) b!406976))

(assert (= start!38900 b!406966))

(declare-fun m!399093 () Bool)

(assert (=> b!406968 m!399093))

(declare-fun m!399095 () Bool)

(assert (=> b!406977 m!399095))

(declare-fun m!399097 () Bool)

(assert (=> mapNonEmpty!17121 m!399097))

(declare-fun m!399099 () Bool)

(assert (=> b!406974 m!399099))

(declare-fun m!399101 () Bool)

(assert (=> b!406978 m!399101))

(declare-fun m!399103 () Bool)

(assert (=> b!406970 m!399103))

(declare-fun m!399105 () Bool)

(assert (=> b!406970 m!399105))

(declare-fun m!399107 () Bool)

(assert (=> b!406975 m!399107))

(declare-fun m!399109 () Bool)

(assert (=> b!406972 m!399109))

(declare-fun m!399111 () Bool)

(assert (=> start!38900 m!399111))

(declare-fun m!399113 () Bool)

(assert (=> start!38900 m!399113))

(declare-fun m!399115 () Bool)

(assert (=> b!406971 m!399115))

(check-sat (not b!406974) (not start!38900) (not b!406978) (not mapNonEmpty!17121) (not b!406977) (not b!406975) (not b!406972) tp_is_empty!10333 (not b!406971) (not b!406970))
(check-sat)
