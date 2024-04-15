; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39740 () Bool)

(assert start!39740)

(declare-fun b_free!10021 () Bool)

(declare-fun b_next!10021 () Bool)

(assert (=> start!39740 (= b_free!10021 (not b_next!10021))))

(declare-fun tp!35592 () Bool)

(declare-fun b_and!17675 () Bool)

(assert (=> start!39740 (= tp!35592 b_and!17675)))

(declare-fun b!427719 () Bool)

(declare-fun res!251030 () Bool)

(declare-fun e!253523 () Bool)

(assert (=> b!427719 (=> (not res!251030) (not e!253523))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427719 (= res!251030 (validMask!0 mask!1025))))

(declare-fun b!427720 () Bool)

(declare-fun e!253525 () Bool)

(assert (=> b!427720 (= e!253523 e!253525)))

(declare-fun res!251028 () Bool)

(assert (=> b!427720 (=> (not res!251028) (not e!253525))))

(declare-datatypes ((array!26175 0))(
  ( (array!26176 (arr!12537 (Array (_ BitVec 32) (_ BitVec 64))) (size!12890 (_ BitVec 32))) )
))
(declare-fun lt!195307 () array!26175)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26175 (_ BitVec 32)) Bool)

(assert (=> b!427720 (= res!251028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195307 mask!1025))))

(declare-fun _keys!709 () array!26175)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427720 (= lt!195307 (array!26176 (store (arr!12537 _keys!709) i!563 k0!794) (size!12890 _keys!709)))))

(declare-fun b!427721 () Bool)

(declare-fun res!251019 () Bool)

(assert (=> b!427721 (=> (not res!251019) (not e!253523))))

(declare-fun arrayContainsKey!0 (array!26175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427721 (= res!251019 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427722 () Bool)

(declare-fun res!251031 () Bool)

(assert (=> b!427722 (=> (not res!251031) (not e!253525))))

(declare-datatypes ((List!7408 0))(
  ( (Nil!7405) (Cons!7404 (h!8260 (_ BitVec 64)) (t!12869 List!7408)) )
))
(declare-fun arrayNoDuplicates!0 (array!26175 (_ BitVec 32) List!7408) Bool)

(assert (=> b!427722 (= res!251031 (arrayNoDuplicates!0 lt!195307 #b00000000000000000000000000000000 Nil!7405))))

(declare-fun mapIsEmpty!18381 () Bool)

(declare-fun mapRes!18381 () Bool)

(assert (=> mapIsEmpty!18381 mapRes!18381))

(declare-fun b!427724 () Bool)

(declare-fun res!251021 () Bool)

(assert (=> b!427724 (=> (not res!251021) (not e!253523))))

(assert (=> b!427724 (= res!251021 (or (= (select (arr!12537 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12537 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427725 () Bool)

(declare-fun res!251026 () Bool)

(assert (=> b!427725 (=> (not res!251026) (not e!253525))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!427725 (= res!251026 (bvsle from!863 i!563))))

(declare-fun b!427726 () Bool)

(declare-fun res!251022 () Bool)

(assert (=> b!427726 (=> (not res!251022) (not e!253523))))

(assert (=> b!427726 (= res!251022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427727 () Bool)

(declare-fun e!253524 () Bool)

(declare-fun tp_is_empty!11173 () Bool)

(assert (=> b!427727 (= e!253524 tp_is_empty!11173)))

(declare-fun b!427728 () Bool)

(declare-fun e!253521 () Bool)

(assert (=> b!427728 (= e!253525 e!253521)))

(declare-fun res!251029 () Bool)

(assert (=> b!427728 (=> (not res!251029) (not e!253521))))

(assert (=> b!427728 (= res!251029 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16003 0))(
  ( (V!16004 (val!5631 Int)) )
))
(declare-fun minValue!515 () V!16003)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7406 0))(
  ( (tuple2!7407 (_1!3714 (_ BitVec 64)) (_2!3714 V!16003)) )
))
(declare-datatypes ((List!7409 0))(
  ( (Nil!7406) (Cons!7405 (h!8261 tuple2!7406) (t!12870 List!7409)) )
))
(declare-datatypes ((ListLongMap!6309 0))(
  ( (ListLongMap!6310 (toList!3170 List!7409)) )
))
(declare-fun lt!195311 () ListLongMap!6309)

(declare-fun zeroValue!515 () V!16003)

(declare-datatypes ((ValueCell!5243 0))(
  ( (ValueCellFull!5243 (v!7872 V!16003)) (EmptyCell!5243) )
))
(declare-datatypes ((array!26177 0))(
  ( (array!26178 (arr!12538 (Array (_ BitVec 32) ValueCell!5243)) (size!12891 (_ BitVec 32))) )
))
(declare-fun lt!195309 () array!26177)

(declare-fun getCurrentListMapNoExtraKeys!1377 (array!26175 array!26177 (_ BitVec 32) (_ BitVec 32) V!16003 V!16003 (_ BitVec 32) Int) ListLongMap!6309)

(assert (=> b!427728 (= lt!195311 (getCurrentListMapNoExtraKeys!1377 lt!195307 lt!195309 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26177)

(declare-fun v!412 () V!16003)

(assert (=> b!427728 (= lt!195309 (array!26178 (store (arr!12538 _values!549) i!563 (ValueCellFull!5243 v!412)) (size!12891 _values!549)))))

(declare-fun lt!195305 () ListLongMap!6309)

(assert (=> b!427728 (= lt!195305 (getCurrentListMapNoExtraKeys!1377 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18381 () Bool)

(declare-fun tp!35591 () Bool)

(declare-fun e!253527 () Bool)

(assert (=> mapNonEmpty!18381 (= mapRes!18381 (and tp!35591 e!253527))))

(declare-fun mapRest!18381 () (Array (_ BitVec 32) ValueCell!5243))

(declare-fun mapKey!18381 () (_ BitVec 32))

(declare-fun mapValue!18381 () ValueCell!5243)

(assert (=> mapNonEmpty!18381 (= (arr!12538 _values!549) (store mapRest!18381 mapKey!18381 mapValue!18381))))

(declare-fun b!427729 () Bool)

(declare-fun res!251020 () Bool)

(assert (=> b!427729 (=> (not res!251020) (not e!253523))))

(assert (=> b!427729 (= res!251020 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12890 _keys!709))))))

(declare-fun b!427730 () Bool)

(declare-fun e!253522 () Bool)

(assert (=> b!427730 (= e!253522 true)))

(declare-fun lt!195306 () ListLongMap!6309)

(declare-fun +!1349 (ListLongMap!6309 tuple2!7406) ListLongMap!6309)

(declare-fun get!6206 (ValueCell!5243 V!16003) V!16003)

(declare-fun dynLambda!748 (Int (_ BitVec 64)) V!16003)

(assert (=> b!427730 (= lt!195311 (+!1349 lt!195306 (tuple2!7407 (select (arr!12537 _keys!709) from!863) (get!6206 (select (arr!12538 _values!549) from!863) (dynLambda!748 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427731 () Bool)

(assert (=> b!427731 (= e!253527 tp_is_empty!11173)))

(declare-fun b!427732 () Bool)

(assert (=> b!427732 (= e!253521 (not e!253522))))

(declare-fun res!251027 () Bool)

(assert (=> b!427732 (=> res!251027 e!253522)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427732 (= res!251027 (not (validKeyInArray!0 (select (arr!12537 _keys!709) from!863))))))

(declare-fun lt!195310 () ListLongMap!6309)

(assert (=> b!427732 (= lt!195310 lt!195306)))

(declare-fun lt!195308 () ListLongMap!6309)

(assert (=> b!427732 (= lt!195306 (+!1349 lt!195308 (tuple2!7407 k0!794 v!412)))))

(assert (=> b!427732 (= lt!195310 (getCurrentListMapNoExtraKeys!1377 lt!195307 lt!195309 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427732 (= lt!195308 (getCurrentListMapNoExtraKeys!1377 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12536 0))(
  ( (Unit!12537) )
))
(declare-fun lt!195304 () Unit!12536)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!516 (array!26175 array!26177 (_ BitVec 32) (_ BitVec 32) V!16003 V!16003 (_ BitVec 32) (_ BitVec 64) V!16003 (_ BitVec 32) Int) Unit!12536)

(assert (=> b!427732 (= lt!195304 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!516 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427733 () Bool)

(declare-fun e!253526 () Bool)

(assert (=> b!427733 (= e!253526 (and e!253524 mapRes!18381))))

(declare-fun condMapEmpty!18381 () Bool)

(declare-fun mapDefault!18381 () ValueCell!5243)

(assert (=> b!427733 (= condMapEmpty!18381 (= (arr!12538 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5243)) mapDefault!18381)))))

(declare-fun b!427723 () Bool)

(declare-fun res!251024 () Bool)

(assert (=> b!427723 (=> (not res!251024) (not e!253523))))

(assert (=> b!427723 (= res!251024 (validKeyInArray!0 k0!794))))

(declare-fun res!251018 () Bool)

(assert (=> start!39740 (=> (not res!251018) (not e!253523))))

(assert (=> start!39740 (= res!251018 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12890 _keys!709))))))

(assert (=> start!39740 e!253523))

(assert (=> start!39740 tp_is_empty!11173))

(assert (=> start!39740 tp!35592))

(assert (=> start!39740 true))

(declare-fun array_inv!9164 (array!26177) Bool)

(assert (=> start!39740 (and (array_inv!9164 _values!549) e!253526)))

(declare-fun array_inv!9165 (array!26175) Bool)

(assert (=> start!39740 (array_inv!9165 _keys!709)))

(declare-fun b!427734 () Bool)

(declare-fun res!251025 () Bool)

(assert (=> b!427734 (=> (not res!251025) (not e!253523))))

(assert (=> b!427734 (= res!251025 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7405))))

(declare-fun b!427735 () Bool)

(declare-fun res!251023 () Bool)

(assert (=> b!427735 (=> (not res!251023) (not e!253523))))

(assert (=> b!427735 (= res!251023 (and (= (size!12891 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12890 _keys!709) (size!12891 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39740 res!251018) b!427719))

(assert (= (and b!427719 res!251030) b!427735))

(assert (= (and b!427735 res!251023) b!427726))

(assert (= (and b!427726 res!251022) b!427734))

(assert (= (and b!427734 res!251025) b!427729))

(assert (= (and b!427729 res!251020) b!427723))

(assert (= (and b!427723 res!251024) b!427724))

(assert (= (and b!427724 res!251021) b!427721))

(assert (= (and b!427721 res!251019) b!427720))

(assert (= (and b!427720 res!251028) b!427722))

(assert (= (and b!427722 res!251031) b!427725))

(assert (= (and b!427725 res!251026) b!427728))

(assert (= (and b!427728 res!251029) b!427732))

(assert (= (and b!427732 (not res!251027)) b!427730))

(assert (= (and b!427733 condMapEmpty!18381) mapIsEmpty!18381))

(assert (= (and b!427733 (not condMapEmpty!18381)) mapNonEmpty!18381))

(get-info :version)

(assert (= (and mapNonEmpty!18381 ((_ is ValueCellFull!5243) mapValue!18381)) b!427731))

(assert (= (and b!427733 ((_ is ValueCellFull!5243) mapDefault!18381)) b!427727))

(assert (= start!39740 b!427733))

(declare-fun b_lambda!9091 () Bool)

(assert (=> (not b_lambda!9091) (not b!427730)))

(declare-fun t!12868 () Bool)

(declare-fun tb!3419 () Bool)

(assert (=> (and start!39740 (= defaultEntry!557 defaultEntry!557) t!12868) tb!3419))

(declare-fun result!6373 () Bool)

(assert (=> tb!3419 (= result!6373 tp_is_empty!11173)))

(assert (=> b!427730 t!12868))

(declare-fun b_and!17677 () Bool)

(assert (= b_and!17675 (and (=> t!12868 result!6373) b_and!17677)))

(declare-fun m!415725 () Bool)

(assert (=> start!39740 m!415725))

(declare-fun m!415727 () Bool)

(assert (=> start!39740 m!415727))

(declare-fun m!415729 () Bool)

(assert (=> b!427723 m!415729))

(declare-fun m!415731 () Bool)

(assert (=> b!427734 m!415731))

(declare-fun m!415733 () Bool)

(assert (=> b!427721 m!415733))

(declare-fun m!415735 () Bool)

(assert (=> b!427726 m!415735))

(declare-fun m!415737 () Bool)

(assert (=> b!427732 m!415737))

(declare-fun m!415739 () Bool)

(assert (=> b!427732 m!415739))

(declare-fun m!415741 () Bool)

(assert (=> b!427732 m!415741))

(declare-fun m!415743 () Bool)

(assert (=> b!427732 m!415743))

(assert (=> b!427732 m!415737))

(declare-fun m!415745 () Bool)

(assert (=> b!427732 m!415745))

(declare-fun m!415747 () Bool)

(assert (=> b!427732 m!415747))

(declare-fun m!415749 () Bool)

(assert (=> mapNonEmpty!18381 m!415749))

(declare-fun m!415751 () Bool)

(assert (=> b!427720 m!415751))

(declare-fun m!415753 () Bool)

(assert (=> b!427720 m!415753))

(declare-fun m!415755 () Bool)

(assert (=> b!427722 m!415755))

(assert (=> b!427730 m!415737))

(declare-fun m!415757 () Bool)

(assert (=> b!427730 m!415757))

(declare-fun m!415759 () Bool)

(assert (=> b!427730 m!415759))

(declare-fun m!415761 () Bool)

(assert (=> b!427730 m!415761))

(assert (=> b!427730 m!415761))

(assert (=> b!427730 m!415757))

(declare-fun m!415763 () Bool)

(assert (=> b!427730 m!415763))

(declare-fun m!415765 () Bool)

(assert (=> b!427724 m!415765))

(declare-fun m!415767 () Bool)

(assert (=> b!427719 m!415767))

(declare-fun m!415769 () Bool)

(assert (=> b!427728 m!415769))

(declare-fun m!415771 () Bool)

(assert (=> b!427728 m!415771))

(declare-fun m!415773 () Bool)

(assert (=> b!427728 m!415773))

(check-sat (not b!427734) (not b_next!10021) (not b!427728) b_and!17677 (not start!39740) (not b!427730) (not b!427721) (not b!427719) (not b!427732) (not b!427723) (not b!427720) (not b_lambda!9091) (not mapNonEmpty!18381) (not b!427726) tp_is_empty!11173 (not b!427722))
(check-sat b_and!17677 (not b_next!10021))
