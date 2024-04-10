; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33488 () Bool)

(assert start!33488)

(declare-fun b!332379 () Bool)

(declare-fun e!204096 () Bool)

(declare-fun tp_is_empty!6741 () Bool)

(assert (=> b!332379 (= e!204096 tp_is_empty!6741)))

(declare-fun mapNonEmpty!11496 () Bool)

(declare-fun mapRes!11496 () Bool)

(declare-fun tp!23871 () Bool)

(declare-fun e!204092 () Bool)

(assert (=> mapNonEmpty!11496 (= mapRes!11496 (and tp!23871 e!204092))))

(declare-datatypes ((V!9965 0))(
  ( (V!9966 (val!3415 Int)) )
))
(declare-datatypes ((ValueCell!3027 0))(
  ( (ValueCellFull!3027 (v!5574 V!9965)) (EmptyCell!3027) )
))
(declare-fun mapRest!11496 () (Array (_ BitVec 32) ValueCell!3027))

(declare-fun mapKey!11496 () (_ BitVec 32))

(declare-datatypes ((array!17077 0))(
  ( (array!17078 (arr!8073 (Array (_ BitVec 32) ValueCell!3027)) (size!8425 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17077)

(declare-fun mapValue!11496 () ValueCell!3027)

(assert (=> mapNonEmpty!11496 (= (arr!8073 _values!1525) (store mapRest!11496 mapKey!11496 mapValue!11496))))

(declare-fun b!332380 () Bool)

(declare-fun e!204094 () Bool)

(assert (=> b!332380 (= e!204094 (and e!204096 mapRes!11496))))

(declare-fun condMapEmpty!11496 () Bool)

(declare-fun mapDefault!11496 () ValueCell!3027)

(assert (=> b!332380 (= condMapEmpty!11496 (= (arr!8073 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3027)) mapDefault!11496)))))

(declare-fun mapIsEmpty!11496 () Bool)

(assert (=> mapIsEmpty!11496 mapRes!11496))

(declare-fun b!332381 () Bool)

(declare-fun res!183103 () Bool)

(declare-fun e!204093 () Bool)

(assert (=> b!332381 (=> (not res!183103) (not e!204093))))

(declare-datatypes ((array!17079 0))(
  ( (array!17080 (arr!8074 (Array (_ BitVec 32) (_ BitVec 64))) (size!8426 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17079)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17079 (_ BitVec 32)) Bool)

(assert (=> b!332381 (= res!183103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332382 () Bool)

(declare-fun res!183104 () Bool)

(assert (=> b!332382 (=> (not res!183104) (not e!204093))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332382 (= res!183104 (and (= (size!8425 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8426 _keys!1895) (size!8425 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!183102 () Bool)

(assert (=> start!33488 (=> (not res!183102) (not e!204093))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33488 (= res!183102 (validMask!0 mask!2385))))

(assert (=> start!33488 e!204093))

(assert (=> start!33488 true))

(declare-fun array_inv!6014 (array!17077) Bool)

(assert (=> start!33488 (and (array_inv!6014 _values!1525) e!204094)))

(declare-fun array_inv!6015 (array!17079) Bool)

(assert (=> start!33488 (array_inv!6015 _keys!1895)))

(declare-fun b!332383 () Bool)

(assert (=> b!332383 (= e!204092 tp_is_empty!6741)))

(declare-fun b!332384 () Bool)

(assert (=> b!332384 (= e!204093 false)))

(declare-fun lt!159007 () Bool)

(declare-datatypes ((List!4592 0))(
  ( (Nil!4589) (Cons!4588 (h!5444 (_ BitVec 64)) (t!9674 List!4592)) )
))
(declare-fun arrayNoDuplicates!0 (array!17079 (_ BitVec 32) List!4592) Bool)

(assert (=> b!332384 (= lt!159007 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4589))))

(assert (= (and start!33488 res!183102) b!332382))

(assert (= (and b!332382 res!183104) b!332381))

(assert (= (and b!332381 res!183103) b!332384))

(assert (= (and b!332380 condMapEmpty!11496) mapIsEmpty!11496))

(assert (= (and b!332380 (not condMapEmpty!11496)) mapNonEmpty!11496))

(get-info :version)

(assert (= (and mapNonEmpty!11496 ((_ is ValueCellFull!3027) mapValue!11496)) b!332383))

(assert (= (and b!332380 ((_ is ValueCellFull!3027) mapDefault!11496)) b!332379))

(assert (= start!33488 b!332380))

(declare-fun m!336921 () Bool)

(assert (=> mapNonEmpty!11496 m!336921))

(declare-fun m!336923 () Bool)

(assert (=> b!332381 m!336923))

(declare-fun m!336925 () Bool)

(assert (=> start!33488 m!336925))

(declare-fun m!336927 () Bool)

(assert (=> start!33488 m!336927))

(declare-fun m!336929 () Bool)

(assert (=> start!33488 m!336929))

(declare-fun m!336931 () Bool)

(assert (=> b!332384 m!336931))

(check-sat (not start!33488) (not b!332384) (not mapNonEmpty!11496) tp_is_empty!6741 (not b!332381))
(check-sat)
