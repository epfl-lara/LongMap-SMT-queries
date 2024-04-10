; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40900 () Bool)

(assert start!40900)

(declare-fun b_free!10835 () Bool)

(declare-fun b_next!10835 () Bool)

(assert (=> start!40900 (= b_free!10835 (not b_next!10835))))

(declare-fun tp!38332 () Bool)

(declare-fun b_and!18977 () Bool)

(assert (=> start!40900 (= tp!38332 b_and!18977)))

(declare-fun b!454412 () Bool)

(declare-fun res!270749 () Bool)

(declare-fun e!265871 () Bool)

(assert (=> b!454412 (=> (not res!270749) (not e!265871))))

(declare-datatypes ((array!28151 0))(
  ( (array!28152 (arr!13519 (Array (_ BitVec 32) (_ BitVec 64))) (size!13871 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28151)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28151 (_ BitVec 32)) Bool)

(assert (=> b!454412 (= res!270749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454413 () Bool)

(declare-fun res!270748 () Bool)

(assert (=> b!454413 (=> (not res!270748) (not e!265871))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454413 (= res!270748 (validKeyInArray!0 k!794))))

(declare-fun b!454414 () Bool)

(declare-fun res!270753 () Bool)

(assert (=> b!454414 (=> (not res!270753) (not e!265871))))

(declare-fun arrayContainsKey!0 (array!28151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454414 (= res!270753 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19900 () Bool)

(declare-fun mapRes!19900 () Bool)

(assert (=> mapIsEmpty!19900 mapRes!19900))

(declare-fun b!454415 () Bool)

(declare-fun res!270751 () Bool)

(declare-fun e!265870 () Bool)

(assert (=> b!454415 (=> (not res!270751) (not e!265870))))

(declare-fun lt!206131 () array!28151)

(declare-datatypes ((List!8137 0))(
  ( (Nil!8134) (Cons!8133 (h!8989 (_ BitVec 64)) (t!13965 List!8137)) )
))
(declare-fun arrayNoDuplicates!0 (array!28151 (_ BitVec 32) List!8137) Bool)

(assert (=> b!454415 (= res!270751 (arrayNoDuplicates!0 lt!206131 #b00000000000000000000000000000000 Nil!8134))))

(declare-fun b!454416 () Bool)

(declare-fun res!270747 () Bool)

(assert (=> b!454416 (=> (not res!270747) (not e!265871))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454416 (= res!270747 (or (= (select (arr!13519 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13519 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454417 () Bool)

(declare-fun res!270752 () Bool)

(assert (=> b!454417 (=> (not res!270752) (not e!265871))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17335 0))(
  ( (V!17336 (val!6131 Int)) )
))
(declare-datatypes ((ValueCell!5743 0))(
  ( (ValueCellFull!5743 (v!8397 V!17335)) (EmptyCell!5743) )
))
(declare-datatypes ((array!28153 0))(
  ( (array!28154 (arr!13520 (Array (_ BitVec 32) ValueCell!5743)) (size!13872 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28153)

(assert (=> b!454417 (= res!270752 (and (= (size!13872 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13871 _keys!709) (size!13872 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!270746 () Bool)

(assert (=> start!40900 (=> (not res!270746) (not e!265871))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40900 (= res!270746 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13871 _keys!709))))))

(assert (=> start!40900 e!265871))

(declare-fun tp_is_empty!12173 () Bool)

(assert (=> start!40900 tp_is_empty!12173))

(assert (=> start!40900 tp!38332))

(assert (=> start!40900 true))

(declare-fun e!265869 () Bool)

(declare-fun array_inv!9792 (array!28153) Bool)

(assert (=> start!40900 (and (array_inv!9792 _values!549) e!265869)))

(declare-fun array_inv!9793 (array!28151) Bool)

(assert (=> start!40900 (array_inv!9793 _keys!709)))

(declare-fun b!454418 () Bool)

(assert (=> b!454418 (= e!265871 e!265870)))

(declare-fun res!270744 () Bool)

(assert (=> b!454418 (=> (not res!270744) (not e!265870))))

(assert (=> b!454418 (= res!270744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206131 mask!1025))))

(assert (=> b!454418 (= lt!206131 (array!28152 (store (arr!13519 _keys!709) i!563 k!794) (size!13871 _keys!709)))))

(declare-fun b!454419 () Bool)

(declare-fun res!270750 () Bool)

(assert (=> b!454419 (=> (not res!270750) (not e!265871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454419 (= res!270750 (validMask!0 mask!1025))))

(declare-fun b!454420 () Bool)

(declare-fun res!270745 () Bool)

(assert (=> b!454420 (=> (not res!270745) (not e!265871))))

(assert (=> b!454420 (= res!270745 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8134))))

(declare-fun mapNonEmpty!19900 () Bool)

(declare-fun tp!38331 () Bool)

(declare-fun e!265868 () Bool)

(assert (=> mapNonEmpty!19900 (= mapRes!19900 (and tp!38331 e!265868))))

(declare-fun mapKey!19900 () (_ BitVec 32))

(declare-fun mapValue!19900 () ValueCell!5743)

(declare-fun mapRest!19900 () (Array (_ BitVec 32) ValueCell!5743))

(assert (=> mapNonEmpty!19900 (= (arr!13520 _values!549) (store mapRest!19900 mapKey!19900 mapValue!19900))))

(declare-fun b!454421 () Bool)

(declare-fun res!270754 () Bool)

(assert (=> b!454421 (=> (not res!270754) (not e!265871))))

(assert (=> b!454421 (= res!270754 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13871 _keys!709))))))

(declare-fun b!454422 () Bool)

(declare-fun res!270755 () Bool)

(assert (=> b!454422 (=> (not res!270755) (not e!265870))))

(assert (=> b!454422 (= res!270755 (bvsle from!863 i!563))))

(declare-fun b!454423 () Bool)

(declare-fun e!265873 () Bool)

(assert (=> b!454423 (= e!265873 tp_is_empty!12173)))

(declare-fun b!454424 () Bool)

(assert (=> b!454424 (= e!265870 false)))

(declare-fun minValue!515 () V!17335)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8076 0))(
  ( (tuple2!8077 (_1!4049 (_ BitVec 64)) (_2!4049 V!17335)) )
))
(declare-datatypes ((List!8138 0))(
  ( (Nil!8135) (Cons!8134 (h!8990 tuple2!8076) (t!13966 List!8138)) )
))
(declare-datatypes ((ListLongMap!6989 0))(
  ( (ListLongMap!6990 (toList!3510 List!8138)) )
))
(declare-fun lt!206132 () ListLongMap!6989)

(declare-fun v!412 () V!17335)

(declare-fun zeroValue!515 () V!17335)

(declare-fun getCurrentListMapNoExtraKeys!1693 (array!28151 array!28153 (_ BitVec 32) (_ BitVec 32) V!17335 V!17335 (_ BitVec 32) Int) ListLongMap!6989)

(assert (=> b!454424 (= lt!206132 (getCurrentListMapNoExtraKeys!1693 lt!206131 (array!28154 (store (arr!13520 _values!549) i!563 (ValueCellFull!5743 v!412)) (size!13872 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206130 () ListLongMap!6989)

(assert (=> b!454424 (= lt!206130 (getCurrentListMapNoExtraKeys!1693 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454425 () Bool)

(assert (=> b!454425 (= e!265869 (and e!265873 mapRes!19900))))

(declare-fun condMapEmpty!19900 () Bool)

(declare-fun mapDefault!19900 () ValueCell!5743)

