; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39558 () Bool)

(assert start!39558)

(declare-fun b_free!9825 () Bool)

(declare-fun b_next!9825 () Bool)

(assert (=> start!39558 (= b_free!9825 (not b_next!9825))))

(declare-fun tp!35003 () Bool)

(declare-fun b_and!17481 () Bool)

(assert (=> start!39558 (= tp!35003 b_and!17481)))

(declare-fun b!423309 () Bool)

(declare-fun res!247373 () Bool)

(declare-fun e!251686 () Bool)

(assert (=> b!423309 (=> (not res!247373) (not e!251686))))

(declare-datatypes ((array!25799 0))(
  ( (array!25800 (arr!12349 (Array (_ BitVec 32) (_ BitVec 64))) (size!12701 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25799)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423309 (= res!247373 (or (= (select (arr!12349 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12349 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423310 () Bool)

(declare-fun res!247377 () Bool)

(assert (=> b!423310 (=> (not res!247377) (not e!251686))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423310 (= res!247377 (validMask!0 mask!1025))))

(declare-fun res!247382 () Bool)

(assert (=> start!39558 (=> (not res!247382) (not e!251686))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39558 (= res!247382 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12701 _keys!709))))))

(assert (=> start!39558 e!251686))

(declare-fun tp_is_empty!10977 () Bool)

(assert (=> start!39558 tp_is_empty!10977))

(assert (=> start!39558 tp!35003))

(assert (=> start!39558 true))

(declare-datatypes ((V!15741 0))(
  ( (V!15742 (val!5533 Int)) )
))
(declare-datatypes ((ValueCell!5145 0))(
  ( (ValueCellFull!5145 (v!7780 V!15741)) (EmptyCell!5145) )
))
(declare-datatypes ((array!25801 0))(
  ( (array!25802 (arr!12350 (Array (_ BitVec 32) ValueCell!5145)) (size!12702 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25801)

(declare-fun e!251683 () Bool)

(declare-fun array_inv!8996 (array!25801) Bool)

(assert (=> start!39558 (and (array_inv!8996 _values!549) e!251683)))

(declare-fun array_inv!8997 (array!25799) Bool)

(assert (=> start!39558 (array_inv!8997 _keys!709)))

(declare-fun b!423311 () Bool)

(declare-fun e!251685 () Bool)

(assert (=> b!423311 (= e!251685 tp_is_empty!10977)))

(declare-fun mapNonEmpty!18087 () Bool)

(declare-fun mapRes!18087 () Bool)

(declare-fun tp!35004 () Bool)

(declare-fun e!251688 () Bool)

(assert (=> mapNonEmpty!18087 (= mapRes!18087 (and tp!35004 e!251688))))

(declare-fun mapRest!18087 () (Array (_ BitVec 32) ValueCell!5145))

(declare-fun mapKey!18087 () (_ BitVec 32))

(declare-fun mapValue!18087 () ValueCell!5145)

(assert (=> mapNonEmpty!18087 (= (arr!12350 _values!549) (store mapRest!18087 mapKey!18087 mapValue!18087))))

(declare-fun b!423312 () Bool)

(assert (=> b!423312 (= e!251688 tp_is_empty!10977)))

(declare-fun b!423313 () Bool)

(declare-fun res!247380 () Bool)

(declare-fun e!251687 () Bool)

(assert (=> b!423313 (=> (not res!247380) (not e!251687))))

(assert (=> b!423313 (= res!247380 (bvsle from!863 i!563))))

(declare-fun b!423314 () Bool)

(declare-fun res!247379 () Bool)

(assert (=> b!423314 (=> (not res!247379) (not e!251686))))

(declare-datatypes ((List!7273 0))(
  ( (Nil!7270) (Cons!7269 (h!8125 (_ BitVec 64)) (t!12717 List!7273)) )
))
(declare-fun arrayNoDuplicates!0 (array!25799 (_ BitVec 32) List!7273) Bool)

(assert (=> b!423314 (= res!247379 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7270))))

(declare-fun b!423315 () Bool)

(assert (=> b!423315 (= e!251686 e!251687)))

(declare-fun res!247378 () Bool)

(assert (=> b!423315 (=> (not res!247378) (not e!251687))))

(declare-fun lt!194143 () array!25799)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25799 (_ BitVec 32)) Bool)

(assert (=> b!423315 (= res!247378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194143 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!423315 (= lt!194143 (array!25800 (store (arr!12349 _keys!709) i!563 k0!794) (size!12701 _keys!709)))))

(declare-fun mapIsEmpty!18087 () Bool)

(assert (=> mapIsEmpty!18087 mapRes!18087))

(declare-fun b!423316 () Bool)

(assert (=> b!423316 (= e!251687 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7266 0))(
  ( (tuple2!7267 (_1!3644 (_ BitVec 64)) (_2!3644 V!15741)) )
))
(declare-datatypes ((List!7274 0))(
  ( (Nil!7271) (Cons!7270 (h!8126 tuple2!7266) (t!12718 List!7274)) )
))
(declare-datatypes ((ListLongMap!6179 0))(
  ( (ListLongMap!6180 (toList!3105 List!7274)) )
))
(declare-fun lt!194144 () ListLongMap!6179)

(declare-fun zeroValue!515 () V!15741)

(declare-fun v!412 () V!15741)

(declare-fun minValue!515 () V!15741)

(declare-fun getCurrentListMapNoExtraKeys!1309 (array!25799 array!25801 (_ BitVec 32) (_ BitVec 32) V!15741 V!15741 (_ BitVec 32) Int) ListLongMap!6179)

(assert (=> b!423316 (= lt!194144 (getCurrentListMapNoExtraKeys!1309 lt!194143 (array!25802 (store (arr!12350 _values!549) i!563 (ValueCellFull!5145 v!412)) (size!12702 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194142 () ListLongMap!6179)

(assert (=> b!423316 (= lt!194142 (getCurrentListMapNoExtraKeys!1309 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423317 () Bool)

(declare-fun res!247381 () Bool)

(assert (=> b!423317 (=> (not res!247381) (not e!251686))))

(assert (=> b!423317 (= res!247381 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12701 _keys!709))))))

(declare-fun b!423318 () Bool)

(declare-fun res!247374 () Bool)

(assert (=> b!423318 (=> (not res!247374) (not e!251686))))

(assert (=> b!423318 (= res!247374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423319 () Bool)

(assert (=> b!423319 (= e!251683 (and e!251685 mapRes!18087))))

(declare-fun condMapEmpty!18087 () Bool)

(declare-fun mapDefault!18087 () ValueCell!5145)

(assert (=> b!423319 (= condMapEmpty!18087 (= (arr!12350 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5145)) mapDefault!18087)))))

(declare-fun b!423320 () Bool)

(declare-fun res!247376 () Bool)

(assert (=> b!423320 (=> (not res!247376) (not e!251686))))

(assert (=> b!423320 (= res!247376 (and (= (size!12702 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12701 _keys!709) (size!12702 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423321 () Bool)

(declare-fun res!247372 () Bool)

(assert (=> b!423321 (=> (not res!247372) (not e!251686))))

(declare-fun arrayContainsKey!0 (array!25799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423321 (= res!247372 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423322 () Bool)

(declare-fun res!247375 () Bool)

(assert (=> b!423322 (=> (not res!247375) (not e!251686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423322 (= res!247375 (validKeyInArray!0 k0!794))))

(declare-fun b!423323 () Bool)

(declare-fun res!247383 () Bool)

(assert (=> b!423323 (=> (not res!247383) (not e!251687))))

(assert (=> b!423323 (= res!247383 (arrayNoDuplicates!0 lt!194143 #b00000000000000000000000000000000 Nil!7270))))

(assert (= (and start!39558 res!247382) b!423310))

(assert (= (and b!423310 res!247377) b!423320))

(assert (= (and b!423320 res!247376) b!423318))

(assert (= (and b!423318 res!247374) b!423314))

(assert (= (and b!423314 res!247379) b!423317))

(assert (= (and b!423317 res!247381) b!423322))

(assert (= (and b!423322 res!247375) b!423309))

(assert (= (and b!423309 res!247373) b!423321))

(assert (= (and b!423321 res!247372) b!423315))

(assert (= (and b!423315 res!247378) b!423323))

(assert (= (and b!423323 res!247383) b!423313))

(assert (= (and b!423313 res!247380) b!423316))

(assert (= (and b!423319 condMapEmpty!18087) mapIsEmpty!18087))

(assert (= (and b!423319 (not condMapEmpty!18087)) mapNonEmpty!18087))

(get-info :version)

(assert (= (and mapNonEmpty!18087 ((_ is ValueCellFull!5145) mapValue!18087)) b!423312))

(assert (= (and b!423319 ((_ is ValueCellFull!5145) mapDefault!18087)) b!423311))

(assert (= start!39558 b!423319))

(declare-fun m!412833 () Bool)

(assert (=> b!423321 m!412833))

(declare-fun m!412835 () Bool)

(assert (=> b!423310 m!412835))

(declare-fun m!412837 () Bool)

(assert (=> mapNonEmpty!18087 m!412837))

(declare-fun m!412839 () Bool)

(assert (=> b!423318 m!412839))

(declare-fun m!412841 () Bool)

(assert (=> b!423322 m!412841))

(declare-fun m!412843 () Bool)

(assert (=> start!39558 m!412843))

(declare-fun m!412845 () Bool)

(assert (=> start!39558 m!412845))

(declare-fun m!412847 () Bool)

(assert (=> b!423315 m!412847))

(declare-fun m!412849 () Bool)

(assert (=> b!423315 m!412849))

(declare-fun m!412851 () Bool)

(assert (=> b!423309 m!412851))

(declare-fun m!412853 () Bool)

(assert (=> b!423323 m!412853))

(declare-fun m!412855 () Bool)

(assert (=> b!423316 m!412855))

(declare-fun m!412857 () Bool)

(assert (=> b!423316 m!412857))

(declare-fun m!412859 () Bool)

(assert (=> b!423316 m!412859))

(declare-fun m!412861 () Bool)

(assert (=> b!423314 m!412861))

(check-sat (not b!423321) (not start!39558) (not b!423314) (not b!423318) (not b!423315) (not b!423310) tp_is_empty!10977 (not b!423323) (not b!423316) (not b!423322) (not mapNonEmpty!18087) b_and!17481 (not b_next!9825))
(check-sat b_and!17481 (not b_next!9825))
