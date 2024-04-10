; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39538 () Bool)

(assert start!39538)

(declare-fun b_free!9805 () Bool)

(declare-fun b_next!9805 () Bool)

(assert (=> start!39538 (= b_free!9805 (not b_next!9805))))

(declare-fun tp!34943 () Bool)

(declare-fun b_and!17461 () Bool)

(assert (=> start!39538 (= tp!34943 b_and!17461)))

(declare-fun b!422859 () Bool)

(declare-fun res!247020 () Bool)

(declare-fun e!251507 () Bool)

(assert (=> b!422859 (=> (not res!247020) (not e!251507))))

(declare-datatypes ((array!25761 0))(
  ( (array!25762 (arr!12330 (Array (_ BitVec 32) (_ BitVec 64))) (size!12682 (_ BitVec 32))) )
))
(declare-fun lt!194054 () array!25761)

(declare-datatypes ((List!7260 0))(
  ( (Nil!7257) (Cons!7256 (h!8112 (_ BitVec 64)) (t!12704 List!7260)) )
))
(declare-fun arrayNoDuplicates!0 (array!25761 (_ BitVec 32) List!7260) Bool)

(assert (=> b!422859 (= res!247020 (arrayNoDuplicates!0 lt!194054 #b00000000000000000000000000000000 Nil!7257))))

(declare-fun b!422860 () Bool)

(declare-fun e!251506 () Bool)

(declare-fun tp_is_empty!10957 () Bool)

(assert (=> b!422860 (= e!251506 tp_is_empty!10957)))

(declare-fun mapIsEmpty!18057 () Bool)

(declare-fun mapRes!18057 () Bool)

(assert (=> mapIsEmpty!18057 mapRes!18057))

(declare-fun b!422861 () Bool)

(declare-fun e!251508 () Bool)

(assert (=> b!422861 (= e!251508 tp_is_empty!10957)))

(declare-fun b!422862 () Bool)

(declare-fun res!247014 () Bool)

(declare-fun e!251505 () Bool)

(assert (=> b!422862 (=> (not res!247014) (not e!251505))))

(declare-fun _keys!709 () array!25761)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422862 (= res!247014 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!422863 () Bool)

(declare-fun res!247022 () Bool)

(assert (=> b!422863 (=> (not res!247022) (not e!251507))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422863 (= res!247022 (bvsle from!863 i!563))))

(declare-fun b!422864 () Bool)

(declare-fun res!247019 () Bool)

(assert (=> b!422864 (=> (not res!247019) (not e!251505))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422864 (= res!247019 (validMask!0 mask!1025))))

(declare-fun b!422865 () Bool)

(declare-fun res!247021 () Bool)

(assert (=> b!422865 (=> (not res!247021) (not e!251505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25761 (_ BitVec 32)) Bool)

(assert (=> b!422865 (= res!247021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!247017 () Bool)

(assert (=> start!39538 (=> (not res!247017) (not e!251505))))

(assert (=> start!39538 (= res!247017 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12682 _keys!709))))))

(assert (=> start!39538 e!251505))

(assert (=> start!39538 tp_is_empty!10957))

(assert (=> start!39538 tp!34943))

(assert (=> start!39538 true))

(declare-datatypes ((V!15715 0))(
  ( (V!15716 (val!5523 Int)) )
))
(declare-datatypes ((ValueCell!5135 0))(
  ( (ValueCellFull!5135 (v!7770 V!15715)) (EmptyCell!5135) )
))
(declare-datatypes ((array!25763 0))(
  ( (array!25764 (arr!12331 (Array (_ BitVec 32) ValueCell!5135)) (size!12683 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25763)

(declare-fun e!251503 () Bool)

(declare-fun array_inv!8984 (array!25763) Bool)

(assert (=> start!39538 (and (array_inv!8984 _values!549) e!251503)))

(declare-fun array_inv!8985 (array!25761) Bool)

(assert (=> start!39538 (array_inv!8985 _keys!709)))

(declare-fun b!422866 () Bool)

(assert (=> b!422866 (= e!251505 e!251507)))

(declare-fun res!247015 () Bool)

(assert (=> b!422866 (=> (not res!247015) (not e!251507))))

(assert (=> b!422866 (= res!247015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194054 mask!1025))))

(assert (=> b!422866 (= lt!194054 (array!25762 (store (arr!12330 _keys!709) i!563 k!794) (size!12682 _keys!709)))))

(declare-fun b!422867 () Bool)

(declare-fun res!247018 () Bool)

(assert (=> b!422867 (=> (not res!247018) (not e!251505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422867 (= res!247018 (validKeyInArray!0 k!794))))

(declare-fun b!422868 () Bool)

(assert (=> b!422868 (= e!251507 false)))

(declare-fun minValue!515 () V!15715)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15715)

(declare-datatypes ((tuple2!7254 0))(
  ( (tuple2!7255 (_1!3638 (_ BitVec 64)) (_2!3638 V!15715)) )
))
(declare-datatypes ((List!7261 0))(
  ( (Nil!7258) (Cons!7257 (h!8113 tuple2!7254) (t!12705 List!7261)) )
))
(declare-datatypes ((ListLongMap!6167 0))(
  ( (ListLongMap!6168 (toList!3099 List!7261)) )
))
(declare-fun lt!194052 () ListLongMap!6167)

(declare-fun v!412 () V!15715)

(declare-fun getCurrentListMapNoExtraKeys!1303 (array!25761 array!25763 (_ BitVec 32) (_ BitVec 32) V!15715 V!15715 (_ BitVec 32) Int) ListLongMap!6167)

(assert (=> b!422868 (= lt!194052 (getCurrentListMapNoExtraKeys!1303 lt!194054 (array!25764 (store (arr!12331 _values!549) i!563 (ValueCellFull!5135 v!412)) (size!12683 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194053 () ListLongMap!6167)

(assert (=> b!422868 (= lt!194053 (getCurrentListMapNoExtraKeys!1303 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422869 () Bool)

(declare-fun res!247012 () Bool)

(assert (=> b!422869 (=> (not res!247012) (not e!251505))))

(assert (=> b!422869 (= res!247012 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12682 _keys!709))))))

(declare-fun b!422870 () Bool)

(declare-fun res!247016 () Bool)

(assert (=> b!422870 (=> (not res!247016) (not e!251505))))

(assert (=> b!422870 (= res!247016 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7257))))

(declare-fun b!422871 () Bool)

(declare-fun res!247023 () Bool)

(assert (=> b!422871 (=> (not res!247023) (not e!251505))))

(assert (=> b!422871 (= res!247023 (or (= (select (arr!12330 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12330 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422872 () Bool)

(assert (=> b!422872 (= e!251503 (and e!251506 mapRes!18057))))

(declare-fun condMapEmpty!18057 () Bool)

(declare-fun mapDefault!18057 () ValueCell!5135)

