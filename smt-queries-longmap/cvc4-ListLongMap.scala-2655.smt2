; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39752 () Bool)

(assert start!39752)

(declare-fun b_free!10019 () Bool)

(declare-fun b_next!10019 () Bool)

(assert (=> start!39752 (= b_free!10019 (not b_next!10019))))

(declare-fun tp!35586 () Bool)

(declare-fun b_and!17697 () Bool)

(assert (=> start!39752 (= tp!35586 b_and!17697)))

(declare-fun b!427937 () Bool)

(declare-fun e!253674 () Bool)

(assert (=> b!427937 (= e!253674 true)))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!15999 0))(
  ( (V!16000 (val!5630 Int)) )
))
(declare-datatypes ((ValueCell!5242 0))(
  ( (ValueCellFull!5242 (v!7877 V!15999)) (EmptyCell!5242) )
))
(declare-datatypes ((array!26179 0))(
  ( (array!26180 (arr!12539 (Array (_ BitVec 32) ValueCell!5242)) (size!12891 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26179)

(declare-datatypes ((tuple2!7404 0))(
  ( (tuple2!7405 (_1!3713 (_ BitVec 64)) (_2!3713 V!15999)) )
))
(declare-datatypes ((List!7418 0))(
  ( (Nil!7415) (Cons!7414 (h!8270 tuple2!7404) (t!12886 List!7418)) )
))
(declare-datatypes ((ListLongMap!6317 0))(
  ( (ListLongMap!6318 (toList!3174 List!7418)) )
))
(declare-fun lt!195519 () ListLongMap!6317)

(declare-datatypes ((array!26181 0))(
  ( (array!26182 (arr!12540 (Array (_ BitVec 32) (_ BitVec 64))) (size!12892 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26181)

(declare-fun lt!195517 () ListLongMap!6317)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun +!1329 (ListLongMap!6317 tuple2!7404) ListLongMap!6317)

(declare-fun get!6210 (ValueCell!5242 V!15999) V!15999)

(declare-fun dynLambda!757 (Int (_ BitVec 64)) V!15999)

(assert (=> b!427937 (= lt!195519 (+!1329 lt!195517 (tuple2!7405 (select (arr!12540 _keys!709) from!863) (get!6210 (select (arr!12539 _values!549) from!863) (dynLambda!757 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427939 () Bool)

(declare-fun e!253677 () Bool)

(declare-fun e!253675 () Bool)

(assert (=> b!427939 (= e!253677 e!253675)))

(declare-fun res!251110 () Bool)

(assert (=> b!427939 (=> (not res!251110) (not e!253675))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427939 (= res!251110 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195516 () array!26181)

(declare-fun minValue!515 () V!15999)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!195515 () array!26179)

(declare-fun zeroValue!515 () V!15999)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1376 (array!26181 array!26179 (_ BitVec 32) (_ BitVec 32) V!15999 V!15999 (_ BitVec 32) Int) ListLongMap!6317)

(assert (=> b!427939 (= lt!195519 (getCurrentListMapNoExtraKeys!1376 lt!195516 lt!195515 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15999)

(assert (=> b!427939 (= lt!195515 (array!26180 (store (arr!12539 _values!549) i!563 (ValueCellFull!5242 v!412)) (size!12891 _values!549)))))

(declare-fun lt!195514 () ListLongMap!6317)

(assert (=> b!427939 (= lt!195514 (getCurrentListMapNoExtraKeys!1376 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427940 () Bool)

(declare-fun e!253672 () Bool)

(declare-fun tp_is_empty!11171 () Bool)

(assert (=> b!427940 (= e!253672 tp_is_empty!11171)))

(declare-fun b!427941 () Bool)

(declare-fun res!251109 () Bool)

(declare-fun e!253671 () Bool)

(assert (=> b!427941 (=> (not res!251109) (not e!253671))))

(declare-datatypes ((List!7419 0))(
  ( (Nil!7416) (Cons!7415 (h!8271 (_ BitVec 64)) (t!12887 List!7419)) )
))
(declare-fun arrayNoDuplicates!0 (array!26181 (_ BitVec 32) List!7419) Bool)

(assert (=> b!427941 (= res!251109 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7416))))

(declare-fun b!427942 () Bool)

(declare-fun res!251112 () Bool)

(assert (=> b!427942 (=> (not res!251112) (not e!253671))))

(assert (=> b!427942 (= res!251112 (or (= (select (arr!12540 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12540 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427943 () Bool)

(assert (=> b!427943 (= e!253671 e!253677)))

(declare-fun res!251117 () Bool)

(assert (=> b!427943 (=> (not res!251117) (not e!253677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26181 (_ BitVec 32)) Bool)

(assert (=> b!427943 (= res!251117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195516 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!427943 (= lt!195516 (array!26182 (store (arr!12540 _keys!709) i!563 k!794) (size!12892 _keys!709)))))

(declare-fun mapNonEmpty!18378 () Bool)

(declare-fun mapRes!18378 () Bool)

(declare-fun tp!35585 () Bool)

(assert (=> mapNonEmpty!18378 (= mapRes!18378 (and tp!35585 e!253672))))

(declare-fun mapRest!18378 () (Array (_ BitVec 32) ValueCell!5242))

(declare-fun mapKey!18378 () (_ BitVec 32))

(declare-fun mapValue!18378 () ValueCell!5242)

(assert (=> mapNonEmpty!18378 (= (arr!12539 _values!549) (store mapRest!18378 mapKey!18378 mapValue!18378))))

(declare-fun b!427944 () Bool)

(declare-fun e!253670 () Bool)

(assert (=> b!427944 (= e!253670 tp_is_empty!11171)))

(declare-fun mapIsEmpty!18378 () Bool)

(assert (=> mapIsEmpty!18378 mapRes!18378))

(declare-fun b!427945 () Bool)

(declare-fun res!251107 () Bool)

(assert (=> b!427945 (=> (not res!251107) (not e!253671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427945 (= res!251107 (validKeyInArray!0 k!794))))

(declare-fun b!427938 () Bool)

(declare-fun res!251105 () Bool)

(assert (=> b!427938 (=> (not res!251105) (not e!253671))))

(assert (=> b!427938 (= res!251105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!251108 () Bool)

(assert (=> start!39752 (=> (not res!251108) (not e!253671))))

(assert (=> start!39752 (= res!251108 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12892 _keys!709))))))

(assert (=> start!39752 e!253671))

(assert (=> start!39752 tp_is_empty!11171))

(assert (=> start!39752 tp!35586))

(assert (=> start!39752 true))

(declare-fun e!253673 () Bool)

(declare-fun array_inv!9140 (array!26179) Bool)

(assert (=> start!39752 (and (array_inv!9140 _values!549) e!253673)))

(declare-fun array_inv!9141 (array!26181) Bool)

(assert (=> start!39752 (array_inv!9141 _keys!709)))

(declare-fun b!427946 () Bool)

(declare-fun res!251111 () Bool)

(assert (=> b!427946 (=> (not res!251111) (not e!253677))))

(assert (=> b!427946 (= res!251111 (bvsle from!863 i!563))))

(declare-fun b!427947 () Bool)

(declare-fun res!251115 () Bool)

(assert (=> b!427947 (=> (not res!251115) (not e!253671))))

(declare-fun arrayContainsKey!0 (array!26181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427947 (= res!251115 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!427948 () Bool)

(declare-fun res!251118 () Bool)

(assert (=> b!427948 (=> (not res!251118) (not e!253671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427948 (= res!251118 (validMask!0 mask!1025))))

(declare-fun b!427949 () Bool)

(declare-fun res!251116 () Bool)

(assert (=> b!427949 (=> (not res!251116) (not e!253671))))

(assert (=> b!427949 (= res!251116 (and (= (size!12891 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12892 _keys!709) (size!12891 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427950 () Bool)

(declare-fun res!251113 () Bool)

(assert (=> b!427950 (=> (not res!251113) (not e!253671))))

(assert (=> b!427950 (= res!251113 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12892 _keys!709))))))

(declare-fun b!427951 () Bool)

(declare-fun res!251106 () Bool)

(assert (=> b!427951 (=> (not res!251106) (not e!253677))))

(assert (=> b!427951 (= res!251106 (arrayNoDuplicates!0 lt!195516 #b00000000000000000000000000000000 Nil!7416))))

(declare-fun b!427952 () Bool)

(assert (=> b!427952 (= e!253675 (not e!253674))))

(declare-fun res!251114 () Bool)

(assert (=> b!427952 (=> res!251114 e!253674)))

(assert (=> b!427952 (= res!251114 (not (validKeyInArray!0 (select (arr!12540 _keys!709) from!863))))))

(declare-fun lt!195520 () ListLongMap!6317)

(assert (=> b!427952 (= lt!195520 lt!195517)))

(declare-fun lt!195518 () ListLongMap!6317)

(assert (=> b!427952 (= lt!195517 (+!1329 lt!195518 (tuple2!7405 k!794 v!412)))))

(assert (=> b!427952 (= lt!195520 (getCurrentListMapNoExtraKeys!1376 lt!195516 lt!195515 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427952 (= lt!195518 (getCurrentListMapNoExtraKeys!1376 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12554 0))(
  ( (Unit!12555) )
))
(declare-fun lt!195521 () Unit!12554)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!521 (array!26181 array!26179 (_ BitVec 32) (_ BitVec 32) V!15999 V!15999 (_ BitVec 32) (_ BitVec 64) V!15999 (_ BitVec 32) Int) Unit!12554)

(assert (=> b!427952 (= lt!195521 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!521 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427953 () Bool)

(assert (=> b!427953 (= e!253673 (and e!253670 mapRes!18378))))

(declare-fun condMapEmpty!18378 () Bool)

(declare-fun mapDefault!18378 () ValueCell!5242)

