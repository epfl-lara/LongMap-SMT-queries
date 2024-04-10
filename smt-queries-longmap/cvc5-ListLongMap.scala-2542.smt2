; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39070 () Bool)

(assert start!39070)

(declare-fun b_free!9337 () Bool)

(declare-fun b_next!9337 () Bool)

(assert (=> start!39070 (= b_free!9337 (not b_next!9337))))

(declare-fun tp!33539 () Bool)

(declare-fun b_and!16723 () Bool)

(assert (=> start!39070 (= tp!33539 b_and!16723)))

(declare-fun b!410187 () Bool)

(declare-fun res!237693 () Bool)

(declare-fun e!245905 () Bool)

(assert (=> b!410187 (=> (not res!237693) (not e!245905))))

(declare-datatypes ((array!24849 0))(
  ( (array!24850 (arr!11874 (Array (_ BitVec 32) (_ BitVec 64))) (size!12226 (_ BitVec 32))) )
))
(declare-fun lt!189047 () array!24849)

(declare-datatypes ((List!6882 0))(
  ( (Nil!6879) (Cons!6878 (h!7734 (_ BitVec 64)) (t!12056 List!6882)) )
))
(declare-fun arrayNoDuplicates!0 (array!24849 (_ BitVec 32) List!6882) Bool)

(assert (=> b!410187 (= res!237693 (arrayNoDuplicates!0 lt!189047 #b00000000000000000000000000000000 Nil!6879))))

(declare-fun res!237691 () Bool)

(declare-fun e!245910 () Bool)

(assert (=> start!39070 (=> (not res!237691) (not e!245910))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!24849)

(assert (=> start!39070 (= res!237691 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12226 _keys!709))))))

(assert (=> start!39070 e!245910))

(declare-fun tp_is_empty!10489 () Bool)

(assert (=> start!39070 tp_is_empty!10489))

(assert (=> start!39070 tp!33539))

(assert (=> start!39070 true))

(declare-datatypes ((V!15091 0))(
  ( (V!15092 (val!5289 Int)) )
))
(declare-datatypes ((ValueCell!4901 0))(
  ( (ValueCellFull!4901 (v!7536 V!15091)) (EmptyCell!4901) )
))
(declare-datatypes ((array!24851 0))(
  ( (array!24852 (arr!11875 (Array (_ BitVec 32) ValueCell!4901)) (size!12227 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24851)

(declare-fun e!245906 () Bool)

(declare-fun array_inv!8666 (array!24851) Bool)

(assert (=> start!39070 (and (array_inv!8666 _values!549) e!245906)))

(declare-fun array_inv!8667 (array!24849) Bool)

(assert (=> start!39070 (array_inv!8667 _keys!709)))

(declare-fun mapIsEmpty!17355 () Bool)

(declare-fun mapRes!17355 () Bool)

(assert (=> mapIsEmpty!17355 mapRes!17355))

(declare-fun b!410188 () Bool)

(declare-fun res!237694 () Bool)

(assert (=> b!410188 (=> (not res!237694) (not e!245910))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410188 (= res!237694 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12226 _keys!709))))))

(declare-fun b!410189 () Bool)

(declare-fun res!237690 () Bool)

(assert (=> b!410189 (=> (not res!237690) (not e!245910))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!410189 (= res!237690 (and (= (size!12227 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12226 _keys!709) (size!12227 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410190 () Bool)

(declare-fun res!237695 () Bool)

(assert (=> b!410190 (=> (not res!237695) (not e!245910))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410190 (= res!237695 (validKeyInArray!0 k!794))))

(declare-fun b!410191 () Bool)

(declare-fun e!245907 () Bool)

(assert (=> b!410191 (= e!245907 tp_is_empty!10489)))

(declare-fun b!410192 () Bool)

(declare-fun res!237698 () Bool)

(assert (=> b!410192 (=> (not res!237698) (not e!245905))))

(assert (=> b!410192 (= res!237698 (bvsle from!863 i!563))))

(declare-fun b!410193 () Bool)

(declare-fun res!237699 () Bool)

(assert (=> b!410193 (=> (not res!237699) (not e!245910))))

(assert (=> b!410193 (= res!237699 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6879))))

(declare-fun b!410194 () Bool)

(declare-fun res!237688 () Bool)

(assert (=> b!410194 (=> (not res!237688) (not e!245910))))

(declare-fun arrayContainsKey!0 (array!24849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410194 (= res!237688 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17355 () Bool)

(declare-fun tp!33540 () Bool)

(assert (=> mapNonEmpty!17355 (= mapRes!17355 (and tp!33540 e!245907))))

(declare-fun mapKey!17355 () (_ BitVec 32))

(declare-fun mapRest!17355 () (Array (_ BitVec 32) ValueCell!4901))

(declare-fun mapValue!17355 () ValueCell!4901)

(assert (=> mapNonEmpty!17355 (= (arr!11875 _values!549) (store mapRest!17355 mapKey!17355 mapValue!17355))))

(declare-fun b!410195 () Bool)

(declare-fun res!237689 () Bool)

(assert (=> b!410195 (=> (not res!237689) (not e!245910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24849 (_ BitVec 32)) Bool)

(assert (=> b!410195 (= res!237689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410196 () Bool)

(declare-fun e!245909 () Bool)

(assert (=> b!410196 (= e!245909 tp_is_empty!10489)))

(declare-fun b!410197 () Bool)

(assert (=> b!410197 (= e!245905 false)))

(declare-fun minValue!515 () V!15091)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15091)

(declare-datatypes ((tuple2!6858 0))(
  ( (tuple2!6859 (_1!3440 (_ BitVec 64)) (_2!3440 V!15091)) )
))
(declare-datatypes ((List!6883 0))(
  ( (Nil!6880) (Cons!6879 (h!7735 tuple2!6858) (t!12057 List!6883)) )
))
(declare-datatypes ((ListLongMap!5771 0))(
  ( (ListLongMap!5772 (toList!2901 List!6883)) )
))
(declare-fun lt!189046 () ListLongMap!5771)

(declare-fun getCurrentListMapNoExtraKeys!1109 (array!24849 array!24851 (_ BitVec 32) (_ BitVec 32) V!15091 V!15091 (_ BitVec 32) Int) ListLongMap!5771)

(assert (=> b!410197 (= lt!189046 (getCurrentListMapNoExtraKeys!1109 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410198 () Bool)

(declare-fun res!237697 () Bool)

(assert (=> b!410198 (=> (not res!237697) (not e!245910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410198 (= res!237697 (validMask!0 mask!1025))))

(declare-fun b!410199 () Bool)

(assert (=> b!410199 (= e!245910 e!245905)))

(declare-fun res!237692 () Bool)

(assert (=> b!410199 (=> (not res!237692) (not e!245905))))

(assert (=> b!410199 (= res!237692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189047 mask!1025))))

(assert (=> b!410199 (= lt!189047 (array!24850 (store (arr!11874 _keys!709) i!563 k!794) (size!12226 _keys!709)))))

(declare-fun b!410200 () Bool)

(assert (=> b!410200 (= e!245906 (and e!245909 mapRes!17355))))

(declare-fun condMapEmpty!17355 () Bool)

(declare-fun mapDefault!17355 () ValueCell!4901)

