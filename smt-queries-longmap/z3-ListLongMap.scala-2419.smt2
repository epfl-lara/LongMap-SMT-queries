; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38228 () Bool)

(assert start!38228)

(declare-datatypes ((array!23400 0))(
  ( (array!23401 (arr!11156 (Array (_ BitVec 32) (_ BitVec 64))) (size!11508 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23400)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun b!394557 () Bool)

(declare-datatypes ((V!14107 0))(
  ( (V!14108 (val!4920 Int)) )
))
(declare-datatypes ((ValueCell!4532 0))(
  ( (ValueCellFull!4532 (v!7166 V!14107)) (EmptyCell!4532) )
))
(declare-datatypes ((array!23402 0))(
  ( (array!23403 (arr!11157 (Array (_ BitVec 32) ValueCell!4532)) (size!11509 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23402)

(declare-fun e!238821 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394557 (= e!238821 (and (= (size!11509 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11508 _keys!709) (size!11509 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011) (not (= (size!11508 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)))))))

(declare-fun b!394558 () Bool)

(declare-fun e!238820 () Bool)

(declare-fun e!238824 () Bool)

(declare-fun mapRes!16227 () Bool)

(assert (=> b!394558 (= e!238820 (and e!238824 mapRes!16227))))

(declare-fun condMapEmpty!16227 () Bool)

(declare-fun mapDefault!16227 () ValueCell!4532)

(assert (=> b!394558 (= condMapEmpty!16227 (= (arr!11157 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4532)) mapDefault!16227)))))

(declare-fun mapNonEmpty!16227 () Bool)

(declare-fun tp!32022 () Bool)

(declare-fun e!238823 () Bool)

(assert (=> mapNonEmpty!16227 (= mapRes!16227 (and tp!32022 e!238823))))

(declare-fun mapValue!16227 () ValueCell!4532)

(declare-fun mapKey!16227 () (_ BitVec 32))

(declare-fun mapRest!16227 () (Array (_ BitVec 32) ValueCell!4532))

(assert (=> mapNonEmpty!16227 (= (arr!11157 _values!549) (store mapRest!16227 mapKey!16227 mapValue!16227))))

(declare-fun mapIsEmpty!16227 () Bool)

(assert (=> mapIsEmpty!16227 mapRes!16227))

(declare-fun b!394559 () Bool)

(declare-fun tp_is_empty!9751 () Bool)

(assert (=> b!394559 (= e!238824 tp_is_empty!9751)))

(declare-fun b!394560 () Bool)

(assert (=> b!394560 (= e!238823 tp_is_empty!9751)))

(declare-fun b!394561 () Bool)

(declare-fun res!226201 () Bool)

(assert (=> b!394561 (=> (not res!226201) (not e!238821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394561 (= res!226201 (validMask!0 mask!1025))))

(declare-fun res!226202 () Bool)

(assert (=> start!38228 (=> (not res!226202) (not e!238821))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38228 (= res!226202 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11508 _keys!709))))))

(assert (=> start!38228 e!238821))

(assert (=> start!38228 true))

(declare-fun array_inv!8248 (array!23402) Bool)

(assert (=> start!38228 (and (array_inv!8248 _values!549) e!238820)))

(declare-fun array_inv!8249 (array!23400) Bool)

(assert (=> start!38228 (array_inv!8249 _keys!709)))

(assert (= (and start!38228 res!226202) b!394561))

(assert (= (and b!394561 res!226201) b!394557))

(assert (= (and b!394558 condMapEmpty!16227) mapIsEmpty!16227))

(assert (= (and b!394558 (not condMapEmpty!16227)) mapNonEmpty!16227))

(get-info :version)

(assert (= (and mapNonEmpty!16227 ((_ is ValueCellFull!4532) mapValue!16227)) b!394560))

(assert (= (and b!394558 ((_ is ValueCellFull!4532) mapDefault!16227)) b!394559))

(assert (= start!38228 b!394558))

(declare-fun m!391269 () Bool)

(assert (=> mapNonEmpty!16227 m!391269))

(declare-fun m!391271 () Bool)

(assert (=> b!394561 m!391271))

(declare-fun m!391273 () Bool)

(assert (=> start!38228 m!391273))

(declare-fun m!391275 () Bool)

(assert (=> start!38228 m!391275))

(check-sat (not b!394561) (not start!38228) (not mapNonEmpty!16227) tp_is_empty!9751)
(check-sat)
