; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40786 () Bool)

(assert start!40786)

(declare-fun b_free!10789 () Bool)

(declare-fun b_next!10789 () Bool)

(assert (=> start!40786 (= b_free!10789 (not b_next!10789))))

(declare-fun tp!38190 () Bool)

(declare-fun b_and!18875 () Bool)

(assert (=> start!40786 (= tp!38190 b_and!18875)))

(declare-fun b!452587 () Bool)

(declare-fun res!269633 () Bool)

(declare-fun e!264974 () Bool)

(assert (=> b!452587 (=> (not res!269633) (not e!264974))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452587 (= res!269633 (validKeyInArray!0 k0!794))))

(declare-fun b!452588 () Bool)

(declare-fun e!264971 () Bool)

(declare-fun e!264970 () Bool)

(assert (=> b!452588 (= e!264971 (not e!264970))))

(declare-fun res!269632 () Bool)

(assert (=> b!452588 (=> res!269632 e!264970)))

(declare-datatypes ((array!28050 0))(
  ( (array!28051 (arr!13469 (Array (_ BitVec 32) (_ BitVec 64))) (size!13821 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28050)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!452588 (= res!269632 (validKeyInArray!0 (select (arr!13469 _keys!709) from!863)))))

(declare-fun e!264966 () Bool)

(assert (=> b!452588 e!264966))

(declare-fun c!56105 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452588 (= c!56105 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!17275 0))(
  ( (V!17276 (val!6108 Int)) )
))
(declare-fun minValue!515 () V!17275)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5720 0))(
  ( (ValueCellFull!5720 (v!8368 V!17275)) (EmptyCell!5720) )
))
(declare-datatypes ((array!28052 0))(
  ( (array!28053 (arr!13470 (Array (_ BitVec 32) ValueCell!5720)) (size!13822 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28052)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17275)

(declare-datatypes ((Unit!13219 0))(
  ( (Unit!13220) )
))
(declare-fun lt!205368 () Unit!13219)

(declare-fun v!412 () V!17275)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!730 (array!28050 array!28052 (_ BitVec 32) (_ BitVec 32) V!17275 V!17275 (_ BitVec 32) (_ BitVec 64) V!17275 (_ BitVec 32) Int) Unit!13219)

(assert (=> b!452588 (= lt!205368 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!730 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452589 () Bool)

(declare-fun res!269627 () Bool)

(declare-fun e!264968 () Bool)

(assert (=> b!452589 (=> (not res!269627) (not e!264968))))

(declare-fun lt!205374 () array!28050)

(declare-datatypes ((List!8011 0))(
  ( (Nil!8008) (Cons!8007 (h!8863 (_ BitVec 64)) (t!13815 List!8011)) )
))
(declare-fun arrayNoDuplicates!0 (array!28050 (_ BitVec 32) List!8011) Bool)

(assert (=> b!452589 (= res!269627 (arrayNoDuplicates!0 lt!205374 #b00000000000000000000000000000000 Nil!8008))))

(declare-fun b!452590 () Bool)

(declare-fun res!269629 () Bool)

(assert (=> b!452590 (=> (not res!269629) (not e!264974))))

(assert (=> b!452590 (= res!269629 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13821 _keys!709))))))

(declare-fun b!452591 () Bool)

(declare-fun res!269628 () Bool)

(assert (=> b!452591 (=> (not res!269628) (not e!264968))))

(assert (=> b!452591 (= res!269628 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19827 () Bool)

(declare-fun mapRes!19827 () Bool)

(assert (=> mapIsEmpty!19827 mapRes!19827))

(declare-fun b!452592 () Bool)

(declare-fun e!264969 () Bool)

(declare-fun tp_is_empty!12127 () Bool)

(assert (=> b!452592 (= e!264969 tp_is_empty!12127)))

(declare-fun b!452593 () Bool)

(declare-fun res!269625 () Bool)

(assert (=> b!452593 (=> (not res!269625) (not e!264974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452593 (= res!269625 (validMask!0 mask!1025))))

(declare-fun b!452594 () Bool)

(declare-fun e!264972 () Bool)

(declare-fun e!264967 () Bool)

(assert (=> b!452594 (= e!264972 (and e!264967 mapRes!19827))))

(declare-fun condMapEmpty!19827 () Bool)

(declare-fun mapDefault!19827 () ValueCell!5720)

(assert (=> b!452594 (= condMapEmpty!19827 (= (arr!13470 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5720)) mapDefault!19827)))))

(declare-fun res!269626 () Bool)

(assert (=> start!40786 (=> (not res!269626) (not e!264974))))

(assert (=> start!40786 (= res!269626 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13821 _keys!709))))))

(assert (=> start!40786 e!264974))

(assert (=> start!40786 tp_is_empty!12127))

(assert (=> start!40786 tp!38190))

(assert (=> start!40786 true))

(declare-fun array_inv!9836 (array!28052) Bool)

(assert (=> start!40786 (and (array_inv!9836 _values!549) e!264972)))

(declare-fun array_inv!9837 (array!28050) Bool)

(assert (=> start!40786 (array_inv!9837 _keys!709)))

(declare-fun b!452595 () Bool)

(assert (=> b!452595 (= e!264974 e!264968)))

(declare-fun res!269637 () Bool)

(assert (=> b!452595 (=> (not res!269637) (not e!264968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28050 (_ BitVec 32)) Bool)

(assert (=> b!452595 (= res!269637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205374 mask!1025))))

(assert (=> b!452595 (= lt!205374 (array!28051 (store (arr!13469 _keys!709) i!563 k0!794) (size!13821 _keys!709)))))

(declare-datatypes ((tuple2!7944 0))(
  ( (tuple2!7945 (_1!3983 (_ BitVec 64)) (_2!3983 V!17275)) )
))
(declare-datatypes ((List!8012 0))(
  ( (Nil!8009) (Cons!8008 (h!8864 tuple2!7944) (t!13816 List!8012)) )
))
(declare-datatypes ((ListLongMap!6859 0))(
  ( (ListLongMap!6860 (toList!3445 List!8012)) )
))
(declare-fun call!29967 () ListLongMap!6859)

(declare-fun bm!29963 () Bool)

(declare-fun lt!205372 () array!28052)

(declare-fun getCurrentListMapNoExtraKeys!1674 (array!28050 array!28052 (_ BitVec 32) (_ BitVec 32) V!17275 V!17275 (_ BitVec 32) Int) ListLongMap!6859)

(assert (=> bm!29963 (= call!29967 (getCurrentListMapNoExtraKeys!1674 (ite c!56105 lt!205374 _keys!709) (ite c!56105 lt!205372 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29964 () Bool)

(declare-fun call!29966 () ListLongMap!6859)

(assert (=> bm!29964 (= call!29966 (getCurrentListMapNoExtraKeys!1674 (ite c!56105 _keys!709 lt!205374) (ite c!56105 _values!549 lt!205372) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452596 () Bool)

(assert (=> b!452596 (= e!264968 e!264971)))

(declare-fun res!269635 () Bool)

(assert (=> b!452596 (=> (not res!269635) (not e!264971))))

(assert (=> b!452596 (= res!269635 (= from!863 i!563))))

(declare-fun lt!205369 () ListLongMap!6859)

(assert (=> b!452596 (= lt!205369 (getCurrentListMapNoExtraKeys!1674 lt!205374 lt!205372 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452596 (= lt!205372 (array!28053 (store (arr!13470 _values!549) i!563 (ValueCellFull!5720 v!412)) (size!13822 _values!549)))))

(declare-fun lt!205373 () ListLongMap!6859)

(assert (=> b!452596 (= lt!205373 (getCurrentListMapNoExtraKeys!1674 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452597 () Bool)

(declare-fun res!269631 () Bool)

(assert (=> b!452597 (=> (not res!269631) (not e!264974))))

(assert (=> b!452597 (= res!269631 (and (= (size!13822 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13821 _keys!709) (size!13822 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452598 () Bool)

(assert (=> b!452598 (= e!264970 true)))

(declare-fun lt!205376 () V!17275)

(declare-fun lt!205366 () tuple2!7944)

(declare-fun lt!205375 () ListLongMap!6859)

(declare-fun +!1570 (ListLongMap!6859 tuple2!7944) ListLongMap!6859)

(assert (=> b!452598 (= (+!1570 lt!205375 lt!205366) (+!1570 (+!1570 lt!205375 (tuple2!7945 k0!794 lt!205376)) lt!205366))))

(declare-fun lt!205371 () V!17275)

(assert (=> b!452598 (= lt!205366 (tuple2!7945 k0!794 lt!205371))))

(declare-fun lt!205367 () Unit!13219)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!86 (ListLongMap!6859 (_ BitVec 64) V!17275 V!17275) Unit!13219)

(assert (=> b!452598 (= lt!205367 (addSameAsAddTwiceSameKeyDiffValues!86 lt!205375 k0!794 lt!205376 lt!205371))))

(declare-fun lt!205370 () V!17275)

(declare-fun get!6649 (ValueCell!5720 V!17275) V!17275)

(assert (=> b!452598 (= lt!205376 (get!6649 (select (arr!13470 _values!549) from!863) lt!205370))))

(assert (=> b!452598 (= lt!205369 (+!1570 lt!205375 (tuple2!7945 (select (arr!13469 lt!205374) from!863) lt!205371)))))

(assert (=> b!452598 (= lt!205371 (get!6649 (select (store (arr!13470 _values!549) i!563 (ValueCellFull!5720 v!412)) from!863) lt!205370))))

(declare-fun dynLambda!868 (Int (_ BitVec 64)) V!17275)

(assert (=> b!452598 (= lt!205370 (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452598 (= lt!205375 (getCurrentListMapNoExtraKeys!1674 lt!205374 lt!205372 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452599 () Bool)

(assert (=> b!452599 (= e!264966 (= call!29966 call!29967))))

(declare-fun b!452600 () Bool)

(assert (=> b!452600 (= e!264967 tp_is_empty!12127)))

(declare-fun b!452601 () Bool)

(declare-fun res!269638 () Bool)

(assert (=> b!452601 (=> (not res!269638) (not e!264974))))

(assert (=> b!452601 (= res!269638 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8008))))

(declare-fun b!452602 () Bool)

(declare-fun res!269636 () Bool)

(assert (=> b!452602 (=> (not res!269636) (not e!264974))))

(assert (=> b!452602 (= res!269636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19827 () Bool)

(declare-fun tp!38189 () Bool)

(assert (=> mapNonEmpty!19827 (= mapRes!19827 (and tp!38189 e!264969))))

(declare-fun mapKey!19827 () (_ BitVec 32))

(declare-fun mapValue!19827 () ValueCell!5720)

(declare-fun mapRest!19827 () (Array (_ BitVec 32) ValueCell!5720))

(assert (=> mapNonEmpty!19827 (= (arr!13470 _values!549) (store mapRest!19827 mapKey!19827 mapValue!19827))))

(declare-fun b!452603 () Bool)

(declare-fun res!269630 () Bool)

(assert (=> b!452603 (=> (not res!269630) (not e!264974))))

(declare-fun arrayContainsKey!0 (array!28050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452603 (= res!269630 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452604 () Bool)

(declare-fun res!269634 () Bool)

(assert (=> b!452604 (=> (not res!269634) (not e!264974))))

(assert (=> b!452604 (= res!269634 (or (= (select (arr!13469 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13469 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452605 () Bool)

(assert (=> b!452605 (= e!264966 (= call!29967 (+!1570 call!29966 (tuple2!7945 k0!794 v!412))))))

(assert (= (and start!40786 res!269626) b!452593))

(assert (= (and b!452593 res!269625) b!452597))

(assert (= (and b!452597 res!269631) b!452602))

(assert (= (and b!452602 res!269636) b!452601))

(assert (= (and b!452601 res!269638) b!452590))

(assert (= (and b!452590 res!269629) b!452587))

(assert (= (and b!452587 res!269633) b!452604))

(assert (= (and b!452604 res!269634) b!452603))

(assert (= (and b!452603 res!269630) b!452595))

(assert (= (and b!452595 res!269637) b!452589))

(assert (= (and b!452589 res!269627) b!452591))

(assert (= (and b!452591 res!269628) b!452596))

(assert (= (and b!452596 res!269635) b!452588))

(assert (= (and b!452588 c!56105) b!452605))

(assert (= (and b!452588 (not c!56105)) b!452599))

(assert (= (or b!452605 b!452599) bm!29963))

(assert (= (or b!452605 b!452599) bm!29964))

(assert (= (and b!452588 (not res!269632)) b!452598))

(assert (= (and b!452594 condMapEmpty!19827) mapIsEmpty!19827))

(assert (= (and b!452594 (not condMapEmpty!19827)) mapNonEmpty!19827))

(get-info :version)

(assert (= (and mapNonEmpty!19827 ((_ is ValueCellFull!5720) mapValue!19827)) b!452592))

(assert (= (and b!452594 ((_ is ValueCellFull!5720) mapDefault!19827)) b!452600))

(assert (= start!40786 b!452594))

(declare-fun b_lambda!9581 () Bool)

(assert (=> (not b_lambda!9581) (not b!452598)))

(declare-fun t!13814 () Bool)

(declare-fun tb!3761 () Bool)

(assert (=> (and start!40786 (= defaultEntry!557 defaultEntry!557) t!13814) tb!3761))

(declare-fun result!7067 () Bool)

(assert (=> tb!3761 (= result!7067 tp_is_empty!12127)))

(assert (=> b!452598 t!13814))

(declare-fun b_and!18877 () Bool)

(assert (= b_and!18875 (and (=> t!13814 result!7067) b_and!18877)))

(declare-fun m!436573 () Bool)

(assert (=> b!452595 m!436573))

(declare-fun m!436575 () Bool)

(assert (=> b!452595 m!436575))

(declare-fun m!436577 () Bool)

(assert (=> bm!29964 m!436577))

(declare-fun m!436579 () Bool)

(assert (=> mapNonEmpty!19827 m!436579))

(declare-fun m!436581 () Bool)

(assert (=> b!452604 m!436581))

(declare-fun m!436583 () Bool)

(assert (=> b!452605 m!436583))

(declare-fun m!436585 () Bool)

(assert (=> bm!29963 m!436585))

(declare-fun m!436587 () Bool)

(assert (=> b!452603 m!436587))

(declare-fun m!436589 () Bool)

(assert (=> start!40786 m!436589))

(declare-fun m!436591 () Bool)

(assert (=> start!40786 m!436591))

(declare-fun m!436593 () Bool)

(assert (=> b!452601 m!436593))

(declare-fun m!436595 () Bool)

(assert (=> b!452593 m!436595))

(declare-fun m!436597 () Bool)

(assert (=> b!452596 m!436597))

(declare-fun m!436599 () Bool)

(assert (=> b!452596 m!436599))

(declare-fun m!436601 () Bool)

(assert (=> b!452596 m!436601))

(declare-fun m!436603 () Bool)

(assert (=> b!452589 m!436603))

(declare-fun m!436605 () Bool)

(assert (=> b!452598 m!436605))

(declare-fun m!436607 () Bool)

(assert (=> b!452598 m!436607))

(declare-fun m!436609 () Bool)

(assert (=> b!452598 m!436609))

(declare-fun m!436611 () Bool)

(assert (=> b!452598 m!436611))

(assert (=> b!452598 m!436599))

(declare-fun m!436613 () Bool)

(assert (=> b!452598 m!436613))

(declare-fun m!436615 () Bool)

(assert (=> b!452598 m!436615))

(assert (=> b!452598 m!436613))

(declare-fun m!436617 () Bool)

(assert (=> b!452598 m!436617))

(declare-fun m!436619 () Bool)

(assert (=> b!452598 m!436619))

(declare-fun m!436621 () Bool)

(assert (=> b!452598 m!436621))

(assert (=> b!452598 m!436607))

(declare-fun m!436623 () Bool)

(assert (=> b!452598 m!436623))

(declare-fun m!436625 () Bool)

(assert (=> b!452598 m!436625))

(assert (=> b!452598 m!436621))

(declare-fun m!436627 () Bool)

(assert (=> b!452598 m!436627))

(declare-fun m!436629 () Bool)

(assert (=> b!452602 m!436629))

(declare-fun m!436631 () Bool)

(assert (=> b!452587 m!436631))

(declare-fun m!436633 () Bool)

(assert (=> b!452588 m!436633))

(assert (=> b!452588 m!436633))

(declare-fun m!436635 () Bool)

(assert (=> b!452588 m!436635))

(declare-fun m!436637 () Bool)

(assert (=> b!452588 m!436637))

(check-sat (not b!452588) (not b!452605) (not bm!29964) (not b!452596) (not mapNonEmpty!19827) (not b!452595) (not b!452602) (not b!452589) (not b!452601) (not b!452593) tp_is_empty!12127 (not b!452598) (not start!40786) b_and!18877 (not b!452587) (not b!452603) (not b_next!10789) (not bm!29963) (not b_lambda!9581))
(check-sat b_and!18877 (not b_next!10789))
