; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40772 () Bool)

(assert start!40772)

(declare-fun b_free!10761 () Bool)

(declare-fun b_next!10761 () Bool)

(assert (=> start!40772 (= b_free!10761 (not b_next!10761))))

(declare-fun tp!38106 () Bool)

(declare-fun b_and!18809 () Bool)

(assert (=> start!40772 (= tp!38106 b_and!18809)))

(declare-fun b!451822 () Bool)

(declare-fun e!264631 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((V!17237 0))(
  ( (V!17238 (val!6094 Int)) )
))
(declare-datatypes ((ValueCell!5706 0))(
  ( (ValueCellFull!5706 (v!8353 V!17237)) (EmptyCell!5706) )
))
(declare-datatypes ((array!28005 0))(
  ( (array!28006 (arr!13447 (Array (_ BitVec 32) ValueCell!5706)) (size!13799 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28005)

(assert (=> b!451822 (= e!264631 (bvslt i!563 (size!13799 _values!549)))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!28007 0))(
  ( (array!28008 (arr!13448 (Array (_ BitVec 32) (_ BitVec 64))) (size!13800 (_ BitVec 32))) )
))
(declare-fun lt!205027 () array!28007)

(declare-fun zeroValue!515 () V!17237)

(declare-datatypes ((tuple2!8016 0))(
  ( (tuple2!8017 (_1!4019 (_ BitVec 64)) (_2!4019 V!17237)) )
))
(declare-datatypes ((List!8076 0))(
  ( (Nil!8073) (Cons!8072 (h!8928 tuple2!8016) (t!13860 List!8076)) )
))
(declare-datatypes ((ListLongMap!6929 0))(
  ( (ListLongMap!6930 (toList!3480 List!8076)) )
))
(declare-fun lt!205025 () ListLongMap!6929)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!205028 () array!28005)

(declare-fun minValue!515 () V!17237)

(declare-fun +!1559 (ListLongMap!6929 tuple2!8016) ListLongMap!6929)

(declare-fun getCurrentListMapNoExtraKeys!1664 (array!28007 array!28005 (_ BitVec 32) (_ BitVec 32) V!17237 V!17237 (_ BitVec 32) Int) ListLongMap!6929)

(declare-fun get!6624 (ValueCell!5706 V!17237) V!17237)

(declare-fun dynLambda!859 (Int (_ BitVec 64)) V!17237)

(assert (=> b!451822 (= lt!205025 (+!1559 (getCurrentListMapNoExtraKeys!1664 lt!205027 lt!205028 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8017 (select (arr!13448 lt!205027) from!863) (get!6624 (select (arr!13447 lt!205028) from!863) (dynLambda!859 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451823 () Bool)

(declare-fun e!264629 () Bool)

(declare-fun call!29897 () ListLongMap!6929)

(declare-fun call!29896 () ListLongMap!6929)

(assert (=> b!451823 (= e!264629 (= call!29897 call!29896))))

(declare-fun b!451824 () Bool)

(declare-fun e!264632 () Bool)

(assert (=> b!451824 (= e!264632 (not e!264631))))

(declare-fun res!269055 () Bool)

(assert (=> b!451824 (=> res!269055 e!264631)))

(declare-fun _keys!709 () array!28007)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451824 (= res!269055 (validKeyInArray!0 (select (arr!13448 _keys!709) from!863)))))

(assert (=> b!451824 e!264629))

(declare-fun c!56090 () Bool)

(assert (=> b!451824 (= c!56090 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13216 0))(
  ( (Unit!13217) )
))
(declare-fun lt!205026 () Unit!13216)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17237)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!723 (array!28007 array!28005 (_ BitVec 32) (_ BitVec 32) V!17237 V!17237 (_ BitVec 32) (_ BitVec 64) V!17237 (_ BitVec 32) Int) Unit!13216)

(assert (=> b!451824 (= lt!205026 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!723 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19785 () Bool)

(declare-fun mapRes!19785 () Bool)

(assert (=> mapIsEmpty!19785 mapRes!19785))

(declare-fun b!451825 () Bool)

(declare-fun res!269050 () Bool)

(declare-fun e!264633 () Bool)

(assert (=> b!451825 (=> (not res!269050) (not e!264633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28007 (_ BitVec 32)) Bool)

(assert (=> b!451825 (= res!269050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451826 () Bool)

(declare-fun res!269048 () Bool)

(declare-fun e!264627 () Bool)

(assert (=> b!451826 (=> (not res!269048) (not e!264627))))

(declare-datatypes ((List!8077 0))(
  ( (Nil!8074) (Cons!8073 (h!8929 (_ BitVec 64)) (t!13861 List!8077)) )
))
(declare-fun arrayNoDuplicates!0 (array!28007 (_ BitVec 32) List!8077) Bool)

(assert (=> b!451826 (= res!269048 (arrayNoDuplicates!0 lt!205027 #b00000000000000000000000000000000 Nil!8074))))

(declare-fun b!451827 () Bool)

(assert (=> b!451827 (= e!264627 e!264632)))

(declare-fun res!269054 () Bool)

(assert (=> b!451827 (=> (not res!269054) (not e!264632))))

(assert (=> b!451827 (= res!269054 (= from!863 i!563))))

(assert (=> b!451827 (= lt!205025 (getCurrentListMapNoExtraKeys!1664 lt!205027 lt!205028 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!451827 (= lt!205028 (array!28006 (store (arr!13447 _values!549) i!563 (ValueCellFull!5706 v!412)) (size!13799 _values!549)))))

(declare-fun lt!205024 () ListLongMap!6929)

(assert (=> b!451827 (= lt!205024 (getCurrentListMapNoExtraKeys!1664 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451828 () Bool)

(declare-fun res!269056 () Bool)

(assert (=> b!451828 (=> (not res!269056) (not e!264633))))

(assert (=> b!451828 (= res!269056 (and (= (size!13799 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13800 _keys!709) (size!13799 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451829 () Bool)

(declare-fun res!269057 () Bool)

(assert (=> b!451829 (=> (not res!269057) (not e!264633))))

(assert (=> b!451829 (= res!269057 (validKeyInArray!0 k0!794))))

(declare-fun bm!29894 () Bool)

(assert (=> bm!29894 (= call!29896 (getCurrentListMapNoExtraKeys!1664 (ite c!56090 lt!205027 _keys!709) (ite c!56090 lt!205028 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451830 () Bool)

(declare-fun res!269052 () Bool)

(assert (=> b!451830 (=> (not res!269052) (not e!264633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451830 (= res!269052 (validMask!0 mask!1025))))

(declare-fun b!451831 () Bool)

(declare-fun res!269049 () Bool)

(assert (=> b!451831 (=> (not res!269049) (not e!264627))))

(assert (=> b!451831 (= res!269049 (bvsle from!863 i!563))))

(declare-fun b!451832 () Bool)

(declare-fun e!264634 () Bool)

(declare-fun tp_is_empty!12099 () Bool)

(assert (=> b!451832 (= e!264634 tp_is_empty!12099)))

(declare-fun mapNonEmpty!19785 () Bool)

(declare-fun tp!38105 () Bool)

(assert (=> mapNonEmpty!19785 (= mapRes!19785 (and tp!38105 e!264634))))

(declare-fun mapRest!19785 () (Array (_ BitVec 32) ValueCell!5706))

(declare-fun mapValue!19785 () ValueCell!5706)

(declare-fun mapKey!19785 () (_ BitVec 32))

(assert (=> mapNonEmpty!19785 (= (arr!13447 _values!549) (store mapRest!19785 mapKey!19785 mapValue!19785))))

(declare-fun b!451833 () Bool)

(declare-fun res!269045 () Bool)

(assert (=> b!451833 (=> (not res!269045) (not e!264633))))

(declare-fun arrayContainsKey!0 (array!28007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451833 (= res!269045 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451834 () Bool)

(declare-fun res!269047 () Bool)

(assert (=> b!451834 (=> (not res!269047) (not e!264633))))

(assert (=> b!451834 (= res!269047 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8074))))

(declare-fun b!451835 () Bool)

(declare-fun res!269044 () Bool)

(assert (=> b!451835 (=> (not res!269044) (not e!264633))))

(assert (=> b!451835 (= res!269044 (or (= (select (arr!13448 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13448 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451836 () Bool)

(assert (=> b!451836 (= e!264633 e!264627)))

(declare-fun res!269046 () Bool)

(assert (=> b!451836 (=> (not res!269046) (not e!264627))))

(assert (=> b!451836 (= res!269046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205027 mask!1025))))

(assert (=> b!451836 (= lt!205027 (array!28008 (store (arr!13448 _keys!709) i!563 k0!794) (size!13800 _keys!709)))))

(declare-fun b!451837 () Bool)

(declare-fun res!269051 () Bool)

(assert (=> b!451837 (=> (not res!269051) (not e!264633))))

(assert (=> b!451837 (= res!269051 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13800 _keys!709))))))

(declare-fun bm!29893 () Bool)

(assert (=> bm!29893 (= call!29897 (getCurrentListMapNoExtraKeys!1664 (ite c!56090 _keys!709 lt!205027) (ite c!56090 _values!549 lt!205028) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!269053 () Bool)

(assert (=> start!40772 (=> (not res!269053) (not e!264633))))

(assert (=> start!40772 (= res!269053 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13800 _keys!709))))))

(assert (=> start!40772 e!264633))

(assert (=> start!40772 tp_is_empty!12099))

(assert (=> start!40772 tp!38106))

(assert (=> start!40772 true))

(declare-fun e!264635 () Bool)

(declare-fun array_inv!9736 (array!28005) Bool)

(assert (=> start!40772 (and (array_inv!9736 _values!549) e!264635)))

(declare-fun array_inv!9737 (array!28007) Bool)

(assert (=> start!40772 (array_inv!9737 _keys!709)))

(declare-fun b!451838 () Bool)

(declare-fun e!264628 () Bool)

(assert (=> b!451838 (= e!264635 (and e!264628 mapRes!19785))))

(declare-fun condMapEmpty!19785 () Bool)

(declare-fun mapDefault!19785 () ValueCell!5706)

(assert (=> b!451838 (= condMapEmpty!19785 (= (arr!13447 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5706)) mapDefault!19785)))))

(declare-fun b!451839 () Bool)

(assert (=> b!451839 (= e!264628 tp_is_empty!12099)))

(declare-fun b!451840 () Bool)

(assert (=> b!451840 (= e!264629 (= call!29896 (+!1559 call!29897 (tuple2!8017 k0!794 v!412))))))

(assert (= (and start!40772 res!269053) b!451830))

(assert (= (and b!451830 res!269052) b!451828))

(assert (= (and b!451828 res!269056) b!451825))

(assert (= (and b!451825 res!269050) b!451834))

(assert (= (and b!451834 res!269047) b!451837))

(assert (= (and b!451837 res!269051) b!451829))

(assert (= (and b!451829 res!269057) b!451835))

(assert (= (and b!451835 res!269044) b!451833))

(assert (= (and b!451833 res!269045) b!451836))

(assert (= (and b!451836 res!269046) b!451826))

(assert (= (and b!451826 res!269048) b!451831))

(assert (= (and b!451831 res!269049) b!451827))

(assert (= (and b!451827 res!269054) b!451824))

(assert (= (and b!451824 c!56090) b!451840))

(assert (= (and b!451824 (not c!56090)) b!451823))

(assert (= (or b!451840 b!451823) bm!29894))

(assert (= (or b!451840 b!451823) bm!29893))

(assert (= (and b!451824 (not res!269055)) b!451822))

(assert (= (and b!451838 condMapEmpty!19785) mapIsEmpty!19785))

(assert (= (and b!451838 (not condMapEmpty!19785)) mapNonEmpty!19785))

(get-info :version)

(assert (= (and mapNonEmpty!19785 ((_ is ValueCellFull!5706) mapValue!19785)) b!451832))

(assert (= (and b!451838 ((_ is ValueCellFull!5706) mapDefault!19785)) b!451839))

(assert (= start!40772 b!451838))

(declare-fun b_lambda!9539 () Bool)

(assert (=> (not b_lambda!9539) (not b!451822)))

(declare-fun t!13859 () Bool)

(declare-fun tb!3741 () Bool)

(assert (=> (and start!40772 (= defaultEntry!557 defaultEntry!557) t!13859) tb!3741))

(declare-fun result!7019 () Bool)

(assert (=> tb!3741 (= result!7019 tp_is_empty!12099)))

(assert (=> b!451822 t!13859))

(declare-fun b_and!18811 () Bool)

(assert (= b_and!18809 (and (=> t!13859 result!7019) b_and!18811)))

(declare-fun m!435563 () Bool)

(assert (=> b!451836 m!435563))

(declare-fun m!435565 () Bool)

(assert (=> b!451836 m!435565))

(declare-fun m!435567 () Bool)

(assert (=> start!40772 m!435567))

(declare-fun m!435569 () Bool)

(assert (=> start!40772 m!435569))

(declare-fun m!435571 () Bool)

(assert (=> b!451824 m!435571))

(assert (=> b!451824 m!435571))

(declare-fun m!435573 () Bool)

(assert (=> b!451824 m!435573))

(declare-fun m!435575 () Bool)

(assert (=> b!451824 m!435575))

(declare-fun m!435577 () Bool)

(assert (=> b!451826 m!435577))

(declare-fun m!435579 () Bool)

(assert (=> b!451829 m!435579))

(declare-fun m!435581 () Bool)

(assert (=> b!451833 m!435581))

(declare-fun m!435583 () Bool)

(assert (=> bm!29894 m!435583))

(declare-fun m!435585 () Bool)

(assert (=> b!451830 m!435585))

(declare-fun m!435587 () Bool)

(assert (=> bm!29893 m!435587))

(declare-fun m!435589 () Bool)

(assert (=> mapNonEmpty!19785 m!435589))

(declare-fun m!435591 () Bool)

(assert (=> b!451825 m!435591))

(declare-fun m!435593 () Bool)

(assert (=> b!451827 m!435593))

(declare-fun m!435595 () Bool)

(assert (=> b!451827 m!435595))

(declare-fun m!435597 () Bool)

(assert (=> b!451827 m!435597))

(declare-fun m!435599 () Bool)

(assert (=> b!451835 m!435599))

(declare-fun m!435601 () Bool)

(assert (=> b!451822 m!435601))

(declare-fun m!435603 () Bool)

(assert (=> b!451822 m!435603))

(declare-fun m!435605 () Bool)

(assert (=> b!451822 m!435605))

(assert (=> b!451822 m!435603))

(assert (=> b!451822 m!435601))

(declare-fun m!435607 () Bool)

(assert (=> b!451822 m!435607))

(declare-fun m!435609 () Bool)

(assert (=> b!451822 m!435609))

(declare-fun m!435611 () Bool)

(assert (=> b!451822 m!435611))

(assert (=> b!451822 m!435607))

(declare-fun m!435613 () Bool)

(assert (=> b!451840 m!435613))

(declare-fun m!435615 () Bool)

(assert (=> b!451834 m!435615))

(check-sat (not b!451833) (not b!451834) (not b!451825) (not start!40772) (not b!451824) (not b!451822) (not bm!29893) (not mapNonEmpty!19785) b_and!18811 tp_is_empty!12099 (not bm!29894) (not b!451830) (not b!451827) (not b!451826) (not b!451840) (not b_lambda!9539) (not b!451836) (not b!451829) (not b_next!10761))
(check-sat b_and!18811 (not b_next!10761))
