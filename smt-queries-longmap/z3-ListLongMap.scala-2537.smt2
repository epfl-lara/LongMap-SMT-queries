; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39026 () Bool)

(assert start!39026)

(declare-fun b_free!9307 () Bool)

(declare-fun b_next!9307 () Bool)

(assert (=> start!39026 (= b_free!9307 (not b_next!9307))))

(declare-fun tp!33449 () Bool)

(declare-fun b_and!16667 () Bool)

(assert (=> start!39026 (= tp!33449 b_and!16667)))

(declare-fun b!409241 () Bool)

(declare-fun e!245463 () Bool)

(declare-fun tp_is_empty!10459 () Bool)

(assert (=> b!409241 (= e!245463 tp_is_empty!10459)))

(declare-fun res!237029 () Bool)

(declare-fun e!245462 () Bool)

(assert (=> start!39026 (=> (not res!237029) (not e!245462))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24779 0))(
  ( (array!24780 (arr!11839 (Array (_ BitVec 32) (_ BitVec 64))) (size!12192 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24779)

(assert (=> start!39026 (= res!237029 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12192 _keys!709))))))

(assert (=> start!39026 e!245462))

(assert (=> start!39026 tp_is_empty!10459))

(assert (=> start!39026 tp!33449))

(assert (=> start!39026 true))

(declare-datatypes ((V!15051 0))(
  ( (V!15052 (val!5274 Int)) )
))
(declare-datatypes ((ValueCell!4886 0))(
  ( (ValueCellFull!4886 (v!7515 V!15051)) (EmptyCell!4886) )
))
(declare-datatypes ((array!24781 0))(
  ( (array!24782 (arr!11840 (Array (_ BitVec 32) ValueCell!4886)) (size!12193 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24781)

(declare-fun e!245465 () Bool)

(declare-fun array_inv!8682 (array!24781) Bool)

(assert (=> start!39026 (and (array_inv!8682 _values!549) e!245465)))

(declare-fun array_inv!8683 (array!24779) Bool)

(assert (=> start!39026 (array_inv!8683 _keys!709)))

(declare-fun b!409242 () Bool)

(declare-fun res!237024 () Bool)

(assert (=> b!409242 (=> (not res!237024) (not e!245462))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409242 (= res!237024 (validKeyInArray!0 k0!794))))

(declare-fun b!409243 () Bool)

(declare-fun e!245464 () Bool)

(assert (=> b!409243 (= e!245464 false)))

(declare-fun minValue!515 () V!15051)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15051)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!6824 0))(
  ( (tuple2!6825 (_1!3423 (_ BitVec 64)) (_2!3423 V!15051)) )
))
(declare-datatypes ((List!6834 0))(
  ( (Nil!6831) (Cons!6830 (h!7686 tuple2!6824) (t!11999 List!6834)) )
))
(declare-datatypes ((ListLongMap!5727 0))(
  ( (ListLongMap!5728 (toList!2879 List!6834)) )
))
(declare-fun lt!188722 () ListLongMap!5727)

(declare-fun getCurrentListMapNoExtraKeys!1093 (array!24779 array!24781 (_ BitVec 32) (_ BitVec 32) V!15051 V!15051 (_ BitVec 32) Int) ListLongMap!5727)

(assert (=> b!409243 (= lt!188722 (getCurrentListMapNoExtraKeys!1093 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409244 () Bool)

(declare-fun res!237020 () Bool)

(assert (=> b!409244 (=> (not res!237020) (not e!245462))))

(assert (=> b!409244 (= res!237020 (and (= (size!12193 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12192 _keys!709) (size!12193 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17310 () Bool)

(declare-fun mapRes!17310 () Bool)

(declare-fun tp!33450 () Bool)

(assert (=> mapNonEmpty!17310 (= mapRes!17310 (and tp!33450 e!245463))))

(declare-fun mapKey!17310 () (_ BitVec 32))

(declare-fun mapRest!17310 () (Array (_ BitVec 32) ValueCell!4886))

(declare-fun mapValue!17310 () ValueCell!4886)

(assert (=> mapNonEmpty!17310 (= (arr!11840 _values!549) (store mapRest!17310 mapKey!17310 mapValue!17310))))

(declare-fun b!409245 () Bool)

(declare-fun res!237019 () Bool)

(assert (=> b!409245 (=> (not res!237019) (not e!245464))))

(declare-fun lt!188723 () array!24779)

(declare-datatypes ((List!6835 0))(
  ( (Nil!6832) (Cons!6831 (h!7687 (_ BitVec 64)) (t!12000 List!6835)) )
))
(declare-fun arrayNoDuplicates!0 (array!24779 (_ BitVec 32) List!6835) Bool)

(assert (=> b!409245 (= res!237019 (arrayNoDuplicates!0 lt!188723 #b00000000000000000000000000000000 Nil!6832))))

(declare-fun b!409246 () Bool)

(declare-fun res!237022 () Bool)

(assert (=> b!409246 (=> (not res!237022) (not e!245462))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409246 (= res!237022 (or (= (select (arr!11839 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11839 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409247 () Bool)

(declare-fun res!237021 () Bool)

(assert (=> b!409247 (=> (not res!237021) (not e!245462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409247 (= res!237021 (validMask!0 mask!1025))))

(declare-fun b!409248 () Bool)

(assert (=> b!409248 (= e!245462 e!245464)))

(declare-fun res!237025 () Bool)

(assert (=> b!409248 (=> (not res!237025) (not e!245464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24779 (_ BitVec 32)) Bool)

(assert (=> b!409248 (= res!237025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188723 mask!1025))))

(assert (=> b!409248 (= lt!188723 (array!24780 (store (arr!11839 _keys!709) i!563 k0!794) (size!12192 _keys!709)))))

(declare-fun b!409249 () Bool)

(declare-fun e!245461 () Bool)

(assert (=> b!409249 (= e!245465 (and e!245461 mapRes!17310))))

(declare-fun condMapEmpty!17310 () Bool)

(declare-fun mapDefault!17310 () ValueCell!4886)

(assert (=> b!409249 (= condMapEmpty!17310 (= (arr!11840 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4886)) mapDefault!17310)))))

(declare-fun b!409250 () Bool)

(declare-fun res!237028 () Bool)

(assert (=> b!409250 (=> (not res!237028) (not e!245462))))

(declare-fun arrayContainsKey!0 (array!24779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409250 (= res!237028 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409251 () Bool)

(declare-fun res!237027 () Bool)

(assert (=> b!409251 (=> (not res!237027) (not e!245462))))

(assert (=> b!409251 (= res!237027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409252 () Bool)

(declare-fun res!237030 () Bool)

(assert (=> b!409252 (=> (not res!237030) (not e!245462))))

(assert (=> b!409252 (= res!237030 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6832))))

(declare-fun b!409253 () Bool)

(assert (=> b!409253 (= e!245461 tp_is_empty!10459)))

(declare-fun mapIsEmpty!17310 () Bool)

(assert (=> mapIsEmpty!17310 mapRes!17310))

(declare-fun b!409254 () Bool)

(declare-fun res!237026 () Bool)

(assert (=> b!409254 (=> (not res!237026) (not e!245464))))

(assert (=> b!409254 (= res!237026 (bvsle from!863 i!563))))

(declare-fun b!409255 () Bool)

(declare-fun res!237023 () Bool)

(assert (=> b!409255 (=> (not res!237023) (not e!245462))))

(assert (=> b!409255 (= res!237023 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12192 _keys!709))))))

(assert (= (and start!39026 res!237029) b!409247))

(assert (= (and b!409247 res!237021) b!409244))

(assert (= (and b!409244 res!237020) b!409251))

(assert (= (and b!409251 res!237027) b!409252))

(assert (= (and b!409252 res!237030) b!409255))

(assert (= (and b!409255 res!237023) b!409242))

(assert (= (and b!409242 res!237024) b!409246))

(assert (= (and b!409246 res!237022) b!409250))

(assert (= (and b!409250 res!237028) b!409248))

(assert (= (and b!409248 res!237025) b!409245))

(assert (= (and b!409245 res!237019) b!409254))

(assert (= (and b!409254 res!237026) b!409243))

(assert (= (and b!409249 condMapEmpty!17310) mapIsEmpty!17310))

(assert (= (and b!409249 (not condMapEmpty!17310)) mapNonEmpty!17310))

(get-info :version)

(assert (= (and mapNonEmpty!17310 ((_ is ValueCellFull!4886) mapValue!17310)) b!409241))

(assert (= (and b!409249 ((_ is ValueCellFull!4886) mapDefault!17310)) b!409253))

(assert (= start!39026 b!409249))

(declare-fun m!399663 () Bool)

(assert (=> b!409243 m!399663))

(declare-fun m!399665 () Bool)

(assert (=> b!409245 m!399665))

(declare-fun m!399667 () Bool)

(assert (=> b!409252 m!399667))

(declare-fun m!399669 () Bool)

(assert (=> b!409242 m!399669))

(declare-fun m!399671 () Bool)

(assert (=> b!409251 m!399671))

(declare-fun m!399673 () Bool)

(assert (=> b!409250 m!399673))

(declare-fun m!399675 () Bool)

(assert (=> start!39026 m!399675))

(declare-fun m!399677 () Bool)

(assert (=> start!39026 m!399677))

(declare-fun m!399679 () Bool)

(assert (=> b!409247 m!399679))

(declare-fun m!399681 () Bool)

(assert (=> b!409246 m!399681))

(declare-fun m!399683 () Bool)

(assert (=> mapNonEmpty!17310 m!399683))

(declare-fun m!399685 () Bool)

(assert (=> b!409248 m!399685))

(declare-fun m!399687 () Bool)

(assert (=> b!409248 m!399687))

(check-sat (not mapNonEmpty!17310) (not b!409250) (not b!409251) (not b!409252) (not b!409245) (not start!39026) (not b!409247) (not b!409248) (not b!409243) (not b!409242) b_and!16667 tp_is_empty!10459 (not b_next!9307))
(check-sat b_and!16667 (not b_next!9307))
