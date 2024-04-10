; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40666 () Bool)

(assert start!40666)

(declare-fun b_free!10677 () Bool)

(declare-fun b_next!10677 () Bool)

(assert (=> start!40666 (= b_free!10677 (not b_next!10677))))

(declare-fun tp!37850 () Bool)

(declare-fun b_and!18685 () Bool)

(assert (=> start!40666 (= tp!37850 b_and!18685)))

(declare-fun b!449402 () Bool)

(declare-fun res!267304 () Bool)

(declare-fun e!263516 () Bool)

(assert (=> b!449402 (=> (not res!267304) (not e!263516))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27837 0))(
  ( (array!27838 (arr!13364 (Array (_ BitVec 32) (_ BitVec 64))) (size!13716 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27837)

(assert (=> b!449402 (= res!267304 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13716 _keys!709))))))

(declare-fun b!449403 () Bool)

(declare-fun res!267308 () Bool)

(declare-fun e!263515 () Bool)

(assert (=> b!449403 (=> (not res!267308) (not e!263515))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!449403 (= res!267308 (bvsle from!863 i!563))))

(declare-fun b!449404 () Bool)

(declare-fun res!267310 () Bool)

(assert (=> b!449404 (=> (not res!267310) (not e!263516))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27837 (_ BitVec 32)) Bool)

(assert (=> b!449404 (= res!267310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!267314 () Bool)

(assert (=> start!40666 (=> (not res!267314) (not e!263516))))

(assert (=> start!40666 (= res!267314 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13716 _keys!709))))))

(assert (=> start!40666 e!263516))

(declare-fun tp_is_empty!12015 () Bool)

(assert (=> start!40666 tp_is_empty!12015))

(assert (=> start!40666 tp!37850))

(assert (=> start!40666 true))

(declare-datatypes ((V!17125 0))(
  ( (V!17126 (val!6052 Int)) )
))
(declare-datatypes ((ValueCell!5664 0))(
  ( (ValueCellFull!5664 (v!8307 V!17125)) (EmptyCell!5664) )
))
(declare-datatypes ((array!27839 0))(
  ( (array!27840 (arr!13365 (Array (_ BitVec 32) ValueCell!5664)) (size!13717 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27839)

(declare-fun e!263512 () Bool)

(declare-fun array_inv!9684 (array!27839) Bool)

(assert (=> start!40666 (and (array_inv!9684 _values!549) e!263512)))

(declare-fun array_inv!9685 (array!27837) Bool)

(assert (=> start!40666 (array_inv!9685 _keys!709)))

(declare-fun b!449405 () Bool)

(declare-fun e!263514 () Bool)

(assert (=> b!449405 (= e!263514 tp_is_empty!12015)))

(declare-fun b!449406 () Bool)

(assert (=> b!449406 (= e!263515 false)))

(declare-fun minValue!515 () V!17125)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7948 0))(
  ( (tuple2!7949 (_1!3985 (_ BitVec 64)) (_2!3985 V!17125)) )
))
(declare-datatypes ((List!8013 0))(
  ( (Nil!8010) (Cons!8009 (h!8865 tuple2!7948) (t!13775 List!8013)) )
))
(declare-datatypes ((ListLongMap!6861 0))(
  ( (ListLongMap!6862 (toList!3446 List!8013)) )
))
(declare-fun lt!204360 () ListLongMap!6861)

(declare-fun zeroValue!515 () V!17125)

(declare-fun v!412 () V!17125)

(declare-fun lt!204359 () array!27837)

(declare-fun getCurrentListMapNoExtraKeys!1632 (array!27837 array!27839 (_ BitVec 32) (_ BitVec 32) V!17125 V!17125 (_ BitVec 32) Int) ListLongMap!6861)

(assert (=> b!449406 (= lt!204360 (getCurrentListMapNoExtraKeys!1632 lt!204359 (array!27840 (store (arr!13365 _values!549) i!563 (ValueCellFull!5664 v!412)) (size!13717 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204358 () ListLongMap!6861)

(assert (=> b!449406 (= lt!204358 (getCurrentListMapNoExtraKeys!1632 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449407 () Bool)

(assert (=> b!449407 (= e!263516 e!263515)))

(declare-fun res!267312 () Bool)

(assert (=> b!449407 (=> (not res!267312) (not e!263515))))

(assert (=> b!449407 (= res!267312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204359 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!449407 (= lt!204359 (array!27838 (store (arr!13364 _keys!709) i!563 k0!794) (size!13716 _keys!709)))))

(declare-fun b!449408 () Bool)

(declare-fun res!267305 () Bool)

(assert (=> b!449408 (=> (not res!267305) (not e!263516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449408 (= res!267305 (validMask!0 mask!1025))))

(declare-fun b!449409 () Bool)

(declare-fun res!267309 () Bool)

(assert (=> b!449409 (=> (not res!267309) (not e!263516))))

(assert (=> b!449409 (= res!267309 (and (= (size!13717 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13716 _keys!709) (size!13717 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449410 () Bool)

(declare-fun res!267311 () Bool)

(assert (=> b!449410 (=> (not res!267311) (not e!263516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449410 (= res!267311 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19656 () Bool)

(declare-fun mapRes!19656 () Bool)

(declare-fun tp!37851 () Bool)

(assert (=> mapNonEmpty!19656 (= mapRes!19656 (and tp!37851 e!263514))))

(declare-fun mapRest!19656 () (Array (_ BitVec 32) ValueCell!5664))

(declare-fun mapValue!19656 () ValueCell!5664)

(declare-fun mapKey!19656 () (_ BitVec 32))

(assert (=> mapNonEmpty!19656 (= (arr!13365 _values!549) (store mapRest!19656 mapKey!19656 mapValue!19656))))

(declare-fun mapIsEmpty!19656 () Bool)

(assert (=> mapIsEmpty!19656 mapRes!19656))

(declare-fun b!449411 () Bool)

(declare-fun res!267313 () Bool)

(assert (=> b!449411 (=> (not res!267313) (not e!263516))))

(assert (=> b!449411 (= res!267313 (or (= (select (arr!13364 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13364 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449412 () Bool)

(declare-fun res!267307 () Bool)

(assert (=> b!449412 (=> (not res!267307) (not e!263516))))

(declare-datatypes ((List!8014 0))(
  ( (Nil!8011) (Cons!8010 (h!8866 (_ BitVec 64)) (t!13776 List!8014)) )
))
(declare-fun arrayNoDuplicates!0 (array!27837 (_ BitVec 32) List!8014) Bool)

(assert (=> b!449412 (= res!267307 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8011))))

(declare-fun b!449413 () Bool)

(declare-fun res!267315 () Bool)

(assert (=> b!449413 (=> (not res!267315) (not e!263515))))

(assert (=> b!449413 (= res!267315 (arrayNoDuplicates!0 lt!204359 #b00000000000000000000000000000000 Nil!8011))))

(declare-fun b!449414 () Bool)

(declare-fun e!263511 () Bool)

(assert (=> b!449414 (= e!263511 tp_is_empty!12015)))

(declare-fun b!449415 () Bool)

(assert (=> b!449415 (= e!263512 (and e!263511 mapRes!19656))))

(declare-fun condMapEmpty!19656 () Bool)

(declare-fun mapDefault!19656 () ValueCell!5664)

(assert (=> b!449415 (= condMapEmpty!19656 (= (arr!13365 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5664)) mapDefault!19656)))))

(declare-fun b!449416 () Bool)

(declare-fun res!267306 () Bool)

(assert (=> b!449416 (=> (not res!267306) (not e!263516))))

(declare-fun arrayContainsKey!0 (array!27837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449416 (= res!267306 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40666 res!267314) b!449408))

(assert (= (and b!449408 res!267305) b!449409))

(assert (= (and b!449409 res!267309) b!449404))

(assert (= (and b!449404 res!267310) b!449412))

(assert (= (and b!449412 res!267307) b!449402))

(assert (= (and b!449402 res!267304) b!449410))

(assert (= (and b!449410 res!267311) b!449411))

(assert (= (and b!449411 res!267313) b!449416))

(assert (= (and b!449416 res!267306) b!449407))

(assert (= (and b!449407 res!267312) b!449413))

(assert (= (and b!449413 res!267315) b!449403))

(assert (= (and b!449403 res!267308) b!449406))

(assert (= (and b!449415 condMapEmpty!19656) mapIsEmpty!19656))

(assert (= (and b!449415 (not condMapEmpty!19656)) mapNonEmpty!19656))

(get-info :version)

(assert (= (and mapNonEmpty!19656 ((_ is ValueCellFull!5664) mapValue!19656)) b!449405))

(assert (= (and b!449415 ((_ is ValueCellFull!5664) mapDefault!19656)) b!449414))

(assert (= start!40666 b!449415))

(declare-fun m!433633 () Bool)

(assert (=> b!449408 m!433633))

(declare-fun m!433635 () Bool)

(assert (=> b!449416 m!433635))

(declare-fun m!433637 () Bool)

(assert (=> start!40666 m!433637))

(declare-fun m!433639 () Bool)

(assert (=> start!40666 m!433639))

(declare-fun m!433641 () Bool)

(assert (=> b!449404 m!433641))

(declare-fun m!433643 () Bool)

(assert (=> b!449406 m!433643))

(declare-fun m!433645 () Bool)

(assert (=> b!449406 m!433645))

(declare-fun m!433647 () Bool)

(assert (=> b!449406 m!433647))

(declare-fun m!433649 () Bool)

(assert (=> b!449411 m!433649))

(declare-fun m!433651 () Bool)

(assert (=> b!449410 m!433651))

(declare-fun m!433653 () Bool)

(assert (=> b!449407 m!433653))

(declare-fun m!433655 () Bool)

(assert (=> b!449407 m!433655))

(declare-fun m!433657 () Bool)

(assert (=> b!449413 m!433657))

(declare-fun m!433659 () Bool)

(assert (=> b!449412 m!433659))

(declare-fun m!433661 () Bool)

(assert (=> mapNonEmpty!19656 m!433661))

(check-sat (not b_next!10677) (not b!449413) tp_is_empty!12015 (not start!40666) (not b!449408) (not b!449404) b_and!18685 (not b!449410) (not mapNonEmpty!19656) (not b!449412) (not b!449406) (not b!449407) (not b!449416))
(check-sat b_and!18685 (not b_next!10677))
