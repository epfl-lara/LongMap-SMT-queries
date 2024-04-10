; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37924 () Bool)

(assert start!37924)

(declare-fun b_free!8937 () Bool)

(declare-fun b_next!8937 () Bool)

(assert (=> start!37924 (= b_free!8937 (not b_next!8937))))

(declare-fun tp!31575 () Bool)

(declare-fun b_and!16227 () Bool)

(assert (=> start!37924 (= tp!31575 b_and!16227)))

(declare-fun b!389892 () Bool)

(declare-fun res!223027 () Bool)

(declare-fun e!236210 () Bool)

(assert (=> b!389892 (=> (not res!223027) (not e!236210))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!23115 0))(
  ( (array!23116 (arr!11022 (Array (_ BitVec 32) (_ BitVec 64))) (size!11374 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23115)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!13917 0))(
  ( (V!13918 (val!4849 Int)) )
))
(declare-datatypes ((ValueCell!4461 0))(
  ( (ValueCellFull!4461 (v!7062 V!13917)) (EmptyCell!4461) )
))
(declare-datatypes ((array!23117 0))(
  ( (array!23118 (arr!11023 (Array (_ BitVec 32) ValueCell!4461)) (size!11375 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23117)

(assert (=> b!389892 (= res!223027 (and (= (size!11375 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11374 _keys!658) (size!11375 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!389893 () Bool)

(declare-fun e!236212 () Bool)

(assert (=> b!389893 (= e!236212 true)))

(declare-datatypes ((tuple2!6522 0))(
  ( (tuple2!6523 (_1!3272 (_ BitVec 64)) (_2!3272 V!13917)) )
))
(declare-fun lt!183505 () tuple2!6522)

(declare-fun lt!183510 () tuple2!6522)

(declare-datatypes ((List!6376 0))(
  ( (Nil!6373) (Cons!6372 (h!7228 tuple2!6522) (t!11534 List!6376)) )
))
(declare-datatypes ((ListLongMap!5435 0))(
  ( (ListLongMap!5436 (toList!2733 List!6376)) )
))
(declare-fun lt!183500 () ListLongMap!5435)

(declare-fun lt!183516 () ListLongMap!5435)

(declare-fun +!1028 (ListLongMap!5435 tuple2!6522) ListLongMap!5435)

(assert (=> b!389893 (= (+!1028 lt!183500 lt!183505) (+!1028 lt!183516 lt!183510))))

(declare-fun v!373 () V!13917)

(declare-fun k0!778 () (_ BitVec 64))

(declare-datatypes ((Unit!11938 0))(
  ( (Unit!11939) )
))
(declare-fun lt!183515 () Unit!11938)

(declare-fun lt!183508 () ListLongMap!5435)

(declare-fun minValue!472 () V!13917)

(declare-fun addCommutativeForDiffKeys!331 (ListLongMap!5435 (_ BitVec 64) V!13917 (_ BitVec 64) V!13917) Unit!11938)

(assert (=> b!389893 (= lt!183515 (addCommutativeForDiffKeys!331 lt!183508 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!389894 () Bool)

(declare-fun res!223031 () Bool)

(declare-fun e!236208 () Bool)

(assert (=> b!389894 (=> (not res!223031) (not e!236208))))

(declare-fun lt!183511 () array!23115)

(declare-datatypes ((List!6377 0))(
  ( (Nil!6374) (Cons!6373 (h!7229 (_ BitVec 64)) (t!11535 List!6377)) )
))
(declare-fun arrayNoDuplicates!0 (array!23115 (_ BitVec 32) List!6377) Bool)

(assert (=> b!389894 (= res!223031 (arrayNoDuplicates!0 lt!183511 #b00000000000000000000000000000000 Nil!6374))))

(declare-fun b!389895 () Bool)

(declare-fun e!236211 () Bool)

(declare-fun tp_is_empty!9609 () Bool)

(assert (=> b!389895 (= e!236211 tp_is_empty!9609)))

(declare-fun b!389896 () Bool)

(declare-fun e!236214 () Bool)

(assert (=> b!389896 (= e!236214 tp_is_empty!9609)))

(declare-fun b!389897 () Bool)

(declare-fun res!223035 () Bool)

(assert (=> b!389897 (=> (not res!223035) (not e!236210))))

(assert (=> b!389897 (= res!223035 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6374))))

(declare-fun res!223033 () Bool)

(assert (=> start!37924 (=> (not res!223033) (not e!236210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37924 (= res!223033 (validMask!0 mask!970))))

(assert (=> start!37924 e!236210))

(declare-fun e!236209 () Bool)

(declare-fun array_inv!8100 (array!23117) Bool)

(assert (=> start!37924 (and (array_inv!8100 _values!506) e!236209)))

(assert (=> start!37924 tp!31575))

(assert (=> start!37924 true))

(assert (=> start!37924 tp_is_empty!9609))

(declare-fun array_inv!8101 (array!23115) Bool)

(assert (=> start!37924 (array_inv!8101 _keys!658)))

(declare-fun b!389898 () Bool)

(declare-fun res!223028 () Bool)

(assert (=> b!389898 (=> (not res!223028) (not e!236210))))

(declare-fun arrayContainsKey!0 (array!23115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389898 (= res!223028 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389899 () Bool)

(declare-fun mapRes!15990 () Bool)

(assert (=> b!389899 (= e!236209 (and e!236214 mapRes!15990))))

(declare-fun condMapEmpty!15990 () Bool)

(declare-fun mapDefault!15990 () ValueCell!4461)

(assert (=> b!389899 (= condMapEmpty!15990 (= (arr!11023 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4461)) mapDefault!15990)))))

(declare-fun mapNonEmpty!15990 () Bool)

(declare-fun tp!31574 () Bool)

(assert (=> mapNonEmpty!15990 (= mapRes!15990 (and tp!31574 e!236211))))

(declare-fun mapKey!15990 () (_ BitVec 32))

(declare-fun mapRest!15990 () (Array (_ BitVec 32) ValueCell!4461))

(declare-fun mapValue!15990 () ValueCell!4461)

(assert (=> mapNonEmpty!15990 (= (arr!11023 _values!506) (store mapRest!15990 mapKey!15990 mapValue!15990))))

(declare-fun b!389900 () Bool)

(declare-fun e!236207 () Bool)

(assert (=> b!389900 (= e!236207 e!236212)))

(declare-fun res!223034 () Bool)

(assert (=> b!389900 (=> res!223034 e!236212)))

(assert (=> b!389900 (= res!223034 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!183514 () ListLongMap!5435)

(assert (=> b!389900 (= lt!183514 lt!183500)))

(assert (=> b!389900 (= lt!183500 (+!1028 lt!183508 lt!183510))))

(declare-fun lt!183502 () Unit!11938)

(declare-fun lt!183513 () ListLongMap!5435)

(declare-fun zeroValue!472 () V!13917)

(assert (=> b!389900 (= lt!183502 (addCommutativeForDiffKeys!331 lt!183513 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!183507 () ListLongMap!5435)

(assert (=> b!389900 (= lt!183507 (+!1028 lt!183514 lt!183505))))

(declare-fun lt!183509 () ListLongMap!5435)

(declare-fun lt!183503 () tuple2!6522)

(assert (=> b!389900 (= lt!183514 (+!1028 lt!183509 lt!183503))))

(declare-fun lt!183501 () ListLongMap!5435)

(assert (=> b!389900 (= lt!183501 lt!183516)))

(assert (=> b!389900 (= lt!183516 (+!1028 lt!183508 lt!183505))))

(assert (=> b!389900 (= lt!183508 (+!1028 lt!183513 lt!183503))))

(declare-fun lt!183506 () ListLongMap!5435)

(assert (=> b!389900 (= lt!183507 (+!1028 (+!1028 lt!183506 lt!183503) lt!183505))))

(assert (=> b!389900 (= lt!183505 (tuple2!6523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389900 (= lt!183503 (tuple2!6523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapIsEmpty!15990 () Bool)

(assert (=> mapIsEmpty!15990 mapRes!15990))

(declare-fun b!389901 () Bool)

(declare-fun res!223026 () Bool)

(assert (=> b!389901 (=> (not res!223026) (not e!236210))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!389901 (= res!223026 (or (= (select (arr!11022 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11022 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389902 () Bool)

(declare-fun res!223032 () Bool)

(assert (=> b!389902 (=> (not res!223032) (not e!236210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23115 (_ BitVec 32)) Bool)

(assert (=> b!389902 (= res!223032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389903 () Bool)

(declare-fun res!223036 () Bool)

(assert (=> b!389903 (=> (not res!223036) (not e!236210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389903 (= res!223036 (validKeyInArray!0 k0!778))))

(declare-fun b!389904 () Bool)

(assert (=> b!389904 (= e!236210 e!236208)))

(declare-fun res!223025 () Bool)

(assert (=> b!389904 (=> (not res!223025) (not e!236208))))

(assert (=> b!389904 (= res!223025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183511 mask!970))))

(assert (=> b!389904 (= lt!183511 (array!23116 (store (arr!11022 _keys!658) i!548 k0!778) (size!11374 _keys!658)))))

(declare-fun b!389905 () Bool)

(assert (=> b!389905 (= e!236208 (not e!236207))))

(declare-fun res!223029 () Bool)

(assert (=> b!389905 (=> res!223029 e!236207)))

(assert (=> b!389905 (= res!223029 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2082 (array!23115 array!23117 (_ BitVec 32) (_ BitVec 32) V!13917 V!13917 (_ BitVec 32) Int) ListLongMap!5435)

(assert (=> b!389905 (= lt!183501 (getCurrentListMap!2082 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183512 () array!23117)

(assert (=> b!389905 (= lt!183507 (getCurrentListMap!2082 lt!183511 lt!183512 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389905 (and (= lt!183506 lt!183509) (= lt!183509 lt!183506))))

(assert (=> b!389905 (= lt!183509 (+!1028 lt!183513 lt!183510))))

(assert (=> b!389905 (= lt!183510 (tuple2!6523 k0!778 v!373))))

(declare-fun lt!183504 () Unit!11938)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!246 (array!23115 array!23117 (_ BitVec 32) (_ BitVec 32) V!13917 V!13917 (_ BitVec 32) (_ BitVec 64) V!13917 (_ BitVec 32) Int) Unit!11938)

(assert (=> b!389905 (= lt!183504 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!246 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!962 (array!23115 array!23117 (_ BitVec 32) (_ BitVec 32) V!13917 V!13917 (_ BitVec 32) Int) ListLongMap!5435)

(assert (=> b!389905 (= lt!183506 (getCurrentListMapNoExtraKeys!962 lt!183511 lt!183512 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389905 (= lt!183512 (array!23118 (store (arr!11023 _values!506) i!548 (ValueCellFull!4461 v!373)) (size!11375 _values!506)))))

(assert (=> b!389905 (= lt!183513 (getCurrentListMapNoExtraKeys!962 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389906 () Bool)

(declare-fun res!223030 () Bool)

(assert (=> b!389906 (=> (not res!223030) (not e!236210))))

(assert (=> b!389906 (= res!223030 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11374 _keys!658))))))

(assert (= (and start!37924 res!223033) b!389892))

(assert (= (and b!389892 res!223027) b!389902))

(assert (= (and b!389902 res!223032) b!389897))

(assert (= (and b!389897 res!223035) b!389906))

(assert (= (and b!389906 res!223030) b!389903))

(assert (= (and b!389903 res!223036) b!389901))

(assert (= (and b!389901 res!223026) b!389898))

(assert (= (and b!389898 res!223028) b!389904))

(assert (= (and b!389904 res!223025) b!389894))

(assert (= (and b!389894 res!223031) b!389905))

(assert (= (and b!389905 (not res!223029)) b!389900))

(assert (= (and b!389900 (not res!223034)) b!389893))

(assert (= (and b!389899 condMapEmpty!15990) mapIsEmpty!15990))

(assert (= (and b!389899 (not condMapEmpty!15990)) mapNonEmpty!15990))

(get-info :version)

(assert (= (and mapNonEmpty!15990 ((_ is ValueCellFull!4461) mapValue!15990)) b!389895))

(assert (= (and b!389899 ((_ is ValueCellFull!4461) mapDefault!15990)) b!389896))

(assert (= start!37924 b!389899))

(declare-fun m!386099 () Bool)

(assert (=> b!389897 m!386099))

(declare-fun m!386101 () Bool)

(assert (=> b!389903 m!386101))

(declare-fun m!386103 () Bool)

(assert (=> b!389901 m!386103))

(declare-fun m!386105 () Bool)

(assert (=> b!389905 m!386105))

(declare-fun m!386107 () Bool)

(assert (=> b!389905 m!386107))

(declare-fun m!386109 () Bool)

(assert (=> b!389905 m!386109))

(declare-fun m!386111 () Bool)

(assert (=> b!389905 m!386111))

(declare-fun m!386113 () Bool)

(assert (=> b!389905 m!386113))

(declare-fun m!386115 () Bool)

(assert (=> b!389905 m!386115))

(declare-fun m!386117 () Bool)

(assert (=> b!389905 m!386117))

(declare-fun m!386119 () Bool)

(assert (=> b!389902 m!386119))

(declare-fun m!386121 () Bool)

(assert (=> b!389904 m!386121))

(declare-fun m!386123 () Bool)

(assert (=> b!389904 m!386123))

(declare-fun m!386125 () Bool)

(assert (=> b!389898 m!386125))

(declare-fun m!386127 () Bool)

(assert (=> b!389894 m!386127))

(declare-fun m!386129 () Bool)

(assert (=> b!389900 m!386129))

(declare-fun m!386131 () Bool)

(assert (=> b!389900 m!386131))

(declare-fun m!386133 () Bool)

(assert (=> b!389900 m!386133))

(declare-fun m!386135 () Bool)

(assert (=> b!389900 m!386135))

(declare-fun m!386137 () Bool)

(assert (=> b!389900 m!386137))

(declare-fun m!386139 () Bool)

(assert (=> b!389900 m!386139))

(declare-fun m!386141 () Bool)

(assert (=> b!389900 m!386141))

(assert (=> b!389900 m!386133))

(declare-fun m!386143 () Bool)

(assert (=> b!389900 m!386143))

(declare-fun m!386145 () Bool)

(assert (=> b!389893 m!386145))

(declare-fun m!386147 () Bool)

(assert (=> b!389893 m!386147))

(declare-fun m!386149 () Bool)

(assert (=> b!389893 m!386149))

(declare-fun m!386151 () Bool)

(assert (=> start!37924 m!386151))

(declare-fun m!386153 () Bool)

(assert (=> start!37924 m!386153))

(declare-fun m!386155 () Bool)

(assert (=> start!37924 m!386155))

(declare-fun m!386157 () Bool)

(assert (=> mapNonEmpty!15990 m!386157))

(check-sat (not b!389898) (not b!389902) (not b!389894) (not b!389900) (not b!389904) tp_is_empty!9609 (not b_next!8937) (not b!389893) (not start!37924) (not b!389905) b_and!16227 (not b!389903) (not mapNonEmpty!15990) (not b!389897))
(check-sat b_and!16227 (not b_next!8937))
