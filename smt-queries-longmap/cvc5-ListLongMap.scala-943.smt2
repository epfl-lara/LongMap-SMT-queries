; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20754 () Bool)

(assert start!20754)

(declare-fun b_free!5413 () Bool)

(declare-fun b_next!5413 () Bool)

(assert (=> start!20754 (= b_free!5413 (not b_next!5413))))

(declare-fun tp!19271 () Bool)

(declare-fun b_and!12159 () Bool)

(assert (=> start!20754 (= tp!19271 b_and!12159)))

(declare-fun b!207806 () Bool)

(declare-fun res!100967 () Bool)

(declare-fun e!135612 () Bool)

(assert (=> b!207806 (=> (not res!100967) (not e!135612))))

(declare-datatypes ((array!9743 0))(
  ( (array!9744 (arr!4622 (Array (_ BitVec 32) (_ BitVec 64))) (size!4947 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9743)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9743 (_ BitVec 32)) Bool)

(assert (=> b!207806 (= res!100967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207807 () Bool)

(assert (=> b!207807 (= e!135612 (not true))))

(declare-datatypes ((V!6673 0))(
  ( (V!6674 (val!2679 Int)) )
))
(declare-datatypes ((ValueCell!2291 0))(
  ( (ValueCellFull!2291 (v!4649 V!6673)) (EmptyCell!2291) )
))
(declare-datatypes ((array!9745 0))(
  ( (array!9746 (arr!4623 (Array (_ BitVec 32) ValueCell!2291)) (size!4948 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9745)

(declare-datatypes ((tuple2!4064 0))(
  ( (tuple2!4065 (_1!2043 (_ BitVec 64)) (_2!2043 V!6673)) )
))
(declare-datatypes ((List!2957 0))(
  ( (Nil!2954) (Cons!2953 (h!3595 tuple2!4064) (t!7888 List!2957)) )
))
(declare-datatypes ((ListLongMap!2977 0))(
  ( (ListLongMap!2978 (toList!1504 List!2957)) )
))
(declare-fun lt!106542 () ListLongMap!2977)

(declare-fun zeroValue!615 () V!6673)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6673)

(declare-fun getCurrentListMap!1071 (array!9743 array!9745 (_ BitVec 32) (_ BitVec 32) V!6673 V!6673 (_ BitVec 32) Int) ListLongMap!2977)

(assert (=> b!207807 (= lt!106542 (getCurrentListMap!1071 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106538 () ListLongMap!2977)

(declare-fun lt!106537 () array!9745)

(assert (=> b!207807 (= lt!106538 (getCurrentListMap!1071 _keys!825 lt!106537 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106541 () ListLongMap!2977)

(declare-fun lt!106539 () ListLongMap!2977)

(assert (=> b!207807 (and (= lt!106541 lt!106539) (= lt!106539 lt!106541))))

(declare-fun v!520 () V!6673)

(declare-fun lt!106540 () ListLongMap!2977)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!531 (ListLongMap!2977 tuple2!4064) ListLongMap!2977)

(assert (=> b!207807 (= lt!106539 (+!531 lt!106540 (tuple2!4065 k!843 v!520)))))

(declare-datatypes ((Unit!6350 0))(
  ( (Unit!6351) )
))
(declare-fun lt!106536 () Unit!6350)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!184 (array!9743 array!9745 (_ BitVec 32) (_ BitVec 32) V!6673 V!6673 (_ BitVec 32) (_ BitVec 64) V!6673 (_ BitVec 32) Int) Unit!6350)

(assert (=> b!207807 (= lt!106536 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!184 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!445 (array!9743 array!9745 (_ BitVec 32) (_ BitVec 32) V!6673 V!6673 (_ BitVec 32) Int) ListLongMap!2977)

(assert (=> b!207807 (= lt!106541 (getCurrentListMapNoExtraKeys!445 _keys!825 lt!106537 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207807 (= lt!106537 (array!9746 (store (arr!4623 _values!649) i!601 (ValueCellFull!2291 v!520)) (size!4948 _values!649)))))

(assert (=> b!207807 (= lt!106540 (getCurrentListMapNoExtraKeys!445 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207808 () Bool)

(declare-fun e!135610 () Bool)

(declare-fun tp_is_empty!5269 () Bool)

(assert (=> b!207808 (= e!135610 tp_is_empty!5269)))

(declare-fun b!207809 () Bool)

(declare-fun e!135611 () Bool)

(declare-fun e!135614 () Bool)

(declare-fun mapRes!8972 () Bool)

(assert (=> b!207809 (= e!135611 (and e!135614 mapRes!8972))))

(declare-fun condMapEmpty!8972 () Bool)

(declare-fun mapDefault!8972 () ValueCell!2291)

