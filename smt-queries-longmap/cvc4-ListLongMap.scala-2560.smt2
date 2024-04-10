; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39182 () Bool)

(assert start!39182)

(declare-fun b_free!9449 () Bool)

(declare-fun b_next!9449 () Bool)

(assert (=> start!39182 (= b_free!9449 (not b_next!9449))))

(declare-fun tp!33876 () Bool)

(declare-fun b_and!16835 () Bool)

(assert (=> start!39182 (= tp!33876 b_and!16835)))

(declare-fun mapNonEmpty!17523 () Bool)

(declare-fun mapRes!17523 () Bool)

(declare-fun tp!33875 () Bool)

(declare-fun e!246916 () Bool)

(assert (=> mapNonEmpty!17523 (= mapRes!17523 (and tp!33875 e!246916))))

(declare-datatypes ((V!15239 0))(
  ( (V!15240 (val!5345 Int)) )
))
(declare-datatypes ((ValueCell!4957 0))(
  ( (ValueCellFull!4957 (v!7592 V!15239)) (EmptyCell!4957) )
))
(declare-fun mapValue!17523 () ValueCell!4957)

(declare-datatypes ((array!25063 0))(
  ( (array!25064 (arr!11981 (Array (_ BitVec 32) ValueCell!4957)) (size!12333 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25063)

(declare-fun mapRest!17523 () (Array (_ BitVec 32) ValueCell!4957))

(declare-fun mapKey!17523 () (_ BitVec 32))

(assert (=> mapNonEmpty!17523 (= (arr!11981 _values!549) (store mapRest!17523 mapKey!17523 mapValue!17523))))

(declare-fun b!412707 () Bool)

(declare-fun res!239707 () Bool)

(declare-fun e!246913 () Bool)

(assert (=> b!412707 (=> (not res!239707) (not e!246913))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412707 (= res!239707 (validMask!0 mask!1025))))

(declare-fun b!412708 () Bool)

(declare-fun e!246915 () Bool)

(assert (=> b!412708 (= e!246913 e!246915)))

(declare-fun res!239713 () Bool)

(assert (=> b!412708 (=> (not res!239713) (not e!246915))))

(declare-datatypes ((array!25065 0))(
  ( (array!25066 (arr!11982 (Array (_ BitVec 32) (_ BitVec 64))) (size!12334 (_ BitVec 32))) )
))
(declare-fun lt!189536 () array!25065)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25065 (_ BitVec 32)) Bool)

(assert (=> b!412708 (= res!239713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189536 mask!1025))))

(declare-fun _keys!709 () array!25065)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412708 (= lt!189536 (array!25066 (store (arr!11982 _keys!709) i!563 k!794) (size!12334 _keys!709)))))

(declare-fun b!412709 () Bool)

(declare-fun res!239714 () Bool)

(assert (=> b!412709 (=> (not res!239714) (not e!246915))))

(declare-datatypes ((List!6965 0))(
  ( (Nil!6962) (Cons!6961 (h!7817 (_ BitVec 64)) (t!12139 List!6965)) )
))
(declare-fun arrayNoDuplicates!0 (array!25065 (_ BitVec 32) List!6965) Bool)

(assert (=> b!412709 (= res!239714 (arrayNoDuplicates!0 lt!189536 #b00000000000000000000000000000000 Nil!6962))))

(declare-fun b!412710 () Bool)

(declare-fun res!239708 () Bool)

(assert (=> b!412710 (=> (not res!239708) (not e!246913))))

(declare-fun arrayContainsKey!0 (array!25065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412710 (= res!239708 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!412711 () Bool)

(declare-fun tp_is_empty!10601 () Bool)

(assert (=> b!412711 (= e!246916 tp_is_empty!10601)))

(declare-fun b!412712 () Bool)

(declare-fun res!239712 () Bool)

(assert (=> b!412712 (=> (not res!239712) (not e!246913))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!412712 (= res!239712 (and (= (size!12333 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12334 _keys!709) (size!12333 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412713 () Bool)

(declare-fun res!239711 () Bool)

(assert (=> b!412713 (=> (not res!239711) (not e!246913))))

(assert (=> b!412713 (= res!239711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412714 () Bool)

(declare-fun res!239705 () Bool)

(assert (=> b!412714 (=> (not res!239705) (not e!246913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412714 (= res!239705 (validKeyInArray!0 k!794))))

(declare-fun res!239709 () Bool)

(assert (=> start!39182 (=> (not res!239709) (not e!246913))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39182 (= res!239709 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12334 _keys!709))))))

(assert (=> start!39182 e!246913))

(assert (=> start!39182 tp_is_empty!10601))

(assert (=> start!39182 tp!33876))

(assert (=> start!39182 true))

(declare-fun e!246917 () Bool)

(declare-fun array_inv!8736 (array!25063) Bool)

(assert (=> start!39182 (and (array_inv!8736 _values!549) e!246917)))

(declare-fun array_inv!8737 (array!25065) Bool)

(assert (=> start!39182 (array_inv!8737 _keys!709)))

(declare-fun b!412715 () Bool)

(declare-fun res!239704 () Bool)

(assert (=> b!412715 (=> (not res!239704) (not e!246913))))

(assert (=> b!412715 (= res!239704 (or (= (select (arr!11982 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11982 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412716 () Bool)

(assert (=> b!412716 (= e!246915 false)))

(declare-fun minValue!515 () V!15239)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15239)

(declare-datatypes ((tuple2!6938 0))(
  ( (tuple2!6939 (_1!3480 (_ BitVec 64)) (_2!3480 V!15239)) )
))
(declare-datatypes ((List!6966 0))(
  ( (Nil!6963) (Cons!6962 (h!7818 tuple2!6938) (t!12140 List!6966)) )
))
(declare-datatypes ((ListLongMap!5851 0))(
  ( (ListLongMap!5852 (toList!2941 List!6966)) )
))
(declare-fun lt!189535 () ListLongMap!5851)

(declare-fun v!412 () V!15239)

(declare-fun getCurrentListMapNoExtraKeys!1149 (array!25065 array!25063 (_ BitVec 32) (_ BitVec 32) V!15239 V!15239 (_ BitVec 32) Int) ListLongMap!5851)

(assert (=> b!412716 (= lt!189535 (getCurrentListMapNoExtraKeys!1149 lt!189536 (array!25064 (store (arr!11981 _values!549) i!563 (ValueCellFull!4957 v!412)) (size!12333 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189534 () ListLongMap!5851)

(assert (=> b!412716 (= lt!189534 (getCurrentListMapNoExtraKeys!1149 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412717 () Bool)

(declare-fun res!239706 () Bool)

(assert (=> b!412717 (=> (not res!239706) (not e!246913))))

(assert (=> b!412717 (= res!239706 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12334 _keys!709))))))

(declare-fun b!412718 () Bool)

(declare-fun e!246918 () Bool)

(assert (=> b!412718 (= e!246918 tp_is_empty!10601)))

(declare-fun b!412719 () Bool)

(declare-fun res!239710 () Bool)

(assert (=> b!412719 (=> (not res!239710) (not e!246915))))

(assert (=> b!412719 (= res!239710 (bvsle from!863 i!563))))

(declare-fun b!412720 () Bool)

(declare-fun res!239715 () Bool)

(assert (=> b!412720 (=> (not res!239715) (not e!246913))))

(assert (=> b!412720 (= res!239715 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6962))))

(declare-fun b!412721 () Bool)

(assert (=> b!412721 (= e!246917 (and e!246918 mapRes!17523))))

(declare-fun condMapEmpty!17523 () Bool)

(declare-fun mapDefault!17523 () ValueCell!4957)

