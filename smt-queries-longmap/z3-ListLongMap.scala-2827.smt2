; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40912 () Bool)

(assert start!40912)

(declare-fun b_free!10861 () Bool)

(declare-fun b_next!10861 () Bool)

(assert (=> start!40912 (= b_free!10861 (not b_next!10861))))

(declare-fun tp!38409 () Bool)

(declare-fun b_and!19013 () Bool)

(assert (=> start!40912 (= tp!38409 b_and!19013)))

(declare-fun b!454936 () Bool)

(declare-fun e!266063 () Bool)

(declare-fun tp_is_empty!12199 () Bool)

(assert (=> b!454936 (= e!266063 tp_is_empty!12199)))

(declare-fun b!454937 () Bool)

(declare-fun res!271212 () Bool)

(declare-fun e!266067 () Bool)

(assert (=> b!454937 (=> (not res!271212) (not e!266067))))

(declare-datatypes ((array!28194 0))(
  ( (array!28195 (arr!13540 (Array (_ BitVec 32) (_ BitVec 64))) (size!13892 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28194)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454937 (= res!271212 (or (= (select (arr!13540 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13540 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454938 () Bool)

(declare-fun e!266066 () Bool)

(declare-fun mapRes!19939 () Bool)

(assert (=> b!454938 (= e!266066 (and e!266063 mapRes!19939))))

(declare-fun condMapEmpty!19939 () Bool)

(declare-datatypes ((V!17371 0))(
  ( (V!17372 (val!6144 Int)) )
))
(declare-datatypes ((ValueCell!5756 0))(
  ( (ValueCellFull!5756 (v!8411 V!17371)) (EmptyCell!5756) )
))
(declare-datatypes ((array!28196 0))(
  ( (array!28197 (arr!13541 (Array (_ BitVec 32) ValueCell!5756)) (size!13893 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28196)

(declare-fun mapDefault!19939 () ValueCell!5756)

(assert (=> b!454938 (= condMapEmpty!19939 (= (arr!13541 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5756)) mapDefault!19939)))))

(declare-fun b!454939 () Bool)

(declare-fun res!271213 () Bool)

(assert (=> b!454939 (=> (not res!271213) (not e!266067))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454939 (= res!271213 (validKeyInArray!0 k0!794))))

(declare-fun b!454940 () Bool)

(declare-fun res!271214 () Bool)

(declare-fun e!266068 () Bool)

(assert (=> b!454940 (=> (not res!271214) (not e!266068))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!454940 (= res!271214 (bvsle from!863 i!563))))

(declare-fun b!454941 () Bool)

(declare-fun res!271216 () Bool)

(assert (=> b!454941 (=> (not res!271216) (not e!266068))))

(declare-fun lt!206260 () array!28194)

(declare-datatypes ((List!8068 0))(
  ( (Nil!8065) (Cons!8064 (h!8920 (_ BitVec 64)) (t!13888 List!8068)) )
))
(declare-fun arrayNoDuplicates!0 (array!28194 (_ BitVec 32) List!8068) Bool)

(assert (=> b!454941 (= res!271216 (arrayNoDuplicates!0 lt!206260 #b00000000000000000000000000000000 Nil!8065))))

(declare-fun b!454942 () Bool)

(declare-fun res!271210 () Bool)

(assert (=> b!454942 (=> (not res!271210) (not e!266067))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454942 (= res!271210 (validMask!0 mask!1025))))

(declare-fun b!454944 () Bool)

(declare-fun res!271215 () Bool)

(assert (=> b!454944 (=> (not res!271215) (not e!266067))))

(assert (=> b!454944 (= res!271215 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13892 _keys!709))))))

(declare-fun mapIsEmpty!19939 () Bool)

(assert (=> mapIsEmpty!19939 mapRes!19939))

(declare-fun b!454945 () Bool)

(declare-fun res!271206 () Bool)

(assert (=> b!454945 (=> (not res!271206) (not e!266067))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!454945 (= res!271206 (and (= (size!13893 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13892 _keys!709) (size!13893 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454946 () Bool)

(declare-fun e!266065 () Bool)

(assert (=> b!454946 (= e!266065 tp_is_empty!12199)))

(declare-fun mapNonEmpty!19939 () Bool)

(declare-fun tp!38410 () Bool)

(assert (=> mapNonEmpty!19939 (= mapRes!19939 (and tp!38410 e!266065))))

(declare-fun mapValue!19939 () ValueCell!5756)

(declare-fun mapKey!19939 () (_ BitVec 32))

(declare-fun mapRest!19939 () (Array (_ BitVec 32) ValueCell!5756))

(assert (=> mapNonEmpty!19939 (= (arr!13541 _values!549) (store mapRest!19939 mapKey!19939 mapValue!19939))))

(declare-fun b!454947 () Bool)

(declare-fun res!271208 () Bool)

(assert (=> b!454947 (=> (not res!271208) (not e!266067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28194 (_ BitVec 32)) Bool)

(assert (=> b!454947 (= res!271208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454948 () Bool)

(declare-fun res!271205 () Bool)

(assert (=> b!454948 (=> (not res!271205) (not e!266067))))

(assert (=> b!454948 (= res!271205 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8065))))

(declare-fun b!454949 () Bool)

(assert (=> b!454949 (= e!266068 false)))

(declare-fun minValue!515 () V!17371)

(declare-fun zeroValue!515 () V!17371)

(declare-datatypes ((tuple2!7998 0))(
  ( (tuple2!7999 (_1!4010 (_ BitVec 64)) (_2!4010 V!17371)) )
))
(declare-datatypes ((List!8069 0))(
  ( (Nil!8066) (Cons!8065 (h!8921 tuple2!7998) (t!13889 List!8069)) )
))
(declare-datatypes ((ListLongMap!6913 0))(
  ( (ListLongMap!6914 (toList!3472 List!8069)) )
))
(declare-fun lt!206261 () ListLongMap!6913)

(declare-fun v!412 () V!17371)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1701 (array!28194 array!28196 (_ BitVec 32) (_ BitVec 32) V!17371 V!17371 (_ BitVec 32) Int) ListLongMap!6913)

(assert (=> b!454949 (= lt!206261 (getCurrentListMapNoExtraKeys!1701 lt!206260 (array!28197 (store (arr!13541 _values!549) i!563 (ValueCellFull!5756 v!412)) (size!13893 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206259 () ListLongMap!6913)

(assert (=> b!454949 (= lt!206259 (getCurrentListMapNoExtraKeys!1701 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454950 () Bool)

(assert (=> b!454950 (= e!266067 e!266068)))

(declare-fun res!271207 () Bool)

(assert (=> b!454950 (=> (not res!271207) (not e!266068))))

(assert (=> b!454950 (= res!271207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206260 mask!1025))))

(assert (=> b!454950 (= lt!206260 (array!28195 (store (arr!13540 _keys!709) i!563 k0!794) (size!13892 _keys!709)))))

(declare-fun res!271211 () Bool)

(assert (=> start!40912 (=> (not res!271211) (not e!266067))))

(assert (=> start!40912 (= res!271211 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13892 _keys!709))))))

(assert (=> start!40912 e!266067))

(assert (=> start!40912 tp_is_empty!12199))

(assert (=> start!40912 tp!38409))

(assert (=> start!40912 true))

(declare-fun array_inv!9882 (array!28196) Bool)

(assert (=> start!40912 (and (array_inv!9882 _values!549) e!266066)))

(declare-fun array_inv!9883 (array!28194) Bool)

(assert (=> start!40912 (array_inv!9883 _keys!709)))

(declare-fun b!454943 () Bool)

(declare-fun res!271209 () Bool)

(assert (=> b!454943 (=> (not res!271209) (not e!266067))))

(declare-fun arrayContainsKey!0 (array!28194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454943 (= res!271209 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40912 res!271211) b!454942))

(assert (= (and b!454942 res!271210) b!454945))

(assert (= (and b!454945 res!271206) b!454947))

(assert (= (and b!454947 res!271208) b!454948))

(assert (= (and b!454948 res!271205) b!454944))

(assert (= (and b!454944 res!271215) b!454939))

(assert (= (and b!454939 res!271213) b!454937))

(assert (= (and b!454937 res!271212) b!454943))

(assert (= (and b!454943 res!271209) b!454950))

(assert (= (and b!454950 res!271207) b!454941))

(assert (= (and b!454941 res!271216) b!454940))

(assert (= (and b!454940 res!271214) b!454949))

(assert (= (and b!454938 condMapEmpty!19939) mapIsEmpty!19939))

(assert (= (and b!454938 (not condMapEmpty!19939)) mapNonEmpty!19939))

(get-info :version)

(assert (= (and mapNonEmpty!19939 ((_ is ValueCellFull!5756) mapValue!19939)) b!454946))

(assert (= (and b!454938 ((_ is ValueCellFull!5756) mapDefault!19939)) b!454936))

(assert (= start!40912 b!454938))

(declare-fun m!439113 () Bool)

(assert (=> b!454939 m!439113))

(declare-fun m!439115 () Bool)

(assert (=> b!454950 m!439115))

(declare-fun m!439117 () Bool)

(assert (=> b!454950 m!439117))

(declare-fun m!439119 () Bool)

(assert (=> b!454948 m!439119))

(declare-fun m!439121 () Bool)

(assert (=> b!454943 m!439121))

(declare-fun m!439123 () Bool)

(assert (=> b!454941 m!439123))

(declare-fun m!439125 () Bool)

(assert (=> b!454942 m!439125))

(declare-fun m!439127 () Bool)

(assert (=> mapNonEmpty!19939 m!439127))

(declare-fun m!439129 () Bool)

(assert (=> b!454937 m!439129))

(declare-fun m!439131 () Bool)

(assert (=> b!454947 m!439131))

(declare-fun m!439133 () Bool)

(assert (=> start!40912 m!439133))

(declare-fun m!439135 () Bool)

(assert (=> start!40912 m!439135))

(declare-fun m!439137 () Bool)

(assert (=> b!454949 m!439137))

(declare-fun m!439139 () Bool)

(assert (=> b!454949 m!439139))

(declare-fun m!439141 () Bool)

(assert (=> b!454949 m!439141))

(check-sat (not start!40912) b_and!19013 (not b!454949) (not b!454943) (not b!454950) (not mapNonEmpty!19939) (not b!454939) (not b!454942) tp_is_empty!12199 (not b!454941) (not b!454948) (not b!454947) (not b_next!10861))
(check-sat b_and!19013 (not b_next!10861))
