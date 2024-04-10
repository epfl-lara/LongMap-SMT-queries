; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36628 () Bool)

(assert start!36628)

(declare-fun b!365576 () Bool)

(declare-fun res!204400 () Bool)

(declare-fun e!223876 () Bool)

(assert (=> b!365576 (=> (not res!204400) (not e!223876))))

(declare-datatypes ((array!20885 0))(
  ( (array!20886 (arr!9915 (Array (_ BitVec 32) (_ BitVec 64))) (size!10267 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20885)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20885 (_ BitVec 32)) Bool)

(assert (=> b!365576 (= res!204400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365577 () Bool)

(assert (=> b!365577 (= e!223876 false)))

(declare-fun lt!169193 () Bool)

(declare-datatypes ((List!5529 0))(
  ( (Nil!5526) (Cons!5525 (h!6381 (_ BitVec 64)) (t!10679 List!5529)) )
))
(declare-fun arrayNoDuplicates!0 (array!20885 (_ BitVec 32) List!5529) Bool)

(assert (=> b!365577 (= lt!169193 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5526))))

(declare-fun b!365578 () Bool)

(declare-fun e!223874 () Bool)

(declare-fun tp_is_empty!8463 () Bool)

(assert (=> b!365578 (= e!223874 tp_is_empty!8463)))

(declare-fun mapNonEmpty!14247 () Bool)

(declare-fun mapRes!14247 () Bool)

(declare-fun tp!28323 () Bool)

(assert (=> mapNonEmpty!14247 (= mapRes!14247 (and tp!28323 e!223874))))

(declare-datatypes ((V!12389 0))(
  ( (V!12390 (val!4276 Int)) )
))
(declare-datatypes ((ValueCell!3888 0))(
  ( (ValueCellFull!3888 (v!6472 V!12389)) (EmptyCell!3888) )
))
(declare-fun mapRest!14247 () (Array (_ BitVec 32) ValueCell!3888))

(declare-fun mapKey!14247 () (_ BitVec 32))

(declare-datatypes ((array!20887 0))(
  ( (array!20888 (arr!9916 (Array (_ BitVec 32) ValueCell!3888)) (size!10268 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20887)

(declare-fun mapValue!14247 () ValueCell!3888)

(assert (=> mapNonEmpty!14247 (= (arr!9916 _values!506) (store mapRest!14247 mapKey!14247 mapValue!14247))))

(declare-fun mapIsEmpty!14247 () Bool)

(assert (=> mapIsEmpty!14247 mapRes!14247))

(declare-fun b!365579 () Bool)

(declare-fun e!223875 () Bool)

(assert (=> b!365579 (= e!223875 tp_is_empty!8463)))

(declare-fun b!365580 () Bool)

(declare-fun res!204402 () Bool)

(assert (=> b!365580 (=> (not res!204402) (not e!223876))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365580 (= res!204402 (and (= (size!10268 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10267 _keys!658) (size!10268 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365581 () Bool)

(declare-fun e!223878 () Bool)

(assert (=> b!365581 (= e!223878 (and e!223875 mapRes!14247))))

(declare-fun condMapEmpty!14247 () Bool)

(declare-fun mapDefault!14247 () ValueCell!3888)

(assert (=> b!365581 (= condMapEmpty!14247 (= (arr!9916 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3888)) mapDefault!14247)))))

(declare-fun res!204401 () Bool)

(assert (=> start!36628 (=> (not res!204401) (not e!223876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36628 (= res!204401 (validMask!0 mask!970))))

(assert (=> start!36628 e!223876))

(assert (=> start!36628 true))

(declare-fun array_inv!7342 (array!20887) Bool)

(assert (=> start!36628 (and (array_inv!7342 _values!506) e!223878)))

(declare-fun array_inv!7343 (array!20885) Bool)

(assert (=> start!36628 (array_inv!7343 _keys!658)))

(assert (= (and start!36628 res!204401) b!365580))

(assert (= (and b!365580 res!204402) b!365576))

(assert (= (and b!365576 res!204400) b!365577))

(assert (= (and b!365581 condMapEmpty!14247) mapIsEmpty!14247))

(assert (= (and b!365581 (not condMapEmpty!14247)) mapNonEmpty!14247))

(get-info :version)

(assert (= (and mapNonEmpty!14247 ((_ is ValueCellFull!3888) mapValue!14247)) b!365578))

(assert (= (and b!365581 ((_ is ValueCellFull!3888) mapDefault!14247)) b!365579))

(assert (= start!36628 b!365581))

(declare-fun m!363243 () Bool)

(assert (=> b!365576 m!363243))

(declare-fun m!363245 () Bool)

(assert (=> b!365577 m!363245))

(declare-fun m!363247 () Bool)

(assert (=> mapNonEmpty!14247 m!363247))

(declare-fun m!363249 () Bool)

(assert (=> start!36628 m!363249))

(declare-fun m!363251 () Bool)

(assert (=> start!36628 m!363251))

(declare-fun m!363253 () Bool)

(assert (=> start!36628 m!363253))

(check-sat (not mapNonEmpty!14247) (not b!365577) (not b!365576) tp_is_empty!8463 (not start!36628))
(check-sat)
