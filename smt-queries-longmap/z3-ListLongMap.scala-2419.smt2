; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38244 () Bool)

(assert start!38244)

(declare-fun mapIsEmpty!16230 () Bool)

(declare-fun mapRes!16230 () Bool)

(assert (=> mapIsEmpty!16230 mapRes!16230))

(declare-fun b!394621 () Bool)

(declare-fun res!226210 () Bool)

(declare-fun e!238867 () Bool)

(assert (=> b!394621 (=> (not res!226210) (not e!238867))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394621 (= res!226210 (validMask!0 mask!1025))))

(declare-fun b!394622 () Bool)

(declare-fun e!238869 () Bool)

(declare-fun tp_is_empty!9753 () Bool)

(assert (=> b!394622 (= e!238869 tp_is_empty!9753)))

(declare-fun b!394623 () Bool)

(declare-fun e!238871 () Bool)

(declare-fun e!238868 () Bool)

(assert (=> b!394623 (= e!238871 (and e!238868 mapRes!16230))))

(declare-fun condMapEmpty!16230 () Bool)

(declare-datatypes ((V!14109 0))(
  ( (V!14110 (val!4921 Int)) )
))
(declare-datatypes ((ValueCell!4533 0))(
  ( (ValueCellFull!4533 (v!7166 V!14109)) (EmptyCell!4533) )
))
(declare-datatypes ((array!23413 0))(
  ( (array!23414 (arr!11163 (Array (_ BitVec 32) ValueCell!4533)) (size!11515 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23413)

(declare-fun mapDefault!16230 () ValueCell!4533)

(assert (=> b!394623 (= condMapEmpty!16230 (= (arr!11163 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4533)) mapDefault!16230)))))

(declare-datatypes ((array!23415 0))(
  ( (array!23416 (arr!11164 (Array (_ BitVec 32) (_ BitVec 64))) (size!11516 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23415)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun b!394624 () Bool)

(assert (=> b!394624 (= e!238867 (and (= (size!11515 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11516 _keys!709) (size!11515 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011) (not (= (size!11516 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)))))))

(declare-fun b!394625 () Bool)

(assert (=> b!394625 (= e!238868 tp_is_empty!9753)))

(declare-fun res!226211 () Bool)

(assert (=> start!38244 (=> (not res!226211) (not e!238867))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38244 (= res!226211 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11516 _keys!709))))))

(assert (=> start!38244 e!238867))

(assert (=> start!38244 true))

(declare-fun array_inv!8196 (array!23413) Bool)

(assert (=> start!38244 (and (array_inv!8196 _values!549) e!238871)))

(declare-fun array_inv!8197 (array!23415) Bool)

(assert (=> start!38244 (array_inv!8197 _keys!709)))

(declare-fun mapNonEmpty!16230 () Bool)

(declare-fun tp!32025 () Bool)

(assert (=> mapNonEmpty!16230 (= mapRes!16230 (and tp!32025 e!238869))))

(declare-fun mapValue!16230 () ValueCell!4533)

(declare-fun mapRest!16230 () (Array (_ BitVec 32) ValueCell!4533))

(declare-fun mapKey!16230 () (_ BitVec 32))

(assert (=> mapNonEmpty!16230 (= (arr!11163 _values!549) (store mapRest!16230 mapKey!16230 mapValue!16230))))

(assert (= (and start!38244 res!226211) b!394621))

(assert (= (and b!394621 res!226210) b!394624))

(assert (= (and b!394623 condMapEmpty!16230) mapIsEmpty!16230))

(assert (= (and b!394623 (not condMapEmpty!16230)) mapNonEmpty!16230))

(get-info :version)

(assert (= (and mapNonEmpty!16230 ((_ is ValueCellFull!4533) mapValue!16230)) b!394622))

(assert (= (and b!394623 ((_ is ValueCellFull!4533) mapDefault!16230)) b!394625))

(assert (= start!38244 b!394623))

(declare-fun m!391047 () Bool)

(assert (=> b!394621 m!391047))

(declare-fun m!391049 () Bool)

(assert (=> start!38244 m!391049))

(declare-fun m!391051 () Bool)

(assert (=> start!38244 m!391051))

(declare-fun m!391053 () Bool)

(assert (=> mapNonEmpty!16230 m!391053))

(check-sat (not start!38244) (not b!394621) (not mapNonEmpty!16230) tp_is_empty!9753)
(check-sat)
