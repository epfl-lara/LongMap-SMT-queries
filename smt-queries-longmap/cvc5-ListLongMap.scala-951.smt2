; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20802 () Bool)

(assert start!20802)

(declare-fun b_free!5455 () Bool)

(declare-fun b_next!5455 () Bool)

(assert (=> start!20802 (= b_free!5455 (not b_next!5455))))

(declare-fun tp!19405 () Bool)

(declare-fun b_and!12201 () Bool)

(assert (=> start!20802 (= tp!19405 b_and!12201)))

(declare-fun b!208490 () Bool)

(declare-fun res!101437 () Bool)

(declare-fun e!135971 () Bool)

(assert (=> b!208490 (=> (not res!101437) (not e!135971))))

(declare-datatypes ((array!9837 0))(
  ( (array!9838 (arr!4669 (Array (_ BitVec 32) (_ BitVec 64))) (size!4994 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9837)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9837 (_ BitVec 32)) Bool)

(assert (=> b!208490 (= res!101437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208491 () Bool)

(declare-fun res!101434 () Bool)

(assert (=> b!208491 (=> (not res!101434) (not e!135971))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6737 0))(
  ( (V!6738 (val!2703 Int)) )
))
(declare-datatypes ((ValueCell!2315 0))(
  ( (ValueCellFull!2315 (v!4673 V!6737)) (EmptyCell!2315) )
))
(declare-datatypes ((array!9839 0))(
  ( (array!9840 (arr!4670 (Array (_ BitVec 32) ValueCell!2315)) (size!4995 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9839)

(assert (=> b!208491 (= res!101434 (and (= (size!4995 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4994 _keys!825) (size!4995 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208492 () Bool)

(declare-fun e!135974 () Bool)

(declare-fun tp_is_empty!5317 () Bool)

(assert (=> b!208492 (= e!135974 tp_is_empty!5317)))

(declare-fun b!208493 () Bool)

(declare-fun res!101435 () Bool)

(assert (=> b!208493 (=> (not res!101435) (not e!135971))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208493 (= res!101435 (validKeyInArray!0 k!843))))

(declare-fun mapIsEmpty!9044 () Bool)

(declare-fun mapRes!9044 () Bool)

(assert (=> mapIsEmpty!9044 mapRes!9044))

(declare-fun b!208494 () Bool)

(declare-fun res!101436 () Bool)

(assert (=> b!208494 (=> (not res!101436) (not e!135971))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208494 (= res!101436 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4994 _keys!825))))))

(declare-fun b!208495 () Bool)

(assert (=> b!208495 (= e!135971 false)))

(declare-datatypes ((tuple2!4096 0))(
  ( (tuple2!4097 (_1!2059 (_ BitVec 64)) (_2!2059 V!6737)) )
))
(declare-datatypes ((List!2992 0))(
  ( (Nil!2989) (Cons!2988 (h!3630 tuple2!4096) (t!7923 List!2992)) )
))
(declare-datatypes ((ListLongMap!3009 0))(
  ( (ListLongMap!3010 (toList!1520 List!2992)) )
))
(declare-fun lt!106796 () ListLongMap!3009)

(declare-fun v!520 () V!6737)

(declare-fun zeroValue!615 () V!6737)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6737)

(declare-fun getCurrentListMapNoExtraKeys!461 (array!9837 array!9839 (_ BitVec 32) (_ BitVec 32) V!6737 V!6737 (_ BitVec 32) Int) ListLongMap!3009)

(assert (=> b!208495 (= lt!106796 (getCurrentListMapNoExtraKeys!461 _keys!825 (array!9840 (store (arr!4670 _values!649) i!601 (ValueCellFull!2315 v!520)) (size!4995 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106797 () ListLongMap!3009)

(assert (=> b!208495 (= lt!106797 (getCurrentListMapNoExtraKeys!461 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208496 () Bool)

(declare-fun e!135973 () Bool)

(declare-fun e!135970 () Bool)

(assert (=> b!208496 (= e!135973 (and e!135970 mapRes!9044))))

(declare-fun condMapEmpty!9044 () Bool)

(declare-fun mapDefault!9044 () ValueCell!2315)

