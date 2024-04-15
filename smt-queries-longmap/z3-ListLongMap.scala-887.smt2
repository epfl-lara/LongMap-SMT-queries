; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20422 () Bool)

(assert start!20422)

(declare-fun b_free!5077 () Bool)

(declare-fun b_next!5077 () Bool)

(assert (=> start!20422 (= b_free!5077 (not b_next!5077))))

(declare-fun tp!18262 () Bool)

(declare-fun b_and!11797 () Bool)

(assert (=> start!20422 (= tp!18262 b_and!11797)))

(declare-fun res!96588 () Bool)

(declare-fun e!132258 () Bool)

(assert (=> start!20422 (=> (not res!96588) (not e!132258))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20422 (= res!96588 (validMask!0 mask!1149))))

(assert (=> start!20422 e!132258))

(declare-datatypes ((V!6225 0))(
  ( (V!6226 (val!2511 Int)) )
))
(declare-datatypes ((ValueCell!2123 0))(
  ( (ValueCellFull!2123 (v!4475 V!6225)) (EmptyCell!2123) )
))
(declare-datatypes ((array!9079 0))(
  ( (array!9080 (arr!4289 (Array (_ BitVec 32) ValueCell!2123)) (size!4615 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9079)

(declare-fun e!132257 () Bool)

(declare-fun array_inv!2811 (array!9079) Bool)

(assert (=> start!20422 (and (array_inv!2811 _values!649) e!132257)))

(assert (=> start!20422 true))

(declare-fun tp_is_empty!4933 () Bool)

(assert (=> start!20422 tp_is_empty!4933))

(declare-datatypes ((array!9081 0))(
  ( (array!9082 (arr!4290 (Array (_ BitVec 32) (_ BitVec 64))) (size!4616 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9081)

(declare-fun array_inv!2812 (array!9081) Bool)

(assert (=> start!20422 (array_inv!2812 _keys!825)))

(assert (=> start!20422 tp!18262))

(declare-fun b!201867 () Bool)

(declare-fun res!96595 () Bool)

(assert (=> b!201867 (=> (not res!96595) (not e!132258))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201867 (= res!96595 (= (select (arr!4290 _keys!825) i!601) k0!843))))

(declare-fun b!201868 () Bool)

(declare-fun res!96593 () Bool)

(assert (=> b!201868 (=> (not res!96593) (not e!132258))))

(declare-datatypes ((List!2696 0))(
  ( (Nil!2693) (Cons!2692 (h!3334 (_ BitVec 64)) (t!7618 List!2696)) )
))
(declare-fun arrayNoDuplicates!0 (array!9081 (_ BitVec 32) List!2696) Bool)

(assert (=> b!201868 (= res!96593 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2693))))

(declare-fun b!201869 () Bool)

(declare-fun e!132260 () Bool)

(assert (=> b!201869 (= e!132260 tp_is_empty!4933)))

(declare-fun b!201870 () Bool)

(declare-fun res!96589 () Bool)

(assert (=> b!201870 (=> (not res!96589) (not e!132258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9081 (_ BitVec 32)) Bool)

(assert (=> b!201870 (= res!96589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8468 () Bool)

(declare-fun mapRes!8468 () Bool)

(assert (=> mapIsEmpty!8468 mapRes!8468))

(declare-fun b!201871 () Bool)

(declare-fun res!96596 () Bool)

(assert (=> b!201871 (=> (not res!96596) (not e!132258))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201871 (= res!96596 (and (= (size!4615 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4616 _keys!825) (size!4615 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201872 () Bool)

(declare-fun e!132261 () Bool)

(declare-fun e!132255 () Bool)

(assert (=> b!201872 (= e!132261 e!132255)))

(declare-fun res!96592 () Bool)

(assert (=> b!201872 (=> res!96592 e!132255)))

(assert (=> b!201872 (= res!96592 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3778 0))(
  ( (tuple2!3779 (_1!1900 (_ BitVec 64)) (_2!1900 V!6225)) )
))
(declare-datatypes ((List!2697 0))(
  ( (Nil!2694) (Cons!2693 (h!3335 tuple2!3778) (t!7619 List!2697)) )
))
(declare-datatypes ((ListLongMap!2681 0))(
  ( (ListLongMap!2682 (toList!1356 List!2697)) )
))
(declare-fun lt!100970 () ListLongMap!2681)

(declare-fun lt!100963 () ListLongMap!2681)

(assert (=> b!201872 (= lt!100970 lt!100963)))

(declare-fun lt!100966 () ListLongMap!2681)

(declare-fun lt!100960 () tuple2!3778)

(declare-fun +!405 (ListLongMap!2681 tuple2!3778) ListLongMap!2681)

(assert (=> b!201872 (= lt!100963 (+!405 lt!100966 lt!100960))))

(declare-datatypes ((Unit!6062 0))(
  ( (Unit!6063) )
))
(declare-fun lt!100968 () Unit!6062)

(declare-fun lt!100964 () ListLongMap!2681)

(declare-fun v!520 () V!6225)

(declare-fun zeroValue!615 () V!6225)

(declare-fun addCommutativeForDiffKeys!114 (ListLongMap!2681 (_ BitVec 64) V!6225 (_ BitVec 64) V!6225) Unit!6062)

(assert (=> b!201872 (= lt!100968 (addCommutativeForDiffKeys!114 lt!100964 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100961 () ListLongMap!2681)

(declare-fun lt!100957 () tuple2!3778)

(assert (=> b!201872 (= lt!100961 (+!405 lt!100970 lt!100957))))

(declare-fun lt!100955 () ListLongMap!2681)

(declare-fun lt!100967 () tuple2!3778)

(assert (=> b!201872 (= lt!100970 (+!405 lt!100955 lt!100967))))

(declare-fun lt!100959 () ListLongMap!2681)

(declare-fun lt!100962 () ListLongMap!2681)

(assert (=> b!201872 (= lt!100959 lt!100962)))

(assert (=> b!201872 (= lt!100962 (+!405 lt!100966 lt!100957))))

(assert (=> b!201872 (= lt!100966 (+!405 lt!100964 lt!100967))))

(declare-fun lt!100958 () ListLongMap!2681)

(assert (=> b!201872 (= lt!100961 (+!405 (+!405 lt!100958 lt!100967) lt!100957))))

(declare-fun minValue!615 () V!6225)

(assert (=> b!201872 (= lt!100957 (tuple2!3779 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201872 (= lt!100967 (tuple2!3779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201873 () Bool)

(declare-fun e!132259 () Bool)

(assert (=> b!201873 (= e!132259 tp_is_empty!4933)))

(declare-fun mapNonEmpty!8468 () Bool)

(declare-fun tp!18263 () Bool)

(assert (=> mapNonEmpty!8468 (= mapRes!8468 (and tp!18263 e!132259))))

(declare-fun mapKey!8468 () (_ BitVec 32))

(declare-fun mapValue!8468 () ValueCell!2123)

(declare-fun mapRest!8468 () (Array (_ BitVec 32) ValueCell!2123))

(assert (=> mapNonEmpty!8468 (= (arr!4289 _values!649) (store mapRest!8468 mapKey!8468 mapValue!8468))))

(declare-fun b!201874 () Bool)

(assert (=> b!201874 (= e!132255 true)))

(assert (=> b!201874 (= (+!405 lt!100963 lt!100957) (+!405 lt!100962 lt!100960))))

(declare-fun lt!100969 () Unit!6062)

(assert (=> b!201874 (= lt!100969 (addCommutativeForDiffKeys!114 lt!100966 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201875 () Bool)

(assert (=> b!201875 (= e!132257 (and e!132260 mapRes!8468))))

(declare-fun condMapEmpty!8468 () Bool)

(declare-fun mapDefault!8468 () ValueCell!2123)

(assert (=> b!201875 (= condMapEmpty!8468 (= (arr!4289 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2123)) mapDefault!8468)))))

(declare-fun b!201876 () Bool)

(declare-fun res!96590 () Bool)

(assert (=> b!201876 (=> (not res!96590) (not e!132258))))

(assert (=> b!201876 (= res!96590 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4616 _keys!825))))))

(declare-fun b!201877 () Bool)

(declare-fun res!96594 () Bool)

(assert (=> b!201877 (=> (not res!96594) (not e!132258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201877 (= res!96594 (validKeyInArray!0 k0!843))))

(declare-fun b!201878 () Bool)

(assert (=> b!201878 (= e!132258 (not e!132261))))

(declare-fun res!96591 () Bool)

(assert (=> b!201878 (=> res!96591 e!132261)))

(assert (=> b!201878 (= res!96591 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!914 (array!9081 array!9079 (_ BitVec 32) (_ BitVec 32) V!6225 V!6225 (_ BitVec 32) Int) ListLongMap!2681)

(assert (=> b!201878 (= lt!100959 (getCurrentListMap!914 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100956 () array!9079)

(assert (=> b!201878 (= lt!100961 (getCurrentListMap!914 _keys!825 lt!100956 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201878 (and (= lt!100958 lt!100955) (= lt!100955 lt!100958))))

(assert (=> b!201878 (= lt!100955 (+!405 lt!100964 lt!100960))))

(assert (=> b!201878 (= lt!100960 (tuple2!3779 k0!843 v!520))))

(declare-fun lt!100965 () Unit!6062)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!73 (array!9081 array!9079 (_ BitVec 32) (_ BitVec 32) V!6225 V!6225 (_ BitVec 32) (_ BitVec 64) V!6225 (_ BitVec 32) Int) Unit!6062)

(assert (=> b!201878 (= lt!100965 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!73 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!324 (array!9081 array!9079 (_ BitVec 32) (_ BitVec 32) V!6225 V!6225 (_ BitVec 32) Int) ListLongMap!2681)

(assert (=> b!201878 (= lt!100958 (getCurrentListMapNoExtraKeys!324 _keys!825 lt!100956 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201878 (= lt!100956 (array!9080 (store (arr!4289 _values!649) i!601 (ValueCellFull!2123 v!520)) (size!4615 _values!649)))))

(assert (=> b!201878 (= lt!100964 (getCurrentListMapNoExtraKeys!324 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20422 res!96588) b!201871))

(assert (= (and b!201871 res!96596) b!201870))

(assert (= (and b!201870 res!96589) b!201868))

(assert (= (and b!201868 res!96593) b!201876))

(assert (= (and b!201876 res!96590) b!201877))

(assert (= (and b!201877 res!96594) b!201867))

(assert (= (and b!201867 res!96595) b!201878))

(assert (= (and b!201878 (not res!96591)) b!201872))

(assert (= (and b!201872 (not res!96592)) b!201874))

(assert (= (and b!201875 condMapEmpty!8468) mapIsEmpty!8468))

(assert (= (and b!201875 (not condMapEmpty!8468)) mapNonEmpty!8468))

(get-info :version)

(assert (= (and mapNonEmpty!8468 ((_ is ValueCellFull!2123) mapValue!8468)) b!201873))

(assert (= (and b!201875 ((_ is ValueCellFull!2123) mapDefault!8468)) b!201869))

(assert (= start!20422 b!201875))

(declare-fun m!228579 () Bool)

(assert (=> b!201868 m!228579))

(declare-fun m!228581 () Bool)

(assert (=> b!201872 m!228581))

(declare-fun m!228583 () Bool)

(assert (=> b!201872 m!228583))

(declare-fun m!228585 () Bool)

(assert (=> b!201872 m!228585))

(declare-fun m!228587 () Bool)

(assert (=> b!201872 m!228587))

(declare-fun m!228589 () Bool)

(assert (=> b!201872 m!228589))

(declare-fun m!228591 () Bool)

(assert (=> b!201872 m!228591))

(assert (=> b!201872 m!228583))

(declare-fun m!228593 () Bool)

(assert (=> b!201872 m!228593))

(declare-fun m!228595 () Bool)

(assert (=> b!201872 m!228595))

(declare-fun m!228597 () Bool)

(assert (=> b!201878 m!228597))

(declare-fun m!228599 () Bool)

(assert (=> b!201878 m!228599))

(declare-fun m!228601 () Bool)

(assert (=> b!201878 m!228601))

(declare-fun m!228603 () Bool)

(assert (=> b!201878 m!228603))

(declare-fun m!228605 () Bool)

(assert (=> b!201878 m!228605))

(declare-fun m!228607 () Bool)

(assert (=> b!201878 m!228607))

(declare-fun m!228609 () Bool)

(assert (=> b!201878 m!228609))

(declare-fun m!228611 () Bool)

(assert (=> mapNonEmpty!8468 m!228611))

(declare-fun m!228613 () Bool)

(assert (=> b!201874 m!228613))

(declare-fun m!228615 () Bool)

(assert (=> b!201874 m!228615))

(declare-fun m!228617 () Bool)

(assert (=> b!201874 m!228617))

(declare-fun m!228619 () Bool)

(assert (=> b!201877 m!228619))

(declare-fun m!228621 () Bool)

(assert (=> start!20422 m!228621))

(declare-fun m!228623 () Bool)

(assert (=> start!20422 m!228623))

(declare-fun m!228625 () Bool)

(assert (=> start!20422 m!228625))

(declare-fun m!228627 () Bool)

(assert (=> b!201870 m!228627))

(declare-fun m!228629 () Bool)

(assert (=> b!201867 m!228629))

(check-sat (not b!201870) (not b!201874) (not b_next!5077) (not b!201878) (not b!201877) (not b!201872) (not mapNonEmpty!8468) tp_is_empty!4933 (not b!201868) b_and!11797 (not start!20422))
(check-sat b_and!11797 (not b_next!5077))
