; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40118 () Bool)

(assert start!40118)

(declare-fun b_free!10399 () Bool)

(declare-fun b_next!10399 () Bool)

(assert (=> start!40118 (= b_free!10399 (not b_next!10399))))

(declare-fun tp!36725 () Bool)

(declare-fun b_and!18341 () Bool)

(assert (=> start!40118 (= tp!36725 b_and!18341)))

(declare-fun b!438661 () Bool)

(declare-fun res!259152 () Bool)

(declare-fun e!258657 () Bool)

(assert (=> b!438661 (=> (not res!259152) (not e!258657))))

(declare-datatypes ((array!26921 0))(
  ( (array!26922 (arr!12910 (Array (_ BitVec 32) (_ BitVec 64))) (size!13263 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26921)

(declare-datatypes ((List!7731 0))(
  ( (Nil!7728) (Cons!7727 (h!8583 (_ BitVec 64)) (t!13478 List!7731)) )
))
(declare-fun arrayNoDuplicates!0 (array!26921 (_ BitVec 32) List!7731) Bool)

(assert (=> b!438661 (= res!259152 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7728))))

(declare-fun b!438662 () Bool)

(declare-fun e!258660 () Bool)

(declare-fun e!258662 () Bool)

(declare-fun mapRes!18948 () Bool)

(assert (=> b!438662 (= e!258660 (and e!258662 mapRes!18948))))

(declare-fun condMapEmpty!18948 () Bool)

(declare-datatypes ((V!16507 0))(
  ( (V!16508 (val!5820 Int)) )
))
(declare-datatypes ((ValueCell!5432 0))(
  ( (ValueCellFull!5432 (v!8061 V!16507)) (EmptyCell!5432) )
))
(declare-datatypes ((array!26923 0))(
  ( (array!26924 (arr!12911 (Array (_ BitVec 32) ValueCell!5432)) (size!13264 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26923)

(declare-fun mapDefault!18948 () ValueCell!5432)

(assert (=> b!438662 (= condMapEmpty!18948 (= (arr!12911 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5432)) mapDefault!18948)))))

(declare-fun b!438663 () Bool)

(declare-fun res!259153 () Bool)

(declare-fun e!258659 () Bool)

(assert (=> b!438663 (=> (not res!259153) (not e!258659))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438663 (= res!259153 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18948 () Bool)

(declare-fun tp!36726 () Bool)

(declare-fun e!258661 () Bool)

(assert (=> mapNonEmpty!18948 (= mapRes!18948 (and tp!36726 e!258661))))

(declare-fun mapRest!18948 () (Array (_ BitVec 32) ValueCell!5432))

(declare-fun mapValue!18948 () ValueCell!5432)

(declare-fun mapKey!18948 () (_ BitVec 32))

(assert (=> mapNonEmpty!18948 (= (arr!12911 _values!549) (store mapRest!18948 mapKey!18948 mapValue!18948))))

(declare-fun b!438664 () Bool)

(declare-fun e!258663 () Bool)

(assert (=> b!438664 (= e!258663 (not true))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16507)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!201879 () array!26923)

(declare-fun lt!201880 () array!26921)

(declare-fun v!412 () V!16507)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!16507)

(declare-datatypes ((tuple2!7744 0))(
  ( (tuple2!7745 (_1!3883 (_ BitVec 64)) (_2!3883 V!16507)) )
))
(declare-datatypes ((List!7732 0))(
  ( (Nil!7729) (Cons!7728 (h!8584 tuple2!7744) (t!13479 List!7732)) )
))
(declare-datatypes ((ListLongMap!6647 0))(
  ( (ListLongMap!6648 (toList!3339 List!7732)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1538 (array!26921 array!26923 (_ BitVec 32) (_ BitVec 32) V!16507 V!16507 (_ BitVec 32) Int) ListLongMap!6647)

(declare-fun +!1505 (ListLongMap!6647 tuple2!7744) ListLongMap!6647)

(assert (=> b!438664 (= (getCurrentListMapNoExtraKeys!1538 lt!201880 lt!201879 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1505 (getCurrentListMapNoExtraKeys!1538 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7745 k0!794 v!412)))))

(declare-datatypes ((Unit!13027 0))(
  ( (Unit!13028) )
))
(declare-fun lt!201878 () Unit!13027)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!643 (array!26921 array!26923 (_ BitVec 32) (_ BitVec 32) V!16507 V!16507 (_ BitVec 32) (_ BitVec 64) V!16507 (_ BitVec 32) Int) Unit!13027)

(assert (=> b!438664 (= lt!201878 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!643 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438665 () Bool)

(declare-fun res!259146 () Bool)

(assert (=> b!438665 (=> (not res!259146) (not e!258657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438665 (= res!259146 (validMask!0 mask!1025))))

(declare-fun b!438666 () Bool)

(declare-fun res!259150 () Bool)

(assert (=> b!438666 (=> (not res!259150) (not e!258657))))

(assert (=> b!438666 (= res!259150 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13263 _keys!709))))))

(declare-fun b!438667 () Bool)

(assert (=> b!438667 (= e!258659 e!258663)))

(declare-fun res!259155 () Bool)

(assert (=> b!438667 (=> (not res!259155) (not e!258663))))

(assert (=> b!438667 (= res!259155 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201877 () ListLongMap!6647)

(assert (=> b!438667 (= lt!201877 (getCurrentListMapNoExtraKeys!1538 lt!201880 lt!201879 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438667 (= lt!201879 (array!26924 (store (arr!12911 _values!549) i!563 (ValueCellFull!5432 v!412)) (size!13264 _values!549)))))

(declare-fun lt!201881 () ListLongMap!6647)

(assert (=> b!438667 (= lt!201881 (getCurrentListMapNoExtraKeys!1538 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438668 () Bool)

(declare-fun res!259149 () Bool)

(assert (=> b!438668 (=> (not res!259149) (not e!258657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26921 (_ BitVec 32)) Bool)

(assert (=> b!438668 (= res!259149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438669 () Bool)

(declare-fun tp_is_empty!11551 () Bool)

(assert (=> b!438669 (= e!258661 tp_is_empty!11551)))

(declare-fun b!438670 () Bool)

(assert (=> b!438670 (= e!258662 tp_is_empty!11551)))

(declare-fun b!438671 () Bool)

(declare-fun res!259154 () Bool)

(assert (=> b!438671 (=> (not res!259154) (not e!258657))))

(assert (=> b!438671 (= res!259154 (or (= (select (arr!12910 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12910 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438672 () Bool)

(assert (=> b!438672 (= e!258657 e!258659)))

(declare-fun res!259143 () Bool)

(assert (=> b!438672 (=> (not res!259143) (not e!258659))))

(assert (=> b!438672 (= res!259143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201880 mask!1025))))

(assert (=> b!438672 (= lt!201880 (array!26922 (store (arr!12910 _keys!709) i!563 k0!794) (size!13263 _keys!709)))))

(declare-fun b!438673 () Bool)

(declare-fun res!259144 () Bool)

(assert (=> b!438673 (=> (not res!259144) (not e!258657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438673 (= res!259144 (validKeyInArray!0 k0!794))))

(declare-fun b!438674 () Bool)

(declare-fun res!259151 () Bool)

(assert (=> b!438674 (=> (not res!259151) (not e!258657))))

(declare-fun arrayContainsKey!0 (array!26921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438674 (= res!259151 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438675 () Bool)

(declare-fun res!259148 () Bool)

(assert (=> b!438675 (=> (not res!259148) (not e!258659))))

(assert (=> b!438675 (= res!259148 (arrayNoDuplicates!0 lt!201880 #b00000000000000000000000000000000 Nil!7728))))

(declare-fun b!438676 () Bool)

(declare-fun res!259145 () Bool)

(assert (=> b!438676 (=> (not res!259145) (not e!258657))))

(assert (=> b!438676 (= res!259145 (and (= (size!13264 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13263 _keys!709) (size!13264 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18948 () Bool)

(assert (=> mapIsEmpty!18948 mapRes!18948))

(declare-fun res!259147 () Bool)

(assert (=> start!40118 (=> (not res!259147) (not e!258657))))

(assert (=> start!40118 (= res!259147 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13263 _keys!709))))))

(assert (=> start!40118 e!258657))

(assert (=> start!40118 tp_is_empty!11551))

(assert (=> start!40118 tp!36725))

(assert (=> start!40118 true))

(declare-fun array_inv!9422 (array!26923) Bool)

(assert (=> start!40118 (and (array_inv!9422 _values!549) e!258660)))

(declare-fun array_inv!9423 (array!26921) Bool)

(assert (=> start!40118 (array_inv!9423 _keys!709)))

(assert (= (and start!40118 res!259147) b!438665))

(assert (= (and b!438665 res!259146) b!438676))

(assert (= (and b!438676 res!259145) b!438668))

(assert (= (and b!438668 res!259149) b!438661))

(assert (= (and b!438661 res!259152) b!438666))

(assert (= (and b!438666 res!259150) b!438673))

(assert (= (and b!438673 res!259144) b!438671))

(assert (= (and b!438671 res!259154) b!438674))

(assert (= (and b!438674 res!259151) b!438672))

(assert (= (and b!438672 res!259143) b!438675))

(assert (= (and b!438675 res!259148) b!438663))

(assert (= (and b!438663 res!259153) b!438667))

(assert (= (and b!438667 res!259155) b!438664))

(assert (= (and b!438662 condMapEmpty!18948) mapIsEmpty!18948))

(assert (= (and b!438662 (not condMapEmpty!18948)) mapNonEmpty!18948))

(get-info :version)

(assert (= (and mapNonEmpty!18948 ((_ is ValueCellFull!5432) mapValue!18948)) b!438669))

(assert (= (and b!438662 ((_ is ValueCellFull!5432) mapDefault!18948)) b!438670))

(assert (= start!40118 b!438662))

(declare-fun m!425559 () Bool)

(assert (=> b!438668 m!425559))

(declare-fun m!425561 () Bool)

(assert (=> start!40118 m!425561))

(declare-fun m!425563 () Bool)

(assert (=> start!40118 m!425563))

(declare-fun m!425565 () Bool)

(assert (=> b!438661 m!425565))

(declare-fun m!425567 () Bool)

(assert (=> b!438675 m!425567))

(declare-fun m!425569 () Bool)

(assert (=> b!438664 m!425569))

(declare-fun m!425571 () Bool)

(assert (=> b!438664 m!425571))

(assert (=> b!438664 m!425571))

(declare-fun m!425573 () Bool)

(assert (=> b!438664 m!425573))

(declare-fun m!425575 () Bool)

(assert (=> b!438664 m!425575))

(declare-fun m!425577 () Bool)

(assert (=> b!438671 m!425577))

(declare-fun m!425579 () Bool)

(assert (=> b!438667 m!425579))

(declare-fun m!425581 () Bool)

(assert (=> b!438667 m!425581))

(declare-fun m!425583 () Bool)

(assert (=> b!438667 m!425583))

(declare-fun m!425585 () Bool)

(assert (=> b!438665 m!425585))

(declare-fun m!425587 () Bool)

(assert (=> b!438672 m!425587))

(declare-fun m!425589 () Bool)

(assert (=> b!438672 m!425589))

(declare-fun m!425591 () Bool)

(assert (=> b!438674 m!425591))

(declare-fun m!425593 () Bool)

(assert (=> mapNonEmpty!18948 m!425593))

(declare-fun m!425595 () Bool)

(assert (=> b!438673 m!425595))

(check-sat tp_is_empty!11551 (not b_next!10399) b_and!18341 (not b!438673) (not b!438668) (not b!438672) (not b!438661) (not b!438674) (not b!438675) (not b!438667) (not b!438664) (not b!438665) (not start!40118) (not mapNonEmpty!18948))
(check-sat b_and!18341 (not b_next!10399))
