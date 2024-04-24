; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40662 () Bool)

(assert start!40662)

(declare-fun b_free!10687 () Bool)

(declare-fun b_next!10687 () Bool)

(assert (=> start!40662 (= b_free!10687 (not b_next!10687))))

(declare-fun tp!37880 () Bool)

(declare-fun b_and!18709 () Bool)

(assert (=> start!40662 (= tp!37880 b_and!18709)))

(declare-fun b!449578 () Bool)

(declare-fun e!263571 () Bool)

(assert (=> b!449578 (= e!263571 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17139 0))(
  ( (V!17140 (val!6057 Int)) )
))
(declare-fun minValue!515 () V!17139)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5669 0))(
  ( (ValueCellFull!5669 (v!8313 V!17139)) (EmptyCell!5669) )
))
(declare-datatypes ((array!27852 0))(
  ( (array!27853 (arr!13371 (Array (_ BitVec 32) ValueCell!5669)) (size!13723 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27852)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27854 0))(
  ( (array!27855 (arr!13372 (Array (_ BitVec 32) (_ BitVec 64))) (size!13724 (_ BitVec 32))) )
))
(declare-fun lt!204424 () array!27854)

(declare-fun v!412 () V!17139)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7858 0))(
  ( (tuple2!7859 (_1!3940 (_ BitVec 64)) (_2!3940 V!17139)) )
))
(declare-datatypes ((List!7929 0))(
  ( (Nil!7926) (Cons!7925 (h!8781 tuple2!7858) (t!13683 List!7929)) )
))
(declare-datatypes ((ListLongMap!6773 0))(
  ( (ListLongMap!6774 (toList!3402 List!7929)) )
))
(declare-fun lt!204422 () ListLongMap!6773)

(declare-fun zeroValue!515 () V!17139)

(declare-fun getCurrentListMapNoExtraKeys!1632 (array!27854 array!27852 (_ BitVec 32) (_ BitVec 32) V!17139 V!17139 (_ BitVec 32) Int) ListLongMap!6773)

(assert (=> b!449578 (= lt!204422 (getCurrentListMapNoExtraKeys!1632 lt!204424 (array!27853 (store (arr!13371 _values!549) i!563 (ValueCellFull!5669 v!412)) (size!13723 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204423 () ListLongMap!6773)

(declare-fun _keys!709 () array!27854)

(assert (=> b!449578 (= lt!204423 (getCurrentListMapNoExtraKeys!1632 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449580 () Bool)

(declare-fun res!267489 () Bool)

(declare-fun e!263570 () Bool)

(assert (=> b!449580 (=> (not res!267489) (not e!263570))))

(assert (=> b!449580 (= res!267489 (or (= (select (arr!13372 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13372 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19671 () Bool)

(declare-fun mapRes!19671 () Bool)

(declare-fun tp!37881 () Bool)

(declare-fun e!263574 () Bool)

(assert (=> mapNonEmpty!19671 (= mapRes!19671 (and tp!37881 e!263574))))

(declare-fun mapRest!19671 () (Array (_ BitVec 32) ValueCell!5669))

(declare-fun mapKey!19671 () (_ BitVec 32))

(declare-fun mapValue!19671 () ValueCell!5669)

(assert (=> mapNonEmpty!19671 (= (arr!13371 _values!549) (store mapRest!19671 mapKey!19671 mapValue!19671))))

(declare-fun mapIsEmpty!19671 () Bool)

(assert (=> mapIsEmpty!19671 mapRes!19671))

(declare-fun b!449581 () Bool)

(declare-fun e!263573 () Bool)

(declare-fun tp_is_empty!12025 () Bool)

(assert (=> b!449581 (= e!263573 tp_is_empty!12025)))

(declare-fun b!449582 () Bool)

(declare-fun res!267492 () Bool)

(assert (=> b!449582 (=> (not res!267492) (not e!263570))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449582 (= res!267492 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449583 () Bool)

(declare-fun res!267481 () Bool)

(assert (=> b!449583 (=> (not res!267481) (not e!263570))))

(assert (=> b!449583 (= res!267481 (and (= (size!13723 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13724 _keys!709) (size!13723 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449584 () Bool)

(assert (=> b!449584 (= e!263570 e!263571)))

(declare-fun res!267482 () Bool)

(assert (=> b!449584 (=> (not res!267482) (not e!263571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27854 (_ BitVec 32)) Bool)

(assert (=> b!449584 (= res!267482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204424 mask!1025))))

(assert (=> b!449584 (= lt!204424 (array!27855 (store (arr!13372 _keys!709) i!563 k0!794) (size!13724 _keys!709)))))

(declare-fun b!449585 () Bool)

(declare-fun res!267490 () Bool)

(assert (=> b!449585 (=> (not res!267490) (not e!263570))))

(assert (=> b!449585 (= res!267490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449586 () Bool)

(declare-fun res!267487 () Bool)

(assert (=> b!449586 (=> (not res!267487) (not e!263570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449586 (= res!267487 (validKeyInArray!0 k0!794))))

(declare-fun b!449587 () Bool)

(declare-fun res!267491 () Bool)

(assert (=> b!449587 (=> (not res!267491) (not e!263571))))

(declare-datatypes ((List!7930 0))(
  ( (Nil!7927) (Cons!7926 (h!8782 (_ BitVec 64)) (t!13684 List!7930)) )
))
(declare-fun arrayNoDuplicates!0 (array!27854 (_ BitVec 32) List!7930) Bool)

(assert (=> b!449587 (= res!267491 (arrayNoDuplicates!0 lt!204424 #b00000000000000000000000000000000 Nil!7927))))

(declare-fun b!449579 () Bool)

(declare-fun res!267486 () Bool)

(assert (=> b!449579 (=> (not res!267486) (not e!263570))))

(assert (=> b!449579 (= res!267486 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7927))))

(declare-fun res!267488 () Bool)

(assert (=> start!40662 (=> (not res!267488) (not e!263570))))

(assert (=> start!40662 (= res!267488 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13724 _keys!709))))))

(assert (=> start!40662 e!263570))

(assert (=> start!40662 tp_is_empty!12025))

(assert (=> start!40662 tp!37880))

(assert (=> start!40662 true))

(declare-fun e!263572 () Bool)

(declare-fun array_inv!9766 (array!27852) Bool)

(assert (=> start!40662 (and (array_inv!9766 _values!549) e!263572)))

(declare-fun array_inv!9767 (array!27854) Bool)

(assert (=> start!40662 (array_inv!9767 _keys!709)))

(declare-fun b!449588 () Bool)

(assert (=> b!449588 (= e!263572 (and e!263573 mapRes!19671))))

(declare-fun condMapEmpty!19671 () Bool)

(declare-fun mapDefault!19671 () ValueCell!5669)

(assert (=> b!449588 (= condMapEmpty!19671 (= (arr!13371 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5669)) mapDefault!19671)))))

(declare-fun b!449589 () Bool)

(declare-fun res!267484 () Bool)

(assert (=> b!449589 (=> (not res!267484) (not e!263570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449589 (= res!267484 (validMask!0 mask!1025))))

(declare-fun b!449590 () Bool)

(declare-fun res!267483 () Bool)

(assert (=> b!449590 (=> (not res!267483) (not e!263570))))

(assert (=> b!449590 (= res!267483 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13724 _keys!709))))))

(declare-fun b!449591 () Bool)

(declare-fun res!267485 () Bool)

(assert (=> b!449591 (=> (not res!267485) (not e!263571))))

(assert (=> b!449591 (= res!267485 (bvsle from!863 i!563))))

(declare-fun b!449592 () Bool)

(assert (=> b!449592 (= e!263574 tp_is_empty!12025)))

(assert (= (and start!40662 res!267488) b!449589))

(assert (= (and b!449589 res!267484) b!449583))

(assert (= (and b!449583 res!267481) b!449585))

(assert (= (and b!449585 res!267490) b!449579))

(assert (= (and b!449579 res!267486) b!449590))

(assert (= (and b!449590 res!267483) b!449586))

(assert (= (and b!449586 res!267487) b!449580))

(assert (= (and b!449580 res!267489) b!449582))

(assert (= (and b!449582 res!267492) b!449584))

(assert (= (and b!449584 res!267482) b!449587))

(assert (= (and b!449587 res!267491) b!449591))

(assert (= (and b!449591 res!267485) b!449578))

(assert (= (and b!449588 condMapEmpty!19671) mapIsEmpty!19671))

(assert (= (and b!449588 (not condMapEmpty!19671)) mapNonEmpty!19671))

(get-info :version)

(assert (= (and mapNonEmpty!19671 ((_ is ValueCellFull!5669) mapValue!19671)) b!449592))

(assert (= (and b!449588 ((_ is ValueCellFull!5669) mapDefault!19671)) b!449581))

(assert (= start!40662 b!449588))

(declare-fun m!434001 () Bool)

(assert (=> b!449589 m!434001))

(declare-fun m!434003 () Bool)

(assert (=> b!449585 m!434003))

(declare-fun m!434005 () Bool)

(assert (=> b!449580 m!434005))

(declare-fun m!434007 () Bool)

(assert (=> b!449579 m!434007))

(declare-fun m!434009 () Bool)

(assert (=> mapNonEmpty!19671 m!434009))

(declare-fun m!434011 () Bool)

(assert (=> b!449586 m!434011))

(declare-fun m!434013 () Bool)

(assert (=> b!449584 m!434013))

(declare-fun m!434015 () Bool)

(assert (=> b!449584 m!434015))

(declare-fun m!434017 () Bool)

(assert (=> b!449587 m!434017))

(declare-fun m!434019 () Bool)

(assert (=> start!40662 m!434019))

(declare-fun m!434021 () Bool)

(assert (=> start!40662 m!434021))

(declare-fun m!434023 () Bool)

(assert (=> b!449582 m!434023))

(declare-fun m!434025 () Bool)

(assert (=> b!449578 m!434025))

(declare-fun m!434027 () Bool)

(assert (=> b!449578 m!434027))

(declare-fun m!434029 () Bool)

(assert (=> b!449578 m!434029))

(check-sat (not b!449578) (not mapNonEmpty!19671) (not start!40662) (not b!449582) b_and!18709 (not b!449587) (not b!449586) tp_is_empty!12025 (not b!449589) (not b!449579) (not b!449584) (not b!449585) (not b_next!10687))
(check-sat b_and!18709 (not b_next!10687))
