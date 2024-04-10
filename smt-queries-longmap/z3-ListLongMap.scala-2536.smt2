; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39036 () Bool)

(assert start!39036)

(declare-fun b_free!9303 () Bool)

(declare-fun b_next!9303 () Bool)

(assert (=> start!39036 (= b_free!9303 (not b_next!9303))))

(declare-fun tp!33438 () Bool)

(declare-fun b_and!16689 () Bool)

(assert (=> start!39036 (= tp!33438 b_and!16689)))

(declare-fun mapNonEmpty!17304 () Bool)

(declare-fun mapRes!17304 () Bool)

(declare-fun tp!33437 () Bool)

(declare-fun e!245604 () Bool)

(assert (=> mapNonEmpty!17304 (= mapRes!17304 (and tp!33437 e!245604))))

(declare-datatypes ((V!15045 0))(
  ( (V!15046 (val!5272 Int)) )
))
(declare-datatypes ((ValueCell!4884 0))(
  ( (ValueCellFull!4884 (v!7519 V!15045)) (EmptyCell!4884) )
))
(declare-datatypes ((array!24783 0))(
  ( (array!24784 (arr!11841 (Array (_ BitVec 32) ValueCell!4884)) (size!12193 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24783)

(declare-fun mapKey!17304 () (_ BitVec 32))

(declare-fun mapValue!17304 () ValueCell!4884)

(declare-fun mapRest!17304 () (Array (_ BitVec 32) ValueCell!4884))

(assert (=> mapNonEmpty!17304 (= (arr!11841 _values!549) (store mapRest!17304 mapKey!17304 mapValue!17304))))

(declare-fun b!409422 () Bool)

(declare-fun res!237079 () Bool)

(declare-fun e!245603 () Bool)

(assert (=> b!409422 (=> (not res!237079) (not e!245603))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409422 (= res!237079 (validMask!0 mask!1025))))

(declare-fun b!409423 () Bool)

(declare-fun e!245601 () Bool)

(assert (=> b!409423 (= e!245603 e!245601)))

(declare-fun res!237078 () Bool)

(assert (=> b!409423 (=> (not res!237078) (not e!245601))))

(declare-datatypes ((array!24785 0))(
  ( (array!24786 (arr!11842 (Array (_ BitVec 32) (_ BitVec 64))) (size!12194 (_ BitVec 32))) )
))
(declare-fun lt!188945 () array!24785)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24785 (_ BitVec 32)) Bool)

(assert (=> b!409423 (= res!237078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188945 mask!1025))))

(declare-fun _keys!709 () array!24785)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!409423 (= lt!188945 (array!24786 (store (arr!11842 _keys!709) i!563 k0!794) (size!12194 _keys!709)))))

(declare-fun mapIsEmpty!17304 () Bool)

(assert (=> mapIsEmpty!17304 mapRes!17304))

(declare-fun b!409424 () Bool)

(declare-fun res!237087 () Bool)

(assert (=> b!409424 (=> (not res!237087) (not e!245603))))

(assert (=> b!409424 (= res!237087 (or (= (select (arr!11842 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11842 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409425 () Bool)

(declare-fun res!237076 () Bool)

(assert (=> b!409425 (=> (not res!237076) (not e!245603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409425 (= res!237076 (validKeyInArray!0 k0!794))))

(declare-fun b!409426 () Bool)

(declare-fun res!237083 () Bool)

(assert (=> b!409426 (=> (not res!237083) (not e!245601))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!409426 (= res!237083 (bvsle from!863 i!563))))

(declare-fun b!409427 () Bool)

(declare-fun res!237077 () Bool)

(assert (=> b!409427 (=> (not res!237077) (not e!245603))))

(assert (=> b!409427 (= res!237077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409428 () Bool)

(declare-fun res!237080 () Bool)

(assert (=> b!409428 (=> (not res!237080) (not e!245601))))

(declare-datatypes ((List!6857 0))(
  ( (Nil!6854) (Cons!6853 (h!7709 (_ BitVec 64)) (t!12031 List!6857)) )
))
(declare-fun arrayNoDuplicates!0 (array!24785 (_ BitVec 32) List!6857) Bool)

(assert (=> b!409428 (= res!237080 (arrayNoDuplicates!0 lt!188945 #b00000000000000000000000000000000 Nil!6854))))

(declare-fun b!409429 () Bool)

(declare-fun res!237082 () Bool)

(assert (=> b!409429 (=> (not res!237082) (not e!245603))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!409429 (= res!237082 (and (= (size!12193 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12194 _keys!709) (size!12193 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409430 () Bool)

(declare-fun res!237084 () Bool)

(assert (=> b!409430 (=> (not res!237084) (not e!245603))))

(assert (=> b!409430 (= res!237084 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6854))))

(declare-fun res!237081 () Bool)

(assert (=> start!39036 (=> (not res!237081) (not e!245603))))

(assert (=> start!39036 (= res!237081 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12194 _keys!709))))))

(assert (=> start!39036 e!245603))

(declare-fun tp_is_empty!10455 () Bool)

(assert (=> start!39036 tp_is_empty!10455))

(assert (=> start!39036 tp!33438))

(assert (=> start!39036 true))

(declare-fun e!245600 () Bool)

(declare-fun array_inv!8640 (array!24783) Bool)

(assert (=> start!39036 (and (array_inv!8640 _values!549) e!245600)))

(declare-fun array_inv!8641 (array!24785) Bool)

(assert (=> start!39036 (array_inv!8641 _keys!709)))

(declare-fun b!409431 () Bool)

(declare-fun res!237086 () Bool)

(assert (=> b!409431 (=> (not res!237086) (not e!245603))))

(assert (=> b!409431 (= res!237086 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12194 _keys!709))))))

(declare-fun b!409432 () Bool)

(declare-fun e!245602 () Bool)

(assert (=> b!409432 (= e!245602 tp_is_empty!10455)))

(declare-fun b!409433 () Bool)

(assert (=> b!409433 (= e!245600 (and e!245602 mapRes!17304))))

(declare-fun condMapEmpty!17304 () Bool)

(declare-fun mapDefault!17304 () ValueCell!4884)

(assert (=> b!409433 (= condMapEmpty!17304 (= (arr!11841 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4884)) mapDefault!17304)))))

(declare-fun b!409434 () Bool)

(declare-fun res!237085 () Bool)

(assert (=> b!409434 (=> (not res!237085) (not e!245603))))

(declare-fun arrayContainsKey!0 (array!24785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409434 (= res!237085 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!409435 () Bool)

(assert (=> b!409435 (= e!245604 tp_is_empty!10455)))

(declare-fun b!409436 () Bool)

(assert (=> b!409436 (= e!245601 false)))

(declare-fun minValue!515 () V!15045)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15045)

(declare-datatypes ((tuple2!6834 0))(
  ( (tuple2!6835 (_1!3428 (_ BitVec 64)) (_2!3428 V!15045)) )
))
(declare-datatypes ((List!6858 0))(
  ( (Nil!6855) (Cons!6854 (h!7710 tuple2!6834) (t!12032 List!6858)) )
))
(declare-datatypes ((ListLongMap!5747 0))(
  ( (ListLongMap!5748 (toList!2889 List!6858)) )
))
(declare-fun lt!188944 () ListLongMap!5747)

(declare-fun getCurrentListMapNoExtraKeys!1097 (array!24785 array!24783 (_ BitVec 32) (_ BitVec 32) V!15045 V!15045 (_ BitVec 32) Int) ListLongMap!5747)

(assert (=> b!409436 (= lt!188944 (getCurrentListMapNoExtraKeys!1097 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39036 res!237081) b!409422))

(assert (= (and b!409422 res!237079) b!409429))

(assert (= (and b!409429 res!237082) b!409427))

(assert (= (and b!409427 res!237077) b!409430))

(assert (= (and b!409430 res!237084) b!409431))

(assert (= (and b!409431 res!237086) b!409425))

(assert (= (and b!409425 res!237076) b!409424))

(assert (= (and b!409424 res!237087) b!409434))

(assert (= (and b!409434 res!237085) b!409423))

(assert (= (and b!409423 res!237078) b!409428))

(assert (= (and b!409428 res!237080) b!409426))

(assert (= (and b!409426 res!237083) b!409436))

(assert (= (and b!409433 condMapEmpty!17304) mapIsEmpty!17304))

(assert (= (and b!409433 (not condMapEmpty!17304)) mapNonEmpty!17304))

(get-info :version)

(assert (= (and mapNonEmpty!17304 ((_ is ValueCellFull!4884) mapValue!17304)) b!409435))

(assert (= (and b!409433 ((_ is ValueCellFull!4884) mapDefault!17304)) b!409432))

(assert (= start!39036 b!409433))

(declare-fun m!400335 () Bool)

(assert (=> b!409428 m!400335))

(declare-fun m!400337 () Bool)

(assert (=> b!409436 m!400337))

(declare-fun m!400339 () Bool)

(assert (=> b!409422 m!400339))

(declare-fun m!400341 () Bool)

(assert (=> b!409425 m!400341))

(declare-fun m!400343 () Bool)

(assert (=> start!39036 m!400343))

(declare-fun m!400345 () Bool)

(assert (=> start!39036 m!400345))

(declare-fun m!400347 () Bool)

(assert (=> b!409434 m!400347))

(declare-fun m!400349 () Bool)

(assert (=> b!409424 m!400349))

(declare-fun m!400351 () Bool)

(assert (=> b!409423 m!400351))

(declare-fun m!400353 () Bool)

(assert (=> b!409423 m!400353))

(declare-fun m!400355 () Bool)

(assert (=> b!409427 m!400355))

(declare-fun m!400357 () Bool)

(assert (=> mapNonEmpty!17304 m!400357))

(declare-fun m!400359 () Bool)

(assert (=> b!409430 m!400359))

(check-sat (not start!39036) (not b!409427) (not b!409422) (not b!409428) (not b_next!9303) tp_is_empty!10455 (not b!409436) (not b!409434) (not b!409423) (not b!409425) (not mapNonEmpty!17304) (not b!409430) b_and!16689)
(check-sat b_and!16689 (not b_next!9303))
