; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39678 () Bool)

(assert start!39678)

(declare-fun b_free!9945 () Bool)

(declare-fun b_next!9945 () Bool)

(assert (=> start!39678 (= b_free!9945 (not b_next!9945))))

(declare-fun tp!35363 () Bool)

(declare-fun b_and!17601 () Bool)

(assert (=> start!39678 (= tp!35363 b_and!17601)))

(declare-fun b!426095 () Bool)

(declare-fun res!249625 () Bool)

(declare-fun e!252855 () Bool)

(assert (=> b!426095 (=> (not res!249625) (not e!252855))))

(declare-datatypes ((array!26033 0))(
  ( (array!26034 (arr!12466 (Array (_ BitVec 32) (_ BitVec 64))) (size!12818 (_ BitVec 32))) )
))
(declare-fun lt!194854 () array!26033)

(declare-datatypes ((List!7360 0))(
  ( (Nil!7357) (Cons!7356 (h!8212 (_ BitVec 64)) (t!12804 List!7360)) )
))
(declare-fun arrayNoDuplicates!0 (array!26033 (_ BitVec 32) List!7360) Bool)

(assert (=> b!426095 (= res!249625 (arrayNoDuplicates!0 lt!194854 #b00000000000000000000000000000000 Nil!7357))))

(declare-fun b!426096 () Bool)

(declare-fun res!249629 () Bool)

(declare-fun e!252851 () Bool)

(assert (=> b!426096 (=> (not res!249629) (not e!252851))))

(declare-fun _keys!709 () array!26033)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15901 0))(
  ( (V!15902 (val!5593 Int)) )
))
(declare-datatypes ((ValueCell!5205 0))(
  ( (ValueCellFull!5205 (v!7840 V!15901)) (EmptyCell!5205) )
))
(declare-datatypes ((array!26035 0))(
  ( (array!26036 (arr!12467 (Array (_ BitVec 32) ValueCell!5205)) (size!12819 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26035)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!426096 (= res!249629 (and (= (size!12819 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12818 _keys!709) (size!12819 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426097 () Bool)

(declare-fun e!252853 () Bool)

(assert (=> b!426097 (= e!252853 (not true))))

(declare-fun minValue!515 () V!15901)

(declare-fun defaultEntry!557 () Int)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15901)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15901)

(declare-fun lt!194858 () array!26035)

(declare-datatypes ((tuple2!7346 0))(
  ( (tuple2!7347 (_1!3684 (_ BitVec 64)) (_2!3684 V!15901)) )
))
(declare-datatypes ((List!7361 0))(
  ( (Nil!7358) (Cons!7357 (h!8213 tuple2!7346) (t!12805 List!7361)) )
))
(declare-datatypes ((ListLongMap!6259 0))(
  ( (ListLongMap!6260 (toList!3145 List!7361)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1349 (array!26033 array!26035 (_ BitVec 32) (_ BitVec 32) V!15901 V!15901 (_ BitVec 32) Int) ListLongMap!6259)

(declare-fun +!1303 (ListLongMap!6259 tuple2!7346) ListLongMap!6259)

(assert (=> b!426097 (= (getCurrentListMapNoExtraKeys!1349 lt!194854 lt!194858 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1303 (getCurrentListMapNoExtraKeys!1349 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7347 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12508 0))(
  ( (Unit!12509) )
))
(declare-fun lt!194855 () Unit!12508)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!498 (array!26033 array!26035 (_ BitVec 32) (_ BitVec 32) V!15901 V!15901 (_ BitVec 32) (_ BitVec 64) V!15901 (_ BitVec 32) Int) Unit!12508)

(assert (=> b!426097 (= lt!194855 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!498 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426098 () Bool)

(declare-fun res!249623 () Bool)

(assert (=> b!426098 (=> (not res!249623) (not e!252851))))

(assert (=> b!426098 (= res!249623 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12818 _keys!709))))))

(declare-fun b!426099 () Bool)

(declare-fun res!249622 () Bool)

(assert (=> b!426099 (=> (not res!249622) (not e!252851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26033 (_ BitVec 32)) Bool)

(assert (=> b!426099 (= res!249622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426100 () Bool)

(declare-fun res!249620 () Bool)

(assert (=> b!426100 (=> (not res!249620) (not e!252855))))

(assert (=> b!426100 (= res!249620 (bvsle from!863 i!563))))

(declare-fun b!426101 () Bool)

(declare-fun res!249618 () Bool)

(assert (=> b!426101 (=> (not res!249618) (not e!252851))))

(assert (=> b!426101 (= res!249618 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7357))))

(declare-fun b!426102 () Bool)

(declare-fun e!252850 () Bool)

(declare-fun e!252854 () Bool)

(declare-fun mapRes!18267 () Bool)

(assert (=> b!426102 (= e!252850 (and e!252854 mapRes!18267))))

(declare-fun condMapEmpty!18267 () Bool)

(declare-fun mapDefault!18267 () ValueCell!5205)

(assert (=> b!426102 (= condMapEmpty!18267 (= (arr!12467 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5205)) mapDefault!18267)))))

(declare-fun b!426103 () Bool)

(declare-fun res!249628 () Bool)

(assert (=> b!426103 (=> (not res!249628) (not e!252851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426103 (= res!249628 (validMask!0 mask!1025))))

(declare-fun b!426104 () Bool)

(declare-fun res!249627 () Bool)

(assert (=> b!426104 (=> (not res!249627) (not e!252851))))

(declare-fun arrayContainsKey!0 (array!26033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426104 (= res!249627 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426105 () Bool)

(declare-fun e!252849 () Bool)

(declare-fun tp_is_empty!11097 () Bool)

(assert (=> b!426105 (= e!252849 tp_is_empty!11097)))

(declare-fun b!426106 () Bool)

(declare-fun res!249624 () Bool)

(assert (=> b!426106 (=> (not res!249624) (not e!252851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426106 (= res!249624 (validKeyInArray!0 k0!794))))

(declare-fun b!426107 () Bool)

(declare-fun res!249621 () Bool)

(assert (=> b!426107 (=> (not res!249621) (not e!252851))))

(assert (=> b!426107 (= res!249621 (or (= (select (arr!12466 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12466 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426108 () Bool)

(assert (=> b!426108 (= e!252851 e!252855)))

(declare-fun res!249619 () Bool)

(assert (=> b!426108 (=> (not res!249619) (not e!252855))))

(assert (=> b!426108 (= res!249619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194854 mask!1025))))

(assert (=> b!426108 (= lt!194854 (array!26034 (store (arr!12466 _keys!709) i!563 k0!794) (size!12818 _keys!709)))))

(declare-fun b!426109 () Bool)

(assert (=> b!426109 (= e!252854 tp_is_empty!11097)))

(declare-fun mapIsEmpty!18267 () Bool)

(assert (=> mapIsEmpty!18267 mapRes!18267))

(declare-fun res!249626 () Bool)

(assert (=> start!39678 (=> (not res!249626) (not e!252851))))

(assert (=> start!39678 (= res!249626 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12818 _keys!709))))))

(assert (=> start!39678 e!252851))

(assert (=> start!39678 tp_is_empty!11097))

(assert (=> start!39678 tp!35363))

(assert (=> start!39678 true))

(declare-fun array_inv!9084 (array!26035) Bool)

(assert (=> start!39678 (and (array_inv!9084 _values!549) e!252850)))

(declare-fun array_inv!9085 (array!26033) Bool)

(assert (=> start!39678 (array_inv!9085 _keys!709)))

(declare-fun mapNonEmpty!18267 () Bool)

(declare-fun tp!35364 () Bool)

(assert (=> mapNonEmpty!18267 (= mapRes!18267 (and tp!35364 e!252849))))

(declare-fun mapRest!18267 () (Array (_ BitVec 32) ValueCell!5205))

(declare-fun mapValue!18267 () ValueCell!5205)

(declare-fun mapKey!18267 () (_ BitVec 32))

(assert (=> mapNonEmpty!18267 (= (arr!12467 _values!549) (store mapRest!18267 mapKey!18267 mapValue!18267))))

(declare-fun b!426110 () Bool)

(assert (=> b!426110 (= e!252855 e!252853)))

(declare-fun res!249630 () Bool)

(assert (=> b!426110 (=> (not res!249630) (not e!252853))))

(assert (=> b!426110 (= res!249630 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194857 () ListLongMap!6259)

(assert (=> b!426110 (= lt!194857 (getCurrentListMapNoExtraKeys!1349 lt!194854 lt!194858 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!426110 (= lt!194858 (array!26036 (store (arr!12467 _values!549) i!563 (ValueCellFull!5205 v!412)) (size!12819 _values!549)))))

(declare-fun lt!194856 () ListLongMap!6259)

(assert (=> b!426110 (= lt!194856 (getCurrentListMapNoExtraKeys!1349 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39678 res!249626) b!426103))

(assert (= (and b!426103 res!249628) b!426096))

(assert (= (and b!426096 res!249629) b!426099))

(assert (= (and b!426099 res!249622) b!426101))

(assert (= (and b!426101 res!249618) b!426098))

(assert (= (and b!426098 res!249623) b!426106))

(assert (= (and b!426106 res!249624) b!426107))

(assert (= (and b!426107 res!249621) b!426104))

(assert (= (and b!426104 res!249627) b!426108))

(assert (= (and b!426108 res!249619) b!426095))

(assert (= (and b!426095 res!249625) b!426100))

(assert (= (and b!426100 res!249620) b!426110))

(assert (= (and b!426110 res!249630) b!426097))

(assert (= (and b!426102 condMapEmpty!18267) mapIsEmpty!18267))

(assert (= (and b!426102 (not condMapEmpty!18267)) mapNonEmpty!18267))

(get-info :version)

(assert (= (and mapNonEmpty!18267 ((_ is ValueCellFull!5205) mapValue!18267)) b!426105))

(assert (= (and b!426102 ((_ is ValueCellFull!5205) mapDefault!18267)) b!426109))

(assert (= start!39678 b!426102))

(declare-fun m!414857 () Bool)

(assert (=> b!426097 m!414857))

(declare-fun m!414859 () Bool)

(assert (=> b!426097 m!414859))

(assert (=> b!426097 m!414859))

(declare-fun m!414861 () Bool)

(assert (=> b!426097 m!414861))

(declare-fun m!414863 () Bool)

(assert (=> b!426097 m!414863))

(declare-fun m!414865 () Bool)

(assert (=> b!426110 m!414865))

(declare-fun m!414867 () Bool)

(assert (=> b!426110 m!414867))

(declare-fun m!414869 () Bool)

(assert (=> b!426110 m!414869))

(declare-fun m!414871 () Bool)

(assert (=> b!426095 m!414871))

(declare-fun m!414873 () Bool)

(assert (=> start!39678 m!414873))

(declare-fun m!414875 () Bool)

(assert (=> start!39678 m!414875))

(declare-fun m!414877 () Bool)

(assert (=> b!426104 m!414877))

(declare-fun m!414879 () Bool)

(assert (=> b!426099 m!414879))

(declare-fun m!414881 () Bool)

(assert (=> b!426107 m!414881))

(declare-fun m!414883 () Bool)

(assert (=> b!426101 m!414883))

(declare-fun m!414885 () Bool)

(assert (=> b!426103 m!414885))

(declare-fun m!414887 () Bool)

(assert (=> b!426106 m!414887))

(declare-fun m!414889 () Bool)

(assert (=> mapNonEmpty!18267 m!414889))

(declare-fun m!414891 () Bool)

(assert (=> b!426108 m!414891))

(declare-fun m!414893 () Bool)

(assert (=> b!426108 m!414893))

(check-sat (not start!39678) (not mapNonEmpty!18267) b_and!17601 (not b!426104) (not b!426095) (not b!426103) (not b!426097) (not b!426106) (not b_next!9945) (not b!426110) (not b!426099) (not b!426101) tp_is_empty!11097 (not b!426108))
(check-sat b_and!17601 (not b_next!9945))
