; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40960 () Bool)

(assert start!40960)

(declare-fun b_free!10909 () Bool)

(declare-fun b_next!10909 () Bool)

(assert (=> start!40960 (= b_free!10909 (not b_next!10909))))

(declare-fun tp!38554 () Bool)

(declare-fun b_and!19061 () Bool)

(assert (=> start!40960 (= tp!38554 b_and!19061)))

(declare-fun b!456016 () Bool)

(declare-fun e!266495 () Bool)

(declare-fun tp_is_empty!12247 () Bool)

(assert (=> b!456016 (= e!266495 tp_is_empty!12247)))

(declare-fun b!456017 () Bool)

(declare-fun res!272072 () Bool)

(declare-fun e!266499 () Bool)

(assert (=> b!456017 (=> (not res!272072) (not e!266499))))

(declare-datatypes ((array!28288 0))(
  ( (array!28289 (arr!13587 (Array (_ BitVec 32) (_ BitVec 64))) (size!13939 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28288)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17435 0))(
  ( (V!17436 (val!6168 Int)) )
))
(declare-datatypes ((ValueCell!5780 0))(
  ( (ValueCellFull!5780 (v!8435 V!17435)) (EmptyCell!5780) )
))
(declare-datatypes ((array!28290 0))(
  ( (array!28291 (arr!13588 (Array (_ BitVec 32) ValueCell!5780)) (size!13940 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28290)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!456017 (= res!272072 (and (= (size!13940 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13939 _keys!709) (size!13940 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456018 () Bool)

(declare-fun e!266496 () Bool)

(assert (=> b!456018 (= e!266496 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8036 0))(
  ( (tuple2!8037 (_1!4029 (_ BitVec 64)) (_2!4029 V!17435)) )
))
(declare-datatypes ((List!8108 0))(
  ( (Nil!8105) (Cons!8104 (h!8960 tuple2!8036) (t!13928 List!8108)) )
))
(declare-datatypes ((ListLongMap!6951 0))(
  ( (ListLongMap!6952 (toList!3491 List!8108)) )
))
(declare-fun lt!206477 () ListLongMap!6951)

(declare-fun zeroValue!515 () V!17435)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!206476 () array!28288)

(declare-fun v!412 () V!17435)

(declare-fun minValue!515 () V!17435)

(declare-fun getCurrentListMapNoExtraKeys!1720 (array!28288 array!28290 (_ BitVec 32) (_ BitVec 32) V!17435 V!17435 (_ BitVec 32) Int) ListLongMap!6951)

(assert (=> b!456018 (= lt!206477 (getCurrentListMapNoExtraKeys!1720 lt!206476 (array!28291 (store (arr!13588 _values!549) i!563 (ValueCellFull!5780 v!412)) (size!13940 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206475 () ListLongMap!6951)

(assert (=> b!456018 (= lt!206475 (getCurrentListMapNoExtraKeys!1720 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456019 () Bool)

(assert (=> b!456019 (= e!266499 e!266496)))

(declare-fun res!272077 () Bool)

(assert (=> b!456019 (=> (not res!272077) (not e!266496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28288 (_ BitVec 32)) Bool)

(assert (=> b!456019 (= res!272077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206476 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!456019 (= lt!206476 (array!28289 (store (arr!13587 _keys!709) i!563 k0!794) (size!13939 _keys!709)))))

(declare-fun mapIsEmpty!20011 () Bool)

(declare-fun mapRes!20011 () Bool)

(assert (=> mapIsEmpty!20011 mapRes!20011))

(declare-fun mapNonEmpty!20011 () Bool)

(declare-fun tp!38553 () Bool)

(assert (=> mapNonEmpty!20011 (= mapRes!20011 (and tp!38553 e!266495))))

(declare-fun mapRest!20011 () (Array (_ BitVec 32) ValueCell!5780))

(declare-fun mapKey!20011 () (_ BitVec 32))

(declare-fun mapValue!20011 () ValueCell!5780)

(assert (=> mapNonEmpty!20011 (= (arr!13588 _values!549) (store mapRest!20011 mapKey!20011 mapValue!20011))))

(declare-fun b!456020 () Bool)

(declare-fun e!266500 () Bool)

(assert (=> b!456020 (= e!266500 tp_is_empty!12247)))

(declare-fun b!456021 () Bool)

(declare-fun res!272074 () Bool)

(assert (=> b!456021 (=> (not res!272074) (not e!266499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456021 (= res!272074 (validMask!0 mask!1025))))

(declare-fun res!272078 () Bool)

(assert (=> start!40960 (=> (not res!272078) (not e!266499))))

(assert (=> start!40960 (= res!272078 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13939 _keys!709))))))

(assert (=> start!40960 e!266499))

(assert (=> start!40960 tp_is_empty!12247))

(assert (=> start!40960 tp!38554))

(assert (=> start!40960 true))

(declare-fun e!266497 () Bool)

(declare-fun array_inv!9912 (array!28290) Bool)

(assert (=> start!40960 (and (array_inv!9912 _values!549) e!266497)))

(declare-fun array_inv!9913 (array!28288) Bool)

(assert (=> start!40960 (array_inv!9913 _keys!709)))

(declare-fun b!456022 () Bool)

(declare-fun res!272079 () Bool)

(assert (=> b!456022 (=> (not res!272079) (not e!266499))))

(assert (=> b!456022 (= res!272079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456023 () Bool)

(declare-fun res!272071 () Bool)

(assert (=> b!456023 (=> (not res!272071) (not e!266496))))

(declare-datatypes ((List!8109 0))(
  ( (Nil!8106) (Cons!8105 (h!8961 (_ BitVec 64)) (t!13929 List!8109)) )
))
(declare-fun arrayNoDuplicates!0 (array!28288 (_ BitVec 32) List!8109) Bool)

(assert (=> b!456023 (= res!272071 (arrayNoDuplicates!0 lt!206476 #b00000000000000000000000000000000 Nil!8106))))

(declare-fun b!456024 () Bool)

(declare-fun res!272080 () Bool)

(assert (=> b!456024 (=> (not res!272080) (not e!266499))))

(assert (=> b!456024 (= res!272080 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8106))))

(declare-fun b!456025 () Bool)

(declare-fun res!272070 () Bool)

(assert (=> b!456025 (=> (not res!272070) (not e!266499))))

(assert (=> b!456025 (= res!272070 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13939 _keys!709))))))

(declare-fun b!456026 () Bool)

(declare-fun res!272075 () Bool)

(assert (=> b!456026 (=> (not res!272075) (not e!266496))))

(assert (=> b!456026 (= res!272075 (bvsle from!863 i!563))))

(declare-fun b!456027 () Bool)

(declare-fun res!272069 () Bool)

(assert (=> b!456027 (=> (not res!272069) (not e!266499))))

(declare-fun arrayContainsKey!0 (array!28288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456027 (= res!272069 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456028 () Bool)

(declare-fun res!272076 () Bool)

(assert (=> b!456028 (=> (not res!272076) (not e!266499))))

(assert (=> b!456028 (= res!272076 (or (= (select (arr!13587 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13587 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456029 () Bool)

(assert (=> b!456029 (= e!266497 (and e!266500 mapRes!20011))))

(declare-fun condMapEmpty!20011 () Bool)

(declare-fun mapDefault!20011 () ValueCell!5780)

(assert (=> b!456029 (= condMapEmpty!20011 (= (arr!13588 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5780)) mapDefault!20011)))))

(declare-fun b!456030 () Bool)

(declare-fun res!272073 () Bool)

(assert (=> b!456030 (=> (not res!272073) (not e!266499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456030 (= res!272073 (validKeyInArray!0 k0!794))))

(assert (= (and start!40960 res!272078) b!456021))

(assert (= (and b!456021 res!272074) b!456017))

(assert (= (and b!456017 res!272072) b!456022))

(assert (= (and b!456022 res!272079) b!456024))

(assert (= (and b!456024 res!272080) b!456025))

(assert (= (and b!456025 res!272070) b!456030))

(assert (= (and b!456030 res!272073) b!456028))

(assert (= (and b!456028 res!272076) b!456027))

(assert (= (and b!456027 res!272069) b!456019))

(assert (= (and b!456019 res!272077) b!456023))

(assert (= (and b!456023 res!272071) b!456026))

(assert (= (and b!456026 res!272075) b!456018))

(assert (= (and b!456029 condMapEmpty!20011) mapIsEmpty!20011))

(assert (= (and b!456029 (not condMapEmpty!20011)) mapNonEmpty!20011))

(get-info :version)

(assert (= (and mapNonEmpty!20011 ((_ is ValueCellFull!5780) mapValue!20011)) b!456016))

(assert (= (and b!456029 ((_ is ValueCellFull!5780) mapDefault!20011)) b!456020))

(assert (= start!40960 b!456029))

(declare-fun m!439833 () Bool)

(assert (=> b!456030 m!439833))

(declare-fun m!439835 () Bool)

(assert (=> start!40960 m!439835))

(declare-fun m!439837 () Bool)

(assert (=> start!40960 m!439837))

(declare-fun m!439839 () Bool)

(assert (=> b!456018 m!439839))

(declare-fun m!439841 () Bool)

(assert (=> b!456018 m!439841))

(declare-fun m!439843 () Bool)

(assert (=> b!456018 m!439843))

(declare-fun m!439845 () Bool)

(assert (=> b!456023 m!439845))

(declare-fun m!439847 () Bool)

(assert (=> b!456019 m!439847))

(declare-fun m!439849 () Bool)

(assert (=> b!456019 m!439849))

(declare-fun m!439851 () Bool)

(assert (=> mapNonEmpty!20011 m!439851))

(declare-fun m!439853 () Bool)

(assert (=> b!456021 m!439853))

(declare-fun m!439855 () Bool)

(assert (=> b!456022 m!439855))

(declare-fun m!439857 () Bool)

(assert (=> b!456028 m!439857))

(declare-fun m!439859 () Bool)

(assert (=> b!456027 m!439859))

(declare-fun m!439861 () Bool)

(assert (=> b!456024 m!439861))

(check-sat b_and!19061 (not b!456021) (not b!456027) (not b!456019) tp_is_empty!12247 (not mapNonEmpty!20011) (not b!456023) (not b!456022) (not start!40960) (not b!456024) (not b!456018) (not b!456030) (not b_next!10909))
(check-sat b_and!19061 (not b_next!10909))
