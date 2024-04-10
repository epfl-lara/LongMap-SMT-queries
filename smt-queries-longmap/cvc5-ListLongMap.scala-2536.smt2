; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39034 () Bool)

(assert start!39034)

(declare-fun b_free!9301 () Bool)

(declare-fun b_next!9301 () Bool)

(assert (=> start!39034 (= b_free!9301 (not b_next!9301))))

(declare-fun tp!33431 () Bool)

(declare-fun b_and!16687 () Bool)

(assert (=> start!39034 (= tp!33431 b_and!16687)))

(declare-fun b!409377 () Bool)

(declare-fun res!237042 () Bool)

(declare-fun e!245582 () Bool)

(assert (=> b!409377 (=> (not res!237042) (not e!245582))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24779 0))(
  ( (array!24780 (arr!11839 (Array (_ BitVec 32) (_ BitVec 64))) (size!12191 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24779)

(assert (=> b!409377 (= res!237042 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12191 _keys!709))))))

(declare-fun b!409378 () Bool)

(declare-fun res!237040 () Bool)

(declare-fun e!245581 () Bool)

(assert (=> b!409378 (=> (not res!237040) (not e!245581))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!409378 (= res!237040 (bvsle from!863 i!563))))

(declare-fun b!409379 () Bool)

(declare-fun res!237044 () Bool)

(assert (=> b!409379 (=> (not res!237044) (not e!245582))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409379 (= res!237044 (validKeyInArray!0 k!794))))

(declare-fun b!409380 () Bool)

(declare-fun res!237041 () Bool)

(assert (=> b!409380 (=> (not res!237041) (not e!245582))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409380 (= res!237041 (validMask!0 mask!1025))))

(declare-fun b!409381 () Bool)

(declare-fun res!237043 () Bool)

(assert (=> b!409381 (=> (not res!237043) (not e!245582))))

(declare-fun arrayContainsKey!0 (array!24779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409381 (= res!237043 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!409382 () Bool)

(declare-fun e!245583 () Bool)

(declare-fun tp_is_empty!10453 () Bool)

(assert (=> b!409382 (= e!245583 tp_is_empty!10453)))

(declare-fun mapNonEmpty!17301 () Bool)

(declare-fun mapRes!17301 () Bool)

(declare-fun tp!33432 () Bool)

(assert (=> mapNonEmpty!17301 (= mapRes!17301 (and tp!33432 e!245583))))

(declare-fun mapKey!17301 () (_ BitVec 32))

(declare-datatypes ((V!15043 0))(
  ( (V!15044 (val!5271 Int)) )
))
(declare-datatypes ((ValueCell!4883 0))(
  ( (ValueCellFull!4883 (v!7518 V!15043)) (EmptyCell!4883) )
))
(declare-datatypes ((array!24781 0))(
  ( (array!24782 (arr!11840 (Array (_ BitVec 32) ValueCell!4883)) (size!12192 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24781)

(declare-fun mapValue!17301 () ValueCell!4883)

(declare-fun mapRest!17301 () (Array (_ BitVec 32) ValueCell!4883))

(assert (=> mapNonEmpty!17301 (= (arr!11840 _values!549) (store mapRest!17301 mapKey!17301 mapValue!17301))))

(declare-fun b!409383 () Bool)

(declare-fun res!237047 () Bool)

(assert (=> b!409383 (=> (not res!237047) (not e!245582))))

(declare-datatypes ((List!6855 0))(
  ( (Nil!6852) (Cons!6851 (h!7707 (_ BitVec 64)) (t!12029 List!6855)) )
))
(declare-fun arrayNoDuplicates!0 (array!24779 (_ BitVec 32) List!6855) Bool)

(assert (=> b!409383 (= res!237047 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6852))))

(declare-fun b!409384 () Bool)

(declare-fun res!237049 () Bool)

(assert (=> b!409384 (=> (not res!237049) (not e!245582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24779 (_ BitVec 32)) Bool)

(assert (=> b!409384 (= res!237049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409386 () Bool)

(assert (=> b!409386 (= e!245581 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15043)

(declare-fun minValue!515 () V!15043)

(declare-datatypes ((tuple2!6832 0))(
  ( (tuple2!6833 (_1!3427 (_ BitVec 64)) (_2!3427 V!15043)) )
))
(declare-datatypes ((List!6856 0))(
  ( (Nil!6853) (Cons!6852 (h!7708 tuple2!6832) (t!12030 List!6856)) )
))
(declare-datatypes ((ListLongMap!5745 0))(
  ( (ListLongMap!5746 (toList!2888 List!6856)) )
))
(declare-fun lt!188939 () ListLongMap!5745)

(declare-fun getCurrentListMapNoExtraKeys!1096 (array!24779 array!24781 (_ BitVec 32) (_ BitVec 32) V!15043 V!15043 (_ BitVec 32) Int) ListLongMap!5745)

(assert (=> b!409386 (= lt!188939 (getCurrentListMapNoExtraKeys!1096 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409387 () Bool)

(declare-fun res!237051 () Bool)

(assert (=> b!409387 (=> (not res!237051) (not e!245582))))

(assert (=> b!409387 (= res!237051 (or (= (select (arr!11839 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11839 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17301 () Bool)

(assert (=> mapIsEmpty!17301 mapRes!17301))

(declare-fun b!409388 () Bool)

(declare-fun e!245585 () Bool)

(assert (=> b!409388 (= e!245585 tp_is_empty!10453)))

(declare-fun b!409389 () Bool)

(declare-fun res!237046 () Bool)

(assert (=> b!409389 (=> (not res!237046) (not e!245582))))

(assert (=> b!409389 (= res!237046 (and (= (size!12192 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12191 _keys!709) (size!12192 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409390 () Bool)

(declare-fun e!245586 () Bool)

(assert (=> b!409390 (= e!245586 (and e!245585 mapRes!17301))))

(declare-fun condMapEmpty!17301 () Bool)

(declare-fun mapDefault!17301 () ValueCell!4883)

