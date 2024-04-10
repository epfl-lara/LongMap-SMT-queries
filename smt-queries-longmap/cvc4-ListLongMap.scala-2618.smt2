; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39530 () Bool)

(assert start!39530)

(declare-fun b_free!9797 () Bool)

(declare-fun b_next!9797 () Bool)

(assert (=> start!39530 (= b_free!9797 (not b_next!9797))))

(declare-fun tp!34920 () Bool)

(declare-fun b_and!17453 () Bool)

(assert (=> start!39530 (= tp!34920 b_and!17453)))

(declare-fun b!422679 () Bool)

(declare-fun e!251431 () Bool)

(declare-fun tp_is_empty!10949 () Bool)

(assert (=> b!422679 (= e!251431 tp_is_empty!10949)))

(declare-fun b!422680 () Bool)

(declare-fun res!246875 () Bool)

(declare-fun e!251435 () Bool)

(assert (=> b!422680 (=> (not res!246875) (not e!251435))))

(declare-datatypes ((array!25745 0))(
  ( (array!25746 (arr!12322 (Array (_ BitVec 32) (_ BitVec 64))) (size!12674 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25745)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15703 0))(
  ( (V!15704 (val!5519 Int)) )
))
(declare-datatypes ((ValueCell!5131 0))(
  ( (ValueCellFull!5131 (v!7766 V!15703)) (EmptyCell!5131) )
))
(declare-datatypes ((array!25747 0))(
  ( (array!25748 (arr!12323 (Array (_ BitVec 32) ValueCell!5131)) (size!12675 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25747)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!422680 (= res!246875 (and (= (size!12675 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12674 _keys!709) (size!12675 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422681 () Bool)

(declare-fun res!246879 () Bool)

(assert (=> b!422681 (=> (not res!246879) (not e!251435))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422681 (= res!246879 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12674 _keys!709))))))

(declare-fun b!422682 () Bool)

(declare-fun res!246877 () Bool)

(assert (=> b!422682 (=> (not res!246877) (not e!251435))))

(declare-datatypes ((List!7256 0))(
  ( (Nil!7253) (Cons!7252 (h!8108 (_ BitVec 64)) (t!12700 List!7256)) )
))
(declare-fun arrayNoDuplicates!0 (array!25745 (_ BitVec 32) List!7256) Bool)

(assert (=> b!422682 (= res!246877 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7253))))

(declare-fun b!422683 () Bool)

(declare-fun e!251436 () Bool)

(assert (=> b!422683 (= e!251436 tp_is_empty!10949)))

(declare-fun b!422684 () Bool)

(declare-fun res!246870 () Bool)

(declare-fun e!251433 () Bool)

(assert (=> b!422684 (=> (not res!246870) (not e!251433))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!422684 (= res!246870 (bvsle from!863 i!563))))

(declare-fun b!422685 () Bool)

(assert (=> b!422685 (= e!251435 e!251433)))

(declare-fun res!246868 () Bool)

(assert (=> b!422685 (=> (not res!246868) (not e!251433))))

(declare-fun lt!194018 () array!25745)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25745 (_ BitVec 32)) Bool)

(assert (=> b!422685 (= res!246868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194018 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!422685 (= lt!194018 (array!25746 (store (arr!12322 _keys!709) i!563 k!794) (size!12674 _keys!709)))))

(declare-fun b!422686 () Bool)

(declare-fun res!246876 () Bool)

(assert (=> b!422686 (=> (not res!246876) (not e!251435))))

(assert (=> b!422686 (= res!246876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422687 () Bool)

(declare-fun res!246872 () Bool)

(assert (=> b!422687 (=> (not res!246872) (not e!251433))))

(assert (=> b!422687 (= res!246872 (arrayNoDuplicates!0 lt!194018 #b00000000000000000000000000000000 Nil!7253))))

(declare-fun mapNonEmpty!18045 () Bool)

(declare-fun mapRes!18045 () Bool)

(declare-fun tp!34919 () Bool)

(assert (=> mapNonEmpty!18045 (= mapRes!18045 (and tp!34919 e!251431))))

(declare-fun mapRest!18045 () (Array (_ BitVec 32) ValueCell!5131))

(declare-fun mapValue!18045 () ValueCell!5131)

(declare-fun mapKey!18045 () (_ BitVec 32))

(assert (=> mapNonEmpty!18045 (= (arr!12323 _values!549) (store mapRest!18045 mapKey!18045 mapValue!18045))))

(declare-fun res!246874 () Bool)

(assert (=> start!39530 (=> (not res!246874) (not e!251435))))

(assert (=> start!39530 (= res!246874 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12674 _keys!709))))))

(assert (=> start!39530 e!251435))

(assert (=> start!39530 tp_is_empty!10949))

(assert (=> start!39530 tp!34920))

(assert (=> start!39530 true))

(declare-fun e!251434 () Bool)

(declare-fun array_inv!8978 (array!25747) Bool)

(assert (=> start!39530 (and (array_inv!8978 _values!549) e!251434)))

(declare-fun array_inv!8979 (array!25745) Bool)

(assert (=> start!39530 (array_inv!8979 _keys!709)))

(declare-fun mapIsEmpty!18045 () Bool)

(assert (=> mapIsEmpty!18045 mapRes!18045))

(declare-fun b!422688 () Bool)

(declare-fun res!246871 () Bool)

(assert (=> b!422688 (=> (not res!246871) (not e!251435))))

(declare-fun arrayContainsKey!0 (array!25745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422688 (= res!246871 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!422689 () Bool)

(assert (=> b!422689 (= e!251434 (and e!251436 mapRes!18045))))

(declare-fun condMapEmpty!18045 () Bool)

(declare-fun mapDefault!18045 () ValueCell!5131)

