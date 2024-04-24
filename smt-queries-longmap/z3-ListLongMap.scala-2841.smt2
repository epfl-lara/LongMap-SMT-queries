; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40996 () Bool)

(assert start!40996)

(declare-fun b_free!10945 () Bool)

(declare-fun b_next!10945 () Bool)

(assert (=> start!40996 (= b_free!10945 (not b_next!10945))))

(declare-fun tp!38662 () Bool)

(declare-fun b_and!19097 () Bool)

(assert (=> start!40996 (= tp!38662 b_and!19097)))

(declare-fun b!456884 () Bool)

(declare-fun e!266879 () Bool)

(declare-fun e!266880 () Bool)

(assert (=> b!456884 (= e!266879 e!266880)))

(declare-fun res!272779 () Bool)

(assert (=> b!456884 (=> (not res!272779) (not e!266880))))

(declare-datatypes ((array!28360 0))(
  ( (array!28361 (arr!13623 (Array (_ BitVec 32) (_ BitVec 64))) (size!13975 (_ BitVec 32))) )
))
(declare-fun lt!206715 () array!28360)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28360 (_ BitVec 32)) Bool)

(assert (=> b!456884 (= res!272779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206715 mask!1025))))

(declare-fun _keys!709 () array!28360)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456884 (= lt!206715 (array!28361 (store (arr!13623 _keys!709) i!563 k0!794) (size!13975 _keys!709)))))

(declare-fun b!456885 () Bool)

(declare-fun e!266877 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17483 0))(
  ( (V!17484 (val!6186 Int)) )
))
(declare-datatypes ((ValueCell!5798 0))(
  ( (ValueCellFull!5798 (v!8453 V!17483)) (EmptyCell!5798) )
))
(declare-datatypes ((array!28362 0))(
  ( (array!28363 (arr!13624 (Array (_ BitVec 32) ValueCell!5798)) (size!13976 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28362)

(assert (=> b!456885 (= e!266877 (bvslt from!863 (size!13976 _values!549)))))

(declare-fun b!456886 () Bool)

(declare-fun e!266883 () Bool)

(assert (=> b!456886 (= e!266883 (not e!266877))))

(declare-fun res!272784 () Bool)

(assert (=> b!456886 (=> res!272784 e!266877)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456886 (= res!272784 (not (validKeyInArray!0 (select (arr!13623 _keys!709) from!863))))))

(declare-fun minValue!515 () V!17483)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17483)

(declare-fun v!412 () V!17483)

(declare-fun lt!206717 () array!28362)

(declare-datatypes ((tuple2!8064 0))(
  ( (tuple2!8065 (_1!4043 (_ BitVec 64)) (_2!4043 V!17483)) )
))
(declare-datatypes ((List!8138 0))(
  ( (Nil!8135) (Cons!8134 (h!8990 tuple2!8064) (t!13958 List!8138)) )
))
(declare-datatypes ((ListLongMap!6979 0))(
  ( (ListLongMap!6980 (toList!3505 List!8138)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1734 (array!28360 array!28362 (_ BitVec 32) (_ BitVec 32) V!17483 V!17483 (_ BitVec 32) Int) ListLongMap!6979)

(declare-fun +!1588 (ListLongMap!6979 tuple2!8064) ListLongMap!6979)

(assert (=> b!456886 (= (getCurrentListMapNoExtraKeys!1734 lt!206715 lt!206717 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1588 (getCurrentListMapNoExtraKeys!1734 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8065 k0!794 v!412)))))

(declare-datatypes ((Unit!13281 0))(
  ( (Unit!13282) )
))
(declare-fun lt!206713 () Unit!13281)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!748 (array!28360 array!28362 (_ BitVec 32) (_ BitVec 32) V!17483 V!17483 (_ BitVec 32) (_ BitVec 64) V!17483 (_ BitVec 32) Int) Unit!13281)

(assert (=> b!456886 (= lt!206713 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!748 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!456887 () Bool)

(declare-fun res!272780 () Bool)

(assert (=> b!456887 (=> (not res!272780) (not e!266879))))

(assert (=> b!456887 (= res!272780 (validKeyInArray!0 k0!794))))

(declare-fun b!456888 () Bool)

(declare-fun res!272775 () Bool)

(assert (=> b!456888 (=> (not res!272775) (not e!266879))))

(declare-datatypes ((List!8139 0))(
  ( (Nil!8136) (Cons!8135 (h!8991 (_ BitVec 64)) (t!13959 List!8139)) )
))
(declare-fun arrayNoDuplicates!0 (array!28360 (_ BitVec 32) List!8139) Bool)

(assert (=> b!456888 (= res!272775 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8136))))

(declare-fun b!456889 () Bool)

(declare-fun e!266884 () Bool)

(declare-fun e!266878 () Bool)

(declare-fun mapRes!20065 () Bool)

(assert (=> b!456889 (= e!266884 (and e!266878 mapRes!20065))))

(declare-fun condMapEmpty!20065 () Bool)

(declare-fun mapDefault!20065 () ValueCell!5798)

(assert (=> b!456889 (= condMapEmpty!20065 (= (arr!13624 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5798)) mapDefault!20065)))))

(declare-fun b!456890 () Bool)

(declare-fun res!272786 () Bool)

(assert (=> b!456890 (=> (not res!272786) (not e!266879))))

(assert (=> b!456890 (= res!272786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456891 () Bool)

(declare-fun res!272781 () Bool)

(assert (=> b!456891 (=> (not res!272781) (not e!266879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456891 (= res!272781 (validMask!0 mask!1025))))

(declare-fun b!456892 () Bool)

(declare-fun res!272788 () Bool)

(assert (=> b!456892 (=> (not res!272788) (not e!266880))))

(assert (=> b!456892 (= res!272788 (arrayNoDuplicates!0 lt!206715 #b00000000000000000000000000000000 Nil!8136))))

(declare-fun mapNonEmpty!20065 () Bool)

(declare-fun tp!38661 () Bool)

(declare-fun e!266881 () Bool)

(assert (=> mapNonEmpty!20065 (= mapRes!20065 (and tp!38661 e!266881))))

(declare-fun mapRest!20065 () (Array (_ BitVec 32) ValueCell!5798))

(declare-fun mapKey!20065 () (_ BitVec 32))

(declare-fun mapValue!20065 () ValueCell!5798)

(assert (=> mapNonEmpty!20065 (= (arr!13624 _values!549) (store mapRest!20065 mapKey!20065 mapValue!20065))))

(declare-fun b!456893 () Bool)

(declare-fun tp_is_empty!12283 () Bool)

(assert (=> b!456893 (= e!266881 tp_is_empty!12283)))

(declare-fun b!456894 () Bool)

(assert (=> b!456894 (= e!266878 tp_is_empty!12283)))

(declare-fun b!456895 () Bool)

(declare-fun res!272787 () Bool)

(assert (=> b!456895 (=> (not res!272787) (not e!266879))))

(assert (=> b!456895 (= res!272787 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13975 _keys!709))))))

(declare-fun b!456896 () Bool)

(declare-fun res!272777 () Bool)

(assert (=> b!456896 (=> (not res!272777) (not e!266880))))

(assert (=> b!456896 (= res!272777 (bvsle from!863 i!563))))

(declare-fun res!272783 () Bool)

(assert (=> start!40996 (=> (not res!272783) (not e!266879))))

(assert (=> start!40996 (= res!272783 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13975 _keys!709))))))

(assert (=> start!40996 e!266879))

(assert (=> start!40996 tp_is_empty!12283))

(assert (=> start!40996 tp!38662))

(assert (=> start!40996 true))

(declare-fun array_inv!9936 (array!28362) Bool)

(assert (=> start!40996 (and (array_inv!9936 _values!549) e!266884)))

(declare-fun array_inv!9937 (array!28360) Bool)

(assert (=> start!40996 (array_inv!9937 _keys!709)))

(declare-fun mapIsEmpty!20065 () Bool)

(assert (=> mapIsEmpty!20065 mapRes!20065))

(declare-fun b!456897 () Bool)

(declare-fun res!272776 () Bool)

(assert (=> b!456897 (=> (not res!272776) (not e!266879))))

(assert (=> b!456897 (= res!272776 (or (= (select (arr!13623 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13623 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456898 () Bool)

(declare-fun res!272778 () Bool)

(assert (=> b!456898 (=> (not res!272778) (not e!266879))))

(assert (=> b!456898 (= res!272778 (and (= (size!13976 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13975 _keys!709) (size!13976 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456899 () Bool)

(declare-fun res!272782 () Bool)

(assert (=> b!456899 (=> (not res!272782) (not e!266879))))

(declare-fun arrayContainsKey!0 (array!28360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456899 (= res!272782 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456900 () Bool)

(assert (=> b!456900 (= e!266880 e!266883)))

(declare-fun res!272785 () Bool)

(assert (=> b!456900 (=> (not res!272785) (not e!266883))))

(assert (=> b!456900 (= res!272785 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206716 () ListLongMap!6979)

(assert (=> b!456900 (= lt!206716 (getCurrentListMapNoExtraKeys!1734 lt!206715 lt!206717 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456900 (= lt!206717 (array!28363 (store (arr!13624 _values!549) i!563 (ValueCellFull!5798 v!412)) (size!13976 _values!549)))))

(declare-fun lt!206714 () ListLongMap!6979)

(assert (=> b!456900 (= lt!206714 (getCurrentListMapNoExtraKeys!1734 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40996 res!272783) b!456891))

(assert (= (and b!456891 res!272781) b!456898))

(assert (= (and b!456898 res!272778) b!456890))

(assert (= (and b!456890 res!272786) b!456888))

(assert (= (and b!456888 res!272775) b!456895))

(assert (= (and b!456895 res!272787) b!456887))

(assert (= (and b!456887 res!272780) b!456897))

(assert (= (and b!456897 res!272776) b!456899))

(assert (= (and b!456899 res!272782) b!456884))

(assert (= (and b!456884 res!272779) b!456892))

(assert (= (and b!456892 res!272788) b!456896))

(assert (= (and b!456896 res!272777) b!456900))

(assert (= (and b!456900 res!272785) b!456886))

(assert (= (and b!456886 (not res!272784)) b!456885))

(assert (= (and b!456889 condMapEmpty!20065) mapIsEmpty!20065))

(assert (= (and b!456889 (not condMapEmpty!20065)) mapNonEmpty!20065))

(get-info :version)

(assert (= (and mapNonEmpty!20065 ((_ is ValueCellFull!5798) mapValue!20065)) b!456893))

(assert (= (and b!456889 ((_ is ValueCellFull!5798) mapDefault!20065)) b!456894))

(assert (= start!40996 b!456889))

(declare-fun m!440493 () Bool)

(assert (=> b!456890 m!440493))

(declare-fun m!440495 () Bool)

(assert (=> b!456900 m!440495))

(declare-fun m!440497 () Bool)

(assert (=> b!456900 m!440497))

(declare-fun m!440499 () Bool)

(assert (=> b!456900 m!440499))

(declare-fun m!440501 () Bool)

(assert (=> b!456891 m!440501))

(declare-fun m!440503 () Bool)

(assert (=> b!456897 m!440503))

(declare-fun m!440505 () Bool)

(assert (=> b!456884 m!440505))

(declare-fun m!440507 () Bool)

(assert (=> b!456884 m!440507))

(declare-fun m!440509 () Bool)

(assert (=> b!456888 m!440509))

(declare-fun m!440511 () Bool)

(assert (=> mapNonEmpty!20065 m!440511))

(declare-fun m!440513 () Bool)

(assert (=> b!456887 m!440513))

(declare-fun m!440515 () Bool)

(assert (=> b!456886 m!440515))

(declare-fun m!440517 () Bool)

(assert (=> b!456886 m!440517))

(declare-fun m!440519 () Bool)

(assert (=> b!456886 m!440519))

(assert (=> b!456886 m!440519))

(declare-fun m!440521 () Bool)

(assert (=> b!456886 m!440521))

(assert (=> b!456886 m!440515))

(declare-fun m!440523 () Bool)

(assert (=> b!456886 m!440523))

(declare-fun m!440525 () Bool)

(assert (=> b!456886 m!440525))

(declare-fun m!440527 () Bool)

(assert (=> start!40996 m!440527))

(declare-fun m!440529 () Bool)

(assert (=> start!40996 m!440529))

(declare-fun m!440531 () Bool)

(assert (=> b!456892 m!440531))

(declare-fun m!440533 () Bool)

(assert (=> b!456899 m!440533))

(check-sat (not b!456887) (not b!456899) (not b!456891) (not b!456892) (not mapNonEmpty!20065) (not b!456890) (not b!456900) (not b!456884) (not start!40996) (not b!456886) b_and!19097 (not b_next!10945) tp_is_empty!12283 (not b!456888))
(check-sat b_and!19097 (not b_next!10945))
