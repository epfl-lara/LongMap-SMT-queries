; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40960 () Bool)

(assert start!40960)

(declare-fun b_free!10909 () Bool)

(declare-fun b_next!10909 () Bool)

(assert (=> start!40960 (= b_free!10909 (not b_next!10909))))

(declare-fun tp!38554 () Bool)

(declare-fun b_and!19025 () Bool)

(assert (=> start!40960 (= tp!38554 b_and!19025)))

(declare-fun b!455806 () Bool)

(declare-fun res!271957 () Bool)

(declare-fun e!266365 () Bool)

(assert (=> b!455806 (=> (not res!271957) (not e!266365))))

(declare-datatypes ((array!28289 0))(
  ( (array!28290 (arr!13588 (Array (_ BitVec 32) (_ BitVec 64))) (size!13941 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28289)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17435 0))(
  ( (V!17436 (val!6168 Int)) )
))
(declare-datatypes ((ValueCell!5780 0))(
  ( (ValueCellFull!5780 (v!8428 V!17435)) (EmptyCell!5780) )
))
(declare-datatypes ((array!28291 0))(
  ( (array!28292 (arr!13589 (Array (_ BitVec 32) ValueCell!5780)) (size!13942 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28291)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!455806 (= res!271957 (and (= (size!13942 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13941 _keys!709) (size!13942 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!20011 () Bool)

(declare-fun mapRes!20011 () Bool)

(assert (=> mapIsEmpty!20011 mapRes!20011))

(declare-fun b!455807 () Bool)

(declare-fun res!271950 () Bool)

(assert (=> b!455807 (=> (not res!271950) (not e!266365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455807 (= res!271950 (validMask!0 mask!1025))))

(declare-fun b!455808 () Bool)

(declare-fun res!271953 () Bool)

(assert (=> b!455808 (=> (not res!271953) (not e!266365))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455808 (= res!271953 (or (= (select (arr!13588 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13588 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455809 () Bool)

(declare-fun res!271958 () Bool)

(assert (=> b!455809 (=> (not res!271958) (not e!266365))))

(assert (=> b!455809 (= res!271958 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13941 _keys!709))))))

(declare-fun b!455810 () Bool)

(declare-fun e!266363 () Bool)

(assert (=> b!455810 (= e!266365 e!266363)))

(declare-fun res!271952 () Bool)

(assert (=> b!455810 (=> (not res!271952) (not e!266363))))

(declare-fun lt!206230 () array!28289)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28289 (_ BitVec 32)) Bool)

(assert (=> b!455810 (= res!271952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206230 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!455810 (= lt!206230 (array!28290 (store (arr!13588 _keys!709) i!563 k0!794) (size!13941 _keys!709)))))

(declare-fun b!455811 () Bool)

(declare-fun res!271955 () Bool)

(assert (=> b!455811 (=> (not res!271955) (not e!266365))))

(declare-datatypes ((List!8206 0))(
  ( (Nil!8203) (Cons!8202 (h!9058 (_ BitVec 64)) (t!14025 List!8206)) )
))
(declare-fun arrayNoDuplicates!0 (array!28289 (_ BitVec 32) List!8206) Bool)

(assert (=> b!455811 (= res!271955 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8203))))

(declare-fun res!271956 () Bool)

(assert (=> start!40960 (=> (not res!271956) (not e!266365))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40960 (= res!271956 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13941 _keys!709))))))

(assert (=> start!40960 e!266365))

(declare-fun tp_is_empty!12247 () Bool)

(assert (=> start!40960 tp_is_empty!12247))

(assert (=> start!40960 tp!38554))

(assert (=> start!40960 true))

(declare-fun e!266362 () Bool)

(declare-fun array_inv!9904 (array!28291) Bool)

(assert (=> start!40960 (and (array_inv!9904 _values!549) e!266362)))

(declare-fun array_inv!9905 (array!28289) Bool)

(assert (=> start!40960 (array_inv!9905 _keys!709)))

(declare-fun mapNonEmpty!20011 () Bool)

(declare-fun tp!38553 () Bool)

(declare-fun e!266364 () Bool)

(assert (=> mapNonEmpty!20011 (= mapRes!20011 (and tp!38553 e!266364))))

(declare-fun mapRest!20011 () (Array (_ BitVec 32) ValueCell!5780))

(declare-fun mapValue!20011 () ValueCell!5780)

(declare-fun mapKey!20011 () (_ BitVec 32))

(assert (=> mapNonEmpty!20011 (= (arr!13589 _values!549) (store mapRest!20011 mapKey!20011 mapValue!20011))))

(declare-fun b!455812 () Bool)

(assert (=> b!455812 (= e!266363 false)))

(declare-fun minValue!515 () V!17435)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8144 0))(
  ( (tuple2!8145 (_1!4083 (_ BitVec 64)) (_2!4083 V!17435)) )
))
(declare-datatypes ((List!8207 0))(
  ( (Nil!8204) (Cons!8203 (h!9059 tuple2!8144) (t!14026 List!8207)) )
))
(declare-datatypes ((ListLongMap!7047 0))(
  ( (ListLongMap!7048 (toList!3539 List!8207)) )
))
(declare-fun lt!206229 () ListLongMap!7047)

(declare-fun v!412 () V!17435)

(declare-fun zeroValue!515 () V!17435)

(declare-fun getCurrentListMapNoExtraKeys!1734 (array!28289 array!28291 (_ BitVec 32) (_ BitVec 32) V!17435 V!17435 (_ BitVec 32) Int) ListLongMap!7047)

(assert (=> b!455812 (= lt!206229 (getCurrentListMapNoExtraKeys!1734 lt!206230 (array!28292 (store (arr!13589 _values!549) i!563 (ValueCellFull!5780 v!412)) (size!13942 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206231 () ListLongMap!7047)

(assert (=> b!455812 (= lt!206231 (getCurrentListMapNoExtraKeys!1734 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455813 () Bool)

(declare-fun res!271948 () Bool)

(assert (=> b!455813 (=> (not res!271948) (not e!266365))))

(assert (=> b!455813 (= res!271948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455814 () Bool)

(declare-fun e!266361 () Bool)

(assert (=> b!455814 (= e!266362 (and e!266361 mapRes!20011))))

(declare-fun condMapEmpty!20011 () Bool)

(declare-fun mapDefault!20011 () ValueCell!5780)

(assert (=> b!455814 (= condMapEmpty!20011 (= (arr!13589 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5780)) mapDefault!20011)))))

(declare-fun b!455815 () Bool)

(assert (=> b!455815 (= e!266364 tp_is_empty!12247)))

(declare-fun b!455816 () Bool)

(declare-fun res!271954 () Bool)

(assert (=> b!455816 (=> (not res!271954) (not e!266363))))

(assert (=> b!455816 (= res!271954 (arrayNoDuplicates!0 lt!206230 #b00000000000000000000000000000000 Nil!8203))))

(declare-fun b!455817 () Bool)

(assert (=> b!455817 (= e!266361 tp_is_empty!12247)))

(declare-fun b!455818 () Bool)

(declare-fun res!271947 () Bool)

(assert (=> b!455818 (=> (not res!271947) (not e!266365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455818 (= res!271947 (validKeyInArray!0 k0!794))))

(declare-fun b!455819 () Bool)

(declare-fun res!271951 () Bool)

(assert (=> b!455819 (=> (not res!271951) (not e!266365))))

(declare-fun arrayContainsKey!0 (array!28289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455819 (= res!271951 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455820 () Bool)

(declare-fun res!271949 () Bool)

(assert (=> b!455820 (=> (not res!271949) (not e!266363))))

(assert (=> b!455820 (= res!271949 (bvsle from!863 i!563))))

(assert (= (and start!40960 res!271956) b!455807))

(assert (= (and b!455807 res!271950) b!455806))

(assert (= (and b!455806 res!271957) b!455813))

(assert (= (and b!455813 res!271948) b!455811))

(assert (= (and b!455811 res!271955) b!455809))

(assert (= (and b!455809 res!271958) b!455818))

(assert (= (and b!455818 res!271947) b!455808))

(assert (= (and b!455808 res!271953) b!455819))

(assert (= (and b!455819 res!271951) b!455810))

(assert (= (and b!455810 res!271952) b!455816))

(assert (= (and b!455816 res!271954) b!455820))

(assert (= (and b!455820 res!271949) b!455812))

(assert (= (and b!455814 condMapEmpty!20011) mapIsEmpty!20011))

(assert (= (and b!455814 (not condMapEmpty!20011)) mapNonEmpty!20011))

(get-info :version)

(assert (= (and mapNonEmpty!20011 ((_ is ValueCellFull!5780) mapValue!20011)) b!455815))

(assert (= (and b!455814 ((_ is ValueCellFull!5780) mapDefault!20011)) b!455817))

(assert (= start!40960 b!455814))

(declare-fun m!438917 () Bool)

(assert (=> b!455812 m!438917))

(declare-fun m!438919 () Bool)

(assert (=> b!455812 m!438919))

(declare-fun m!438921 () Bool)

(assert (=> b!455812 m!438921))

(declare-fun m!438923 () Bool)

(assert (=> b!455811 m!438923))

(declare-fun m!438925 () Bool)

(assert (=> b!455816 m!438925))

(declare-fun m!438927 () Bool)

(assert (=> b!455819 m!438927))

(declare-fun m!438929 () Bool)

(assert (=> start!40960 m!438929))

(declare-fun m!438931 () Bool)

(assert (=> start!40960 m!438931))

(declare-fun m!438933 () Bool)

(assert (=> b!455813 m!438933))

(declare-fun m!438935 () Bool)

(assert (=> b!455818 m!438935))

(declare-fun m!438937 () Bool)

(assert (=> b!455810 m!438937))

(declare-fun m!438939 () Bool)

(assert (=> b!455810 m!438939))

(declare-fun m!438941 () Bool)

(assert (=> mapNonEmpty!20011 m!438941))

(declare-fun m!438943 () Bool)

(assert (=> b!455807 m!438943))

(declare-fun m!438945 () Bool)

(assert (=> b!455808 m!438945))

(check-sat (not b!455816) (not start!40960) (not b!455811) tp_is_empty!12247 (not b!455812) (not b_next!10909) (not b!455818) (not mapNonEmpty!20011) (not b!455807) (not b!455810) b_and!19025 (not b!455819) (not b!455813))
(check-sat b_and!19025 (not b_next!10909))
