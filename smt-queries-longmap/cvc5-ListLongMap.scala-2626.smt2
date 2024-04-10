; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39574 () Bool)

(assert start!39574)

(declare-fun b_free!9841 () Bool)

(declare-fun b_next!9841 () Bool)

(assert (=> start!39574 (= b_free!9841 (not b_next!9841))))

(declare-fun tp!35051 () Bool)

(declare-fun b_and!17497 () Bool)

(assert (=> start!39574 (= tp!35051 b_and!17497)))

(declare-fun mapIsEmpty!18111 () Bool)

(declare-fun mapRes!18111 () Bool)

(assert (=> mapIsEmpty!18111 mapRes!18111))

(declare-fun b!423669 () Bool)

(declare-fun e!251831 () Bool)

(declare-fun tp_is_empty!10993 () Bool)

(assert (=> b!423669 (= e!251831 tp_is_empty!10993)))

(declare-fun res!247668 () Bool)

(declare-fun e!251832 () Bool)

(assert (=> start!39574 (=> (not res!247668) (not e!251832))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25829 0))(
  ( (array!25830 (arr!12364 (Array (_ BitVec 32) (_ BitVec 64))) (size!12716 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25829)

(assert (=> start!39574 (= res!247668 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12716 _keys!709))))))

(assert (=> start!39574 e!251832))

(assert (=> start!39574 tp_is_empty!10993))

(assert (=> start!39574 tp!35051))

(assert (=> start!39574 true))

(declare-datatypes ((V!15763 0))(
  ( (V!15764 (val!5541 Int)) )
))
(declare-datatypes ((ValueCell!5153 0))(
  ( (ValueCellFull!5153 (v!7788 V!15763)) (EmptyCell!5153) )
))
(declare-datatypes ((array!25831 0))(
  ( (array!25832 (arr!12365 (Array (_ BitVec 32) ValueCell!5153)) (size!12717 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25831)

(declare-fun e!251828 () Bool)

(declare-fun array_inv!9010 (array!25831) Bool)

(assert (=> start!39574 (and (array_inv!9010 _values!549) e!251828)))

(declare-fun array_inv!9011 (array!25829) Bool)

(assert (=> start!39574 (array_inv!9011 _keys!709)))

(declare-fun b!423670 () Bool)

(declare-fun res!247660 () Bool)

(declare-fun e!251830 () Bool)

(assert (=> b!423670 (=> (not res!247660) (not e!251830))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423670 (= res!247660 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18111 () Bool)

(declare-fun tp!35052 () Bool)

(assert (=> mapNonEmpty!18111 (= mapRes!18111 (and tp!35052 e!251831))))

(declare-fun mapKey!18111 () (_ BitVec 32))

(declare-fun mapRest!18111 () (Array (_ BitVec 32) ValueCell!5153))

(declare-fun mapValue!18111 () ValueCell!5153)

(assert (=> mapNonEmpty!18111 (= (arr!12365 _values!549) (store mapRest!18111 mapKey!18111 mapValue!18111))))

(declare-fun b!423671 () Bool)

(declare-fun res!247670 () Bool)

(assert (=> b!423671 (=> (not res!247670) (not e!251832))))

(assert (=> b!423671 (= res!247670 (or (= (select (arr!12364 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12364 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423672 () Bool)

(declare-fun res!247671 () Bool)

(assert (=> b!423672 (=> (not res!247671) (not e!251832))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25829 (_ BitVec 32)) Bool)

(assert (=> b!423672 (= res!247671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423673 () Bool)

(declare-fun e!251829 () Bool)

(assert (=> b!423673 (= e!251829 tp_is_empty!10993)))

(declare-fun b!423674 () Bool)

(declare-fun res!247666 () Bool)

(assert (=> b!423674 (=> (not res!247666) (not e!251832))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423674 (= res!247666 (validKeyInArray!0 k!794))))

(declare-fun b!423675 () Bool)

(assert (=> b!423675 (= e!251832 e!251830)))

(declare-fun res!247667 () Bool)

(assert (=> b!423675 (=> (not res!247667) (not e!251830))))

(declare-fun lt!194216 () array!25829)

(assert (=> b!423675 (= res!247667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194216 mask!1025))))

(assert (=> b!423675 (= lt!194216 (array!25830 (store (arr!12364 _keys!709) i!563 k!794) (size!12716 _keys!709)))))

(declare-fun b!423676 () Bool)

(declare-fun res!247661 () Bool)

(assert (=> b!423676 (=> (not res!247661) (not e!251832))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!423676 (= res!247661 (and (= (size!12717 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12716 _keys!709) (size!12717 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423677 () Bool)

(declare-fun res!247669 () Bool)

(assert (=> b!423677 (=> (not res!247669) (not e!251832))))

(assert (=> b!423677 (= res!247669 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12716 _keys!709))))))

(declare-fun b!423678 () Bool)

(declare-fun res!247662 () Bool)

(assert (=> b!423678 (=> (not res!247662) (not e!251832))))

(declare-fun arrayContainsKey!0 (array!25829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423678 (= res!247662 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!423679 () Bool)

(assert (=> b!423679 (= e!251830 false)))

(declare-datatypes ((tuple2!7278 0))(
  ( (tuple2!7279 (_1!3650 (_ BitVec 64)) (_2!3650 V!15763)) )
))
(declare-datatypes ((List!7286 0))(
  ( (Nil!7283) (Cons!7282 (h!8138 tuple2!7278) (t!12730 List!7286)) )
))
(declare-datatypes ((ListLongMap!6191 0))(
  ( (ListLongMap!6192 (toList!3111 List!7286)) )
))
(declare-fun lt!194215 () ListLongMap!6191)

(declare-fun minValue!515 () V!15763)

(declare-fun defaultEntry!557 () Int)

(declare-fun v!412 () V!15763)

(declare-fun zeroValue!515 () V!15763)

(declare-fun getCurrentListMapNoExtraKeys!1315 (array!25829 array!25831 (_ BitVec 32) (_ BitVec 32) V!15763 V!15763 (_ BitVec 32) Int) ListLongMap!6191)

(assert (=> b!423679 (= lt!194215 (getCurrentListMapNoExtraKeys!1315 lt!194216 (array!25832 (store (arr!12365 _values!549) i!563 (ValueCellFull!5153 v!412)) (size!12717 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194214 () ListLongMap!6191)

(assert (=> b!423679 (= lt!194214 (getCurrentListMapNoExtraKeys!1315 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423680 () Bool)

(declare-fun res!247664 () Bool)

(assert (=> b!423680 (=> (not res!247664) (not e!251832))))

(declare-datatypes ((List!7287 0))(
  ( (Nil!7284) (Cons!7283 (h!8139 (_ BitVec 64)) (t!12731 List!7287)) )
))
(declare-fun arrayNoDuplicates!0 (array!25829 (_ BitVec 32) List!7287) Bool)

(assert (=> b!423680 (= res!247664 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7284))))

(declare-fun b!423681 () Bool)

(assert (=> b!423681 (= e!251828 (and e!251829 mapRes!18111))))

(declare-fun condMapEmpty!18111 () Bool)

(declare-fun mapDefault!18111 () ValueCell!5153)

