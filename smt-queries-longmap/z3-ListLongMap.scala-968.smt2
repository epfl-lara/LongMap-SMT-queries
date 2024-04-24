; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20990 () Bool)

(assert start!20990)

(declare-fun b_free!5557 () Bool)

(declare-fun b_next!5557 () Bool)

(assert (=> start!20990 (= b_free!5557 (not b_next!5557))))

(declare-fun tp!19724 () Bool)

(declare-fun b_and!12365 () Bool)

(assert (=> start!20990 (= tp!19724 b_and!12365)))

(declare-fun b!210935 () Bool)

(declare-fun res!102962 () Bool)

(declare-fun e!137328 () Bool)

(assert (=> b!210935 (=> (not res!102962) (not e!137328))))

(declare-datatypes ((array!10033 0))(
  ( (array!10034 (arr!4763 (Array (_ BitVec 32) (_ BitVec 64))) (size!5088 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10033)

(declare-datatypes ((List!2993 0))(
  ( (Nil!2990) (Cons!2989 (h!3631 (_ BitVec 64)) (t!7924 List!2993)) )
))
(declare-fun arrayNoDuplicates!0 (array!10033 (_ BitVec 32) List!2993) Bool)

(assert (=> b!210935 (= res!102962 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2990))))

(declare-fun mapIsEmpty!9209 () Bool)

(declare-fun mapRes!9209 () Bool)

(assert (=> mapIsEmpty!9209 mapRes!9209))

(declare-fun mapNonEmpty!9209 () Bool)

(declare-fun tp!19723 () Bool)

(declare-fun e!137333 () Bool)

(assert (=> mapNonEmpty!9209 (= mapRes!9209 (and tp!19723 e!137333))))

(declare-datatypes ((V!6873 0))(
  ( (V!6874 (val!2754 Int)) )
))
(declare-datatypes ((ValueCell!2366 0))(
  ( (ValueCellFull!2366 (v!4741 V!6873)) (EmptyCell!2366) )
))
(declare-fun mapRest!9209 () (Array (_ BitVec 32) ValueCell!2366))

(declare-fun mapValue!9209 () ValueCell!2366)

(declare-datatypes ((array!10035 0))(
  ( (array!10036 (arr!4764 (Array (_ BitVec 32) ValueCell!2366)) (size!5089 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10035)

(declare-fun mapKey!9209 () (_ BitVec 32))

(assert (=> mapNonEmpty!9209 (= (arr!4764 _values!649) (store mapRest!9209 mapKey!9209 mapValue!9209))))

(declare-fun b!210936 () Bool)

(declare-fun e!137329 () Bool)

(declare-fun e!137327 () Bool)

(assert (=> b!210936 (= e!137329 e!137327)))

(declare-fun res!102966 () Bool)

(assert (=> b!210936 (=> res!102966 e!137327)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!210936 (= res!102966 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4108 0))(
  ( (tuple2!4109 (_1!2065 (_ BitVec 64)) (_2!2065 V!6873)) )
))
(declare-datatypes ((List!2994 0))(
  ( (Nil!2991) (Cons!2990 (h!3632 tuple2!4108) (t!7925 List!2994)) )
))
(declare-datatypes ((ListLongMap!3023 0))(
  ( (ListLongMap!3024 (toList!1527 List!2994)) )
))
(declare-fun lt!108326 () ListLongMap!3023)

(declare-fun lt!108327 () ListLongMap!3023)

(assert (=> b!210936 (= lt!108326 lt!108327)))

(declare-fun lt!108325 () ListLongMap!3023)

(declare-fun lt!108331 () tuple2!4108)

(declare-fun +!556 (ListLongMap!3023 tuple2!4108) ListLongMap!3023)

(assert (=> b!210936 (= lt!108327 (+!556 lt!108325 lt!108331))))

(declare-fun v!520 () V!6873)

(declare-fun zeroValue!615 () V!6873)

(declare-fun lt!108324 () ListLongMap!3023)

(declare-datatypes ((Unit!6394 0))(
  ( (Unit!6395) )
))
(declare-fun lt!108323 () Unit!6394)

(declare-fun addCommutativeForDiffKeys!205 (ListLongMap!3023 (_ BitVec 64) V!6873 (_ BitVec 64) V!6873) Unit!6394)

(assert (=> b!210936 (= lt!108323 (addCommutativeForDiffKeys!205 lt!108324 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!108337 () ListLongMap!3023)

(declare-fun lt!108330 () tuple2!4108)

(assert (=> b!210936 (= lt!108337 (+!556 lt!108326 lt!108330))))

(declare-fun lt!108335 () ListLongMap!3023)

(declare-fun lt!108338 () tuple2!4108)

(assert (=> b!210936 (= lt!108326 (+!556 lt!108335 lt!108338))))

(declare-fun lt!108332 () ListLongMap!3023)

(declare-fun lt!108334 () ListLongMap!3023)

(assert (=> b!210936 (= lt!108332 lt!108334)))

(assert (=> b!210936 (= lt!108334 (+!556 lt!108325 lt!108330))))

(assert (=> b!210936 (= lt!108325 (+!556 lt!108324 lt!108338))))

(declare-fun lt!108329 () ListLongMap!3023)

(assert (=> b!210936 (= lt!108337 (+!556 (+!556 lt!108329 lt!108338) lt!108330))))

(declare-fun minValue!615 () V!6873)

(assert (=> b!210936 (= lt!108330 (tuple2!4109 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210936 (= lt!108338 (tuple2!4109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210937 () Bool)

(declare-fun res!102967 () Bool)

(assert (=> b!210937 (=> (not res!102967) (not e!137328))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!210937 (= res!102967 (and (= (size!5089 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5088 _keys!825) (size!5089 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!102964 () Bool)

(assert (=> start!20990 (=> (not res!102964) (not e!137328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20990 (= res!102964 (validMask!0 mask!1149))))

(assert (=> start!20990 e!137328))

(declare-fun e!137331 () Bool)

(declare-fun array_inv!3123 (array!10035) Bool)

(assert (=> start!20990 (and (array_inv!3123 _values!649) e!137331)))

(assert (=> start!20990 true))

(declare-fun tp_is_empty!5419 () Bool)

(assert (=> start!20990 tp_is_empty!5419))

(declare-fun array_inv!3124 (array!10033) Bool)

(assert (=> start!20990 (array_inv!3124 _keys!825)))

(assert (=> start!20990 tp!19724))

(declare-fun b!210938 () Bool)

(declare-fun res!102963 () Bool)

(assert (=> b!210938 (=> (not res!102963) (not e!137328))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210938 (= res!102963 (= (select (arr!4763 _keys!825) i!601) k0!843))))

(declare-fun b!210939 () Bool)

(declare-fun e!137330 () Bool)

(assert (=> b!210939 (= e!137331 (and e!137330 mapRes!9209))))

(declare-fun condMapEmpty!9209 () Bool)

(declare-fun mapDefault!9209 () ValueCell!2366)

(assert (=> b!210939 (= condMapEmpty!9209 (= (arr!4764 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2366)) mapDefault!9209)))))

(declare-fun b!210940 () Bool)

(declare-fun res!102961 () Bool)

(assert (=> b!210940 (=> (not res!102961) (not e!137328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210940 (= res!102961 (validKeyInArray!0 k0!843))))

(declare-fun b!210941 () Bool)

(declare-fun res!102965 () Bool)

(assert (=> b!210941 (=> (not res!102965) (not e!137328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10033 (_ BitVec 32)) Bool)

(assert (=> b!210941 (= res!102965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210942 () Bool)

(assert (=> b!210942 (= e!137328 (not e!137329))))

(declare-fun res!102960 () Bool)

(assert (=> b!210942 (=> res!102960 e!137329)))

(assert (=> b!210942 (= res!102960 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1065 (array!10033 array!10035 (_ BitVec 32) (_ BitVec 32) V!6873 V!6873 (_ BitVec 32) Int) ListLongMap!3023)

(assert (=> b!210942 (= lt!108332 (getCurrentListMap!1065 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108333 () array!10035)

(assert (=> b!210942 (= lt!108337 (getCurrentListMap!1065 _keys!825 lt!108333 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210942 (and (= lt!108329 lt!108335) (= lt!108335 lt!108329))))

(assert (=> b!210942 (= lt!108335 (+!556 lt!108324 lt!108331))))

(assert (=> b!210942 (= lt!108331 (tuple2!4109 k0!843 v!520))))

(declare-fun lt!108328 () Unit!6394)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!206 (array!10033 array!10035 (_ BitVec 32) (_ BitVec 32) V!6873 V!6873 (_ BitVec 32) (_ BitVec 64) V!6873 (_ BitVec 32) Int) Unit!6394)

(assert (=> b!210942 (= lt!108328 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!206 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!488 (array!10033 array!10035 (_ BitVec 32) (_ BitVec 32) V!6873 V!6873 (_ BitVec 32) Int) ListLongMap!3023)

(assert (=> b!210942 (= lt!108329 (getCurrentListMapNoExtraKeys!488 _keys!825 lt!108333 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210942 (= lt!108333 (array!10036 (store (arr!4764 _values!649) i!601 (ValueCellFull!2366 v!520)) (size!5089 _values!649)))))

(assert (=> b!210942 (= lt!108324 (getCurrentListMapNoExtraKeys!488 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210943 () Bool)

(declare-fun res!102959 () Bool)

(assert (=> b!210943 (=> (not res!102959) (not e!137328))))

(assert (=> b!210943 (= res!102959 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5088 _keys!825))))))

(declare-fun b!210944 () Bool)

(assert (=> b!210944 (= e!137333 tp_is_empty!5419)))

(declare-fun b!210945 () Bool)

(assert (=> b!210945 (= e!137330 tp_is_empty!5419)))

(declare-fun b!210946 () Bool)

(assert (=> b!210946 (= e!137327 (= (+!556 lt!108332 lt!108331) lt!108337))))

(assert (=> b!210946 (= (+!556 lt!108327 lt!108330) (+!556 lt!108334 lt!108331))))

(declare-fun lt!108336 () Unit!6394)

(assert (=> b!210946 (= lt!108336 (addCommutativeForDiffKeys!205 lt!108325 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20990 res!102964) b!210937))

(assert (= (and b!210937 res!102967) b!210941))

(assert (= (and b!210941 res!102965) b!210935))

(assert (= (and b!210935 res!102962) b!210943))

(assert (= (and b!210943 res!102959) b!210940))

(assert (= (and b!210940 res!102961) b!210938))

(assert (= (and b!210938 res!102963) b!210942))

(assert (= (and b!210942 (not res!102960)) b!210936))

(assert (= (and b!210936 (not res!102966)) b!210946))

(assert (= (and b!210939 condMapEmpty!9209) mapIsEmpty!9209))

(assert (= (and b!210939 (not condMapEmpty!9209)) mapNonEmpty!9209))

(get-info :version)

(assert (= (and mapNonEmpty!9209 ((_ is ValueCellFull!2366) mapValue!9209)) b!210944))

(assert (= (and b!210939 ((_ is ValueCellFull!2366) mapDefault!9209)) b!210945))

(assert (= start!20990 b!210939))

(declare-fun m!238751 () Bool)

(assert (=> b!210942 m!238751))

(declare-fun m!238753 () Bool)

(assert (=> b!210942 m!238753))

(declare-fun m!238755 () Bool)

(assert (=> b!210942 m!238755))

(declare-fun m!238757 () Bool)

(assert (=> b!210942 m!238757))

(declare-fun m!238759 () Bool)

(assert (=> b!210942 m!238759))

(declare-fun m!238761 () Bool)

(assert (=> b!210942 m!238761))

(declare-fun m!238763 () Bool)

(assert (=> b!210942 m!238763))

(declare-fun m!238765 () Bool)

(assert (=> b!210946 m!238765))

(declare-fun m!238767 () Bool)

(assert (=> b!210946 m!238767))

(declare-fun m!238769 () Bool)

(assert (=> b!210946 m!238769))

(declare-fun m!238771 () Bool)

(assert (=> b!210946 m!238771))

(declare-fun m!238773 () Bool)

(assert (=> mapNonEmpty!9209 m!238773))

(declare-fun m!238775 () Bool)

(assert (=> b!210938 m!238775))

(declare-fun m!238777 () Bool)

(assert (=> b!210941 m!238777))

(declare-fun m!238779 () Bool)

(assert (=> start!20990 m!238779))

(declare-fun m!238781 () Bool)

(assert (=> start!20990 m!238781))

(declare-fun m!238783 () Bool)

(assert (=> start!20990 m!238783))

(declare-fun m!238785 () Bool)

(assert (=> b!210936 m!238785))

(declare-fun m!238787 () Bool)

(assert (=> b!210936 m!238787))

(declare-fun m!238789 () Bool)

(assert (=> b!210936 m!238789))

(declare-fun m!238791 () Bool)

(assert (=> b!210936 m!238791))

(declare-fun m!238793 () Bool)

(assert (=> b!210936 m!238793))

(declare-fun m!238795 () Bool)

(assert (=> b!210936 m!238795))

(declare-fun m!238797 () Bool)

(assert (=> b!210936 m!238797))

(assert (=> b!210936 m!238791))

(declare-fun m!238799 () Bool)

(assert (=> b!210936 m!238799))

(declare-fun m!238801 () Bool)

(assert (=> b!210940 m!238801))

(declare-fun m!238803 () Bool)

(assert (=> b!210935 m!238803))

(check-sat (not b!210936) (not b!210942) (not b!210940) (not b!210946) (not mapNonEmpty!9209) (not b!210935) (not start!20990) (not b_next!5557) tp_is_empty!5419 b_and!12365 (not b!210941))
(check-sat b_and!12365 (not b_next!5557))
