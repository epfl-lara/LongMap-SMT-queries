; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39532 () Bool)

(assert start!39532)

(declare-fun b_free!9799 () Bool)

(declare-fun b_next!9799 () Bool)

(assert (=> start!39532 (= b_free!9799 (not b_next!9799))))

(declare-fun tp!34926 () Bool)

(declare-fun b_and!17455 () Bool)

(assert (=> start!39532 (= tp!34926 b_and!17455)))

(declare-fun b!422724 () Bool)

(declare-fun res!246905 () Bool)

(declare-fun e!251452 () Bool)

(assert (=> b!422724 (=> (not res!246905) (not e!251452))))

(declare-datatypes ((array!25749 0))(
  ( (array!25750 (arr!12324 (Array (_ BitVec 32) (_ BitVec 64))) (size!12676 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25749)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15707 0))(
  ( (V!15708 (val!5520 Int)) )
))
(declare-datatypes ((ValueCell!5132 0))(
  ( (ValueCellFull!5132 (v!7767 V!15707)) (EmptyCell!5132) )
))
(declare-datatypes ((array!25751 0))(
  ( (array!25752 (arr!12325 (Array (_ BitVec 32) ValueCell!5132)) (size!12677 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25751)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!422724 (= res!246905 (and (= (size!12677 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12676 _keys!709) (size!12677 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422725 () Bool)

(declare-fun res!246913 () Bool)

(assert (=> b!422725 (=> (not res!246913) (not e!251452))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422725 (= res!246913 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12676 _keys!709))))))

(declare-fun b!422726 () Bool)

(declare-fun res!246910 () Bool)

(declare-fun e!251454 () Bool)

(assert (=> b!422726 (=> (not res!246910) (not e!251454))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!422726 (= res!246910 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18048 () Bool)

(declare-fun mapRes!18048 () Bool)

(assert (=> mapIsEmpty!18048 mapRes!18048))

(declare-fun b!422727 () Bool)

(declare-fun res!246909 () Bool)

(assert (=> b!422727 (=> (not res!246909) (not e!251452))))

(assert (=> b!422727 (= res!246909 (or (= (select (arr!12324 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12324 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422728 () Bool)

(declare-fun res!246912 () Bool)

(assert (=> b!422728 (=> (not res!246912) (not e!251452))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422728 (= res!246912 (validKeyInArray!0 k!794))))

(declare-fun b!422729 () Bool)

(declare-fun e!251451 () Bool)

(declare-fun tp_is_empty!10951 () Bool)

(assert (=> b!422729 (= e!251451 tp_is_empty!10951)))

(declare-fun res!246907 () Bool)

(assert (=> start!39532 (=> (not res!246907) (not e!251452))))

(assert (=> start!39532 (= res!246907 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12676 _keys!709))))))

(assert (=> start!39532 e!251452))

(assert (=> start!39532 tp_is_empty!10951))

(assert (=> start!39532 tp!34926))

(assert (=> start!39532 true))

(declare-fun e!251449 () Bool)

(declare-fun array_inv!8980 (array!25751) Bool)

(assert (=> start!39532 (and (array_inv!8980 _values!549) e!251449)))

(declare-fun array_inv!8981 (array!25749) Bool)

(assert (=> start!39532 (array_inv!8981 _keys!709)))

(declare-fun b!422730 () Bool)

(assert (=> b!422730 (= e!251452 e!251454)))

(declare-fun res!246906 () Bool)

(assert (=> b!422730 (=> (not res!246906) (not e!251454))))

(declare-fun lt!194025 () array!25749)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25749 (_ BitVec 32)) Bool)

(assert (=> b!422730 (= res!246906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194025 mask!1025))))

(assert (=> b!422730 (= lt!194025 (array!25750 (store (arr!12324 _keys!709) i!563 k!794) (size!12676 _keys!709)))))

(declare-fun b!422731 () Bool)

(declare-fun e!251450 () Bool)

(assert (=> b!422731 (= e!251450 tp_is_empty!10951)))

(declare-fun b!422732 () Bool)

(assert (=> b!422732 (= e!251454 false)))

(declare-fun minValue!515 () V!15707)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7250 0))(
  ( (tuple2!7251 (_1!3636 (_ BitVec 64)) (_2!3636 V!15707)) )
))
(declare-datatypes ((List!7257 0))(
  ( (Nil!7254) (Cons!7253 (h!8109 tuple2!7250) (t!12701 List!7257)) )
))
(declare-datatypes ((ListLongMap!6163 0))(
  ( (ListLongMap!6164 (toList!3097 List!7257)) )
))
(declare-fun lt!194027 () ListLongMap!6163)

(declare-fun v!412 () V!15707)

(declare-fun zeroValue!515 () V!15707)

(declare-fun getCurrentListMapNoExtraKeys!1301 (array!25749 array!25751 (_ BitVec 32) (_ BitVec 32) V!15707 V!15707 (_ BitVec 32) Int) ListLongMap!6163)

(assert (=> b!422732 (= lt!194027 (getCurrentListMapNoExtraKeys!1301 lt!194025 (array!25752 (store (arr!12325 _values!549) i!563 (ValueCellFull!5132 v!412)) (size!12677 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194026 () ListLongMap!6163)

(assert (=> b!422732 (= lt!194026 (getCurrentListMapNoExtraKeys!1301 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422733 () Bool)

(assert (=> b!422733 (= e!251449 (and e!251451 mapRes!18048))))

(declare-fun condMapEmpty!18048 () Bool)

(declare-fun mapDefault!18048 () ValueCell!5132)

