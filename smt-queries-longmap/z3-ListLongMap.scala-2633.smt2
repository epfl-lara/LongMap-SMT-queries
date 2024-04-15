; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39602 () Bool)

(assert start!39602)

(declare-fun b_free!9883 () Bool)

(declare-fun b_next!9883 () Bool)

(assert (=> start!39602 (= b_free!9883 (not b_next!9883))))

(declare-fun tp!35177 () Bool)

(declare-fun b_and!17513 () Bool)

(assert (=> start!39602 (= tp!35177 b_and!17513)))

(declare-fun b!424343 () Bool)

(declare-fun e!252031 () Bool)

(declare-fun e!252035 () Bool)

(assert (=> b!424343 (= e!252031 e!252035)))

(declare-fun res!248289 () Bool)

(assert (=> b!424343 (=> (not res!248289) (not e!252035))))

(declare-datatypes ((array!25899 0))(
  ( (array!25900 (arr!12399 (Array (_ BitVec 32) (_ BitVec 64))) (size!12752 (_ BitVec 32))) )
))
(declare-fun lt!194169 () array!25899)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25899 (_ BitVec 32)) Bool)

(assert (=> b!424343 (= res!248289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194169 mask!1025))))

(declare-fun _keys!709 () array!25899)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424343 (= lt!194169 (array!25900 (store (arr!12399 _keys!709) i!563 k0!794) (size!12752 _keys!709)))))

(declare-fun b!424344 () Bool)

(declare-fun res!248295 () Bool)

(assert (=> b!424344 (=> (not res!248295) (not e!252031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424344 (= res!248295 (validKeyInArray!0 k0!794))))

(declare-fun b!424345 () Bool)

(declare-fun res!248291 () Bool)

(assert (=> b!424345 (=> (not res!248291) (not e!252031))))

(declare-datatypes ((List!7288 0))(
  ( (Nil!7285) (Cons!7284 (h!8140 (_ BitVec 64)) (t!12723 List!7288)) )
))
(declare-fun arrayNoDuplicates!0 (array!25899 (_ BitVec 32) List!7288) Bool)

(assert (=> b!424345 (= res!248291 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7285))))

(declare-fun b!424346 () Bool)

(declare-fun res!248290 () Bool)

(assert (=> b!424346 (=> (not res!248290) (not e!252035))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!424346 (= res!248290 (bvsle from!863 i!563))))

(declare-fun b!424347 () Bool)

(declare-fun res!248287 () Bool)

(assert (=> b!424347 (=> (not res!248287) (not e!252031))))

(assert (=> b!424347 (= res!248287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424348 () Bool)

(declare-fun res!248294 () Bool)

(assert (=> b!424348 (=> (not res!248294) (not e!252031))))

(assert (=> b!424348 (= res!248294 (or (= (select (arr!12399 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12399 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!248296 () Bool)

(assert (=> start!39602 (=> (not res!248296) (not e!252031))))

(assert (=> start!39602 (= res!248296 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12752 _keys!709))))))

(assert (=> start!39602 e!252031))

(declare-fun tp_is_empty!11035 () Bool)

(assert (=> start!39602 tp_is_empty!11035))

(assert (=> start!39602 tp!35177))

(assert (=> start!39602 true))

(declare-datatypes ((V!15819 0))(
  ( (V!15820 (val!5562 Int)) )
))
(declare-datatypes ((ValueCell!5174 0))(
  ( (ValueCellFull!5174 (v!7803 V!15819)) (EmptyCell!5174) )
))
(declare-datatypes ((array!25901 0))(
  ( (array!25902 (arr!12400 (Array (_ BitVec 32) ValueCell!5174)) (size!12753 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25901)

(declare-fun e!252034 () Bool)

(declare-fun array_inv!9068 (array!25901) Bool)

(assert (=> start!39602 (and (array_inv!9068 _values!549) e!252034)))

(declare-fun array_inv!9069 (array!25899) Bool)

(assert (=> start!39602 (array_inv!9069 _keys!709)))

(declare-fun b!424349 () Bool)

(declare-fun res!248297 () Bool)

(assert (=> b!424349 (=> (not res!248297) (not e!252031))))

(declare-fun arrayContainsKey!0 (array!25899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424349 (= res!248297 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424350 () Bool)

(declare-fun res!248292 () Bool)

(assert (=> b!424350 (=> (not res!248292) (not e!252031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424350 (= res!248292 (validMask!0 mask!1025))))

(declare-fun b!424351 () Bool)

(declare-fun res!248288 () Bool)

(assert (=> b!424351 (=> (not res!248288) (not e!252031))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!424351 (= res!248288 (and (= (size!12753 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12752 _keys!709) (size!12753 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424352 () Bool)

(declare-fun e!252033 () Bool)

(assert (=> b!424352 (= e!252033 tp_is_empty!11035)))

(declare-fun b!424353 () Bool)

(declare-fun res!248298 () Bool)

(assert (=> b!424353 (=> (not res!248298) (not e!252031))))

(assert (=> b!424353 (= res!248298 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12752 _keys!709))))))

(declare-fun b!424354 () Bool)

(declare-fun e!252036 () Bool)

(assert (=> b!424354 (= e!252036 tp_is_empty!11035)))

(declare-fun b!424355 () Bool)

(declare-fun mapRes!18174 () Bool)

(assert (=> b!424355 (= e!252034 (and e!252036 mapRes!18174))))

(declare-fun condMapEmpty!18174 () Bool)

(declare-fun mapDefault!18174 () ValueCell!5174)

(assert (=> b!424355 (= condMapEmpty!18174 (= (arr!12400 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5174)) mapDefault!18174)))))

(declare-fun b!424356 () Bool)

(assert (=> b!424356 (= e!252035 false)))

(declare-fun minValue!515 () V!15819)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15819)

(declare-datatypes ((tuple2!7290 0))(
  ( (tuple2!7291 (_1!3656 (_ BitVec 64)) (_2!3656 V!15819)) )
))
(declare-datatypes ((List!7289 0))(
  ( (Nil!7286) (Cons!7285 (h!8141 tuple2!7290) (t!12724 List!7289)) )
))
(declare-datatypes ((ListLongMap!6193 0))(
  ( (ListLongMap!6194 (toList!3112 List!7289)) )
))
(declare-fun lt!194170 () ListLongMap!6193)

(declare-fun v!412 () V!15819)

(declare-fun getCurrentListMapNoExtraKeys!1320 (array!25899 array!25901 (_ BitVec 32) (_ BitVec 32) V!15819 V!15819 (_ BitVec 32) Int) ListLongMap!6193)

(assert (=> b!424356 (= lt!194170 (getCurrentListMapNoExtraKeys!1320 lt!194169 (array!25902 (store (arr!12400 _values!549) i!563 (ValueCellFull!5174 v!412)) (size!12753 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194171 () ListLongMap!6193)

(assert (=> b!424356 (= lt!194171 (getCurrentListMapNoExtraKeys!1320 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424357 () Bool)

(declare-fun res!248293 () Bool)

(assert (=> b!424357 (=> (not res!248293) (not e!252035))))

(assert (=> b!424357 (= res!248293 (arrayNoDuplicates!0 lt!194169 #b00000000000000000000000000000000 Nil!7285))))

(declare-fun mapNonEmpty!18174 () Bool)

(declare-fun tp!35178 () Bool)

(assert (=> mapNonEmpty!18174 (= mapRes!18174 (and tp!35178 e!252033))))

(declare-fun mapValue!18174 () ValueCell!5174)

(declare-fun mapRest!18174 () (Array (_ BitVec 32) ValueCell!5174))

(declare-fun mapKey!18174 () (_ BitVec 32))

(assert (=> mapNonEmpty!18174 (= (arr!12400 _values!549) (store mapRest!18174 mapKey!18174 mapValue!18174))))

(declare-fun mapIsEmpty!18174 () Bool)

(assert (=> mapIsEmpty!18174 mapRes!18174))

(assert (= (and start!39602 res!248296) b!424350))

(assert (= (and b!424350 res!248292) b!424351))

(assert (= (and b!424351 res!248288) b!424347))

(assert (= (and b!424347 res!248287) b!424345))

(assert (= (and b!424345 res!248291) b!424353))

(assert (= (and b!424353 res!248298) b!424344))

(assert (= (and b!424344 res!248295) b!424348))

(assert (= (and b!424348 res!248294) b!424349))

(assert (= (and b!424349 res!248297) b!424343))

(assert (= (and b!424343 res!248289) b!424357))

(assert (= (and b!424357 res!248293) b!424346))

(assert (= (and b!424346 res!248290) b!424356))

(assert (= (and b!424355 condMapEmpty!18174) mapIsEmpty!18174))

(assert (= (and b!424355 (not condMapEmpty!18174)) mapNonEmpty!18174))

(get-info :version)

(assert (= (and mapNonEmpty!18174 ((_ is ValueCellFull!5174) mapValue!18174)) b!424352))

(assert (= (and b!424355 ((_ is ValueCellFull!5174) mapDefault!18174)) b!424354))

(assert (= start!39602 b!424355))

(declare-fun m!412971 () Bool)

(assert (=> b!424344 m!412971))

(declare-fun m!412973 () Bool)

(assert (=> b!424356 m!412973))

(declare-fun m!412975 () Bool)

(assert (=> b!424356 m!412975))

(declare-fun m!412977 () Bool)

(assert (=> b!424356 m!412977))

(declare-fun m!412979 () Bool)

(assert (=> mapNonEmpty!18174 m!412979))

(declare-fun m!412981 () Bool)

(assert (=> start!39602 m!412981))

(declare-fun m!412983 () Bool)

(assert (=> start!39602 m!412983))

(declare-fun m!412985 () Bool)

(assert (=> b!424350 m!412985))

(declare-fun m!412987 () Bool)

(assert (=> b!424349 m!412987))

(declare-fun m!412989 () Bool)

(assert (=> b!424345 m!412989))

(declare-fun m!412991 () Bool)

(assert (=> b!424357 m!412991))

(declare-fun m!412993 () Bool)

(assert (=> b!424343 m!412993))

(declare-fun m!412995 () Bool)

(assert (=> b!424343 m!412995))

(declare-fun m!412997 () Bool)

(assert (=> b!424347 m!412997))

(declare-fun m!412999 () Bool)

(assert (=> b!424348 m!412999))

(check-sat (not b!424357) (not b!424350) (not b_next!9883) (not b!424345) (not mapNonEmpty!18174) b_and!17513 (not b!424343) (not b!424356) (not b!424347) (not b!424344) (not b!424349) tp_is_empty!11035 (not start!39602))
(check-sat b_and!17513 (not b_next!9883))
