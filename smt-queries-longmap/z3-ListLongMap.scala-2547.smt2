; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39086 () Bool)

(assert start!39086)

(declare-fun b_free!9367 () Bool)

(declare-fun b_next!9367 () Bool)

(assert (=> start!39086 (= b_free!9367 (not b_next!9367))))

(declare-fun tp!33630 () Bool)

(declare-fun b_and!16767 () Bool)

(assert (=> start!39086 (= tp!33630 b_and!16767)))

(declare-fun b!410813 () Bool)

(declare-fun e!246146 () Bool)

(declare-fun e!246144 () Bool)

(assert (=> b!410813 (= e!246146 e!246144)))

(declare-fun res!238226 () Bool)

(assert (=> b!410813 (=> (not res!238226) (not e!246144))))

(declare-datatypes ((array!24902 0))(
  ( (array!24903 (arr!11900 (Array (_ BitVec 32) (_ BitVec 64))) (size!12252 (_ BitVec 32))) )
))
(declare-fun lt!189186 () array!24902)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24902 (_ BitVec 32)) Bool)

(assert (=> b!410813 (= res!238226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189186 mask!1025))))

(declare-fun _keys!709 () array!24902)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410813 (= lt!189186 (array!24903 (store (arr!11900 _keys!709) i!563 k0!794) (size!12252 _keys!709)))))

(declare-fun b!410814 () Bool)

(declare-fun e!246143 () Bool)

(declare-fun e!246148 () Bool)

(declare-fun mapRes!17400 () Bool)

(assert (=> b!410814 (= e!246143 (and e!246148 mapRes!17400))))

(declare-fun condMapEmpty!17400 () Bool)

(declare-datatypes ((V!15131 0))(
  ( (V!15132 (val!5304 Int)) )
))
(declare-datatypes ((ValueCell!4916 0))(
  ( (ValueCellFull!4916 (v!7552 V!15131)) (EmptyCell!4916) )
))
(declare-datatypes ((array!24904 0))(
  ( (array!24905 (arr!11901 (Array (_ BitVec 32) ValueCell!4916)) (size!12253 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24904)

(declare-fun mapDefault!17400 () ValueCell!4916)

(assert (=> b!410814 (= condMapEmpty!17400 (= (arr!11901 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4916)) mapDefault!17400)))))

(declare-fun b!410815 () Bool)

(declare-fun res!238232 () Bool)

(assert (=> b!410815 (=> (not res!238232) (not e!246146))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!410815 (= res!238232 (and (= (size!12253 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12252 _keys!709) (size!12253 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410816 () Bool)

(declare-fun res!238236 () Bool)

(assert (=> b!410816 (=> (not res!238236) (not e!246146))))

(declare-fun arrayContainsKey!0 (array!24902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410816 (= res!238236 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410817 () Bool)

(declare-fun res!238229 () Bool)

(assert (=> b!410817 (=> (not res!238229) (not e!246144))))

(declare-datatypes ((List!6767 0))(
  ( (Nil!6764) (Cons!6763 (h!7619 (_ BitVec 64)) (t!11933 List!6767)) )
))
(declare-fun arrayNoDuplicates!0 (array!24902 (_ BitVec 32) List!6767) Bool)

(assert (=> b!410817 (= res!238229 (arrayNoDuplicates!0 lt!189186 #b00000000000000000000000000000000 Nil!6764))))

(declare-fun b!410818 () Bool)

(declare-fun e!246145 () Bool)

(declare-fun tp_is_empty!10519 () Bool)

(assert (=> b!410818 (= e!246145 tp_is_empty!10519)))

(declare-fun b!410819 () Bool)

(declare-fun res!238235 () Bool)

(assert (=> b!410819 (=> (not res!238235) (not e!246146))))

(assert (=> b!410819 (= res!238235 (or (= (select (arr!11900 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11900 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410820 () Bool)

(declare-fun res!238228 () Bool)

(assert (=> b!410820 (=> (not res!238228) (not e!246146))))

(assert (=> b!410820 (= res!238228 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12252 _keys!709))))))

(declare-fun b!410821 () Bool)

(declare-fun res!238230 () Bool)

(assert (=> b!410821 (=> (not res!238230) (not e!246146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410821 (= res!238230 (validMask!0 mask!1025))))

(declare-fun b!410822 () Bool)

(declare-fun res!238225 () Bool)

(assert (=> b!410822 (=> (not res!238225) (not e!246146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410822 (= res!238225 (validKeyInArray!0 k0!794))))

(declare-fun b!410823 () Bool)

(assert (=> b!410823 (= e!246148 tp_is_empty!10519)))

(declare-fun b!410824 () Bool)

(declare-fun res!238234 () Bool)

(assert (=> b!410824 (=> (not res!238234) (not e!246146))))

(assert (=> b!410824 (= res!238234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!238231 () Bool)

(assert (=> start!39086 (=> (not res!238231) (not e!246146))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39086 (= res!238231 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12252 _keys!709))))))

(assert (=> start!39086 e!246146))

(assert (=> start!39086 tp_is_empty!10519))

(assert (=> start!39086 tp!33630))

(assert (=> start!39086 true))

(declare-fun array_inv!8762 (array!24904) Bool)

(assert (=> start!39086 (and (array_inv!8762 _values!549) e!246143)))

(declare-fun array_inv!8763 (array!24902) Bool)

(assert (=> start!39086 (array_inv!8763 _keys!709)))

(declare-fun mapNonEmpty!17400 () Bool)

(declare-fun tp!33629 () Bool)

(assert (=> mapNonEmpty!17400 (= mapRes!17400 (and tp!33629 e!246145))))

(declare-fun mapRest!17400 () (Array (_ BitVec 32) ValueCell!4916))

(declare-fun mapKey!17400 () (_ BitVec 32))

(declare-fun mapValue!17400 () ValueCell!4916)

(assert (=> mapNonEmpty!17400 (= (arr!11901 _values!549) (store mapRest!17400 mapKey!17400 mapValue!17400))))

(declare-fun b!410825 () Bool)

(declare-fun res!238233 () Bool)

(assert (=> b!410825 (=> (not res!238233) (not e!246146))))

(assert (=> b!410825 (= res!238233 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6764))))

(declare-fun b!410826 () Bool)

(declare-fun res!238227 () Bool)

(assert (=> b!410826 (=> (not res!238227) (not e!246144))))

(assert (=> b!410826 (= res!238227 (bvsle from!863 i!563))))

(declare-fun b!410827 () Bool)

(assert (=> b!410827 (= e!246144 false)))

(declare-fun minValue!515 () V!15131)

(declare-fun defaultEntry!557 () Int)

(declare-fun v!412 () V!15131)

(declare-fun zeroValue!515 () V!15131)

(declare-datatypes ((tuple2!6748 0))(
  ( (tuple2!6749 (_1!3385 (_ BitVec 64)) (_2!3385 V!15131)) )
))
(declare-datatypes ((List!6768 0))(
  ( (Nil!6765) (Cons!6764 (h!7620 tuple2!6748) (t!11934 List!6768)) )
))
(declare-datatypes ((ListLongMap!5663 0))(
  ( (ListLongMap!5664 (toList!2847 List!6768)) )
))
(declare-fun lt!189185 () ListLongMap!5663)

(declare-fun getCurrentListMapNoExtraKeys!1099 (array!24902 array!24904 (_ BitVec 32) (_ BitVec 32) V!15131 V!15131 (_ BitVec 32) Int) ListLongMap!5663)

(assert (=> b!410827 (= lt!189185 (getCurrentListMapNoExtraKeys!1099 lt!189186 (array!24905 (store (arr!11901 _values!549) i!563 (ValueCellFull!4916 v!412)) (size!12253 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189184 () ListLongMap!5663)

(assert (=> b!410827 (= lt!189184 (getCurrentListMapNoExtraKeys!1099 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!17400 () Bool)

(assert (=> mapIsEmpty!17400 mapRes!17400))

(assert (= (and start!39086 res!238231) b!410821))

(assert (= (and b!410821 res!238230) b!410815))

(assert (= (and b!410815 res!238232) b!410824))

(assert (= (and b!410824 res!238234) b!410825))

(assert (= (and b!410825 res!238233) b!410820))

(assert (= (and b!410820 res!238228) b!410822))

(assert (= (and b!410822 res!238225) b!410819))

(assert (= (and b!410819 res!238235) b!410816))

(assert (= (and b!410816 res!238236) b!410813))

(assert (= (and b!410813 res!238226) b!410817))

(assert (= (and b!410817 res!238229) b!410826))

(assert (= (and b!410826 res!238227) b!410827))

(assert (= (and b!410814 condMapEmpty!17400) mapIsEmpty!17400))

(assert (= (and b!410814 (not condMapEmpty!17400)) mapNonEmpty!17400))

(get-info :version)

(assert (= (and mapNonEmpty!17400 ((_ is ValueCellFull!4916) mapValue!17400)) b!410818))

(assert (= (and b!410814 ((_ is ValueCellFull!4916) mapDefault!17400)) b!410823))

(assert (= start!39086 b!410814))

(declare-fun m!401433 () Bool)

(assert (=> start!39086 m!401433))

(declare-fun m!401435 () Bool)

(assert (=> start!39086 m!401435))

(declare-fun m!401437 () Bool)

(assert (=> b!410817 m!401437))

(declare-fun m!401439 () Bool)

(assert (=> b!410816 m!401439))

(declare-fun m!401441 () Bool)

(assert (=> b!410824 m!401441))

(declare-fun m!401443 () Bool)

(assert (=> b!410827 m!401443))

(declare-fun m!401445 () Bool)

(assert (=> b!410827 m!401445))

(declare-fun m!401447 () Bool)

(assert (=> b!410827 m!401447))

(declare-fun m!401449 () Bool)

(assert (=> b!410825 m!401449))

(declare-fun m!401451 () Bool)

(assert (=> b!410813 m!401451))

(declare-fun m!401453 () Bool)

(assert (=> b!410813 m!401453))

(declare-fun m!401455 () Bool)

(assert (=> b!410819 m!401455))

(declare-fun m!401457 () Bool)

(assert (=> b!410821 m!401457))

(declare-fun m!401459 () Bool)

(assert (=> mapNonEmpty!17400 m!401459))

(declare-fun m!401461 () Bool)

(assert (=> b!410822 m!401461))

(check-sat (not b!410825) (not b!410817) (not b_next!9367) (not b!410816) tp_is_empty!10519 (not b!410822) (not b!410821) (not start!39086) b_and!16767 (not mapNonEmpty!17400) (not b!410824) (not b!410813) (not b!410827))
(check-sat b_and!16767 (not b_next!9367))
