; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38228 () Bool)

(assert start!38228)

(declare-fun b!394335 () Bool)

(declare-fun e!238678 () Bool)

(declare-fun tp_is_empty!9751 () Bool)

(assert (=> b!394335 (= e!238678 tp_is_empty!9751)))

(declare-fun b!394336 () Bool)

(declare-fun e!238681 () Bool)

(declare-fun e!238680 () Bool)

(declare-fun mapRes!16227 () Bool)

(assert (=> b!394336 (= e!238681 (and e!238680 mapRes!16227))))

(declare-fun condMapEmpty!16227 () Bool)

(declare-datatypes ((V!14107 0))(
  ( (V!14108 (val!4920 Int)) )
))
(declare-datatypes ((ValueCell!4532 0))(
  ( (ValueCellFull!4532 (v!7159 V!14107)) (EmptyCell!4532) )
))
(declare-datatypes ((array!23395 0))(
  ( (array!23396 (arr!11154 (Array (_ BitVec 32) ValueCell!4532)) (size!11507 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23395)

(declare-fun mapDefault!16227 () ValueCell!4532)

(assert (=> b!394336 (= condMapEmpty!16227 (= (arr!11154 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4532)) mapDefault!16227)))))

(declare-fun res!226075 () Bool)

(declare-fun e!238679 () Bool)

(assert (=> start!38228 (=> (not res!226075) (not e!238679))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23397 0))(
  ( (array!23398 (arr!11155 (Array (_ BitVec 32) (_ BitVec 64))) (size!11508 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23397)

(assert (=> start!38228 (= res!226075 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11508 _keys!709))))))

(assert (=> start!38228 e!238679))

(assert (=> start!38228 true))

(declare-fun array_inv!8188 (array!23395) Bool)

(assert (=> start!38228 (and (array_inv!8188 _values!549) e!238681)))

(declare-fun array_inv!8189 (array!23397) Bool)

(assert (=> start!38228 (array_inv!8189 _keys!709)))

(declare-fun mapNonEmpty!16227 () Bool)

(declare-fun tp!32022 () Bool)

(assert (=> mapNonEmpty!16227 (= mapRes!16227 (and tp!32022 e!238678))))

(declare-fun mapKey!16227 () (_ BitVec 32))

(declare-fun mapValue!16227 () ValueCell!4532)

(declare-fun mapRest!16227 () (Array (_ BitVec 32) ValueCell!4532))

(assert (=> mapNonEmpty!16227 (= (arr!11154 _values!549) (store mapRest!16227 mapKey!16227 mapValue!16227))))

(declare-fun b!394337 () Bool)

(assert (=> b!394337 (= e!238680 tp_is_empty!9751)))

(declare-fun b!394338 () Bool)

(declare-fun res!226076 () Bool)

(assert (=> b!394338 (=> (not res!226076) (not e!238679))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394338 (= res!226076 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16227 () Bool)

(assert (=> mapIsEmpty!16227 mapRes!16227))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun b!394339 () Bool)

(assert (=> b!394339 (= e!238679 (and (= (size!11507 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11508 _keys!709) (size!11507 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011) (not (= (size!11508 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)))))))

(assert (= (and start!38228 res!226075) b!394338))

(assert (= (and b!394338 res!226076) b!394339))

(assert (= (and b!394336 condMapEmpty!16227) mapIsEmpty!16227))

(assert (= (and b!394336 (not condMapEmpty!16227)) mapNonEmpty!16227))

(get-info :version)

(assert (= (and mapNonEmpty!16227 ((_ is ValueCellFull!4532) mapValue!16227)) b!394335))

(assert (= (and b!394336 ((_ is ValueCellFull!4532) mapDefault!16227)) b!394337))

(assert (= start!38228 b!394336))

(declare-fun m!390315 () Bool)

(assert (=> start!38228 m!390315))

(declare-fun m!390317 () Bool)

(assert (=> start!38228 m!390317))

(declare-fun m!390319 () Bool)

(assert (=> mapNonEmpty!16227 m!390319))

(declare-fun m!390321 () Bool)

(assert (=> b!394338 m!390321))

(check-sat (not b!394338) (not start!38228) (not mapNonEmpty!16227) tp_is_empty!9751)
(check-sat)
