; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39630 () Bool)

(assert start!39630)

(declare-fun b_free!9897 () Bool)

(declare-fun b_next!9897 () Bool)

(assert (=> start!39630 (= b_free!9897 (not b_next!9897))))

(declare-fun tp!35220 () Bool)

(declare-fun b_and!17553 () Bool)

(assert (=> start!39630 (= tp!35220 b_and!17553)))

(declare-fun b!424943 () Bool)

(declare-fun e!252350 () Bool)

(declare-fun e!252348 () Bool)

(declare-fun mapRes!18195 () Bool)

(assert (=> b!424943 (= e!252350 (and e!252348 mapRes!18195))))

(declare-fun condMapEmpty!18195 () Bool)

(declare-datatypes ((V!15837 0))(
  ( (V!15838 (val!5569 Int)) )
))
(declare-datatypes ((ValueCell!5181 0))(
  ( (ValueCellFull!5181 (v!7816 V!15837)) (EmptyCell!5181) )
))
(declare-datatypes ((array!25937 0))(
  ( (array!25938 (arr!12418 (Array (_ BitVec 32) ValueCell!5181)) (size!12770 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25937)

(declare-fun mapDefault!18195 () ValueCell!5181)

(assert (=> b!424943 (= condMapEmpty!18195 (= (arr!12418 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5181)) mapDefault!18195)))))

(declare-fun b!424944 () Bool)

(declare-fun res!248692 () Bool)

(declare-fun e!252346 () Bool)

(assert (=> b!424944 (=> (not res!248692) (not e!252346))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424944 (= res!248692 (validMask!0 mask!1025))))

(declare-fun b!424945 () Bool)

(declare-fun tp_is_empty!11049 () Bool)

(assert (=> b!424945 (= e!252348 tp_is_empty!11049)))

(declare-fun b!424946 () Bool)

(declare-fun e!252347 () Bool)

(assert (=> b!424946 (= e!252347 (not true))))

(declare-fun minValue!515 () V!15837)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15837)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15837)

(declare-datatypes ((array!25939 0))(
  ( (array!25940 (arr!12419 (Array (_ BitVec 32) (_ BitVec 64))) (size!12771 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25939)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!194495 () array!25939)

(declare-fun lt!194496 () array!25937)

(declare-datatypes ((tuple2!7314 0))(
  ( (tuple2!7315 (_1!3668 (_ BitVec 64)) (_2!3668 V!15837)) )
))
(declare-datatypes ((List!7324 0))(
  ( (Nil!7321) (Cons!7320 (h!8176 tuple2!7314) (t!12768 List!7324)) )
))
(declare-datatypes ((ListLongMap!6227 0))(
  ( (ListLongMap!6228 (toList!3129 List!7324)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1333 (array!25939 array!25937 (_ BitVec 32) (_ BitVec 32) V!15837 V!15837 (_ BitVec 32) Int) ListLongMap!6227)

(declare-fun +!1287 (ListLongMap!6227 tuple2!7314) ListLongMap!6227)

(assert (=> b!424946 (= (getCurrentListMapNoExtraKeys!1333 lt!194495 lt!194496 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1287 (getCurrentListMapNoExtraKeys!1333 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7315 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12476 0))(
  ( (Unit!12477) )
))
(declare-fun lt!194497 () Unit!12476)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!482 (array!25939 array!25937 (_ BitVec 32) (_ BitVec 32) V!15837 V!15837 (_ BitVec 32) (_ BitVec 64) V!15837 (_ BitVec 32) Int) Unit!12476)

(assert (=> b!424946 (= lt!194497 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!482 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!424947 () Bool)

(declare-fun res!248688 () Bool)

(assert (=> b!424947 (=> (not res!248688) (not e!252346))))

(assert (=> b!424947 (= res!248688 (or (= (select (arr!12419 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12419 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!424949 () Bool)

(declare-fun res!248685 () Bool)

(declare-fun e!252349 () Bool)

(assert (=> b!424949 (=> (not res!248685) (not e!252349))))

(declare-datatypes ((List!7325 0))(
  ( (Nil!7322) (Cons!7321 (h!8177 (_ BitVec 64)) (t!12769 List!7325)) )
))
(declare-fun arrayNoDuplicates!0 (array!25939 (_ BitVec 32) List!7325) Bool)

(assert (=> b!424949 (= res!248685 (arrayNoDuplicates!0 lt!194495 #b00000000000000000000000000000000 Nil!7322))))

(declare-fun b!424950 () Bool)

(declare-fun res!248690 () Bool)

(assert (=> b!424950 (=> (not res!248690) (not e!252346))))

(assert (=> b!424950 (= res!248690 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7322))))

(declare-fun mapNonEmpty!18195 () Bool)

(declare-fun tp!35219 () Bool)

(declare-fun e!252345 () Bool)

(assert (=> mapNonEmpty!18195 (= mapRes!18195 (and tp!35219 e!252345))))

(declare-fun mapKey!18195 () (_ BitVec 32))

(declare-fun mapRest!18195 () (Array (_ BitVec 32) ValueCell!5181))

(declare-fun mapValue!18195 () ValueCell!5181)

(assert (=> mapNonEmpty!18195 (= (arr!12418 _values!549) (store mapRest!18195 mapKey!18195 mapValue!18195))))

(declare-fun b!424951 () Bool)

(declare-fun res!248693 () Bool)

(assert (=> b!424951 (=> (not res!248693) (not e!252346))))

(assert (=> b!424951 (= res!248693 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12771 _keys!709))))))

(declare-fun b!424952 () Bool)

(assert (=> b!424952 (= e!252349 e!252347)))

(declare-fun res!248694 () Bool)

(assert (=> b!424952 (=> (not res!248694) (not e!252347))))

(assert (=> b!424952 (= res!248694 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194494 () ListLongMap!6227)

(assert (=> b!424952 (= lt!194494 (getCurrentListMapNoExtraKeys!1333 lt!194495 lt!194496 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!424952 (= lt!194496 (array!25938 (store (arr!12418 _values!549) i!563 (ValueCellFull!5181 v!412)) (size!12770 _values!549)))))

(declare-fun lt!194498 () ListLongMap!6227)

(assert (=> b!424952 (= lt!194498 (getCurrentListMapNoExtraKeys!1333 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424953 () Bool)

(declare-fun res!248686 () Bool)

(assert (=> b!424953 (=> (not res!248686) (not e!252346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424953 (= res!248686 (validKeyInArray!0 k0!794))))

(declare-fun b!424948 () Bool)

(declare-fun res!248682 () Bool)

(assert (=> b!424948 (=> (not res!248682) (not e!252346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25939 (_ BitVec 32)) Bool)

(assert (=> b!424948 (= res!248682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!248691 () Bool)

(assert (=> start!39630 (=> (not res!248691) (not e!252346))))

(assert (=> start!39630 (= res!248691 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12771 _keys!709))))))

(assert (=> start!39630 e!252346))

(assert (=> start!39630 tp_is_empty!11049))

(assert (=> start!39630 tp!35220))

(assert (=> start!39630 true))

(declare-fun array_inv!9048 (array!25937) Bool)

(assert (=> start!39630 (and (array_inv!9048 _values!549) e!252350)))

(declare-fun array_inv!9049 (array!25939) Bool)

(assert (=> start!39630 (array_inv!9049 _keys!709)))

(declare-fun b!424954 () Bool)

(assert (=> b!424954 (= e!252346 e!252349)))

(declare-fun res!248687 () Bool)

(assert (=> b!424954 (=> (not res!248687) (not e!252349))))

(assert (=> b!424954 (= res!248687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194495 mask!1025))))

(assert (=> b!424954 (= lt!194495 (array!25940 (store (arr!12419 _keys!709) i!563 k0!794) (size!12771 _keys!709)))))

(declare-fun mapIsEmpty!18195 () Bool)

(assert (=> mapIsEmpty!18195 mapRes!18195))

(declare-fun b!424955 () Bool)

(declare-fun res!248689 () Bool)

(assert (=> b!424955 (=> (not res!248689) (not e!252346))))

(declare-fun arrayContainsKey!0 (array!25939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424955 (= res!248689 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424956 () Bool)

(declare-fun res!248684 () Bool)

(assert (=> b!424956 (=> (not res!248684) (not e!252349))))

(assert (=> b!424956 (= res!248684 (bvsle from!863 i!563))))

(declare-fun b!424957 () Bool)

(assert (=> b!424957 (= e!252345 tp_is_empty!11049)))

(declare-fun b!424958 () Bool)

(declare-fun res!248683 () Bool)

(assert (=> b!424958 (=> (not res!248683) (not e!252346))))

(assert (=> b!424958 (= res!248683 (and (= (size!12770 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12771 _keys!709) (size!12770 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39630 res!248691) b!424944))

(assert (= (and b!424944 res!248692) b!424958))

(assert (= (and b!424958 res!248683) b!424948))

(assert (= (and b!424948 res!248682) b!424950))

(assert (= (and b!424950 res!248690) b!424951))

(assert (= (and b!424951 res!248693) b!424953))

(assert (= (and b!424953 res!248686) b!424947))

(assert (= (and b!424947 res!248688) b!424955))

(assert (= (and b!424955 res!248689) b!424954))

(assert (= (and b!424954 res!248687) b!424949))

(assert (= (and b!424949 res!248685) b!424956))

(assert (= (and b!424956 res!248684) b!424952))

(assert (= (and b!424952 res!248694) b!424946))

(assert (= (and b!424943 condMapEmpty!18195) mapIsEmpty!18195))

(assert (= (and b!424943 (not condMapEmpty!18195)) mapNonEmpty!18195))

(get-info :version)

(assert (= (and mapNonEmpty!18195 ((_ is ValueCellFull!5181) mapValue!18195)) b!424957))

(assert (= (and b!424943 ((_ is ValueCellFull!5181) mapDefault!18195)) b!424945))

(assert (= start!39630 b!424943))

(declare-fun m!413945 () Bool)

(assert (=> b!424955 m!413945))

(declare-fun m!413947 () Bool)

(assert (=> b!424949 m!413947))

(declare-fun m!413949 () Bool)

(assert (=> b!424952 m!413949))

(declare-fun m!413951 () Bool)

(assert (=> b!424952 m!413951))

(declare-fun m!413953 () Bool)

(assert (=> b!424952 m!413953))

(declare-fun m!413955 () Bool)

(assert (=> start!39630 m!413955))

(declare-fun m!413957 () Bool)

(assert (=> start!39630 m!413957))

(declare-fun m!413959 () Bool)

(assert (=> b!424948 m!413959))

(declare-fun m!413961 () Bool)

(assert (=> b!424950 m!413961))

(declare-fun m!413963 () Bool)

(assert (=> b!424946 m!413963))

(declare-fun m!413965 () Bool)

(assert (=> b!424946 m!413965))

(assert (=> b!424946 m!413965))

(declare-fun m!413967 () Bool)

(assert (=> b!424946 m!413967))

(declare-fun m!413969 () Bool)

(assert (=> b!424946 m!413969))

(declare-fun m!413971 () Bool)

(assert (=> b!424953 m!413971))

(declare-fun m!413973 () Bool)

(assert (=> b!424954 m!413973))

(declare-fun m!413975 () Bool)

(assert (=> b!424954 m!413975))

(declare-fun m!413977 () Bool)

(assert (=> b!424947 m!413977))

(declare-fun m!413979 () Bool)

(assert (=> b!424944 m!413979))

(declare-fun m!413981 () Bool)

(assert (=> mapNonEmpty!18195 m!413981))

(check-sat (not b!424948) (not start!39630) (not b!424954) (not b!424953) (not b_next!9897) (not b!424946) tp_is_empty!11049 b_and!17553 (not b!424949) (not mapNonEmpty!18195) (not b!424955) (not b!424952) (not b!424950) (not b!424944))
(check-sat b_and!17553 (not b_next!9897))
